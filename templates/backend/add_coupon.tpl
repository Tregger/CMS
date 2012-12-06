<LINK href="/css/style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
  
	<script src="/js/jquery-ui-1.8.24.custom.min.js"></script>
           <link rel="stylesheet" type="text/css" href="/css/jquery-ui-1.8.16.custom.css">
	<script language="JavaScript" type="text/javascript" src="/js/calendar/jquery.animate.clip.js"></script>
	<script language="JavaScript" type="text/javascript" src="/js/calendar/jCal.min.js"></script>
        <link rel="stylesheet" type="text/css" href="/js/calendar/jCal.css">
        <script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript" src="/tinymce/jscripts/tiny_mce/plugins/tinybrowser/tb_tinymce.js.php"></script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		plugins : "autolink,lists,pagebreak,style,layer,table,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave,visualblocks",

		// Theme options
		theme_advanced_buttons1 : "bold,italic,underline,|,justifyleft,justifycenter,justifyright,justifyfull,forecolor,backcolor",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "", 
		theme_advanced_buttons4 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,
                file_browser_callback : "tinyBrowser",	
		// Example content CSS (should be your site CSS)
		

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
	<script>

		$(document).ready(function () {
                $("#datepicker").datepicker();
                $("#datepicker").change(function(){
                    $('.expire_date').html($(this).val());
                });
			$('#calOne').jCal({
				day:			new Date(),
				days:			4,
				showMonths:		1,
				monthSelect:	true,
				dCheck:			function (day) {
						if ( day.getTime() == (new Date('8/7/2008')).getTime() ) return false;
						return (day.getDate() != 3);
					},
				callback:		function (day, days) {
                              
                     
                                  document.getElementById('st_day').value=day.getTime()/1000;
                                  document.getElementById('day_col').value=days;
                                  if (((0-day.getTimezoneOffset())/60)>=0){
                                  document.getElementById('timezone').value="GMT+"+((0-day.getTimezoneOffset())/60);
                                  }else{
                                  document.getElementById('timezone').value="GMT"+((0-day.getTimezoneOffset())/60);
                                 }
						return true;
					}
				});
			
		});
            
	</script>
        <style>
		.dInfo {
			font-family:tahoma;
			font-size:7pt;
			color:#fff;
			padding-top:1px;
			padding-bottom:1px;
			background:rgb(0, 102, 153);
		}
                .calendar table div{
                    clear: none;
                }
                .voudcher_body{
				background: #85ce00;
				width: 410px;
/*				height: 210px;*/
				padding: 0 5px 5px 5px;
			}
			.bottom_vouecher{
				border: 3px dotted white;
/*				height: 155px;*/
				padding:1px;
			}
			.bottom_voucher_body{
				background: none repeat scroll 0 0 #FFFFFF;
/*				height: 145px;*/
				margin-left: -2px;
				margin-top: -2px;
				width: 392px;
				padding: 7px;
			}
			.savings_section{
				float:left;
				text-align: center;
				background: #eeeeee;
				color: #747c80;
				font-family: arial;
				padding: 3px 9px;
				margin-left: 20px;
				margin-right: 46px;
                                display: inline-block;
                                margin-bottom: -2px;
			}
			.top_savings{
				font-size: 12px;
			}
			.bottom_savings{
				font-size: 33px;
                                font-weight: bold;
                                line-height: 26px;
			}
			.bottom_savings span{
				font-size: 17px;
				position: relative;
				top: -10px;
			}
			.voucher_title{
				color: #333333;
				font-family: arial;
				font-size: 24px;
			}
			.voucher_receive{
				color: #333333;
				font-family: arial;
				font-size: 16px;
				font-weight: bold;
			}
			.bottom_voucher_body table{
				  margin: 0;
				padding: 0;
                                width: 100%;
			}
			.bottom_voucher_body table tr td{
				  margin: 0;
				padding: 0;
                                width: 50%;
			}
			.bottom_voucher_body table tr td h1{
				color: #00a2e8;
				font-size: 16px;
				font-family: arial;
				font-weight: bold;
				margin: 0;
				padding: 0;
			}
			.redeem_table_left{
				 width: 46%;
				 font-family: arial;
				 vertical-align: top;
			}
			.redeem_table_right{
				vertical-align: top;
				font-family: arial;
				text-align: center;
			}
			.voucher_text{
				font-size: 13px;
			}
			.redemption_code_number{
				font-size: 20px;
				font-weight: bold;
			}
                        .voucher_logo{
                            width: 273px;
                             display: inline-block;
                        }
                        .top_voucher{
                           
                        }
                        .info_sharing{
                            overflow:hidden;
                        }
	</style>

