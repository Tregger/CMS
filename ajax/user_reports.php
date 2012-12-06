<?php
require_once $_SERVER['DOCUMENT_ROOT'].'/configs/dbconnect.php';
$sql="select * from login_users";
$total_count=count(fetch_all($sql));
$sql="select * from login_users where user_level=1";
$merchants_count=count(fetch_all($sql));
$sql="select * from login_users where user_level=1";
$regular_count=count(fetch_all($sql));
$sql="select * from login_users where last_login>='".date('Y-m-d 00:00:00')."' and last_login<='".date('Y-m-d 23:59:59')."'";
$login_today=count(fetch_all($sql));
$sql="select * from login_users where signup_date='".date('Y-m-d')."'";
$signup_today=count(fetch_all($sql));
?>
<table>
    <tr>
        <td>Merchants count: </td>
        <td><?=$merchants_count; ?></td>
    </tr>
    <tr>
        <td>Regular count: </td>
        <td><?=$regular_count; ?></td>
    </tr>
      <tr>
        <td>Login count today: </td>
        <td><?=$login_today; ?></td>
    </tr>
          <tr>
        <td>Signup count today: </td>
        <td><?=$signup_today; ?></td>
    </tr>
    <tr>
        <td>Total users count: </td>
        <td><?=$total_count; ?></td>
    </tr>
   
</table>
