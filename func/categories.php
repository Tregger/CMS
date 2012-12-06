<?php
    $categories= new categories;
    if(!isset($_GET['option'])){
        $records=$categories->display_all();
        $smarty->assign('categories', $records);
    }else{
        $action=$_GET['option'];
        switch($action){
            case "add": 
                if(isset($_POST['add'])){
                    $categories->add_record($_POST['record']);
                }else{
                    $smarty->display('add_categories.tpl');
                }
            break;
            case "delete":
                $categories->delete_record($_GET['id']);
                echo "widow.location.reload()";
            break;
            case "edit":
           
        
            
                if(isset($_POST['add'])){
                    $categories->edit_record($_POST['record']);
                }else{
                         $record=$categories->get_record_by_id($_GET['id']);
                             $smarty->assign('record', $record);
                    $smarty->display('add_categories.tpl');
                }
            break;
        }
        
    }
?>