<script type="text/javascript">
    function onResponse(d) {  
        eval('var obj = ' + d + ';');  
        if(obj.success){
                    $('#file_'+obj.id_block+'_image').html("");
                      //  alert('#'+obj.id_block);
                    $('#file_'+obj.id_block+'_image').append("<img src='/uploads/"+obj.filename+"'>") ;
                    $('#pic'+ obj.id_block).val('/uploads/'+obj.filename);
        }else{
            alert("Upload file has failed, please choose another file, or try again");
        }

        }  
    
        function checkboxClick(id) {
            var idCheck = id + "Check";
            //alert(idCheck);
            if (document.getElementById(id).className == "checkbox active" ) {
                document.getElementById(idCheck).value = "false";
                document.getElementById(id).className = "checkbox";
            }
            else {
                document.getElementById(idCheck).value = "true";
                document.getElementById(id).className = "checkbox active";
            }
        }
        function radiobuttonClick(id,idParent) {
            //document.getElementById(idParent)    
            var count = 0;
            var countDiv=0;
            for(var i=0; i<document.getElementById(idParent).childNodes.length; i++) {
                var child = document.getElementById(idParent).childNodes[i]
                    if (child.tagName=="DIV") countDiv++;
        	}     
            var countLi = 0;
            for(var i=0; i<document.getElementById(idParent).childNodes.length; i++) {
                var child = document.getElementById(idParent).childNodes[i]
                    if (child.tagName=="LI") countLi++;
        	}  
            if (countDiv>countLi) count = countDiv;
            else count = countLi;            
            for (i=1;i<=count;i++) {
                var currentId = idParent + i;
                var currentHideId = idParent + 'H' + i;
                
                if (id == (currentId)) {
                    document.getElementById(currentId).className = "radiobutton active";
                    document.getElementById(currentHideId).checked = true;                    
                }
                else {
                    document.getElementById(currentId).className = "radiobutton";
                    document.getElementById(currentHideId).checked = false;
                }
            }            
        }
        function SelectAll (idParent) {            
            var countLi = 0;
            for(var i=0; i<document.getElementById(idParent).childNodes.length; i++) {
                var child = document.getElementById(idParent).childNodes[i]
                    if (child.tagName=="LI") countLi++;
            }              
            for (i=1;i<=countLi;i++) {
                var id = idParent + i;
                var idCheck = id + "Check"
                document.getElementById(idCheck).value = "true";
                document.getElementById(id).className = "checkbox active";               
            }
        }
        function DeSelectAll (idParent) {
            var countLi = 0;
            for(var i=0; i<document.getElementById(idParent).childNodes.length; i++) {
                var child = document.getElementById(idParent).childNodes[i]
                    if (child.tagName=="LI") countLi++;
            }              
            for (i=1;i<=countLi;i++) {
                var id = idParent + i;
                var idCheck = id + "Check"                
                document.getElementById(idCheck).value = "false";
                document.getElementById(id).className = "checkbox";                
            }
        }
        
        function calculate(){
            var price = document.getElementById('price').value;
            var now_price = document.getElementById('now_price').value;
            var discount= document.getElementById('discount').value;
            if(price){
                    $('#price_label').html('$'+price);
                    
                        if($('#discount').is(':focus')){
                            $('#l_discount').html(discount);
                            document.getElementById('now_price').value=(price-(price*(discount/100))).toFixed(2);
                            $('#value').html('$'+(price-(price*(discount/100))).toFixed(2));
                        }else{
                         $('#value').html('$'+now_price);
                            document.getElementById('discount').value=(100-(now_price/price*100)).toFixed(2);
                            $('#l_discount').html((100-(now_price/price*100)).toFixed(2)+"%");
                         }
                         var total=$('#value').html();
                    $('#total_cost').html(total);
                    
                    
                    
//                        if(now_price){
//                            $('#value').html('$'+now_price);
//                            document.getElementById('discount').value=100-(now_price/price*100);
//                            $('#l_discount').html(100-(now_price/price*100)+'%');
//                        }else{
//                            alert('Please enter discount value or new price for deal');
//                        }
                    
              
            }else{
                alert("Please enter full price for deal");
            }
        }
        {literal}
          function submit_deal(){
                      data=$('#add_coupon').serialize(); 
              data2=$('#sec_form').serialize();
                  dat=data+"&"+data2+"&record[desc]="+tinyMCE.get('descr').getContent()+"&record[highlights]="+tinyMCE.get('highlights').getContent()+"&record[fineprint]="+tinyMCE.get('fineprint').getContent();
             
  $.ajax({
                      {/literal}
                          {if $coupon}
                              url : '/func/ajaxfunc.php?option=edit_coupon',
                           {else}
                              url : '/func/ajaxfunc.php?option=add_coupon',
                           {/if}
                      {literal}
                      type: 'POST',
                      data: dat,
                          success: function(){
$('#paypal_form').submit();
                }
                              
                   
                });
        }
        $(document).ready(function(){
                $('#activate_coupon').click(function(){
        $.get('/func/ajaxfunc.php?option=check_coupon&coupon='+$('#coupon').val(), function(data){
            if(data=='0'){
                alert('Sorry, but your promotion code is invalid or has expired');
            }else{
                alert('Congratulations! Your have '+data+'% discount to the publication of this deal');
                    $('.applyBlock').css('visibility', 'hidden');
                        $('#paypal_amount').val({/literal}({$price_post}-({$price_post}*data/100)).toFixed(2){literal});
            }           $('#amount_label').html({/literal}({$price_post}-({$price_post}*data/100)).toFixed(2){literal});
            
        });
    });
            $('#title_input').keyup(function(){
               $('.voucher_title').html($(this).val());
                   $('#coupon_title_check').val('Payment for publication deal "'+$(this).val()+'"');
            });
                  $('#city_input').change(function(){
                      city = $('#state_input').val()+", "+$('#city_input').val() ;
                          address=$('#street_input').val()+", "+$('#zip_input').val()+"<BR>  "+$('#phone_input').val();
                     $('.redeem_table_left h1').html(city);
                     $('.voucher_text').html(address);
            });
                          $('#street_input').keyup(function(){
                      city = $('#state_input').val()+", "+$('#city_input').val() ;
                          address=$('#street_input').val()+", "+$('#zip_input').val()+"<BR> "+$('#phone_input').val();
                     $('.redeem_table_left h1').html(city);
                     $('.voucher_text').html(address);
            });
                                  $('#state_input').change(function(){
                      city = $('#state_input').val()+", "+$('#city_input').val() ;
                          address=$('#street_input').val()+", "+$('#zip_input').val()+"<BR>  "+$('#phone_input').val();
                     $('.redeem_table_left h1').html(city);
                     $('.voucher_text').html(address);
            });
                                       $('#zip_input').keyup(function(){
                      city = $('#state_input').val()+", "+$('#city_input').val() ;
                          address=$('#street_input').val()+", "+$('#zip_input').val()+"<BR>  "+$('#phone_input').val();
                     $('.redeem_table_left h1').html(city);
                     $('.voucher_text').html(address);
            });
            $('#phone_input').keyup(function(){
                      city = $('#state_input').val()+", "+$('#city_input').val() ;
                          address=$('#street_input').val()+", "+$('#zip_input').val()+"<BR>  "+$('#phone_input').val();
                     $('.redeem_table_left h1').html(city);
                     $('.voucher_text').html(address);
            });
           $('.saveDraftBut').click(function(){
               data=$('#add_coupon').serialize(); 
              data2=$('#sec_form').serialize();
                  dat=data+"&"+data2+"&record[desc]="+tinyMCE.get('descr').getContent()+"&record[highlights]="+tinyMCE.get('highlights').getContent()+"&record[fineprint]="+tinyMCE.get('fineprint').getContent();
             
  $.ajax({
                      {/literal}
                          {if $coupon}
                              url : '/func/ajaxfunc.php?option=edit_coupon',
                           {else}
                              url : '/func/ajaxfunc.php?option=add_coupon',
                           {/if}
                      {literal}
                      type: 'POST',
                      data: dat, 
                          success: function(msg){
                                
                                        window.location.href="/index.php?page=coupons&action=mydeals";
   
                         }
                });
            });
                
          
         $('#discount').keyup(function(){calculate()});
         $('#now_price').keyup(function(){calculate()});
         $('#price').keyup(function(){calculate()});    
             $('.photoBut').click(function(){
              
                  var id=$(this).attr('id');
                         
               $('#'+id+'_input').click();
                     
             });
                 
                $('.file_loader').change(function(){
                    var id=$(this).attr('id');
                    var elements= id.split('_');
//                    $('#file_'+elements[1]+'_image').html("");
//                        alert('#'+id);
//                    $('#file_'+elements[1]+'_image').append("<img src='"+$('#'+id).val()+"'>") ;
            this.form.submit();
                });
        });
            {/literal}
    </script>

    <iframe id="rFrame" name="rFrame" style="display: none"></iframe>  

