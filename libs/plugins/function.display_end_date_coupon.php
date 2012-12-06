<?php

function smarty_function_display_end_date_coupon($params, &$smarty)
{
    $start=$params['start'];
    $days= $start+$params['days']*84600;
    echo date("Y-m-d", $days );
}




?>