<script type="text/javascript">
    $(document).ready(function(){
        $('#fb_togg').click(function(){
            $('#fb_frame').toggle();
              $('#fb_togg').toggle();
              $('#fb_togg2').toggle();
        });
                $('#fb_togg2').click(function(){
            $('#fb_frame').toggle();
              $('#fb_togg').toggle();
               $('#fb_togg2').toggle();
        });
    });
      
                     
window.fbAsyncInit = function() {
FB.init({
    appId      : '454206121298581', // App ID
    channelUrl : '//www.dealhoster.com/index.php?page=register&action=fb_register', // Channel File
    status     : true, // check login status
    cookie     : true, // enable cookies to allow the server to access the session
    xfbml      : true  // parse XFBML
});



FB.getLoginStatus(function(response) {
  if (response.status === 'connected') {
    // the user is logged in and has authenticated your
    // app, and response.authResponse supplies
    // the user's ID, a valid access token, a signed
    // request, and the time the access token 
    // and signed request each expire
    var uid = response.authResponse.userID;
    var accessToken = response.authResponse.accessToken;
  } else if (response.status === 'not_authorized') {
    // the user is logged in to Facebook, 
    // but has not authenticated your app
    
  } else {
    // the user isn't logged in to Facebook.
  }
 });

};
// Load the SDK Asynchronously
(function(d){
var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
if (d.getElementById(id)) {
    return;
}
js = d.createElement('script'); js.id = id; js.async = true;
js.src = "//connect.facebook.net/en_US/all.js";
ref.parentNode.insertBefore(js, ref);
}(document));
                            

    



</script>
<div class="contBlock">
		<div class="blockBlockLogin">
			<div class="loginInformateSignUp">
				<h1>New to Dealhoster? Sign up, it’s quick and easy.</h1>
				<p>Already have an account?<a href="/index.php?page=login">Sign In</a></p>
			</div>
			<div class="emptyBorder">
			</div>
                             <form method="POST" action="/account/register.php" name="join" >
			<div class="createAccount">
                    
				<div class="createYourAccount">
					<h1>CREATE YOUR ACCOUNT</h1>
					<p>{if isset($msg)}{$msg}{else}Fill out all the fields below to create your account.{/if}</p>
					<table class="registrForm">
						<tr>
							<td>Full name</td>
							<td><input type="text" name="record[username]" value=" {if isset($facebook_user_profile)}{$facebook_user_profile.first_name}{$facebook_user_profile.last_name}{/if}"></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input type="email" name="record[email]"></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="password" name="record[password]" ></td>
						</tr>
						<tr>
							<td>Confirm Password</td>
							<td><input type="password" name="record[password2]"></td>
						</tr>
					</table>
<!--					<table class="registrFormCity">
						<tr>
							<td></td>
							<td class="selCity">
							<select name="record[info]">
								{city_options}
							</select>
							</td>
						</tr>
					</table>-->
					<div class="iAgree">
						<div class="termPrivacy">
							<input type="checkbox" name="checkbox" required checked="">
							<p>I agree to the <a href="/index.php?page=terms">Terms of Use</a> and <a href="/index.php?page=privacy">Privacy Statement</a></p>
						</div>
					</div>
					<div class="alreadyMember">
						<input type="submit" value="Create Account">
						<a href="/index.php?page=login">Already a member?</A>
					</div>
                                     
				</div>
				<div class="orBlock">
					<div class="orblockUp">
					</div>
					<p>or</p>
					<div class="orblockDown">
					</div>
				</div>
				<div class="signFacebook">	
					<div class="faceAccount">Log In with your Facebook account:</div>
					<div class="connectFace">Connect your Facebook account to login to DealHoster!</div>
                                        <a href="/index.php?page=login&action=fb_login"><img src="/img/loginwithface.jpg"></a>
<!--					<a class="loginwithface" href="javascript:void(0)" id="fb_togg"><img src="/img/signupface.jpg"/></a>-->
                                        	<a  href="javascript:void(0)" id="fb_togg2" style=" color: #333333;
    font-size: 12px;
    font-weight: bold;
    left: 60.8%;
    position: absolute;
    text-decoration: none;
    text-shadow: 0 0 1px #333333;
    text-transform: uppercase;
    top: 101px;
    z-index: 1; display:none;">Close</a>
                                        <iframe id="fb_frame" style="display: none; position:absolute; top:100px; left:27%;" src="https://www.facebook.com/plugins/registration?
                                    client_id=454206121298581&
                                    redirect_uri=http://www.dealhoster.com/index.php?page=register&
                                    fields=name,first_name,last_name,birthday,gender,email,password"
                                scrolling="auto"
                                frameborder="no"
                                style=""
                                allowTransparency="true"
                                width="500"
                                height="420"
                                align="middle">
                        </iframe>
                       
				</div>
			</div>
                                 </form>
		</div>
	</div>