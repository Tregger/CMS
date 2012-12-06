<?php

class options {
    public function get_all_options(){
        $sql="select * from options";
        $options= fetch_all($sql);
        return $options;
    }
    public function update_option($id, $value){
        
        $sql="update options set value='".$value."' where id=".$id;
        if(!mysql_query($sql)){
            die(mysql_error());
            
            }
    }
    
    public function register_globals(&$smarty){
         $sql="select * from options";
        $options= fetch_all($sql);
        foreach($options as $option){
            $smarty->assign($option['var_name'], $option['value']);
        }
        
        $sql="select * from merchant_intro";
        $options= mysql_fetch_assoc(mysql_query($sql));
        
        foreach($options as $k=>$option){
            $smarty->assign($k, $option);
        }
        
    }
}

?>
