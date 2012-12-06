<!--<h1>REPORTS IS COMING SOON</h1>-->

<table>
    <tr>
        <td>
            <a href="javascript:void(0)"></a>
             <a id="send_msg" href="/ajax/user_reports.php" 
               onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', width: '520', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   {/literal}
               >User statistic</a>
        </td>
    </tr>
    <tr>
        <td><a href="/ajax/deal_report.php"  onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', width: '520', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   {/literal}>Deal statistic</a></td>
    </tr>

      <tr>
        <td><a href="/ajax/sales_report.php" onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', width: '520', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   {/literal}>Claims Statistic</a></td>
    </tr>
<!--       <tr>
        <td><a href="javascript:void(0)">Business Statistic</a></td>
    </tr>
         <tr>
        <td><a href="javascript:void(0)">Merchant Payments Statistic</a></td>
    </tr>-->
</table>