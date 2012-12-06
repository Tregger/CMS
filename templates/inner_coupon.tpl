</div>
<!--<meta property="og:title" content="{$coupon.desc}"/> -->

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=454206121298581";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


{literal}
<style type="text/css" media="screen">
        @import "/media/css/demo_table.css";
        @import "/js/highslide.css";
</style>
 <link type="text/css" rel="stylesheet" href="css/temp.css" />
<script type="text/javascript" src="/media/js/complete.js"></script>
<script src="/media/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/media/js/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" src="/js/highslide-with-html.min.js"></script>
<script type="text/javascript" src="/js/lightbox.js"></script>
 <link type="text/css" rel="stylesheet" href="/css/lightbox.css" />
 <script>
 $(document).ready(function(){
 $('.ci_lImagesArea a').lightBox();
      $('.ci_bigImage a').lightBox();
     });
 </script>
{/literal}
<div class="ci_content" >
	<div class="ci_contentLeft">
		<div class="ci_image">
			<div class="ci_bigImage">
				<a href="{$coupon.imgs.pic1}"><img src="{$coupon.imgs.pic1}"/></a>
			</div>
			<div class="ci_lImagesArea">
                            {if isset($coupon.imgs.pic2) && !empty($coupon.imgs.pic2)}
				<a href="{$coupon.imgs.pic2}">
					<img src="{$coupon.imgs.pic2}"/>
				</a>
                            {/if}
			  {if isset($coupon.imgs.pic3) && !empty($coupon.imgs.pic3)}
				<a href="{$coupon.imgs.pic3}">
					<img src="{$coupon.imgs.pic3}"/>
				</a>
                            {/if}
			  {if isset($coupon.imgs.pic4) && !empty($coupon.imgs.pic4)}
				<a href="{$coupon.imgs.pic4}">
					<img src="{$coupon.imgs.pic4}"/>
				</a>
                            {/if}
			  {if isset($coupon.imgs.pic5) && !empty($coupon.imgs.pic5)}
				<a href="{$coupon.imgs.pic5}">
					<img src="{$coupon.imgs.pic5}"/>
				</a>
                            {/if}
			
			</div>
		</div>
		<div class="ci_socArea">
                    <table>
                        <tr>
                            <td style="vertical-align: middle;">
                                <div style=" width: 282px;">
                                    <div class="fb-like" data-href="http://dealhoster.com/coupons/display_coupon/{$coupon.id}/" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>
			
                        	</div>		
                                </td>
                                              <td style="vertical-align: middle; ">      
                                                  <div style="width:82px">
<a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">Tweet</a>
{literal}
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
{/literal}
</div>
</td>
<td style="vertical-align: middle;">
    <div style=" width: 72px;">
<!-- Place this tag where you want the +1 button to render. -->
<div class="g-plusone" data-annotation="bubble" data-width="300"></div>

<!-- Place this tag after the last +1 button tag. -->
<script type="text/javascript">
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>
<div style="width:200px">
</td>
<td style="vertical-align:middle; padding-top: 4px;">
    <div style=" width: 60px;vertical-align:middle;">
<a id="share" href="http://www.facebook.com/sharer.php?u=http://dealhoster.com/index.php?page=coupons&amp;action=display_coupon&amp;id={$coupon.id}">
   <img src="/img/share.png" />
</a>
 

<script src="http://swip.codylindley.com/jquery.popupWindow.js"></script>
 
<script type="text/javascript">
    $('#share').popupWindow({
        width:550,
        height:400,
        centerBrowser:1
    });
</script>
 </div>
</td>
<td style="vertical-align: middle;">
    <div style="width:100px">
    <a href="{display_mailto_merchant id=$coupon.merchant}"><img src="/images/tempsoc.png" /></a>
    </div>
    </a>
    </td>
