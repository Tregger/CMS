<?php
$doc_root=$_SERVER['DOCUMENT_ROOT'];
$host_name="http://".$_SERVER['HTTP_HOST'];
require($doc_root.'/configs/dbconnect.php');
$id_p=$_GET['id'];
$sql="select * from catalog where id_p=$id_p";
$res_q=  mysql_query($sql);
$k=mysql_num_rows($res_q);
if($res_q && $k>0){
 echo "<select id='cat2' name='record[cat2]' style='padding:5px;'>";  
  while ($row=  mysql_fetch_array($res_q)){
      echo "<option value='".$row['id']."'>".$row['name']."</option>";
  }
  echo "</select>";
}
?>
