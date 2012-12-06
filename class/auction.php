<?php

/*
 * Add auction function to the site
 */

/**
 * Description of auction
 *
 * @author Tregger
 */
class auction {
    function __construct() {
       
    }
    // get auc by id
    public function get_auction($id){
        $sql = "select * from auction where id_auc=".$id;
        $auc = fetch_all($sql);
        return $auc;
    }

//save auction to database
    public function add_auction($data){
        $sql="insert into auction(end_date, start_price, start_date, seller, status, good, info)
                value
                ('".strtotime($data['end_date'])."', '".$data['start_bid']."', '".$data['start_date']."', '".$data['seller']."', '".$data['status']."', '".$data['good_id']."', '".$data['additional_info']."')";
    
        if(!mysql_query($sql)){
                die(mysql_error());
        }else{
            header("Location: /index.php?page=auction&action=myauctions");
        }
    }
    
   
    
    
    //get all auction for user(where he bidder, and where he seller)
    public function get_auction_for_user($userid){
        //get all auct where user is seller, and mark this records by manualy field `tab` 
        $sql="select *, 'is_seller' as tab, bids.price as las_bid  from auction as auc
        left join catalog on auc.good=catalog.id
        left join bids on auc.id_auc=bids.id_auction
        where seller=$userid group by id_auc";
       $auc1=  fetch_all($sql);
       
   
       //get all auct where user is buyer, and mark this records by manualy field `tab` 
        $sql="select *, 'is_buyer' as tab
              from auction as auc 
              INNER JOIN bids ON auc.id_auc=bids.id_auction
              inner join catalog on auc.good=catalog.id
              where bids.id_bidder=$userid group by id_auc";
       $auc2=  fetch_all($sql);
       $auc3=array_merge($auc1, $auc2);
       //echo "<pre>";
       //var_dump($auc3);
       //echo "</pre>";
       return $auc3;
    }
    
    public function update_auc($data){
        $sql="UPDATE auction SET end_date='".strtotime($data['end_date'])."', start_price='".$data['start_bid']."', start_date='".$data['start_date']."', seller='".$data['seller']."', status='".$data['status']."', good='".$data['good_id']."', info='".$data['additional_info']."' WHERE id_auc=".$data['edit'];

        if(!mysql_query($sql)){
                die(mysql_error());
        }else{
            header("Location: /index.php?page=auction&action=myauctions");
        }
        
    }
    
    /* Bidding functional */
    
    public function get_last_bid($auc){
        $sql="select * from bids where id_auction=".$auc." order by id_bid desc";
//         var_dump($sql);
//                        exit();
        $bid=  fetch_all($sql);
        return $bid[1];
    }
    
    public function make_bid($id_auc, $bid_price, $comment, $bidder){
        $id_bidder=$bidder;
        
        // make flags errors
        $sql="select price from bids where id_auction=".$id_auc." order by price DESC limit 1";
        $res=fetch_all($sql);
        if(isset($res) && !empty($res) && $res[1]['price']>=$bid_price){
            $error_message="Your bid must be greater then previous (".$res[1]['price'].")";
        }
        $sql="select start_price from auction where id_auc=".$id_auc;
        $res=fetch_all($sql);
        if($res[1]['start_price']>$bid_price){
            $error_message="Your bid must be greater or equal then start bid price(".$res[1]['start_price'].")";
        }
        
        $sql="select id_bidder from bids where id_auction=".$id_auc." order by id_bid DESC limit 1";
        $last_bidder=fetch_all($sql);
        if($last_bidder[1]['id_bidder']==$bidder){
            $error_message="Your bid is the latest, please wait another bids";
        }
        // if no errors add bid to database
        if(!isset($error_message) || empty($error_message)){
            $sql="insert into bids(id_bidder, price, date, id_auction, comment) value(".$id_bidder.", '".$bid_price."', '".time()."', '".$id_auc."', '".$comment."')";
           if(!mysql_query($sql)){die(mysql_error());}
           return "Your bid has been added<br><input type='button' onclick='window.location.reload()' value='Ok'>";
        }else{
            return $error_message."<br><input type='button' onclick='window.location.reload()' value='Ok'>";
        }
    }
    
    public function get_bids_to_auction($auc){
        $sql="select * from bids where id_auction=".$auc;
        $bids=fetch_all($sql);
        return $bids;
    }
    
    public function find_auctions_for_good($id){
        $sql="select  * from auction where good=".$id;
        $auctions=fetch_all($sql);
        return $auctions;
        
    }
    
    public function accept_bid($id){
        //get selected bid
        $sql="select * from bids where id_bid=".$id;
        $sbid=fetch_all($sql);
        //update auction for this bid
        $sql="select * from auction where id_auc=".$sbid[1]['id_auction'];
        $auc_info=fetch_all($sql);
        require($_SERVER['DOCUMENT_ROOT'].'/class/messages.php');
       $msg= new messages;
                    $message['who']=7;
                    $message['whom']=$auc_info[1]['seller'];
                    $message['subject']="Your auction has been finished";
                    $message['message']='Your <a href="/index.php?page=auction&action=display&id='.$auc_info[1]['id_auc'].'" target="_blank">auction</a>  has been finished <br> You can see history of bids <a href="/index.php?page=auction&action=view_bids&id='.$auc_info[1]['id_auc'].'" target="_blank"> here </a>';
                    $msg->send_message($message);
                    
                    $message['who']=7;
                    $message['whom']=$sbid[1]['id_bidder'];
                    $message['subject']="You won auction!";
                    $message['message']='Your won <a href="/index.php?page=auction&action=display&id='.$auc_info[1]['id_auc'].'" target="_blank">auction</a>   <br> You can see history of bids <a href="/index.php?page=auction&action=view_bids&id='.$auc_info[1]['id_auc'].'" target="_blank"> here </a>';
                    $msg->send_message($message);
        $sql="update auction set status='finished', winner='".$sbid[1]['id_bidder']."', last_bid='".$sbid[1]['price']."' where id_auc=".$sbid[1]['id_auction'];
        mysql_query($sql);
        
        header("location: /index.php?page=auction&action=myauctions");
        
        
    }
        
}

?>
