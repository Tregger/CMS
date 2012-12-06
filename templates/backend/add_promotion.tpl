<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="/js/jquery-ui.js"></script>
<script type="text/javascript" src="/js/jquery-ui-timepicker-addon.js"></script>
<link href="/css/jquery-ui-1.8.16.custom.css" media="screen" rel="stylesheet" type="text/css">
<script> 
    upp = new Array('','A','B','C','D','E','F','G','H','I','J','K','L',
    'M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
low = new Array('','a','b','c','d','e','f','g','h','i','j','k','l',
    'm','n','o','p','q','r','s','t','u','v','w','x','y','z');
dig = new Array('','0','1','2','3','4','5','6','7','8','9');

function rnd(x,y,z) {
 var num;
 do {
    num = parseInt(Math.random()*z);
    if (num >= x && num <= y) break;
 } while (true);
return(num);
}

function gen_pass() {
var pswrd = '';
var znak, s;
var k = 0;
var n = 10;
var pass = new Array();
var w = rnd(30,80,100);
for (var r = 0; r < w; r++) {
     znak = rnd(1,26,100); pass[k] = upp[znak]; k++; 
     znak = rnd(1,26,100); pass[k] = low[znak]; k++; 
     znak = rnd(1,10,100); pass[k] = dig[znak]; k++; 
}
for (var i = 0; i < n; i++) {
    s = rnd(1,k-1,100);
    pswrd+= pass[s];
}
return pswrd
}

$(document).ready(function(){
        $('#date').datepicker({ dateFormat: "yy-mm-dd 00:00:00" });
         $('#generate').click(function(){
           $('#coupon').val(gen_pass());
        });
        });
       
</script>
<br>
<form method="post" action="/admin.php?module=promotion&option={if isset($record)}edit{else}add{/if}">
    <input type="hidden" name="add" value="1" />
<!--    <input type="hidden" name="record[callback]" value="/admin.php?module=categories">-->
    <input type="hidden" name="record[after_insert]" value="  <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander('add_category');
            if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
        }
        parent.window.location.reload();
        </script>">
    {if isset($record)}
        <input type="hidden" name="record[id]" value="{$record.id}" />
        <input type="hidden" name="record[where]" value="{$record.id}" />
         <input type="hidden" name="record[date_add]" value="{$record.date_add}" />
         {else}
              <input type="hidden" name="record[date_add]" value="{date("Y/m/d H:i:s")}" />
    {/if}
    <table>
        <tr>
            <td>Coupon</td>
              <td><input type="text" name="record[coupon]" id="coupon" {if isset($record)}value="{$record.coupon}"{/if}>{if !isset($record)}<a href="javascript:void(0)" id="generate">Generate</a>{/if}</td>
        </tr>
        
            {if isset($record)}
             <tr>
                <td>Is used</td>
                <td>
                    <select name="record[used]">
                        <option value="0" {if $record.used == "0"}selected{/if}>not used</option>
                        <option value="1" {if $record.used == "1"}selected{/if}>used</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>id User which used</td>
                <td>
                    <input type="text" name="record[id_user]" {if isset($record)}value="{$record.id_user}"{/if}>
                </td>
            </tr>
            {/if}
    
            <tr>
            <td>Discount(%)</td>
            <td>
                <input type="text" name="record[discount]" {if isset($record)}value="{$record.discount}"{/if}>
            </td>
        </tr>
        <tr>
        <td>Date expire</td>
            
            <td>
                <input type="text" name="record[date_expire]" id="date" {if isset($record)}value="{$record.date_expire}"{/if}>
            </td>
        </tr>
        <tr>
            <td><!-- --> </td>
            <td><input type="submit" value="Apply" ></td>
        </tr>
    </table>
</form>