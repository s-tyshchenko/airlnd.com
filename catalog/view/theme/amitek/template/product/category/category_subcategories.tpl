<div class="categories-grid">
<?php foreach($categories as $category){ ?>
	<div class="categories-grid_item">
		<div class="categories-grid_content">
			<img src="<?php echo $category['image']; ?>" alt="" class="categories-grid_img">
			<a href="<?php echo $category['href']; ?>" class="categories-grid_heading"><?php echo $category['name']; ?></a>
			<?php if($category['children']){ ?>
				<div class="categories-grid_subtitle"><?php echo $text_category; ?></div>
				<?php foreach($category['children'] as $child){ ?>
				<a href="<?php echo $child['href']; ?>" class="categories-grid_link"><?php echo $child['name']; ?></a>
				<?php } ?>
			<?php } ?>
		</div>
	</div>
<?php } ?>
</div>
	
<?php echo $content_bottom; ?>
