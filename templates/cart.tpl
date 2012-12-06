<script>
    
    function flush_cart(){
    $.get("/func/ajaxfunc.php?option=flush_cart", function(data){  window.location.reload();});
    //$.get('/func/ajaxfunc.php?option=add_to_cart&id='+id, function(data){ $('.basket').html(''); $('.basket').append(data);});
    }
    function refreash(){
    //$.get("/func/ajaxfunc.php?option=flush_cart", function(data){  window.location.reload();});
    //$.get('/func/ajaxfunc.php?option=add_to_cart&id='+id, function(data){ $('.basket').html(''); $('.basket').append(data);});
    }
    function deleteFromCartById(id){    
    deleteId = id.substr(8);
    //alert(deleteId);
    $.get("/func/ajaxfunc.php?option=delete&id="+deleteId, function(data){  window.location.reload();});
    //$.get('/func/ajaxfunc.php?option=add_to_cart&id='+id, function(data){ $('.basket').html(''); $('.basket').append(data);});
    }
</script>

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
            <h1>Корзина товаров</h1>
            <h2>Для того чтобы начать оформление заказа, нажмите кнопу "Оформить заказ".</h2>
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
                <li><a href="#">Корзина</a></li>
            </ul>
        </div>
    </div> 
    <div class="order">
        <table>
            <tr>
                <th width="240px">НАЗВАНИЕ</th>
                <th width="150px">ЦЕНА</th>
                <th width="150px">СКИДКА</th>
                <th width="200px">КОЛИЧЕСТВО</th>
                <th width="90px">УДАЛИТЬ</th>
            </tr>
            
            {foreach from=$products item=item}
            <tr>
                
            <table style="border-bottom:1px solid #c8c8c8;">
                <tr>
                    <td width="240px"><a href="#">{display_good_name id=$item.id}</a></td>
                    <td width="150px">{display_good_price id=$item.id}p.</td>
                    <td width="150px">&nbsp &nbsp &nbsp-</td>
                    <td width="200px"><input type="text" name="value" value="{$item.count}"></td>
                    <td width="90px"><div class="checkform" style="margin:0 0 0 20px">
                            <span class="checkbox" id="property{{$item.id}}"onclick="deleteFromCartById(id);">
                                <span class="checkbox_image" onclick="checkboxClick('property{$item.id}');"></span>
                                <div style="display: none;">
                                    <input class="required" type="checkbox" name="property{$item.id}Check" value="true" id="property{$item.id}Check">                                    
                                </div>
                            </span>
                        </div></td>
                </tr>
            </table>
            </tr>
            {/foreach}
        </table>
        <table style="border:0px none;margin:5px 0 25px 0;">
            <tr>
                <td width="265px"><p>Если у вас есть код купона для получения скидки, введите его здесь:</p></td>
                <td width="200px"><input style="width:120px;"type="text"></td>
                <td width="70px"><h1>Итого: {$total_sum}p.</h1></td>
            </tr>
        </table>
            <a class="button3" href="#" onclick="refreash();">Обновить</a>
        <a class="button4" href="#">Оформить заказ</a>
        <a class="button4" href="javascript:void(0);" onclick="flush_cart();alert('корзина очищена!');">Очистить корзину</a>
    
    </div>
    <div class="prefoot">
<!--        <p class="pleft">Нажмите эту кнопку, чтобы пересчитать или удалить товар</p>
        <p class="pright">Нажмите эту кнопку, чтобы заказать товары, находящиеся в корзине</p>-->
    </div>
    <img class="shadow" src="/img/shadow.png">
</div>