
{include file="header.tpl"}
	<div id="wrapper">
		<div id="content">
			<div class="c1">
				<div class="controls">
					<nav class="links">
<!--						<ul>
							<li><a href="#" class="ico1">Messages <span class="num">26</span></a></li>
							<li><a href="#" class="ico2">Alerts <span class="num">5</span></a></li>
							<li><a href="#" class="ico3">Documents <span class="num">3</span></a></li>
						</ul>-->
					</nav>
					<div class="profile-box">
						<span class="profile">
							<a href="/" class="section">
								
								<span class="text-box">
									Welcome
									
								</span>
							</a>
							
						</span>
						<a href="/admin.php?make=logout" class="btn-on">On</a>
					</div>
				</div>
				<div class="tabs">
					<div id="tab-1" class="tab">
						<article>
							<div class="text-section">
								<h1>{$name}</h1>
								<p>{$info}</p>
							</div>
						<iframe id="tickets" name="tickets" style="display: none; width:100%; height: 2000px; border: none;"></iframe>
                                                <div id="module">    
                                                {include file="$module" }
                                                </div>
						</article>
					</div>
					
				</div>
			</div>
		</div>
		<aside id="sidebar">
			<strong class="logo"><a href="#">lg</a></strong>
			   {include file="menu.tpl" title=Admin}
			<span class="shadow"></span>
		</aside>
	</div>

{include file="footer.tpl" title=Login}