<?php echo $header; ?>
<div class="<?php echo $products_view === 'list' ? 'container-xxl' : 'container'; ?>">

    <h1 class="search-heading"><?php echo $heading_title; ?></h1>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <?php $i=0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
            <?php if($i < count($breadcrumbs)){ ?>
            <li class="breadcrumb-item"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } else { ?>
            <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb['text']; ?></li>
            <?php } ?>
            <?php } ?>
        </ol>
    </nav>

    <?php if(empty($products) && !empty($categories)){
	//if(!empty($categories) && $category_id !== 999999){
		include DIR_TEMPLATE . 'amitek/template/product/category/category_subcategories.tpl';
	} else {
		include DIR_TEMPLATE . 'amitek/template/product/category/category_products.tpl';
	} ?>
</div>
<?php echo $footer; ?>