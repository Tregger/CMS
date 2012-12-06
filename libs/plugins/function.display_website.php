<?php

function smarty_function_display_website($params, &$smarty)
{
 
    $id=$params['id'];
    $users=new members;
   $username= $users->get_user_by_id($id);
   if(isset($username['website'])){
       if(strpos($username['website'], "http:")>0){
    echo '<a href="'.$username['website'].'">Website</a>';
       }else{
               echo '<a href="http://'.$username['website'].'">Website</a>';
       }
   }

}



?>