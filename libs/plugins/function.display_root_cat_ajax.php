<?php

function smarty_function_display_root_cat_ajax($params, &$smarty)
{
    $sql="select * from catalog where id_p=0";
    $res_q=  mysql_query($sql);
    ?>
<script>
    function display_sub(id_sub){
        $.get('/func/display_subcat.php?id='+id_sub, function(data){
            $('#subcat').html("");
            $('#subcat').append(data);
            get_attributes();
        })
    }
     $(document).ready(function(){
         display_sub($('#cat1').val());
     });   
    
</script>
<?php
  echo "<select name='record[cat1]' id='cat1' onchange='display_sub($(this).val())' style='float:left;padding:5px;'>";  
  while ($row=  mysql_fetch_array($res_q)){
      echo "<option value='".$row['id']."'>".$row['name']."</option>";
  }
  echo "</select>";
   echo "<div id='subcat' style='float: left; margin-left: 20px;'></div>";
}



?>