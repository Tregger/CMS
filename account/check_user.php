<?php

session_start(); // Start Session
include("config.php");
ini_set('display_errors','Off');
$doc_root=$_SERVER['DOCUMENT_ROOT']; 
$host_name="http://".$_SERVER['HTTP_HOST'];
//require($doc_root.'/configs/dbconnect.php');

require($doc_root.'/libs/Smarty.class.php');
$site_path="http://".$_SERVER['SERVER_NAME'];





  $smarty = new Smarty;
  $smarty->allow_php_templates;
  $smarty->template_dir = "../templates/";
  
// Convert simple variables
$username = $_POST['username'];
$password = $_POST['password'];
$add="";
if(isset($_GET['merchant'])){
    $add=" and user_level='1'";
}
if(!isset($_GET['merchant'])){
  $smarty->display('header_users.tpl');
}
 
if ((!$username) || (!$password)) {
 
   $msg= "Please enter in all the information";
   $smarty->assign('msg', $msg);
   if(isset($_GET['merchant'])){
        $smarty->display('merchant_login.tpl');
   }else{
    $smarty->display('login.tpl');
   }
   exit();
   }
   
// Convert the password to md5 hash
$password = md5($password);

// Check to make sure the user info validates in the database
$sql = "SELECT * FROM ".$table_prefix."_users WHERE email='$username' AND password='$password' AND activated='1' and blocked=0".$add;

$result = mysql_query($sql);

if (!$result) {
   $msg = "Could not select the info from the table.";
   $smarty->assign('msg', $msg);
   } else {
   $db = mysql_connect("$dbhost", "$dbuser", "$dbpass") or die ("Could not connect to the database");
   @mysql_select_db("$dbname", $db) or die ("Could not select the database");
   }
   
$login_check = mysql_num_rows($result);

if ($login_check > 0) {
     while ($row = mysql_fetch_array($result)) {
	 foreach ($row AS $key => $val) {
	 $$key = stripslashes($val);
	 }
      // Register Some session varibles
	  session_register('username');
	  $_SESSION['username'] = $username;
          	  session_register('userid');
                  
	  $_SESSION['userid'] = $userid;
	  session_register('email_addy');
	  $_SESSION['email_addy'] = $email;
	  session_register('special_user');
	  $_SESSION['user_level'] = $user_level;
	  $sql = "UPDATE ".$table_prefix."_users SET last_login=now() WHERE userid='$userid'";
	  $result = mysql_query($sql);
          echo '<script>window.location.href=" http://'.$_SERVER['SERVER_NAME'].'/"</script>';
	      
               
	  if (!$result) {
	      $msg = "Could not update the table";
              $smarty->assign('msg', $msg);
		  } else {
		  $db = mysql_connect("$dbhost", "$dbuser", "$dbpass") or die ("Could not connect to the database");
		  @mysql_select_db("$dbname", $db) or die ("Could not select the database");
		  }
   
                  
	  }
              echo '<script>window.location.href=" http://'.$_SERVER['SERVER_NAME'].'/"</script>';
	  } else {
  $msg = "You could not be logged in please check to see if you validated your account. and that your username and password are correct.";
  $smarty->assign('msg', $msg);
  if(!isset($_GET['merchant'])){  
  $smarty->display('login.tpl');
  }else{
      $smarty->display('merchant_login.tpl');
  }
}  
if(!isset($_GET['merchant'])){
  $smarty->display('footer.tpl');
}
?>