<form id="add_coupon">
    {if $coupon}
         <input type="hidden" name='record[where]' value="{$coupon.id}">
    {/if}
    <input type="hidden" name='record[status]' value="drafts">
         <input type="hidden" name="record[after_insert]" value='      <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("add_page");
           if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
            
        }
        parent.window.location.reload();
        
         </script>'>
	<div class="contentBlock">
	
		<div class="merchantsCont">
			<div class="greenStrip">
				<p>Create a descriptive title, select category and set your price</p>
			</div>
			<div class="titleCategory">
				<div class="titleType">
					<h1>Title:</h1>
					<input type="text" id="title_input" name="record[title]" value="{$coupon.title}" placeholder="Title for deal(max 255 symbol)">
					<p>(Your title has 60 characters remaining)</p>
				</div>
				<div class="categoryType">
					<h1>Select category:</h1>
					<select name="record[id_category]">
                                                {display_select_categories}
					</select>
				</div>
			</div>
                           <!-- -->
                           <div class="titleCategory">
				<div class="titleType">
					<h1>Claim:</h1>
					<input type="text" name="record[claims]" class="form-text" style="width:100px"  value="{$coupon.claims}" >
					<p></p>
				</div>
				
			</div>
                           <!-- -->
			<div class="setTips">
				<div class="setPrice">
					<h1>Set Price, Calculate discount/savings:</h1>
					<table>
						<tr>
							<td>Original Price:</td>
							<td><input type="text" class="form-text" value="{$coupon.price}" name="record[price]" id="price"></td>
						</tr>
						<tr>
							<td>Discount %:</td>
							<td><input type="text" class="form-text" id="discount" {if $coupon}value="{round(100-($coupon.c_price/$coupon.price*100))}%"{/if}></td>
							<td><h1><span>(or) </span>Now Price:</h1></td>
							<td><input type="text" class="form-text" name="record[c_price]" value="{$coupon.c_price}" id="now_price"></td>
						</tr>
					</table>
					<div class="totalCost">
						<a href="javascript:void(0)" onclick="calculate();" class="calculateBut">Calculate</a>
						<div class="cost">
							<h1>Total Cost: <span id="total_cost">${$coupon.c_price}</span></h1>
							<div class="valueDiscont">
								<div class="value">
									<p>Price:</p>
									<h1 id="price_label">${$coupon.price}</h1>
								</div>
								<div class="value">
									<p>Discount:</p>
									<h1 id="l_discount">{round(100-($coupon.c_price/$coupon.price*100))}%</h1>
								</div>
								<div class="value">
									<p>Value:</p>
									<h1 id="value">${$coupon.c_price}</h1>
								</div>
							</div>
						</div>
						<div class="resetSave">
