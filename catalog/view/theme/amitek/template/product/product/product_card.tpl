<a href="<?php echo $product['href']; ?>" class="product-card">

    <?php if ($wishlist_enabled = false) { ?>
        <?php if (!isset($wishlist)) { ?>
            <div class="product-card--wishlist-button wishlist_btn <?php echo(!empty($product['wishlist']) ? 'active' : ''); ?>"
                 data-product-id="<?php echo $product['product_id']; ?>"></div>
        <?php } else { ?>
            <div class="product-card--wishlist-checkbox">
                <input type="checkbox" name="wishlist[]" value="<?php echo $product['product_id']; ?>"
                       id="wishlist_<?php echo $product['product_id']; ?>">
                <label for="wishlist_<?php echo $product['product_id']; ?>"></label>
            </div>
        <?php } ?>
    <?php } ?>

    <div class="product-card--image">
        <img loading="lazy" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"
             title="<?php echo $product['name']; ?>">
    </div>
    <div class="product-card--name"><?php echo $product['name']; ?></div>
    <div class="product-card--model"><?php echo $text_model; ?><?php echo $product['model']; ?></div>

    <?php if ($product['quantity'] > 0) { ?>
        <div class="product-card--status"><?php echo $product['stock']; ?></div>
    <?php } else { ?>
        <div class="product-card--status unavailable"><?php echo $product['stock']; ?></div>
    <?php } ?>

    <?php if (!empty($product['attribute_groups'])) { ?>
        <div class="product-card--attribute-groups">
            <div class="product-card--attributes">
                <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>
                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                        <div class="product-card--attribute"><?php echo $attribute['name']; ?>:
                            <span><?php echo $attribute['text']; ?></span></div>
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
    <?php } ?>

    <div class="product-card--price-box">
        <?php if ($product['special']) { ?>
            <div class="product-card--price product-card--discount">
                <span><?php echo $product['price']; ?></span>
            </div>
        <?php } ?>
        <div class="product-card--price-button btn btn-sm <?php echo $product['quantity'] == 0 ? 'btn-outline-secondary' : 'btn-primary'; ?>"
             data-toggle="add-to-cart" data-product-id="<?php echo $product['product_id']; ?>">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!-- Font Awesome Pro 6.0.0-alpha2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) --><defs><style>.fa-secondary{opacity:.4}</style></defs><path d="M569.572 44.734C563.463 36.641 554.15 32 544.01 32H122L170.76 288H489.166C503.4 288 516.041 278.437 519.932 264.781L574.791 72.797C577.572 63.047 575.666 52.828 569.572 44.734Z" class="fa-secondary"/><path d="M464 416C437.49 416 416 437.49 416 464S437.49 512 464 512S512 490.51 512 464S490.51 416 464 416ZM176 416C149.49 416 128 437.49 128 464S149.49 512 176 512S224 490.51 224 464S202.51 416 176 416ZM488 336H179.859L119.578 19.51C117.422 8.19 107.525 0 96.002 0H24C10.745 0 0 10.745 0 24V24C0 37.255 10.745 48 24 48H76.141L136.424 364.491C138.58 375.811 148.477 384 160 384H488C501.255 384 512 373.255 512 360V360C512 346.745 501.255 336 488 336Z" class="fa-primary"/></svg>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!-- Font Awesome Pro 6.0.0-alpha2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) --><path d="M464 416C437.49 416 416 437.49 416 464S437.49 512 464 512S512 490.51 512 464S490.51 416 464 416ZM176 416C149.49 416 128 437.49 128 464S149.49 512 176 512S224 490.51 224 464S202.51 416 176 416ZM569.529 44.734C563.42 36.641 554.107 32 543.967 32H121.957L119.578 19.51C117.422 8.19 107.525 0 96.002 0H24C10.745 0 0 10.745 0 24V24C0 37.255 10.745 48 24 48H76.141L136.424 364.491C138.58 375.811 148.477 384 160 384H488C501.255 384 512 373.255 512 360V360C512 346.745 501.255 336 488 336H179.859L170.717 288H489.106C503.399 288 515.961 278.525 519.889 264.781L574.748 72.797C577.529 63.047 575.623 52.828 569.529 44.734Z"/></svg>

            <div class="product-card--price">
                <?php echo !$product['special'] ? $product['price'] : $product['special']; ?>
            </div>
        </div>
    </div>
</a>
