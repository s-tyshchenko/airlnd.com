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

        <!-- Cards section -->
        <div class="row">
            <!-- Missing Photos Card -->
            <div class="col-md-2">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?php echo $text_missing_photo; ?></h3>
                    </div>
                    <div class="panel-body">
                        <h4>
                            <?php echo $total_missing_photo; ?>
                            <small class="text-danger">(<?php echo  round($total_missing_photo * 100 / $total, 2); ?>%)</small>
                        </h4>
                    </div>
                </div>
            </div>

            <!-- Missing Prices Card -->
            <div class="col-md-2">
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?php echo $text_missing_price; ?></h3>
                    </div>
                    <div class="panel-body">
                        <h4>
                            <?php echo $total_missing_price; ?>
                            <small class="text-danger">(<?php echo  round($total_missing_price * 100 / $total, 2); ?>%)</small>
                        </h4>
                    </div>
                </div>
            </div>

            <!-- Newly Created Card -->
            <div class="col-md-2">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?php echo $text_created_today; ?></h3>
                    </div>
                    <div class="panel-body">
                        <h4><?php echo $total_created_today; ?></h4>
                    </div>
                </div>
            </div>

            <!-- Newly Updated Card -->
            <div class="col-md-2">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?php echo $text_updated_today; ?></h3>
                    </div>
                    <div class="panel-body">
                        <h4><?php echo $total_updated_today; ?></h4>
                    </div>
                </div>
            </div>

            <!-- Recently Created Card -->
            <div class="col-md-2">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?php echo $text_created_this_week; ?></h3>
                    </div>
                    <div class="panel-body">
                        <h4><?php echo $total_created_this_week; ?></h4>
                    </div>
                </div>
            </div>

            <!-- Recently Updated Card -->
            <div class="col-md-2">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?php echo $text_updated_this_week; ?></h3>
                    </div>
                    <div class="panel-body">
                        <h4><?php echo $total_updated_this_week; ?></h4>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Cards section -->

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <td class="text-left"><?php echo $column_model; ?></td>
                            <td class="text-left"><?php echo $column_name; ?></td>
                            <td class="text-left"><?php echo $column_sku; ?></td>
                            <td class="text-left"><?php echo $column_error; ?></td>
                            <td class="text-right"><?php echo $column_info; ?></td>
                            <td class="text-right"><?php echo $column_date_added; ?></td>
                            <td class="text-right"><?php echo $column_date_modified; ?></td>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if ($products) { ?>
                            <?php foreach ($products as $product) { ?>
                                <tr>
                                    <td class="text-left"><?php echo $product['model']; ?></td>
                                    <td class="text-left"><?php echo $product['name']; ?></td>
                                    <td class="text-left"><?php echo $product['sku']; ?></td>
                                    <td class="text-left">
                                        <?php
                                        $errors = [];

                                        if ($product['missing_price']) $errors[] = '<span class="text-danger">' . $text_missing_price . '</span>';
                                        if ($product['missing_photo']) $errors[] = '<span class="text-warning">' . $text_missing_photo . '</span>';

                                        if (!$errors) {
                                            echo '-';
                                        } else {
                                            echo implode('<br>', $errors);
                                        }
                                        ?>
                                    </td>
                                    <td class="text-right">
                                        <?php
                                        if ($product['info']) {
                                            $info = 'text_' . $product['info'];
                                            echo '<span class="text-info">' . $$info . '</span>';
                                        } else {
                                            echo '-';
                                        }
                                        ?>
                                    </td>
                                    <td class="text-right"><?php echo $product['date_added']; ?></td>
                                    <td class="text-right"><?php echo $product['date_modified']; ?></td>
                                </tr>
                            <?php } ?>
                        <?php } else { ?>
                            <tr>
                                <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>
