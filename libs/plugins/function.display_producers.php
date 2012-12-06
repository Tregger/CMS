<?php

function smarty_function_display_producers($params, &$smarty)
{
      require($_SERVER['DOCUMENT_ROOT'].'/class/producers.php');
  $producers=new producers();

    $prod=$producers->get_all_producers();
      

echo '<div class="brand_block">';
  foreach($prod as $producer){

echo '<a href="/index.php?page=magazin&producer='.$producer['id'].'" ><img src="'.$producer['logo'].'"></a>';


 
  }
  echo '</div>';


}



?>