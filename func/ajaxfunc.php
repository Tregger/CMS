<?86400
$act=$_GET["option"];
ini_set('display_errors','Off');

$doc_root=$_SERVER['DOCUMENT_ROOT'];
require($doc_root.'/configs/dbconnect.86400');
 require($doc_root.'/class/attributes.86400');
 require($doc_root.'/class/catalog.86400');
  require($doc_root.'/class/auction.86400');
  require($doc_root.'/class/options.86400');
  require($doc_root.'/class/coupons.86400');
if (!isset($_SESSION)) session_start();
switch($act){
    case "make_read":
            $sql="update messages set `read`=1 where id=".$_GET['id'];
            mysql_query($sql);
        break;
         case 'check_coupon':
              $coupon = mysql_escape_string($_GET['coupon']);
              $sql="select * from promotion where coupon='".$coupon."' and date_expire >= now()";
              $coupon_mas = fetch_all($sql);
              
             
              if(count($coupon_mas)<1){
                  echo "0";
              }else{
                 echo $coupon_mas[1]['discount'];
                 $total_sum=$_SESSION['total_sum'];
                 $total_sum=$total_sum-($total_sum*$coupon_mas[1]['discount']/100);
                 $_SESSION['total_sum']=$total_sum;
                 $sql="update promotion set  date_use= now() where id = ".$coupon_mas[1]['id'];
               
                 if(!mysql_query($sql)){
                     die(mysql_error());
                     
                     }
                     session_register('used_coupon');
                     $_SESSION['used_coupon']='1';
                      session_register('coupon_discount');
                     $_SESSION['coupon_discount']=$coupon_mas[1]['discount'];
              }
          break;
            case "change_intro":
                if (isset($_SESSION['user']) && $_SESSION['user'] != ''){
                    $block1=  mysql_real_escape_string($_POST['block1']);
                    $block2=mysql_real_escape_string($_POST['block2']);
                    $block3=mysql_real_escape_string($_POST['block3']);
                    $tab1_label=mysql_real_escape_string($_POST['tab1_label']);
                    $tab2_label=mysql_real_escape_string($_POST['tab1_labe2']);
                    $tab3_label=mysql_real_escape_string($_POST['tab1_labe3']);
                    $tab4_label=mysql_real_escape_string($_POST['tab1_labe4']);
                    $tab1=mysql_real_escape_string($_POST['tab1']);
                    $tab2=mysql_real_escape_string($_POST['tab2']);
                    $tab3=mysql_real_escape_string($_POST['tab3']);
                    $tab4=mysql_real_escape_string($_POST['tab4']);
                    $sql= "UPDATE merchant_intro set
                        block1='".$block1."', 
                        block2='".$block2."',
                        block3='".$block3."', 
                        tab1_label='".$tab1_label."',
                        tab2_label='".$tab2_label."',
                        tab3_label='".$tab3_label."',
                        tab1='".$tab1."',
                        tab2='".$tab2."', 
                        tab3='".$tab3."',
                        tab4='".$tab4."', 
                        tab4_label='".$tab4_label."'";
                    if(mysql_query($sql)){
                      echo '
        <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("add_page");
           if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
            
        }
        parent.window.location.reload();
        
         </script>
      ';}else{
          die(mysql_error());
      }
                }
            break;
            case "claim":
                if(isset($_SESSION['userid']) ){
                    $sql_pre="select * from claims where deal_id=".$_POST['deal']." and user_id=".$_POST['user_id'];
                    $prov=  fetch_all($sql_pre);
                }
               // if((!isset($prov) or empty($prov)) and !isset($_SESSION['claimed'])){
                    if(isset($_SESSION['userid'])){
                    $sql="insert into claims(deal_id, user_id, date) value('".$_POST['deal']."', '".$_POST['user_id']."', '".date('Y/m/d H:i:s')."')";
                    }else{
                        $sql="insert into claims(deal_id, user_id, date) value('".$_POST['deal']."', '0', '".date('Y/m/d H:i:s')."')";
                    }
                    mysql_query($sql);
                    session_register('claimed');
                    $_SESSION['claimed']='claimed';
                echo '<div class="ci_claimVauBtnName">Congratulations!</div>';
				echo '<div class="ci_claimVauBtnSub">Voucher claimed!<br>Click here to print it.</div>';
