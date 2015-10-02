<?php echo $header; ?>
<style>
    .active-pro-compr{
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
        <div id="content" class="<?php echo $class; ?>">
            <?php echo $compressor_article; ?>
            <img src="image/iz-1.jpg" alt="img" class="im-compr">
            <img src="image/iz-2.jpg" alt="img" class="im-compr">
            <?php echo $content_top; ?>
            <?php echo $name_file;?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>