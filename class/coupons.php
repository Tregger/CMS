<?php


class coupons extends abstract_model{
    public function __construct() {
         $this->table='coupons';
          $this->primary_key=$this->get_primary_key();
    }          
    

}

?>
