<?php

namespace Bagshare\DAO;

use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Core\Exception\UsernameNotFoundException;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Bagshare\Domain\User;

class UserDAO extends DAO implements UserProviderInterface
{
    /**
    * Returns a list of all users, sorted by role and name.
    *
    * @return array A list of all users.
    */
    public function findAll(){
        $sql = 'select * from t_user order by usr_role, usr_name';
        $result = $this->getDb()->fetchAll($sql);
        
        // convert query result to an array of domain object
        $entities = array();
        foreach ($result as $row){
            $id = $row['usr_id'];
            $entities[$id] = $this->buildDomainObject($row);
        }
        
        return $entities;
    }
    
    /**
    * Return the user matching th supplied id.
    *
    * @param int $id The user id.
    * @return \MyBooks\Domain\User|throws exception if no matching user is found
    */
    public function find($id){
        $sql = 'select * from t_user where usr_id = ?';
        $row = $this->getDb()->fetchAssoc($sql, array($id));
        
        if(empty($row)){
            throw new \Exception(sprintf('No user matching id : "%d ."', $id));
        }
        
        return $this->buildDomainObject($row);
    }
    
    /**
    * {@inheritDoc}
    */
    public function loadUserByUsername($username){
        $sql = 'select * from t_user where usr_name = ?';
        $row = $this->getDb()->fetchAssoc($sql, array($username));
        
        if(empty($row)){
            throw new UsernameNotFoundException(sprintf('User "%s" not found.', $username));
        }
        
        return $this->buildDomainObject($row);
    }
    
    /**
    * {@inheritDoc}
    */
    public function refreshUser(UserInterface $user){
        $class = get_class($user);
        if(!$this->supportsClass($class)){
            throw new UnsupportedUserException(sprintf('Instances of "%s" are not supported.', $class));
        }
        
        return $this->loadUserByUsername($user->getUsername());
    }
    
    /**
    * {@inheritDoc}
    */
    public function supportsClass($class){
        return 'Bagshare\Domain\User' === $class;
    }
    
    /**
    * Saves a user into the database.
    *
    * @param \MicroCMS\Domain\User $user The user to save
    */
    public function save(User $user){
        $userData = array(
            'usr_name' => $user->getUsername(),
            'usr_mail' => $user->getUsermail(),
            'usr_firstName' => $user->getUserFirstName(),
            'usr_phone' => $user->getUserPhone(),
            'usr_salt' => $user->getSalt(),
            'usr_password' => $user->getPassword(),
            'usr_role' => $user->getRole(),
        );
        
        if ($user->getId()){
            // The user has arleady been saved : update it
            $this->getDb()->update('t_user', $userData, array('usr_id' => $user->getId()));
        }
        else {
            // The user has never been saved : insert it
            $this->getDb()->insert('t_user', $userData);
            // Get the id of the newly inserted user and set it  on the entity
            $id = $this->getDb()->lastInsertId();
            $user->setId($id);
        }
    }
    
    /**
    * Removes a user from the database.
    *
    * @param int $id The user id.
    */
    public function delete($id){
        // Delete the user
        $this->getDb()->delete('t_user', array('usr_id' => $id));
    }
    
    /**
    * Build User object from a DB $row
    * 
    * @param array $row The db row containing user data.
    * @return \MyBooks\Domain\User 
    */
    protected function buildDomainObject(array $row){
        $user = new User($row);
        $user->setId($row['usr_id']);
        $user->setUsername($row['usr_name']);
        $user->setUsermail($row['usr_mail']);
        $user->setUserFirstName($row['usr_firstName']);
        $user->setUserPhone($row['usr_phone']);
        $user->setPassword($row['usr_password']);
        $user->setSalt($row['usr_salt']);
        $user->setRole($row['usr_role']);
        
        return $user;
    }
}