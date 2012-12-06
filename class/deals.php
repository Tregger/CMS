<?php

class deals {

    public function add_order($data){
       $pricechart=array();
       $counts= array();
       echo "<pre>";
       var_dump($data);
       echo "</pre>";
        switch($data['type']){
            case "sell":
                //build the price charts
                $counts= count($data['quantity']);
                
                for($i=1; $i<=$counts; $i++){
                    $pricechart[$i]['user_id']=$data['seller'];
                    $pricechart[$i]['good']=$data['good'];
                    $pricechart[$i]['quantity']=$data['quantity'][$i];
                    $pricechart[$i]['price']=$data['price'][$i];
                }
                $pricechart_str=  json_encode($pricechart);
                $sql="insert into 
                    deals(deal_type, seller_id, status, pricechart, in_stock, 	buyers_count, good, last_answered)
                    value
                    ('sell', '".$data['seller']."', 'started', '".$pricechart_str."', '".$data['instock']."', 0, '".$data['good']."', 'seller')
";
                if(!mysql_query($sql)){die(mysql_error());}else{

                    require($_SERVER['DOCUMENT_ROOT'].'/class/messages.php');
                    $msg=new messages;
                    
                    $message['who']=7;
                    $message['whom']=$data['seller'];
                    $message['subject']="Your sell offer has been added to Norshin.com";
                    $message['message']='Your sell offer has been added to Norshin.com. <br> You can see it on the <a href="'.$_SERVER['SERVER_NAME'].'/index.php?page=deals&action=view_deal&id='.  mysql_insert_id().'" target="_blank"> Page with this deal </a>';
                    $msg->send_message($message);
                   header("location: /index.php?page=mynorshin");
                }
            break;
            case "buy":
                  //build the price charts
           
                
                $pricechart[1]['user_id']=$data['buyer'];
                $pricechart[1]['good']=$data['good'];
                $pricechart[1]['quantity']=$data['instock'];
                $pricechart[1]['price']=$data['price'];
                $pricechart_str=  json_encode($pricechart);
                
                $sql="insert into 
                    deals(deal_type, seller_id, status, users_req, buyers_answer, total_buy_count, buyers_count, good, last_answered)
                    value
                    ('buy', '".$data['buyer']."', 'started', '".$pricechart_str."', '".$data['price']."', '".$data['instock']."', 1 , '".$data['good']."', 'buyer')
";
                if(!mysql_query($sql)){die(mysql_error());}else{

                    require($_SERVER['DOCUMENT_ROOT'].'/class/messages.php');
                    $msg=new messages;
                    
                    $message['who']=7;
                    $message['whom']=$data['buyer'];
                    $message['subject']="Your buy order has been added to Norshin.com";
                    $message['message']='Your buy order has been added to Norshin.com. <br> You can see it on the <a href="'.$_SERVER['SERVER_NAME'].'/index.php?page=deals&action=view_deal&id='.  mysql_insert_id().'" target="_blank"> Page with this deal </a>';
                    $msg->send_message($message);
                   header("location: /index.php?page=mynorshin");
                }
            break;
        }
    }
    
    public function get_offers_for_product($product_id){
       // require($_SERVER['DOCUMENT_ROOT']."/class/catalog.php");
       // require($_SERVER['DOCUMENT_ROOT']."/class/members.php");
        $products_model=new catalog();
        $members= new members;
        $like_for_price="\"good\":\"".$product_id."\"";
        $sql="select * from deals where deal_type='sell' and pricechart like '%".$like_for_price."%'";
        //get full mas for table of new offers
        $deals=  fetch_all($sql);
        $deal=array();
        $i=0;
        foreach($deals as $deal_item){
            $i++;
            $mas_p= json_decode($deal_item['pricechart'], true);
                $deal[$i]['deal_id']=$deal_item['deal_id'];
                $deal[$i]['product_title']=$products_model->get_name_category_by_id($product_id);
                $deal[$i]['last_update']=$deal_item['date'];
                $deal[$i]['current_price']=isset($deal_item['seller_aswer']) && !empty($deal_item['seller_aswer'])?$deal_item['seller_aswer']:'The seller has not yet given his answer, or bargaining has not started';
                $deal[$i]['shares']=$deal_item['total_buy_count']."/".count($mas_p);
                $deal[$i]['minimal_quantity']= $mas_p[1]['quantity'];
                $deal[$i]['buyers_in_a_deal'] =	$deal_item['buyers_count'];

                $deal[$i]['seller']= $members->get_user_by_id($deal_item['seller_id']);
            }
            
            return $deal;
    }
    
    public function get_running_delas($product_id){
              $products_model=new catalog();
        $members= new members;
        $like_for_price="\"good\":\"".$product_id."\"";
        $sql="select * from deals where status='running' and pricechart like '%".$like_for_price."%'";
        //get full mas for table of new offers
        $deals=  fetch_all($sql);
        $deal=array();
        $i=0;
        foreach($deals as $deal_item){
            $i++;
            $mas_p= json_decode($deal_item['pricechart'], true);
                $deal[$i]['deal_id']=$deal_item['deal_id'];
                $deal[$i]['product_title']=$products_model->get_name_category_by_id($product_id);
                $deal[$i]['last_update']=$deal_item['date'];
                $deal[$i]['current_price']=isset($deal_item['seller_aswer']) && !empty($deal_item['seller_aswer'])?$deal_item['seller_aswer']:'The seller has not yet given his answer, or bargaining has not started';
                $deal[$i]['shares']=$deal_item['total_buy_count']."/".count($mas_p);
                $deal[$i]['minimal_quantity']= $mas_p[1]['quantity'];
                $deal[$i]['buyers_in_a_deal'] =	$deal_item['buyers_count'];

                $deal[$i]['seller']= $members->get_user_by_id($deal_item['seller_id']);
            }
            
            return $deal;
    }
    