<!--							<a href="#" class="resetBut" onclick="document.getElementById('add_coupon').reset();">Reset</a>
							<a href="#" class="saveBut" onclick="document.getElementById('add_coupon').submit();">Save</a>
							-->
						</div>
					</div>
				</div> 
				<div class="tipsSet">
					<h2>Tips</h2>
					<p>1.Your deal title should be catchy, enticing and succinct to attract maximum views.</p>
					<p>2. Assign the price of the products/services on offer by entering the Original Price and 
					either of the two  - Discount (%) or Now/Discounted Price. All the remaining parameters will 
					be automatically set.</p>
				</div>
			</div>
			<div class="orangeStrip">
				<p>Upload photos, enter your address and set working hours</p>
			</div>
                                        <input type="hidden" name="record[imgs][pic1]" id="pic1" value="{$coupon.imgs.pic1}"/>
                                        <input type="hidden" name="record[imgs][pic2]" id="pic2" value="{$coupon.imgs.pic2}" />
                                        <input type="hidden" name="record[imgs][pic3]" id="pic3" value="{$coupon.imgs.pic3}" />
                                        <input type="hidden" name="record[imgs][pic4]" id="pic4" value="{$coupon.imgs.pic4}"/>
                                        <input type="hidden" name="record[imgs][pic5]" id="pic5" value="{$coupon.imgs.pic5}" />
       </form>
      
			<div class="addPhoto">
				<div class="addAPhoto">
					<p>To upload photos. click <span>“add a photo”</span>and select the photo you want to upload</p>
					<div class="photoBlocks">
						<div class="photoBlock">
							<div class="photoImage" id="file_1_image">
                                                            {if $coupon.imgs.pic1}
								<img src="{$coupon.imgs.pic1}">	
                                                                {else}
                                                                    <img src="/img/photo.jpg">
                                                                    {/if}
							</div>
                                                   <form action="/func/uploader.php" target="rFrame" method="POST" enctype="multipart/form-data">  
                                                        <input name="loadfile" type="file" id="file_1_input" class="file_loader" style="display:none;"/>
                                                         <input type="hidden" name="block" value="1">   
                                                        <!--                                                    
