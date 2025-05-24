<?php echo $header; ?>
<div class="container">
<div class="wishlist-page">

    <?php if ($products) { ?>
	
    <div class="wishlist-page_heading"><?php echo $heading_title; ?></div>
    
    <div class="wishlist-content">
        
        <div class="wishlist-content_heading">
            
            <div class="wishlist-btn_select-all"><?php echo $text_select_all; ?></div>
            <div class="wishlist-btn_select-all active" style="display: none;"><?php echo $text_unselect_all; ?></div>
            <div class="wishlist-btn_remove not-active"><?php echo $text_remove; ?></div>
            
			<div class="btn-group wishlist-btn_sort">
				<button class="btn dropdown-toggle wishlist-btn_sort" data-bs-toggle="dropdown">
					<span><?php echo $text_sort; ?></span>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M8.29158 10.293C8.10477 10.4819 8 10.7368 8 11.0025C8 11.2682 8.10477 11.5231 8.29158 11.712L11.2306 14.677C11.4486 14.892 11.7306 14.999 12.0096 14.999C12.2886 14.999 12.5656 14.892 12.7786 14.677L15.7086 11.722C15.8951 11.533 15.9998 11.2781 15.9998 11.0125C15.9998 10.7469 15.8951 10.492 15.7086 10.303C15.6167 10.2098 15.5073 10.1358 15.3866 10.0853C15.2659 10.0348 15.1364 10.0088 15.0056 10.0088C14.8748 10.0088 14.7452 10.0348 14.6245 10.0853C14.5039 10.1358 14.3944 10.2098 14.3026 10.303L12.0046 12.62L9.69758 10.293C9.60554 10.2002 9.49604 10.1265 9.37538 10.0762C9.25472 10.0259 9.1253 10.0001 8.99458 10.0001C8.86386 10.0001 8.73444 10.0259 8.61378 10.0762C8.49312 10.1265 8.38362 10.2002 8.29158 10.293Z" fill="white"></path></svg>
				</button>
				<ul class="dropdown-menu">
				<?php foreach ($sorts as $sorts) { ?>
					<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<li class="active" onclick="location = '<?php echo $sorts['href']; ?>';"><?php echo $sorts['text']; ?></li>
					<?php } else { ?>
						<li onclick="location = '<?php echo $sorts['href']; ?>';"><?php echo $sorts['text']; ?></li>
					<?php } ?>
				<?php } ?>
				</ul>
			</div>
            
            <div class="clearfix"></div>
        </div>
        
        <div class="wishlist-content_products">
            
            <?php if($products){ ?>
				<?php foreach($products as $product){ ?>
                <?php $wishlist = true; ?>
				    <?php include DIR_TEMPLATE . 'amitek/template/product/product/product_card.tpl'; ?>
				<?php } ?>
			<?php } ?>
            
        </div>
        
        <div class="wishlist-total">
            <button class="btn btn-primary wishlist-total_btn"><?php echo $button_cart; ?></button>
            <div class="wishlist-total_text">
                <?php echo $count_products; ?>
                <span><?php echo $total; ?></span>
            </div>
        </div>
    </div>
	<?php } else { ?>
	
		<div class="success-page text-center">
    
			<?php echo $content_top; ?>
			
			<div class="success-page_title"><?php echo $heading_title; ?></div>
			<div class="success-page_subtitle"><?php echo $text_empty; ?></div>
			
			<a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_continue; ?></a>
			
			<?php echo $content_bottom; ?>
			
		</div>
		
	<?php } ?>
    
</div>
</div>
<?php echo $footer; ?>