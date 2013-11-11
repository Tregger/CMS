<?php
session_start();
ini_set('display_errors','On'); 
$doc_root=$_SERVER['DOCUMENT_ROOT'];
$host_name="http://".$_SERVER['HTTP_HOST'];
require($doc_root.'/configs/dbconnect.php');
if(isset($_GET['id'])){
    $sql="select * from coupons where id=".$_GET['id'];
    $res=fetch_all($sql);
    $sql2="select * from login_users where userid=".$res[1]['merchant'];
    $user=fetch_all($sql2);
}
/*
$html='
    
        <div class="voudcher_body">
			<div class="top_voucher">
                        
				<div class="savings_section">
					<div class="top_savings">SAVINGS</div>
					<div class="bottom_savings">'.round(100-($res[1]['c_price']/$res[1]['price']*100)).'<span>%</span></div>
				</div>
                              
				<div class="voucher_logo">
					<img src="/img/voucher_logo.png" />
				</div>
                             
			</div>
			<div class="bottom_vouecher">
				<div class="bottom_voucher_body">
					<div class="voucher_title">
						'.$res[1]['title'].'
					</div>
					
					<table>
						<tr>
							<td class="redeem_table_left">
                                                        <div class="voucher_receive">
						Redeem at:
					</div>
                                  <div style="font-size:3px; color: #FFF">.</div>
								<h1>'.$user[1]['businessname'].'</h1>
                                    <div style="font-size:3px; color: #FFF">.</div>
								<div class="voucher_text">
									'.$res[1]['street_address'].'<br>
									'.$res[1]['city'].'<br> '.$res[1]['phone'].'
								</div>
							</td>
							<td class="redeem_table_right">
								 <div class="expire_date">Expires: '.date('F d, Y', $res[1]['st_day']+($res[1]['day_col']*86400)).'</div>
<div style="font-size:3px; color: #FFF">.</div>								
<div class="redemption_code">Redemption Code</div>
<div style="font-size:3px; color: #FFF">.</div>
								<div class="redemption_code_number">'.$res[1]['redemption'] .'</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
        ';
*/

$html='<div class="voucher_body">
		<div class="voucher_topRow">
			<div class="voucher_topRow_head_savings">Savings: <span class="voucher_topRow_head_savings_val">'.round(100-($res[1]['c_price']/$res[1]['price']*100)).'<span class="supPercent">%</span></span></div>
                            <div class="rasporka">&nbsp;</div>
<div class="voucher_topRow_head_logo"><img src="/img/dealLogoVaucher.png"></div>
		</div>
		<div class="voucher_WhiteField">
			<div class="voucher_WhiteFieldBg"> 
			<div class="voucher_WhiteField_head">
				'.$res[1]['title'].'
			</div>
			<div class="voucher_WhiteField_LeftCol">
				<div class="redeemHead">Redeam at:</div>
				<div class="redeamVal">'.$user[1]['businessname'].'</div>
				<div class="redeamAdr">	'.$res[1]['street_address'].'<br>
									'.$res[1]['city'].'<br> '.$res[1]['phone'].'</div>
			</div>
			<div class="voucher_WhiteField_RightCol">
				<div class="expires">Expires : '.date('F d, Y', $res[1]['st_day']+($res[1]['day_col']*86400)).'</div>
				<div class="vaucherCode_head">Redemption Code</div>
				<div class="vaucherCode">'.$res[1]['redemption'] .'</div>
			</div>
			</div>
		</div>
	</div>';
if(isset($_GET['api'])){ 
echo "<style>";
include 'voucher.css';
echo "</style>";
   echo $html;
   
   }else{
//  copy("http://refresh.s-shot.ru/1600/900/png/?http://dealhoster.com/print_voucher.php?id=".$_GET['id']."&api=true&flush_catch=true", $_SERVER['DOCUMENT_ROOT']."/uploads/vouchers/".$_GET['id'].".png");
    include($_SERVER['DOCUMENT_ROOT']."/MPDF/mpdf.php");

 

   
   //$img= file_get_contents("http://mini.s-shot.ru/1024/1024/png/?http://dealhoster.com/print_voucher.php?id=".$_GET['id']."&api=true");
   
  
  
   

//http://refresh.s-shot.ru/1024x768/400/JPEG/RND960558161348158/?dealhoster.com%2Fprint_voucher.php%3Fid%3D55%26api%3Dtrue
        if(isset($_SESSION['claimed'])){
            copy("http://refresh.s-shot.ru/1024/900/png/?http://dealhoster.com/print_voucher.php?id=".$_GET['id']."&api=true", $_SERVER['DOCUMENT_ROOT']."/uploads/vouchers/".$_GET['id'].".png");
           require_once $_SERVER['DOCUMENT_ROOT'].'/img_thumb/ThumbLib.inc.php';
           $thumb = PhpThumbFactory::create("http://".$_SERVER['SERVER_NAME']."/uploads/vouchers/".$_GET['id'].".png");
$thumb->crop(6, 5, 385, 300);
//$thumb->resize(500);

$thumb->save($_SERVER['DOCUMENT_ROOT']."/uploads/vouchers/".$_GET['id'].".png", 'png');
            //$html= "<img  src=\"/uploads/vouchers/".$_GET['id'].".png\" />";
           //echo $html;
               $mpdf=new mPDF('s'); 
    $mpdf->SetDisplayMode('fullpage');
 $stylesheet = file_get_contents('voucher.css');
    $mpdf->WriteHTML($stylesheet,1);
   $mpdf->WriteHTML($html);
// 
$mpdf->Output();
        }

   }
        ?>
