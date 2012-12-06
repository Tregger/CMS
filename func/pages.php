<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
    $pages= new pages;
    $pg=$pages->get_all_pages();
    $smarty->assign('pages', $pg);
    
  //   $types=get_html_modules();
    $types="";
     $smarty->assign('types', $types);
     if(isset($_GET['option'])){
          switch ($_GET['option']) {
            case 'delete':
                $pages->delete_record_by_id($_GET['id']);
            break;
            case 'add':
                
                 
                if(isset($_POST['method']) && $_POST['method']=='save'){
                    $pages->add_page($_POST['page']);
                }else{
                  $smarty->display('pages_add.tpl');
                }
            break;
            case 'edit':
                
            if(isset($_POST['method']) && $_POST['method']=='save'){
                    $pages->edit_page($_POST['page']);
                }else{
                  $page=$pages->get_page_by_id($_GET['id']);
                  $smarty->assign('page', $page);
                  $smarty->display('pages_edit.tpl');
                }
            break;
          }
     }
    
?>
