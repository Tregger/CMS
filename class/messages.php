<?php

class messages{
    public function send($data){
        switch($data['whom']){
            case "all":
                $sql="select * from login_users where activated='1' and blocked='0' and userid<>'18'";
            break;
            case "merchants":
                 $sql="select * from login_users where activated='1' and blocked='0' and user_level='1' and userid!='18'";
            break;
            case "regular":
                 $sql="select * from login_users where activated='1' and blocked='0' and user_level='0' and userid!='18'";
            break;
        }
        
        $userlist=fetch_all($sql);
        foreach($userlist as $user){
             $sql="INSERT INTO messages(id_who, id_whom, subject, text, whom) value('18', '".$user['userid']."', '".$data['subject']."', '".$data['message']."', '".$data['whom']."')";
             mysql_query($sql);
        
        }
        echo "  <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander('add_page');
            if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
        }
        parent.window.location.reload();
        </script>";
    }
    public function get_all_send_messages(){
        $sql="select * from messages group by text, whom";
        $res=fetch_all($sql);
        return $res;
    }
    public function get_message_for_user($userid){
        
        $sql="select * from messages where id_whom=".$userid;
       $results=  fetch_all($sql);
       return isset($results)? $results: 0 ;
    }
    
    public function get_message_by_id($id){
          $sql="select *  from messages where id=".$id." limit 1";
          $results=  fetch_all($sql);
          return isset($results)? $results[1]: 0 ;
    }
    
    public function send_message($message){
        $sql="select userid  from login_users where username like '".$message['whom']."' or userid='".$message['whom']."' limit 1";
        $results=  fetch_all($sql);

        $sql="INSERT INTO messages(id_who, id_whom, subject, text) value('".$_SESSION['userid']."', '".$results[1]['userid']."', '".$message['subject']."', '".$message['message']."')";
        if(mysql_query($sql)){
           header('Location: /index.php?page=mynorshin');
        }else{
            die(mysql_error());
            
        }
        

        
    }
         public function message_read($id){        
       $sql="UPDATE messages SET `read`=1 WHERE id=".$id;
       mysql_query($sql);         
    }
    
    public function get_message_by_userid($id){
          $sql="select *  from messages where id_whom=".$id." and `read` = 0";
          $i=0;
          $records=mysql_query($sql);        
          while($row = mysql_fetch_array($records)) { 
              $i++;
          }                   
          return $i;          
    }
}
?>
