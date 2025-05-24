<?php echo $header; ?>

    <div class="error_page">
        
        <div class="error_page-left">
            <div class="error-page--heading">500</div>
            <div class="error-page--error"><?php echo $text_error; ?></div>
            
            <a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
        </div>
        <div class="error_page-right"></div>
        
    </div>

<?php echo $footer; ?>
