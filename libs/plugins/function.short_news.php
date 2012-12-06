<?php

function smarty_function_short_news($params, &$smarty)
{
  require($_SERVER['DOCUMENT_ROOT'].'/class/news.php');
  $site_news=new news;
  $news=$site_news->get_news();
  echo "<ul>";
  $i=0;
  foreach($news as $new){
      
        echo '<li>';
        echo '<div class="date">';
        echo $new['date'];
        echo '</div>';
        echo '<p>';
        echo '<a href="/index.php?page=news&newid='.$new['id'].'">';
        echo smart_cut($new['fdescr'])."...";       
        echo '</a>';
        echo '</p>';
        echo '</li>';
      $i++;
      if($i==5){break;}
  }
  echo "</ul>";
  						
}


function smart_cut($text, $words = 25, $separator = ' ')
{
    $current_pos = 0;
    for($i = 0; $i < $words; $i++)
    {
        $current_pos = strpos($text, $separator, ($current_pos + 1));
    }
    return substr($text, 0, $current_pos);
}
?>