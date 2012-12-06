<?php  
 function jsOnResponse($obj)  
 {  
 echo ' 
 <script type="text/javascript"> 
 window.parent.onResponse("'.$obj.'"); 
 </script> 
 ';  
 }  
  
 $dir = '/uploads/'; // путь к каталогу загрузок на сервере  
 $name = time().$_FILES['loadfile']['name'];
 $id_block=$_POST['block'];
 echo "1: <img src='".$_FILES['loadfile']['tmp_name'].".jpg'></br>";
 echo "2: <img src='".$_FILES['loadfile']['name'].".jpg'></br>";
 $file = $dir . $name;  
 echo "<pre>";
     var_dump($_FILES['loadfile']);
 echo "</pre>";
 $success = move_uploaded_file($_FILES['loadfile']['tmp_name'], $_SERVER['DOCUMENT_ROOT'].$file);  
 jsOnResponse("{'filename':'" . $name . "', 'id_block':'".$id_block."',  'success':'" . $success . "'}");  
  
?>