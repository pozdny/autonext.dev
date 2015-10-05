<?php echo $header; ?>
<style>
    .active-pro-equ{
        background: linear-gradient(to top, #871819, #b51e1e) !important;
    }
</style>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content"  class="col-sm-9" class="<?php echo $class; ?>">
            <?php echo $form_equipment; ?>
            <div style="clear:both;"></div>
            <p class="title-modul-page">Мы рекомендуем</p>
            <?php echo $content_top; ?>
            <?php echo $equipment_article; ?>
            <?php echo $name_file;?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>