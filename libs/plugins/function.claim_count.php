<?php

function smarty_function_claim_count($params, &$smarty)
{
   $deal=$params['id'];
   $sql="select claims from coupons where id=".$deal;
   $claims=  fetch_all($sql);
   $total_claims= $claims[1]['claims'];
   $sql="select id from claims where deal_id=".$deal;
   $res=count(fetch_all($sql));
   echo $res;
}

?>