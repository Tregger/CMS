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

</script>

<script>
    function update_option(value, option){
        if(option!=6){
        $.get('/func/ajaxfunc.php?option=change_option&id='+option+'&value='+value);
        }else{
       $.get('/func/ajaxfunc.php?option=change_option&id='+option+'&value='+tinyMCE.get('6').getContent()); 
        }
    }
    
</script>

<table border="1" cellspacing="1" cellpadding="10">
    <tr>
        <td>Parameter</td>
        <td>Value</td>
        <td>global var name for the template</td>
    </tr>
{foreach from=$options item=item}
    
<tr>
    <td>{$item.name}</td>
    
    <td>
        {if $item.var_name eq 'ads_text' or $item.var_name eq 'merchant_title_text' or $item.var_name eq 'ads_prebutton_text'}
             <form action="/func/ajaxfunc.php?option=change_option&id={$item.id}" enctype="multipart/form-data" method="POST">
            <textarea type="text" name="{$item.id}"  id="{$item.id}" style="width:253px;height:200px">{$item.value}</textarea>
           
            <br>
        {else}
            {if $item.var_name eq 'ads_image'}
                {if $item.value}
                    <img src="{$item.value}"  />
                {/if}
                <form action="/func/ajaxfunc.php?option=change_option&id={$item.id}" enctype="multipart/form-data" method="POST">
                 
                <input type="file" name="{$item.id}" value="{$item.value}" id="{$item.id}" style="width:200px;">
            {else}
            <input type="text" name="{$item.id}" value="{$item.value}" id="{$item.id}" style="width:200px;">
            {/if}
        {/if}
        {if $item.var_name eq 'ads_image' or $item.var_name eq 'ads_text' or $item.var_name eq 'merchant_title_text' or $item.var_name eq 'ads_prebutton_text'}
            <input type="submit" value="Save">
            </form>
            {else}
                
             <input type="button" onclick="update_option($('#{$item.id}').val(), {$item.id})" value="Save"></td>
        {/if}
    <td>{$item.var_name}</td>
</tr>
{/foreach}
</table>

