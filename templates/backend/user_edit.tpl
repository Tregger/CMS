<form method="POST" action="/admin.php?module=login_users&option={if isset($user) && !empty($user)}edit{else}add{/if}">
     <input type="hidden" value="save" name="method" />
     <input type="hidden" value="login_users" name="module" />
     <input type="hidden" value="edit" name="option" />
     {if isset($user) && !empty($user)}
      <input type="hidden" value="{$user.userid}" name="record[where]" />
     {/if}
      <input type="hidden" name="record[after_insert]" value='      <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("add_page");
           if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
            
        }
        parent.window.location.reload();
        
         </script>'>
     <table>
         <tr>
             <td>Username</td>
             <td><input type="text" name="recrod[username]" {if isset($user) && !empty($user)} value="{$user.username}" {/if}></td>
         </tr>
          <tr>
             <td>Email</td>
             <td><input type="text" name="recrod[email]" {if isset($user) && !empty($user)} value="{$user.email}" {/if}></td>
         </tr>
           <tr>
             <td>Role</td>
             <td>
                 <select name="record[user_level]">
                        <option value="1" {if isset($user) && !empty($user) && $user.user_level=="1"}selected{/if}>Merchant</option>
                        <option value="0" {if isset($user) && !empty($user) && $user.user_level=="0"}selected{/if}>Regular user</option>
                 </select>
             </td>
         </tr>
          <tr>
             <td>Country</td>
             <td>
                <input type="text" name="recrod[info]" {if isset($user) && !empty($user)} value="{$user.info}" {/if}>
             </td>
         </tr>
         {if isset($user) && !empty($user) && $user.user_level=="1"}
             <tr>
                 <td>Website</td>
                 <td><input type="text" name="record[website]" value="{$user.website}"></td>
             </tr>
               <tr>
                    <td>Gender</td>
                    <td>
                        <input type="radio" name="record[gender]" value="1" {if $user.gender=='1'}checked{/if}> Male<br>
                        <input type="radio" name="record[gender]" value="0" {if $user.gender=='0'}checked{/if}> Female<br>
                    </td>

             </tr>
             <tr>
                 <td>Business Name</td>
                 <td><input type="text" name="record[businessname]" value="{$user.businessname}"></td>
             
             </tr>
             <tr>
                 <td>ZIP</td>
                 <td><input type="text" name="record[zip]" value="{$user.zip}"></td>
              	
             </tr>
             <tr>
                  <td>City</td>
                 <td><input type="text" name="record[city]" value="{$user.city}"></td>
                  	
             </tr>
             <tr>
                  <td>Street</td>
                 <td><input type="text" name="record[street]" value="{$user.street}"></td>
                  	
              </tr>
              <tr>
                 <td>Phone</td>
                 <td><input type="text" name="record[phone]" value="{$user.phone}"></td>
                 
              </tr>
              {else}
                    <tr>
                 <td>Website</td>
                 <td><input type="text" name="record[website]"></td>
             </tr>
               <tr>
                    <td>Gender</td>
                    <td>
                        <input type="radio" name="record[gender]" value="1" checked> Male<br>
                        <input type="radio" name="record[gender]" value="0" > Female<br>
                    </td>

             </tr>
             <tr>
                 <td>Business Name</td>
                 <td><input type="text" name="record[businessname]"></td>
             
             </tr>
             <tr>
                 <td>ZIP</td>
                 <td><input type="text" name="record[zip]"></td>
              	
             </tr>
             <tr>
                  <td>City</td>
                 <td><input type="text" name="record[city]"></td>
                  	
             </tr>
             <tr>
                  <td>Street</td>
                 <td><input type="text" name="record[street]" ></td>
                  	
              </tr>
              <tr>
                 <td>Phone</td>
                 <td><input type="text" name="record[phone]" ></td>
                 
              </tr>
         {/if}
         <tr>
             <td>Activated ?</td>
             <td>
                <input type="checkbox" name="recrod[activated]" {if isset($user) && !empty($user) && $user.activated==1}checked {/if}value="1">
             </td>
         </tr>
            <tr>
             <td>User blocked ?</td>
             <td>
                <input type="checkbox" name="recrod[blocked]" {if isset($user) && !empty($user) && $user.blocked==1}checked {/if}value="1">
             </td>
         </tr>
         
     </table>
            
     <input type="submit" value="Apply" />
</form>