<?php echo $header; ?>
<style>
.active-pro-home{
    background: linear-gradient(to top, #871819, #b51e1e) !important;
}
</style>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div class="left-icon col-sm-3 col-xs-12">
        <img class="proizvod-logo" src="image/12.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/13.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/14.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/15.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/16.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/17.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/18.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/19.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/20.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/21.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/22.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/24.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/25.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/26.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/27.png" alt="icon-logo">
        <img class="proizvod-logo" src="image/28.png" alt="icon-logo">
    </div>
    <div id="content" style="float: right;" class="col-sm-9">

    <?php echo $content_top; ?>
        <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>