    public function join_running_deal($data){
        
        //get values of current deal data
                $sql="select * from deals where deal_id=".$data['deal'];
                $row=fetch_all($sql);
                $row=$row[1];
                      
        
               
                if(isset($row['users_req']) && $row['users_req']!= "0" && $row['users_req']!= ""){
                    $requested=json_decode($row['users_req'], true);
                    $i=count($requested);
                    $i++;
                    
                }else{
                    $requested=array();
                    $i=1;
                }
               
                $requested[$i]['user_id']=$_SESSION['userid'];
                $requested[$i]['good']=$row['good'];
                $requested[$i]['quantity']=$data['instock'];
                 $requested[$i]['price']=$data['price'];
            
                $row['buyers_count']+=1;
                $row['total_buy_count']=$row['total_buy_count']+$data['instock'];
                $row['users_req']=json_encode($requested);
       
                
                
                if(isset($row['pricechart']) && !empty($row['pricechart']) && isset($row['users_req']) && !empty($row['users_req'])){
                    $change_status_deal=", status='running'";
                }else{
                    $change_status_deal="";
                }
                
        $sql="UPDATE deals SET buyers_count='".$row['buyers_count']."', total_buy_count='".$row['total_buy_count']."', 	users_req='".$row['users_req']."'".$change_status_deal.", last_answered='buyer' where deal_id=".$data['deal'];
        if(!mysql_query($sql)){
            die(mysql_error());
        }
        
    }
    
    public function get_deal_by_id($id){
        
        $sql="select * from deals where deal_id=".$id;
        $deal=fetch_all($sql);
        if (isset($deal) && !empty($deal)){
            return $deal[1];
        }else{
            return false;
        }
        
    }
    
    public function get_product_id_from_deal($deal_id){
        
        $sql="select * from deals where deal_id=".$deal_id;
        $deal=fetch_all($sql);
        if(isset($deal) && !empty($deal)){
            if($deal[1]['deal_type']=='sell'){
                $good_info= json_decode($deal[1]['pricechart'], true);
            }else{
                $good_info= json_decode($deal[1]['users_req'], true);
            }
            $good_id=$good_info[1]['good'];
            
            return $good_id;
        }else{
            return false;
        }
    }
    
    public function get_seller_of_deal($deal_id){
         $sql="select * from deals where deal_id=".$deal_id;
                 $deal=fetch_all($sql);
        if(isset($deal) && !empty($deal)){
          
                $good_info= json_decode($deal[1]['pricechart'], true);
          
            $user_id=$good_info[1]['user_id'];
            
            return $user_id;
        }else{
            return false;
        }
    }
    
        public function get_buyers_leader_of_deal($deal_id){
         $sql="select * from deals where deal_id=".$deal_id;
                 $deal=fetch_all($sql);
        if(isset($deal) && !empty($deal)){
          
                $good_info= json_decode($deal[1]['users_req'], true);
          
            $user_id=$good_info[1]['user_id'];
            
            return $user_id;
        }else{
            return false;
        }
    }
    
    public function get_last_buyers_answer($deal_id){
        $sql="select * from deals where deal_id=".$deal_id;
        $deal=fetch_all($sql);
               if(isset($deal) && !empty($deal)){
          
                $good_info= json_decode($deal[1]['users_req'], true);
          
            $last=reset($good_info);
            
            return $last;
        }else{
            return false;
        }
    }
        public function get_last_seller_answer($deal_id){
        $sql="select * from deals where deal_id=".$deal_id;
        $deal=fetch_all($sql);
               if(isset($deal) && !empty($deal)){
          
                $good_info= json_decode($deal[1]['pricechart'], true);
          
            $last=end($good_info);
            
            return $last;
        }else{
            return false;
        }
    }
    
    
    public function get_all_buyers_request($deal_id){
         $sql="select * from deals where deal_id=".$deal_id;
        $deal=fetch_all($sql);
        if(isset($deal) && !empty($deal)){
               $good_info= json_decode($deal[1]['users_req'], true);
            return $good_info;
        }else{
            return false;
        }
    }
    
    public function set_current_price($deal_id, $user, $id){
        $sql="select * from deals where deal_id=".$deal_id;
        $deal=fetch_all($sql);
        $deal=$deal[1];
        $mas= json_decode($deal['users_req'], true);
        $price=$mas[$id]['price'];
        $sql="update deals set buyers_answer=".$price." where deal_id=".$deal_id;
   
        mysql_query($sql);
        
        header("Location: /index.php?page=deals&action=view_deal&id=".$deal_id);
    }
    
    public function close_deal($deal_id){
        $sql="update deals set status='closed' where deal_id=".$deal_id;
        mysql_query($sql);
        header("Location: /index.php?page=deals&action=view_deal&id=".$deal_id);
    }
    
    public function make_conter($deal_id, $seller_answer){
        $sql="update deals set seller_aswer='".$seller_answer."', last_answered='seller' where deal_id=".$deal_id;
        mysql_query($sql);
        header("Location: /index.php?page=deals&action=view_deal&id=".$deal_id);
    }
       public function make_buyer_conter($deal_id, $buyers_answer){
        $sql="update deals set buyers_answer='".$buyers_answer."', last_answered='buyer' where deal_id=".$deal_id;
        mysql_query($sql);
        header("Location: /index.php?page=deals&action=view_deal&id=".$deal_id);
    }
    
    public function accept_deal($deal_id){
        $sql="update deals set status='accepted' where deal_id=".$deal_id;
        mysql_query($sql);
        header("Location: /index.php?page=deals&action=view_deal&id=".$deal_id);
    }
}

?>
