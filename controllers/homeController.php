<?php

define('EARTH_RADIUS', 6372795);
require_once $_SERVER['DOCUMENT_ROOT'] . '/class/coupons.php';

function index_action(&$smarty) {


    $sql = "select * from messages where id_whom='" . $_SESSION['userid'] . "' and `read`=0";

    $chats = fetch_all($sql);
    $smarty->assign('chats', $chats);
    if (isset($_GET['view'])) {
        $status = $_GET['view'];
    } else {
        $status = 'active';
    }
    $coupons = new coupons;
    if (isset($_SESSION['user_level']) && $_SESSION['user_level'] == 1) {
        if (isset($_GET['lookup'])) {
            $items = $coupons->display_all(array(
                'merchant' => $_SESSION['userid']
                    ));
        } else {
            $items = $coupons->display_all(array(
                'status' => $status,
                'merchant' => $_SESSION['userid']
                    ));
        }
    } else {

        if (isset($_GET['city'])) {
            $city = $_GET['city'];
        } else {
            $city = '%%';
        }
        require_once $_SERVER['DOCUMENT_ROOT'] . '/class/geo.php';
        $geo = new geoPlugin();
        $geo->locate();
        $radius = 0;



        $items = $coupons->display_all(array(
            'status' => 'active',
            'city' => $city
                ));
  

        if (!isset($items) || empty($items)) {
            //get all cities with deal
            $sql = "select city from coupons group by city";
            $cities = fetch_all($sql);
            $tmp_arr = array();
            $i = 0;
            foreach ($cities as $tmp) {
                $object = json_decode(file_get_contents('http://maps.google.com/maps/geo?q=' . urlencode($tmp['city'])), 'ASSOC');
                $tmp_arr[$i]['name'] = $tmp['city'];
                $tmp_arr[$i]['lat'] = $object["Placemark"][0]["Point"]["coordinates"][0];
                $tmp_arr[$i]['long'] = $object["Placemark"][0]["Point"]["coordinates"][1];
            }

            $i = 0;
            foreach ($tmp_arr as $tmp) {
                $aa[$i]['name'] = $tmp['name'];
                $aa[$i]['distance'] = calculateTheDistance($tmp['long'], $tmp['lat'], $geo->latitude, $geo->longitude);
            }

            $min_dist = $aa[0]['distance'];
            $target_city = $aa[0]['name'];
            foreach ($aa as $distancess) {
                if ($distancess['distance'] < $min_dist) {
                    if (!isset($_GET['map_view'])) {
                        $target_city = $distancess['name'];
                    } else {
                        $target_city = $distancess['name'] . "&map_view=1";
                    }
                    $min_dist = $distancess['distance'];
                }
            }

            //    header('location: http://dealhoster.com/city/'.urlencode($target_city)."/");
            //  echo "<script>window.location.href='http://dealhoster.com/city/'".urlencode($target_city)."</script>";
            //}

            $items = $coupons->display_all(array(
                'status' => 'active',
                'city' => $target_city
                    ));
        }

//        require_once($_SERVER['DOCUMENT_ROOT']."/class/cache.php"); //Подключаем класс
//$new=new CACHE; //Объявляем класс
//$new->cache_content();//Буферизируем контент файла
//    if($new->file_and_katalog_isset()){
//        $new->haupt_cache();
//    }else{

        $smarty->assign('view', $status);
        $smarty->assign('items', $items);
        if (isset($_GET['map_view']))
            $smarty->display('home_map.tpl');
        else
            $smarty->display('home.tpl');
        //$new->haupt_cache();
//    }
    }
}
    function calculateTheDistance($φA, $λA, $φB, $λB) {

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
