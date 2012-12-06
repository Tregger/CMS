<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of catlog_functions
 *
 * @author Tregger
 */
class catalog {
    //put your code here
##############################################
    public  $catalog_items = array();
public function display_root_catalog(){
    $catalog=array();
    $i=0;
    $sql="SELECT id, name, ord FROM catalog where id_p=0 and folder=1 order by ord";
    $root=mysql_query($sql);

    while ($root_rec = mysql_fetch_array($root)) {
       $i++;
         $catalog[$i]['id']=$root_rec['id'];
         $catalog[$i]['ord']=$root_rec['ord'];
	 $catalog[$i]['name']=$root_rec['name'];
         $catalog[$i]['sub']=$this->display_sublvl_catalog($root_rec['id']);
    }

    return $catalog;
}

public function get_all_child_good($cur, $lim, $category_id, $ord='name'){
//    echo $category_id."<br>";
    $catalog=array();
    $i=0;
    $now=($cur-1)*$lim;
    if($now<0){$now=0;}
    $sql="SELECT * FROM catalog where id_p=".$category_id." order by ".$ord." ASC Limit ".$now.", ".$lim;
//    echo "<pre>";
//            var_dump($sql);
//            echo "</pre>"; 
    $root=mysql_query($sql);
    
    while ($root_rec = mysql_fetch_array($root)) {                
        
        $items["id"]=$root_rec["id"];
        $items["name"]=$root_rec["name"];
        $items["sdescr"]=$root_rec["sdescr"];
        $items["fdescr"]=$root_rec["fdescr"];	
        $items["price"]=$root_rec["price"];
        $items["img"]=$root_rec["img"]; 	
        $items["url"]=$root_rec["url"]; 	
        $items["folder"]=$root_rec["folder"]; 
        $items["ord"]=$root_rec["ord"];
        $items["date"]=$root_rec["date"];
        $items["vid"]=$root_rec["vid"];
        $items["ob"]=$root_rec["ob"];
        $items["glubina"]=$root_rec["glubina"];
        $items["shirina"]=$root_rec["shirina"];
        $items["visota"]=$root_rec["visota"];
        $items["diam_dimohod "]=$root_rec["diam_dimohod"];	
        $items["massa_pechi"]=$root_rec["massa_pechi"];	
        $items["massa_kamnei"]=$root_rec["massa_kamnei"];	
        $items["vstroenniy_bak"]=$root_rec["vstroenniy_bak"];	
        $items["vstroenniy_teploobmennik"]=$root_rec["vstroenniy_teploobmennik"];
        $items["material_topki"]=$root_rec["material_topki"];
        $items["tip_kamenki"]=$root_rec["tip_kamenki"];
        $items["tip_kozuha"]=$root_rec["tip_kozuha"]; 
        $items["promo"]=$root_rec["promo"];
        $items["hit"]=$root_rec["hit"]; 
        
            $this->catalog_items[]=array_merge($this->catalog_items, $items);
//            
//            echo "<pre>";
//            var_dump($root_rec);
//            echo "</pre>";                     
       
         $this->get_all_child_good($cur, $lim, $root_rec['id'], $ord='name');        
    }    
}


public function display_sublvl_catalog($id_p){
    $sub_catalog=array();
    $i=0;
    $j=0;
    $sql2="SELECT id, name, ord FROM catalog where id_p=".$id_p." and folder=1 order by ord";
    $sub=mysql_query($sql2);
    while ($root_rec2 = mysql_fetch_array($sub)) {
       $j++;
         $sub_catalog[$j]['id']=$root_rec2['id'];
	 $sub_catalog[$j]['name']=$root_rec2['name'];
         $sub_catalog[$j]['sub']=$this->display_sublvl_catalog($root_rec2['id']);
    }

    return $sub_catalog;
}

public function display_records_from_cat($id){
    $sql="SELECT id, name, sdescr, fdescr, price, id_p, img, ord FROM catalog where id_p=".$id." and folder=0 order by ord";
    $records=mysql_query($sql);
    $i=0;
    $recs=array();
    while($row=  mysql_fetch_array($records)){
         $i++;   
            $recs[$i]['id']=$row['id'];
            $recs[$i]['name']=$row['name'];
            $recs[$i]['url']=$row['url'];
            $recs[$i]['img']=$row['img'];
             $recs[$i]['id_p']=$row['id_p'];
              $recs[$i]['price']=$row['price'];
               $recs[$i]['ord']=$row['ord'];
    }
        return  $recs;
}

public function delete_record_by_id($id){
    $sql="Delete FROM catalog where id=".$id;
     $records=mysql_query($sql);
}



public function add_record($data){
    $name=$data['name'];
    $parent=$data['parent_category'];
    $sdescr=$data['sdesc'];
    $price=$data['price'];
    $fdescr=$data['fdesc'];
    $vid=$data['vid'];
      $ob=$data['ob'];
         /* additional attr  */   
    $glubina=$data['glubina'];
    $shirina=$data['shirina'];
    $visota=$data['visota'];
    $diam_dimohod=$data['diam_dimohod'];
    $massa_pechi=$data['massa_pechi'];
    $massa_kamnei=$data['massa_kamnei'];
    $vstroenniy_bak=$data['vstroenniy_bak'];
    $vstroenniy_teploobmennik=$data['vstroenniy_teploobmennik'];
    $material_topki=$data['material_topki'];
    $tip_kamenki=$data['tip_kamenki'];
    $tip_kozuha=$data['tip_kozuha'];
    $hit=$data['hit'];
    /* --------------- */
      $producer=$data['prod'];
    if(isset($data['actia'])){
        $promo=1;
    }else{
        $promo=0;
    }
    $url=$data['url'];
    if($data['type'] == 'cat'){
        $folder="1";
    }else{
        $folder="0";
    }
    $sql="
         INSERT INTO
         catalog(id_p, name, sdescr, fdescr, price,  url, folder, promo, prod, vid, ob, glubina, shirina, visota, diam_dimohod, massa_pechi, massa_kamnei, vstroenniy_bak, vstroenniy_teploobmennik, material_topki, tip_kamenki, tip_kozuha, hit ) 
         VALUES 
         ('".$parent."', '".$name."', '".$sdescr."', '".$fdescr."', '".$price."', '".$url."', '".$folder."', '".$promo."', '".$producer."', '".$vid."', '".$ob."',  '$glubina',  '$shirina',  '$visota',  '".$diam_dimohod."',  '".$massa_pechi."',  '".$massa_kamnei."',  '".$vstroenniy_bak."',  '".$vstroenniy_teploobmennik."',  '".$material_topki."',  '".$tip_kamenki."',  '".$tip_kozuha."', '".$hit."')";
    mysql_query($sql);
   
    if($folder == "1"){
    echo '
        <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("add_cat");
            if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
        }
        ';
    echo "parent.window.document.getElementById('".$parent."').click();";
        echo "</script>";
      
    }else{
    echo '
        <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("add_rec");
            if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
        }
        ';
   echo "parent.window.document.getElementById('".$parent."').click();";
        echo "</script>";
    }
   

 
}

