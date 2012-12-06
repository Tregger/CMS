<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/configs/dbconnect.php';
$sql="select * from coupons";
$total_count=count(fetch_all($sql));
$sql="select * from coupons where status='drafts'";
$drafts_count=count(fetch_all($sql));
$sql="select * from coupons where status='active'";
$active_count=count(fetch_all($sql));
$sql="select * from coupons where st_day>='".time(date('Y-m-d 00:00:00'))."' and st_day<='".time(date('Y-m-d 23:59:59'))."'";
$started_today_count=count(fetch_all($sql));
$sql="select * from coupons order by st_day DESC limit 1";
$last_started_day=fetch_all($sql);
$last_started_day=date('Y-m-d 00:00:00', $last_started_day[1]['st_day']);
?>

<table>
    <tr>
        <td>Drafts count: </td>
        <td><?=$drafts_count; ?></td>
    </tr>
    <tr>
        <td>Active count: </td>
        <td><?=$active_count; ?></td>
    </tr>
      <tr>
        <td>Started today count: </td>
        <td><?=$started_today_count ?></td>
    </tr>
          <tr>
        <td>Last started deal date: </td>
        <td><?=$last_started_day; ?></td>
    </tr>
    <tr>
        <td>Total deals count: </td>
        <td><?=$total_count; ?></td>
    </tr>
   
</table>

