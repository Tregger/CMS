</div>
<link type="text/css" rel="stylesheet" href="http://www.erichynds.com/examples/style.css" />
<link type="text/css" rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/redmond/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="/js/ui.notify.css" />
<style type="text/css">form input { display:block; width:250px; margin-bottom:5px }</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.js" type="text/javascript"></script>
<script src="/js/jquery.notify.js" type="text/javascript"></script>
<script>
     {literal}
         function create( template, vars, opts ){
            return $container.notify("create", template, vars, opts);
         }
    function make_read(id){
        $.get('/func/ajaxfunc.php?option=make_read&id='+id);
    }
         function make_delete(id){
             if(confirm('Are you sure you want to delete this deal?'))
        $.get('/func/ajaxfunc.php?option=make_delete&id='+id, function(data){$('body').append(data);});
    }
        $(document).ready(function(){
            $container = $("#container").notify();
            
        {/literal}
            
                   {foreach from=$chats item=chat}
            create("sticky", { title:'{$chat.subject}', text:'{$chat.text}'},{ expires:false,  close: function(e,instance){
      // close the notice if the user clicks anywhere inside it
      make_read({$chat.id});
      
   } });
        {/foreach}
    });
        </script>
        
        <div id="container" style="display:none">
		
		{literal}
		<div id="sticky">
			<a class="ui-notify-close ui-notify-cross" href="#">x</a>
			<h1>#{title}</h1>
			<p>#{text}</p>
		</div>
                {/literal}
                </div>
{if $smarty.session.user_level!=1 && !isset($_COOKIE['message_block'])}
    <div class="message_block">
        <table>
            <tr>
                <td><img src="{$ads_image}"></td>
                <td >
                    <div class="msg_title">{$ads_title}</div>
                    <div class="msg_text">
                        {$ads_text}
                        <div class="clear" style="height:7px"></div>
                        {$ads_prebutton_text} <input type="button"  class="msg_button" onclick="window.location.href='/index.php?page=register'"></div>
                        <div class="close_msg"><img src="/img/x.png"></div>
                </td>
            </tr>
        </table>

    </div>
{/if}
<div class="contBlock">
{if isset($smarty.session.user_level) && $smarty.session.user_level==1 && !isset($smarty.get.lookup)}
<div class="content">
		<p>Any questions or concerns, please contact <span><a href="/index.php?page=customer-support">Customer Support.</a></span></p>
		<div class="currentLive">
			<div class="draftsBlock">
				<div class="draftsBlocks">
					<div class="blockCell">
						<div class="blockCellEmpty">
						<a {if $view eq 'active'} class="active"{/if} href="/index.php?page=deals&action=mydeals&view=active">Active <!-- <span>(5)</span>--></a>
						</div>
					</div>
					<div class="blockCell">
                                            <div class="blockCellEmpty">
                                                 <a  {if $view eq 'drafts'} class="active"{/if} href="/index.php?page=deals&action=mydeals&view=drafts">Drafts <!-- (4)--></a>
                                            </div>
					</div>
				</div>
			</div>
			<div class="liveDealsH">
				<h1>Current live deals:</h1>
			</div>
			<hr>
			<div class="foodBlocks">
                            {if $items}
                                    {foreach from=$items item=item}
				<div class="foodBlock">
					<h1>{$item.title}</h1>
					<div class="foodBlockCont">
<!--						<img src="{$item.imgs.pic1}">-->
                                        
						{display_img vals=$item.imgs where='main'} 
                                                    {$item.desc}
                                                
						<div class="claimsBlock">
							<h1>{$item.claims} CLAIMS</h1>
							<div class="priceBlock">
								<div class="yourPrice">
									<p>YOUR PRICE</p>
									<h2><span>$</span>{round($item.c_price)}</h2>
								</div>
								<div class="savingsBlock">
									<p>SAVINGS<p>
									<h2>{round(100-($item.c_price/$item.price*100))}<span>%</span></h2>
								</div>
							</div>
							<div class="postedExpires">
								<div class="posted"><p>Posted:<span>{date('m/d', strtotime($item.posted))}</span></p></div>
								<div class="expires">
								<p>Expires:  </p>
								<div class="expiresData">
									<p>{display_expires st_day=$item.st_day day_col=$item.day_col}</p>
								</div>
								</div>
							</div>
							<div class="butsBlock">
								<a class="butEdit" href="/index.php?page=deals&action=edit&id={$item.id}">Edit</a>
								{if $view eq 'drafts'}
                                                                    <a class="butSuspend" href="javascript:void(0)" onclick="make_active({$item.id})" >Activate</a>
                                                                    {else}
                                                                    <a class="butSuspend" href="javascript:void(0)" onclick="make_suspend({$item.id})">Suspend</a>
                                                                    {/if}
                                                                    <a class="butEdit" href="javascript:void(0)" onclick="make_delete({$item.id})">Delete</a>
							</div>
						</div>
					</div>
				</div>
                                    {/foreach}
                                {else}
                                  <div class="foodBlock"><h1>Sorry, but now you have no {if $view eq 'drafts'}deals draft {else}active deals {/if}</h1></div>
                                 {/if} 
			</div>
		</div>
	</div>
                        <script>
                            function make_active(id){
                                $.get('/func/ajaxfunc.php?option=make_active_coupon&id='+id, function(data){
                                    //window.location.reload();
                                    $('body').append(data);
                                });
                            }
                              function make_suspend(id){
                                $.get('/func/ajaxfunc.php?option=make_suspend_coupon&id='+id, function(){
                                    window.location.reload();
                                });
                            }
                        </script>
            {else}
                <div id="grid-content" style="position: relative; width: auto; overflow: hidden; height: 1168px; padding-top: 0px;">
    
    
                    <!-- -->






{foreach from=$items item=item}

                    <div class="content_block" style="position: absolute; left: 0px; top: 0px;">
                        <div class="pict">
                           <a href="/index.php?page=deals&action=display_coupon&id={$item.url}{if isset($smarty.get.lookup)}&lookup=1{/if}">
                                {display_img vals=$item.imgs where='main'} 
                            </a>
                                    
                        <div class="title" style="color: rgb(160, 158, 158);">
                            <a href="/index.php?page=deals&action=display_coupon&id={$item.url}{if isset($smarty.get.lookup)}&lookup=1{/if}">{$item.title}</a>
                        </div>
                        <div class="info_sharing">
                            <table>
                                <tr>
                                    <td style="vertical-align: middle;"><img src="/img/likes.png"><span>{display_like_count url="/index.php?page=deals&action=display_coupon&id="|cat:$item.id|cat:""} likes</span></td>
                                    <td style="vertical-align: middle;"><img src="/img/comments.png"><span>{display_comments_count deal=$item.id} Comments</span></td>
                                </tr>
                            </table>
                        </div>
                    
                    </div>  
                            <div class="comments">
                                {display_comments_home deal=$item.id}
                               
                        </div>
                        </div>
                    {/foreach}

                    
                    
                    
                </div>
                    </div>
            {/if}