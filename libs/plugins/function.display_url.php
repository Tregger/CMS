<?php

function smarty_function_display_url($params, &$smarty)
{

  echo makeSlugs($params['val']);
}


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