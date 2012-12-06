<?php

function index_action($smarty, $sel){
    if($sel['url']=='merchant-intro'){
        $smarty->display('merchant_promo.tpl');
    }else{
        $smarty->assign('text',$sel['fdescr']);
        $smarty->assign('item',$sel);
        $smarty->display('text.tpl');
    }
}
?>
