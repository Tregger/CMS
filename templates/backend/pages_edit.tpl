<script type="text/javascript" src="/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
 <script type="text/javascript" src="/tinymce/jscripts/tiny_mce/plugins/tinybrowser/tb_tinymce.js.php"></script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		theme : "advanced",
		plugins : "autolink,lists,pagebreak,style,layer,table,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave,visualblocks",

		// Theme options
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,image,help,code,|,forecolor,backcolor",
		theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,fullscreen",
		theme_advanced_buttons4 : "cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft,visualblocks",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,
              //  file_browser_callback : "tinyBrowser",	
		// Example content CSS (should be your site CSS)
                {if $page.type ne 'merchant_intro'}
		content_css : "/css/merchant_promo.css",
                {else}
                    content_css : "/css/merchant_promo.css",
                {/if}
		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "lists/template_list.js",
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",
		media_external_list_url : "lists/media_list.js",


		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
</script>
{if $page.type ne 'merchant_intro'}
<form method="post">
     <input type="hidden" value="save" name="method" />
     <input type="hidden" value="pages" name="module" />
     <input type="hidden" value="edit" name="option" />
      <input type="hidden" value="{$page.id}" name="page[id]" />
     <table>
         <tr>
             <td>Name(title):</td>
             <td><input type="text" name="page[name]" value="{$page.name}"  required></td>
         </tr>
         <tr>
             <td>Text:</td>
             <td>
                 <textarea name="page[fdescr]" >{$page.fdescr}</textarea>
             </td>
         </tr>
         <tr>
             <td>Type of Page:</td>
             <td>
                 <select name="page[type]" required>
                     {modules sel=$page.type}
                 </select>
             </td>
         </tr>
         <tr>
             <td>Url:</td>
             <td>
                 <input type="text" name="page[url]" value="{$page.url}" required></textarea>
             </td>
         </tr>

          <tr>
             <td>Keywords(meta):</td>
             <td>
                 <input type="text" name="page[meta]" value="{$page.meta}"></textarea>
             </td>
         </tr>
         <tr>
             <td>Description(meta):</td>
             <td>
                <input type="text" name="page[description]" value="{$page.description}"></textarea>
             </td>
         </tr>
           <tr>
             <td>Отображать в меню:</td>
             <td>
                 <select name="page[display]">
                     <option value="yes" {if $page.display=='yes'}selected{/if}>Отображать</option>
                       <option value="none" {if $page.display=='none'}selected{/if}>Не отображать</option>
                 </select>
                
             </td>
         </tr>
     </table>
     <input type="submit" value="Add Page" />
</form>
                 {else}
                     
                     
                     <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" SYSTEM "http://www.w3.org/TR/xhtml1/dtd/xhtml1-transitional.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <!--
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
					<a href="/index.php?page=how-it-works">How it <span>Works</span></a>
					<a href="/index.php?page=about-us">About <span>us</span></a>
					<a href="/index.php?page=contact-us">Contact <span>us</span></a>
				</div>
				<div class="getStarted">
					<input type="button" onclick="window.location.href='/index.php?page=register&action=merchant_register&merchant=true'">
					<p>or</p>
					<a href="/index.php?page=login&action=merchant_login&merchant=true">sign in</a>
				</div>
				<img src="img/headshadow.png"/>
			</div>
		</div>
	</div>
-->	
<form method="post" action="/func/ajaxfunc.php?option=change_intro">
    <div class="contBlockLogin">
		<div class="leftShad"></div>
		<div class="rightShad"></div>
		<div class="createYourAccountSignIntro">
                    <textarea name="block1">
			{$block1}
                    </textarea>
			<div class="instantAcess">
				<div class="baldMen" width="580">
                                    <textarea name="block2" style="width:500px;height:320px;">
					{$block2}
                                    </textarea>
                                    </div>
				<div class="postYourDeal">
                                    <textarea name="block3">
					{$block3}
                                     </textarea>
					<a href="/account/register.php?merchant=true&action=merchant_register&merchant=true">Post Your Deal<br/><span>Just ${$price_post}</span></a>
					<div class="lineEmpty">
					</div>
				</div>
				<div class="photoBack">
					<img src="img/photoback.png"/>
				</div>
			</div>
			<div class="plansWithPic" id="tabs">
				<ul class="plansPricing" style="display:block; list-style-type: none;">
					<li style="display:block; float: left"><a href="#tab1"><input type="text" name="tab1_label" value="{$tab1_label}"></a></li>
					<li style="display:block; float: left"><a href="#tab2"><input type="text" name="tab1_labe2" value="{$tab2_label}"></a></li>
					<li style="display:block; float: left"><a href="#tab3"><input type="text" name="tab1_labe3" value="{$tab3_label}"></a></li>
					<li style="display:block; float: left"><a href="#tab4"><input type="text" name="tab1_labe4" value="{$tab4_label}"></a></li>
				</ul>
				<div class="makeYourBusiness" id="tab1">
                                    <textarea name="tab1">
					{$tab1}
                                    </textarea>
                                </div>
                            <div class="makeYourBusiness" id="tab2">
                                 <textarea name="tab2">
					{$tab2}
                                 </textarea>
                                </div>
                                   <div class="makeYourBusiness" id="tab3">
                                        <textarea name="tab3">
                                       {$tab3}
				  </textarea>
                                    </div>
                                   <div class="makeYourBusiness" id="tab4">
                                        <textarea name="tab4">
					{$tab4}
                                     </textarea>
                                    </div>
			</div>
		</div>
	</div>
                                        <input type="submit" value="Apply">
                                        <br><br><br>
</form>
                                        <!--
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
					<a href="/index.php?page=overview">Overview</a><br/>
					<a href="/index.php?page=getting-started">Getting started</a><br/>
				</div>
				<div class="clippingRequired">
					<div class="likeBlock">
						<div class="fb-like" data-href="http://dealhoster.certumsoft-dev.ru" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>
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
-->
</div>
</div>
</body>
</html>
                     {/if}