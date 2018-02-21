<?php

namespace MyBooks\Domain;

class Actualite
{
    private $id_actu;
    private $id_article;
    
    // constructor
    public function __construct($data){
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
    
    // getters
    public function getId_actu(){
        return $this->id_actu
    }
    public function getId_article(){
        return $this->id_article;
    }
    
    // setters
    public function setId_actu($id){
        $this->id_actu = $id;
    }
    public function setId_article($id){
        $this->id_article = $id;
    }
}