public function get_record_by_id($id){
    $sql="Select * from catalog where id=".$id;
    $record=  mysql_query($sql);
    $current=  mysql_fetch_array($record);
    return $current;
}

public function get_record_by_url($url){
    $sql="Select * from catalog where url like '".$url."' limit 1";
    $record=  mysql_query($sql);
    $current=  mysql_fetch_array($record);
    return $current;
}

public function get_record_by_name($name){
    $sql="Select * from catalog where name like '".$name."' limit 1";
    $record=  mysql_query($sql);
    $current=  mysql_fetch_array($record);
    
    return $current;
}
        
public function get_name_category_by_id($id){
    $sql="Select name from catalog where id=".$id;
    $record=  mysql_query($sql);
    $current=  mysql_fetch_array($record);
    return $current['name'];
}

public function edit_record($data){
    $id=$data['id'];
    $name=$data['name'];
    $parent=$data['parent_category'];
    $sdescr=$data['sdesc'];
    $price=$data['price'];
    $fdescr=$data['fdesc'];
    $prod=$data['prod'];
    $vid=$data['vid'];
    $ob=$data['ob'];
    /* additional attr  */   
    $glubina=$data['glubina'];
    $shirina=$data['shirina'];
    $visota=$data['visota'];
    $diam_dimohod=$data['diam_dimohod'];
    $massa_pechi=$data['massa_pechi'];
    $massa_kamnei=$data['massa_kamnei'];
    $vstroenniy_bak=$data['vstroenniy_bak'];
    $vstroenniy_teploobmennik=$data['vstroenniy_teploobmennik'];
    $material_topki=$data['material_topki'];
    $tip_kamenki=$data['tip_kamenki'];
    $tip_kozuha=$data['tip_kozuha'];
     $hit=$data['hit'];
    /* --------------- */
    if($data['type'] == 'cat'){
        $folder="1";
    }else{
        $folder="0";
    }
    $url=$data['url'];
    
    $sql="
        UPDATE catalog SET name='".$name."', id_p='".$parent."', sdescr='".$sdescr."', fdescr='".$fdescr."', price='".$price."', url='".$url."', folder='".$folder."', prod='".$prod."', vid='".$vid."', ob='".$ob."', glubina='".$glubina."', shirina='".$shirina."', visota='".$visota."', diam_dimohod='".$diam_dimohod."', massa_pechi='".$massa_kamnei."', massa_kamnei='".$massa_kamnei."', vstroenniy_bak='".$vstroenniy_bak."', vstroenniy_teploobmennik='".$vstroenniy_teploobmennik."', material_topki='".$material_topki."', tip_kamenki='".$tip_kamenki."', tip_kozuha='".$tip_kozuha."', hit='".$hit."' where id=".$id;
    
    mysql_query($sql);
    
       
    echo '
        <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("edit_rec_'.$id.'");
            if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
        }      ';
     echo "parent.window.document.getElementById('".$parent."').click();";
        echo ' </script>';
      
    
    
}