<input type="file" name="file1" id="file_1_input" class="file_loader" style="display:none;">-->
							<a class="photoBut" href="javascript:void(0)" id="file_1">Add a photo</a>
                                                        </form>
                                                </div>
						<div class="photoBlock">
							<div class="photoImage" id="file_2_image">
								    {if $coupon.imgs.pic2}
								<img src="{$coupon.imgs.pic2}">	
                                                                {else}
                                                                    <img src="/img/photo.jpg">
                                                                    {/if}						
							</div>
                                                     <form action="/func/uploader.php" target="rFrame" method="POST" enctype="multipart/form-data">  
                                                        <input name="loadfile" type="file" id="file_2_input" class="file_loader" style="display:none;"/>
                                                         <input type="hidden" name="block" value="2">   
							<a class="photoBut" href="javascript:void(0)" id="file_2">Add a photo</a>
                                                        </form>
						</div>
						<div class="photoBlock">
							<div class="photoImage" id="file_3_image">
								    {if $coupon.imgs.pic3}
								<img src="{$coupon.imgs.pic3}">	
                                                                {else}
                                                                    <img src="/img/photo.jpg">
                                                                    {/if}							
							</div>
                                                     <form action="/func/uploader.php" target="rFrame" method="POST" enctype="multipart/form-data">  
                                                        <input name="loadfile" type="file" id="file_3_input" class="file_loader" style="display:none;"/>
                                                        <input type="hidden" name="block" value="3">   
							<a class="photoBut" href="javascript:void(0)" id="file_3">Add a photo</a>
                                                     </form>
						</div>
						<div class="photoBlock">
							<div class="photoImage" id="file_4_image">
								    {if $coupon.imgs.pic4}
								<img src="{$coupon.imgs.pic4}">	
                                                                {else}
                                                                    <img src="/img/photo.jpg">
                                                                    {/if}						
							</div>
                                                      <form action="/func/uploader.php" target="rFrame" method="POST" enctype="multipart/form-data">  
                                                        <input name="loadfile" type="file" id="file_4_input" class="file_loader" style="display:none;"/>
                                                        <input type="hidden" name="block" value="4"> 
							<a class="photoBut" href="javascript:void(0)" id="file_4">Add a photo</a>
                                                        </form>
						</div>
						<div class="photoBlock" id="file_5_image">
							<div class="photoImage">
								    {if $coupon.imgs.pic5}
								<img src="{$coupon.imgs.pic5}">	
                                                                {else}
                                                                    <img src="/img/photo.jpg">
                                                                    {/if}						
							</div>
                                                        <form action="/func/uploader.php" target="rFrame" method="POST" enctype="multipart/form-data">  
                                                            <input name="loadfile" type="file" id="file_5_input" class="file_loader" style="display:none;"/>
                                                            <input type="hidden" name="block" value="5"> 
                                                            <a class="photoBut" href="javascript:void(0)" id="file_5">Add a photo</a>
                                                        </form>
						</div>
					</div>
