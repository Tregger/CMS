<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" SYSTEM "http://www.w3.org/TR/xhtml1/dtd/xhtml1-transitional.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
<title>Deal Hoster</title>   
<LINK href="/css/style_merchant.css" rel="stylesheet" type="text/css">
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
<div class="wrapperBlockLogin">
	<div class="headerBlockLogin">
		<div class="headerContLogin">
			<div class="logoBlock">
			<a href="/" class="logoAccountLogin"></a>
			</div>
			<div class="merchantCenter">
				<h1>merchant<span>center</span></h1>
				<p>discover what's better</p>
			</div>
			<img src="/img/headshadow.png"/>
		</div>
	</div>
	<div class="contBlockLogin">
		<div class="leftShad"></div>
		<div class="rightShad"></div>
		<div class="blockBlockLoginMerchant">
			<div class="loginWithFace">
                          
				<div class="loginBlockLogoMerchant">
                                       <form method="POST" id="author" action="/account/check_user.php?merchant=1" >
					<div class="loginFaceLogo">
						<h1>Log in to your merchant account</h1>
					</div>
					<table class="loginInputLogo">
						<tr>
							<td><input type="text" name="username" value="Username or email" onfocus="if (this.value=='Username or email') this.value='';"
							onblur="if (this.value==''){ this.value='Username or email' }"/></td>
						</tr>
						<tr>
							<td><input type="password" name="password" placeholder="Password" /></td>
						</tr>
					</table>
                                           {if $msg}
                                               <div class="error_msg" style=" color: red; display: block; font-family: arial; font-size: 16px; position: relative; width: 299px; z-index: 9999;">
                                                 {$msg}
                                               </div>
                                           {/if}
					<div class="remembMe">
						<input type="checkbox" name="checkbox">
						<p>Remember me</p>
						<a href="/account/lost_pw.php?merchant=true">Forgot password?</a>
					</div>
					<div class="loginOrSignLogo">
						<input type="submit" value="Log In">
						<p>Not a Member Yet?</p>
						<a href="/index.php?page=register&action=merchant_register&merchant=true">Create Account</a>
					</div>
                                           </form>
				</div>
                                 
				<div class="emptyBorderLeftLogin">
				</div>
				<div class="fansFollowersLogo">
					<div class="faceFans">
						<img src="/img/faceround.png">
						<h1>{display_like_count url=""} Fans</h1>
						<div class="fb-like" data-href="http://www.facebook.com/dealhoster" data-send="false" data-layout="button_count" data-width="450" style="margin-top:12px" data-show-faces="true"></div>
					</div>
					<div class="faceTwitt">
						<img src="/img/twittround.png">
						<h1>{display_followers_count} Followers</h1>
								    <a href="https://twitter.com/dealhoster" class="twitter-follow-button" data-show-count="false" style="margin-top:12px" data-lang="en">Follow @twitterapi</a>
{literal}
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
{/literal}	
					</div>
					<img class="pic" src="/img/pic.jpg">
				</div>
			</div>
		</div>
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
</body>
</html>