public function save_image($data){
    $id=$data['id'];
    $img_url=$data['img'];
    $sql="UPDATE catalog set img='".$img_url."' where id=".$id;
    
    mysql_query($sql);

        echo '
        <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("edit_img_'.$id.'");
            if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
        }      
         </script>
      ';
}

public function delete_image($data){
    
        $id=$data['id'];
   
    $sql="UPDATE catalog set img='' where id=".$id;
        mysql_query($sql);

        echo '
        <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("edit_img_'.$id.'");
            if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
        }      
         </script>
      ';
}

public function change_item_ord($id, $ord){
    
    $sql="UPDATE catalog SET ord=".$ord." where id=".$id;
    mysql_query($sql);
    
}

public function get_home(){
    $items=array();
    $sql="SELECT * from catalog where folder=0 order by id DESC limit 4";
    $items_q=mysql_query($sql);
    $k=0;
    while ($v = mysql_fetch_array($items_q)) {
        $k++;
        $items[$k]["id"]=$v["id"];
        $items[$k]["name"]=$v["name"];
        $items[$k]["sdescr"]=$v["sdescr"];
        $items[$k]["fdescr"]=$v["fdescr"];	
        $items[$k]["price"]=$v["price"];
        $items[$k]["img"]=$v["img"]; 	
        $items[$k]["url"]=$v["url"]; 	
        $items[$k]["folder"]=$v["folder"]; 
        $items[$k]["ord"]=$v["ord"];
        $items[$k]["vid"]=$v["vid"];
        $items[$k]["ob"]=$v["ob"];
        $items[$k]["glubina"]=$v["glubina"];
        $items[$k]["shirina"]=$v["shirina"];
        $items[$k]["visota"]=$v["visota"];
        $items[$k]["diam_dimohod "]=$v["diam_dimohod"];	
        $items[$k]["massa_pechi"]=$v["massa_pechi"];	
        $items[$k]["massa_kamnei"]=$v["massa_kamnei"];	
        $items[$k]["vstroenniy_bak"]=$v["vstroenniy_bak"];	
        $items[$k]["vstroenniy_teploobmennik"]=$v["vstroenniy_teploobmennik"];
        $items[$k]["material_topki"]=$v["material_topki"];
        $items[$k]["tip_kamenki"]=$v["tip_kamenki"];
        $items[$k]["tip_kozuha"]=$v["tip_kozuha"];
    }
    return $items;
}

