<?php

$options= new options;
$opt=$options->get_all_options();
$smarty->assign('options', $opt);

?>
