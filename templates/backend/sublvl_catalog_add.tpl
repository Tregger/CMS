
{foreach from=$catalog2 item=element}
   <option value="{$element.id}" {if $selected eq $element.id}selected{/if}>--{$element.name}</option>
    {if count($element.sub) > 0 }
  {include file="sublvl_catalog_add.tpl" catalog2=$element.sub selected="{$selected}"}
   
   {/if}
{/foreach}