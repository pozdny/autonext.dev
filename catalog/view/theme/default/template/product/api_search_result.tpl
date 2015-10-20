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
                <!--<th class="notice text-center">В корзину</th>-->
            </tr>
            <tbody>
            <?php if($results){ ?>
            <tr>
                <th class="" colspan="11">
                    <?php if($results['model_photo']) { ?>
                        <a class="section-photo" href="<?php echo $results['model_photo']; ?>"><i class="fa fa-camera"></i></a>
                    <?php } ?>
                    <?php echo $results['model_name']; ?></th>
            </tr>
            <?php foreach($results['items'] as $key=>$item){ ?>
                <tr>
                    <th class="" colspan="11"><?php echo $key; ?></th>
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
                    <!--<td class="td_price">В корзину</td>-->
                </tr>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            </tbody>

            </thead>
        </table>
    </div>

</div>
