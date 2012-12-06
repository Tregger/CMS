
{literal}
<style type="text/css" media="screen">
        @import "/media/css/demo_table.css";
        @import "/js/highslide.css";
</style>
<style>
    .attributes tr:nth-child(1){
         background: #666; /* Цвет фона */
    color: #fff; /* Цвет текста */
        }
    .attributes tr:nth-child(2n){

     background: #f0f0f0; /* Цвет фона */
    }
</style>
<script type="text/javascript" src="/media/js/complete.js"></script>
<script src="/media/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/media/js/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" src="/js/highslide-with-html.min.js"></script>
<script type="text/javascript" src="/js/hs_config.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#example').dataTable().columnFilter({
                            aoColumns: [null,null,null,null,null,null,null,null]

                    });
    });
</script>
      <link rel="stylesheet" href="http://jquery.bassistance.de/treeview/demo/screen.css" type="text/css" />
             <link rel="stylesheet" href="http://jquery.bassistance.de/treeview/jquery.treeview.css" type="text/css" />
             <script type="text/javascript" src="http://jquery.bassistance.de/treeview/jquery.treeview.js"></script>
                            <script>
  $(document).ready(function(){
    $("#tree").treeview();

  });
  </script>
{/literal}

<br><br>

    
<h2>For add attribute to category (for goods into this category) Choose needed category and press  link "Change" </h2>
    <ul class="menu_catalog_admin" id="tree">

    {foreach from=$categories_root item=cat}
        <li>
   
<span class="name">
            {$cat.name}
       </span>
  <span>
             {$cat.attr}
  
            </span>
     
             <span>
            <a id="edt_page_{$cat.id}" title="Edit {$cat.name}"
   onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', width: '800', height: '800', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=attributes&option=edit&id={/literal}{$cat.id}"
   > 
               change
            </a>
 </span>

    {if count($cat.inner) > 0}
        <ul>
       {include file="attributes_inner.tpl" inner=$cat.inner}
        </ul>
    {/if}
    </li>
    {/foreach}
      </ul>  

