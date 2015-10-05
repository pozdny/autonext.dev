<?php  if(sizeof($name_file) != 0) { ?>
<h3 style="margin-top: 60px;"><?php echo $name_links_down ?></h3>
<?php foreach($name_file as $arr){  ?>
<a class="download-files" href="down-files/<?php echo $arr; ?>"><?php echo $arr; ?></a><br>
<?php } ?>
<?php } ?>