
<? 
/* Account activation script */ 
// Get database connection 
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
// Create variables from URL. 
$userid = $_REQUEST['id']; 
$code = $_REQUEST['code']; 
$sql = mysql_query("UPDATE ".$table_prefix."_users SET activated='1' WHERE userid='$userid' AND password='$code'"); 
$sql_doublecheck = mysql_query("SELECT * FROM ".$table_prefix."_users WHERE userid='$userid' AND password='$code' AND activated='1'"); 
$doublecheck = mysql_num_rows($sql_doublecheck); 
if($doublecheck == 0){ 
    echo "<strong><font class=content>Your account could not be activated!</font></strong>"; 
} elseif ($doublecheck > 0) { 
    echo "<strong>Your account has been activated!</strong><br /> You may login below!<br />"; 
   $smarty->display('login.tpl');
} 
$smarty->display('footer.tpl');
?> 
