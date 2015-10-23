<div id="sectionMain">
    <h1><?php echo $heading_title; ?></h1>
    <ul class="breadcrumb">
        <?php foreach($breadcrumbs_api as $i=>$breadcrumb){ ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <?php if($sections || $subsections){ ?>
        <div id="sectionBody">
            <div class="chooseInfo"><?php echo $chooseInfo; ?></div>
            <?php if($subsections){ ?>
                <button id="searchItems" class="btn btn-warning disabled">Найти</button>
            <?php } ?>
            <div class="row rowBody">
                <?php if($sections){ ?>
                    <?php foreach($sections as $section){ ?>
                        <div class="col-xs-4 getSubSectionsList list-group-item" data-key="<?php echo $section['category_id']; ?>">
                            <h5>
                                <strong><?php echo $section['name']; ?></strong>
                            </h5>
                        </div>
                    <?php } ?>
                <?php } elseif($subsections){ ?>
                    <?php foreach($subsections as $section){ ?>
                    <div class="col-xs-4 getItemsByCatalog list-group-item" data-key="<?php echo $section['category_id']; ?>">
                        <?php if($section['photo']) { ?>
                            <a class="section-photo" href="<?php echo $section['photo']; ?>"><i class="fa fa-camera"></i></a>
                        <?php } ?>
                        <h5>
                            <strong><?php echo $section['name']; ?></strong>
                        </h5>
                    </div>
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
    <?php } ?>
    <?php if($results){ ?>
    <div id="sectionBody">
        <div class="row">
            <div class="result-table">
                <table class="table table-bordered fixed-table-header">
                    <thead>
                    <tr>
                        <th class="photo">фото</th>
                        <th class="product_information">Информация о товаре (артикул, бренд, наименование)</th>
                        <?php if($storages){ ?>
                        <?php foreach($storages as $storage){ ?>
                        <th class=""><?php echo $storage['legend']; ?></th>
                        <?php } ?>
                        <?php } ?>
                        <th class="price text-center">Цена</th>
                        <th class="notice text-center">В корзину</th>
                    </tr>
                    <tbody>

                    <tr>
                        <th class="" colspan="12">
                            <?php if($results['model_photo']) { ?>
                            <a class="section-photo" href="<?php echo $results['model_photo']; ?>"><i class="fa fa-camera"></i></a>
                            <?php } ?>
                            <?php echo $results['model_name']; ?></th>
                    </tr>
                    <?php foreach($results['items'] as $key=>$item){ ?>
                    <tr>
                        <th class="" colspan="12"><?php echo $key; ?></th>
                    </tr>
                    <?php foreach($item as $items){ ?>
                    <tr>
                        <td>
                            <?php if($items['photo']) { ?>
                            <a class="section-photo" href="<?php echo $items['photo']; ?>"><i class="fa fa-camera"></i></a>
                            <?php } ?>
                        </td>
                        <td><?php echo $items['name']; ?></td>
                        <?php foreach($items['storage_quantity'] as $quantity){ ?>
                        <td><?php echo $quantity['quantity']; ?></td>
                        <?php } ?>
                        <td class="td_price"><?php echo $items['price']; ?></td>
                        <td class="cart-button"><i class="fa fa-shopping-cart"></i></td>
                    </tr>

                    <?php } ?>
                    <?php } ?>
                    </tbody>

                    </thead>
                </table>
            </div>
        </div>
    </div>
    <?php } ?>
</div>


<script type="text/javascript"><!--
    $(document).ready(function() {
        $('.section-photo').magnificPopup({
            type:'image',
            
        });
    });
//--></script>