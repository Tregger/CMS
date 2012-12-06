<?php

function index_action($smarty){
    $sql="select * from payments where user=".$_SESSION['userid'];
    $payments=fetch_all($sql);
    $smarty->assign('payments', $payments);
    $smarty->display('billing.tpl');
}

function success_action($smarty){
  
$log = fopen("ipn.log", "a");
fwrite($log, "\n\nipn - " . gmstrftime ("%b %d %Y %H:%M:%S", time()) . "\n");

$req = "cmd=_notify-validate";

    $sql="insert into payments(id_transaction, email, user, suma, gateway, date, status, item_name) values ('".$_POST['txn_id']."', '".$_POST['payer_email']."', '".$_POST['option_selection1']."', '".$_POST['payment_gross']."', 'paypal', now(), '".$_POST['payment_status']."', '".$_POST['item_name']."')";

fwrite($log,$sql."\r\n");
mysql_query($sql);
    $sql="update coupons set payd=1 where id=".$_POST['option_selection2'];
    mysql_query($sql);
session_destroy();
foreach($_POST as $key=>$val)
{
   $req.= "&".$key."=".urlencode($val);
   fwrite($log,$key."=".$val."\n");
}

$header = "POST http://www.paypal.com/cgi-bin/webscr HTTP/1.0\r\n";
$header .= "Content-Type: application/x-www-form-urlencoded\r\n";
$header .= "Content-Length: " . strlen ($req) . "\r\n\r\n";
$fp = fsockopen ("www.sandbox.paypal.com", 80, $errno, $errstr, 30);

if (!$fp)
{
   echo "$errstr ($errno)";
   fwrite($log, "Failed to open HTTP connection!\n");
   fwrite($log, $errstr." ".$errno);
   fclose ($log);
   return;
}

fputs ($fp, $header . $req);

$res="";
while (!feof($fp))
   $res .= fgets ($fp, 1024);
fclose ($fp);

if (strpos($res, "VERIFIED")===FALSE)
{
   fwrite($log,"ERROR - UnVERIFIIED payment\r\nPayPal response:");
   fwrite($log,$res);
   fclose($log);
   return;
}

fwrite($log,"payment VERIFIIED\r\n");

if ($_POST["payment_status"]!="Completed")
{
   if ($_POST["payment_status"]=="Pending" )
{
   fwrite($log,"ERROR - payment status is not Completed - $_POST[payment_status] | $_POST[pending_reason]\r\n");
   fclose($log);
// а тут отмечаем заказ как оплаченный, но требующий подтверждение оплаты со стороны плательщика
// такое бывает редко, но все же бывает и лучше подстраховаться.
   return;

}

   fwrite($log,"ERROR - payment status is not Completed - $_POST[payment_status] | $_POST[pending_reason]\r\n");
   fclose($log);
   return;
   //update order status

}

fwrite($log,"OK - payment received $_POST[item_number].\r\n");

// тут отмечаем заказ оплаченным.
// деньги уже на счету продавца
fclose($log);


}
?>
