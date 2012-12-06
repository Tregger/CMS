<?php
 $doc_root=$_SERVER['DOCUMENT_ROOT'];
require($doc_root.'/configs/dbconnect.php');
$prod="-1";
$where="where folder=0 and ( 1=1";

if(isset($_POST['producers'])){
    $producers=array_keys($_POST['producers']);
    foreach($producers as $k=>$v){
        $prod.=",".$v;
    }

    $where.= ' and prod in ('.$prod.')';
}

if(isset($_POST['price_from']) && !empty($_POST['price_from']) && isset($_POST['price_to']) && !empty($_POST['price_to'])){

    if(isset($_POST['price_from']) && !empty($_POST['price_from'])){
        $price_from=$_POST['price_from'];
        $where.=' and (price >='.$price_from;
    }else{
        $where.=' and (price >=0';
    }

    if(isset($_POST['price_to']) && !empty($_POST['price_to'])){
        $price_to=$_POST['price_to'];
        $where.=' and price <='.$price_to.")";
    }else{
        $where.=')';
    }
}

if(isset($_POST['ob_from']) && !empty($_POST['ob_from']) && isset($_POST['ob_to']) && !empty($_POST['ob_to'])){
    if(isset($_POST['ob_from']) && !empty($_POST['ob_from'])){
        $ob_from=$_POST['ob_from'];
        $where.=' and (ob >= '.$ob_from;
    }else{
        $where.=' and (ob >= 0';
    }

    if(isset($_POST['ob_to']) && !empty($_POST['ob_to'])){
        $ob_to=$_POST['ob_to'];
        $where.=' and ob <= '.$ob_to.')';
    }else{
        $where.=')';
    }
}
if(isset($_POST['121Check'])){
    $type_1= ' and vid="Дровяные"';
    $where.=$type_1;
}
if(isset($_POST['122Check'])){
    $type_2= ' or vid="Газовые"';
     $where.=$type_2;
}
$where.=")";
$sql="select * from catalog ".$where;

    $products=fetch_all($sql);
    foreach($products as $product){
       echo ' <div class="hit1">';
                            echo '<img src="'.$product['img'].'">';
                            echo '<div class="reit">';
                            echo '<a href="/index.php?page=inner&amp;product='.$product['url'].'">'.$product['name'].'</a>';
                            echo '<div class="fire">';
                            echo '<h2>Хит!</h2>';
                            echo '<br>';
                            echo '</div>';
                            echo '</div>';
                            echo '<p></p><p>'.$product['fdescr'].'</p><p></p>';
                            echo '<h1>'.$product['price'].'р.</h1>';
                            echo '<a href="/index.php?page=cart&amp;action=add_to_cart&amp;id='.$product['id'].'" class="button">В корзину</a>';
                       echo ' </div>';
    }
?>
