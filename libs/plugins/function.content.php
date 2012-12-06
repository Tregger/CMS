<?php

/*
 * Select template for content
 */

     
function smarty_function_content($params, &$smarty){
    if (!isset($_SESSION)) session_start(); //path
    $doc_root=$_SERVER['DOCUMENT_ROOT'];
    $host_name="http://".$_SERVER['HTTP_HOST'];
 
   
    $sel=$params['cur'];
    if(isset($sel['type'])){
        $cur_type=$sel['type'];
    }
    if(isset($_SESSION['username']) && !empty($_SESSION['username'])){
    
        $logged=1;
    }else{
        $logged=0;
    }
    $smarty->assign('logged', $logged);
    if(!isset($cur_type)){
        $cur_type='home';
    }
    
    require $_SERVER['DOCUMENT_ROOT'].'/controllers/'.$cur_type.'Controller.php';
    
    if(isset($_GET['action'])){
        if(isset($_GET['id'])){
            $action=$_GET['action'].'_action';
            $id=$_GET['id'];
            $action($smarty, $id);
        }else{
        $action=$_GET['action'].'_action';
        $action($smarty);
        }
    }else{
        $action='index_action';
        $action($smarty, $sel);
    }

        
//    switch ($cur_type){
//        case 'pages':
//            $smarty->assign('text',$sel['fdescr']);
//            $smarty->assign('item',$sel);
//            $smarty->display('text.tpl');
//        break;
//        case 'feedback':
//            $smarty->assign('text',$sel['fdescr']);
//            $smarty->assign('item',$sel);
//            $smarty->display('text.tpl');
//        break;
//        case 'news':
//            require($_SERVER['DOCUMENT_ROOT'].'/class/news.php');
//            $smarty->assign('text',$sel['fdescr']);
//            $smarty->assign('item',$sel);
//            $smarty->assign('mod', 'new');
//            $new=new news;
//            if(isset($_GET['newid'])){
//                 $current_new=$new->get_page_by_id($_GET['newid']);
//                 $smarty->assign('new', $current_new);
//                   $smarty->display('new.tpl');
//            }else{
//                $items=$new->get_news();
//                $smarty->assign('items',$items);
//                $smarty->display('news.tpl');
//                
//            }
//        break;
//          case 'articles':
//              
//            require($_SERVER['DOCUMENT_ROOT'].'/class/articles.php');
//            $smarty->assign('text',$sel['fdescr']);
//            $smarty->assign('item',$sel);
//            $smarty->assign('mod', 'art');
//            $articles=new articles;
//            if(isset($_GET['article']) && !empty($_GET['article'])){
//            
//                 $current_new=$articles->get_page_by_id($_GET['article']);
//                 $smarty->assign('new', $current_new);
//                   $smarty->display('new.tpl');
//            }else{
//                $items=$articles->get_articles();
//                $smarty->assign('items',$items);
//                    
//                $smarty->display('news.tpl');
//                
//            }
//        break;
//        case 'catalog':
//            require($_SERVER['DOCUMENT_ROOT'].'/class/catalog.php');
//           
//            $catalog= new catalog;
//               /* инфо для пейджинга */
//                if(isset($_GET['pg'])){
//                    $cur_page=$_GET['pg'];
//                }else{
//                    $cur_page=0;
//                }
//                $pp=8;
//                $smarty->assign('cur_page',$cur_page);
//                
//                 $smarty->assign('pp',$pp);
//            if(!isset($_GET['product'])){
//
//            $smarty->assign('cat',$sel);
//            $smarty->assign('text',$sel['fdescr']);
//            if(isset($_GET['page'])){
//            $smarty->assign('page',$_GET['page']);
//            }
//             $smarty->assign('root_cat',$catalog->display_root_catalog());
//           if(!isset($_GET['page']) || $_GET['page'] == "home" ){
//               
//                $items=$catalog->get_home();
//                $most_sale=$catalog->get_most_sale();
//                $smarty->assign('most_sale',$most_sale);
//                $promo_products=$catalog->get_promo_products();
//                $smarty->assign('promo_products',$promo_products);
//                $smarty->assign('items',$items);
//                $smarty->display('home.tpl'); 
//            }else{
//               
//                if(isset($_GET['category'])){
//                    /*Забираем из базы записи по выбранной категории */
//                    $smarty->assign('all_page',count($catalog->get_items_from_cat(NULL, NULL, $_GET['category'])));
//                    $category=$catalog->get_record_by_id($_GET['category']);
//                    $most_sale=$catalog->get_most_sale();
//                    $smarty->assign('most_sale', $most_sale);
//                    $smarty->assign('category', $category);
//                    if(isset($_GET['order'])){
//                        $ord=$_GET['order']; 
//                    }else{
//                        $ord='name'; 
//                    }
//      //              $items=$catalog->get_items_from_cat($cur_page, $pp, $_GET['category'], $ord);
//                    $catalog->get_all_child_good($cur_page, $pp, $_GET['category'], $ord);
//                    $items = $catalog->catalog_items;
////                    echo "<pre>";
////                    var_dump($items);
////                    echo "</pre>";
//                  //  exit(0);
////                    echo "<pre>";
////                    var_dump($items);
////                    echo "</pre>";
//                }else{
//                    /*Забираем из базы записи из корневой категории url=root */
//                      if(isset($_GET['order'])){
//                        $ord=$_GET['order']; 
//                    }else{
//                        $ord='name'; 
//                    }
//                    $smarty->assign('all_page',count($catalog->get_items_from_root(NULL, NULL)));
//                    if(!isset($_GET['producer'])){
//                    $items=$catalog->get_items_from_root($cur_page, $pp, $ord);
//                    }else{
//                        $items=$catalog->get_products_by_producser($cur_page, $pp, $_GET['producer'] , $ord);
//                    }
//                }
//             
//                
//                /*---------------------*/
//                 $smarty->assign('items',$items);
//                 if(isset($_GET['type']) && $_GET['type']=='detailed'){
//                     $smarty->display('catalog_detailed.tpl');
//                 }else{
//                    $smarty->display('catalog.tpl');
//                 }
//                 
//            }
//            }else{
//                $item=$catalog->get_record_by_url($_GET['product']);
//                $items=$catalog->get_items_from_cat($cur_page, $pp, $item['id_p']);
//                $smarty->assign('item',$item);
//                 $smarty->assign('items',$items);
//                  $category=$catalog->get_record_by_id($item['id_p']);
//                  
//                    $smarty->assign('category', $category);
//                $parent_category=$catalog->get_parent_category($item['id_p']);
//              
//                $root_category=$catalog->get_parent_category($parent_category['id_p']);
//
//                $smarty->assign('parent_category',$parent_category);
//                $smarty->assign('root_category',$root_category);
//
//                $smarty->display('product.tpl');
//                
//            }
//        break;
//        
//        case 'login':
//           
//           $smarty->display('login.tpl');
//        break;
//        case 'register':
//           
//           $smarty->display('register.tpl');
//        break;
//   
//
//	case "search":
//	
//            require($_SERVER['DOCUMENT_ROOT'].'/class/search.php'); 
//            $search = new search();
//            $arr=array();
//            
//            if(isset($_GET['order']) && !empty($_GET['order'])){
//                echo "here!";
//                $ord=$_GET['order']; 
//            }else{
//                $ord='name'; 
//            }
//            if(isset($_GET['pg'])){
//                $cur_page=$_GET['pg'];
//            }else{
//                $cur_page=0;
//            }
//            $pp=8;
//            $smarty->assign('cur_page',$cur_page);
//            $smarty->assign('pp',$pp);
//            $arr = $search->display_products(null,$_POST['search_str'], $ord, $cur_page, $pp);
//            $smarty->assign('results', $arr);
//            $smarty->display('search_results.tpl');
//    break;
//    case "cart":          
////        if (!isset($_SESSION['userid'])) {            
////            header("Location: /index.php?page=login");           
////        }        
////        else {
//            //var_dump($_SESSION);
//            $smarty->assign('products', json_decode($_SESSION['products'], true));
//            $smarty->assign('total_sum', $_SESSION['total_sum']);
//            $smarty->display('cart.tpl');
//       // }
//    break;
//default:
//    header("Location: /404.html");
//    }
}
    
  
?>
