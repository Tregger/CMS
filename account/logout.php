<?php

session_start();
include("config.php");
ini_set('display_errors','Off');
$doc_root=$_SERVER['DOCUMENT_ROOT'];
$host_name="http://".$_SERVER['HTTP_HOST'];
//require($doc_root.'/configs/dbconnect.php');
include "config.php";
require($doc_root.'/libs/Smarty.class.php');
$site_path="http://".$_SERVER['SERVER_NAME'];





  $smarty = new Smarty;
  $smarty->allow_php_templates;
  $smarty->template_dir = "../templates/";
  $smarty->display('header_users.tpl');
?>

<?php
if(!isset($_REQUEST['logmeout'])) {
?>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
<td width="100%" valign="top" align="center"><font class="title"><?=$title?></font></td>
</tr>
</table>
<p>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
<td width="100%" valign="top" align="center"><br><br><font class="content">Are you sure you want to log out.<p><a href="logout.php?logmeout=true" class="button4">Yes</a> | <a href="javascript:history.back()" class="button4">No</a></font><br><br></td>
</tr>
</table>
<?php
} else {
session_destroy();
if(!session_is_registered('username')) {
    Header("location: http://".$_SERVER['SERVER_NAME']."/index.php");
?>
<script>
    window.location.href="/";
</script>
<p>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
<td width="100%" valign="top" align="center"><font class="content">You are now loged out.<p><br></font>
<?php
Header("location: /");
?>
</td>
</tr>
</table>
<?php
}
}
$smarty->display('footer.tpl');
?>
