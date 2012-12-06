
                 <select name="record[parent_category]">
                     <option value="0" {if $selected eq $sub.id}selected{/if}>
                           
                            Root
                            
                        </option>
                    {foreach from=$catalog item=sub}
                        <option value="{$sub.id}" {if $selected eq $sub.id}selected{/if}>
                           
                            {$sub.name}
                            
                        </option>
                    {if count($sub.sub) > 0}
                    -{include file="sublvl_catalog_add.tpl" catalog2=$sub.sub selected="{$selected}"}
                    {/if}
                    {/foreach}
                   </select> 
                    
                