//                }else{
//                    echo '<div class="ci_claimVauBtnName">Sorry!</div>';
//				echo '<div class="ci_claimVauBtnSub">But you already claimed  voucher.</div>';
//                }
            break;
            case "add_comment":
                require_once $_SERVER['DOCUMENT_ROOT'].'/class/members.86400';
                 
                $users=new members;
                $username= $users->get_user_by_id($_POST['user_id']);
   
                $sql="insert into comments(user_id, comment, date, deal_id) values ('".$_POST['user_id']."', '".mysql_real_escape_string($_POST['comment'])."', '".date('Y/m/d H:i:s')."', '".$_POST['deal']."')";
                if(!mysql_query($sql)){
                    die(mysql_error());
                }
                     echo '<div class="ci_commentItem" style="display:none" id="new">';
                     if(isset($username['avatar']) && !empty($username['avatar'])){
                        echo '<div class="ci_commentItemPhoto"><img src="/images/testpht.jpg"/></div>';
                     }
                    echo '<div class="ci_commentItemContent">';
                    echo '<div class="ci_commentItemContentHd">'.$username['username'].'<span class="ci_commentItemTime">just</span></div>';
                    echo '<div class="ci_commentItemContentTxt">'.$_POST['comment'].'</div>';
                    echo '</div>';
                    echo '</div>';
               break;
          case "join_subscribe":
              $sql="select * from subscribers where subscriber ='".$_GET['email']."'";
              $results=mysql_query($sql);
              if($results){
                if(mysql_num_rows($results)>0){
                    echo "This email already subscribed to new deals";
                }else{
                    $sql="insert into subscribers(subscriber) values ('".$_GET['email']."')";
                    mysql_query($sql);
                    echo "Thank you!";
                }
              }
          break;
          case "make_delete":
              $sql="delete from coupons where id=".$_GET['id'];
              mysql_query($sql);
              echo "<script>window.location.reload();</script>";
          break;
          case "make_active_coupon":
              $sql='select * from coupons where id='.$_GET['id'];
              $res= fetch_all($sql);
              if($res[1]['payd']==1){
                   $end_date=$res[1]['st_day']+($res[1]['day_col']*84600);
                   $time=$end_date-time();
                if($time <0){
                     echo "<script>alert('This deal has expired, you can\'t make it active');</script>";
                }else{
                    $sql="update coupons set `status`='active' where id=".$_GET['id'];
                    mysql_query($sql);
                    echo "<script>window.location.reload();</script>";
                }
              }else{
                  echo "<script>alert('To activate this deal please make a payment!');</script>";
              }
          break;
        case "make_suspend_coupon":
              $sql="update coupons set `status`='drafts' where id=".$_GET['id'];
              mysql_query($sql);
          break;
          case 'get_html_attributes':

              $attr= new attributes;
              $cat1=$_GET['cat1'];
              $cat2=$_GET['cat2'];
              //var_dump($attr);
              $attr->write_html_attributes($cat1, $cat2);
            break;
        case "add_to_cart":            
