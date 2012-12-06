{include file="header.tpl" title=Login}
<center>
<form action='admin.php?make=get_pass' method='POST'>
  Your contact E-mail:<br>
 <input type='text' name='mail' onblur="this.value==''?this.value='E-mail':void(0)" onfocus="this.value=='E-mail'?this.value='':void(0)" value="E-mail" /> <br />
 <input type='submit' value='Send' /> <br />
</form>
    </center>
{include file="footer.tpl"}