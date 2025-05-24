<?php if ($thumb || $images) { ?>
    <div class="owl-product--image">
        <div class="owl-product--container">
            <?php if ($images) { ?>
                <div class="owl-product--prev">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
                        <path d="M10.3687 15.5L16.8381 8.95476C17.0582 8.7321 17.0533 8.37598 16.8271 8.15934C16.6009 7.9427 16.2391 7.94758 16.019 8.17024L9.16187 15.1077C8.94604 15.3261 8.94604 15.6739 9.16187 15.8923L16.019 22.8298C16.2391 23.0524 16.6009 23.0573 16.8271 22.8407C17.0533 22.624 17.0582 22.2679 16.8381 22.0452L10.3687 15.5Z"
                              fill="#111111"/>
                    </svg>
                </div>
                <div class="owl-product--next">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none">
                        <path d="M19.6313 14.5L13.1619 21.0452C12.9418 21.2679 12.9467 21.624 13.1729 21.8407C13.3991 22.0573 13.7609 22.0524 13.981 21.8298L20.8381 14.8923C21.054 14.6739 21.054 14.3261 20.8381 14.1077L13.981 7.17024C13.7609 6.94758 13.3991 6.9427 13.1729 7.15934C12.9467 7.37598 12.9418 7.7321 13.1619 7.95476L19.6313 14.5Z"
                              fill="#111111"/>
                    </svg>
                </div>
            <?php } ?>
            <div class="owl-carousel owl-theme">
                <?php if ($thumb) { ?>
                    <img class="owl-product--image-item" alt="<?php echo $heading_title; ?>"
                         src="<?php echo $popup; ?>">
                <?php } ?>
                <?php if ($images) { ?>
                    <?php foreach ($images as $image) { ?>
                        <img class="owl-product--image-item" alt="<?php echo $heading_title; ?>"
                             src="<?php echo $image['popup']; ?>">
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
        <?php if (count($images) > 0) { ?>
            <div class="owl-product--thumbs">
                <?php if ($thumb && $images) { ?>
                    <div class="owl-product--thumbs-image">
                        <img class="thumb" alt="<?php echo $heading_title; ?>" src="<?php echo $popup; ?>">
                    </div>
                <?php } ?>
                <?php if (count($images) > 0) { ?>
                    <?php foreach ($images as $image) { ?>
                        <div class="owl-product--thumbs-image">
                            <img class="thumb" alt="<?php echo $heading_title; ?>" src="<?php echo $image['thumb']; ?>">
                        </div>
                    <?php } ?>
                <?php } ?>
            </div>
        <?php } ?>
    </div>
<?php } ?>
			