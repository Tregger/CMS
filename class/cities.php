<?php

class cities extends abstract_model{
    
    public function __construct(){
        $this->table='cities';
        $this->primary_key=$this->get_primary_key();
    }
    
  
}

?>
