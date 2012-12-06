<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


require($doc_root.'/configs/dbconnect.php');
 require($doc_root.'/class/catalog.php');


    $cat= new catalog;
    $atr=new attributes;
    $categories=$cat->display_root_attr();

    $smarty->assign('categories_root', $categories);
    
  //   $types=get_html_modules();
    $types="";
     $smarty->assign('types', $types);
     if(isset($_GET['option'])){
          switch ($_GET['option']) {
            case 'delete':
                $atr->delete_record_by_id($_GET['id']);
            break;

            case 'edit':
                
            if(isset($_POST['method']) && $_POST['method']=='save'){
                    //$pages->edit_page($_POST['page']);
                $atr->save_attr($_POST['attributes']);

                }else{
                    
                  $smarty->assign('category', $_GET['id']);
                  $attrs=$atr->get_attr_for_cat($_GET['id']);

                  $smarty->assign('attrs', $attrs);
                  $smarty->display('attributes_edit.tpl');
                }
            break;
            case 'get_html_attributes':
                    echo "11";
            break;
          }
     }
    
?>