//            if (!isset($_SESSION['userid'])) echo "<script> window.location='/index.86400?page=login'; </script>";
//            else {
                $cat= new catalog;
                $item= $cat->get_record_by_id($_GET['id']);

                if(isset($_SESSION['good_count'])){

                    $_SESSION['good_count']+=1;
                    $_SESSION['total_sum']+=$item['price']; 
                    $products=  json_decode($_SESSION['products'], true);
                    $citm=count($products)+1;
                    $key=false;
                    foreach($products as $k=>$product){
                        if($product['id']==$item['id'])
                        $key=$k;

                    }
                    if(!$key){
                        $products[$citm]['id']=$item['id'];
                        $products[$citm]['count']=1;
                    }else{

                        $products[$key]['count']+=1;
                    }
                    $_SESSION['products']=  json_encode($products); 
                }else{
                    session_register('good_count');
                $_SESSION['good_count']=1; 
                    session_register('total_sum');
                $_SESSION['total_sum']=$item['price']; 
                    $products=array();
                    $products[1]['id']=$item['id'];
                    $products[1]['count']=1;
                    session_register('products');
                    $_SESSION['products']=  json_encode($products); 
                }


                echo '<img src="img/basket.png">';
                echo '<h1>Товаров: '.$_SESSION['good_count'].'</h1>';
                echo '<a href="/index.86400?page=cart">На сумму: '.$_SESSION['total_sum'].'p</a>';
                echo "<script> alert('Товар уcпешно добавлен в карзину.'); </script>";
          // }
        
        break;
        case "flush_cart":
            unset($_SESSION['products']);
            $_SESSION['good_count']=0;
            $_SESSION['total_sum']=0;;                           
        break;
        case 'change_ord_page':
                $sql="update pages set ord='".$_GET['value']."' where id=".$_GET['id'];
                mysql_query($sql);
                echo $_GET['value'];
        break;
        case 'get_url':
            $s = makeSlugs($_GET['url']);
            $sql="select * from catalog where url like '".$s."'";
            $res=mysql_query($sql);
            if(mysql_num_rows($res)>0){
            echo $s.mysql_num_rows($res);
            }else{
            echo $s;    
            }
        break;
        case 'get_goods':
            $catalog= new catalog;
            $catalog->ajax_request_for_goods($_GET['query']);
        break;
    case 'get_fullgood_by_name':
            $catalog= new catalog;
        
            $rec=$catalog->get_record_by_name($_GET['name']);
        
            echo $rec['id'];
        break;
    case 'change_option':
        $options=new options;
        if($_GET['id']=='7'){
            move_uploaded_file($_FILES['7']['tmp_name'], $_SERVER['DOCUMENT_ROOT'].'/uploads/'.time().$_FILES['7']['name']);
            $options->update_option($_GET['id'], '/uploads/'.time().$_FILES['7']['name']);
            header('location: /admin.86400?module=options');
        }else{
             if($_GET['id']=='6'){
            $options->update_option($_GET['id'], $_POST['6']);
            header('location: /admin.86400?module=options');
             }else{
                 if($_GET['id']=='9'){
                    $options->update_option($_GET['id'], $_POST['9']);
                    header('location: /admin.86400?module=options');
                 }else{
                       if($_GET['id']=='8'){
                    $options->update_option($_GET['id'], $_POST['8']);
                    header('location: /admin.86400?module=options');
                    }else{
                        $options->update_option($_GET['id'], $_GET['value']);
                    }
                 }
             }
        }
    break;
    case 'get_last_id':
        $sql="select * from coupons order by id DESC limit 1";
        $res=  fetch_all($sql);
        echo $res[1]['id'];
    break;
    case 'add_coupon':
       // var_dump($_POST['record']);
        $data=$_POST['record'];
        $pics=  json_encode($data['imgs']);
        $data['imgs']=$pics;
        IF(isset($_SESSION['userid'])){
            $merchant=$_SESSION['userid'];
        }else{
            $merchant=0;
        }
        $data['merchant']=$merchant;
         $data['status']='drafts';
         $data['url']=  makeSlugs($data['title']);
          $data['posted']=time();
        $coupons=new coupons;
        $coupons->add_record($data);
        
        echo mysql_insert_id();
    break;
        case 'edit_coupon':
       // var_dump($_POST['record']);
        $data=$_POST['record'];
            $data['url']=  makeSlugs($data['title']);
        $pics=  json_encode($data['imgs']);
        $data['imgs']=$pics;
        IF(isset($_SESSION['userid'])){
            $merchant=$_SESSION['userid'];
        }else{
            $merchant=0;
        }
        $data['merchant']=$merchant;
        $coupons=new coupons;
        $coupons->edit_record($data);
        
    break;
    case 'make_bid':
        $auction = new auction;
        $status = $auction->make_bid($_GET['auc'], $_GET['bid_price'], $_GET['comment'], $_GET['bidder']);
    echo $status;
        break;
    case 'delete':
        $cat= new catalog;
        var_dump($_SESSION);
        $products=  json_decode($_SESSION['products'], true);  
        foreach ($products as $key=>&$value) {
            if ($value['id']== $_GET['id']) {                 
                $_SESSION['good_count']= $_SESSION['good_count'] - 1;                
                $item= $cat->get_record_by_id($_GET['id']);
                $_SESSION['total_sum'] -= $item['price']*$products[$key]['count'];
                unset($products[$key]);
            }
        } 
        $_SESSION['products']=  json_encode($products); 
    break;
}

            
            // Добавляем разделитель слов '-' в URL
 
function my_str_split($string) {
$slen=strlen($string);
for($i=0; $i<$slen; $i++){
$sArray[$i]=$string{$i};}
return $sArray;}
 
// Переводим ссылку в транслирт, если она не такова.
 
