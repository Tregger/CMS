 <form id="email_prefence" method="POST" action="/func/change_email_prefence.php">
<div class="contBlock">
		<div class="blockBlock">
			<h1>My Account <span>/  Email Preferences</span></h1>
			<div class="accountInform">
				<div class="accountInformBlock">
					<a  href="/index.php?page=myaccount">Account Information</a>
					<a class="blue" href="/index.php?page=myaccount&action=email_prefence">Email Preferences</a>
				</div>
                               
                                    <input type="hidden" name="user_id" value="{$smarty.session.userid}">
				<div class="alertPreferences">
				<h1>My Daily Alert Preferences</h1>
				<h2>How often would you like to receive recommended deals emails?</h2>
				<p>Email frequency:</p>
				<div class="checksBlocks">
					<div class="checkformBlock">
							<input type="radio"  name="often_alerts" value="1" {if $user.often_alerts==1}checked{/if}/>
							<p>Daily</p>
						</div>
						<div class="checkformBlock">
							<input type="radio" name="often_alerts" value="2" {if $user.often_alerts==2}checked{/if}/>
							<p>Twice a week</p>
						</div>
						<div class="checkformBlock">
							<input type="radio" name="often_alerts" value="3" {if $user.often_alerts==3}checked{/if}/>
							<p>Once a week</p>
						</div>
						<div class="checkformBlock">
							<input type="radio" name="often_alerts" value="4" {if $user.often_alerts==4}checked{/if}/>
							<p>Never</p>
						</div>
				</div>
				</div>
			</div>
			<div class="checkUncheck">
				<h2>Check & uncheck your preferences below to control the types of deals to receive</h2>
				<h2>Select Your Categories:</h2>
				<div class="selectCategory">
					{display_categories_checkboxes}
				</div>
				
			</div>
			<div class="makeSure">
				<h1>Make sure your deals get to the right inbox.</h1>
				<p>Current email address: <span>{$user.email}</span></p>
				<input type="text" value="Enter your updated email address" onfocus="if (this.value=='Enter your updated email address') 
				 this.value='';" onblur="if (this.value==''){ this.value='Enter your updated email address' }" name="email">
			</div>
			<div class="saveChanges">
				<a href="javascript:void(0)" onclick="$('#email_prefence').submit();" class="saveChangeBut">Save Changes</a>
			</div>
                               
		</div>
	</div> 
 </form>