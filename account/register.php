<?php

ini_set('display_errors','Off');
$doc_root=$_SERVER['DOCUMENT_ROOT'];
$host_name="http://".$_SERVER['HTTP_HOST'];
//require($doc_root.'/configs/dbconnect.php');
include "config.php";
require_once($doc_root.'/libs/Smarty.class.php');
$site_path="http://".$_SERVER['SERVER_NAME'];





  $smarty = new Smarty;
  $smarty->allow_php_templates;
  $smarty->template_dir = "../templates/";
  $err=false;

  if(isset($_POST['record'])){
   if(!isset($_GET['merchant'])){
    $smarty->display('header_users.tpl');
   }
$username = addslashes($_POST['record']['username']);
$password = $_POST['record']['password'];
$password2 = $_POST['record']['password2'];
$email = addslashes($_POST['record']['email']);
$info = addslashes($_POST['record']['info']);
$phone = addslashes($_POST['record']['phone']);
$businessname = addslashes($_POST['record']['businessname']);
$website = addslashes($_POST['record']['website']);
$street = addslashes($_POST['record']['street']);
$zip = addslashes($_POST['record']['zip']);
$city = addslashes($_POST['record']['city']);



$username = stripslashes($username);
$email = stripslashes($email);
$info = stripslashes($info);

if ((!$username) || (!$email) || (!$password) || (!$password2)) {
   $msg= "You did not enter in all the required fields please submit them again.<br />";
   $err=true;
   if(!$username) {
      $msg= "Full name is a required field please fill it in again";
      $err=true;
	  }
	if(!$email) {
	  $msg= "Email Address is a required field please submit it below";
           $err=true;
	  }
	if(!$password) {
	   $msg= "Password is a required field please submit it below.";
            $err=true;
	   }
	 if(!$password2) {
	    $msg= "Re-Enter is a required field Please submit it below.";
             $err=true;
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
     $err=true;
	} else {
	$db = mysql_connect("$dbhost", "$dbuser", "$dbpass") or die ("Could not connect to the database");
	@mysql_select_db("$dbname", $db) or die ("Could not select the database");
	}

$sql = "SELECT username FROM ".$table_prefix."_users WHERE username='$username'";
$result2 = mysql_query($sql);

if (!$result2) {
    $msg= "Could not select the table field.";
     $err=true;
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
      $err=true;
	 if ($email_check > 0) {
	     $msg= "The Email address $email is in use by another user please choose a different one.<br />";
		 $err=true; 
             unset($email);
		 }
	 if ($username_check > 0) {
	      $msg= "The username $username is in use by another user please choose a different one.<br />";
		  unset($username);
                   $err=true;
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
     $err=true;
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
				if(!$msg){
                                    $msg= "Your information has been sent to $email. Please follow the instructions in it to activate your account.";
				
                                }
                                }
                                

//    echo "<br>";
//  echo $msg;
//    echo "<br>";
                                if(!$err &&  isset($_GET['merchant'])){
                                 ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" SYSTEM "http://www.w3.org/TR/xhtml1/dtd/xhtml1-transitional.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
<title>Deal Hoster</title>   
<LINK href="/css/style_merchant_signup.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=454206121298581";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <form method="POST" action="/account/register.php?page=register&action=merchant_register&merchant=true" name="join" >
        <input type="hidden" name="record[user_level]" value="1" />
<div class="wrapperBlockLogin">
	<div class="headerBlockLogin">
		<div class="headerContLogin">
			<div class="logoBlock">
			<a href class="logoAccountLoginSign"></a>
			</div>
			<div class="merchantCenterSign">
				<h1>merchant<span>center</span></h1>
				<p>discover what's better</p>
			</div>
			<div class="headMenu">
				<a href="/index.php?page=merchant-intro">How it <span>Works</span></a>
				<a href="/index.php?page=about-us">About <span>us</span></a>
				<a href="/index.php?page=contact-us">Contact <span>us</span></a>
			</div>
			<div class="getStarted">
				<input type="button" onclick="window.location.href='/index.php?page=register&action=merchant_register&merchant=true'">
				<p>or</p>
				<a href="/index.php?page=login&action=merchant_login&merchant=true">sign in</a>
			</div>
			<img src="/img/headshadow.png"/>
		</div>
	</div>
	<div class="contBlockLogin">
		<div class="leftShad"></div>
		<div class="rightShad"></div>
                <div class="createYourAccountSign">
                <?php
                                echo "<div class=\"text_content\" style=\"padding:0 30px\">".$msg."</div>";
                                ?>
                    </div>
                </div>
                <div class="footerBlockLogin" >
		<div class="footerBlockContLogin">
			<div class="footerEmpty">
			</div>
			<div class="footerContLogin">
				<div class="company">
					<h1>Company</h1>
					<a href="/index.php?page=about-us">About Us</a><br/>
					<a href="/index.php?page=contact-us">Contact Us</a>
				</div>
				<div class="merchantSolutions">
					<h1>Merchant Solutions</h1>
					<a href="/index.php?page=merchant-support">Merchant support</a><br/>
					<a href="/index.php?page=terms">Terms of services</a><br/>
					<a href="/index.php?page=privacy">Privacy policy</a>
				</div>
				<div class="howItWorksLogin">
					<h1>How it works</h1>
					<a href="/index.php?page=merchant-intro">Overview</a><br/>
					<a href="/index.php?page=register&action=merchant_register&merchant=true">Getting started</a><br/>
				</div>
				<div class="clippingRequired">
					<div class="likeBlock">
						<div class="fb-like" data-href="http://dealhoster.com" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>
					</div>
					<div class="followBlock">
									    <a href="https://twitter.com/dealhoster" class="twitter-follow-button" data-show-count="false" data-lang="en">Follow @dealhoster</a>
{literal}
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
{/literal}	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
        </form>
</body>
</html>
                <?php
                                
                                }
                                 if(!isset($_GET['merchant'])){
                                       
                                echo "<div class=\"text_content\" style=\"padding:35px; text-align: center;\">".$msg."</div>";
                               
                               $smarty->display('footer.tpl');
                                 }
  }else{
      
         if(!isset($_GET['merchant'])){
    $smarty->display('header_users.tpl');
   }
     if(!isset($_GET['merchant'])){
                  $smarty->display('register.tpl');
                  }else{
                      $smarty->display('merchant_register.tpl');
                  }
         if(!isset($_GET['merchant'])){
                               $smarty->display('footer.tpl');
                                 }
  }
?>