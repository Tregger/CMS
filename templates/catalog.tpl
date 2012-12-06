{literal}
    <script type="text/javascript">
            function checkboxClick(id) {
                var idCheck = id + "Check";
                //alert(idCheck);
                if (document.getElementById(id).className == "checkbox active" ) {
                    document.getElementById(idCheck).value = "false";
                        document.getElementById(idCheck).checked = false;
                    document.getElementById(id).className = "checkbox";
                }
                else {
                    document.getElementById(idCheck).value = "true";
                         document.getElementById(idCheck).checked = true;
                    document.getElementById(id).className = "checkbox active";
                }
            }
            function radiobuttonClick(id,idParent) {
                //document.getElementById(idParent)    
                var count = 0;
                var countDiv=0;
                for(var i=0; i<document.getElementById(idParent).childNodes.length; i++) {
                    var child = document.getElementById(idParent).childNodes[i]
                        if (child.tagName=="DIV") countDiv++;
                    }     
                var countLi = 0;
                for(var i=0; i<document.getElementById(idParent).childNodes.length; i++) {
                    var child = document.getElementById(idParent).childNodes[i]
                        if (child.tagName=="LI") countLi++;
                    }  
                if (countDiv>countLi) count = countDiv;
                else count = countLi;            
                for (i=1;i<=count;i++) {
                    var currentId = idParent + i;
                    var currentHideId = idParent + 'H' + i;
                
                    if (id == (currentId)) {
                        document.getElementById(currentId).className = "radiobutton active";
                        document.getElementById(currentHideId).checked = true;                    
                    }
                    else {
                        document.getElementById(currentId).className = "radiobutton";
                        document.getElementById(currentHideId).checked = false;
                    }
                }            
            }
            function SelectAll (idParent) {            
                var countLi = 0;
                for(var i=0; i<document.getElementById(idParent).childNodes.length; i++) {
                    var child = document.getElementById(idParent).childNodes[i]
                        if (child.tagName=="LI") countLi++;
                }              
                for (i=1;i<=countLi;i++) {
                    var id = idParent + i;
                    var idCheck = id + "Check"
                    document.getElementById(idCheck).value = "true";
                    document.getElementById(id).className = "checkbox active";               
                }
            }
            function DeSelectAll (idParent) {
                var countLi = 0;
                for(var i=0; i<document.getElementById(idParent).childNodes.length; i++) {
                    var child = document.getElementById(idParent).childNodes[i]
                        if (child.tagName=="LI") countLi++;
                }              
                for (i=1;i<=countLi;i++) {
                    var id = idParent + i;
                    var idCheck = id + "Check"                
                    document.getElementById(idCheck).value = "false";
                    document.getElementById(id).className = "checkbox";                
                }
            }
    </script>
{/literal}
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
            {if isset($category)}
            <h1>{$category.name}</h1>
          {if $category.id!=4}
            <ul>
                {foreach from=$items item=item}
                    {if $item.folder==1 }
                        <li><a href="/magazin/{$item.id}/">{$item.name}</a><img src="/img/menuline1.png"></li>
                    {/if}
                {/foreach}
            </ul>
            {/if}
            {else}
                <h1>Магазин</h1>
                     <ul>
            
                        <li><a href="/magazin/1/">Печи</a><img src="/img/menuline1.png"></li>
                         <li><a href="/magazin/2/">Камины</a><img src="/img/menuline1.png"></li>
                        <li><a href="/magazin/3/">Котлы</a></li>
                     </ul>
            {/if}
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
    <div class="hits1">
        <div class="hitleft">
            <div class="sort">
                <div class="sorted1">
                    <p>Сортировать по:</p>
                    <ul>
                        <li><a href="/magazin{if isset($category)}/{$category.id}{/if}/sort/sale_count/">популярности</a><img src="/img/vertline.png"></li>
                        <li><a href="/magazin{if isset($category)}/{$category.id}{/if}/sort/price/">цене</a><img src="/img/vertline.png"></li>
                        <li><a href="/magazin{if isset($category)}/{$category.id}{/if}/sort/name/">названию</a></li>
                    </ul>
                </div>
                    
                    
               
                   
                    {if isset($category)}
                    {paging cur_page=$cur_page all_page=$all_page add_slug="&category={$category.id}" per_page=$pp container='sorted2'}
                    {else}
                         {paging cur_page=$cur_page all_page=$all_page  per_page=$pp}
                    {/if}  
          
                    
              
                   
                <a class="short" href="/magazin{if isset($category)}/{$category.id}{/if}/display/short/"></a>
                <a class="detailed" href="/magazin{if isset($category)}/{$category.id}{/if}/display/detailed/"></a>
            </div>
            <div class="hitss1">
                {foreach from=$items item=item}
                    {if $item.folder == 0}
                        <div class="hit1">
                            <img src="/image.php?width=145&amp;image={$item.img}">
                            <div class="reit">
                                <a href="/proudct/view/{$item.url}/" {if $item.promo eq "1" or $item.hit eq "1"}style="width:55%;" {/if}>{$item.name}</a>
                                <div class="fire">
                                     {if $item.promo eq "1"}
                                    <h2>Хит!</h2>
                                   {/if}
                                    {if $item.hit eq "1"}
                                         <h3>Новинка!</h3>
                                    {/if}
                                </div>
                            </div>
                                <div style="clear:both; width: 100%;"></div>
                            <p>{smart_cut text=$item.fdescr}...</p>
                            <h1>{$item.price}р.</h1>
                            <a class="button" href="javascript:add_to_cart({$item.id})">В корзину</a>
                        </div>
                    {/if}
                {/foreach}
             
              
            </div>
         
            
                
                {if isset($category)}
                    {paging cur_page=$cur_page all_page=$all_page add_slug="&category={$category.id}" per_page=$pp container='sorted3'}
                    {else}
                         {paging cur_page=$cur_page all_page=$all_page  per_page=$pp}
                    {/if}  
            
              
        </div>
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
             </form>
    <div class="info">
        <h1 class="top">ПЕЧИ ДЛЯ БАНЬ</h1>
        <p>В нашем магазине каждый покупатель сможет найти все, что нужно для оснащения русской бани или сауны. Мы предлагаем широкий ассортимент товаров - это и печи для бани, отопительные печи, камины, дымоходы и электропечи. Более того, мы оказываем услуги по установке данного оборудования.</p>
        <p>Банные печи производятся не только в России, но и за рубежом. Поэтому мы подберем для Вас именно ту модель, которая будет Вас устраивать не только своими параметрами, но и ценой. У нас вы сможете приобрести и дровяные печи для  бани, и электрические печи с топкой. Для последних у нас есть большой выбор пультов управления и систем автоматики.</p>
        <p>Перед тем как брать печь в баню, Вам нужно проконсультироваться со специалистом. Наши менеджеры смогут оказать Вам грамотные консультации по всей продукции, продающейся в нашем магазине.</p>
        <h1>ДРОВЯНЫЕ БАННЫЕ ПЕЧИ</h1>
        <p class="last">Сегодня Вы можете приобрести дровяные печи импортного и российского производства, например, компаний Harvia, Kastor, Narvi, Варвара, Термофор. Установка дровяной печи не требует проведения силовых электрических кабелей, что дает больше возможностей по выбору места строительства бани или сауны. Дровяные печи могут быть облицованы талькохлоритом или змеевиком. Облицовка натуральным камнем придаст интерьеру парилки незабываемый и натуральный вид. Печи под маркой Harvia оснащаются прозрачной стеклянной дверцей топки - можно наблюдать за горением дров и тлением углей. Есть модели с универсальной топкой, которая может располагаться в парной или вынесена за ее пределы.</p>
    </div>
    <img class="shadow" src="/img/shadow.png">
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