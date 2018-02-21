<?php

namespace MyBooks\DAO;
use MyBooks\Domain\Participe;

class ParticipeDAO extends DAO
{
    public function save(Participe $participe){
        $data = array(
            'id_user'=> $participe->getId_user(),
            'id_seance' => $participe->getId_seance(),
            'value' => $participe->getValue(),
        );
        
        $this->getDb()->insert('t_participe', $data);
    }
    
    public function findChoice($id_user, $id_seance){
        $sql = 'select value from t_participe where id_user = ? AND id_seance = ?';
        
        return $this->getDb()->fetchAssoc($sql, array($id_user, $id_seance));
    }
    
    public function findAllUserBySeance($seance_id){
        $sql = "select id_user from t_participe where id_seance = ".$seance_id." AND value = 'y'";
        return $this->getDb()->fetchAll($sql);
    }
    
    protected function buildDomainObject(array $row){
        // rien faire
    }
}
