<?php

function smarty_function_display_mailto_merchant($params, &$smarty)
{
 
    $id=$params['id'];
    $users=new members;
   $username= $users->get_user_by_id($id);
   
   echo "mailto:".$username['email'];

}



?>