</tr>
</table>
		</div>
		<hr/>
		<div class="ci_grayTableArea">
		<div class="ci_grayTable">
			<div class="ci_grayTableCol">
				<div class="ci_grayTableColHd"><img src="images/b_img.jpg"/>The Fine Print</div>
				<div class="ci_grayTableColCont">
                                    {$coupon.fineprint}
				</div>
			</div>
			<div class="ci_grayTableCol">
				<div class="ci_grayTableColHd"><img src="images/b_img.jpg"/>The Highlights</div>
				<div class="ci_grayTableColCont">
					{$coupon.highlights}
                                </div>
			</div>
		</div>
		</div>
		<hr/>
		<div class="ci_article">
                    {$coupon.desc}
		</div>
		<div class="ci_commentArea">
			<div class="ci_commentAreaHd">Comments</div>
			<div class="ci_commentAreaCont">
				{display_comments deal=$coupon.id}
			</div>
                        {if $logged=='1'}
			<div class="ci_leaveCom">
				<div class="ci_leaveComHd"><img src="/images/spcl.jpg"/>Leave a comment</div>
				<div class="ci_leaveComPht"><img src="/images/nobody.jpg"/></div>
				<div class="ci_leaveComInput">
					<textarea id="leave_comment" maxlength="200"></textarea>
				</div>
                                <div class="ci_leaveComHd" id="symbols">200 symbols left</div>
			</div>
                        {else}
                         <div class="ci_leaveCom">
				<div class="ci_leaveComHd"><img src="/images/spcl.jpg"/>Please <a href="/index.php?page=login" style="color: #3594D7;">login</a> to post comment</div>
			
			</div>
                        {/if}
		</div>
	</div>
	<div class="ci_contentRight">
		<div class="ci_mainHead">
			{$coupon.title}
		</div>
		<div class="ci_priceArea">
			<div class="ci_yourPrice">
				YOUR PRICE
				<div class="ci_yourPriceVal"><sup>$</sup>{round($coupon.c_price)}</div>
			</div>
			<div class="ci_yourSave">
				SAVINGS
				<div class="ci_yoursaveVal">{round(100-($coupon.c_price/$coupon.price*100))}<sup>%</sup></div>
			</div>
		</div>
		<div class="ci_claims">
			<img src="/images/claim.jpg"/><span id="claim_count">{claim_count id=$coupon.id}</span>  CLAIMS
		</div>
		<div class="ci_time">Time Left: <b>{if $coupon.st_day+($coupon.day_col*84600)-time()>0}<span id="time">{*display_expires st_day=$coupon.st_day day_col=$coupon.day_col*}</span>{else}Expired{/if}</b> (Value:  <b><span style="color:#22b14c">${$coupon.price}</span></b>)</div>
		<div class="ci_date"><img src="images/clndr.jpg"/>Launched:
                  
                    
                    {date('M d, Y', $coupon.st_day)} <img src="images/clc.png"/>ends: {date('M d, Y', $coupon.st_day+($coupon.day_col*84600))}</div>
		<div class="ci_claimVau">
			 <a class="ci_claimVauBtn" href="javascript:void(0)">
				<div class="ci_claimVauBtnName">Claim Voucher</div>
				<div class="ci_claimVauBtnSub">Limited quantity available</div>
                                </a>
                            {*if !isset($smarty.session.claimed)}
                                <a class="ci_claimVauBtn" href="javascript:void(0)">
				<div class="ci_claimVauBtnName">Claim Voucher</div>
				<div class="ci_claimVauBtnSub">Limited quantity available</div>
                                </a>
                              {else}
                                  <a href="/print_voucher.php?id={$coupon.id}" class="ci_claimVauBtn"  target="_blank">
                                  <div class="ci_claimVauBtnName">Congratulations!</div>
                                  <div class="ci_claimVauBtnSub">Voucher claimed! <br> Click here to print it</div>
                                      </a>
                              {/if*}
			
			Deal deactivates when predetermined <br/> number of vouchers are claimed. <a href="/index.php?page=claim-coupon">Learn more!</a>
		</div>
		<div class="ci_mapArea">
			<div class="ci_mapHead">
				<div class="ci_mapHeadLeft">
					<div class="ci_mapPlace"> {display_businessname id=$coupon.merchant}</div>
					<div class="ci_mapAdress">{$coupon.street_address}<br/> {$coupon.city}<br>	{$coupon.phone} <a href="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q={$coupon.state}+{$coupon.city}+{$coupon.street_address}" target="_blank">Map It!</a></div>
				</div>
				<div class="ci_mapHeadRight">
                                   
					{display_website id=$coupon.merchant}
                                  
				</div> 
			</div>
			<div class="ci_map">
