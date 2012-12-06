<div class="content">
    <img src="/img/menuback11.png" class="menuback1">
    <img src="/img/shadow1.png" class="shadow1">
    <div class="menu">
        {display_menu cur=$current}
     {cart_widget}
    </div>
    <div class="points1">
       {display_points}
    </div>
    <div class="pechi">
        <div class="pechimenu">
           {if $mod=='new'} <h1>Новости</h1>{else}<h1>Статьи</h1>{/if}
        </div>
        <div class="typeof1">
            <div class="gorod1">
                <a href="/gorod-mastierow/"></a>
                <h2>Услуги по монтажу<br> печей, строительство бань</h2>
            </div>
        </div>
        <div class="scraps">
            <ul>
                <li><a href="/">Главная</a><img src="/img/arrow.jpg"></li>
                <li><a href="#">{if $mod=='new'}Новости{else}Статьи{/if}</a></li>
            </ul>
        </div>
    </div>
    <div class="big"> 
        <div class="textpage">
            {foreach from=$items item=item}
            <div class="pageNews">
                
                <div class="pageContent">
                    <a href="/{if $mod=='new'}novosti/display_new/{else}statii/display_article/{/if}{$item.id}/">{if $mod=='new'}{$item.date}{/if}</a>
                  {if $mod=='art'}<a href="/{if $mod=='new'}novosti/display_new/{else}statii/display_article/{/if}{$item.id}/">{/if}  <h4>{$item.name}</h4>  {if $mod=='art'}</a>{/if}
                    <br>
                    {$item.sdescr}
                </div>
            </div>
             {/foreach}
        </div>
    </div>
    <img src="/img/shadow.png" class="shadow">
</div>