<!--					<div class="textString">
					Need to upload even more photos? <a href="#">Click here.</a>
					</div>-->
				</div>
                            <form id="sec_form">
				<div class="streetTipsBlocks">
				<div class="streetTips">
					<div class="streetAdress">
						<p>Street Address:</p>
						<input type="text" id="street_input" name="record[street_address]" value="{$coupon.street_address}"/>
					</div>
					<div class="citySelect">
						<div class="city">
							<p>City:</p>
                                                        {display_cities_select}
							
						</div>
				
					</div>
					<table class="stateString">
						<tr>
							<td class="state">State:</td>
							<td class="zip">Zip Code:</td>
							<td class="phone">Phone Number:</td>
						</tr>
						<tr>
							<td class="state">
						<select name="record[state]" id="state_input">
							<option>WA</option>
							
						</select>
							</td>
							<td class="zip"><input type="text" name="record[zip]" id="zip_input" value="{$coupon.zip}"></td>
							<td class="phone"><input type="text" name="record[phone]" id="phone_input" value="{$coupon.phone}"></td>
						</tr>
					</table>
					<div class="workHours">
						<p>Work  Hours:</p>
						<table>
							<tr>
								<td>Start time:</td>
								<td>
						<select name="record[start_time]">
							<option>6:00 AM</option>
							<option>7:00 AM</option>
							<option>8:00 AM</option>
                                                        <option>9:00 AM</option>
                                                        <option>10:00 AM</option>
						</select></td>
								<td>End time:</td>
								<td>
						<select name="record[end_time]">
							<option>6:00 PM</option>
							<option>7:00 PM</option>
							<option>8:00 PM</option>
                                                        <option>9:00 PM</option>
                                                        <option>10:00 PM</option>
						</select></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="tipsSet1">
					<h2>Tips</h2>
					<p>1.The image should be eye-catching and appropriate represent what your deal is all about. The images and pictures are always more attractive than the written word.That's why your image needs to be thoughtfully selected to impress upon the wievers. </p>
					<p>2. The address details and working hours should be accurate to provide accurate directions to the customers.</p>
				</div>
				</div>
			</div>
			<div class="yellowStrip">
				<p>Describe your deal</p>
			</div>
			<div class="redactorBlocks">
				<div class="redactor">
                                    <h1 style="font-size: 20px">Description</h1>
                                    <textarea  id="descr" style="width:100%;">{$coupon.desc}</textarea>
				</div>
                                <div class="redactor">
                                    <h1 style="font-size: 20px">Hightlights</h1>
                                    <textarea  id="highlights" style="width:100%;">{$coupon.highlights}</textarea>
				</div>
                                 <div class="redactor">
                                    <h1 style="font-size: 20px">Fine Print</h1>
                                    <textarea  id="fineprint" style="width:100%;">{$coupon.fineprint}</textarea>
				</div>
				<div class="tipsSet2" style="top: -591px; position: relative;">
					<h2>Tips</h2>
					<p>Some tips for describing your deal:</p>
					<p>1.Make your description <br>catchy and interesting in<br> order to entice the <br>customers.</p>
					<p>2.Check your grammar and typos.</p>
					<p>2.Mention the obvious details that buyer would like to know, like color, size, weight, dimensions, etc.</p>
					<p>3.A service deal must specifically and clearly <br>identify the nature of services on offer.</p>
				</div>
			</div>
			<div class="redStrip">
				<p>Choose days to display your deal</p>
			</div>
			<div class="calendarBlocks">
				<div class="tipsSet3">
					<h2>Tips</h2>
					<p>This section allows you to set the date on which the deal will run  on the site. Just select count of days, when deal will display and click on the  start date when deal start running </p>
				</div>
				<div class="calendar">
