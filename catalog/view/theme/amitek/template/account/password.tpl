<?php echo $header; ?>
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <?php $i = 0;
                foreach ($breadcrumbs as $breadcrumb) {
                    $i++; ?>
                    <?php if ($i < count($breadcrumbs)) { ?>
                        <li class="breadcrumb-item"><a
                                    href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                        </li>
                    <?php } else { ?>
                        <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb['text']; ?></li>
                    <?php } ?>
                <?php } ?>
            </ol>
        </nav>

        <h1><?php echo $heading_title; ?></h1>

        <div class="account-layout">
            <?php echo $column_left; ?>

            <div class="content">
                <?php echo $content_top; ?>

                <form action="<?php echo $action; ?>" class="row" method="post" enctype="multipart/form-data">

                    <div class="col-md-6">
                        <div class="mb-3 required">
                            <label class="form-label" for="input-password"><?php echo $entry_password; ?></label>
                            <input type="password" name="password" value="<?php echo $password; ?>"
                                   placeholder="<?php echo $entry_password; ?>" id="input-password"
                                   class="form-control <?php echo($error_password ? 'has-error' : ''); ?>"/>
                            <?php if ($error_password) { ?>
                                <div class="text-danger"><?php echo $error_password; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="mb-3 required">
                            <label class="form-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                            <input type="password" name="confirm" value="<?php echo $confirm; ?>"
                                   placeholder="<?php echo $entry_confirm; ?>" id="input-confirm"
                                   class="form-control <?php echo($error_confirm ? 'has-error' : ''); ?>"/>
                            <?php if ($error_confirm) { ?>
                                <div class="text-danger"><?php echo $error_confirm; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <div class="buttons clearfix col-md-12">
                        <div class="text-center">
                            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary"/>
                        </div>
                    </div>
                </form>
                <?php echo $content_bottom; ?></div>

            <?php echo $column_right; ?>
        </div>
    </div>
<?php echo $footer; ?>