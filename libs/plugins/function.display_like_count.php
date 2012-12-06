<?php

function smarty_function_display_like_count($params, &$smarty)
{
    if(isset($params["url"]) && !empty($params["url"])){
     $url =  urlencode ('http://'.$_SERVER['SERVER_NAME'].$params["url"]);
     
    }else{
         $url =  htmlspecialchars('http://www.facebook.com/dealhoster');
    }
  // $url= str_replace ( "&", "amp;", $url );
   
   // the url to check how many likes

// build the facebook query
$fburl = "http://api.facebook.com/method/fql.query?query=select%20like_count%20from%20link_stat%20where%20url='$url'&format=atom";
// grab the atom dump via facebook api url call above
$ch = curl_init($fburl); // url for page
curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
$atom_data = curl_exec($ch);
// it returns something like this:
/* <fql_query_response xmlns="http://api.facebook.com/1.0/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" list="true">
  <link_stat>
  <like_count>9</like_count>
  </link_stat>
</fql_query_response> */
// grab the like count out, i hate dom parsing, so just use regex:
 
preg_match('#like_count>(\d+)<#',$atom_data,$matches);
$like_count = $matches[1];
if(isset($like_count)){
  // echo $like_count;
}else{
   // echo "0";
}
 
 
// OPTION 2 >>> keeping it to a 1 liner:
$data = json_decode(file_get_contents("http://api.facebook.com/method/fql.query?query=select%20like_count%20from%20link_stat%20where%20url='$url'&format=json"));

if(isset($data[0])){
   echo $data[0]->like_count;
}else{
    echo "0";
}
}




?>