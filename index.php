<?php

session_start();

if($_SESSION['user_level']=="1" && !isset($_GET['page']) && !isset($_GET['lookup'])){
    header('location: /index.php?page=deals&action=mydeals');
}else{
    slug();

}




ini_set('display_errors','Off'); 
$doc_root=$_SERVER['DOCUMENT_ROOT'];
$host_name="http://".$_SERVER['HTTP_HOST'];
require($doc_root.'/configs/dbconnect.php');
require($doc_root.'/libs/SmartyBC.class.php');
require($doc_root.'/class/auth.php');
require($doc_root.'/class/pages.php');
require($doc_root.'/class/members.php');
require($doc_root.'/class/auction.php');
  $smarty = new SmartyBC();
  $pag=new pages;
  $smarty->allow_php_templates;
  $smarty->template_dir = "./templates/";
  
$styles_dir="/css/";
require($doc_root.'/class/options.php');
$global_opt=new options();
$global_opt->register_globals($smarty);
$smarty->caching = false;

if(!isset($_GET['page'])){
    
    $current=NULL;
}else{
    
      $current=$_GET['page'];
}
require_once $_SERVER['DOCUMENT_ROOT'].'/class/geo.php';
       $geo = new geoPlugin();
       $geo->locate(); 
$city = check_city(); 

$smarty->assign('client_city', $city);
$page=$pag->get_page_by_url($current);

 
if(isset($_GET['lprice'])){$lprice=$_GET['lprice'];}else{$lprice="";};
if(isset($_GET['rprice'])){$rprice=$_GET['rprice'];}else{$rprice="";};

if(isset($_SESSION['username']) && !empty($_SESSION['username'])){
    $logged=1;
}else{
    $logged=0;
}


$smarty->assign("styles_dir",$styles_dir);
$smarty->assign("logged",$logged);
$smarty->assign("current",$current);
$smarty->assign("lprice",$lprice);
$smarty->assign("rprice",$rprice);
$smarty->assign("current_page",$page);
//if($new->file_and_katalog_isset()){
//    //$new->haupt_cache();    
//}else{
//    $smarty->display('index.tpl');
//    //$new->haupt_cache();  
//}
$smarty->display('index.tpl');
          
                   function slug(){     
                     
           if(isset($_SERVER['REQUEST_URI']) && $_SERVER['REQUEST_URI']!="/" && $_SERVER['REQUEST_URI']!="//" && $_SERVER['REQUEST_URI']!="/index.php" && !isset($_GET['city']) && (!isset($_GET['lookup']) || count($_GET)>1) && !isset($_GET['map_view'])){

                $str_count =  mb_substr_count($_SERVER['REQUEST_URI'], "/");
                $str__space_count =  mb_substr_count($_SERVER['REQUEST_URI'], " ");
                if($str_count == 1 ){
                    switch(count($_GET)){
                    case 1: 
                        if(!isset($_GET['city'])){
                             if(!isset($_GET['merchant'])){
                                    $new_url="/".str_replace(" ","+", $_GET['page'])."/";
                             }else{
                                  $new_url="/".str_replace(" ","+", $_GET['page'])."/merchant/true/";
                             }
                        }else{
                            $new_url="/".str_replace(" ","+", $_GET['city'])."/";
                        }
                    break;
                    case 2:
                        if(!isset($_GET['merchant'])){
                            if(!isset($_GET['map_view'])){
                             $new_url="/".str_replace(" ","+", $_GET['page'])."/".str_replace(" ","+",$_GET['action'])."/";
                            }else{
                                $new_url="/map_view/".str_replace(" ","+",$_GET['city'])."/";
                            }
                            
                        }else{
                         $new_url="/".str_replace(" ","+", $_GET['page'])."/merchant/".str_replace(" ","+",$_GET['merchant'])."/";   
                        }
                        break;
                    case 3:
                        if(!isset($_GET['merchant'])){
                            if(!isset($_GET['view'])){
                                 $new_url="/".str_replace(" ","+", $_GET['page'])."/".str_replace(" ","+",$_GET['action'])."/".str_replace(" ","+",$_GET['id'])."/";
                        
                            }else{
                                $new_url="/".str_replace(" ","+", $_GET['page'])."/".str_replace(" ","+",$_GET['action'])."/view/".str_replace(" ","+",$_GET['view'])."/";
                            }
                        }else{
                            $new_url="/".str_replace(" ","+", $_GET['page'])."/".str_replace(" ","+",$_GET['action'])."/merchant/".str_replace(" ","+",$_GET['merchant'])."/";
                        }
                    break;
                   case 4:
                       if($_GET['action']!="fb_login"){
                        if(!isset($_GET['merchant']) ){
                            if(!isset($_GET['view'])){
                                 $new_url="/".str_replace(" ","+", $_GET['page'])."/".str_replace(" ","+",$_GET['action'])."/".str_replace(" ","+",$_GET['id'])."/lookup/";
                        
                            }else{
                                $new_url="/".str_replace(" ","+", $_GET['page'])."/".str_replace(" ","+",$_GET['action'])."/view/".str_replace(" ","+",$_GET['view'])."/lookup/";
                            }
                        }else{
                            $new_url="/".str_replace(" ","+", $_GET['page'])."/".str_replace(" ","+",$_GET['action'])."/merchant/".str_replace(" ","+",$_GET['merchant'])."/lookup/";
                        }
                       }
                    break;
                    }
                    header('location: '.$new_url);
                    echo $new_url;
                }else{
                    if($str__space_count > 0 ){
                     $new_url=str_replace(" ","+", $_SERVER['REQUEST_URI']);
                     header('location: '.$new_url);
                    
                    }
                }
           }else{
               $str_count =  mb_substr_count($_SERVER['REQUEST_URI'], "/");
                 if($str_count == 1 ){
                    if(isset($_GET['city']) && !isset($_GET['map_view'])){

                    header('location: /city/'.urlencode($_GET['city'])."/");
                    }else{
                           
                    }
                 }
           }
}




