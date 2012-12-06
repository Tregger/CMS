<?php

$table_prefix = "login";

require_once($_SERVER['DOCUMENT_ROOT'].'/configs/dbconnect.php');
$sql="select * from options where var_name='site_email'";
$vars=  fetch_all($sql);
$uemail = $vars[1]['value'];
$title = "SlopeXchange";

?>