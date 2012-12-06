
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
                            aoColumns: [null,null,{ type: "select", values: ["User", "Merchant"] },null,null,null,null,null]

                    });
    });

</script>
{/literal}
<a id="add_page" title="Add new user"
   onclick="return hs.htmlExpand(this, { objectType: 'iframe', width: '1024', height: '1024', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=login_users&option=add"> 
    Add user
</a>

<br><br><br>
<table>
    <tr>
        <td>Display: </td>
        <td><a href="/admin.php?module=login_users&sort=2">All Users</a></td>
        <td><a href="/admin.php?module=login_users&sort=0">Regular Users</a></td>
        <td><a href="/admin.php?module=login_users&sort=1">Merchants</a></td>
    </tr>
</table>
<br><br>
<div style="margin-left: 90px;">
<div style=" width:100%" align="center">
<table  id="example" style=" width:100%">
    <thead>
    <tr>

        <th>Username</th>

        <th>Email</th>
        <th>Role</th>
        <th>Coutry</th>
        <th>Send message</th>
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
  
        </tr>
    </tfoot>

<tbody>
{foreach from=$users item=user}
     <tr>
        <td>{$user.username}</td>
       
        <td>{$user.email}</td>
        <td>
            {if $user.user_level == 1}
                Merchant
            {else}
                User
            {/if}
        </td>
          <td>
              {$user.info}
            
        </td>
        <td>
            <a id="send_msg" href="/ajax/messaging.php?module=messaging&from=admin&to={$user.userid}" 
               onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', width: '320', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   {/literal}
               >Send Private Message</a>
        </td>
        <td>
            
            <a id="edt_page_{$user.userid}" title="Edit"
   onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', width: '800', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=login_users&option=edit&id={/literal}{$user.userid}"
   > 
               <img src="/src/edit.gif" style="height:50px">
            </a>
        </td>
        <td>
             <a onclick=" {literal}
                if(confirm('Delete record{/literal}{literal}?'))
                 $.get('/admin.php?id={/literal}{$user.userid}{literal}&module=login_users&option=delete', function(data){window.location.reload();}); else return false;
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