public function get_items_from_root($cur, $lim, $ord='name'){
    $items=array();
    $lprice="";
    $rprice="";
    if(isset($_GET['lprice'])){$lprice=$_GET['lprice'];};
    if(isset($_GET['rprice'])){$rprice=$_GET['rprice'];};
    if($lprice!=""){$lwhere="and price >=".$lprice;}else{$lwhere="";};
    if($rprice!=""){$rwhere=" and price <=".$rprice;}else{$rwhere="";};
    if(isset($cur) && isset($lim)){
         if($cur!=0){
        $sql="SELECT * from catalog where folder=0 ".$lwhere.$rwhere." order by ".$ord." ASC Limit ".($cur-1)*$lim.", ".$lim;
         }else{
             $sql="SELECT * from catalog where folder=0 ".$lwhere.$rwhere." order by ".$ord." ASC Limit ".($cur)*$lim.", ".$lim;
         }
    }else{
        $sql="SELECT * from catalog where folder=0 ".$lwhere.$rwhere." order by ".$ord." ASC ";
    }
    $items_q=mysql_query($sql);
    $k=0;
    while ($v = mysql_fetch_array($items_q)) {
        $k++;
         $items[$k]["id"]=$v["id"];
        $items[$k]["name"]=$v["name"];
        $items[$k]["sdescr"]=$v["sdescr"];
        $items[$k]["fdescr"]=$v["fdescr"];	
        $items[$k]["price"]=$v["price"];
        $items[$k]["img"]=$v["img"]; 	
        $items[$k]["url"]=$v["url"]; 	
        $items[$k]["folder"]=$v["folder"]; 
        $items[$k]["ord"]=$v["ord"];
              $items[$k]["vid"]=$v["vid"];
        $items[$k]["ob"]=$v["ob"];
        $items[$k]["glubina"]=$v["glubina"];
        $items[$k]["shirina"]=$v["shirina"];
        $items[$k]["visota"]=$v["visota"];
        $items[$k]["diam_dimohod "]=$v["diam_dimohod"];	
        $items[$k]["massa_pechi"]=$v["massa_pechi"];	
        $items[$k]["massa_kamnei"]=$v["massa_kamnei"];	
        $items[$k]["vstroenniy_bak"]=$v["vstroenniy_bak"];	
        $items[$k]["vstroenniy_teploobmennik"]=$v["vstroenniy_teploobmennik"];
        $items[$k]["material_topki"]=$v["material_topki"];
        $items[$k]["tip_kamenki"]=$v["tip_kamenki"];
        $items[$k]["tip_kozuha"]=$v["tip_kozuha"];
        $items[$k]["promo"]=$v["promo"];
        $items[$k]["hit"]=$v["hit"];
    }
    return $items;
}



