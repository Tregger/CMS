<?php

function smarty_function_display_cities($params, &$smarty)
{
    $sql="select name from cities group by name";
    $categories=fetch_all($sql);
    echo '<ul class="dropdown_category2">';
    foreach($categories as $category){
        if(isset($_GET)){
        
            echo '<li><a href="/index.php?city='.$category['name'].'">'.$category['name'].'</a></li>';
    
        }else{
              echo '<li><a href="/index.php?page=coupons&action=filter_by_category&id='.$category['name'].'">'.$category['name'].'</a></li>';
        }
    }
    echo "</ul>";
}




?>