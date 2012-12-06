<script src="/tinymce/jscripts/tiny_mce/plugins/tinybrowser/tb_standalone.js.php" type="text/javascript"></script>
<form method="POST" action="/admin.php?module=producers&option={$type}">
    <input type="hidden" name="record[{$type}]" value="{if $rec.id}{$rec.id}{else}1{/if}" >
    <table>
        <tr>
            <td>Название</td>
            <td><input type="text" name="record[name]" value="{$rec.name}"></td>
        </tr>
        <tr>
            <td>Лого</td>
            <td>
                 <input type="text" name="record[img]" id="img" size="80" value="{$rec.logo}">
                 <input type="button" onclick="document.getElementById('img').value='';" href="javascript:{}" value="Очистить"/>
                 <input type="button" onclick="tinyBrowserPopUp('image','img');" href="javascript:{}" value="Обзор"/>
            </td>
        </tr>
        <tr>
            <td colspan=2>
                <input type="submit" value="Добавить производителя">
            </td>
        </tr>
    </table>
</form>