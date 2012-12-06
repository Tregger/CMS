{*
{if !isset($smarty.get.merchant)}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" SYSTEM "http://www.w3.org/TR/xhtml1/dtd/xhtml1-transitional.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
<title>Deal Hoster</title>   
<LINK href="/css/style.css" rel="stylesheet" type="text/css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<div {if isset($smarty.get.page) and ($smarty.get.page eq 'login' or $smarty.get.page eq 'register')}class="wrapperBlock"{else}class="wrapper"{/if}>

   {if isset($smarty.get.page) and ($smarty.get.page eq 'login' or $smarty.get.page eq 'register')}
       <div class="contBlock">
       <div class="headerBlock">
		<div class="headerCont">
			<div class="logoBlock">
			<a class="logoAccount" href=""></a>
			</div>
			<div class="searchEverything">
				<div class="searchMenu">
					<div class="searchInput">
						<input type="text" onblur="if (this.value==''){ this.value='Search projects' }" onfocus="if (this.value=='Search projects') this.value='';" value="Search projects">
						<a href="#"></a>
					</div>
					<div class="menuBlock">
						<a href="#">Everything</a>
						<a href="#">Categories</a>
						<a href="#">Popular</a>
					</div>
				</div>
			</div>
			<div class="changeCity">
				<div class="seattleCity">
				<h1>Seattle, WA</h1>
				<img src="/img/changecity.png">
				</div>
				<a href="#">Change City</a>
			</div>
			<div class="signupMenu">
				<a href="#" class="active">Join</a>
				<a href="#">SIGN UP</a>
				<a href="#">LOG IN</a>
			</div>
			<div class="socialBlock">
				<a href="#"><img src="/img/twitter.jpg"></a>
				<a href="#"><img src="/img/facebook.jpg"></a>
			</div>
		</div>
	</div>
       
       {else}
           <div class="siteWrapper">
	<div class="header">
		<div class="dealHoster">
			<a href="/" class="logo"></a>
                        {if $logged==1}
			<ul>
				<li><a href="/index.php?page=myaccount">My Account</a></li>
				<li><a href="#">Billing</a></li>
				<li><a href="#">Customer Support</a></li>
			</ul>
                        {else}
                            <ul>
				<li><a href="/index.php?page=login">Login</a></li>
				<li><a href="/index.php?page=register">SignUp</a></li>
				<li><a href="#">Customer Support</a></li>
			</ul>
                        {/if}
			<img src="/img/headershad.png">
		</div>
                {if $logged==1}
		<div class="myDeals">
               
			<a href="/index.php?page=coupons&action=mydeals"></a>
			<a href="/index.php?page=coupons&action=post_deal"></a>
                   
		</div>
                 {/if}
		<div class="howItWorks">
			<a class="first" href="/index.php?page=faq">FA<span>Q's</span></a>
			<a href="/index.php?page=how-it-works">How it <span>works</span></a>
			{if $logged==1}<a class="last" href="/account/logout.php?logmeout=true">Sign <span>out</span></a>{/if}
		</div>
	</div>
         {/if}
{/if}
*}

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" SYSTEM "http://www.w3.org/TR/xhtml1/dtd/xhtml1-transitional.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
<title>Deal Hoster</title>   
<LINK href="/css/style_merchant_signup.css" rel="stylesheet" type="text/css">
        <base href="http://dealhoster.com">
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
			<a href class="logoAccountLoginSign"></a>
			</div>
			<div class="merchantCenterSign">
				<h1>merchant<span>center</span></h1>
				<p>discover what's better</p>
			</div>
			<div class="headMenu">
<!--				<a href="/index.php?page=merchant-intro">How it <span>Works</span></a>
				<a href="/index.php?page=about-us">About <span>us</span></a>
				<a href="/index.php?page=contact-us">Contact <span>us</span></a>-->
			</div>
			<div class="getStarted">
				
				<a href="/index.php?page=myaccount" style="color: #333;">My Account</a>
                                <p style="color: #333;">|</p>
				<a href="/index.php?page=billing" style="color: #333;">Billing</a>
                                <p style="color: #333;">|</p>
				<a href="/index.php?page=customer-support" style="color: #333;">Customer Support</a>
                                <p style="color: #333;">|</p>
                                <a class="first" href="/index.php?lookup=1" style="color: #333; text-align: center">Enter as <span>buyer</span></a>
			</div>
			<img src="/img/headshadow.png"/>
		</div>
	</div>

                                
	<div class="contBlockLogin" style="width: 881px;">
		<div class="leftShad"></div>
		<div class="rightShad"></div>
                
                <div class="myDeals" >
               
			<a href="/index.php?page=deals&action=mydeals"></a>
			<a href="/index.php?page=deals&action=post_deal"></a>
                        
                  
		</div>
            
                    <div class="howItWorks" style="margin-left: 500px;margin-top: 3px;top: -147px;position: relative;">
			<a class="first" href="/index.php?page=faq-for-merchants">FA<span>Q's</span></a>
                        
			<a href="/index.php?page=how-it-works-merchant">How it <span>works</span></a>
                        
			{if $logged==1}<a class="last" href="/account/logout.php?logmeout=true">Sign <span>out</span></a>{/if}
		</div>
                    <div style=" color: #666666;
    position: relative;
    right: -205px;
    text-align: center;
     top: -127px;
    width: 800px;">
<!--                    <h1>More than 250,000 businesses have grown with Groupon.</h1>
			<h2>Roll over images below to see how Groupon worked for them.</h2>-->
{$merchant_title_text}
                        </div>