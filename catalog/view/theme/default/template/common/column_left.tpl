<?php if ($modules) { ?>
<column id="column-left" class="col-sm-3 hidden-xs">
<<<<<<< HEAD
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
=======
    <?php foreach ($modules as $module) { ?>
    <?php echo $module; ?>
    <?php } ?>
>>>>>>> 5503fd6a8d21a27b8f4d7092f48940e272a1d080
</column>
<?php } elseif($categories) { ?>
<column id="column-left" class="col-sm-3 hidden-xs">
    <div class="list-group">
        <?php foreach($categories as $category) { ?>
<<<<<<< HEAD
<<<<<<< HEAD
            <?php if($category['active']){
=======
        <?php if($category['active']){
>>>>>>> 5503fd6a8d21a27b8f4d7092f48940e272a1d080
=======
        <?php
              if($category['active']){
>>>>>>> 8fe03dce0a414ec0b622cde2d37f4a5a881a2319
                 $active = 'active';
              }
              else{
                 $active = '';
<<<<<<< HEAD
                 }
<<<<<<< HEAD
                 if($category['id']){
                    $datakey = 'data-key="'.$category['id'].'"';
=======
                 if($category['category_id']){
                    $datakey = 'data-key="'.$category['category_id'].'"';
>>>>>>> 5503fd6a8d21a27b8f4d7092f48940e272a1d080
                 }
                 else{
                    $datakey = '';
                 }
             ?>
<<<<<<< HEAD
            <a class="list-group-item <?php echo $active; ?>" href="<?php echo $category['href']; ?>" <?php echo $datakey; ?>><?php echo $category['name']; ?></a>
                <?php if ($category['children']) { ?>
                    <?php foreach ($category['children'] as $child) { ?>
                        <?php if ($child['category_id'] == $child_id_sub) { ?>
                        <a href="<?php echo $child['href']; ?>" class="list-group-item active_sub">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
                        <?php } ?>
                    <?php } ?>
                <?php } ?>
=======
        <a class="list-group-item <?php echo $active; ?>" href="<?php echo $category['href']; ?>" <?php echo $datakey; ?>><?php echo $category['name']; ?></a>
=======
              }
              if($category['category_id']){
                 $datakey = 'data-key="'.$category['category_id'].'"';
              }
              else{
                 $datakey = '';
              }
             ?>
        <a class="list-group-item <?php echo $active; ?> <?php echo $getSectionsList; ?>" href="<?php echo $category['href']; ?>" <?php echo $datakey; ?>><?php echo $category['name']; ?></a>
>>>>>>> 8fe03dce0a414ec0b622cde2d37f4a5a881a2319
        <?php if ($category['children']) { ?>
        <?php foreach ($category['children'] as $child) { ?>
        <?php if ($child['category_id'] == $child_id_sub) { ?>
        <a href="<?php echo $child['href']; ?>" class="list-group-item active_sub">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
        <?php } else { ?>
        <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
        <?php } ?>
        <?php } ?>
        <?php } ?>
>>>>>>> 5503fd6a8d21a27b8f4d7092f48940e272a1d080
        <?php } ?>
    </div>
</column>
<?php } else { }?>