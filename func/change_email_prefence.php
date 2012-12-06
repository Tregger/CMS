<?php

require($_SERVER['DOCUMENT_ROOT'].'/configs/dbconnect.php');
if (!isset($_SESSION)) session_start();
if(isset($_SESSION['userid'])){
    if(isset($_POST)){
   
        if(isset($_POST['often_alerts'])){
            $sql="update login_users set often_alerts='".mysql_real_escape_string($_POST['often_alerts'])."' where userid=".$_SESSION['userid'];
            mysql_query($sql);
        }
        if(isset($_POST['categories'])){
            $sql="update login_users set categories='".mysql_real_escape_string(json_encode($_POST['categories']))."' where userid=".$_SESSION['userid'];
            mysql_query($sql);
        }
        if(isset($_POST['email']) && $_POST['email']!="Enter your updated email address" ){
            $sql="select * from login_users where email='".$_POST['email']."'";
            $res=fetch_all($sql);
            if(count($res)==0){
                $sql="update login_users set email='".mysql_real_escape_string($_POST['email'])."' where userid=".$_SESSION['userid'];
                mysql_query($sql);
            }
        }
       // header('location: http://'.$_SERVER['SERVER_NAME']."/index.php?page=myaccount&action=email_prefence");
        echo "<script>window.location.href='/index.php?page=myaccount&action=email_prefence'</script>";
      }
}else{
    header('location: http://'.$_SERVER['SERVER_NAME']);
}
?>
