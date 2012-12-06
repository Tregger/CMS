<?php
    $messages= new messages;
    if(!isset($_GET['option'])){
        $messages=$messages->get_all_send_messages();
        $smarty->assign('messages', $messages);
    }else{
        $action=$_GET['option'];
        switch($action){
            case "send_messages":
                $smarty->display('send_messages.tpl');
            break;
            case "send":
                $messages->send($_POST['message']);
               
            break;
        }
        
    }
?>
