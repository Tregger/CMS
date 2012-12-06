<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of pages
 *
 * @author Tregger
 */
class attributes {
    //put your code here
    public function get_pages(){
        $sql="Select * from pages order by ord";
        $pages=mysql_query($sql); 
        if(!$pages){
            
            die();
          echo  mysql_error();
        }
        $res=array();
        $i=0;
        while($page = mysql_fetch_array($pages)){
            $i++;
            $res[$i]['id']=$page['id'];
            $res[$i]['name']=$page['name'];
            $res[$i]['sdescr']=$page['sdescr']; 	
            $res[$i]['fdescr']=$page['fdescr']; 	
            $res[$i]['type']=$page['type']; 
            $res[$i]['url']=$page['url']; 	
            $res[$i]['ord']=$page['ord'];
        }
        return $res;
        
    }
    
    public function delete_record_by_id($id){
         $sql="Delete FROM attributes where id=".$id;
         $records=mysql_query($sql);
             echo '
        <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("edt_page_'.$data['id'].'");
            if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
        }      
        parent.window.location.reload();
         </script>
      ';
    }
    
public function add_page($data){
    $name=$data['name'];
    $fdescr=$data['fdescr'];
    $url=$data['url'];
    $type=$data['type'];
    $meta=$data['meta'];
    $description=$data['description'];
    $sql="
         INSERT INTO
         pages(name, fdescr, url, ord, type, meta, description ) 
         VALUES 
         ('".$name."', '".$fdescr."', '".$url."', '1', '".$type."', '".$meta."', '".$description."')";
 
     mysql_query($sql);
   
   
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
      ';
    
    }
    
    public function get_attributes_by_product($id){
        $sql="Select * from product_attributes where product_id=".$id;
        $attrs=  mysql_query($sql);
        $mas_attr=array();
        $i=0;
        while($row = mysql_fetch_array($attrs)){
            $i++;
            $mas_attr[$i]['name']=$this->get_attribute_name($row['attr_id']);
            $mas_attr[$i]['val']=$row['val'];
        }
        return $mas_attr;
    }
    
    
    public function get_attribute_name($id){

        $sql="Select name from attributes where id=".$id." limit 1";
        $resq=  mysql_query($sql);
        $attr_name=mysql_fetch_array($resq);

        return $attr_name['name'];
    }
    
        public function get_page_by_url($url){
        $sql="Select * from pages where url like '".$url."' order by ord";
        $pages=mysql_query($sql); 
        if(!$pages){
            
            die();
          echo  mysql_error();
        }
        $res=array();
       
        while($page = mysql_fetch_array($pages)){
            
            $res['id']=$page['id'];
            $res['name']=$page['name'];
            $res['sdescr']=$page['sdescr']; 	
            $res['fdescr']=$page['fdescr']; 	
            $res['type']=$page['type']; 
            $res['url']=$page['url']; 	
            $res['ord']=$page['ord'];
            $res['meta']=$page['meta'];
            $res['description']=$page['description'];
        }
        return $res;
    }
    
    public function edit_page($data){
        $name=$data['name'];
        $fdescr=$data['fdescr'];
        $url=$data['url'];
        $type=$data['type'];
        $meta=$data['meta'];
        $description=$data['description'];
    
    $sql="
        UPDATE
            pages
        SET
        name='".$name."', fdescr='".$fdescr."', url='".$url."', type='".$type."', meta='".$meta."', description='".$description."' where id=".$data['id'];

   if(!mysql_query($sql))die(mysql_error());
    
       
    echo '
        <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("edt_page_'.$data['id'].'");
            if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
        }      
        parent.window.location.reload();
         </script>
      ';
    
    
}

public function get_attr_for_cat($id){
    $sql="select * from attributes where id_cat=".$id;
    $res_q=mysql_query($sql);
    $atrs=array();
    $i=0;
    while($row= mysql_fetch_array($res_q)){
        $i++;
         $atrs[$i]['id']=$row['id'];
        $atrs[$i]['name']=$row['name'];
        $atrs[$i]['values']=$row['values'];
        $atrs[$i]['type']=$row['type'];
    }
    return $atrs;
}

public function save_attr($data){
    $count=count($data);
    $count = ($count-1)/3;
    for($i=1; $i<=$count; $i++){
        $value='values'.$i;
        $name='name'.$i;
        $type='type'.$i;
        $sql="insert into attributes(id_cat, name, `values`, type) values (".$data['id'].", '".$data[$name]."', '".$data[$value]."', '".$data[$type]."' )";
        if(!mysql_query($sql)){die(mysql_error());};
        
    }
        echo '
        <script>
        if (parent.window.hs) {
            var exp = parent.window.hs.getExpander("edt_page_'.$data['id'].'");
            if (exp) {
            setTimeout(function() {
            exp.close();
            }, 1000);
            }
        }      
        parent.window.location.reload();
         </script>
      ';
}
    public function write_html_attributes($cat1, $cat2){
      //  echo "2";
        $html='';
         
        if(isset($cat2)&& $cat2 != 'undefined'){
            $sql="select * from attributes where id_cat=".$cat2;
        }else{
            if(isset($cat1) && $cat1 != 'undefined'){
                $sql="select * from attributes where id_cat=".$cat1;
            }else{
               $html.= "We dont't have attributes for this categories";
                exit();
            }
        }
       
        if($res_q=  mysql_query($sql)){
            
        }else{
            die(mysql_errno());
                    
            }
            if(mysql_num_rows($res_q)>0){
$html.="<br><br><ul>";           
        while($row = mysql_fetch_array($res_q)){

            switch ($row['type']){
                case "select":
                    $html.="<li>";
                    $values= explode(';', $row['values']);
                     $html.="<h2>".$row['name'].":</h2><br>";
                    $html.= "<select style='padding:5px;' name='record[attrs][".$row['id']."]'>";
                    foreach ($values as $value){
                       $html.= "<option value='".$value."'>".$value."</option> ";
                    }
                    $html.= "</select><br><br>";
                    $html.="</li>";
                break;
                case "input":
                    $html.="<li>";
                    $values= explode(';', $row['values']);
                     $html.="<h2>".$row['name'].":</h2><br>";
                    $html.= "<input type='text' style='padding:5px;' name='record[attrs][".$row['id']."]'><br><br>";
                    $html.="</li>";

                break;
                case "input":
                    $html.="<li>";
                    $values= explode(';', $row['values']);
                     $html.="<h2>".$row['name'].":</h2><br>";
                    $html.= "<textarea type='text' style='padding:5px;' name='record[attrs][".$row['id']."]'></textarea><br><br>";

                    $html.="</li>";
                break;
                 case "radio":
                     $html.="<li>";
                    $values= explode(';', $row['values']);
                     $html.="<h2>".$row['name'].":</h2><br>";
 
                    foreach ($values as $value){
                       $html.= "<input type='radio' style='padding:5px;' name='record[attrs][".$row['id']."]' value='".$value."'>".$value."</option><br>";
                    }
                    $html.="</li>";

                break;

            }
            
         }
         $html.="</ul>";
            }else{
                $html="We dont't have attributes for this categories";
            }
         //var_dump($html);
       echo $html;
    }

}




?>
