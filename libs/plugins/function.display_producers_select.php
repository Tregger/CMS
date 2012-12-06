<?php

function smarty_function_display_producers_select($params, &$smarty)
{
      require($_SERVER['DOCUMENT_ROOT'].'/class/producers.php');
  $producers=new producers();
  if(isset($params['var'])){
     $cur=$params['var'];
  }else{
      $cur=0;
  }
    $prod=$producers->get_all_producers();
  foreach($prod as $producer){
      if($producer['id']==$cur){
        echo "<option value='".$producer['id']."' selected>".$producer['name']."</option>";
      }else{
          echo "<option value='".$producer['id']."' >".$producer['name']."</option>";
      }
  }
}



?>