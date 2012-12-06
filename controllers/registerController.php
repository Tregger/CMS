<?php
define('FACEBOOK_APP_ID', '454206121298581');
define('FACEBOOK_SECRET', '48e47246c8cd915ba206f74ebd2cef22');

function index_action($smarty){
    if (isset ($_REQUEST['signed_request']) ) {
        if (function_exists('hash_hmac') ){
            $ip=$_SERVER['REMOTE_ADDR'];
            require_once($_SERVER['DOCUMENT_ROOT']."/geolocation/SxGeo.php");
            $SxGeo = new SxGeo($_SERVER['DOCUMENT_ROOT'].'/geolocation/SxGeo_GLCity.dat', SXGEO_BATCH | SXGEO_MEMORY); // Режим по умолчанию, файл бд SxGeo.dat
            $city = $SxGeo->get($ip); 
            $response = parse_signed_request($_REQUEST['signed_request'],FACEBOOK_SECRET);
            $name = $response["registration"]["name"];
            $firstname = $response["registration"]["first_name"];
            $lastname = $response["registration"]["last_name"];
            $email = $response["registration"]["email"];
            $password = $response["registration"]["password"];

            $gender = $response["registration"]["gender"];
            $dob = $response["registration"]["birthday"];
           // $phone = $response["registration"]["phone"];
            fb_register($firstname." ".$lastname , $password, $password, $email, $city['city'], $phone=NULL, $businessname=NULL, $website=NULL, $street=NULL, $zip=NULL, $city=NULL);
       
        }
    }else{
    $smarty->display('register.tpl');
    }
}

// No need to change function body
function parse_signed_request($signed_request, $secret) {
    list($encoded_sig, $payload) = explode('.', $signed_request, 2);

    // decode the data
    $sig = base64_url_decode($encoded_sig);
    $data = json_decode(base64_url_decode($payload), true);

    if (strtoupper($data['algorithm']) !== 'HMAC-SHA256') {
        error_log('Unknown algorithm. Expected HMAC-SHA256');
        return null;
    }

    // check sig
    $expected_sig = hash_hmac('sha256', $payload, $secret, $raw = true);
    if ($sig !== $expected_sig) {
        error_log('Bad Signed JSON signature!');
        return null;
    }

    return $data;
}

function base64_url_decode($input) {
    return base64_decode(strtr($input, '-_', '+/'));
}

function merchant_register_action($smarty){
    $smarty->display('merchant_register.tpl');
}

function fb_register($username, $password, $password2, $email, $info, $phone=NULL, $businessname=NULL, $website=NULL, $street=NULL, $zip=NULL, $city=NULL){



$doc_root=$_SERVER['DOCUMENT_ROOT'];
$host_name="http://".$_SERVER['HTTP_HOST'];
//require($doc_root.'/configs/dbconnect.php');
include $doc_root."/account/config.php";
require_once($doc_root.'/libs/Smarty.class.php');
$site_path="http://".$_SERVER['SERVER_NAME'];





  $smarty = new Smarty;
  $smarty->allow_php_templates;

  
  
if ((!$username) || (!$email) || (!$password) || (!$password2)) {
   $msg= "You did not enter in all the required fields please submit them again.<br />";
   if(!$username) {
      $msg= "Full name is a required field please fill it in again";
	  }
	if(!$email) {
	  $msg= "Email Address is a required field please submit it below";
	  }
	if(!$password) {
	   $msg= "Password is a required field please submit it below.";
	   }
	 if(!$password2) {
	    $msg= "Re-Enter is a required field Please submit it below.";
		}
                $smarty->assign('msg', $msg);
                    if(!isset($_GET['merchant'])){
                        $smarty->display('register.tpl');	
                    }else{
                       $smarty->display('merchant_register.tpl');	 
                    }
	
}

$sql = "SELECT email FROM ".$table_prefix."_users WHERE email='$email'";
$result = mysql_query($sql);

if (!$result) {
    $msg= "Could not select the table field.";
	} else {
	$db = mysql_connect("$dbhost", "$dbuser", "$dbpass") or die ("Could not connect to the database");
	@mysql_select_db("$dbname", $db) or die ("Could not select the database");
	}

$sql = "SELECT username FROM ".$table_prefix."_users WHERE username='$username'";
$result2 = mysql_query($sql);

if (!$result2) {
    $msg= "Could not select the table field.";
	} else {
	$db = mysql_connect("$dbhost", "$dbuser", "$dbpass") or die ("Could not connect to the database");
	@mysql_select_db("$dbname", $db) or die ("Could not select the database");
	}
$sql_email_check = $result;
$sql_username_check = $result2;

$email_check = mysql_num_rows($sql_email_check);
//$username_check = mysql_num_rows($sql_username_check);
$username_check = 0;
if (($email_check > 0) || ($username_check > 0)) {
     $msg= "Please fix the required fields.<br />";
	 if ($email_check > 0) {
	     $msg= "The Email address $email is in use by another user please choose a different one.<br />";
		 unset($email);
		 }
	 if ($username_check > 0) {
	      $msg= "The username $username is in use by another user please choose a different one.<br />";
		  unset($username);
		  }
//		  include("join.php");
                  $smarty->assign('msg', $msg);
                  if(!isset($_GET['merchant'])){
                  $smarty->display('register.tpl');
                  }else{
                      $smarty->display('merchant_register.tpl');
                  }
	
}

$db_password = md5($password);
$info = htmlspecialchars($info);
if(!isset($_GET['merchant'])){
    $sql = "INSERT INTO ".$table_prefix."_users (signup_date, username, email, password, info) VALUES (now(), '$username', '$email', '$db_password', '$info')";
}else{
    $sql = "INSERT INTO ".$table_prefix."_users
        (signup_date, username, email, password, info, phone, businessname, website, street, zip, city, user_level)
        VALUES (now(), '$username', '$email', '$db_password', '$info', '$phone', '$businessname', '$website', '$street', '$zip', '$city', '1')";  
}

$result = mysql_query($sql);

if (!$result) {
    $msg= "Could not insert the information into the table fields.";
	} else {
	$userid = mysql_insert_id();
	       
	$subject = "Your membership at $title";
	$message = "Dear $username, 
	            
				Thank you for regestering at our website, $site_path !
				
				To activate your account please click the link below.
				
				$site_path/account/activate.php?id=$userid&code=$db_password
				
				once you activate your account you may login here $site_path/index.php?page=login with the information below
				
				$username
				$password
				
				Thanks webmaster at $title
				
				This is an automated response please do not reply or it will bounce!";
				
				mail($email, $subject, $message, "From:$title Webmaster<$uemail>\nnX-Mailer: PHP/".phpversion());
				$msg= "Your information has been sent to $email. Please follow the instructions in it to activate your account.";
				}
                                

                                echo "<div class=\"text_content\">".$msg."</div>";
                                
                               $smarty->display('footer.tpl');
  

}
?>
