<?php



include $_SERVER['DOCUMENT_ROOT'].'/class/libmail.php';

if(isset($_GET['name']) && $_GET['name']!="" && isset($_GET['email']) && $_GET['email']!="" && isset($_GET['message']) && $_GET['message']!=""){

$m= new Mail('UTF-8');  
$m->From( $_GET['email'] ); 
if(isset($_GET['merchant'])){
    $m->To( "support@dealhoster.com" );  
}else{
    $m->To( "support@dealhoster.com" );  
}
$m->Subject( 'Feedback from dealhoster.com' );
$body="";
$body.=$_GET['name']."<br>";
if(isset($_GET['phone']) && $_GET['phone']!=""){
    $body.="phone:".$_GET['phone']."<br>";
    
}
if(isset($_GET['email']) && $_GET['email']!=""){
    $body.="email:".$_GET['email']."<br>";
    
}
if(isset($_GET['email']) && $_GET['email']!=""){
    $body.="email:".$_GET['email']."<br>";
    
}
$body.=$_GET['message'];
$m->Body($body, 'html');
$m->Priority(4) ;	
$m->Send();	

}else{
    
}
?>
