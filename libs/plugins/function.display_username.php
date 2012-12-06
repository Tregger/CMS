<?php

function smarty_function_display_username($params, &$smarty)
{
    require_once $_SERVER['DOCUMENT_ROOT'].'/class/members.php';
    $id=$params['id'];
    $users=new members;
   $username= $users->get_user_by_id($id);
   
   echo $username['username'];

}



?>