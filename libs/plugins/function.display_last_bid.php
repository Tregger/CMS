<?php
/*
 * display last bid to chosen auction
 * params: auc - auction id
 *         cur - currency
 */

function smarty_function_display_last_bid($params, $template)
{
         
         $auc= new auction;
     $last_bid=$auc->get_last_bid($params['auc']);

     echo $params['cur'].$last_bid['price'];
}

?>