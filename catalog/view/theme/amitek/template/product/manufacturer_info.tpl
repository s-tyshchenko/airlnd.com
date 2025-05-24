<?php echo $header; ?>

<div class="container">
    <div class="search-heading"><?php echo $heading_title; ?></div>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <?php $i=0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
            <?php if($i < count($breadcrumbs)){ ?>
            <li class="breadcrumb-item"><a
                        href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } else { ?>
            <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb['text']; ?></li>
            <?php } ?>
            <?php } ?>
        </ol>
    </nav>

    <?php if(empty($products) && !empty($categories)){
		include DIR_TEMPLATE . 'amitek/template/product/category/category_subcategories.tpl';
	} else {
		include DIR_TEMPLATE . 'amitek/template/product/category/category_products.tpl';
	} ?>
</div>

<?php echo $footer; ?>