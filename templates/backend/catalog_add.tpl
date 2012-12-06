    <script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript" src="/tinymce/jscripts/tiny_mce/plugins/tinybrowser/tb_tinymce.js.php"></script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		plugins : "autolink,lists,pagebreak,style,layer,table,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave,visualblocks",

		// Theme options
		theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
		theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
		theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft,visualblocks",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,
                file_browser_callback : "tinyBrowser",	
		// Example content CSS (should be your site CSS)
		content_css : "css/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "lists/template_list.js",
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",
		media_external_list_url : "lists/media_list.js",


		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
              {literal}
        
        function geturl(){
                $k=document.getElementById('name').value;
                 //   alert($k);
                 $.get("/func/ajaxfunc.php?option=get_url&url="+$k, function(data){
                    document.getElementById('url').value=data;
                });
                
        };
            {/literal}
</script>
<form method="post">
    <input type="hidden" name="record[type]" value="{$tip}" />
    <input type="hidden" name="option" value="add" />
    <input type="hidden" name="module" value="catalog" />
    <input type="hidden" name="method" value="save" />
    <table>
        <tr>
            <td>
                Название: 
            </td>
            <td>
                <input type="text" name="record[name]" id="name" onkeyup="geturl()"/>
            </td>
        </tr>
        <tr>
            <td>
                Родительская категория:
            </td>
            <td>
                {include file='catalog_list_add.tpl'} 
            </td>
        </tr>
        <tr>
            <td>
               Краткое описание:
            </td>
            <td>
                <textarea name="record[sdesc]" ></textarea>
            </td>
        </tr>
        {if $tip ne "cat"}
        <tr>
            <td>
               Полное описание:
            </td>
            <td>
                <textarea name="record[fdesc]"></textarea>
            </td>
        </tr>
        {/if}
        <tr>
            <td>
               Url
            </td>
            <td>
                <input type="text" name="record[url]" id="url"/>
            </td>
        </tr>
        {if $tip ne "cat"}
        <tr>
            <td>
               Цена
            </td>
            <td>
                <input type="text" name="record[price]" />
            </td>
        </tr>
          <tr>
            <td>
               Производитель
            </td>
            <td>
                <select name="record[prod]" >
                    {display_producers_select}
                </select>
            </td>
        </tr>
                 <tr>
            <td>
               Вид топлива
            </td>
            <td>
                <select name="record[vid]" >
                    <option value="Дровяные" {if $record.vid=='Дровяные'}selected{/if}>Дровяная</option>
                    <option value="Газовые" {if $record.vid=='Газовые'}selected{/if}>Газовая</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
              Объем отапливаемого помещения
            </td>
            <td>
              <input type="text" name="record[ob]" value="{$record.ob}">
            </td>
        </tr>
         <tr>
            <td cospan="2"><h2>Информация о размерах</h2></td>
        </tr>
        <tr>
            <td>Глубина</td>
            <td><input type="text" name="record[glubina]" value="{$record.glubina}"></td>
        </tr>
           <tr>
            <td>Ширина</td>
            <td><input type="text" name="record[shirina]" value="{$record.shirina}"></td>
        </tr>
           <tr>
            <td>Высота</td>
            <td><input type="text" name="record[visota]" value="{$record.visota}"></td>
        </tr>
           <tr>
            <td>Диаметр дымохода</td>
            <td><input type="text" name="record[diam_dimohod]" value="{$record.diam_dimohod}"></td>
        </tr>
           <tr>
            <td>Масса печи</td>
            <td><input type="text" name="record[massa_pechi]" value="{$record.massa_pechi}"></td>
        </tr>
           <tr>
            <td>Масса камней</td>
            <td><input type="text" name="record[massa_kamnei]" value="{$record.massa_kamnei}"></td>
        </tr>
           <tr>
            <td>Встроенный бак</td>
            <td><input type="text" name="record[vstroenniy_bak]" value="{$record.vstroenniy_bak}"></td>
        </tr>
           <tr>
            <td>Встроенный теплообменник</td>
            <td><input type="text" name="record[vstroenniy_teploobmennik]" value="{$record.vstroenniy_teploobmennik}"></td>
        </tr>
           <tr>
            <td>Материал топки</td>
            <td><input type="text" name="record[material_topki]" value="{$record.material_topki}"></td>
        </tr>
           <tr>
            <td>Тип каменки</td>
            <td><input type="text" name="record[tip_kamenki]" value="{$record.tip_kamenki}"></td>
        </tr>
           <tr>
            <td>Тип кожуха печи</td>
            <td><input type="text" name="record[tip_kozuha]" value="{$record.tip_kozuha}"></td>
        </tr>
        <tr>
            <td colspan=2>Пометить, что товар находится на распродаже </td>
           </tr>
           <TR>
            <td colspan=2><input type="checkbox" name="record[actia]" value="1">
        </tr>
         <tr>
            <td colspan=2>Пометить, что товар является новинкой </td>
           </tr>
           <TR>
            <td colspan=2><input type="checkbox" name="record[hit]" value="1">
        </tr>
        {/if}
        <tr>
            <td colspan="2"><input type="submit" value="{if $tip eq 'cat'}Добавить категорию{else}Добавить запись{/if}"></td>
        </tr>
    </table>
</form>
        
        
