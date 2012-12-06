<?php

class members extends abstract_model{
    public function __construct() {
         $this->table='login_users';
          $this->primary_key=$this->get_primary_key();
    }  
    public function get_user_by_id($id){
        $sql="select * from login_users where userid=".$id." limit 1";
        $results= fetch_all($sql);
        return isset($results) ? $results[1] : "User not found";
        
    }
    
   public function get_user_count($id){
        $sql="select username from login_users ";
        $results= fetch_all($sql);
        return count($results);
   }
    

    function getOnlineUsers()
    {

     $sql="select count(username) from login_users where now()-last_login<1440 ";
      $results= fetch_all($sql);
        return $results[1]['count(username)'];
    }

   
   
}

?>
