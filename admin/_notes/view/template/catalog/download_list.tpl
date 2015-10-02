<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-download').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
        <?php if(isset($_POST["submit_download"])){
            echo '
            <p class="info-ok-data">Файл добавлен! <a href="'.$update_link.'"> Обновить страницу</a></p>
            '; } ?>
      <div class="panel-body">
          <div class="row">
              <div class="col-xs-6">
                  <form action="" method="post" enctype="multipart/form-data" id="form-download">

                      <input type="file" class="" name="name_file" style="padding:10px 20px;" required><br>
                      <p>Дайте название ссылке</p>
                      <input type="text" class="marmut" name="name_link" style="padding:10px 20px;" required><br><br><br>
                      <p>Выберите страницу, на которой хотите разместить ссылку на скачивание файла</p>
                      <select name="opt_page" class="marmut">
                          <?php foreach ($categories as $category){ ?>
                          <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                          <?php } ?>
                      </select><br><br><br>
                      <input type="submit" name="submit_download" class="but-down" value="загрузить файл">
                  </form>
              </div>
          </div>

          <div class="row">
              <div class="col-xs-6" style="outline: 0px solid #ff0000; margin-top:30px; clear: both; position: relative;">
                  <form id="update-name-links">

                      <?php foreach($categories as $category) { ?>
                      <h4><strong><?php echo $category['name']; ?></strong></h4>
                      <?php  if(sizeof($category['links']) != 0) { ?>
                      <?php foreach($category['links'] as $arr){  ?>
                      <p class="marmut-p"><input class="marmut" type="text" data-id="<?php echo $arr['link_id']; ?>" name="update<?php echo $arr['link_id']; ?>" value="<?php echo $arr['link']; ?>"><a class="download-files"><?php echo $arr['file_name']; ?></a><span title="удалить"><strong><a href="<?php echo $arr['delete_links']; ?>">╳</a></strong></span></p><br>
                      <?php } ?>
                      <?php } ?>
                      <?php } ?>

                  </form>
              </div>
          </div>

      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript"><!--
$(document).ready(function() {
    var form = $('#update-name-links'),
        inputs = form.find('input');

    inputs.on('change', function() {
        var id = $(this).data('id'),
            val = $(this).val();
        $.ajax({
            type: 'post',
            url: 'index.php?route=catalog/download/update&token=<?php echo $token; ?>',
            cache: false,
            data: {
                id:id,
                val: val
            },
            dataType:'json',
            beforeSend: function() {

            },
            complete: function() {

            },
            success: function(json) {
                if(json['result' == 'ok']){

                }
            },
            error:function(txt){

            }
        });
    });
});
    //--></script>