function noDiacritics($string) {
$cyrylicFrom = array('А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я', 'а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я');
 
$cyrylicTo   = array('A', 'B', 'W', 'G', 'D', 'Ie', 'Io', 'Z', 'Z', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'Ch', 'C', 'Tch', 'Sh', 'Shtch', '', 'Y', '', 'E', 'Iu', 'Ia', 'a', 'b', 'w', 'g', 'd', 'ie', 'io', 'z', 'z', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'ch', 'c', 'tch', 'sh', 'shtch', '', 'y', '', 'e', 'iu', 'ia');
 
$from = array('A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', '?', 'C', 'C', 'C', 'C', 'C', 'D', 'D', '?', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', '?', 'G', 'G', 'G', 'G', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', '?', 'c', 'c', 'c', 'c', 'c', 'd', 'd', '?', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e', '?', 'g', 'g', 'g', 'g', 'H', 'H', 'I', 'I', 'I', 'I', 'I', 'I', 'I', 'I', '?', 'J', 'K', 'L', 'L', 'N', 'N', 'N', 'N', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', '?', 'h', 'h', '?', 'i', 'i', 'i', 'i', 'i', 'i', 'i', '?', 'j', 'k', 'l', 'l', 'n', 'n', 'n', 'n', 'o', 'o', 'o', 'o', 'o', 'o', 'o', 'o', '?', 'R', 'R', 'S', 'S', 'S', 'S', 'T', 'T', '?', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'W', 'Y', 'Y', 'Y', 'Z', 'Z', 'Z', 'r', 'r', 's', 's', 's', 's', '?', 't', 't', '?', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'w', 'y', 'y', 'y', 'z', 'z', 'z');
 
$to   = array('A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'AE', 'C', 'C', 'C', 'C', 'C', 'D', 'D', 'D', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'G', 'G', 'G', 'G', 'G', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'ae', 'c', 'c', 'c', 'c', 'c', 'd', 'd', 'd', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'e', 'g', 'g', 'g', 'g', 'g', 'H', 'H', 'I', 'I', 'I', 'I', 'I', 'I', 'I', 'I', 'IJ', 'J', 'K', 'L', 'L', 'N', 'N', 'N', 'N', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'CE', 'h', 'h', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'ij', 'j', 'k', 'l', 'l', 'n', 'n', 'n', 'n', 'o', 'o', 'o', 'o', 'o', 'o', 'o', 'o', 'o', 'R', 'R', 'S', 'S', 'S', 'S', 'T', 'T', 'T', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'U', 'W', 'Y', 'Y', 'Y', 'Z', 'Z', 'Z', 'r', 'r', 's', 's', 's', 's', 'B', 't', 't', 'b', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'w', 'y', 'y', 'y', 'z', 'z', 'z');
 
      $from = array_merge($from, $cyrylicFrom);
      $to   = array_merge($to, $cyrylicTo);
      $newstring = str_replace($from, $to, $string);
      return $newstring;
   }
 
// Создание ссылки. Входящие параметры текст и максимальная длина выходящего значения, если ничего не посылаем, то длинна остается исходной.
 
function makeSlugs($string, $maxlen=0){
$newStringTab=array();
$string=strtolower(noDiacritics($string));
 
if(function_exists('str_split')){
$stringTab=str_split($string);}
else{
$stringTab=my_str_split($string);}
 
$numbers=array('0','1','2','3','4','5','6','7','8','9','-');
 
foreach($stringTab as $letter){
if(in_array($letter, range('a', 'z')) || in_array($letter, $numbers)){
$newStringTab[]=$letter;}
elseif($letter==' '){
$newStringTab[]='-';}}
 
if(count($newStringTab)){
$newString=implode($newStringTab);
if($maxlen>0){
$newString=substr($newString, 0, $maxlen);}
$newString = removeDuplicates('--', '-', $newString);}
else {
$newString='';}
return rtrim($newString,'-') ;} // Удаляем лишние пробелы справа.
 
// Проверка. Является ли слугом строка.
 
function checkSlug($sSlug){
if(ereg ('^[a-zA-Z0-9]+[a-zA-Z0-9\_\-]*$', $sSlug)){
return true;}
return false;}
 
// Удаление дубликатов.
 
function removeDuplicates($sSearch, $sReplace, $sSubject){
$i=0;
do{
$sSubject=str_replace($sSearch, $sReplace, $sSubject);
$pos=strpos($sSubject, $sSearch);
$i++;
if($i>100){
die('removeDuplicates() ошибка цикла');}}
while($pos!==false);
return $sSubject;}
?>
