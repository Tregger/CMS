{if $smarty.get.merchant}
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" SYSTEM "http://www.w3.org/TR/xhtml1/dtd/xhtml1-transitional.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
<title>Deal Hoster</title>   
<LINK href="/css/style_merchant_signup.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=454206121298581";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <form method="POST" action="/account/register.php?page=register&action=merchant_register&merchant=true" name="join" >
        <input type="hidden" name="record[user_level]" value="1" />
<div class="wrapperBlockLogin">
<!--	<div class="headerBlockLogin">
            
		<div class="headerContLogin">
			<div class="logoBlock">
			<a href="/" class="logoAccountLoginSign"></a>
			</div>
			<div class="merchantCenterSign">
				<h1>merchant<span>center</span></h1>
				<p>discover what's better</p>
			</div>
			<div class="headMenu">
				<a href="/index.php?page=merchant-intro">How it <span>Works</span></a>
				<a href="/index.php?page=about-us-for-merchant">About <span>us</span></a>
				<a href="/index.php?page=contact-us-merchants">Contact <span>us</span></a>
			</div>
			<div class="getStarted">
				<input type="button" onclick="window.location.href='/index.php?page=register&action=merchant_register&merchant=true'">
				<p>or</p>
				<a href="/index.php?page=login&action=merchant_login&merchant=true">sign in</a>
			</div>
			<img src="/img/headshadow.png"/>
		</div>
	</div>-->
<div class="headerBlockLogin">
		<div class="headerContLogin">
			<div class="headerBlockLoginWrapp">
				<div class="logoBlock">
				<a class="logoAccountLoginSign" href="/"></a>
				</div>
				<div class="merchantCenterSign">
					<h1>merchant<span>center</span></h1>
					<p>discover what's better</p>
				</div>
				<div class="headMenu">
					<a href="/index.php?page=merchant-intro&merchant=true">How it <span>Works</span></a>
					<a href="/index.php?page=about-us-for-merchant&merchant=true">About <span>us</span></a>
					<a href="/index.php?page=contact-us-merchants&merchant=true">Contact <span>us</span></a>
				</div>
				<div class="getStarted">
					<input type="button" onclick="window.location.href='/index.php?page=register&amp;action=merchant_register&amp;merchant=true'">
					<p>or</p>
					<a href="/index.php?page=login&amp;action=merchant_login&amp;merchant=true">sign in</a>
				</div>
				<img src="/img/headshadow.png">
			</div>
		</div>
	</div>
	<div class="contBlockLogin">
		<div class="leftShad"></div>
		<div class="rightShad"></div>
{/if}


<div class="text_content" style="{if $smarty.get.merchant}background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #EDEDED;
    box-shadow: 0 0 3px #EDEDED;
    font-family: arial;
    margin: 30px auto 0;
    padding: 20px;
    position: relative;
    top: -98px;{/if}width:870px;margin:30px auto 65px">

<h1 style="text-transform: uppercase;">{$item.name}</h1>

{$text}

{if $item.url=='contact-us' || $item.url=='contact-us-merchants'}
    <script>
            $(document).ready(function(){
                $('#send_message').click(function(){
                    $.get(
                        '/func/sendmail.php?'+$('#feedb').serialize(),
                        function(data){
                            $('#send').html('You message has sent. To send another message click <a href="javascript:void(0)" onclick="window.location.reload()">here</a>');
                        }
                    );
                        
                });
            });
    </script>
    <style>
        table tr td{
            vertical-align:top;
            padding-top: 10px;
              font-size:13px;
        }
        .contact_form_above{
            color: #aca4b7;
            font-size:13px;
        }
        input, textarea{
            border: 1px solid #ADADAD;
            color: #ADADAD;
            font-family: arial;
            font-size: 12px;
            font-weight: normal;
            height: 28px;
            line-height: 28px;
            margin-bottom: 5px;
            
            outline: medium none;
            padding: 0 0 0 5px;
            width: 315px;
        }
        input[type="button"]{
           
            color: #FFF;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            font-weight: bold;
         
            padding:7px 14px;
             height: auto;
             margin-left: 25px;
             cursor: pointer;
        }
    </style>
    <br>
        <div class="contact_form_above">Field with an asterisk (*) are required</div>
        <form id="feedb">
            {if isset($smarty.get.merchant)}
                <input type="hidden" name="merchant" value="1">
            {/if}
            <table>
                <tr>
                    <td style="text-align: right; padding-right:10px;" >Full Name *</td>
                    <td>
                        <input type="text" name="name" required>
                    </td>
                </tr>
                 <tr>
                    <td style="text-align: right; padding-right:10px;" >Email *</td>
                    <td>
                         <input type="email" name="email" required>
                    </td>
                </tr>
                  <tr>
                    <td style="text-align: right; padding-right:10px;"  >Phone</td>
                    <td>
                        <input type="text" name="phone">
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top; text-align: right; padding-right:10px;">Message *</td>
                    <td>
                        <textarea style="height: 235px;  width: 650px;" name="message">
                        </textarea>
                    </td>
                </tr>
                 <tr>
                    <td style="vertical-align: top; text-align: right; padding-right:10px;"></td>
                    <td id="send">
                       <input type="button" value="Send message!" id="send_message" style=" background: #55a4f2;   width:auto;"/>
                    </td>
                </tr>
            </table>
        </form>
{/if}
</div>
</div>



{if $smarty.get.merchant}
    </div>
		<div class="footerBlockLogin">
		<div class="footerBlockContLogin">
			<div class="footerEmpty">
			</div>
			<div class="footerContLogin">
				<div class="company">
					<h1>Company</h1>
					<a href="/index.php?page=about-us-for-merchant&merchant=true">About Us</a><br/>
					<a href="/index.php?page=contact-us-merchants&merchant=true">Contact Us</a>
				</div>
				<div class="merchantSolutions">
					<h1>Merchant Solutions</h1>
					<a href="/index.php?page=merchant-support&merchant=true">Merchant support</a><br/>
					<a href="/index.php?page=terms-of-use-merchants&merchant=true">Terms of services</a><br/>
					<a href="/index.php?page=privacy-merchant&merchant=true">Privacy policy</a>
				</div>
				<div class="howItWorksLogin">
					<h1>How it works</h1>
					<a href="/index.php?page=merchant-intro">Overview</a><br/>
					<a href="/index.php?page=register&action=merchant_register&merchant=true">Getting started</a><br/>
				</div>
				<div class="clippingRequired">
					<div class="likeBlock">
						<div class="fb-like" data-href="http://www.facebook.com/dealhoster" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>
					</div>
					<div class="followBlock">
									    <a href="https://twitter.com/dealhoster" class="twitter-follow-button" data-show-count="false" data-lang="en">Follow @dealhoster</a>
{literal}
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
{/literal}	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
        </form>
</body>
</html>
    {/if}
