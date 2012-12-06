<?php

function index_action($smarty){
    $smarty->display('login.tpl');
}

function merchant_login_action($smarty){
    $smarty->display('merchant_login.tpl');
    
}
function fb_login_action($smarty){
    
   $app_id = "454206121298581";
   $app_secret = "48e47246c8cd915ba206f74ebd2cef22";
   $my_url = "http://dealhoster.com/index.php?page=login&action=fb_login";

   session_start();
   $code = $_REQUEST["code"];

   if(empty($code)) {
     $_SESSION['state'] = md5(uniqid(rand(), TRUE)); //CSRF protection
     $dialog_url = "http://www.facebook.com/dialog/oauth?client_id=" 
       . $app_id . "&redirect_uri=" . urlencode($my_url) . "&state="
       . $_SESSION['state']."&scope=email,user_birthday,read_stream";

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
     if($user && !empty($user) && $user != Null){
     $sql="select * from login_users where email='".$user->email."'";
     $res=fetch_all($sql);
     if(count($res)>0){
       
        session_register('fb_login');
        $_SESSION['fb_login']='true';
        session_register('userid');
        $_SESSION['userid']=  $res[1]['userid'];
           session_register('username');
        $_SESSION['fb_login']=$res[1]['username'];
     }else{
       
         session_unregister('fb_login');
         session_unregister('username');
         session_unregister('userid');
       session_register('fb_login');
        $_SESSION['fb_login']='true';
            session_register('username');
        $_SESSION['fb_login']=$user->name;

        $sql = "INSERT INTO login_users (signup_date, username, email, password, info) VALUES (now(), '".$user->name."', '".$user->email."', '".$db_password."', '".$user->location->name."')";
        mysql_query($sql);
        session_register('userid');
        $_SESSION['userid']=  mysql_insert_id();
     }
     
  
 header('location: /');
    
     //echo("Hello " . $user->name);
     //echo("<script> top.location.href='/'</script>");
     }
   }
   else {
     echo("<br><br><br><br>Facebook login service temporarily unavailable. Please try again.<br><br><br><br>");
   }
}
?>
