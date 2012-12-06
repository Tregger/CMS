<?php
function smarty_function_cart_widget($params, &$smarty)
{
   
    if(isset($_SESSION['good_count'])){
     $count_goods=$_SESSION['good_count'];
    }else{
     $count_goods=0;   
    }
    
    if(isset($_SESSION['total_sum'])){
     $total_sum=$_SESSION['total_sum'];
    }else{
     $total_sum=0;   
    }
   // if(isset($_SESSION['userid'])){
       echo '<div class="basket">';
         echo '<img src="/img/basket.png">';
        echo '<h1>Товаров: '.$count_goods.'</h1>';
        echo '<a href="/cart/">На сумму: '.$total_sum.'p</a>';
         echo ' </div>';
//    }else{
//      echo '<div class="basket">';
//            echo '<img src="/img/basket.png">';
//            echo '<h1>Ваша корзина</h1>';
//            echo '<a href="/index.php?page=login">Вход для клиентов</a>';
//        echo '</div>';
//    }
}
?>
