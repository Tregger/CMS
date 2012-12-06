
{literal}
<style type="text/css" media="screen">
        @import "/media/css/demo_table.css";
        @import "/js/highslide.css";
</style>
<script type="text/javascript" src="/media/js/complete.js"></script>
<script src="/media/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/media/js/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" src="/js/highslide-with-html.min.js"></script>
<script type="text/javascript" src="/js/hs_config.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
              oTable = $('#example').dataTable({
        "bJQueryUI": true,
        "sPaginationType": "full_numbers"

    });
        $('#example').dataTable().columnFilter({
                            aoColumns: [null,null,null,null,null,null,null,null]

                    });
    });
        
        function change_ord(id, value){
            $.get('/func/ajaxfunc.php?option=change_ord_page&id='+id+'&value='+value, function(data){$('#'+id).val(value)});
        }
</script>
{/literal}
<a id="add_page" title="Add new page"
   onclick="return hs.htmlExpand(this, { objectType: 'iframe', width: '800', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=pages&option=add"> 
    Add new page
</a>
<br><br><br>
<div style="margin-left: 90px;">
<div style=" width:100%" align="center">
<table   id="example" style=" width:100%">
    <thead>
    <tr>
        <th>Title</th>
        <th>Url(slug)</th>
        <th>Ord</th>
        <th>Type</th>
        <th>Edit</th>
        <th>Delete</th>
        
    </tr>
    </thead>
    <tfoot>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
    </tfoot>
    {foreach from=$pages item=page}
    <tr>
        <td>{$page.name}</td>
        <td>{$page.url}</td>
        <td><input type="text" size="3" id="{$page.id}" value="{$page.ord}" ><input type="button" value="ok" onclick="change_ord({$page.id}, $('#{$page.id}').val())"></td>
        <td>
           
            <select disabled>
                  {modules sel=$page.type}
            </select>
        </td>
        <td>
            
            <a id="edt_page_{$page.id}" title="Edit {$page.name}"
   onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', {/literal}{if $page.type eq 'merchant_intro'}width: '1200',  {else}{/if} {literal} creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=pages&option=edit&id={/literal}{$page.id}"
   > 
               <img src="/src/edit.gif" style="height:50px">
            </a>
        </td>
        <td>
             <a onclick=" {literal}
                if(confirm('Delete record{/literal} {$page.name} {literal}?'))
                 $.get('/admin.php?id={/literal}{$page.id}{literal}&module=pages&option=delete', function(data){window.location.reload();}); else return false;
                {/literal}
           " href="javascript:void(0)"
                >
            <img src="/src/del.gif" style="height:50px">
            </a>
        </td>
        
    </tr>
    {/foreach}
</table>
</div>
</div>