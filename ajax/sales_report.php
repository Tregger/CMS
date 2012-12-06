<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/configs/dbconnect.php';
$sql="select * from claims";
$total_count=count(fetch_all($sql));
$sql="select SUM(c_price) from claims inner join coupons on coupons.id=claims.deal_id ";
$total_sum=fetch_all($sql);
$total_sum=$total_sum[1]['SUM(c_price)'];
$sql="select * from claims order by date DESC limit 1";
$last_pay=fetch_all($sql);
$last_pay=$last_pay[1]['date']; 

?>
<table>
    <tr>
        <td>Total count payments: </td> 
        <td><?=$total_count; ?></td>
    </tr>
    <tr>
        <td>Total sum: </td>
        <td>$ <?=$total_sum; ?></td>
    </tr>
      <tr>
        <td>Last payment: </td>
        <td><?=$last_pay; ?></td>
    </tr>
  
   
</table>