<?php
    $coupons= new coupons;
    if(!isset($_GET['option'])){
        $records=$coupons->display_all();
        $smarty->assign('coupons', $records);
    }else{
        $action=$_GET['option'];
        switch($action){
            case "add": 
                if(isset($_POST['add'])){
                    $coupons->add_record($POST['record']);
                }else{
                    $smarty->display('add_coupon.tpl');
                }
            break;
            case "delete":
                $coupons->delete_record($_GET['id']);
            break;
        case "edit":
            $coupon=$coupons->get_record_by_id($_GET['id']);
            $coupon['imgs']=  json_decode($coupon['imgs'], 'ASSOC');
            $smarty->assign('coupon', $coupon);
              if(isset($_POST['add'])){
                    $coupons->edit_record($POST['record']);
                }else{
                    $smarty->display('add_coupon.tpl');
                }
        break;
        }
        
    }
?>
