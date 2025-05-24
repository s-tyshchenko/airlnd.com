<?php echo $header; ?>

<div class="container">
    <div class="row">

        <div class="col-12 col-lg-6">
            <div class="h-100 d-flex flex-column align-items-center justify-content-center">
                <h1 class="error-page--heading">404</h1>
                <p class="error-page--error"><?php echo $text_error; ?></p>

                <a href="<?php echo $continue; ?>" class="btn btn-primary btn-lg"><?php echo $button_continue; ?></a>
            </div>
        </div>
        <div class="col-12 col-lg-6">
            <img src="assets/amitek/images/404.png" alt="Page not found illustration" class="w-100"/>
        </div>

    </div>
</div>
<?php echo $footer; ?>