<!--				<img src="images/tempmap.jpg"/>-->

			<iframe width="260" height="125" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
                            src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q={$search_on_map}&amp;vpsrc=6&amp;
                            ie=UTF8&amp;hq=&amp;hnear={$search_on_map}&amp;t=m&amp;z=15&amp;output=embed">
                    </iframe>
                        </div> 
		</div>
                <!--
		<div class="ci_similar">
			<div class="ci_similarHead">Similar Deals:</div>
			<div class="ci_similarItm">
				<div class="ci_similarItmImg">
					<img src="images/tempimg.png"/>
				</div>
				<div class="ci_similarItminfo">
					<a href="#">$10 for a Dinner in a Sushi Bar ($30 Va</a>
					<div class="ci_pricensave">
						<span class="ci_price">$29</span>Save<span style="color:#2c92bc"> 85%</span>
					</div>
				</div>
			</div>
			<div class="ci_similarItm">
				<div class="ci_similarItmImg">
					<img src="images/tempimg.png"/>
				</div>
				<div class="ci_similarItminfo">
					<a href="#">$10 for a Dinner in a Sushi Bar ($30 Va</a>
					<div class="ci_pricensave">
						<span class="ci_price">$29</span>Save<span style="color:#2c92bc"> 85%</span>
					</div>
				</div>
			</div>
			<div class="ci_similarItm">
				<div class="ci_similarItmImg">
					<img src="images/tempimg.png"/>
				</div>
				<div class="ci_similarItminfo">
					<a href="#">$10 for a Dinner in a Sushi Bar ($30 Va</a>
					<div class="ci_pricensave">
						<span class="ci_price">$29</span>Save<span style="color:#2c92bc"> 85%</span>
					</div>
				</div>
			</div>
		</div>
                -->
	</div>

</div>
                                <script>
                        function isNotMax(e){
	e = e || window.event;
	var target = e.target || e.srcElement;
	var code=e.keyCode?e.keyCode:(e.which?e.which:e.charCode)

	switch (code){
		case 13:
		case 8:
		case 9:
		case 46:
		case 37:
		case 38:
		case 39:
		case 40:
                    $('#symbols').text(target.getAttribute('maxlength')-target.value.length+" symbols left");
			return true;
	}
        $('#symbols').text(target.getAttribute('maxlength')-target.value.length+" symbols left");
	return target.value.length <= target.getAttribute('maxlength');
}
                                    $(document).ready(function(){
                                        $('#leave_comment').keydown(function(event){
                                            if (event.keyCode == 13){
                                           
                                            dat='user_id={$smarty.session.userid}&comment='+$('#leave_comment').val()+'&deal={$coupon.id}';
                                            $.ajax({
                                                url: '/func/ajaxfunc.php?option=add_comment',
                                                type: 'POST',
                                                data: dat,
                                                success: function(data){
                                                    //$('.ci_commentAreaCont').html('');
                                                    $('.ci_commentAreaCont').append(data);
                                                    $('#new').show('slow');
                                                    $('#new').attr('id', 'displayed');
                                                }
                                            });
                                             $(this).val('');
                                            }else{
                                                return isNotMax(event);
                                            }
                                        });
                                        
                                        $('.ci_claimVauBtn').click(function(){
                                        
                                        {if $coupon.st_day+($coupon.day_col*84600)-time()>0}
                                           
                                                  dat='user_id={$smarty.session.userid}&deal={$coupon.id}';
                                                  $.ajax({
                                                url: '/func/ajaxfunc.php?option=claim',
                                                type: 'POST',
                                                data: dat,
                                                success: function(data){
                                                $('.ci_claimVauBtn').attr('href', '/print_voucher.php?id={$coupon.id}');
                                                    $('.ci_claimVauBtn').html('');
                                                    $('.ci_claimVauBtn').append(data);
                                                     $('.ci_claimVauBtn').attr('onclick', 'alert("You already clamed to this voucher");');
                                                     v=$('#claim_count').text();
                                                     v++;
                                                     $('#claim_count').text(v);
                                                }
                                            });
                                           
                                           {else}
                                               alert("You can't claim on this voucher. Deal has expired. ");
                                            {/if}
                                                
                                        });
                                    });
                                 </script>
                                 <script src="/js/timer.js"></script>
                                 <script> 
               CreateTimer('time', {($coupon.st_day+($coupon.day_col*84600))-time()},1);                                                     
        </script>
                                 </div>