<!--					<img src="img/calendar.jpg">-->
<table width="100%">
	<tr>
		<td align=left valign=top style="padding:10px;">
			
			Select Number of Days
			<select id="calOneDays" onChange="$('#calOne').data('days', $('#calOneDays').val());">
				<option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
				<option value="4" SELECTED>4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
				<option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
				<option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
			</select>
		</td>
	
	</tr>
	<tr>
		<td align=left id="calOne" valign=top style="padding:10px;">
			loading calendar one...
		</td>
		
	</tr>
	<tr>
		<td align=left id="calOneResult" valign=top style="padding:10px;"></td>
		<td align=left id="calTwoResult" valign=top style="padding:10px;"></td>
	</tr>
</table>
<input type="hidden" name="record[st_day]" id="st_day" value="{$coupon.st_day}">
<input type="hidden" name="record[day_col]" id="day_col" value="{$coupon.day_col}">
<input type="hidden" name="record[timezone]" id="timezone" value="{$coupon.timezone}">
				</div>
			</div> 
                                 <div class="dotted_border" style="height:1px; border-bottom:1px dotted #333;margin: 30px 0;"></div>
                                 <table>
                                <tr>
                                    <td style="padding-right: 100px;">
                                        <div class="">
                                            <h4>Enter the redemption code for<br> your voucher below</h4>
                                            <input type="text" name="record[redemption]" onkeyup="$('.redemption_code_number').html(this.value)" style="border: 1px solid #eee; height: 30px;width: 280px; margin-bottom: 10px;"/>
                                        <h4>Select expiration date:</h4>
                                            <input name="record[coupon_expire]" id="datepicker" style="border: 1px solid #eee; height: 30px;width: 280px; margin-bottom: 10px;">
                                        </div>
                                        <div class="tipsSet2" style="margin-left: 0!important; width: 280px!important;">
                                            <h2>Tips</h2>
                                            <p>Some tips for describing your deal:</p>
                                            <p>1.Make your description <br>catchy and interesting in<br> order to entice the <br>customers.</p>
                                            <p>2.Check your grammar and typos.</p>
                                            
                                        </div>
                                    </td>
                                    <td>
                                        	<div class="voudcher_body">
			<div class="top_voucher">
				<div class="savings_section">
					<div class="top_savings">SAVINGS</div>
					<div class="bottom_savings">50<span>%</span></div>
				</div>
				<div class="voucher_logo">
					<img src="img/voucher_logo.png" />
				</div>
			</div>
			<div class="bottom_vouecher">
				<div class="bottom_voucher_body">
					<div class="voucher_title">
						$10 For $20 Worth Choc (Purchaser Will Receive 2-$10 Certificates)
					</div>
					<div class="voucher_receive">
						Redeem at:
					</div>
					<table>
						<tr>
							<td class="redeem_table_left">
								<h1>Manhattan Elite Prep</h1>
								<div class="voucher_text">
									1 Notts Avenue Notts Avenue<br>
									Bondi, NSW<br>
									(02)9130 3120
								</div>
							</td>
							<td class="redeem_table_right">
								<b>Expires:</b> <div class="expire_date">September 12, 2012</div>
								<div class="redemption_code">Redemption Code</div>
								<div class="redemption_code_number">KDOE345</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
                                    </td>
                                </tr>
                            </table>
                                 </form>
                                  <form action="https://paypal.com/cgi-bin/webscr" method="post" id="paypal_form"  >   
                                        <input type="hidden" name="os0" value="{$smarty.session.userid}">
                      
                                        <input type="hidden" name="cmd" value="_xclick">
                                        <input type="hidden" name="business" value="payment@dealhoster.com">
