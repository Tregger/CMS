<?php

ini_set('display_errors','Off');
$doc_root=$_SERVER['DOCUMENT_ROOT'];
$host_name="http://".$_SERVER['HTTP_HOST'];
//require($doc_root.'/configs/dbconnect.php');
include "config.php";
require($doc_root.'/libs/Smarty.class.php');
$site_path="http://".$_SERVER['SERVER_NAME'];

$ip=$_SERVER['REMOTE_ADDR'];
require_once $_SERVER['DOCUMENT_ROOT']."/geolocation/SxGeo.php";
$SxGeo = new SxGeo($_SERVER['DOCUMENT_ROOT'].'/geolocation/SxGeo_GLCity.dat', SXGEO_BATCH | SXGEO_MEMORY); // Режим по умолчанию, файл бд SxGeo.dat
$city = $SxGeo->get($ip); 




  $smarty = new Smarty;
  $smarty->allow_php_templates;
  $smarty->template_dir = "../templates/";
  $smarty->assign('client_city', $city);
  include("config.php");
  if(!isset($_GET['merchant'])){
  $smarty->display('header_users.tpl');
  }else{

?>
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
	<div class="contBlockLogin" >
		<div class="leftShad"></div>
		<div class="rightShad"></div>

<?php } ?>
<style>
    .twitter-follow-button{
        margin-top: 12px;
    }
</style>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=454206121298581";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<?php if(!isset($_GET['merchant'])): ?>
		<div class="blockBlockLogin" <?php if(isset($_GET['merchant'])): ?> style="margin-left:0; position: relative; top: -115px; background: none repeat scroll 0 0 #FFFFFF;" <?php endif;?>>
			<div class="loginInformate">
				<h1>Log in to your account below!</h1>
				<p>Not a Member Yet?<a <?php if(isset($_GET['merchant'])): ?>href="/index.php?page=register&action=merchant_register&merchant=true" <?php else: ?> href="/index.php?page=register"<?php endif; ?>>Create Account</a></p>
			</div>
			<div class="emptyBorder">
			</div>
			<div class="loginWithFace">
				<div class="loginBlock">
					<div class="loginFace">
						<h1>Reset Your Password</h1>
<!--						<a href="#"><img src="/img/loginwithface.jpg"></a>-->
					</div>
                                    <form method="POST" id="author" action="lostpw.php" >
					<table class="loginInput">
						<tbody>
                                                    <tr>
							<td>
                                                        <input type="text" name="email" id="email" onblur="if (this.value==''){ this.value='Email' }" onfocus="if (this.value=='Email') this.value='';" value="Email"><input type="hidden" name="recover" id="recover" value="recover">
                                                        </td>
                                                    </tr>
                                                  
                                                    
					</tbody></table>
                                         </form>
					<div class="loginOrSign">
                                            <a href="javascript:void(0)" class="active" onclick="document.getElementById('author').submit();">Reset Password</a>
						<p>or</p>
						<a href="/index.php?page=register">Sign up</a>
					</div>
                                    
					<div class="merchantLogin">For merchant login<a href="/index.php?page=login&action=merchant_login&merchant=true">click here!</a></div>
				</div>
				<div class="emptyBorderLeft">
				</div>
				<div class="fansFollowers">
					<div class="faceFans">
						<img src="/img/faceround.jpg">
<!--						<h1>{display_like_count url="/index.php?page=login"}</h1>-->
						<div class="fb-like" data-href="http://www.dealhoster.certumsoft-dev.ru/index.php?page=login" data-send="false" data-width="300" style="margin-top:12px" data-show-faces="false"></div>
					</div>
					<div class="faceTwitt">
						<img src="/img/twittround.jpg">
<!--						<h1>{display_followers_count} Followers</h1>-->
                                         
										    <a href="https://twitter.com/dealhoster" class="twitter-follow-button" data-show-count="false" style="margin-top:12px" data-lang="en">Follow @dealhoster</a>
{literal}
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
{/literal}	
					</div>
					<img src="/img/pic.jpg" class="pic">
				</div>
			</div>
		</div>
	<?php else: ?>
	<div class="blockBlockLoginMerchant" style="position: relative;
    top: -100px;">
			<div class="loginWithFace">
                          
				<div class="loginBlockLogoMerchant">
                                       <form method="POST" id="author" action="lostpw.php" >
					<div class="loginFaceLogo">
						<h1>Reset Your Password</h1>
					</div>
					<table class="loginInputLogo">
						 <tr>
							<td>
                                                        <input type="text" name="email" id="email" onblur="if (this.value==''){ this.value='Email' }" onfocus="if (this.value=='Email') this.value='';" value="Email"><input type="hidden" name="recover" id="recover" value="recover">
                                                        </td>
                                                    </tr>
					</table>
                                        
<!--					<div class="remembMe">
						<input type="checkbox" name="checkbox">
						<p>Remember me</p>
						<a href="/account/lost_pw.php?merchant=true">Forgot password?</a>
					</div>-->
					<div class="loginOrSignLogo">
						<input type="submit" value="Reset Password">
						<p>or</p>
						<a href="/index.php?page=register&action=merchant_register&merchant=true">Sign Up</a>
					</div>
                                           </form>
				</div>
                                 
				<div class="emptyBorderLeftLogin">
				</div>
				<div class="fansFollowersLogo">
					<div class="faceFans">
						<img src="/img/faceround.png">
<!--						<h1>{display_like_count url=""} Fans</h1>-->
						<div class="fb-like" data-href="http://www.facebook.com/dealhoster" data-send="false" data-layout="button_count" data-width="450" style="margin-top:12px" data-show-faces="true"></div>
					</div>
					<div class="faceTwitt">
						<img src="/img/twittround.png">
<!--						<h1>{display_followers_count} Followers</h1>-->
								    <a href="https://twitter.com/dealhoster" class="twitter-follow-button" data-show-count="false" style="margin-top:12px" data-lang="en">Follow @twitterapi</a>
{literal}
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
{/literal}	
					</div>
					<img class="pic" src="/img/pic.jpg">
				</div>
			</div>
		</div>
<?php endif;?>
<?php if(isset($_GET['merchant'])): ?>
</div>
	<div class="footerBlockLogin">
		<div class="footerBlockContLogin">
			<div class="footerEmpty">
			</div>
			<div class="footerContLogin">
				<div class="company">
					<h1>Company</h1>
					<a href="/index.php?page=about-us">About Us</a><br/>
					<a href="/index.php?page=contact-us">Contact Us</a>
				</div>
				<div class="merchantSolutions">
					<h1>Merchant Solutions</h1>
					<a href="/index.php?page=merchant-support">Merchant support</a><br/>
					<a href="/index.php?page=terms">Terms of services</a><br/>
					<a href="/index.php?page=privacy">Privacy policy</a>
				</div>
				<div class="howItWorksLogin">
					<h1>How it works</h1>
                                        <a href="/index.php?page=merchant-intro">Overview</a><br/>
					<a href="/index.php?page=register&action=merchant_register&merchant=true">Getting started</a><br/>
				</div>
				<div class="clippingRequired">
					<div class="likeBlock">
						<div class="fb-like" data-href="http://dealhoster.com" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>
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
			<?php else: ?>
<?php $smarty->display('footer.tpl');?>
<?php endif; ?>