function check_city(){
    define('EARTH_RADIUS', 6372795);
require_once $_SERVER['DOCUMENT_ROOT'].'/class/coupons.php';

 if(isset($_GET['view'])){
        $status=$_GET['view'];
    }else{
        $status='active';
    }
    $coupons= new coupons;
    if(isset($_SESSION['user_level']) && $_SESSION['user_level'] == 1){
        if(isset($_GET['lookup'])){
          $items=$coupons->display_all(array(
          
            'merchant'=>$_SESSION['userid']
         ));
        }else{   
            $items=$coupons->display_all(array(
            'status'=>$status, 
            'merchant'=>$_SESSION['userid']
        ));
            
        }
     
    }else{
       
       if(isset($_GET['city'])){
           $city=$_GET['city'];
       }else{
           $city='%%';
       }
       require_once $_SERVER['DOCUMENT_ROOT'].'/class/geo.php';
       $geo = new geoPlugin();
       $geo->locate();
       $radius = 0;
  
          
        
         $items=$coupons->display_all(array(
            'status'=>'active',
            'city'=>$city
        ));
         
         
        if (!isset($items) || empty($items)) {
            //get all cities with deal
            $sql="select city from coupons group by city";
            $cities= fetch_all($sql);
            $tmp_arr=array();
            $i=0;
            foreach($cities as $tmp){
                $object=json_decode(file_get_contents('http://maps.google.com/maps/geo?q='.urlencode($tmp['city'])), 'ASSOC');
                $tmp_arr[$i]['name']=$tmp['city'];
                $tmp_arr[$i]['lat']=$object["Placemark"][0]["Point"]["coordinates"][0];
                $tmp_arr[$i]['long']=$object["Placemark"][0]["Point"]["coordinates"][1];
               
            }
      
            $i=0;
            foreach($tmp_arr as $tmp){
                $aa[$i]['name']=$tmp['name'];
                $aa[$i]['distance']=calculateTheDistanceIndex($tmp['long'], $tmp['lat'], $geo->latitude, $geo->longitude);
            }
            
            $min_dist=$aa[0]['distance'];
            $target_city=$aa[0]['name'];
            foreach($aa as $distancess){
                if($distancess['distance']<$min_dist){
                    if(!isset($_GET['map_view'])){
                     $target_city=$distancess['name'];
                     }else{
                          $target_city=$distancess['name'];
                     }
                    $min_dist=$distancess['distance'];
                }
            }
            
            return $target_city;
          
 
}
    }
}

function calculateTheDistanceIndex ($φA, $λA, $φB, $λB) {
	 
	    // перевести координаты в радианы
	    $lat1 = $φA * M_PI / 180;
	    $lat2 = $φB * M_PI / 180;
	    $long1 = $λA * M_PI / 180;
	    $long2 = $λB * M_PI / 180;
	 
	    // косинусы и синусы широт и разницы долгот
	    $cl1 = cos($lat1);
	    $cl2 = cos($lat2);
	    $sl1 = sin($lat1);
	    $sl2 = sin($lat2);
	    $delta = $long2 - $long1;
	    $cdelta = cos($delta);
	    $sdelta = sin($delta);
	 
	    // вычисления длины большого круга
	    $y = sqrt(pow($cl2 * $sdelta, 2) + pow($cl1 * $sl2 - $sl1 * $cl2 * $cdelta, 2));
	    $x = $sl1 * $sl2 + $cl1 * $cl2 * $cdelta;
	 
	    //
	    $ad = atan2($y, $x);
	    $dist = $ad * EARTH_RADIUS;
	 
	    return $dist;
}
?>
