<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_info; ?></div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-frequency"><?php echo $entry_frequency; ?></label>
          <div class="col-sm-10">
            <select class="form-control" id="input-frequency" name="frequency">
              <option value="" selected="">None</option>
              <option value="always">Always</option>
              <option value="hourly">Hourly</option>
              <option value="daily">Daily</option>
              <option value="weekly">Weekly</option>
              <option value="monthly">Monthly</option>
              <option value="yearly">Yearly</option>
              <option value="never">Never</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-date"><?php echo $entry_modification_date; ?></label>
          <div class="col-sm-10">
            <label class="radio">
              <input type="radio" name="date_type" value="1" checked="checked" />
              <?php echo $text_none; ?>
            </label>
            <label class="radio">
              <input type="radio" name="date_type" value="2" />
              <?php echo $text_server_response; ?>
            </label>
            <label class="radio">
              <input type="radio" name="date_type" value="3" />
              <?php echo $text_this_date; ?>
              <div class="input-group datetime" style="width: 50%;">
                <input type="text" name="date" value="" placeholder="<?php echo $entry_modification_date; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-date" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span>
              </div>
            </label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-priority"><?php echo $entry_priority; ?></label>
          <div class="col-sm-10">
            <label class="radio">
              <input type="radio" name="priority_type" value="1" checked="checked" />
              <?php echo $text_none; ?>
            </label>
            <label class="radio">
              <input type="radio" name="priority_type" value="2" />
              <?php echo $text_auto; ?>
            </label>
            <label class="radio">
              <input type="radio" name="priority_type" value="3" />
              <?php echo $text_this_priority; ?>
              <br /><br />
            </label>
          </div>
        </div>
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td for="input-home-priority"><?php echo $column_home; ?></td>
                <td for="input-category-priority"><?php echo $column_category; ?></td>
                <td for="input-product-priority"><?php echo $column_product; ?></td>
                <td for="input-manufacturer-priority"><?php echo $column_manufacturer; ?></td>
                <td for="input-information-priority"><?php echo $column_information; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><input type="number" name="home_priority" id="input-home-priority" placeholder="<?php echo $placeholder_home; ?>" class="form-control" step="0.01" min="0" max="1"></td>
                <td><input type="number" name="category_priority" id="input-category-priority" placeholder="<?php echo $placeholder_category; ?>" class="form-control" step="0.01" min="0" max="1"></td>
                <td><input type="number" name="product_priority" id="input-product-priority" placeholder="<?php echo $placeholder_product; ?>" class="form-control" step="0.01" min="0" max="1"></td>
                <td><input type="number" name="manufacturer_priority" id="input-manufacturer-priority" placeholder="<?php echo $placeholder_manufacturer; ?>" class="form-control" step="0.01" min="0" max="1"></td>
                <td><input type="number" name="information_priority" id="input-information-priority" placeholder="<?php echo $placeholder_information; ?>" class="form-control" step="0.01" min="0" max="1"></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="form-group text-center">
          <button class="btn btn-info" id="generateSitemap"><strong><?php echo $button_generate; ?></strong></button>
        </div>
        <form action="<?php echo $action; ?>" method="post">
          <div class="form-group">
            <textarea id="sitemap" name="sitemap"></textarea>
          </div>
          <div class="form-group text-center">
            <button class="btn btn-success" type="submit"><strong><?php echo $button_save; ?></strong></button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/wkseo/toast.js"></script>
  <link href="view/javascript/codemirror/lib/codemirror.css" rel="stylesheet" />
  <link href="view/javascript/codemirror/theme/monokai.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/codemirror/lib/codemirror.js"></script>
  <script type="text/javascript" src="view/javascript/codemirror/lib/xml.js"></script>
  <script type="text/javascript" src="view/javascript/codemirror/lib/formatting.js"></script>
  <script type="text/javascript">
  var in_process = false;
  var editor;
  var start = 0;
  var html = '';
  var total_product_count = 0;

  $(document).ready(function () {
    // Initialize codemirrror
    editor = CodeMirror.fromTextArea(document.querySelector('#sitemap'), {
      mode: 'text/html',
      height: '500px',
      lineNumbers: true,
      autofocus: true,
      theme: 'monokai'
    });
    var sitemap = '<?php echo $file_content; ?>';
    editor.setValue(sitemap);

    $('.datetime').datetimepicker({
      // pickTime: false
    });
  });

  $('#generateSitemap').on('click', function () {
    $.ajax({
      url: '<?php echo $https_catalog; ?>index.php?route=sitemap/sitemap',
      type: 'post',
      data: $('.form-horizontal input[type=\'text\'], .form-horizontal input[type=\'number\'], .form-horizontal input[type=\'radio\']:checked, .form-horizontal select, .form-horizontal textarea'),
      dataType: 'json',
      beforeSend: function() {
        $('.has-error').removeClass('has-error');
        $('#generateSitemap').button('loading');
      },
      complete: function() {
        $('#generateSitemap').button('reset');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();
        $('.form-group').removeClass('has-error');

        if (json['error']) {
          for (i in json['error']) {
            var element = $('#input-' + i.replace('_', '-'));

            if (element.parent().hasClass('input-group')) {
              element.parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
            } else {
              element.after('<div class="text-danger">' + json['error'][i] + '</div>');
            }
            element.parent().addClass('has-error');
          }
        }

        if (json['success']) {
          total_product_count = json['total_product_count'];
          html += json['sitemap'];
          if (total_product_count > 0) {
            getProducts(0);
          } else{
            editor.setValue(html);
          }
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });

  });

  function getProducts(start) {
    $.ajax({
      url: '<?php echo $https_catalog; ?>index.php?route=sitemap/sitemap/getProducts&start=' + start,
      type: 'post',
      data: $('.form-horizontal input[type=\'text\'], .form-horizontal input[type=\'number\'], .form-horizontal input[type=\'radio\']:checked, .form-horizontal select, .form-horizontal textarea'),
      dataType: 'json',
      beforeSend: function() {
        $('#generateSitemap').button('loading');
      },
      success: function(json) {

        html += json['output'];
        start += json['count'];

        if (start >= total_product_count) {
          $('#generateSitemap').button('reset');
          html += '</urlset>';
          editor.setValue(html);
        } else {
          getProducts(start);
        }
      }
    });
  }
//--></script>
</div>
<?php echo $footer; ?>
