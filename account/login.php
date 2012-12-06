<?php
/****************************************************************/
/*                       Membership System                      */
/*                         login.php file                       */
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
?>

<?php
include("config.php");
$sql = "SELECT copyright FROM ".$table_prefix."_copyright";
$result = mysql_query($sql);

if(!$result) {
     echo "Could not select the table field copyright";
	 } else {
	 $db = mysql_connect("$dbhost", "$dbuser", "$dbpass") or die ("Could not connect to the database");
	 @mysql_select_db("$dbname", $db) or die ("Could not select the database");
	 }

while ($row = mysql_fetch_array($result)) {
$copyright = $row['copyright'];
}
?>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr>
<td width="100%" valign="top" align="center"><font class="copyright"><?=$copyright?></font></td>
</tr>
</table>
</body>
</html>