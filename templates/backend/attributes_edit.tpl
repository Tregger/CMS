<script src="/media/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script>
    function add_attr_line(){
        last = $('table tr:last-child td input').attr('id');
        last_numb=last.split('_');
        last_numb=last_numb[1];
        last_numb++;
        add="<tr><td>Name:</td><td><input type='text' name='attributes[name"+last_numb+"]' id='name_"+last_numb+"' value=''  required></td><td>Values ​​separated by semicolons:</td><td><textarea name='attributes[values"+last_numb+"]' id='val_"+last_numb+"' value=''  required></textarea></td><td>Type:</td><td><select name='attributes[type"+last_numb+"]'><option value='textarea'>TextArea</option><option value='select'>Select</option><option value='input' selected='selected'>Input</option><option value='radio'>Radio</option></select></td></tr>";
        $('#new_atr').append(add);
    }
</script>

<form method="post">
     <input type="hidden" value="save" name="method" />
     <input type="hidden" value="attributes" name="module" />
     <input type="hidden" value="edit" name="option" />
      <input type="hidden" value="{$category}" name="attributes[id]" />
      {if $attrs}
          <h2>Added Attributes</h2>
      <table border="1" cellpadding="10">
          <tr>
                <td>Name</td>
                <td>Values</td>
                <td>Type</td>
                <td></td>
            </tr>
      {foreach from=$attrs item=item}
            <tr>
                <td>{$item.name}</td>
                <td>{$item.values}</td>
                <td>{$item.type}</td>
                <td><a href="/admin.php?module=attributes&option=delete&id={$item.id}">Delete</a></td>
            </tr>
      {/foreach}
      </table>
           <hr>
      {/if}
      <h2>Add Attribute</h2>
     <table id="new_atr">
         <tr>
             <td>Name:</td>
             <td><input type="text" name="attributes[name1]" id="name_1" value="{$page.name}"  required></td>
             <td>Values ​​separated by semicolons:</td>
             <td><textarea name="attributes[values1]" id="val_1" value="{$page.name}"  required></textarea></td>
             <td>Type:</td>
             <td>
                 <select name="attributes[type1]">
                     <option value="textarea"  >TextArea</option>
                     <option value="select">Select</option>
                     <option value="input" selected="selected">Input</option>
                     <option value="radio">Radio</option>
                 </select>
             </td>
         </tr>
        
     </table>
             <a href="javascript:void(0)" onclick="add_attr_line()">Add other attribute</a>
     <input type="submit" value="Save Atributes" />
</form>