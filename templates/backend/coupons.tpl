
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
        "sPaginationType": "full_numbers", 
          
    });
        $('#example').dataTable().columnFilter({
                            aoColumns: [null,null,null,null,null,null,null,null]

                    });
    });

</script>
{/literal}
<a id="add_page" title="Add deal coupons"
   onclick="return hs.htmlExpand(this, { objectType: 'iframe', width: '1024', height: '1024', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=coupons&option=add"> 
    Add deal
</a>

<br><br><br>
<div style="margin-left: 90px;">
<div style=" width:100%" align="center">
<table  id="example" style=" width:100%">
    <thead>
    <tr>

        <th>Title</th>

        <th>Ord</th>
        <th>Date</th>
        <th>Date Expire</th>
        <th>Status</th>
        <th>Buyers</th>
        <th>City</th>
        <th>Category</th>
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
            <th></th>
                <th></th>
            <th></th>
              <th></th>
        </tr>
    </tfoot>

<tbody>
{foreach from=$coupons item=coupon}
     <tr>
        <td>{$coupon.title}</td>
       
        <td><input type="text" size="3" value="{$coupon.order}" ><input type="button" value="ok"></td>
        <td>
            {$coupon.st_day|date_format:"%Y-%m-%d"}
        </td>
          <td>
              {display_end_date_coupon start=$coupon.st_day days=$coupon.day_col}
            
        </td>
         <td>{$coupon.status}</td>
          <td>{display_count_subscribbers deal=$coupon.id} subscriber(s)</td>
          <td>{$coupon.city}</td>
          <td>{display_category_name id=$coupon.id_category}</td>
        <td>
            
            <a id="edt_page_{$coupon.id}" title="Edit {$coupon.title}"
   onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', width: '800', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=coupons&option=edit&id={/literal}{$coupon.id}"
   > 
               <img src="/src/edit.gif" style="height:50px">
            </a>
        </td>
        <td>
             <a onclick=" {literal}
                if(confirm('Delete record{/literal} {$coupon.title} {literal}?'))
                 $.get('/admin.php?id={/literal}{$coupon.id}{literal}&module=coupons&option=delete', function(data){window.location.reload();}); else return false;
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