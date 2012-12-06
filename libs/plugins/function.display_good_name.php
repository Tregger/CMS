<?php

function smarty_function_display_good_name($params, &$smarty)
{
    $id=$params['id'];
    $sql="select name from catalog where id=".$id;
    if(isset($id)){
        $item=fetch_all($sql);

        echo $item[1]['name'];
    }
}
?>