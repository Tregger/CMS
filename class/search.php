<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of catlog_functions
 *
 * @author Vadimuzzz
 */
class search {
    //put your code here
##############################################

public function display_products($id=null,$str, $ord='name', $cur, $lim)
{
    if(isset($id)){
    $s = "";
    if($id>0) $s = "id_p=".$id." and";
    }else{
        $s ="";
    }
   
    /* ---------------------------------------------------- */
     if(isset($cur) && isset($lim)){
         if($cur!=0){
        $sql="SELECT * from catalog where ".$s." folder=0 and ( UPPER(`name`) LIKE UPPER('%".$str."%') or UPPER(`fdescr`) LIKE UPPER('%".$str."%') ) order by ".$ord." ASC Limit ".($cur-1)*$lim.", ".$lim;
         }else{
             $sql="SELECT * from catalog where ".$s." folder=0 and ( UPPER(`name`) LIKE UPPER('%".$str."%') or UPPER(`fdescr`) LIKE UPPER('%".$str."%') ) order by ".$ord." ASC Limit ".($cur)*$lim.", ".$lim;
         }
    }else{
        $sql="SELECT * from catalog where ".$s." folder=0 and ( UPPER(`name`) LIKE UPPER('%".$str."%') or UPPER(`fdescr`) LIKE UPPER('%".$str."%') ) order by ".$ord." ASC ";
    }
     /* ---------------------------------------------------- */

   
    
    $root=fetch_all($sql);
	

    return $root;
}

public function display_deals($id)
{
$deal=array();
$i=0;
    $sql="SELECT * FROM deals where status='running' order by date";
    $root=mysql_query($sql);
	
	while ($root_rec = mysql_fetch_array($root)) {
	   $obj = json_decode($root_rec['pricechart'],true);
	   $obj1 = json_decode($obj,true);
	   $value = $obj1->{'1'};
	   if($obj1->{'good'}==$id)
	   {
	     $i++;
		 $deal[$i]['deal_id']=$root_rec['deal_id'];
         $deal[$i]['deal_type']=$root_rec['deal_type'];
		 $deal[$i]['seller_id']=$root_rec['seller_id'];
		 $deal[$i]['status']=$root_rec['status'];
		 $deal[$i]['pricechart']=$root_rec['pricechart'];
		 $deal[$i]['seller_aswer']=$root_rec['seller_aswer'];
		 $deal[$i]['buyers_answer']=$root_rec['buyers_answer'];
		 $deal[$i]['in_stock']=$root_rec['in_stock'];
		 $deal[$i]['total_buy_count']=$root_rec['total_buy_count'];
		 $deal[$i]['current_price_full']=$root_rec['current_price_full'];
		 $deal[$i]['date']=$root_rec['date'];		 
	   }
    }
    return $deal;
}

public function display_auctions($id)
{
$auction=array();
$i=0;
    $sql="SELECT * FROM deals where good='".$id."' order by date";
    $root=mysql_query($sql);
	
	while ($root_rec = mysql_fetch_array($root)) {
	     $i++;
		 $auction[$i]['id_auc']=$root_rec['id_auc'];
         $auction[$i]['end_date']=$root_rec['end_date'];
		 $auction[$i]['start_price']=$root_rec['start_price'];
		 $auction[$i]['start_date']=$root_rec['start_date'];
		 $auction[$i]['last_bid']=$root_rec['last_bid'];
		 $auction[$i]['seller']=$root_rec['seller'];
		 $auction[$i]['winner']=$root_rec['winner'];
		 $auction[$i]['status']=$root_rec['status'];
		 $auction[$i]['good']=$root_rec['good'];
		 $auction[$i]['info']=$root_rec['info'];
    }
    return $auction;
}

}

?>
