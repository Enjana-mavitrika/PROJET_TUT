<?php

namespace MyBooks\Domain;

class Participe
{
    private $id_user;
    private $id_seance;
    private $value;
    
    // constructor
    public function __construct(array $data){
        $this->hydrate($data);
    }
    
    // hydrator
    public function hydrate(array $data){
        foreach($data as $key => $value){
            $method = 'set'.ucfirst($key);
            if (method_exists($this, $method)){
                $this->$method($value);
            }
        }
    }
    
    // setters
    public function setId_user($idUser){
        $this->id_user = $idUser;
    }
    public function setId_seance($idSeance){
        $this->id_seance = $idSeance;
    }
    public function setValue($value){
        $this->value = $value;
    }
    
    // getters
    public function getId_user(){
        return $this->id_user;
    }
    public function getId_seance(){
        return $this->id_seance;
    }
    public function getValue(){
        return $this->value;
    }
}