<div id="latest-module_container" class="module-container">
    <div class="container">
        <h3 class="module-container--heading"><?php echo $heading_title; ?></h3>
        <div class="module-container_content">
            <div class="module-products--container">
                <?php foreach ($products as $product) { ?>
                    <?php include DIR_TEMPLATE . 'amitek/template/product/product/product_card.tpl'; ?>
                <?php } ?>
            </div>
        </div>
    </div>
</div>