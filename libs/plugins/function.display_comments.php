<?php

function smarty_function_display_comments($params, &$smarty)
{
    $deal = $params["deal"];
    $sql="select * from comments where deal_id=".$deal;
    $comments=fetch_all($sql);
      require_once $_SERVER['DOCUMENT_ROOT'].'/class/members.php';
                 
    $users=new members;

    if(isset($comments) && !empty($comments)){
        foreach($comments as $comment){
           $username= $users->get_user_by_id($comment['user_id']);
        echo '<div class="ci_commentItem">';
         if(isset($username['avatar']) && !empty($username['avatar'])){
              echo '<div class="ci_commentItemPhoto"><img src="'.$username['avatar'].'" style="width:50px"/></div>';
         }else{
             
               echo '<div class="ci_commentItemPhoto"><img src="/images/nobody.jpg" style="width:50px"/></div>';
         }
        echo '<div class="ci_commentItemContent">';
        echo '<div class="ci_commentItemContentHd">'.$username['username'].'<span class="ci_commentItemTime">'.$comment['date'].'</span></div>';
        echo '<div class="ci_commentItemContentTxt">'.$comment['comment'].'</div>';
        echo '</div>';
        echo '</div>';
    }
    }else{
       echo ' <div class="ci_commentItem">';
        	//echo '<div class="ci_commentItemPhoto"><img src="/images/testpht.jpg"/></div>';
					echo '<div class="ci_commentItemContent">';
					
					echo '	<div class="ci_commentItemContentTxt">No one has commented on this deal</div>';
					echo '</div>';
                                       echo '</div>';
    }
}




?>