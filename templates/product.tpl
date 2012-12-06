<div class="content">
    <img class="menuback1" src="/img/menuback11.png">
    <img class="shadow1" src="/img/shadow1.png">
    <div class="menu">
        {display_menu cur=$current}
        {cart_widget}
    </div>
    <div class="points1">
        {display_points}
    </div>
    <div class="pechi">
        <div class="pechimenu">
            <h1>{$category.name}</h1>

            <ul>
                {foreach from=$items item=itm}
                    {if $itm.folder==1}
                        <li><a href="/magazin/{$itm.id}">{$itm.name}</a><img src="/img/menuline1.png"></li>
                        {/if}
                    {/foreach}
            </ul>
        </div>
        <div class="typeof1">
            <div class="gorod1">
                <a href="/gorod-mastierow/"></a>
                <h2>Услуги по монтажу<br> печей, строительство бань</h2>
            </div>
        </div>
        <div class="scraps">
           {breadcumpf} 
        </div>
    </div> 
    <div class="kastorkl20">
        <h1>{$item.name}</h1>
        <div class="kastorleft">
            <img class="bigger" src="{$item.img}">

        </div>
        <div class="kastorcenter">
            {$item.fdescr}
        </div>
        <div class="kastorright">
            <h3>Характеристики:</h3>
            <div class="typekl20">
                <div class="typeleftkl20">
                    <p>Вид топлива</p>
                    <p class="lst1">Объем<br> отапливаемого помещения до</p>
                </div>
                <div class="typerightkl20">
                    <p>{$item.vid}</p>
                    <p>{$item.ob}</p>
                </div>
            </div>
            <h3 style="clear:left; padding-top:10px;">Размеры:</h3>
            <div class="typekl20">
                <div class="typeleftkl20">
                {if $item.glubina}<p>Глубина</p>{/if}
            {if $item.shirina}<p>Ширина</p>{/if}
        {if $item.visota}<p>Высота</p>{/if}
    {if $item.diam_dimohod}<p>Диаметр дымохода</p>{/if}
{if $item.massa_pechi}<p>Масса печи</p>{/if}
{if $item.massa_kamnei}<p>Масса камней</p>{/if}
{if $item.vstroenniy_bak}<p>Встроенный бак</p>{/if}
{if $item.vstroenniy_teploobmennik}<p>Встроенный теплообменник</p>{/if}
{if $item.material_topki}<p>Материал топки<br>&nbsp </p>{/if}
{if $item.tip_kamenki}<p>Тип каменки</p>{/if}
{if $item.tip_kozuha}<p class="lst">Тип кожуха печи</p>{/if}
</div>
<div class="typerightkl20">
{if $item.glubina}<p>{$item.glubina} мм</p>{/if}
{if $item.shirina}<p>{$item.shirina} мм</p>{/if}
{if $item.visota}<p>{$item.visota} мм</p>{/if}
{if $item.diam_dimohod}<p>{$item.diam_dimohod} мм</p>{/if}
{if $item.massa_pechi}<p>{$item.massa_pechi}кг</p>{/if}
{if $item.massa_kamnei}<p>{$item.massa_kamnei}кг</p>{/if}
{if $item.vstroenniy_bak}<p>{$item.vstroenniy_bak}</p>{/if}
{if $item.vstroenniy_teploobmennik}<p>{$item.vstroenniy_teploobmennik}<br>&nbsp;</p>{/if}
{if $item.material_topki}<p>{$item.material_topki}</p>{/if}
{if $item.tip_kamenki}<p>{$item.tip_kamenki}</p>{/if}
{if $item.tip_kozuha}<p class="lst">{$item.tip_kozuha}</p>{/if}

</div>
</div>
</div>
<a class="button" href="javascript:add_to_cart({$item.id})">Добавить в корзину</a>
<div style="clear:both;"></div>
</div>
<div class="info1">
    <h1 class="top">ПОДРОБНОЕ ОПИСАНИЕ</h1>
    <h1 class="top">{$item.name}</h1>
    {$item.fdescr}
    <p class="last">&nbsp;</p>
</div>
<img class="shadow" src="/img/shadow.png">
</div>