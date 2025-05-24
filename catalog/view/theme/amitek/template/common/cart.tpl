<?php if (!$ajax_update){ ?>
<div class="modal cart-modal" id="popup-cart" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="cart-modal--content modal-content">

            <div class="cart-modal--header modal-header">
                <button type="button" class="cart-modal--close" data-bs-dismiss="modal" aria-label="Close">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                        <path d="M4.39705 4.55379L4.46967 4.46967C4.73594 4.2034 5.1526 4.1792 5.44621 4.39705L5.53033 4.46967L12 10.939L18.4697 4.46967C18.7626 4.17678 19.2374 4.17678 19.5303 4.46967C19.8232 4.76256 19.8232 5.23744 19.5303 5.53033L13.061 12L19.5303 18.4697C19.7966 18.7359 19.8208 19.1526 19.6029 19.4462L19.5303 19.5303C19.2641 19.7966 18.8474 19.8208 18.5538 19.6029L18.4697 19.5303L12 13.061L5.53033 19.5303C5.23744 19.8232 4.76256 19.8232 4.46967 19.5303C4.17678 19.2374 4.17678 18.7626 4.46967 18.4697L10.939 12L4.46967 5.53033C4.2034 5.26406 4.1792 4.8474 4.39705 4.55379L4.46967 4.46967L4.39705 4.55379Z"
                              fill="#111111"/>
                    </svg>
                </button>
                <div class="cart-modal--title"><?php echo $heading_title; ?></div>
            </div>

            <div class="cart-modal--body">
                <?php } ?>
                <?php if ($products || $vouchers) { ?>
                    <form id="popup-cart--form" class="cart-modal--products">
                        <div class="loader-bg" style="display: block;"></div>

                        <?php foreach ($products as $product) { ?>
                            <a href="<?php echo $product['href']; ?>" class="cart-modal--item">
                                <div class="cart-item--image">
                                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"
                                         title="<?php echo $product['name']; ?>">
                                </div>
                                <div class="cart-item--right">
                                    <div class="cart-item--content">
                                        <div class="cart-item--name"><?php echo $product['name']; ?></div>
                                        <div class="cart-item--model"><?php echo $text_model; ?><?php echo $product['sku']; ?></div>
                                    </div>
                                    <div class="cart-item--quantity-block">
                                        <button class="cart-item--quantity-minus disabled">–</button>
                                        <input type="text" class="cart-item--quantity-input"
                                               name="quantity[<?php echo $product['cart_id']; ?>]"
                                               value="<?php echo $product['quantity']; ?>"
                                               data-minimum="<?php echo $product['minimum']; ?>">
                                        <button class="cart-item--quantity-plus">+</button>
                                    </div>
                                    <div class="cart-item--price-block <?php echo($product['total_discount'] ? '' : ''); ?>">
                                        <div class="d-flex align-items-end gap-2">
                                            <div class="d-flex flex-column align-items-end">
                                                <?php if ($product['total_discount']) { ?>
                                                    <span class="cart-item--price-discount"><?php echo $product['total_discount']; ?></span>
                                                <?php } ?>
                                                <span class="cart-item--price"><?php echo $product['price']; ?></span>
                                            </div>
                                            <div class="text-secondary">
                                                x <?php echo $product['quantity']; ?>
                                            </div>
                                        </div>
                                        <span class="cart-item--price-total">= <?php echo $product['total']; ?></span>
                                    </div>
                                </div>
                            </a>
                        <?php } ?>

                    </form>

                    <?php if (!empty($products_related)) { ?>
                        <div class="cart-modal--related-items">
                            <p class="cart-modal--related-items-heading">
                                <?php echo $text_related; ?>
                            </p>
                            <?php foreach ($products_related as $product) { ?>
                                <div class="cart-modal--related-item">
                                    <?php include DIR_TEMPLATE . 'amitek/template/product/product/product_list_min.tpl'; ?>
                                </div>
                            <?php } ?>
                        </div>
                    <?php } ?>

                    <div class="cart-modal--totals">
                        <?php foreach ($totals as $total) { ?>
                            <?php if ($total['code'] == 'total') { ?>
                                <div class="cart-modal--totals-item">
                                    <div class="cart-modal--totals-title"><?php echo $total['title']; ?>:</div>
                                    <div class="cart-modal--totals-text"><?php echo $total['text']; ?></div>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>

                    <div class="cart-modal--btn-block">

                        <button class="btn btn-outline-secondary pull-left" data-bs-dismiss="modal"
                                aria-label="Close"><?php echo $button_continue; ?></button>
                        <button class="btn btn-primary pull-right"
                                onclick="location = '<?php echo $checkout; ?>'"><?php echo $text_checkout; ?></button>

                    </div>

                <?php } else { ?>
                    <div class="cart-modal--products">
                        <p class="text-center"><?php echo $text_empty; ?></p>
                    </div>

                    <div class="cart-modal--btn-block">
                        <button class="btn btn-outline-secondary" data-bs-dismiss="modal"
                                aria-label="Close"><?php echo $button_continue; ?></button>
                    </div>

                <?php } ?>

                <?php if (!$ajax_update){ ?>
            </div>

        </div>
    </div>
</div>
<?php } ?>
