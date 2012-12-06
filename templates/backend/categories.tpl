
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

</script>
{/literal}
<a id="add_category" title="Add new category"
   onclick="return hs.htmlExpand(this, { objectType: 'iframe', width: '400', height: '200', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=categories&option=add"> 
    Add category
</a>

<br><br><br>
<div style="margin-left: 90px;">
<div style=" width:100%" align="center">
<table  id="example" style=" width:100%">
    <thead>
    <tr>
        <th>Title</th>
        <th>Ord</th>
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
        </tr>
    </tfoot>

<tbody>
{foreach from=$categories item=category}
     <tr>
            <td>{$category.name}</td>

        <td><input type="text" size="3" value="{$category.ord}" ><input type="button" value="ok"></td>

        <td>
            
            <a id="edt_page_{$category.id_category}" title="Edit {$category.name}"
   onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', width: '800', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=categories&option=edit&id={/literal}{$category.id_category}"
   > 
               <img src="/src/edit.gif" style="height:50px">
            </a>
        </td>
        <td>
             <a onclick=" {literal}
                if(confirm('Delete record{/literal} {$category.name} {literal}?'))
                 $.get('/admin.php?id={/literal}{$category.id_category}{literal}&module=categories&option=delete', function(data){window.location.reload();}); else return false;
                {/literal}
           " href="javascript:void(0)"
                >
            <img src="/src/del.gif" style="height:50px">
            </a>
        </td>
        
    </tr>
{/foreach}
</tbody>
</table>