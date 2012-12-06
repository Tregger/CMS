
<script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript" src="/tinymce/jscripts/tiny_mce/plugins/tinybrowser/tb_tinymce.js.php"></script>
<script type="text/javascript" src="/js/highslide-with-html.min.js"></script>
<script type="text/javascript" src="/js/hs_config.js"></script>
<script type="text/javascript" src="/media/js/jquery-ui.js"></script>
<link href="/media/css/themes/smoothness/jquery-ui-1.7.2.custom.css" media="screen" rel="stylesheet" type="text/css">
 
 <style type="text/css" media="screen">
			@import "/js/highslide.css";
		</style>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		plugins : "autolink,lists,pagebreak,style,layer,table,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave,visualblocks",

		// Theme options
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull",
		theme_advanced_buttons2 : "bullist,numlist,|,undo,redo,|,link,unlink,image,cleanup,code,|,forecolor",
		//theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
		//theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft,visualblocks",
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
        $(document).ready(function(){
            $("#select_user").click(function(){
                $("#dialog").dialog({
title: "Warning!!!",    //тайтл, заголовок окна
width:450,              //ширина
height: 300,            //высота
modal: true,            //true -  окно модальное, false - нет
buttons: {
"Добавить текст в окно": function() { $("#dialog").text("опа! текст!"); },
"Close": function() { $(this).dialog("close"); }
}
});
            });
        })
</script>
<div id="dialog">
    
    sdafasdfasdfasdf asdf 
</div>

<div class="site_header2" style="height:0px!important;">

				<div method="POST" action="" class="menu5">
					<ul class="items">
						<li class="active">
							<a href="">
								Activity
							</a>
						</li>
						<li>
							<a href="">
								Messages
							</a>
							<span class="messages_num">
								{if $message_count!=0}({$message_count}){/if}
							</span>
						</li>
						<li>
							<a href="">
								Account
							</a>
						</li>
					</ul>
				</div>
				<div class="total_members">
					<span class="num">
						Total members: 83233
					</span>
					<span class="online_num">
						(8)
					</span>
					<br>
					<span class="date">
						18.01.2012
					</span>
				</div>
			</div>

<div class="page_my_cabinet">
					<div class="column">
						{display_dashboard_menu}
					</div>
					<div class="column2">
						<ul class="navigation_chain2">
							<li>
								Home /
							</li>
							<li>
								Send Message
							</li>
						</ul>
						<h3 class="heading h3">
							Send Message
						</h3>

						<div class="clearfix2">
							<span></span>
						</div>
                                            <form class="authorization" method="POST" >
                                                <input type="hidden" name="option" value="1">
                                            <div class="authorization_panel">
                                            
                                                <table>
                                                    <tr class="tr">
                                                        <td>
                                                            To
                                                        </td>
                                                        <td>
                                                            <input type="text" name="message[whom]" class="input3">
                                                            
                                                           <!--  <input type="button" class="register_button" id="select_user" value="Select from site users" > -->
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr class="tr">
                                                        <td>
                                                            Subject
                                                        </td>
                                                        <td>
                                                            <input type="text" name="message[subject]" class="input3">
                                                        </td>
                                                        
                                                    </tr>
                                                    
                                                    <tr class="tr">
                                                        <td style="vertical-align:top;">
                                                            Message:
                                                        </td>
                                                        <td style="display: block; width: 63%;">
                                                            <textarea name="message[message]" style="border: none!important;">

                                                            </textarea>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td><input type="submit" class="register_button" value="Send Message"></dt>
                                                    </tr>
                                                </table>
                                            
						</div>
						</form>
	
                                            <div class="clearfix" style="height:20px;">
                                            
					</div>
				</div>