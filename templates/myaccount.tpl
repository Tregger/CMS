<form method="POST" action="/index.php?page=myaccount&action=change_account" id="edit" enctype="multipart/form-data">
<input type="hidden" name="record[where]" value="{$smarty.session.userid}">
    <div class="contBlock">
		<div class="blockBlock" style="margin-left:0;">
			<h1>My Account <span>/  Email Preferences</span></h1>
			<div class="accountInform">
				<div class="accountInformBlock">
					<a href="/index.php?page=myaccount" class="blue">Account Information</a>
					<a href="/index.php?page=myaccount&action=email_prefence" >Email Preferences</a>
				</div>
				<div class="alertAccountPreferences">
					<h1>My Account Information</h1>
				</div>
			<table class="firstLast">
				<tbody><tr>
					<td class="nameText">Full name</td>
					<td class="input"><input type="text" name="record[username]" value="{$user.username}"></td>
				</tr>
				
				<tr>
					<td></td>
					<td class="textP">Your name is displayed on your profile</td>
				</tr>
			</tbody></table>
			<table class="genderMale">
				<tbody><tr>
					<td class="gender">Gender</td>
					<td class="check">
							<input type="radio" name="record[gender]" value="1" {if $user.gender == '1'} checked{/if}>
							<p>Male</p>
					</td>
					<td class="check">
							<input type="radio" name="record[gender]" value="0"  {if $user.gender == '0'} checked{/if}>
							<p>Female</p>
					</td>
				</tr>
			</tbody></table>
			<table class="location">
				<tbody><tr>
					<td class="locaionText">Location</td>
					<td class="select1">
                                            <input type="text" name="record[info]" value="{$user.info}" style="width:100%; border:none">
					</td>
				</tr>
				<tr>
					<td class="locaionText"></td>
					<td class="simplyText">Simply type your location, e.g. Brooklyn, NY or Los Angeles, CA.</td>
				</tr>
			</tbody></table>
                                        {if $smarty.session.user_level==1}
                                        <div class="changeProfile" style="padding-left:235px">
                                            				<h1>Business Information</h1>
				<table class="yourName">
					<tr>
						<td class="your">Business Name*</td>
						<td class="websiteyour" colspan="3"><input type="text" name="record[businessname]" value="{$user.businessname}" required/></td>
					</tr>
					<tr>
						<td class="your">Website</td>
						<td class="websiteyour" colspan="3"><input type="text" name="record[website]" value="{$user.website}"/></td>
					</tr>
					<tr>
						<td class="street">Address*</td>
						<td class="website" colspan="3"><input type="text" name="record[street]" value="{$user.street}" required /><p class="firs">Street</p></td>
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
						<td class="zip"><input type="text" name="record[zip]" value="{$user.zip}" required /><p class="firs">Zip</p></td>
					</tr>
					<tr>
						<td class="street"></td>
						<td class="website" colspan="3">
<!--						<input type="text" name="record[info]" required/>-->
<select name="record[info]" required>
    <option value="United States" {if $user.info=='United States'}selected{/if}>United States</option>
    <option value="Canada" {if $user.info=='Canada'}selected{/if}>Canada</option>
</select>
							<p class="firs">Country</p>
						</td>
					</tr>
				</table>
                                            </div>
{/if}
			<div class="changeProfile">
				<div class="changeText">Change profile picture</div>
                                {if isset($user.avatar) && !empty($user.avatar)}
                                    <img src="{$user.avatar}">
				{else}
                                    <img src="/img/profilepic.jpg">
                                {/if}
				<div class="choosePic">
					<div class="chooseFile">
						<a class="chooseBut" href="javascript:void(0)" onclick="document.getElementById('ava').click();"><img src="/img/choose.jpg"></a>
						<p id="change_text">No file chosen</p>
					</div>
                                    <input type="file" id="ava" name='record[avatar]' onchange="document.getElementById('change_text').innerHTML=this.value;" accept="image/jpeg,image/png,image/gif" style="height:1px; overflow: hidden;">
				</div>
			</div>
			<div class="changePassword">
				Change Password
			</div>
			<table class="newPassword">
				<tbody><tr>
					<td class="paswText">New Password</td>
					<td class="inputPass"><input type="text" name='record[pass]'></td>
				</tr>
				<tr>
					<td class="paswText">Retype Password</td>
					<td class="inputPass"><input type="text" name='record[pass2]'></td>
				</tr>
			</tbody></table>
			<div class="emptyBlock">
			</div>
			<div class="saveChanges">
				<a class="saveChangeBut" href="javascript:void(0)" onclick="  document.getElementById('edit').submit();">Save Changes</a>
			</div>
			</div>
		</div>
	</div>
                    </form>
                    