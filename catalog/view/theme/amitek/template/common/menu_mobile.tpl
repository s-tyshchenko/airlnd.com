    <nav class="mobile-menu">
        <ul class="mobile-menu--items">
            <li class="mobile-menu--item">
                <a href="<?php echo $home; ?>" class="mobile-menu--nav-button"><?php echo $text_home; ?></a>
                <div class="mobile-menu--close-button" data-toggle="mobile-menu"></div>
            </li>
			<?php foreach($categories as $category){ ?>
            <li class="mobile-menu--item <?php echo ($category['children'] ? 'subcategories-on' : ''); ?>">
                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
				<?php if ($category['children']){ ?>
                <ul class="mobile-menu--subcategories">
                    <li class="mobile-menu--item">
                        <a class="mobile-menu--nav-button" href="#"><?php echo $text_back; ?></a>
                        <div class="mobile-menu--close-button" data-toggle="mobile-menu"></div>
                    </li>
					<?php foreach($category['children'] as $child){ ?>
                    <li class="mobile-menu--item subcategories-on">
                        <?php if ($child['children']){ ?>
						<div class="subcategories-btn"></div>
						<?php } ?>
						<a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
						<?php if ($child['children']){ ?>
                        <ul class="mobile-menu--subcategories">
                            <li class="mobile-menu--item">
                                <a class="mobile-menu--nav-button" href="#"><?php echo $text_back; ?></a>
                                <div class="mobile-menu--close-button" data-toggle="mobile-menu"></div>
                            </li>
							<?php foreach($child['children'] as $child_2){ ?>
								<li class="mobile-menu--item"><a href="<?php echo $child_2['href']; ?>"><?php echo $child_2['name']; ?></a></li>
							<?php } ?>
                        </ul>
						<?php } ?>
                    </li>
					<?php } ?>
                </ul>
				<?php } ?>

                <?php if ($category['children']){ ?>
                    <div class="mobile-menu--subcategories-button" data-toggle="mobile-menu-subcategory"></div>
                <?php } ?>
            </li>
            <?php } ?>
			
			<?php if($informations){ ?>
				<?php foreach($informations as $information){ ?>
				<li class="mobile-menu--item">
					<a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
				</li>
				<?php } ?>
			<?php } ?>
			
            <div class="mobile-menu--footer">
                <a href="<?php echo ($logged ? $account : '#" data-action="ajax-register-open'); ?>" class="mobile-menu--account">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none">
                        <path fill="#111111" d="M17.755 14a2.249 2.249 0 0 1 2.248 2.249v.575c0 .894-.32 1.76-.9 2.439C17.532 21.096 15.145 22 12 22s-5.532-.905-7.098-2.74a3.75 3.75 0 0 1-.898-2.434v-.578a2.249 2.249 0 0 1 2.249-2.25h11.502Zm0 1.5H6.252a.749.749 0 0 0-.75.749v.578c0 .535.192 1.053.54 1.46 1.253 1.468 3.22 2.214 5.957 2.214 2.739 0 4.706-.746 5.963-2.214a2.25 2.25 0 0 0 .54-1.463v-.575a.749.749 0 0 0-.748-.75ZM12 2.005a5 5 0 1 1 0 10 5 5 0 0 1 0-10Zm0 1.5a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7Z"></path>
                    </svg>
					<?php if($logged){ ?>
						<?php echo $text_account; ?>
					<?php } else { ?>
						<?php echo $text_login_mobile; ?>
					<?php } ?>
                </a>
            </div>
        </ul>
    </nav>