<?php

function smarty_function_display_categories_checkboxes($params, &$smarty)
{
    require_once $_SERVER['DOCUMENT_ROOT'].'/configs/dbconnect.php';
    $user_cats_q="select categories from login_users where userid=".$_SESSION['userid'];
    $user_cats=  fetch_all($user_cats_q);
    if(isset($user_cats) && !empty($user_cats)){
        $cats=  json_decode($user_cats[1]['categories'], 'ASSOC');
    }else{
        $cats= array();
    }
    $sql="select * from coupon_categories order by ord";
    $categories=fetch_all($sql);
    $checked="";
    foreach($categories as $category){
        if(in_array($category['id_category'], $cats)){
           $checked="checked"; 
        }
                                        echo '  <div class="selectCategoryStrip">';
                                        echo '<table>';
                                        echo '<tr>';
                                        echo '<td style="vertical-align: middle">';
					 echo '	<input type="checkbox" name="categories[]" value="'.$category['id_category'].'" '.$checked.' />';
					echo '</td>';
                                       echo ' <td style="vertical-align: top">';
                                        echo '	<p>'.$category['name'].'</p>';
                                        echo ' </td>';
                                        echo ' </tr>';
                                         echo '</table>';
					 echo '</div>';
         $checked="";
    }
   
}




?>