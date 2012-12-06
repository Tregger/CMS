<?php

function smarty_function_display_category_name($params, &$smarty)
{
    $id=$params['id'];
    $sql="select name from coupon_categories group by name";
    $categories=fetch_all($sql);
    if(isset($categories) && !empty($categories)){
        echo $categories[1]['name'];
    }else{
        echo "No category";
    }
}




?>