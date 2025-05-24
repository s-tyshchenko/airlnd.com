<?php foreach ($totals as $key => $total_item) { ?>
    <?php if ($key !== 'total') { ?>
        <div class="quick-checkout--subtotal">
            <span class="pull-left"><?php echo $total_item['title']; ?></span>
            <span class="pull-right"><?php echo $total_item['text']; ?></span>
        </div>
    <?php } ?>
<?php } ?>

<div class="quick-checkout--submit-container">
    <div class="quick-checkout--total">
        <div><?php echo $total; ?></div>
        <div><?php echo $text_cart_total; ?></div>
    </div>

    <button class="btn btn-primary btn-lg d-none d-lg-flex" type="submit"><?php echo $button_checkout; ?></button>
    <button class="btn btn-primary w-100 d-flex d-lg-none mt-2" type="submit"><?php echo $button_checkout; ?></button>

</div>


<input type="hidden" name="agree" value="1"/>

