<?php

function smarty_function_display_img($params, &$smarty)
{
    $mas= json_decode($params['vals'], 'ASSOC');

    if(isset($mas)){
        for($i=1; $i<count($mas); $i++){
            echo "<img src=\"".$mas['pic'.$i]."\">";
            if($params['where']=='main'){break;}
        }
    }else{
        echo "<img src=\"".$params['vals']."\">";
    }
}

?>