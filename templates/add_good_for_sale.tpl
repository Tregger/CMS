<div class="site_header2" style="height:0px!important;">

				<div method="POST" action="" class="menu5">
					<ul class="items">
						<li class="active">
							<a href="">
								Activity
							</a>
						</li>
						<li>
							<a href="/index.php?page=mynorshin&action=inbox">
								Messages
							</a>
							<span class="messages_num">
								{if $message_count!=0}({$message_count}){/if}
							</span>
						</li>
						<li>
							<a href="/">
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
<br>
<script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript" src="/tinymce/jscripts/tiny_mce/plugins/tinybrowser/tb_tinymce.js.php"></script>
		<link href="/css/bootstrap.css" media="screen" rel="stylesheet" type="text/css">
	<script src="/js/bootstrap.js"></script>

<script>
     $('#myTab a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
    })
</script>
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
        
        function add_fields(){
        
        }
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
<form method="post" action="/index.php?page=mynorshin&action=add_product" enctype="multipart/form-data">
    <input type="hidden" name="record[type]" value="{$tip}" />
    <input type="hidden" name="option" value="add" />
    <input type="hidden" name="module" value="catalog" />
    <input type="hidden" name="method" value="save" />
    <ul id="myTab" class="nav nav-tabs">
<li class="active">
<a data-toggle="tab" href="#main_info">General Info</a>
</li>
<li>
<a data-toggle="tab" href="#add_info">Additional info</a>
</li>
</ul>
    <div class="tab-content">
<style>
        #main_info table td{
            padding:5px;
        }
                #main_info table td table td{
            padding:0;
        }
</style>
        <div id="main_info" class="tab-pane active">

  <table style="padding: 10px;">
        <tr>
            <td>
                Name: 
            </td>
            <td>
                <input type="text" id="name" name="record[name]" onkeyup="geturl()" style="padding:5px;"/>
            </td>
        </tr>
        <tr>
            <td>
                Parent category:

                    
            </td>
            <td>
                                <div class="root_categories">
                        {display_root_cat_ajax}
                </div>
            </td>
        </tr>
        <tr>
            <td>
               Short description:
            </td>
            <td>
                <textarea name="record[sdesc]" style="padding:5px;"></textarea>
            </td>
        </tr>
        {if $tip ne "cat"}
        <tr>
            <td>
               Full description:
            </td>
            <td>
                <textarea name="record[fdesc]" style="padding:5px;"></textarea>
            </td>
        </tr>
        {/if}
        <tr>
            <td>
               Url
            </td>
            <td>
                <input type="text" id="url" name="record[url]" style="padding:5px;" readonly=""  />
            </td>
        </tr>
        {if $tip ne "cat"}
        <tr>
            <td>
               Price
            </td>
            <td>
                <input type="text" name="record[price]" style="padding:5px;" />
            </td>
        </tr>
        {/if}

    </table>
</div>

<div id="add_info" class="tab-pane">
    <h2>Images for this good</h2><br>
    <table>
       <tr class="tr">

                <td class="td"><input name="userfile[]" type="file" class="multi" maxlength="4" accept="gif|jpg|png"/></td>
            </tr>
    </table>        
    <br><br>
    <h2>Attributes for this good</h2><br>
    <input type="button" value="Refresh attributes" style="padding:5px;" onclick="get_attributes()">
    <br><br>
    <div id="attributes">
        
    </div>
</div>
      
</div>
    <br>
        <input type="submit" class="register_button" style="padding:5px;" value="{if $tip eq 'cat'}Add category{else}Add record{/if}">
    <br><br>
</form>
        
{literal}        
<script>
    function get_attributes(){
        $.get('/func/ajaxfunc.php?option=get_html_attributes&cat1='+$('#cat1').val()+'&cat2='+$('#cat2').val(), function(data){
        $('#attributes').html("");
        $('#attributes').append(data);
});
    }
        
    $(document).ready(function(){
        get_attributes();
      });
    
</script>
{/literal}