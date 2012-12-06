<?php
if(isset($_POST['sbm'])){
    require_once $_SERVER['DOCUMENT_ROOT'].'/configs/dbconnect.php';
    $sql="insert into messages(id_who, id_whom,	subject, text, date, `read`, whom)
          values('".$_POST['from']."', '".$_POST['to']."', '".$_POST['subject']."', '".$_POST['text']."', now(), 0, 'private')
";
    echo $sql;
   if(mysql_query($sql)){
        echo '<h1>Your message has been sent</h1>';
   }else{
       die(mysql_errno());
   }
}else{
    ?>

<form method="POST">
    <input type="hidden" name="sbm" value="1" />
    <input type="hidden" name="to" value="<?=$_GET['to']; ?>" />
    <input type="hidden" name="from" value="18">
    <table>
        <tr>
            <td>Enter subject</td>
        </tr>
         <tr>
            <td><input type="text" name="subject"></td>
        </tr>
         <tr>
            <td>Enter your message</td>
        </tr>
        <tr>
            <td><textarea name="text" width="300"></textarea></td>
        </tr>
        <tr>
            <td><input type="submit" value="Send Message"></td> 
        </tr>
    </table>
</form>
    <?php
}
?>
