<?php
class Raitings{
     public function getAvgRatingByUserId($id){
        $sql="select avg(rating) from raitings where id_user=".$id;
   
        $res=$this->_db->query($sql)->fetchAll();
         $res=$res[0]['avg(rating)']/5;
        $res=$res*100;
            
        return $res;
    }
    
    public function getLastCommentByUserId($id){
        $sql="select comment from raitings where id_user=".$id." order by id DESC limit 1";
        $res=$this->_db->query($sql)->fetchAll();
        if(isset($res[0]['comment']) && !empty($res[0]['comment'])){
            $comment=$res[0]['comment'];
        }else{
            $comment="This seller hasn't comments";
        }
          return $comment;  
    }
    
    public function get5last_of_product($id){
         $sql="select rating from raitings where id_product=".$id." order by id DESC limit 5";
         $res_q= mysql_query($sql);
             while ($rat = mysql_fetch_array($res_q)) {
       $i++;
         $rating[$i]['rating']=$rat['rating'];

        }
         return $rating;
    }
    public function getLastCommentByProductId($id){
           $comment =  array();
           $sql="select id_voter, comment from raitings where id_product=".$id." order by id DESC limit 1";
            $res=  mysql_query($sql);
            while ($rat = mysql_fetch_array($res)) {
                $comment['id_voter']=$rat['id_voter'];
                 $sql2="select username from login_users where userid=".$rat['id_voter']." limit 1";
                 $res2=  mysql_query($sql2);
                 $user=  mysql_fetch_array($res2);
                 
                 $comment['voter']=$user['username'];
                $comment['comment']=$rat['comment'];
            }
          return $comment;
    }
	

    
    public function  savereview(){
            $data=$_POST['review'];
$sql="insert into raitings(rating_what, id_product, id_user, id_voter, rating, comment) value ('".$data['what']."', '".$data['product']."',  '".$data['user']."', '".$data['who']."', '".$data['rating']."', '".$data['comment']."')";
            
 if(mysql_query($sql)){
     header("location: /index.php");
 }else{
     die(mysql_error());
 }
     


    }
    
}
?>
