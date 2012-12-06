<?php

function smarty_function_display_lat_lng($params, &$smarty)
{
$address=$params['city'];
  $object=json_decode(file_get_contents('http://maps.google.com/maps/geo?q='.urlencode($address)), 'ASSOC');
    $lat=$object["Placemark"][0]["Point"]["coordinates"][0];
     $long=$object["Placemark"][0]["Point"]["coordinates"][1];
     if(isset($params['add']) && $params['add']=='script'){

        echo 'lat:'.$long.', lng:'.$lat;
     }else{
        echo $long.",".$lat;
     }
}
?>