<br>
<form method="post" action="/admin.php?module=cities&option={if isset($record)}edit{else}add{/if}">
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
    {/if}
    <table>
        <tr>
            <td>Name</td>
            
        </tr>
        <tr>
            <td><input type="text" name="record[name]" {if isset($record)}value="{$record.name}"{/if}></td>
            
        </tr>
        <tr>
            <td><input type="submit" value="Apply" ></td>
        </tr>
    </table>
</form>