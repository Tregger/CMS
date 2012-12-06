<?php

function smarty_function_display_points($params, &$smarty)
{
    $sql="select * from catalog where folder=1 and id_p=4";
    $points=fetch_all($sql);
    $counts=count($points);
    (int)$i=0;
    echo "<ul>";
    foreach($points as $point){
        $i++;
        echo '<li><a href="/magazin/'.$point["id"].'/">'.$point["name"].'</a></li>';
        
        if($i%5==0 ){
            echo "</ul><ul>";
        }
    }
    echo "</ul>";
}
?>