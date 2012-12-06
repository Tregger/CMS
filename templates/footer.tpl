{if !isset($smarty.get.merchant) }
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=454206121298581";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
{if isset($smarty.session.user_level) && $smarty.session.user_level==1 && !isset($smarty.get.lookup)}
<div class="footer">
		<p>Any questions or problems? <a href="/index.php?page=customer-support">Please contact Customer Support.</a></p>
		
	</div>
</div>
</div>
</body>
</html>
{else}


</div>
<script>
    $(document).ready(function(){
        $('.join_subscribe').click(function(){
            $.get('/func/ajaxfunc.php?option=join_subscribe&email='+$('#subscrib_email').val(), function(data){
                $('.a_answer').html('');
                $('.a_answer').append(data);
            });
        });
    });
</script>
<div class="footerBlock">
		<div class="footerBlockCont">
			<div class="footerCont">
				<div class="footMenu">
					<div class="menuCont">
						<a href="/">Home</a><br>
						<a href="/index.php?page=about-us">About us</a><br>
						<a href="/index.php?page=faq">FAQ</a><br>
						<a href="/index.php?page=contact-us">Contact us</a><br>
					</div>
                              
					<div class="menuCont">
						<a href="/index.php?page=how-it-works">How does it work?</a><br>
                                                <a href="/index.php?page=the-difference">The Difference</a><br>
						<a href="/index.php?page=register">Sign up</a><br>
					</div>
					<div class="featureBusiness">
                                             <a href="/index.php?page=login&action=merchant_login&merchant=true">
						<img src="/img/feature.jpg">
						<h1>FEATURE YOUR BUSINESS</h1>
                                             </a>
					</div>
				</div>
				<div class="emailAlerts">
					<h1>Email Alerts</h1>
					<p>Sign up for email alerts<br>and never miss another great deal</p>
				<table class="newsLetter">
                                    <div class="a_answer"></div>
					<tbody><tr>
						<td><input type="text" id="subscrib_email" onblur="if (this.value==''){ this.value='Your email address...' }" onfocus="if (this.value=='Your email address...') this.value='';" value="Your email address..."></td>
						<td><a href="javascript:void(0)"  class="join_subscribe">JOIN NEWSLETTER</a></td>
					</tr>
				</tbody></table>
				</div>
				<div class="clippingRequired">
					<div class="likeBlock">
						<div class="fb-like" data-href="http://www.facebook.com/dealhoster" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>
                                                <a class="face" href="http://www.facebook.com/dealhoster" target="_blank">
<img src="/img/face.jpg">
</a>
                                                <p>{display_like_count} people like this</p>
					</div>
					<div class="followBlock">
						    <a href="https://twitter.com/dealhoster" class="twitter-follow-button" data-show-count="false" data-lang="en">Follow @dealhoster</a>
{literal}
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
{/literal}					
</div>
					<img src="/img/app.png">
				</div>
			</div>
			<div class="dealRights">&copy; Dealhoster. <a href="/index.php?page=terms" style="color: #8A8C8F;">Terms of Use</a> | <a href="/index.php?page=privacy" style="color: #8A8C8F;">Privacy Policy</a></div>
		</div>
	</div>
</body>
</html>
{/if}
{/if}