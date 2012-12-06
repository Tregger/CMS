<?php
            
            $cat = new catalog;
            $res = $cat->display_root_catalog();
            $smarty->assign('catalog', $res);
            $smarty->assign('id', $_GET['id']);
            if(isset($_GET['option'])){
                switch ($_GET['option']) {
                    case 'add':
                        $smarty->assign('tip', $_GET['tip']);
                        if(isset($_POST['method']) && $_POST['method']=='save'){
                              $cat->add_record($_POST['record']);
                            
                        }else{
                        $smarty->display('catalog_add.tpl');
                        }
                        break;
                    case 'edit':
                        $smarty->assign('tip', $_GET['tip']);
                        $record=$cat->get_record_by_id($_GET['id']);
                        $smarty->assign('record',  $record);
                        if(isset($_POST['method']) && $_POST['method']=='save'){
                              $cat->edit_record($_POST['record']);
                            
                        }else{
                        $smarty->display('catalog_edit.tpl');
                        }
                        break;
                    case 'delete':
                        $cat->delete_record_by_id($_GET['id']);
                        break;
                     case 'view_rec':
                        $category_name=$cat->get_name_category_by_id($_GET['id']);
                        $smarty->assign('cat_name', $category_name);
                        $records=$cat->display_records_from_cat($_GET['id']);
                        $smarty->assign('records', $records);
                        $smarty->display('goods.tpl');
                        break;
                      case 'change_ord':
                        $cat->change_item_ord($_GET['id'], $_GET['ord']);
                         break;
                     case 'edit_img':
                                               
                        $record=$cat->get_record_by_id($_GET['id']);
                        $smarty->assign('record', $record);
                        
                         if(isset($_POST['method'])){
                             switch ($_POST['method']) {
                                 case 'save':
                                    $cat->save_image($_POST['record']);
                                 break;
                                 case 'delete':
                                    $cat->delete_image($_POST['record']);
                                 break;
                             }
                        }else{
                        $smarty->display('edit_img.tpl');
                        }
                        break;
                }
            }
?>
