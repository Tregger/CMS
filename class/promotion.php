<?php


class promotion extends abstract_model{
     public function __construct() {
         $this->table='promotion';
          $this->primary_key=$this->get_primary_key();
    }    
}

?>
