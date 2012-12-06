{if $current_page['url'] ne "merchant-intro"}
    {if !isset($smarty.get.merchant)}
        {if isset($smarty.session.user_level) && $smarty.session.user_level==1 && !isset($smarty.get.lookup)}
            {include file="header.tpl" logged=$logged client_city=$client_city}
        {else}
            {include file="header_users.tpl" logged=$logged client_city=$client_city}
        {/if}
    {/if}
{/if}
{content cur=$current_page}
{if $current_page['url'] ne "merchant-intro"}
    {if !isset($smarty.get.merchant) }
     {include file="footer.tpl"}
    {/if}
{/if}