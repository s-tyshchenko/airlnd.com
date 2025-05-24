<?php echo $header; ?>

    <div class="container">
        <div class="py-5 text-center">
            <?php echo $content_top; ?>

            <h3><?php echo $heading_title; ?></h3>
            <div><?php echo $text_message; ?></div>

            <a href="<?php echo $continue; ?>" class="btn btn-outline-primary"><?php echo $button_continue; ?></a>

            <?php echo $content_bottom; ?>
        </div>
    </div>

<?php echo $footer; ?>