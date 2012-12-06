<?php

function smarty_function_display_followers_count($params, &$smarty)
{
    $url = "http://twitter.com/users/show/dealhoster";
    $response = file_get_contents ( $url );
    $t_profile = new SimpleXMLElement ( $response );
    $count = $t_profile->followers_count;

  echo $count;
}




?>