<?php

function smarty_function_display_businessname($params, &$smarty)
{
    require_once $_SERVER['DOCUMENT_ROOT'].'/class/members.php';
    $id=$params['id'];
    if($id){
    $users=new members;
   $username= $users->get_user_by_id($id);
        if(isset($params['type'])){
            echo mysql_real_escape_string($username['businessname']);
        }else{
        echo $username['businessname'];
        }
    }
}



?>