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
     <input type="hidden" value="save" name="method" />
     <input type="hidden" value="pages" name="module" />
     <table>
         <tr>
             <td>Название(title):</td>
             <td><input type="text" name="page[name]" required id="name" onkeyup="geturl()"></td>
         </tr>
         <tr>
             <td>Текст:</td>
             <td>
                 <textarea name="page[fdescr]" ></textarea>
             </td>
         </tr>
         <tr>
             <td>Тип страницы:</td>
             <td>
                 <select name="page[type]" required>
                     {modules}
                 </select>
             </td>
         </tr>
         <tr>
             <td>Url:</td>
             <td>
                 <input type="text" name="page[url]" id='url' required></textarea>
             </td>
         </tr>

          <tr>
             <td>Keywords(meta):</td>
             <td>
                 <input type="text" name="page[meta]" ></textarea>
             </td>
         </tr>
         <tr>
             <td>Description(meta):</td>
             <td>
                <input type="text" name="page[description]" ></textarea>
             </td>
         </tr>
         <tr>
             <td>Отображать в меню:</td>
             <td>
                 <select name="page[display]">
                     <option value="yes">Отображать</option>
                       <option value="none">Не отображать</option>
                 </select>
                
             </td>
         </tr>
     </table>
     <input type="submit" value="Add Page" />
</form>