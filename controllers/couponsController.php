<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/class/coupons.php';

function mydeals_action($smarty){
    if(isset($_GET['view'])){
        $status=$_GET['view'];
    }else{
        $status='active';
    }
    $coupons= new coupons;
    $items=$coupons->display_all(array(
        'status'=>$status,
        'merchant'=>$_SESSION['userid']
    ));
//    if(isset($items) && !empty($items)){
//        $items['imgs']=json_decode($items['imgs'], 'ASSOC');
//    }
    $smarty->assign('view', $status);
    $smarty->assign('items', $items);
    $smarty->display('home.tpl');
}

function post_deal_action($smarty){
    if(isset($_SESSION['used_coupon']))
    session_unregister('used_coupon');
    $smarty->display('add_coupon.tpl');
}

function edit_action($smarty){
    $coupons= new coupons;
    $coupon=$coupons->get_record_by_id($_GET['id']);
    $coupon['imgs']=json_decode($coupon['imgs'], 'ASSOC');
    $smarty->assign('coupon', $coupon);
    $smarty->display('add_coupon.tpl');
}


function display_coupon_action($smarty){
    $coupons= new coupons;
    $coupon=$coupons->display_all(array('url'=>$_GET['id']));
    $coupon=$coupon[1];
    $coupon['imgs']=json_decode($coupon['imgs'], 'ASSOC');
    if($coupon['city']!='Select City...'){
     $search_on_map=$coupon['city']." ".$coupon['street_address'];
    }else{
     $search_on_map=$coupon['state']." ".$coupon['street_address'];   
    }
    $search_on_map=ereg_replace(" ","+",$search_on_map);
    $smarty->assign('search_on_map', $search_on_map);
    $smarty->assign('coupon', $coupon);
    $smarty->display('inner_coupon.tpl');
}

function filter_by_category_action($smarty){
     $coupons= new coupons;
      $items=$coupons->display_all(array(
        'status'=>'active', 
        'id_category'=>$_GET['id']
    ));
         $smarty->assign('view', $status);
    $smarty->assign('items', $items);
     $smarty->display('home.tpl');
}

function filter_by_popular_action($smarty){
         $coupons= new coupons;
      $items=$coupons->display_all(array(
        'status'=>'active'
    ));
         $smarty->assign('view', $status);
    $smarty->assign('items', $items);
     $smarty->display('home.tpl');
}

?>
