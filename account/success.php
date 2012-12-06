<?php
/****************************************************************/
/*                       Membership System                      */
/*                       success.php file                       */
/*                      (c)copyright 2003                       */
/*                     By Viper Web Design                      */
/*                 http://www.viperwebdesigns.com               */
/*                 webmaster@viperwebdesigns.com                */
/*                                                              */
/* This program is free software. You can redistrabute it and/or*/
/* modify it under the terms of the GNU General Public Licence  */
/* as published by the Free Software Foundation; either version */
/* 2 of the license.                                            */
/*                                                              */
/****************************************************************/
session_start();
include("config.php");
?>
<html>
<!-- Creation date: 8/30/2003 -->
<head>
<title><?=$title?></title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="ttdown.com">
<meta name="generator" content="AceHTML 5 Pro">
<link rel="stylesheet" href="style/style.css" type="text/css">
</head>
<body>


<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
<td width="100%" valign="top" align="center"><font class="content">Welcome <?=$_SESSION['username']?><P>You have made it to the members area.<br>Your user level is <?=$_SESSION['user_level']?> Which enables you access to the following areas.<br><?php if($_SESSION['user_level'] == 0) { ?>Forums<br>Chatroom<?php } ?> <?php if($_SESSION['user_level'] == 1) { ?>Forums<br>Chatroom<br>Moderator Area<?php } ?><p><a href="logout.php">Logout</a></font></td>
</tr>
</table>
</body>
</html>