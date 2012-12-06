<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/class/members.php';
if(!isset($_SESSION['userid'])){
    header('location: http://'.$_SERVER['SERVER_NAME']);
}
function index_action($smarty){
    $members= new members;
    $member=$members->get_user_by_id($_SESSION['userid']);
    $smarty->assign('user', $member);
    $smarty->display('myaccount.tpl');
}


function email_prefence_action($smarty){
       $members= new members;
    $member=$members->get_user_by_id($_SESSION['userid']);
    $smarty->assign('user', $member);
    $smarty->display('myaccount_email_pref.tpl');
}

function change_account_action($smarty){
    $members= new members;
    if(isset($_POST['record'])){
        $data=$_POST['record'];
        if(isset($data['pass']) && !empty($data['pass'])){
            if($data['pass']==$data['pass2']){
                $data['password']=md5($data['pass']);
                unset($data['pass']);
                unset($data['pass2']);
            }else{
                
                $member=$members->get_user_by_id($_SESSION['userid']);
                $smarty->assign('user', $member);
                echo "Passwords must be equal";
                $smarty->display('myaccount_email_pref.tpl');
                exit();
            }
        }else{
            unset($data['pass']);
            unset($data['pass2']);
        }
        if(isset($_FILES['record']) && !empty($_FILES['record']) && $_FILES['record']['name']['avatar']!=""){
          $upload_dir=$_SERVER['DOCUMENT_ROOT']."/uploads";  
          move_uploaded_file($_FILES['record']['tmp_name']['avatar'], $upload_dir."/" . time().$_FILES['record']['name']['avatar']);
        
          $data['avatar']="/uploads/" . time().$_FILES['record']['name']['avatar'];
        }
          $members->edit_record($data);
          header('Location: /index.php?page=myaccount');
         
        
    }else{
        
        header('Location: /index.php?page=myaccount');
    }
}


?>
