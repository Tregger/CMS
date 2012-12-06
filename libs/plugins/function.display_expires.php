<?php

function smarty_function_display_expires($params, &$smarty)
{
    $st_day=$params['st_day'];
    $day_col=$params['day_col'];
    $end_date=$st_day+($day_col*84600);
    $time=$end_date-time();
    if($time <0){
        echo "expired";
    }else{
        //295282
        $days=floor($time/84600);
        $hours=floor(($time-$days*84600)/60/60);
   
        $minutes=floor(($time-$days*84600-$hours*3600)/60);
        $seconds=$time-$days*84600-$hours*24-$minutes*60;
        $str=""; 
        if($days>=1){
            $str.=$days." d ";
        }else{
            $str.="0 D ";
        }
        if($hours>=1){
              if($hours <10){
                $str.="0".$hours;
              }else{
                $str.=$hours;   
              }
        }else{
            $str.="00";
        }
         if($minutes>=0){
             if($minutes <10){
                 $str.=":0".$minutes;
             }else{
                $str.=":".$minutes;
             }
        }else{
            $str.="00";
        }
        echo $str; 
    }
}

?>