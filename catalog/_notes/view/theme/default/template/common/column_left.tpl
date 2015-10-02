<?php if ($modules) { ?>
<column id="column-left" class="col-sm-3 hidden-xs">
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</column>
<?php } elseif($categories) { ?>
<column id="column-left" class="col-sm-3 hidden-xs">
    <div class="list-group">
        <?php foreach($categories as $category) { ?>
        <?php if($category['active']){
             $active = 'active';
             }
             else{
             $active = '';
             }
         ?>
        <a class="list-group-item <?php echo $active; ?>" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
        <?php } ?>
    </div>
</column>
<?php } else { }?>