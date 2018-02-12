<?php

namespace Bagshare\Domain;

use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\Encoder\BCryptPasswordEncoder;

class User implements UserInterface
{
    /**
    * User id.
    *
    * @var int
    */
    private $id;
    
    /**
    * User name.
    *
    * @var string
    */
    private $username;
    
    /**
    * User first name
    *
    * @var string
    */
    private $userFirstName;
    
    /**
    * User phone number
    *
    * @var string
    */
    private $userPhone;
    
    /**
    * User mail.
    *
    * @var string
    */
    private $usermail;
    
    /**
    * User password.
    *
    * @var string
    */
    private $password;
    
    /**
    * Salt that was originally used to encode the password.
    *
    * @var string
    */
    private $salt;
    
    /**
    * User role.
    * Value : ROLE_USER or ROLE_ADMIN
    *
    * @var string
    */
    private $role;
    
    private $errors = array();
    
    /**
    * constructor 
    */
    public function __construct(array $data){
        $this->hydrate($data);
    }
    
    /**
    * hydrator
    */
    private function hydrate(array $data){
        foreach($data as $key => $value){
            $method = 'set'.ucfirst($key);
            if (method_exists($this, $method)){
                $this->$method($value);
            }
        }
    }
    
    /**
    * getters
    */
    public function getId(){
        return $this->id;
    }
    
    /**
    * @inheritDoc
    */
    public function getUsername(){
        return $this->username;
    }
    
    /**
    * @inheritDoc
    */
    public function getUserFirstName(){
        return $this->userFirstName;
    }
    
    /**
    * @inheritDoc
    */
    public function getUserPhone(){
        return $this->userPhone;
    }
    
    /**
    * @inheritDoc
    */
    public function getPassword(){
        return $this->password;
    }
    
    /**
    * @inheritDoc
    */
    public function getUsermail(){
        return $this->usermail;
    }
    
    /**
    * @inheritDoc
    */
    public function getSalt(){
        return $this->salt;
    }
    
    public function getRole(){
        return $this->role;
    }
    
    /**
    * @inheritDoc
    */
    public function getRoles(){
        return array($this->getRole());
    }
    
    public function getErrors(){
        return $this->errors;
    }
    
    /**
    * setters
    */
    public function setId($id){
        $this->id = $id;
    }
    
    public function setUsermail($usermail){
        // check if the mail is valid
        if (preg_match('#^[a-zA-Z0-9.-]{3,}@[a-zA-Z0-9.-]{2,}.[a-z]{2,4}$#i', $usermail)){
            $this->usermail = $usermail;
        }
        else{
            return false;
        }
    }
    
    public function setUserPhone($userPhone){
        // check if the phone number is valid
        if (preg_match('#^0(6|7|4)[0-9]{8}$#', $userPhone) || preg_match('#^0(20|30|32|33|34)[0-9]{7}$#i', $userPhone)){
            $this->userPhone = $userPhone;
        }
        else{
            return false;
        }
        
    }
    
    public function setUserFirstName($userFirstName){
        $nameLength = strlen($userFirstName);
        if ($nameLength < 2 || $nameLength > 15){
            return false;
        }
        $this->userFirstName = $userFirstName;
    }
    
    public function setUsername($username){
        $this->username = $username;
    }
    
    public function setPassword($password){
        $this->password = $password;
    }
    
    public function setSalt($salt){
        $this->salt = $salt;
    }
    
    public function setRole($role){
        $this->role = $role;
    }
    
    public function signIn(array $post, $password_name, $role){
        $this->hydrate($post);
        if ($post[$password_name] !== $this->password)
            $this->errors = "Les mots de passes ne correspondent pas.";
        if (!empty($this->userName) && empty($this->userPhone) && empty($this->userMail) && empty($this->userFirstName) && empty($this->password))
            $this->errors = "Veillez remplir correctement le formulaire";
        
        /* crypt password */
        $this->salt = substr(md5(time()), 0, 23);
        $enc = new BCryptPasswordEncoder(10);
        $this->password = $enc->encodePassword($this->password, $this->salt);
        
        $this->role = $role; /*set role */
        
        return $this->errors;
    }
    
    /**
    * @inheritDoc
    */
    public function eraseCredentials(){
        //Nothing to do here
    }
}