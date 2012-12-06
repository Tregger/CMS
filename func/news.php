<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
    $news= new news;
    $pg=$news->get_news();
    $smarty->assign('news', $pg);
    
  //   $types=get_html_modules();
    $types="";
     $smarty->assign('types', $types);
     if(isset($_GET['option'])){
          switch ($_GET['option']) {
            case 'delete':
                $news->delete_record_by_id($_GET['id']);
            break;
            case 'add':
                
                 
                if(isset($_POST['method']) && $_POST['method']=='save'){
                    $news->add_page($_POST['page']);
                }else{
                  $smarty->display('news_add.tpl');
                }
            break;
            case 'edit':
                
            if(isset($_POST['method']) && $_POST['method']=='save'){
                    $news->edit_page($_POST['page']);
                }else{
                  $page=$news->get_page_by_id($_GET['id']);
                  $smarty->assign('page', $page);
                  $smarty->display('news_edit.tpl');
                }
            break;
          }
     }
    
?>
