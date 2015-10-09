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
        <?php
              if($category['active']){
                 $active = 'active';
              }
              else{
                 $active = '';
              }
              if($category['category_id']){
                 $datakey = 'data-key="'.$category['category_id'].'"';
              }
              else{
                 $datakey = '';
              }
             ?>
        <a class="list-group-item <?php echo $active; ?> <?php echo $getSectionsList; ?>" href="<?php echo $category['href']; ?>" <?php echo $datakey; ?>><?php echo $category['name']; ?></a>
        <?php if ($category['children']) { ?>
        <?php foreach ($category['children'] as $child) { ?>
        <?php if ($child['category_id'] == $child_id_sub) { ?>
        <a href="<?php echo $child['href']; ?>" class="list-group-item active_sub">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
        <?php } else { ?>
        <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <?php } ?>
    </div>
</column>
<?php } else { }?>