<?php

function smarty_function_display_count_subscribbers($params, &$smarty)
{
 
    $id=$params['deal'];
   $sql="select * from claims where deal_id=".$id;
   $count=count(fetch_all($sql));
   echo $count;

}



?>