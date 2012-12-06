<?php

function smarty_function_display_comments_home($params, &$smarty)
{
    $deal = $params["deal"];
    $sql="select * from comments where deal_id=".$deal;
    $comments=fetch_all($sql);
      require_once $_SERVER['DOCUMENT_ROOT'].'/class/members.php';
                 
    $users=new members;

    if(isset($comments) && !empty($comments)){
        foreach($comments as $comment){
           $username= $users->get_user_by_id($comment['user_id']);

         echo '  <div class="comment_line">';
                 echo '               <table>';
                    echo '                <tbody><tr>';
                    if(isset($username['avatar']) && !empty($username['avatar'])){
                           echo '<td style="vertical-align:top;"><img src="'.$username['avatar'].'" style="width:35px"></td>';
                    }else{
                        echo '<td style="vertical-align:top;"><img src="/images/nobody.jpg" style="width:35px"></td>';
                    }
                           echo '<td>';
                           echo '<div class="commenter_name">'.$username['username'].'</div>';
                           echo '<div class="comment_text">'.$comment['comment'].'</div>';
                           echo '</td>';
                           echo '</tr>';
                           echo '</tbody></table>';
                           echo '</div>';
    }
    }else{
            echo '  <div class="comment_line">';
            echo '<table>';
            echo '<tbody><tr>';
            echo '<td style="vertcal-align: middle; text-align: center" class="comment_text">';
            echo "No one has commented on this deal";
            echo '</td>';
            echo '</tr>';
            echo '</tbody></table>';
            echo '</div>';
    }
}




?>