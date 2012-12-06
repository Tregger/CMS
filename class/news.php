<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of news
 *
 * @author Tregger
 */
class news {
    //put your code here
    public function get_news(){
        $sql="Select * from news order by ord";
        $news=mysql_query($sql); 
        if(!$news){
            
            die();
          echo  mysql_error();
        }
        $res=array();
        $i=0;
        while($page = mysql_fetch_array($news)){
            $i++;
            $res[$i]['id']=$page['id'];
            $res[$i]['name']=$page['name'];
            $res[$i]['sdescr']=$this->smart_cut($page['fdescr']);	
            $res[$i]['fdescr']=$page['fdescr']; 	
            $res[$i]['date']=$page['date']; 
            $res[$i]['url']=$page['url']; 	
            $res[$i]['ord']=$page['ord'];
        }
        return $res;
        
    }
    
    
function smart_cut($text, $words = 27, $separator = ' ')
{
    $current_pos = 0;
    for($i = 0; $i < $words; $i++)
    {
        $current_pos = strpos($text, $separator, ($current_pos + 1));
    }
    return substr($text, 0, $current_pos);
}
    public function delete_record_by_id($id){
         $sql="Delete FROM news where id=".$id;
         $records=mysql_query($sql);
    }
    
public function add_page($data){
    $name=$data['name'];
    $fdescr=$data['fdescr'];
    $url=$data['url'];
    $date=$data['date'];
 
    $meta=$data['meta'];
    $description=$data['description'];
    $sql="
         INSERT INTO
         news(name, fdescr, url, ord, date, meta, description ) 
         VALUES 
         ('".$name."', '".$fdescr."', '".$url."', '1', '".$date."', '".$meta."', '".$description."')";
 
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
    
    public function get_page_by_id($id){
        $sql="Select * from news where id=".$id." order by ord";
        $news=mysql_query($sql); 
        if(!$news){
            
            die();
          echo  mysql_error();
        }
        $res=array();
       
        while($page = mysql_fetch_array($news)){
            
            $res['id']=$page['id'];
            $res['name']=$page['name'];
            $res['sdescr']=$page['sdescr']; 	
            $res['fdescr']=$page['fdescr']; 	
            $res['date']=$page['date']; 
            $res['url']=$page['url']; 	
            $res['ord']=$page['ord'];
            $res['meta']=$page['meta'];
            $res['description']=$page['description'];
        }
        return $res;
    }
    
        public function get_page_by_url($url){
        $sql="Select * from news where url like '".$url."' order by ord";
        $news=mysql_query($sql); 
        if(!$news){
            
            die();
          echo  mysql_error();
        }
        $res=array();
       
        while($page = mysql_fetch_array($news)){
            
            $res['id']=$page['id'];
            $res['name']=$page['name'];
            $res['sdescr']=$page['sdescr']; 	
            $res['fdescr']=$page['fdescr']; 	
            $res['date']=$page['date']; 
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
   
            $date=$data['date'];
 
        $meta=$data['meta'];
        $description=$data['description'];
    
    $sql="
        UPDATE
            news
        SET
        name='".$name."', fdescr='".$fdescr."', url='".$url."', date='".$date."', meta='".$meta."', description='".$description."' where id=".$data['id'];

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
}

?>