<!--                                       <input type="hidden" name="business" value="regger_1349628753_biz@mail.ru">-->
                                        <input type="hidden" name="lc" value="EN">
                                        <input type="hidden" name="item_name" id="coupon_title_check" value="">
                                        {if !isset($smarty.session.used_coupon)}
                                        <input type="hidden" name="amount" id="paypal_amount" value="{$price_post}">
                                        {else}
                                             <input type="hidden" name="amount" value="{$price_post-($price_post*$smarty.session.coupon_discount/100)}">
                                            {/if}
                                        <input type="hidden" name="currency_code" value="USD">
                                        <input type="hidden" name="button_subtype" value="services">
                                        <input type="hidden" name="no_note" value="0">
                                        <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
                                        <input type="hidden" name="return" value="http://dealhoster.com/index.php?page=billing&action=succes" />
                                        <input type="hidden" name="notify_url" value="http://dealhoster.com/index.php?page=billing&action=succes" />
			<div class="applyCheckoutBlocks">
                            {if !isset($smarty.session.used_coupon)}
<!--				<div class="applyBlock">
					<p>Enter a promotion code</p>
					<table>
						<tr>
							<td><input type="text" id="coupon" name="record[promotion]"></td>
							<td><a class="applyBut" id="activate_coupon" href="javascript:void(0)">Apply</a></td>
						</tr>
					</table>
				</div>-->
                                {else}
                                    	<div class="applyBlock" style="visibility: hidden">
					<p>Enter a promotion code</p>
					<table>
						<tr>
							<td><input type="text" id="coupon" name="record[promotion]"></td>
							<td><a class="applyBut" id="activate_coupon" href="javascript:void(0)">Apply</a></td>
						</tr>
					</table>
				</div>
                           {/if}
                           
<!--                            <div class="checkoutBlock">
					<div class="price">
						<h1>Your Total Due Today:</h1>
                                                {if !isset($smarty.session.used_coupon)}
						<h2 id="amount_label">${$price_post}</h2>
                                                {else}
                                                   <h2> {$price_post-($price_post*$smarty.session.coupon_discount/100)}</h2>
                                                  {/if}
					</div>
					<div class="addCheckout">
						<a href="javascript:void(0)" class="saveDraftBut" style="background: none; margin:0;">Add another deal</a>
						<p>or</p>
						<a class="checkoutBut" style="margin-right:0;" href="javascript:void(0)" onclick="submit_deal();">Checkout</a>
					</div>
					<div class="smallText">You will have another chance to review your order before it is finalized.</div>
				</div>-->
			</div>
		</div>
                                </form>
		<div class="saveDraft">
			<div class="checkform">
				<span class="checkbox active" id="property10">
				<span class="checkbox_image" onclick="checkboxClick('property10');"></span>
				<div style="display: none;">
                                    <input class="required" type="checkbox" name="record[property10Check]" value="true" id="property10Check">                                    
				</div>
				</span>
<!--				<p>I have read and agree to the <a href="/index.php?page=terms">Terms and Conditions</a></p>-->
			</div>
			<div class="resetDraft">
<!--				<a href="javascript:void(0)" onclick="window.location.reload()" class="resetBut">Reset</a>-->
				<a href="javascript:void(0)" class="saveDraftBut">Savet</a>
			</div>
		</div>
	</div>
                                     
	


