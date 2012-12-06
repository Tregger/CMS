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
	<style type="text/css" media="screen">
			@import "/media/css/site_jui.ccss";
			@import "media/css/demo_table_jui.css";
						@import "/media/css/themes/smoothness/jquery-ui-1.7.2.custom.css";
			
			/*
			 * Override styles needed due to the mix of three different CSS sources! For proper examples
			 * please see the themes example in the 'Examples' section of this site
			 */
			.dataTables_info { padding-top: 0; }
			.dataTables_paginate { padding-top: 0; }
			.css_right { float: right; }
                        #example_wrapper{position: absolute; width: 748px;}
			#example_wrapper .fg-toolbar { font-size: 0.8em }
			#theme_links span { float: left; padding: 2px 10px; }
                        #example tr td{padding:5px;}
                        #example tr th{padding:5px;}
			
		</style>
<script type="text/javascript">
    $(document).ready(function(){
          oTable = $('#example').dataTable({
        "bJQueryUI": true,
        "sPaginationType": "full_numbers", 
            "oLanguage": {
                "sSearch": "Filter records:", 
                "sEmptyTable": "No messages", 
                "sInfo": "Got a total of _TOTAL_ entries to show (_START_ to _END_)", 
                    "sInfoEmpty": "No entries to show", 
                        "sInfoFiltered": " - filtering from _MAX_ records", 
                            "sInfoPostFix": "All records shown are derived from real information.", 
                                 "sInfoThousands": "'", 
                                     "sLengthMenu": "Display _MENU_ records",
                                         "sLoadingRecords": "Please wait - loading...", 
                                             "sProcessing": "DataTables is currently busy",
                                                 "sZeroRecords": "No messages to display", 
                                                       "oAria": {
        "sSortAscending": " - click/return to sort ascending",
             "sSortDescending": " - click/return to sort descending"
      }, 
           "oPaginate": {
        "sFirst": "First page", 
             "sLast": "Last page", 
                 "sNext": "Next page", 
                      "sPrevious": "Previous page"
      }
                                                                                                              
                                                             
                            
    }
    });
        $('#example').dataTable().columnFilter({
                            aoColumns: [null,null,null,null,null,null,null,null]

                    });
    });
</script>
{/literal}
<script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript" src="/tinymce/jscripts/tiny_mce/plugins/tinybrowser/tb_tinymce.js.php"></script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		plugins : "autolink,lists,pagebreak,style,layer,table,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave,visualblocks",

		// Theme options
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull",
		theme_advanced_buttons2 : "bullist,numlist,|,undo,redo,|,link,unlink,image,cleanup,code,|,forecolor",
		//theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
		//theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft,visualblocks",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,
                file_browser_callback : "tinyBrowser",	
		// Example content CSS (should be your site CSS)
		content_css : "css/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "lists/template_list.js",
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",
		media_external_list_url : "lists/media_list.js",


		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
</script>

<div class="site_header2" style="height:0px!important;">

				<div method="POST" action="" class="menu5">
					<ul class="items">
						<li class="active">
							<a href="">
								Activity
							</a>
						</li>
						<li>
							<a href="/index.php?page=mynorshin&action=inbox">
								Messages
							</a>
							<span class="messages_num">
								{if $message_count!=0}({$message_count}){/if}
							</span>
						</li>
						<li>
							<a href="">
								Account
							</a>
						</li>
					</ul>
				</div>
				<div class="total_members">
					<span class="num">
						Total members: 83233
					</span>
					<span class="online_num">
						(8)
					</span>
					<br>
					<span class="date">
						18.01.2012
					</span>
				</div>
			</div>

<div class="page_my_cabinet">
					<div class="column">
						{display_dashboard_menu}
					</div>
					<div class="column2">
						<ul class="navigation_chain2">
							<li>
								Home /
							</li>
							<li>
								Inbox
							</li>
						</ul>
						<h3 class="heading h3">
							{$message.subject}
						</h3>
                                                 <p>From <b> {display_username id=$message.id_who}</b> (<u>{$message.date}</u>)</p>
                                        <hr>
                                        <br>
                                        
                                                 <p>{$message.text}</p>
						<div class="clearfix2">
							<span></span>
						</div>
                                            <!- -- -->
                                            
                                            <div class="clearfix" style="height:20px;">
                                            
					</div>
				</div>