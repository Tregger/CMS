<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
   $articles= new articles;
    $pg=$articles->get_articles();
   $smarty->assign('articles', $pg);
    
  //   $types=get_html_modules();
    $types="";
     $smarty->assign('types', $types);
     if(isset($_GET['option'])){
          switch ($_GET['option']) {
            case 'delete':
                $articles->delete_record_by_id($_GET['id']);
            break;
            case 'add':
                
                 
                if(isset($_POST['method']) && $_POST['method']=='save'){
                    $articles->add_page($_POST['page']);
                }else{
                  $smarty->display('articles_add.tpl');
                }
            break;
            case 'edit':
                
            if(isset($_POST['method']) && $_POST['method']=='save'){
                    $articles->edit_page($_POST['page']);
                }else{
                  $page=$articles->get_page_by_id($_GET['id']);
                  $smarty->assign('page', $page);
                  $smarty->display('articles_edit.tpl');
                }
            break;
          }
     }
    
?>
