<?php

namespace MyBooks\DAO;
use MyBooks\Domain\Seance;

class SeanceDAO extends DAO
{
    public function save(Seance $seance){
        $data = array(
            'title_seance'=>$seance->getTitle_seance(),
            'date_seance'=>$seance->getDate_seance(),
            'place_seance'=>$seance->getPlace_seance()
        );
        
        $this->getDb()->insert('t_seance', $data);
    }
    public function findLastSeance(){
        $sql = "select * from t_seance ORDER BY id_seance DESC LIMIT 1";
        $row = $this->getDb()->fetchAssoc($sql);
        $seance = new Seance($row);
        return $seance;
    }
    public function findAll(){
        $sql = "select * from t_seance";
        $data = $this->getDb()->fetchAll($sql);
        $seances = array();
        foreach($data as $row){
            $id = $row['id_seance'];
            $seance[$id] = new Seance($row);
        }
        
        return $seances; 
    }
    protected function buildDomainObject(array $row){
        // rien faire
    }
}