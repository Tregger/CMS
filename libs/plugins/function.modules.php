<?php

/*
 * Modules
 */
function get_array_modules(){
        $modul=array();
        //$modul['catalog']='catalog';
        $modul['pages']='text';
        $modul['feedback']='feedback';
        $modul['billing']='billing';
        $modul['login']='login';
        $modul['register']='register';
        //$modul['cart']='cart';
        $modul['articles']='articles';
        $modul['coupons']='coupons';
        //$modul['ratings']='ratings';
        //$modul['auction']='auction';
        $modul['payments']='payments';
	$modul['search']='search';
        $modul['myaccount']='myaccount';
        $modul['merchant_intro']='merchant_intro';
    return $modul;
}
    
    function smarty_function_modules($params, &$smarty){
       $modul=  get_array_modules();
       $sel=$params['sel'];
        $display="";
 
        foreach ($modul as $k => $v){
           
            if($k == $sel){
                $display .= "<option value='".$k."' selected>".$v."</option>";
            }else{
                $display .= "<option value='".$k."' >".$v."</option>";
            }
        }
        return $display;
    }
    
  
?>
