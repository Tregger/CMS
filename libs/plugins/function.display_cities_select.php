<?php

function smarty_function_display_cities_select($params, &$smarty)
{
    require_once $_SERVER['DOCUMENT_ROOT'].'/configs/dbconnect.php';
    $sql="select name from cities group by name";
    $categories=fetch_all($sql);
    echo '<select name="record[city]" id="city_input" required>';
    foreach($categories as $category){
      
        
            echo '<option value="'.$category['name'].'">'.$category['name'].'</option>';
    
      
    }
    echo "</select>";
}




?>