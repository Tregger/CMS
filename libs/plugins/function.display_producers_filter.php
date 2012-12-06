<?php

function smarty_function_display_producers_filter($params, &$smarty)
{
      require($_SERVER['DOCUMENT_ROOT'].'/class/producers.php');
  $producers=new producers();

    $prod=$producers->get_all_producers();
  foreach($prod as $producer){
                echo ' <div class="checkform">';
                   echo '  <span id="property'.$producer['id'].'" class="checkbox">';
                       echo ' <span onclick="checkboxClick(\'property'.$producer['id'].'\');" class="checkbox_image"></span>';
                        echo '<div style="display: none;">';
                            echo '<input type="checkbox" id="property'.$producer['id'].'Check" value="1" name="producers['.$producer['id'].']" class="required">';                                    
                        echo '</div>';
                    echo '</span>';
                    echo '<p>'.$producer['name'].'</p>';
               echo ' </div>';
  }
}



?>