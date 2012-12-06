<?php

function index_action($smarty){
    $sql="select * from coupons where (title like '%".$_POST['text']."%' or `desc` like '%".$_POST['text']."') and status='active' ";
    $items=fetch_all($sql);
    $smarty->assign('items', $items);
    $smarty->display('home.tpl');
    
}
?>
