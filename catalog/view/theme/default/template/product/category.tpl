<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $i=>$breadcrumb) { ?>
        <?php if($i+1 < count($breadcrumbs)){ ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } else { ?>
        <li><?php echo $breadcrumb['text']; ?></li>
        <?php } ?>
        <?php } ?>
    </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <?php
      if($catalog_id) {
         $data_catalog_id = 'data-catalog_Id="'.$catalog_id.'"';
      }
      else{
        $data_catalog_id = '';
      }
      if($section_id) {
         $data_section_id = 'data-section_Id="'.$section_id.'"';
      }
      else{
        $data_section_id = '';
      }
    ?>
    <div id="content" class="<?php echo $class; ?>" <?php echo $data_catalog_id; ?> <?php echo $data_section_id; ?>>
      <?php echo $content_top; ?>
      <?php if($apisearch){ ?>
          <?php echo $apisearch; ?>
      <?php } else { ?>
      <h1><?php echo $heading_title; ?></h1>

        <?php if($catone){  ?>
            <?php if ($form_order) { ?>
            <?php echo $form_order; ?>
            <?php } ?>
        <?php } ?>
        <?php if($name_files) { ?>
        <?php if($prezentaciya){ ?>

        <?php } else{ ?>
        <h3 ><?php echo $title_links_down_price; ?></h3>
        <?php foreach($name_files as $arr){ ?>
        <span class="title-link-down"><?php echo $arr['link']; ?></span>(<a class="download-files" href="down-files/<?php echo $arr['name']; ?>">скачать</a>)<br>
        <?php } ?>
        <hr>
        <?php } ?>

        <?php } ?>

        <?php if ($thumb || $description) { ?>
      <div class="row">
        <?php if ($thumb) { ?>
            <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
             <?php if (!empty($description)) { ?>
                   <div class="col-sm-10"><?php echo $description; ?></div>
             <?php } ?>
         <?php } else { ?>
              <?php if ($description) { ?>
              <div class="col-sm-12"><?php echo $description; ?></div>
              <?php } ?>
          <?php } ?>
      </div>
      <?php } ?>
      <?php if(!$catone && !$oborudovanie_show){  ?>
        <?php if ($form_order) { ?>
        <?php echo $form_order; ?>
        <?php } ?>
      <?php } ?>
        <hr>
      <?php if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($products) { ?>
      <!--<p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>-->
      <div class="row">
        <div class="col-md-3">
          <div class="btn-group hidden-xs">
            <!--<button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>-->
          </div>
        </div>
        <div class="col-xs-3 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-xs-4 col-md-3 text-right">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-xs-2 col-md-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-xs-3 col-sm-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout">
          <div class="product-thumb transition">
              <a href="<?php echo $product['href']; ?>" class="box-link-all"></a>
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                  <div class="content">
                    <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                    <!--<p><?php echo $product['description']; ?></p>-->
                    <?php if ($product['rating']) { ?>
                    <div class="rating">
                      <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                      <?php } else { ?>
                      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                      <?php } ?>
                      <?php } ?>
                    </div>
                    <?php } ?>
                   </div>
                    <?php if ($product['price']) { ?>
                    <p class="price">
                      <?php if (!$product['special']) { ?>
                      <?php echo $product['price']; ?>
                      <?php } else { ?>
                      <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                      <?php } ?>
                      <?php if ($product['tax']) { ?>
                      <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                      <?php } ?>
                    </p>
                    <?php } ?>
              </div>
              <div class="button-group">
                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
                    <i class="fa fa-shopping-cart"></i>
                    <span class=""><?php echo $button_cart; ?></span>
                </button>
                <!--<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>-->
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>

     <?php if (!$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?>
      <?php }  ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript"><!--
  $(document).ready(function() {
    $('.thumbnails').magnificPopup({
      type:'image',
      delegate: 'a',
      gallery: {
        enabled:true
      }
    });
  });
  //--></script>