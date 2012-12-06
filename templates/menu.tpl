						<ul class="products_categories2">
                                                    {foreach from=$root_cat item=root_category}
							<li>
                                                               <a href="/index.php?page=catalog&category={$root_category.id}">
									{$root_category.name}
								</a>
                                                              {include file="sublvl_menu.tpl" cat=$root_category.id}   
                                                               
							</li>
							{/foreach}
						</ul>