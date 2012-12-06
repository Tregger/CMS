<?php

class login_users extends abstract_model{
       public function __construct() {
         $this->table='login_users';
          $this->primary_key=$this->get_primary_key();
    }   
}

?>
