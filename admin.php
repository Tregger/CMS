<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 */
ini_set('display_errors','On');

ini_set('session.gc_maxlifetime', 1440);
$doc_root=$_SERVER['DOCUMENT_ROOT'];
require_once($doc_root.'/configs/dbconnect.php');
require_once($doc_root.'/libs/Smarty.class.php');

require_once($doc_root.'/class/auth.php');
//require($doc_root.'/func/modules.php');
  $smarty = new Smarty;
  $smarty->allow_php_templates;
  $smarty->template_dir = "./templates/backend";
require_once($doc_root.'/class/options.php');
$global_opt=new options();
$global_opt->register_globals($smarty);
//открываем сессию
session_start ();
//создаем экземпляр класса и проверяем данные пользователя с формы авторизации
$user = new users ();
//проверяем, авторизован ли пользователь
//если авторизован — выводим приветствие
if ($_SESSION['user'] != '' && !isset($_GET['make'])){
  
    if(isset($_GET['module'])){
        switch($_GET['module']){
            case "catalog":
                $smarty->assign('name', 'Каталог товаров');
                $smarty->assign('info', 'Служит для редактирования каталога товаров');
            break;
          case "pages":
                $smarty->assign('name', 'Pages and modules');
                $smarty->assign('info', 'Manage content pages and include modules to site');
            break;
            case "news":
                $smarty->assign('name', 'News');
                $smarty->assign('info', 'Manage news on the site');
            break;
         case "articles":
                $smarty->assign('name', 'Статьи');
                $smarty->assign('info', 'Служит для добавления и редактирования статей на сайте');
            break;
         case "login_users":
                $smarty->assign('name', 'Users');
                $smarty->assign('info', 'Manage users and they privelegies');
            break;
          case "coupons":
                $smarty->assign('name', 'Deals');
                $smarty->assign('info', 'Manage deals on the site');
            break;
         case "promotion":
                $smarty->assign('name', 'Coupons');
                $smarty->assign('info', 'Manage coupons for merchant on the site');
            break;
          case "categories":
                $smarty->assign('name', 'Categories');
                $smarty->assign('info', 'Manage categories for coupons');
            break;
           case "mobile_app":
                $smarty->assign('name', 'Mobile App');
                $smarty->assign('info', 'Coming Soon');
            break;
         case "options":
                $smarty->assign('name', 'Options');
                $smarty->assign('info', 'Manage global setting on the site');
            break;
          case "cities":
                $smarty->assign('name', 'City manager');
                $smarty->assign('info', 'Manage cities on the site');
            break;
          case "messages":
                $smarty->assign('name', 'Messages');
                $smarty->assign('info', 'Send message to your users');
            break;
             case "reports":
                $smarty->assign('name', 'Repots');
                $smarty->assign('info', '');
            break;
        }
        require_once($doc_root.'/class/'.$_GET['module'].'.php');
          
        require_once($doc_root.'/func/'.$_GET['module'].'.php');
        
        if(!isset($_GET['option'])){
        $smarty->assign('module', $_GET['module'].'.tpl');
        }
      $smarty->assign('cur', $_GET['module']);
    }else{

        header('Location: /admin.php?module=pages');
    }
    if(!isset($_GET['option'])){
        $smarty->display('index.tpl');
    }
}
//если не авторизован — выводим форму авторизации
else{
    $smarty->display('auth_form.tpl');
}

if(isset($_GET['make'])){
    $make=$_GET['make'];
}else{
    $make="none";
}
//если передан get — параметр make и равен auth, проверяем пользователя
if ($make == 'auth'){
    $auth_info = $user->check_usr ($_POST['name'], $_POST['pass']);
    //проверяем что вернул нам наш класс, и если массив, заисываем пользователя в сессию и выводим приветствие
    if (is_array ($auth_info)){
        $_SESSION['user'] = $auth_info['name'];
          echo "<script>window.location.href='/admin.php'</script>";
    }
}

//если передан get — параметр make и равен get_pass_form, выводим форму восстановления пароля

if ($make == 'get_pass_form'){
        $smarty->display('remind_pass.tpl');
}

//если передан get — параметр make и равен get_pass, обрабатываем восстановление пароля php
if ($make == 'get_pass'){
    $new_pass = $user->new_pass ($_POST['mail']);
    //проверяем, что вернул метод new_pass, если все ок, отсылаем новый пароль на почту
    if ($new_pass != 'not_found'){
        //подключаем libmail для отправки почты
        require_once ('/class/libmail.php');
        //создаем экземпляр класса libmail и и передаем необходимые параметры
        $m = new Mail (); // создаем экземпляр класса
        $m->From ( "no_reply@php-web.ru") ; // адрес отправителя
        $m->To ( "mail_to@site.ru") ; // адресат
        $m->Subject ( "Восстановление пароля") ; // тема письма
        $m->Body ( "Ваш новый пароль — $new_pass") ; // текст письма
        $m->Send (); //отправляем письмо
        echo "Письмо с новым паролем отравлено.";
    }

    //если mail не найден — выводим повторно форму отправки

    else{
        $smarty->display('remind_pass.tpl');
    }
}

if($make=='logout'){
    echo "<script>window.location.href='/admin.php'</script>";
     session_destroy(); 
}



            
            
?>
