<?php
/****************************************************************/
/*                       Membership System                      */
/*                        lostpw.php file                       */
/*                      (c)copyright 2003                       */
/*                     By Viper Web Design                      */
/*                 http://www.viperwebdesigns.com               */
/*                 webmaster@viperwebdesigns.com                */
/*                                                              */
/* This program is free software. You can redistrabute it and/or*/
/* modify it under the terms of the GNU General Public Licence  */
/* as published by the Free Software Foundation; either version */
/* 2 of the license.                                            */
/*                                                              */
/****************************************************************/
$doc_root=$_SERVER['DOCUMENT_ROOT'];
$host_name="http://".$_SERVER['HTTP_HOST'];
//require($doc_root.'/configs/dbconnect.php');
include "config.php";
require($doc_root.'/libs/Smarty.class.php');
$site_path="http://".$_SERVER['SERVER_NAME'];

$ip=$_SERVER['REMOTE_ADDR'];
require_once $_SERVER['DOCUMENT_ROOT']."/geolocation/SxGeo.php";
$SxGeo = new SxGeo($_SERVER['DOCUMENT_ROOT'].'/geolocation/SxGeo_GLCity.dat', SXGEO_BATCH | SXGEO_MEMORY); // Режим по умолчанию, файл бд SxGeo.dat
$city = $SxGeo->get($ip); 




  $smarty = new Smarty;
  $smarty->allow_php_templates;
  $smarty->template_dir = "../templates/";
  $smarty->assign('client_city', $city);
     $smarty->display('header_users.tpl');
        echo "<div class=\"text_content\">";
include("config.php");

$email = $_POST['email'];
$email = stripslashes($email);

if(!$email) {
     echo "You forgot to enter your email address. Please <a href='/account/lost_pw.php'>try again</a>";
   $smarty->display('footer.tpl');
     exit();
}

$sql_email_check = mysql_query("SELECT email FROM ".$table_prefix."_users WHERE email='$email'");
$email_check = mysql_num_rows($sql_email_check);

if($email_check == 0) {
         echo "No records found matching your email address. Please <a href='/account/lost_pw.php'>try again</a>";
     $smarty->display('footer.tpl');
         exit();
}

function makeRandomPassword() {
                $salt = "abchefghjkmnpqrstuvwxyz0123456789";
                srand((double)microtime()*1000000);
                $i = 0;
                while ($i <= 7) {
                       $num = rand() % 33;
                       $tmp = substr($salt, $num, 1);
                       $pass = $pass . $tmp;
                       $i++;
                 }
                 return $pass;
              }
$random_password = makeRandomPassword();
$db_password = md5($random_password);
$sql = mysql_query("UPDATE ".$table_prefix."_users SET password='$db_password' WHERE email='$email'");

$subject = "Your password at $title!";
$message = "Hi, we have reset your password.
New Password: $random_password

$site_path/login.php

Thanks
Webmaster at $title

This is an automated response, Please do not reply or it will bounce.";
mail($email, $subject, $message, "FROM: $title Webmaster< $uemail>\nX-Mailer: PHP/" .phpversion());
echo "We reset your password and emailed it too you.";
echo "</div>";
$smarty->display('footer.tpl');
?>