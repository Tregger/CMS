<!--<ul class="admin_menu">
    <li><a href="admin.php?module=catalog">Каталог</a></li>
    <li><a href="admin.php?module=pages">Страницы и модули</a></li>
    <li><a href="admin.php?module=news">Новости</a></li>
    <li><a href="admin.php?module=articles">Статьи</a></li>
    <li><a href="admin.php?module=producers">Производители</a></li>
     <li><a href="admin.php?module=options">Настройки</a></li>
</ul>-->

<ul class="tabset buttons">
				<li {if $cur=='login_users'}class="active"{/if}>
					<a href="/admin.php?module=login_users" class="ico1"><span>Users</span><em></em></a>
					<span class="tooltip"><span>Users</span></span>
				</li>
				<li {if $cur=='coupons'}class="active"{/if}>
					<a href="/admin.php?module=coupons" class="ico2"><span>Deals</span><em></em></a>
					<span class="tooltip"><span>Deals</span></span>
				</li>
                                <li {if $cur=='promotion'}class="active"{/if}>
					<a href="/admin.php?module=promotion" class="ico3"><span>Coupons</span><em></em></a>
					<span class="tooltip"><span>Coupons</span></span>
				</li>
                                <li {if $cur=='categories'}class="active"{/if}>
					<a href="/admin.php?module=categories" class="ico4"><span>Categories</span><em></em></a>
					<span class="tooltip"><span>Categories</span></span>
				</li>
				<li {if $cur=='pages'}class="active"{/if}>
					<a href="/admin.php?module=pages" class="ico5"><span>Pages and Modules</span><em></em></a>
					<span class="tooltip"><span>Pages and Modules</span></span>
				</li>
			
                                <li {if $cur=='messages'}class="active"{/if}>
					<a href="/admin.php?module=messages" class="ico3"><span>Messages</span><em></em></a>
					<span class="tooltip"><span>Messages</span></span>
				</li>
				<li {if $cur=='cities'}class="active"{/if}>
					<a href="/admin.php?module=cities" class="ico6"><span>Cities</span><em></em></a>
					<span class="tooltip"><span>Cities</span></span>
				</li>
				<li {if $cur=='mobile_app'}class="active"{/if}>
                                        <a href="admin.php?module=mobile_app" class="ico7"><span>Mobile App</span><em></em></a>
					<span class="tooltip"><span>Mobile App</span></span>
				</li>
                        	<li {if $cur=='reports'}class="active"{/if}>
                                        <a href="admin.php?module=reports" class="ico8"><span>Reports</span><em></em></a>
					<span class="tooltip"><span>Reports</span></span>
				</li>
				<li {if $cur=='options'}class="active"{/if}>
					<a href="admin.php?module=options" class="ico8"><span>Options</span><em></em></a>
					<span class="tooltip"><span>Options</span></span>
				</li>
                                <li {if $cur=='tickets'}class="active"{/if}>
                                    <a href="/support/scp/login.php" class="ico8" target="tickets" onclick="$('#tickets').show();$('#module').hide();"><span>Ticket Manager</span><em></em></a>
					<span class="tooltip"><span>Ticket Manager</span></span>
				</li>
			</ul>