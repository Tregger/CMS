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
					<a href="/index.php?page=merchant-intro">How it <span>Works</span></a>
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
		<div class="createYourAccountSign">
			<div class="creatAcc">
				<h1>Create your account</h1>
				<p>{if $msg}{$msg}{else}Fill out all the fields below to create your account.{/if}</p>
			</div>
			<div class="greenBord">
			</div>
			<div class="tellUsAbout">
				<p>Fields with an asterisk (*) are required.</p>
				<h1>Tell us about yourself.</h1>
				<table class="yourName">
					<tr>
						<td class="your">Your full name*</td>
						<td class="name"><input type="text" name="record[username]" required /><p>First name and last name</p></td>
						
					</tr>
					<tr>
						<td class="your">Phone Number*</td>
						<td class="number"  colspan="2"><input type="text" name="record[phone]" required/></td>
					</tr>
					<tr>
						<td class="your">Email Address*</td>
						<td class="number"  colspan="2"><input type="email" name="record[email]" required/></td>
					</tr>
                                    <tr>
						<td class="your">Password*</td>
						<td class="number"  colspan="2"><input type="password" name="record[password]" required/></td>
					</tr>
                                    <tr>
						<td class="your">Re-enter Password*</td>
						<td class="number"  colspan="2"><input type="password" name="record[password2]" required/></td>
					</tr>
				</table>
				<img src="/img/createshad.png"/>
				<h1>Tell us about your business.</h1>
				<table class="yourName">
					<tr>
						<td class="your">Business Name*</td>
						<td class="websiteyour" colspan="3"><input type="text" name="record[businessname]" required/></td>
					</tr>
					<tr>
						<td class="your">Website</td>
						<td class="websiteyour" colspan="3"><input type="text" name="record[website]"/></td>
					</tr>
					<tr>
						<td class="street">Address*</td>
						<td class="website" colspan="3"><input type="text" name="record[street]" required /><p class="firs">Street</p></td>
					</tr>
					<tr>
						<td class="street"></td>
						<td class="city">
                                                   {display_cities_select}
                                                    <p class="firs">City</p></td>
						<td class="city">
<!--							<select>
								 <option></option>
								 <option>Пункт 1</option>
								<option>Пункт 2</option>		
							</select>
							<p class="firs">First</p>-->
						</td>
						<td class="zip"><input type="text" name="record[zip]" required /><p class="firs">Zip</p></td>
					</tr>
					<tr>
						<td class="street"></td>
						<td class="website" colspan="3">
<!--						<input type="text" name="record[info]" required/>-->
<select name="record[info]" required>
    <option value="United States">United States</option>
    <option value="Canada">Canada</option>
</select>
							<p class="firs">Country</p>
						</td>
					</tr>
				</table>
<!--				<h1>Business type<span>(check all that apply)</span></h1>
				<div class="typePoints">
					<div class="checkPoints">
						<div class="check">
							<input type="checkbox" name="checkbox">
							<div class="textBeauty">
								<h1>Beauty & Health</h1>
								<p>Spas, Salons, etc. </p>
							</div>
						</div>
						<div class="check">
							<input type="checkbox" name="checkbox">
							<div class="textBeauty">
								<h1>Entertainment</h1>
								<p>Events & Festivals, Group Activites, etc. </p>
							</div>
						</div>
						<div class="check">
							<input type="checkbox" name="checkbox">
							<div class="textBeauty">
								<h1>Fitness</h1>
								<p>Dance Studios, Outdoor Sports, etc. </p>
							</div>
						</div>
						<div class="check">
							<input type="checkbox" name="checkbox">
							<div class="textBeauty">
								<h1>Retail</h1>
								<p>Books, Clothing, Electronics, etc. </p>
							</div>
						</div>
					</div>
					<div class="checkPoints">
						<div class="check">
							<input type="checkbox" name="checkbox" checked="">
							<div class="textBeauty">
								<h1>Restaurant</h1>
								<p>Full-Service, QSRs, Snacks & Sweets, etc. </p>
							</div>
						</div>
						<div class="check">
							<input type="checkbox" name="checkbox">
							<div class="textBeauty">
								<h1>Services</h1>
								<p>Home Care, Automotive, etc. </p>
							</div>
						</div>
						<div class="check">
							<input type="checkbox" name="checkbox">
							<div class="textBeauty">
								<h1>Travel</h1>
								<p>B&Bs, Hotels, Rentals, etc. </p>
							</div>
						</div>
					</div>
				</div>-->
				<input class="createAccountBut" type="submit" value="Create Account">
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
        </form>
</body>
</html>