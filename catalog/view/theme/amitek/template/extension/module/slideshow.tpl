<div class="home-slider">
	<div id="home-slider" class="home-slider_content owl-carousel owl-theme">
	<?php foreach ($banners as $key => $banner) { ?>
		<?php if ($banner['link']) { ?>
		<a href="<?php echo $banner['link']; ?>" class="home-slider--item">
			<img class="home-slider--item-image d-none d-lg-block" <?php echo ($key > 0) ? 'loading="lazy"' : ''; ?> src="<?php echo $banner['image']; ?>" alt="#">
			<img class="home-slider--item-image d-lg-none" <?php echo ($key > 0) ? 'loading="lazy"' : ''; ?> src="<?php echo $banner['image_mobile']; ?>" alt="#">
			<div class="home-slider--item-content">
				<?php echo $banner['title']; ?>
			</div>
		</a>
		<?php } else { ?>
		<div class="home-slider--item">
			<img class="home-slider--item-image d-none d-lg-block" <?php echo ($key > 0) ? 'loading="lazy"' : ''; ?> src="<?php echo $banner['image']; ?>" alt="#">
			<img class="home-slider--item-image d-lg-none" <?php echo ($key > 0) ? 'loading="lazy"' : ''; ?> src="<?php echo $banner['image_mobile']; ?>" alt="#">
			<div class="home-slider--item-content">
				<?php echo $banner['title']; ?>
			</div>
		</div>
		<?php } ?>
	<?php } ?>
	</div>
</div>