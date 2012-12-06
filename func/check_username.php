<?php
$doc_root=$_SERVER['DOCUMENT_ROOT'];
    require($doc_root.'/configs/dbconnect.php');

    $username="";
    $sql="";
    $result="";
    $mas=array();
    $username=$_GET['username'];
     if(isset($username) && !empty($username)){
    $sql="select COUNT(username) from login_users where username like '".$username."'";

    $result= mysql_query($sql) or die(mysql_error());
    $ret=  mysql_fetch_array($result);
    //var_dump($ret);
    if($ret["COUNT(username)"] < 1 ){
        echo "<font style='color: #398013'>Your username is available</font>";
    }else{
        echo "<font style='color: #DD4B39'>Sorry that username is already taken</font>";
    }
     }else{
         echo "<font style='color: #DD4B39'>Pleas enter username</font>";
         
     }
?>
