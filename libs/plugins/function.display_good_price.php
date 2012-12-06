<?php

function smarty_function_display_good_price($params, &$smarty)
{
    $id=$params['id'];
    $sql="select price from catalog where id=".$id;
    if(isset($id)){
        $item=fetch_all($sql);

        echo $item[1]['price'];
    }
}
?>