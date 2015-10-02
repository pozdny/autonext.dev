<?php foreach ($modules as $module) { ?>
<?php echo $module; ?>
<?php } ?>
<?php if($name_files) { ?>
<?php if($prezentaciya){ ?>
<h3 style="margin-top: 60px;"><?php echo $title_links_down_prezent; ?></h3>
<?php foreach($name_files as $arr){ ?>
<span class="title-link-down"><?php echo $arr['link']; ?></span>(<a class="download-files" href="down-files/<?php echo $arr['name']; ?>">скачать</a>)<br>
<?php } ?>
<?php } else{ ?>

<?php } ?>

<?php } ?>
