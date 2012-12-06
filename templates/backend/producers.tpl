
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
            "oLanguage": {
                "sSearch": "Отфильтровать производителей:", 
                "sEmptyTable": "Нет производителей", 
                "sInfo": "Показано  _TOTAL_ записей (_START_ - _END_)", 
                    "sInfoEmpty": "No entries to show", 
                        "sInfoFiltered": " - отфильтровано  _MAX_ записей", 
                            "sInfoPostFix": ".", 
                                 "sInfoThousands": "'", 
                                     "sLengthMenu": "Показать _MENU_ записей",
                                         "sLoadingRecords": "Загружаются данные для отображения", 
                                             "sProcessing": "Сейчас выполняется запрос, пожалуйста подождите",
                                                 "sZeroRecords": "Нет производителей для отображения", 
                                                       "oAria": {
        "sSortAscending": " - Сортировать по возрастанию",
             "sSortDescending": " - Сортировать по убыванию"
      }, 
           "oPaginate": {
        "sFirst": "Первая", 
             "sLast": "Последняя", 
                 "sNext": "Следующая", 
                      "sPrevious": "Предыдущая"
      }
                                                                                                              
                                                             
                            
    }
    });
        $('#example').dataTable().columnFilter({
                            aoColumns: [null,null,null,null]

                    });
    });
</script>
{/literal}
    <div >
                   <a id="add_producers" title="Добавить производителя"
   onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', width: '800', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=producers&option=add{/literal}"
   > 
               Добавить производителя
            </a>
    </div>
<h2>Производители:</h2><br>
<table   id="example" width="100%">
    <thead>
    <tr>
        <th>Название</th>
        <th>Лого</th>
 
        <th>Редактировать</th>
        <th>Удалить</th>
        
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
{foreach from=$producers item=item}
    <tr>
    <td>
        {$item.name}
    </td>
    <td>
        <img src="{$item.logo}" >
    </td>
    <td>
            
            <a id="edt_page_{$item.id}" title="Edit {$item.name}"
   onclick="
   {literal}
       return hs.htmlExpand(this, { objectType: 'iframe', width: '800', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=producers&option=edit&id={/literal}{$item.id}"
   > 
               <img src="/src/edit.gif" style="height:50px">
            </a>
        </td>
        <td>
             <a onclick=" {literal}
                if(confirm('Delete record{/literal} {$item.name} {literal}?'))
                 $.get('/admin.php?id={/literal}{$item.id}{literal}&module=producers&option=delete', function(data){window.location.reload();}); else return false;
                {/literal}
           " href="javascript:void(0)"
                >
            <img src="/src/del.gif" style="height:50px">
            </a>
        </td>
        </tr>
        
{/foreach}
</table>