       <script src="/tinymce/jscripts/tiny_mce/plugins/tinybrowser/tb_standalone.js.php" type="text/javascript"></script>
{if $record.img}
   <img src="{$record.img}" >
   <form id="load_img" method="POST">
    <input type="hidden" name="record[id]" value="{$record.id}" />
    <input type="hidden" name="option" value="edit_img" />
    <input type="hidden" name="module" value="catalog" />
    <input type="hidden" name="method" value="delete" />
   
    <br>
    <input type="button" value="Delete this Image" onclick="document.getElementById('load_img').submit();">
    </form>
{else}
    {literal}
    <form id="load_img" method="POST">
    <input type="hidden" name="record[id]" value="{/literal}{$record.id}{literal}" />
    <input type="hidden" name="option" value="edit_img" />
    <input type="hidden" name="module" value="catalog" />
    <input type="hidden" name="method" value="save" />
    <input type="text" name="record[img]" id="img" size="80"> <input type="button" onclick="document.getElementById('img').value='';" href="javascript:{}" value="Clear"/>  <input type="button" onclick="tinyBrowserPopUp('image','img');" href="javascript:{}" value="Load"/> 
    <br>
    <input type="button" value="Save" onclick="if(document.getElementById('img').value!=''){document.getElementById('load_img').submit();}else{alert('Please choose image')}">
    </form>
    {/literal}
 {/if}