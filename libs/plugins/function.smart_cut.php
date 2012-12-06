<?php

function smarty_function_smart_cut($params, &$smarty)
{
    $text=$params['text'];
    $words = 20;
    $separator = ' ';
    $current_pos = 230;
//    for($i = 0; $i < $words; $i++)
//    {
//        $current_pos = strpos($text, $separator, ($current_pos + 1));
//    }
    if(strlen($text)>$current_pos){
        
     return mb_strcut($text, 0, $current_pos);
    }else{
        return $text;
    }
}
?>
