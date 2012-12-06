<?php

class abstract_model {
    public $table;
    public $primary_key;
    
    /*
     * variables: 
     *      $data - assoc massive for the add to data base -> keys = table fieldname , values= values
     *      $data['callback'] - url for the change location
     *      $data['after_insert'] - the text which display after add or this may be any jscript
     *  */
    public function add_record($data){
       $value="";
       $columns="";
        foreach($data as $k=>$v){
            if($k!='callback' && $k!='after_insert'){
                $values.="'".mysql_real_escape_string($v)."', ";
                $columns.="`".$k."`, ";
            }
        }  
        $values=substr($values, 0, strlen($values)-2);
         $columns=substr($columns, 0, strlen($columns)-2);
        $sql='insert into '.$this->table.'('.htmlspecialchars($columns).') values ('.$values.')';
   
        if(!mysql_query($sql)){
            die(mysql_error());
        }else{
            if(isset($data['after_insert']))
                 echo $data['after_insert'];
            if(isset($data['callback']))
                header('Location: '.$data['callback']);
        }
    }
    
    public function edit_record($data){
       // $this->primary_key=$this->get_primary_key();
       
           $value="";
       $columns="";
       $where= $data['where'];
        foreach($data as $k=>$v){
            if($k!='callback' && $k!='after_insert' && $k!='where'){
                $values.="`".$k."`='".mysql_real_escape_string($v)."', ";
              
            }
        }  
        $values=substr($values, 0, strlen($values)-2);
        
        $sql="update ".$this->table." SET ".$values." where ".$this->primary_key."=".$data['where'];

        if(!mysql_query($sql)){
            die(mysql_error());
        }else{
            if(isset($data['after_insert']))
                 echo $data['after_insert'];
            if(isset($data['callback']))
                header('Location: '.$data['callback']);
        }
    }
    
    public function delete_record($id){
        $sql="delete from ".$this->table." where ".$this->primary_key."=".$id;
        if(!mysql_query($sql)){
            die(mysql_error());
        }else{
            echo "<script> window.location.reload();</script>";
        }
    }
    
      public function get_record_by_id($id){
       // $this->primary_key=$this->get_primary_key();
        $sql="select * from ".$this->table." where ".$this->primary_key."=".$id;
        $result=  fetch_all($sql);
        return $result[1];
    }
    
    
    
    /* array $criteria - array with parameters (field => value ) for where section of query */
    
    public function display_all($criteria=NULL){
        if(isset($criteria)){
            $where=" where";
            foreach($criteria as $f=>$v){
                $where.=" `".$f."`='".$v."' and";
            }
            $where=substr($where, 0, -3);
        }else{
            $where="";
        }
        $sql="select * from ".$this->table.$where;

        $result=  fetch_all($sql);
        return $result;
    }
    
    public function get_primary_key(){
        $sql="SHOW KEYS FROM ".$this->table." WHERE Key_name = 'PRIMARY'";
        $key=fetch_all($sql);
        return $key[1]["Column_name"];
    }
    
}

?>
