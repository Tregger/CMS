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
                "sSearch": "Отфильтровать товары:", 
                "sEmptyTable": "Нет товаров", 
                "sInfo": "Показано  _TOTAL_ записей (_START_ - _END_)", 
                    "sInfoEmpty": "No entries to show", 
                        "sInfoFiltered": " - отфильтровано  _MAX_ записей", 
                            "sInfoPostFix": ".", 
                                 "sInfoThousands": "'", 
                                     "sLengthMenu": "Показать _MENU_ записей",
                                         "sLoadingRecords": "Загружаются данные для отображения", 
                                             "sProcessing": "Сейчас выполняется запрос, пожалуйста подождите",
                                                 "sZeroRecords": "Нет товаров для отображения", 
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
                            aoColumns: [null,null,null,null,null,null,null,null]

                    });
    });
</script>
{/literal}
<div class="categor">Выбранная категория : {$cat_name}</div>
<br>
<table id="example" style="width:100%" style="text-align:center;" align="center">
    <thead>
        <tr>
            <th>Изображение</th>
            <th>Название</th>
            <th>Цена</th>
            <th>Сортировка</th>
            <th>Удалить</th>
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
{foreach from=$records item=elm}
    <tr>
        <td>{if $elm.img }
                <a href="/admin.php?id={$elm.id}&module=catalog&option=edit_img" onclick="
                {literal}
                return hs.htmlExpand(this, { 
            objectType: 'iframe', width: '800', 
            creditsPosition: 'bottom left', headingEval: 'this.a.title', 
            wrapperClassName: 'titlebar' } )
               {/literal}
               " title="Редактирование {$elm.name}" id="edit_img_{$elm.id}">
            <img src="{$elm.img}" style="height:70px;"/>
               </a>
            {else}
            <a href="/admin.php?id={$elm.id}&module=catalog&option=edit_img" onclick="
                {literal}
                return hs.htmlExpand(this, { 
            objectType: 'iframe', width: '800', 
            creditsPosition: 'bottom left', headingEval: 'this.a.title', 
            wrapperClassName: 'titlebar' } )
               {/literal}
               " title="Edit record {$elm.name}" id="edit_img_{$elm.id}">
                Добавить изображение
            </a>
            
            
            {/if}</td>
        <td>
            <a href="/admin.php?id={$elm.id}&module=catalog&option=edit" onclick="
                {literal}
                return hs.htmlExpand(this, { 
            objectType: 'iframe', width: '800', 
            creditsPosition: 'bottom left', headingEval: 'this.a.title', 
            wrapperClassName: 'titlebar' } )
               {/literal}
               " title="Редактирование {$elm.name}" id="edit_rec_{$elm.id}">
                {$elm.name}
            </a>
            
        
        </td>
        <td>{$elm.price}</td>
        <td><input type="text" size="3" id="ord" value="{$elm.ord}" onchange="$.get('/admin.php?id={$elm.id}&module=catalog&option=change_ord&ord='+this.value)"> <input type="button" onclick="$.get('/admin.php?id={$elm.id}&module=catalog&option=change_ord&ord='+document.getElementById('ord').value)" value="ok"></td>
        <td><a href="javascript:void(0)" onclick="
            {literal}
           	if(confirm('Delete record {/literal}{$elm.name}{literal}?'))
			$.get('/admin.php?id={/literal}{$elm.id}{literal}&module=catalog&option=delete', function(data){$('#{/literal}{$elm.id_p}{literal}').click()}); 
				else return false;    
            {/literal}
           "><img src="/src/del.gif" height="50" border="0"/></a></td>
    </tr>
{/foreach}
</tbody>
</table>

