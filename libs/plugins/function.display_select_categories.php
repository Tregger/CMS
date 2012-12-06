<?php

function smarty_function_display_select_categories($params, &$smarty)
{
  $sql="select * from coupon_categories";
  
 
  if(isset($params['var'])){
     $cur=$params['var'];
  }else{
      $cur=0;
  }
    $prod=  fetch_all($sql);
echo "cat: ".$cur;
  foreach($prod as $producer){
    
    if($cur==$producer['id_category']){
             echo "<option value='".$producer['id_category']."' selected>".$producer['name']."</option>";
    }else{
          echo "<option value='".$producer['id_category']."' >".$producer['name']."</option>";
    }

}
}



?>