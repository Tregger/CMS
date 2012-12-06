<?php

function smarty_function_display_menu($params, &$smarty)
{
    
  $site_pages=new pages;
    $pages=$site_pages->get_pages();
    $last_page=count($pages)-1;
$i=0;
                        echo '<ul>';
                        foreach($pages as $k=>$v){
                            if($last_page!=$i){
                                if($v['url']!='home'){
                                    if($params['cur']==$v['url']){
                                        echo '<li class="active"><a  href="/'.$v['url'].'/">'.$v['name'].'</a><img src="/img/menuline.jpg"></li>';
                                    }else{
                                        echo '<li><a href="/'.$v['url'].'/">'.$v['name'].'</a><img src="/img/menuline.jpg"></li>';
                                    }
                                }
                            }else{
                                 if($v['url']!='home'){
                                    if($params['cur']==$v['url']){
                                        echo '<li class="active"><a  href="/'.$v['url'].'/">'.$v['name'].'</a></li>';
                                    }else{
                                        echo '<li><a href="/'.$v['url'].'/">'.$v['name'].'</a></li>';
                                    }
                                }
                            }
                            $i++;
                        }
				
			echo '</ul>';
}



?>