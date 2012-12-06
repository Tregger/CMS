<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" SYSTEM "http://www.w3.org/TR/xhtml1/dtd/xhtml1-transitional.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<base href="/">
<head>
<title>Deal Hoster</title>   
<LINK href="/css/merchant_promo.css" rel="stylesheet" type="text/css">
    <LINK href="/css/jquery-ui-1.8.24.custom.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-1.8.2.min.js" ></script>


	<script src="/js/jquery-ui-1.8.24.custom.min.js"></script>
{literal}
    	<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
	</script>
        {/literal}
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
<div class="wrapperBlockLoginIntro">
	<div class="headerBlockLogin">
		<div class="headerContLogin">
			<div class="headerBlockLoginWrapp">
				<div class="logoBlock">
				<a href="/" class="logoAccountLoginSign"></a>
				</div>
				<div class="merchantCenterSign">
					<h1>merchant<span>center</span></h1>
					<p>discover what's better</p>
				</div>
				<div class="headMenu">
					<a href="/index.php?page=merchant-intro">How it <span>Works</span></a>
					<a href="/index.php?page=about-us-for-merchant&merchant=true">About <span>us</span></a>
					<a href="/index.php?page=contact-us-merchants&merchant=true">Contact <span>us</span></a>
				</div>
				<div class="getStarted">
					<input type="button" onclick="window.location.href='/index.php?page=register&action=merchant_register&merchant=true'">
					<p>or</p>
					<a href="/index.php?page=login&action=merchant_login&merchant=true">sign in</a>
				</div>
				<img src="/img/headshadow.png"/>
			</div>
		</div>
	</div>
	<div class="contBlockLogin">
		<div class="leftShad"></div>
		<div class="rightShad"></div>
		<div class="createYourAccountSignIntro">
<!--			<h1>More than 250,000 businesses have grown with Groupon.</h1>
			<h2>Roll over images below to see how Groupon worked for them.</h2>-->
                        {$block1}
			<div class="instantAcess">
				<div class="baldMen">
<!--					<iframe width="580" height="345" src="http://www.youtube.com/embed/IcZLJJ3BxwU" frameborder="0" allowfullscreen></iframe>-->
                                {$block2}
				</div>
				<div class="postYourDeal">
<!--					<h1>Instant Access</h1>
					<h2>1,700,000 rated & tested profes</h2>
					<p>Approve work before</p>
					<p>Get vandidates right away</p>
					<p>Approve work before payment</p>
					<p>Get candidates right away</p>
					<p>Approve work before</p>
					<p>Staff up and down as needed</p>-->
                                        {$block3}
					<a href="/account/register.php?merchant=true&action=merchant_register&merchant=true">Post Your Deal<br/><span>Just ${$price_post}</span></a>
					<div class="lineEmpty">
					</div>
				</div>
				<div class="photoBack">
					<img src="/img/photoback.png"/>
				</div>
			</div>
			<div class="plansWithPic" id="tabs">
				<ul class="plansPricing" style="display:block; list-style-type: none;">
					<li style="display:block; float: left"><a href="#tab1">{$tab1_label}</a></li>
					<li style="display:block; float: left"><a href="#tab2">{$tab2_label}</a></li>
					<li style="display:block; float: left"><a href="#tab3">{$tab3_label}</a></li>
					<li style="display:block; float: left"><a href="#tab4">{$tab4_label}</a></li>
				</ul>
				<div class="makeYourBusiness" id="tab1">
					{$tab1}
				</div>
                            <div class="makeYourBusiness" id="tab2">
					{$tab2}
				</div>
                                   <div class="makeYourBusiness" id="tab3">
					{$tab3}
				</div>
                                   <div class="makeYourBusiness" id="tab4">
					{$tab4}
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
					<a href="/index.php?page=privacy-merchant&merchant=true">Terms of services</a><br/>
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
</div>
</body>
</html>