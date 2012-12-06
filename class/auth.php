<?php

// Класс авторизации на php
class users {
    // Функция проверки логина и пароля
    function check_usr ($usr_name,$usr_pass){
        $pass = md5 ($usr_pass);

        $sql = "SELECT * FROM users_admin WHERE name='$usr_name' AND pass='$pass'"; //sql запрос
        $usr_query = mysql_query ($sql);
        $usr_row = mysql_fetch_array ($usr_query);
        // Если пользователь найден, возвращаем его данные
        if ($usr_row['name']!=''){
          return $usr_row;
        }else{
            return 'not_found ';
        }
    }

// Функция создания нового пароля (при восстановлении)
function new_pass($usr_mail){
$pass_val = rand(10000,99999); // Генерируем 5-ти значный числовой пароль
$pass = md5($pass_val); // Шифруем пароль для записи в БД
$sql = "SELECT * FROM users_admin WHERE mail='$usr_mail'"; //sql запрос на получение инфы пользователя по email
$usr_query = mysql_query ($sql);
$usr_row = mysql_fetch_array ($usr_query);
// Если пользователь найден, пишем новый пароль в бд и возвращаем данные
if ($usr_row['name'] != ''){
$sql = "UPDATE users_admin SET pass='$pass' WHERE mail='$usr_mail'"; //sql запрос на смену email пользователя
return $pass_val;
}
//в противном случае, возвращаем информацию об ошибке
else{
return 'not_found';
}
}
}
?>
