<?php
function smarty_function_fb_login($params, &$smarty)
{
    

   $app_id = "454206121298581";
   $app_secret = "48e47246c8cd915ba206f74ebd2cef22";
   $my_url = "http://dealhoster.com/";

   session_start();
   $code = $_REQUEST["code"];

   if(empty($code)) {
     $_SESSION['state'] = md5(uniqid(rand(), TRUE)); //CSRF protection
     $dialog_url = "http://www.facebook.com/dialog/oauth?client_id=" 
       . $app_id . "&redirect_uri=" . urlencode($my_url) . "&state="
       . $_SESSION['state'];

     echo("<script> top.location.href='" . $dialog_url . "'</script>");
   }

   if($_SESSION['state'] && ($_SESSION['state'] === $_REQUEST['state'])) {
     $token_url = "https://graph.facebook.com/oauth/access_token?"
       . "client_id=" . $app_id . "&redirect_uri=" . urlencode($my_url)
       . "&client_secret=" . $app_secret . "&code=" . $code;

     $response = file_get_contents($token_url);
     $params = null;
     parse_str($response, $params);

     $graph_url = "https://graph.facebook.com/me?access_token=" 
       . $params['access_token'];

     $user = json_decode(file_get_contents($graph_url));
     session_register($userid);
     $_SESSION['userid']=time();
     //echo("Hello " . $user->name);
   }
   else {
     echo("The state does not match. You may be a victim of CSRF.");
   }



}
?>
