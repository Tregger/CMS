{foreach from=$catalog2 item=element}
   <li>
       <div class="line_catalog">
       <a href="javascript:void(0)" id="{$element.id}" onclick="{literal}$.get('/admin.php?module=catalog&option=view_rec&id={/literal}{$element.id}{literal}', function(data){$('#result').html(''); $('#result').append(data); }){/literal}">
           {$element.name} 
           </a>
               <span id="{$element.id}" class="ui-icon ui-icon-triangle-1-e ui-state-default display_panel_b"></span>
                              
                                 <div class="display_panel_{$element.id} catalog_panel">
                <a href="/admin.php?id={$element.id}&module=catalog&option=edit" onclick="
                            {literal}
                            return hs.htmlExpand(this, { 
                        objectType: 'iframe', width: '800', 
                        creditsPosition: 'bottom left', headingEval: 'this.a.title', 
                        wrapperClassName: 'titlebar' } )
                        {/literal}
                        " title="Edit record {$element.name}" id="edit_rec_{$element.id}">
               <img src="/src/edit.gif" style="margin-left:5px;height:30px" />
               </a>
                <a href="javascript:void(0)" onclick="
            {literal}
           	if(confirm('Delete record {/literal}{$element.name}{literal}?'))
			$.get('/admin.php?id={/literal}{$element.id}{literal}&module=catalog&option=delete', function(data){window.location.reload();}); 
				else return false;    
            {/literal}
           "><img src="/src/del.gif" height="30" border="0"/>
                            </a>
             <input type="text" size="3" id="ord" value="{$element.ord}" onchange="$.get('/admin.php?id={$element.id}&module=catalog&option=change_ord&ord='+this.value)"> <input type="button" onclick="$.get('/admin.php?id={$element.id}&module=catalog&option=change_ord&ord='+document.getElementById('ord').value)" value="ok">
         </div>
                            </div>
    {if count($element.sub) > 0}
   <ul>{include file="sublvl_catalog.tpl" catalog2=$element.sub}</ul>
   </li>
   {/if}
{/foreach}
