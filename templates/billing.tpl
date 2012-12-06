<div class="text_content" style="width:870px; margin: 0px 0 60px;
    padding:20px;
      background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #EDEDED;
    box-shadow: 0 0 3px #EDEDED;
    font-family: arial; position: relative;
    ">

<h1 style="text-transform: uppercase;">Billing</h1>
<br>
<style>
    .text_content table tr th{
        text-align: center;
        font-weight: bold;
        text-transform: uppercase;
        padding:10px;
    }
      .text_content table tr td{
        text-align: center;
         padding:10px;
    }
</style>
<table border="1"  cellpadding="10" style="width: 100%;">
    <tr>
        <th>Transaction ID</th>
        <th>Object</th>
        <th>Amount</th>
        <th>Status</th>
    </tr>
    {if $payments}
        {foreach from=$payments item=item}
        <tr>
            <td>{$item.id_transaction}</td>
            <td>{$item.item_name}</td>
            <td>{$item.suma}</td>
            <td>{$item.status}</td>
        </tr>
        {/foreach}
    {else}
        <tr>
            <td colspan="4" style="text-align:center">You haven't history of payment</td>
         </tr>
    {/if}
</table>

</div>
</div>
