<?php

/*
 *Конекты к базе данных!
 * 
 */
require($_SERVER['DOCUMENT_ROOT'].'/class/abstract_model.php');
        $host='';
        $username='';
        $pass=''; 
        $db='';
        $connect_link=mysql_connect ($host, $username, $pass); //подключаемся к серверу MySQL
        if(!$connect_link){die("Не удалось подключиться к выбранному хосту проверьте параметры подключения");}
        if(!mysql_select_db($db)){die("Неправильная БД");};
        mysql_query('SET NAMES UTF8 COLLATE utf8_general_ci');
        $dsn="mysql:dbname=".$db.";host=".$host;
        

        function fetch_all($query){
            $mas= array();
            $k=0;
            $v=0;
            $i=0;
            $mas2= array();
            if($query_res=  mysql_query($query)){
                
            }else{
                die(mysql_error());
           };
           
           
            while ($row = mysql_fetch_array($query_res, MYSQL_ASSOC)) {
                $i++;
                foreach($row as $k=>$v){
                    $mas2[$k]=$v;
                }
                $mas[$i]=$mas2;
                unset($mas2);
            }

            return $mas;
        }
        
?>