public function get_items_from_cat($cur, $lim, $cat, $ord='name'){
    $items=array();
    $lprice="";
    $rprice="";
    if(isset($_GET['lprice'])){$lprice=$_GET['lprice'];};
    if(isset($_GET['rprice'])){$rprice=$_GET['rprice'];};
    if($lprice!=""){$lwhere="and price >=".$lprice;}else{$lwhere="";};
    if($rprice!=""){$rwhere=" and price <=".$rprice;}else{$rwhere="";};
    if(isset($cur) && isset($lim)){
         if($cur!=0){
        $sql="SELECT * from catalog where id_p=$cat ".$lwhere.$rwhere." order by ".$ord." ASC Limit ".($cur-1)*$lim.", ".$lim;
         }else{
             $sql="SELECT * from catalog where id_p=$cat ".$lwhere.$rwhere." order by ".$ord." ASC Limit ".($cur)*$lim.", ".$lim;
         }
    }else{
        $sql="SELECT * from catalog where id_p=$cat ".$lwhere.$rwhere." order by ".$ord." ASC ";
    }
    $items_q=mysql_query($sql);
    $k=0;
    while ($v = mysql_fetch_array($items_q)) {
        $k++;
        $items[$k]["id"]=$v["id"];
        
        $items[$k]["name"]=$v["name"];
        $items[$k]["sdescr"]=$v["sdescr"];
        $items[$k]["fdescr"]=$v["fdescr"];	
        $items[$k]["price"]=$v["price"];
        $items[$k]["img"]=$v["img"]; 	
        $items[$k]["url"]=$v["url"]; 	
        $items[$k]["folder"]=$v["folder"]; 
        $items[$k]["ord"]=$v["ord"];
        $items[$k]["date"]=$v["date"];
              $items[$k]["vid"]=$v["vid"];
        $items[$k]["ob"]=$v["ob"];
        $items[$k]["glubina"]=$v["glubina"];
        $items[$k]["shirina"]=$v["shirina"];
        $items[$k]["visota"]=$v["visota"];
        $items[$k]["diam_dimohod "]=$v["diam_dimohod"];	
        $items[$k]["massa_pechi"]=$v["massa_pechi"];	
        $items[$k]["massa_kamnei"]=$v["massa_kamnei"];	
        $items[$k]["vstroenniy_bak"]=$v["vstroenniy_bak"];	
        $items[$k]["vstroenniy_teploobmennik"]=$v["vstroenniy_teploobmennik"];
        $items[$k]["material_topki"]=$v["material_topki"];
        $items[$k]["tip_kamenki"]=$v["tip_kamenki"];
        $items[$k]["tip_kozuha"]=$v["tip_kozuha"];
        $items[$k]["hit"]=$v["hit"];
    }
    return $items;
}

public function get_parent_category($cat_id_p){
    $sql="select * from catalog where id=$cat_id_p";
    $parent_cat=  mysql_query($sql);
    $items=array();
    while($v= mysql_fetch_array($parent_cat)){
      
        $items["id"]=$v["id"];
        $items["name"]=$v["name"];
        $items["sdescr"]=$v["sdescr"];
        $items["fdescr"]=$v["fdescr"];	
        $items["price"]=$v["price"];
        $items["img"]=$v["img"]; 	
        $items["url"]=$v["url"]; 	
        $items["folder"]=$v["folder"]; 
        $items["ord"]=$v["ord"];
        $items["id_p"]=$v["id_p"];
    }
    return $items;
}



public function get_category_tree(){
    $sql="select * from catalog where id_p=0 and folder=1";
    $sql_q=  mysql_query($sql);
    $mas=array();
    $k=0;
    
    while ($row = mysql_fetch_array($sql_q)){
        $k++;
        $mas[$k]['id']=$row['id'];
        $mas[$k]['name']=$row['name'];
        $sql2="select * from catalog where folder=1 and id_p=".$row['id'];
        $sql2_q=  mysql_query($sql2);
        $sql3="select * from attributes where id_cat=".$row['id'];
             $q=  mysql_query($sql3);
             if(mysql_num_rows($q)>0){
                  $mas[$k]['attr']="Yes(".mysql_num_rows($q).")";
             }else{
                  $mas[$k]['attr']="No";
             }
        $j=0;
        $mas2=array();
        while ($row2 = mysql_fetch_array($sql2_q)){
            $j++;
            $mas2[$j]['id']=$row2['id'];
            $mas2[$j]['name']=$row2['name'];
             $sql3="select * from attributes where id_cat=".$row2['id'];
             $q=  mysql_query($sql3);
             if(mysql_num_rows($q)>0){
                  $mas2[$j]['attr']="Yes(".mysql_num_rows($q).")";
             }else{
                  $mas2[$j]['attr']="No";
             }
            
        }
        $mas[$k]['inner']=  $mas2;
    }

    return $mas;
}

