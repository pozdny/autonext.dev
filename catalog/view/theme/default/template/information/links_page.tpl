<?php if(sizeof($name_file) != 0) { ?>
   <h3 style="margin-top: 60px;"><?php echo $name_links_down ?></h3>
   <?php foreach($name_file as $arr){ ?>
   <span class="title-link-down"><?php echo $arr['name_link']; ?></span>(<a class="download-files" href="down-files/<?php echo $arr['name_file']; ?>">скачать</a>)<br>
 <?php } ?>
<?php } ?>