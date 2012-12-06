            <!-- <link rel="stylesheet" href="http://jquery.bassistance.de/treeview/demo/screen.css" type="text/css" /> -->
            <link rel="stylesheet" href="http://jquery.bassistance.de/treeview/jquery.treeview.css" type="text/css" />
             <script type="text/javascript" src="http://jquery.bassistance.de/treeview/jquery.treeview.js"></script>
             <style>
                 .catalog_panel{
                     display:none;
                     padding:4px;
                     border: 1px solid black;
                     position: absolute;
                     background: #FFF;
                 }
                 .line_catalog a{
                     float:left;
                   }
             </style>
             <script>
  $(document).ready(function(){
    $('.display_panel_b').click(function(){
        $('.catalog_panel').hide();
        id=$(this).attr('id');
        $('.display_panel_'+id).toggle();
   
    });
 
    $("#tree").treeview();
    {if $id ne ""}
        $("#{$id}").click();
    {/if}
  });
  $(function(){
	  $(document).click(function(event) {
		if ($(event.target).closest("#tree").length) return;
		
		$(".catalog_panel").hide();
		
		event.stopPropagation();
	  });
	});
  </script>
  
    <table style="width:100%;" border=0>
        <tbody>
            <tr>
                <td valign="top" width="25%">
                   <div class="add_but">
                       <a href="/admin.php?module=catalog&option=add&tip=cat" onclick="return hs.htmlExpand(this, { 
			objectType: 'iframe', width: '800', 
			creditsPosition: 'bottom left', headingEval: 'this.a.title', 
			wrapperClassName: 'titlebar' } )" title="Add category"  class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" id="add_cat">
                           Добавить категорию
                       </a>
                   </div>
                    
                    <ul class="menu_catalog_admin treeview" id="tree">
                        <li><a href="/admin.php?module=catalog&id=0">Root</a></li>
                    {foreach from=$catalog item=sub}
                        <li>
                           <div class="line_catalog">
                            <a href="/admin.php?module=catalog&id={$sub.id}" id="{$sub.id}" onclick="{literal}$.get('/admin.php?module=catalog&option=view_rec&id={/literal}{$sub.id}{literal}', function(data){$('#result').html(''); $('#result').append(data); }){/literal}">
                            {$sub.name}
                            </a>
                          
                                 <span id="{$sub.id}" class="ui-icon ui-icon-triangle-1-e ui-state-default display_panel_b"></span>
                              
                                 <div class="display_panel_{$sub.id} catalog_panel">
                               <a href="/admin.php?id={$sub.id}&module=catalog&option=edit" onclick="
                                    {literal}
                                    return hs.htmlExpand(this, { 
                                objectType: 'iframe', width: '800', 
                                creditsPosition: 'bottom left', headingEval: 'this.a.title', 
                                wrapperClassName: 'titlebar' } )
                                {/literal}
                                " title="Edit record {$sub.name}" id="edit_rec_{$sub.id}">
                            <img src="/src/edit.gif" style="margin-left:5px;height:30px" />
                            </a>
                                 <a href="javascript:void(0)" onclick="
                                {literal}
                                    if(confirm('Удалить запись {/literal}{$sub.name}{literal}?'))
                                            $.get('/admin.php?id={/literal}{$sub.id}{literal}&module=catalog&option=delete', function(data){$('#{/literal}{$sub.id_p}{literal}').click()}); 
                                                    else return false;    
                                {/literal}
           "><img src="/src/del.gif" height="30" border="0"/>
                            </a>
           <input type="text" size="3" id="ord" value="{$sub.ord}" onchange="$.get('/admin.php?id={$sub.id}&module=catalog&option=change_ord&ord='+this.value)"> <input type="button" onclick="$.get('/admin.php?id={$sub.id}&module=catalog&option=change_ord&ord='+document.getElementById('ord').value)" value="ok">
                           </div>
                            </div>
                            
                    {if count($sub.sub) > 0}
                    <ul>
                        {include file="sublvl_catalog.tpl" catalog2=$sub.sub}
                    </ul>
                    {/if}
                    </li>
                    {/foreach}
                    </ul>
                    
                </td>
                <td valign="top">
                    <div class="add_but">                       
                        <a href="/admin.php?module=catalog&option=add&tip=zap" onclick="return hs.htmlExpand(this, { 
			objectType: 'iframe', width: '800', 
			creditsPosition: 'bottom left', headingEval: 'this.a.title', 
			wrapperClassName: 'titlebar' } )" title="  Add record" id="add_rec">
                           Добавить товар
                       </a>
                    </div>
                        <div class="result" id="result"><!-- --></div>    
                </td>
            </tr>
         </tbody>
    </table>
