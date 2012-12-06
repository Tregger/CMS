<?php

function smarty_function_display_categories_menu($params, &$smarty)
{
    require_once $_SERVER['DOCUMENT_ROOT'].'/configs/dbconnect.php';
    $sql="select * from coupon_categories order by ord";
    $categories=fetch_all($sql);
    echo '<ul class="dropdown_category">';
    foreach($categories as $category){
        if(isset($_GET['lookup'])){
            echo '<li><a href="/deals/filter_by_category/'.$category['id_category'].'/lookup/1/">'.$category['name'].'</a></li>';
        }else{
            echo '<li><a href="/deals/filter_by_category/'.$category['id_category'].'/">'.$category['name'].'</a></li>';
        }
        
    }
    echo "</ul>";
}




?>