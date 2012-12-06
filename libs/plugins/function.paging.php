<?php

function smarty_function_paging($params, &$smarty)
{
    if($params['cur_page']){
        $cur_page=$params['cur_page'];
    }else{
         $cur_page=1;
    }
    $all_item=$params['all_page'];
    $per_page=$params['per_page'];
    if($all_item <= $per_page){
       // echo "<div class='clear'><!-- --> </div><div class='clear'><!-- --> </div>";
       
    }else{
        $page_count=ceil($all_item/$per_page);
        if($cur_page<=1){
            $prev="1";
        }else{
            $prev=$cur_page-1;
        }
        
        if($cur_page>=$page_count){
            $next=$cur_page;
        }else{
            $next=$cur_page+1;
        }
        $current_st_good=$cur_page*$per_page-$per_page+1;
        if($cur_page*$per_page > $all_item){
            $current_end_good=$all_item;
        }else{
         $current_end_good=$cur_page*$per_page;
        }
        
      //echo '<div class="clear"></div>';
        echo '<div class="'.$params['container'].'">';
        echo '<div class="paging">';
         echo '<p>Страницы:</p>';
               echo ' <ul>';
                echo ' <li><a href="?page='.$_GET['page'].'&pg=1"><img src="img/prevend.png"></a></li>';
                       echo '<li class="prev"><a href="?page='.$_GET['page'].'&pg='.$prev.'"><img src="img/prev.png"></a></li>';
                       for($i=1;$i<=$page_count; $i++){
                           if($i==$cur_page){
                               echo '<li class="poin"><a class="pointer" href="?page='.$_GET['page'].'&pg='.$i.'">'.$i.'</a></li>';
                           }else{
                             echo '<li><a href="?page='.$_GET['page'].'&pg='.$i.'">'.$i.'</a></li>';
                           }
                       }
                      echo '<li class="next"><a href="?page='.$_GET['page'].'&pg='.$next.'"><img src="img/next.png"></a></li>';
                      echo '<li><a href="?page='.$_GET['page'].'&pg='.$page_count.'"><img src="img/nextend.png"></a></li>';
               echo '</ul>';
               echo '<p class="tov">Товары: '.$current_st_good.' - '.$current_end_good.' из '.$all_item.'</p>';
       echo '</div>';
         echo '</div>';
    }
}



?>