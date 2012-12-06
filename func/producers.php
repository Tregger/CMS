<?php
    $producers= new producers();
    if(isset($_GET['option'])){
    $action=$_GET['option'];
    }else{
        $action="view";
    }
 
    switch($action){
        case "view":
            $prod=$producers->get_all_producers();
            $smarty->assign('producers', $prod);
            
        break;
        case "add":
             $type='add';
            $rec="";
              $smarty->assign('type', $type);
               $smarty->assign('rec', $rec);
            if(isset($_POST['record'])){
                $producers->add_record($_POST['record']);  
            }else{
                $smarty->display('add_producers.tpl');
            }
        break;
        case "delete":
            $producers->delete_record($_GET['id']);  
        break;
        case "edit":
   
        if(isset($_POST['record'])){
           
                $producers->edit_record($_POST['record']);
                  
            }else{
                         $record=$producers->get_record_by_id($_GET['id']);
            $type='edit';
            $smarty->assign('rec', $record);
            $smarty->assign('type', $type);
                $smarty->display('add_producers.tpl');
            }
         break;
        default :
            $prod=$producers->get_all_producers();
            $smarty->assign('producers', $prod);
    }
?>
