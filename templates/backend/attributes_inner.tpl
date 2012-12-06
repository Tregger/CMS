  
  

   
        {foreach from=$inner item=item}
               <li>


   <span>
            {$item.name} 
            </span>
           
            <span>
            

            
            {$item.attr}
 </span>    
 <span>
            <a id="edt_page_{$item.id}" title="Edit {$item.name}"
   onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', width: '800', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=attributes&option=edit&id={/literal}{$item.id}"
   > 
              change
            </a>
</span>
        
     
               {if count($item.inner) > 0}
                   <ul>
                    {include file="attributes_inner.tpl" inner=$item.inner}
                   </ul>
    {/if}
</li>
  {/foreach}