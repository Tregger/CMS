<?php
    $users_c= new login_users;
    if(!isset($_GET['sort']) || $_GET['sort']=='2'){
        $users=$users_c->display_all();
    }else{
        $users=$users_c->display_all(array(
            'user_level'=>$_GET['sort'],
        ));
            
    }
    $smarty->assign('users', $users);
   
    if(isset($_GET['option'])){
          switch ($_GET['option']) {
            case 'delete':
                $users_c->delete_record($_GET['id']);
            break;
            case 'edit':
                
                if(isset($_POST['method'])){
                    
                    $users_c->edit_record($_POST['record']);
                }else{
                    $user=$users_c->get_record_by_id($_GET['id']);
                    $smarty->assign('user', $user);
                    $smarty->display('user_edit.tpl');
                }
            break;
          
                case 'add':
                
                if(isset($_POST['method'])){
                    
                    $users_c->add_record($_POST['record']);
                }else{
                   
             
                    $smarty->display('user_edit.tpl');
                }
            break;
          
    }
    }
?>
