<?php

class categories extends abstract_model{
    
    public function __construct(){
        $this->table='coupon_categories';
        $this->primary_key=$this->get_primary_key();
    }
    
  
}

?>