public function display_root_attr(){
    $lvl=1;
    $catalog=array();
    $i=0;
    $sql="SELECT id, name, ord FROM catalog where id_p=0 and folder=1 order by ord";
    $root=mysql_query($sql);

    while ($root_rec = mysql_fetch_array($root)) {
       $i++;
         $catalog[$i]['id']=$root_rec['id'];
	 $catalog[$i]['name']=$root_rec['name'];
         $sql3="select * from attributes where id_cat=".$root_rec['id'];
         $q=  mysql_query($sql3);
         if(mysql_num_rows($q)>0){
           $catalog[$i]['attr']="(".mysql_num_rows($q).")";
         }else{
           $catalog[$i]['attr']="";
         } 
         $catalog[$i]['lvl']='1';
         $catalog[$i]['inner']=$this->display_sublvl_attr($root_rec['id'], 1);
    }

    return $catalog;
}

public function get_most_sale(){
    $sql="select * from catalog where folder=0 order by sale_count DESC limit 4";
    $most_sale_product=fetch_all($sql);
    return $most_sale_product;
    
}

public function get_promo_products(){
    $sql="select * from catalog where folder=0 and promo=1 order by sale_count DESC limit 4";
    $most_sale_product=fetch_all($sql);
    return $most_sale_product;
    
}


public function display_sublvl_attr($id_p, $lvl){
    $lvl++;
    $sub_catalog=array();
    $i=0;
    $j=0;
    $sql2="SELECT id, name, ord FROM catalog where id_p=".$id_p." and folder=1 order by ord";
    $sub=mysql_query($sql2);
    while ($root_rec2 = mysql_fetch_array($sub)) {
       $j++;
         $sub_catalog[$j]['id']=$root_rec2['id'];
	 $sub_catalog[$j]['name']=$root_rec2['name'];
         $sub_catalog[$j]['lvl']=$lvl;
         $sql3="select * from attributes where id_cat=".$root_rec2['id'];
         $q=  mysql_query($sql3);
         if(mysql_num_rows($q)>0){
           $sub_catalog[$j]['attr']="(".mysql_num_rows($q).")";
         }else{
           $sub_catalog[$j]['attr']="";
         } 
         $sub_catalog[$j]['inner']=$this->display_sublvl_attr($root_rec2['id'], $lvl);
    }

    return $sub_catalog;
}

