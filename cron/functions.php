<?php
/* do expiried deals as drafts */
  $host='localhost';
        $username='sluxenty_hoster';
        $pass='QU!SUnC8JV{T'; 
        $db='sluxenty_dealhoster_new';
        $connect_link=mysql_connect ($host, $username, $pass); //подключаемся к серверу MySQL
        if(!$connect_link){die("Не удалось подключиться к выбранному хосту проверьте параметры подключения");}
        if(!mysql_select_db($db)){die("Неправильная БД");};
        mysql_query('SET NAMES UTF8 COLLATE utf8_general_ci');
        $dsn="mysql:dbname=".$db.";host=".$host;
//echo $_SERVER['DOCUMENT_ROOT'];
$sql="update coupons set status='drafts' where st_day + ( 86400 * day_col )<".time();
mysql_query($sql);

$sql="Delete from coupons where UNIX_TIMESTAMP(now()) - st_day + ( 86400 * day_col )>2592000";
mysql_query($sql);

?>
