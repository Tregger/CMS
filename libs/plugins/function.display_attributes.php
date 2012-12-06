<?php

function smarty_function_display_attributes($params, &$smarty)
{
    require $_SERVER['DOCUMENT_ROOT'].'/class/attributes.php';
    $id=$params['product'];
    $attr=new attributes;
    $attributes=$attr->get_attributes_by_product($id);
   
    echo "<tr>";
    $i=0;
    foreach($attributes as $attribute){
    echo '<td class="td">';
           echo $attribute['name'];
    echo '</td>';
    echo '<th class="td">';
            echo $attribute['val'];
    echo '</th>';
    
    if($i%4){
        $i=0;
        echo "</tr><tr>";
    }
    
    }
echo '</tr>';

}



?>