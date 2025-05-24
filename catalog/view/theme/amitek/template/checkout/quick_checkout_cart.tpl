<?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
<?php } ?>

<div class="quick-checkout--cart">
    <div class="quick-checkout--cart-items">
        <?php foreach ($products as $product) { ?>
            <div class="quick-checkout--cart-item">
                <div class="quick-checkout--cart-content">
                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="quick-checkout--cart-image">
                    <div class="quick-checkout--cart-name">
                        <?php echo $product['name']; ?>
                        <small class="text-secondary"><?php echo $text_model; ?><?php echo $product['sku']; ?></small>
                        <?php if (!$product['stock']) { ?>
                            <div class="out-of-stock">
                                <?php echo $text_product_out_of_stock; ?>
                            </div>
                        <?php } ?>
                    </div>
                </div>
                <div class="quick-checkout--cart-content">
                    <div class="quick-checkout--cart-price">
                        <span><?php echo $text_price; ?></span>
                        <?php echo $product['price']; ?>
                    </div>
                    <div class="quick-checkout--cart-quantity">
                        <span><?php echo $text_quantity; ?></span>
                        <?php echo $product['quantity']; ?>
                    </div>
                    <div class="quick-checkout--cart-total">
                        <span><?php echo $text_total; ?></span>
                        <?php echo $product['total']; ?>
                    </div>
                    <div class="btn btn-outline-secondary" data-toggle="cart">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                            <path d="M493.21 56.262L455.703 18.748C443.208 6.252 426.83 0 410.451 0C394.07 0 377.695 6.25 365.195 18.75L31.037 352.955C28.802 355.189 27.281 358.033 26.66 361.131L0.32 492.854C-1.704 502.967 6.156 512 15.945 512C16.994 512 18.062 511.896 19.144 511.68L150.855 485.336C153.953 484.717 156.796 483.195 159.031 480.963C159.031 480.963 489.292 150.684 493.3 146.676C518.292 121.684 518.201 81.256 493.21 56.262ZM131.945 440.168L56.8 455.197L71.828 380.047L96 355.875V416H156.115L131.945 440.168ZM144 368V307.871L320.949 130.916L381.064 191.035L204.115 368H144Z"/>
                        </svg>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>

    <div class="quick-checkout--totals" id="checkout_totals"></div>
</div>

<!--    --><?php //include DIR_TEMPLATE . 'amitek/template/checkout/quick_checkout_totals.tpl'; ?>
