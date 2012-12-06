<?php

function smarty_function_display_comments_count($params, &$smarty)
{
    $deal = $params["deal"];
    $sql="select * from comments where deal_id=".$deal;
    $comments_count=count(fetch_all($sql));


    
        echo $comments_count;

}




?>