public function frontend_add_good($data){

     $name=$data['name'];
     if(isset($data['cat2'])){
    $parent=$data['cat2'];
     }else{
           $parent=$data['cat1'];
     }
    $sdescr=$data['sdesc'];
    $price=$data['price'];
    $fdescr=$data['fdesc'];
    $url=$data['url'];
    if($data['type'] == 'cat'){
        $folder="1";
    }else{
        $folder="0";
    }
     $error = "";
$msg = "";
$fileElementName = 'userfile';
$upload_dir=$_SERVER['DOCUMENT_ROOT']."/upload";

$i = 0;
$files_count = sizeof($_FILES[$fileElementName]["name"]);

for ($i = 0; $i < $files_count-1; $i++) {	
	if(!empty($_FILES[$fileElementName]['error'][$i]))
	{
		switch($_FILES[$fileElementName]['error'][$i])
		{

			case '1':
				$error = 'You iage too big ';
				break;
			case '2':
				$error = 'max file size is MAX_FILE_SIZE . ';
				break;
			case '3':
				$error = 'Upload only part file';
				break;
			case '4':
				$error = 'Filed upload (Incorret file path). ';
				break;
			case '6':
				$error = 'Incorrect temp dirrectory';
				break;
			case '7':
				$error = 'Error: can\'t write file into hardisk' ;
				break;
			case '8':
				$error = 'Upload file has been aborted';
				break;
			case '999':
			default:
				$error = 'No error code avaiable';
		}
	}elseif(empty($_FILES[$fileElementName]['tmp_name'][$i]) || $_FILES[$fileElementName]['tmp_name'][$i] == 'none')
	{
		$error = 'No file was uploaded..';
	}else 
	{
			if (file_exists($upload_dir."/" . $_FILES[$fileElementName]['name'][$i])){
      			$error =$_FILES[$fileElementName]['name'][$i] . " this file was allready uploaded. Please change file name.";
      		}
    		else{
    			$msg .= " File Name: " . $_FILES[$fileElementName]['name'][$i] . "<br/>";
    			//$msg .= " File Temp Name: " . $_FILES['fileToUpload']['tmp_name'] . "<br/>";
    			$msg .= " File Type: " . $_FILES[$fileElementName]['type'][$i] . "<br/>";
				$msg .= " File Size: " . (@filesize($_FILES[$fileElementName]['tmp_name'][$i])/ 1024)."Kb";
				move_uploaded_file($_FILES[$fileElementName]['tmp_name'][$i], $upload_dir."/" . $_FILES[$fileElementName]['name'][$i]);
                                $mas[$i]="/upload/" .$_FILES[$fileElementName]['name'][$i];
			}
			//for security reason, we force to remove all uploaded file
                        
			@unlink($_FILES[$fileElementName][$i]);		
	}		                      
	echo "{";
	echo				"error: '" . $error . "',\n";
	echo				"msg: '" . $msg . "'\n";
	echo "}";
}
//----------------------------------------------------------
                $files_arr=  json_encode($mas);
              
    $sql="
         INSERT INTO
         catalog(id_p, name, sdescr, fdescr, price,  url, folder, img ) 
         VALUES 
         ('".$parent."', '".$name."', '".$sdescr."', '".$fdescr."', '".$price."', '".$url."', '".$folder."', '".$files_arr."')";
    mysql_query($sql);
       $sql2="select id from catalog order by id DESC limit 1";
       $sql_q=  mysql_query($sql2);
       $res=  mysql_fetch_array($sql_q);
    if(isset($data['attrs'])){
        foreach($data['attrs'] as $k=>$v){
                $sql="
                    INSERT INTO
                      product_attributes(product_id, attr_id, val) 
                    VALUES 
                      ('".$res['id']."', '".$k."', '".$v."')";
                mysql_query($sql);
        }
    }
    
    header("Location: /index.php?page=mynorshin");
}
public  function ajax_request_for_goods($query){
    $sql="select name from catalog where folder=0 and name like '%".$query."%' limit 20";
    $mas=  fetch_all($sql);
    $json="{query:'$query', suggestions:[";
    $elements='';
    foreach($mas as $element){
        $elements.="'".$element['name']."', ";
    }
    $elements=  substr($elements,0,-2);
    $json.=$elements.']}';
    echo $json;
//    echo '<pre>';
//    var_dump($json);
//    echo '</pre>';
   // return json_encode($mas);
    
}

public function get_products_by_producser($cur, $lim, $prod, $ord='name'){
  
       if(isset($cur) && isset($lim)){
         if($cur!=0){
        $sql="SELECT * from catalog where folder=0 and prod='".$prod."' order by ".$ord." ASC Limit ".($cur-1)*$lim.", ".$lim;
         }else{
             $sql="SELECT * from catalog where folder=0 and prod='".$prod."' order by ".$ord." ASC Limit ".($cur)*$lim.", ".$lim;
         }
    }else{
        $sql="SELECT * from catalog where folder=0 and prod='".$prod."' order by ".$ord." ASC ";
    }
    
    $items=fetch_all($sql);
    return $items;
}

}

?>
