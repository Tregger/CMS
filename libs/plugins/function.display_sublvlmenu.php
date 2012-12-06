<?php

function smarty_function_display_sublvlmenu($params, &$smarty)
{
    $catalog= new catalog;
    $id_p=$params['id_p'];
    $subcategries=$catalog->display_sublvl_catalog($id_p);
   // var_dump($subcategries);
                foreach($subcategries as $subcategries){
                    echo "<li>";
                            echo "<a href='/index.php?page=catalog&category=".$subcategries['id']."'>".$subcategries['name']."</a>";
                    echo "</li>";
                }   
}



?>