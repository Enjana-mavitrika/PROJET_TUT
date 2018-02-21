<?php

namespace MyBooks\Domain;

class Seance
{
    private $id_seance;
    private $title_seance;
    private $date_seance;
    private $place_seance;
    
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
    public function getId_seance(){
        return $this->id_seance;
    }
    public function getTitle_seance(){
        return $this->title_seance;
    }
    public function getDate_seance(){
        $date = new \DateTime($this->date_seance);
        return $date->format('\L\e d/m/Y à H\hi\m\i\n.');
    }
    public function getPlace_seance(){
        return $this->place_seance;
    }
    
    // setters
    public function setId_seance($id_seance){
        $this->id_seance = $id_seance;
    }
    public function setTitle_seance($title_seance){
        $this->title_seance = $title_seance;
    }
    public function setDate_seance($date_seance){
        $this->date_seance = $date_seance;
    }
    public function setPlace_seance($place_seance){
        $this->place_seance = $place_seance;
    }
}