<div id="slideshow<?php echo $module; ?>" class="owl-carousel hidden-xs" style="opacity: 1;">
    <?php foreach ($banners as $banner) { ?>
    <div class="item">
        <?php if ($banner['link']) { ?>
        <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
        <?php } else { ?>
        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
        <?php } ?>
        <div class="content"><h1><?php echo $banner['title']; ?></h1></div>
    </div>
    <?php } ?>
</div>
<script type="text/javascript"><!--
    $('#slideshow<?php echo $module; ?>').owlCarousel({
        autoPlay:8000,
        navigation : true,
        navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
        pagination:false,
        singleItem : true,
        transitionStyle : "fade"

    });
    --></script>



<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel();
    var owl = $('.owl-carousel');

--></script>