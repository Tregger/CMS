
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
</script>

<div class="page_articles">
					<div class="products_categories">
						<h3 class="h3">
							Add Review
						</h3>
						<p class="article_content">
						<form method="post" action="/index.php?page=reviews&action=add_save">
                                                        <input type="hidden" name="review[what]" value="{$what}">
                                                        <input type="hidden" name="review[who]" value="{$who}">
                                                        <input type="hidden" name="review[product]" value="{$product}">
                                                         <input type="hidden" name="review[user]" value="{$user}">
                                                        <table class="rating_add">
                                                            <tr>
                                                                <td><strong>Your rating</strong></td>
                                                                <td>
                                                                    <select name="review[rating]">
                                                                        <option value="1">1</a>
                                                                        <option value="2">2</a>
                                                                        <option value="3">3</a>
                                                                        <option value="4">4</a>
                                                                        <option value="5">5</a>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                                <tr>
                                                                <td><strong>Your comment</strong></td>
                                                                <td><textarea name="review[comment]"></textarea>
                                                                </tr>
                                                                 <tr>
                                                                     <td>&nbsp;</td>
                                                                     <td>
                                                                         <input type="submit" class="register_button" value="Add Review">
                                                                         <input type="button" class="register_button" value="Cancel" onclick="window.history.back();">
                                                                     </td>
                                                                 </tr>
                                                        </table>
                                                       
                                                </form>
						</p>
					</div>
				</div>
                                               