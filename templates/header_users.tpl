<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" SYSTEM "http://www.w3.org/TR/xhtml1/dtd/xhtml1-transitional.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
<title>Deal Hoster</title>   
<LINK href="/css/style.css" rel="stylesheet" type="text/css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="/js/jquery.easing.1.3.js" type="text/javascript" charset="UTF-8"></script>
		<script src="/js/jquery.vgrid.0.1.7.js" type="text/javascript" charset="UTF-8"></script>
                   {literal}
<script type="text/javascript"> 
//<![CDATA[
	(function($){
		$(function(){
		
			$('#header').css("visibility", "hidden");
			var setGrid = function () {
				return $("#grid-content").vgrid({
					//easeing: "easeOutQuint",
					//time: 800,
					//delay: 60,
					//selRefGrid: ".wrapper .content_block",
					//selFitWidth: [".content", ".wrapper"],
					//gridDefWidth: 290 + 15 + 15 + 5,
					//forceAnim: 1
				});
			};	
		
			setTimeout(setGrid, 300);
			setTimeout(function() {
				$('.header').hide().css("visibility", "visible").fadeIn(500);
			}, 500);
			
			$(window).load(function(e){
				setTimeout(function(){ 
					// prevent flicker in grid area - see also style.css
					$("#grid-content").css("paddingTop", "0px");
				}, 1000);
			});
	$("#display_categories").click(function(){
            if($(".dropdown_category").css('display')=='none'){
                  $(".dropdown_category").show();
                }else{
                     $(".dropdown_category").hide();
                }
        });
            
            $(".close_msg").click(function(){
                document.cookie = "message_block=no";
                $(".message_block").hide();
            });
//      $(".dropdown_category").hover(function(){
//            $(".dropdown_category").show('slow');
//         }, function(){
//          $(".dropdown_category").hide('slow');
//      });
         
         	$("#display_categories2").click(function(){
                     if($(".dropdown_category2").css('display')=='none'){
            $(".dropdown_category2").show();
                }else{
                     $(".dropdown_category2").hide();
}
        });
//      $(".dropdown_category2").hover(function(){
//            $(".dropdown_category2").show('slow');
//         }, function(){
//          $(".dropdown_category2").hide('slow');
//         });
         if(get_cookie('message_block')!=null){
               $(".message_block").hide();
         }else{
             $(".message_block").show();
    }
         
		}); // end of document ready
	})(jQuery); // end of jQuery name space 
//]]>

function get_cookie ( cookie_name )
{
  var results = document.cookie.match ( '(^|;) ?' + cookie_name + '=([^;]*)(;|$)' );
 
  if ( results )
    return ( unescape ( results[2] ) );
  else
    return null;
}
		</script>
                {/literal}
                <base href="http://dealhoster.com">
</head>
<body>
      
<div class="wrapperBlock">

      <div class="headerBlock">
		<div class="headerCont">
			<div class="logoBlock">
			<a class="logoAccount" href="/"></a>
			</div>
			<div class="searchEverything">
				<div class="searchMenu">
					<div class="searchInput">
                                            <form method="POST" action="/search/" id="search">
						<input type="text" name="text" onblur="if (this.value==''){ this.value='Search deals' }" onfocus="if (this.value=='Search deals') this.value='';" value="Search deals">
						<input type="submit" style="display: none">
                                                    <a href="javascript:void(0)" onclick="$('#search').submit()"></a>
                                            </form>
					</div>
					<div class="menuBlock">
                                            <ul>
                                                <li>
                                                {if !isset($smarty.get.action) && !isset($smarty.get.map_view)}
                                                    <a href="/{if isset($smarty.get.lookup)}index.php?lookup=1{/if}" class="active">Everything</a>
                                                {else}
                                                    <a href="/{if isset($smarty.get.lookup)}index.php?lookup=1{/if}">Everything</a>
                                                {/if}
                                                </li>
                                                <li>
                                                {if isset($smarty.get.action) && $smarty.get.action=='filter_by_category'}
                                                    <a class="active" href="javascript:void(0)" id="display_categories">Categories</a>
                                                    {display_categories_menu}
                                                  
						{else}
                                                     <a href="javascript:void(0)" id="display_categories">Categories</a>
                                                     {display_categories_menu}
                                                {/if}
                                                </li>
                                                <li>
                                                {if isset($smarty.get.map_view)}
                                                     <a class="active" href="/index.php?map_view=1&city={if isset($smarty.get.city)}{$smarty.get.city}{else}{$client_city}{/if}{if isset($smarty.get.lookup)}&lookup=1{/if}">Map view</a>
                                                 {else}
                                                     <a href="/index.php?map_view=1&city={if isset($smarty.get.city)}{$smarty.get.city}{else}{$client_city}{/if}{if isset($smarty.get.lookup)}&lookup=1{/if}">Map view</a>
                                                 {/if}
                                                 </li>
                                              </ul>
					</div>
				</div>
			</div>
                        
			<div class="changeCity">
                           
				<div class="seattleCity">
				<h1>{if isset($smarty.get.city)}{$smarty.get.city}{else}{$client_city}{/if}</h1>
				<img src="/img/changecity.png">
				</div>
                                <ul>
                                    <li>
				<a href="javascript:void(0)" id="display_categories2">Change City</a>
                                {display_cities}
                                </li>
                                </ul>
                                    
			</div>
                         
			<div class="signupMenu">
                            {if $logged=='0' || !isset($smarty.session.userid)}
				<a href="/index.php?page=register" class="active">Join</a>
				<a href="/index.php?page=login">LOGIN</a>
				<ul>
                                    <li>
                                        <a href="javascript:void(0)">MORE</a>
                                        <ul>
                                            <li><a href="/index.php?page=login&action=merchant_login&merchant=true">Merchant login</a></li>
                                            <li><a href="/index.php?page=how-it-works">How It Works</a></li>
                                        </ul>
                                    </li>
                                </ul>
                             {else}
                                 <a href="/index.php?page=myaccount" class="active">My account</a>
			         <a href="/account/logout.php?logmeout=true">LOG OUT</a>
                             {/if}
			</div>
<!--			<div class="socialBlock">
				<a href="#"><img src="/img/twitter.jpg"></a>
				<a href="#"><img src="/img/facebook.jpg"></a>
			</div>-->
		</div>
	</div>
       <div class="contBlock">
    
       
     