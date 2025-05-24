<?php
/**
 * @var array $categories
 * @var string $text_more
 */
?>
<div class="mega-menu--header">
    <div class="mega-menu">
        <?php foreach ($categories as $category) { ?>
            <div class="mega-menu--category">
                <a href="<?php echo $category['href']; ?>" class="mega-menu--category-item">
                    <?php if ($category['image']) { ?>
                        <?php echo file_get_contents($category['image']); ?>
                    <?php } ?>
                    <span class="mega-menu--category-title"><?php echo $category['name']; ?></span>
                    <?php if ($category['children']) { ?>
                        <svg class="mega-menu--category-arrow" fill="none" viewBox="0 0 24 24"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="m16.631 11.5-6.4694 6.5452c-0.22011 0.2227-0.21515 0.5788 0.011 0.7955 0.2262 0.2166 0.588 0.2117 0.8081-0.0109l6.8571-6.9375c0.2159-0.2184 0.2159-0.5662 0-0.7846l-6.8571-6.9375c-0.2201-0.22266-0.5819-0.22754-0.8081-0.0109-0.22615 0.21664-0.23111 0.57276-0.011 0.79542l6.4694 6.5452z"/>
                        </svg>
                    <?php } ?>
                </a>

                <?php if ($category['children']) { ?>
                    <div class="mega-menu--subcategories">
                        <?php foreach ($category['children'] as $child) { ?>
                            <div class="mega-menu--subcategory">
                                <a href="<?php echo $child['href']; ?>" class="mega-menu--subcategory-heading">
                                    <img loading="lazy" src="<?php echo $child['image']; ?>"/>
                                    <?php echo $child['name']; ?>
                                </a>
                            </div>
                        <?php } ?>
                    </div>
                <?php } ?>
            </div>
        <?php } ?>
    </div>
</div>