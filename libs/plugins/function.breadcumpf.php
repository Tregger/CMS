<?php

function smarty_function_breadcumpf($params, &$smarty)
{
   // require($_SERVER['DOCUMENT_ROOT'].'/class/catalog.php'); 
    $cat=new catalog;
    $html= "<ul>";
    $html.= "<li><a href='/'>Главная</a><img src='/img/arrow.jpg'></li>";
    if(($_GET['page']=='magazin' ||$_GET['page']=='inner' )){
        $html.= "<li><a href='/magazin/'>Каталог товаров</a><img src='/img/arrow.jpg'></li>"; 
        if(isset($_GET['category']) || isset ($_GET['product'])){
            if(isset($_GET['category'])){
                $getted=$_GET['category'];
                  $current = $cat->get_record_by_id($getted) ;
            }else{
                $getted=$_GET['product'];
                  $current = $cat->get_record_by_url($getted) ;
            }    
            
         
            $parent=$cat->get_parent_category($current['id_p']);
            if(isset($parent) && !empty($parent) && $parent!=0){
                
                $html.= "<li><a href='/magazin/".$parent['id']."/'>".$parent['name']."</a><img src='/img/arrow.jpg'></li>"; 
            }
                
                $html.= "<li>".$current['name']."</li>"; 
        }
        
    }
    $html.= "</ul>";
    
    echo $html;
}

?>