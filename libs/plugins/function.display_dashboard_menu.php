<?php

function smarty_function_display_dashboard_menu($params, &$smarty)
{
  
            
    ?>
<h3 class="heading">
							Communication center
						</h3>
						<ul class="menu6">
							<li>
                                                            
								<a href="/admin.php?module=messages"><img src="/i/img28.png">Inbox</a>
							</li>
							<li class="item">
                                                            <a id="add_page" title="Send private messages"
   onclick="return hs.htmlExpand(this, { objectType: 'iframe', width: '800', creditsPosition: 'bottom left', headingEval: 'this.a.title', wrapperClassName: 'titlebar' } )"
   href="/admin.php?module=messages&option=send_messages"> 
   <img src="/i/img29.png">Send private messages
</a>
<!--								<a href="/admin.php?module=messages&option=send_messages"><img src="/i/img29.png">Send a private messages</a>-->
							</li>
						</ul>
					
					
<?php
}



?>