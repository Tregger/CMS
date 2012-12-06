<?php

function smarty_function_city_options($params, &$smarty)
{
    $sql="select * from countries";
    $points=fetch_all($sql);
      echo "<option value='0'>Select your city</option>";
    foreach($points as $point){
        echo "<option value='".$point['iso']."'>".$point['name']."</option>";
    }
}
?>