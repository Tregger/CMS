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
		<div class="blockBlockLogin">
			<div class="loginInformate">
				<h1>Log in to your account below!</h1>
				<p>Not a Member Yet?<a href="/index.php?page=register">Create Account</a></p>
			</div>
			<div class="emptyBorder">
			</div>
			<div class="loginWithFace">
				<div class="loginBlock">
					<div class="loginFace">
						<h1>Log in</h1>
					<a href="/index.php?page=login&action=fb_login"><img src="/img/loginwithface.jpg"></a>
               
 <p style="display:block; font-size: 12px; margin-bottom: -20px; padding: 5px; width: 310px;">{if isset($msg)}{$msg}{/if}</p>
					</div>
                                    <form method="POST" id="author" action="/account/check_user.php" >
					<table class="loginInput">
						<tbody>
                                                    <tr>
							<td><input type="email" name="username" id="username" onblur="if (this.value==''){ this.value='Email' }" onfocus="if (this.value=='Email') this.value='';" value="Email"></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="password" name="password" id="password" onblur="if (this.value==''){ this.value='Password' }" onfocus="if (this.value=='Password') this.value='';"  placeholder="Password"></td>
                                                    </tr>
                                                    <tr>
                                                            <td class="forgot"><a href="/account/lost_pw.php">(Forgot your password?)</a></td>
                                                    </tr>
					</tbody></table>
                                       
                                         </form>
					<div class="loginOrSign">
                                            <a href="javascript:void(0)" class="active" onclick="document.getElementById('author').submit();">Log In</a>
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
						<h1>{display_like_count url=""}</h1>
						<div class="fb-like" data-send="false" data-href="http://www.facebook.com/dealhoster" data-layout="button_count" data-width="150" data-show-faces="false" style="margin-top:12px"></div>
					</div>
					<div class="faceTwitt">
						<img src="/img/twittround.jpg">
						<h1>{display_followers_count} Followers</h1>
                                         
										    <a href="https://twitter.com/dealhoster" class="twitter-follow-button" data-show-count="false" style="margin-top:12px" data-lang="en">Follow @dealhoster</a>
{literal}
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
{/literal}	
					</div>
					<img src="/img/pic.jpg" class="pic">
				</div>
			</div>
		</div>
	