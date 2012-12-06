<div class="content " style="padding-bottom:25px;">
<img class="menuback1" src="img/menuback11.png">
<img class="shadow1" src="img/shadow1.png">
<div class="menu">
    {display_menu cur=$current}
    {cart_widget}
</div>
<div class="points1">
{display_points}
</div>
<div class="pechi">
<div class="pechimenu">
{if isset($category)}
            <h1>{$category.name}</h1>
          
            <ul>
                {foreach from=$items item=item}
                    {if $item.folder==1}
                        <li><a href="/index.php?page=magazin&category={$item.id}">{$item.name}</a><img src="img/menuline1.png"></li>
                    {/if}
                {/foreach}
            </ul>
            {else}
                <h1>Результаты поиска</h1>
            {/if}
</div>
<div class="typeof1">
<div class="gorod1">
<a href="/index.php?page=gorod-mastierow"></a>
<h2>Услуги по монтажу<br> печей, строительство бань</h2>
</div>
</div>
<div class="scraps">
<ul>
<li><a href="/">Главная</a><img src="img/arrow.jpg"></li>

<li>Результаты поиска</li>
</ul>
</div>
</div> 
{if $results}
<div class="hits1">
<div class="hitleft">
<div class="sort" style=" background: url('../img/sortback1.png') no-repeat scroll 0 0 transparent;">
<div class="sorted1">
<p>Сортировать по:</p>
<ul>
  <li><a href="/index.php?page=search{if isset($_GET['pg'])}&pg={$_GET['pg']}{/if}&order=sale_count">популярности</a><img src="img/vertline.png"></li>
                        <li><a href="/index.php?page=search{if isset($_GET['pg'])}&pg={$_GET['pg']}{/if}&order=price">цене</a><img src="img/vertline.png"></li>
                        <li><a href="/index.php?page=search{if isset($_GET['pg'])}&pg={$_GET['pg']}{/if}&order=name">названию</a></li>
</ul>
</div>

                    <!--
<a class="short" href="#"></a>
<a class="detailed" href="#"></a>
                    -->
</div>
<div class="hitss1">
    {foreach from=$results item=item}
<div class="hit1">
<img src="{$item.img}">
<div class="reit">
 <a href="/index.php?page=inner&product={$item.url}" {if $item.promo eq "1" or $item.hit eq "1"}style="width:55%;" {/if}>{$item.name}</a>
                                <div class="fire">
                                     {if $item.promo eq "1"}
                                    <h2>Хит!</h2>
                                   {/if}
                                    {if $item.hit eq "1"}
                                         <h3>Новинка!</h3>
                                    {/if}
                                </div>
</div>
<p>{smart_cut text=$item.sdescr}...</p>
<h1>{$item.price}р.</h1>
<a class="button" href="add_to_cart({$item.id})">В корзину</a>
</div>
{/foreach}
</div>


     {if isset($category)}
                    {paging cur_page=$cur_page all_page=$all_page add_slug="&category={$category.id}" per_page=$pp container='sorted3'}
                    {else}
                         {paging cur_page=$cur_page all_page=$all_page  per_page=$pp}
                    {/if}  
          

</div>
                    {else}
     
<div class="hitleft" style="margin-left:45px; margin-right:100px">
        <h1 class="top">По вашему запросу ничего не найдено</h2>
    </div>
         
{/if}
 <div class="hitright">
            <div class="vsemodel">
                <h1>Подбор</h1>
                <a href="javascript:void(0)" onclick="window.location.reload();">Все модели</a>
            </div>     
            <form id="filter_form" name="filter_form">
            <div class="cena">
       
                <h2>Цена:</h2>
                <div class="inpt">
                    <input class="f1" id="price_from" name="price_from"  type="text">
                    <p>до</p>
                    <input type="text" id="price_to" name="price_to">
                    <p>p.</p>
                </div>
            </div>
            <div class="personal">
                <h2>Производитель:</h2>
                 {display_producers_filter}
            </div>
            <div class="size">
                <h2>Объем отапливаемого помещения:</h2>
                <div class="inp">
                    <p>от</p>
                    <input class="f1" type="text" name="ob_from" >
                    <p>до</p>
                    <input type="text" name="ob_to" >
                    <p>куб.м</p>
                </div>
            </div>
            <div class="personal" style="border:0px none;">
                <h2>Вид:</h2>
                <div class="checkform">
                    <span class="checkbox" id="property121">
                        <span class="checkbox_image" onclick="checkboxClick('property121');"></span>
                        <div style="display: none;">
                            <input class="required" type="checkbox" name="121Check" value="true" id="property121Check">                                    
                        </div>
                    </span>
                    <p>Дровяные</p>
                </div>
                <div class="checkform">
                    <span class="checkbox" id="property122">
                        <span class="checkbox_image" onclick="checkboxClick('property122');"></span>
                        <div style="display: none;">
                            <input class="required" type="checkbox" name="122Check" value="true" id="property122Check">                                    
                        </div>
                    </span>
                    <p>Газовые</p>
                </div>
            </div>
            <div class="butt">
                <a class="button1" href="javascript:void(0)" onclick="filter();">Подобрать...</a>
            </div>
        </div>
</div>


 
            <div style="clear: both; width:100%;"></div>
<img class="shadow" src="img/shadow.png">
</div>
            
             {literal}
            <script>
                function filter(){
                //console.log($('#filter_form').serializeArray());
                    vdata=$('#filter_form').serializeArray();
                  $.ajax({
                    url: '/func/filter.php',
                    type: "POST",
                    data: vdata,
                    success: function (data, textStatus) {
                            $('.hitss1').html('');
                            $('.hitss1').append(data);
                        }
                  });  
                }
            </script>
             {/literal}