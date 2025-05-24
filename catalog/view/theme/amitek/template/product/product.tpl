<?php echo $header; ?>
    <div class="container">

        <h1 class="product-heading d-inline-block d-lg-none">
            <?php echo $heading_title; ?>
        </h1>

        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <?php $i = 0;
                foreach ($breadcrumbs as $breadcrumb) {
                    $i++; ?>
                    <?php if ($i < count($breadcrumbs)) { ?>
                        <li class="breadcrumb-item"><a
                                    href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                        </li>
                    <?php } else { ?>
                        <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb['text']; ?></li>
                    <?php } ?>
                <?php } ?>
            </ol>
        </nav>

        <h1 class="product-name">
            <?php echo $heading_title; ?>
        </h1>

        <?php echo $content_top; ?>

        <div class="product-page">

            <div class="product-images">

                <?php include DIR_TEMPLATE . 'amitek/template/product/product/images.tpl'; ?>

            </div>

            <div class="product-content">

                <dl class="product--model-items">
                    <?php if ($logged) { ?>
                        <div class="product--model-item">
                            <dt><?php echo $text_model; ?></dt>
                            <dd><?php echo $model; ?></dd>
                        </div>
                    <?php } ?>
                    <?php if (!empty($sku)) { ?>
                        <div class="product--model-item">
                            <dt><?php echo $text_article; ?></dt>
                            <dd><?php echo $sku; ?></dd>
                        </div>
                    <?php } ?>
                    <?php if (!empty($manufacturer)) { ?>
                        <div class="product--model-item">
                            <dt><?php echo $text_manufacturer; ?></dt>
                            <dd><?php echo $manufacturer; ?></dd>
                        </div>
                    <?php } ?>
                </dl>

                <div class="product--content-block product--price-block">
                    <div class="product--price-left">
                        <?php if ($special || $logged) { ?>
                            <span class="product--price-text"><?php echo $text_your_price; ?></span>
                        <?php } ?>

                        <div class="product--price-special-block">
                            <?php if ($special) { ?>
                                <span class="product--price-special"><?php echo $special ?></span>
                                <span><?php echo $price; ?></span>
                            <?php } else { ?>
                                <span class="product--price-special"><?php echo $price; ?></span>
                            <?php } ?>
                        </div>

                        <?php if (!$logged) { ?>
                            <span class="product--price-text">
						<a role="button" data-bs-toggle="modal"
                           data-bs-target="#auth-modal"><?php echo $text_authorize; ?></a>, <?php echo $text_to_see_your_price; ?>
					</span>
                        <?php } ?>
                    </div>
                    <div class="product--price-right">
                        <?php if ($quantity > 0) { ?>
                            <button class="product--cart-button btn btn-lg btn-primary" data-toggle="add-to-cart"
                                    data-product-id="<?php echo $product_id; ?>">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="#FFFFFF"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path d="M18.8368 16.4092H10.231C9.4479 16.4036 8.68937 16.1348 8.07745 15.6461C7.46554 15.1573 7.03579 14.4769 6.85733 13.7143L5.4859 8.13946C5.35973 7.62182 5.35326 7.08222 5.46699 6.5617C5.58072 6.04119 5.81166 5.55346 6.14223 5.13561C6.4728 4.71777 6.89431 4.38081 7.37469 4.15037C7.85508 3.91992 8.38169 3.80206 8.91447 3.80575H20.2288C20.7615 3.80206 21.2882 3.91992 21.7685 4.15037C22.2489 4.38081 22.6704 4.71777 23.001 5.13561C23.3316 5.55346 23.5625 6.04119 23.6762 6.5617C23.79 7.08222 23.7835 7.62182 23.6573 8.13946L22.2859 13.728C22.1007 14.5001 21.6583 15.1862 21.0315 15.6734C20.4046 16.1607 19.6306 16.4202 18.8368 16.4092ZM8.87333 5.52003C8.60229 5.52086 8.33495 5.583 8.09133 5.70181C7.84771 5.82061 7.63414 5.993 7.46659 6.20606C7.29905 6.41911 7.18188 6.66732 7.12387 6.93208C7.06586 7.19684 7.06851 7.4713 7.13162 7.73489L8.50304 13.3235C8.59593 13.7151 8.8186 14.0638 9.13484 14.3128C9.45107 14.5618 9.84226 14.6965 10.2448 14.6949H18.8368C19.2393 14.6965 19.6304 14.5618 19.9467 14.3128C20.2629 14.0638 20.4856 13.7151 20.5785 13.3235L21.9499 7.73489C22.0144 7.47119 22.018 7.19627 21.9606 6.93094C21.9031 6.66562 21.7861 6.41684 21.6183 6.20344C21.4504 5.99005 21.2363 5.81762 20.992 5.69922C20.7477 5.58082 20.4797 5.51954 20.2082 5.52003H8.87333Z"/>
                                    <path d="M6.4869 9.60047C6.29107 9.59816 6.10194 9.52886 5.95098 9.4041C5.80003 9.27934 5.69634 9.10664 5.65719 8.91476L4.42976 3.58676C4.31642 3.1014 4.0417 2.66887 3.65057 2.35995C3.25943 2.05103 2.77503 1.884 2.27661 1.88618H1.1589C0.931572 1.88618 0.713555 1.79588 0.552809 1.63513C0.392064 1.47439 0.301758 1.25637 0.301758 1.02904C0.301758 0.801713 0.392064 0.583696 0.552809 0.42295C0.713555 0.262205 0.931572 0.171899 1.1589 0.171899H2.27661C3.16242 0.168804 4.0231 0.466168 4.71807 1.01542C5.41304 1.56467 5.90123 2.33335 6.1029 3.1959L7.32347 8.5239C7.34989 8.63334 7.35431 8.74694 7.33648 8.8581C7.31864 8.96927 7.27891 9.07578 7.21959 9.17147C7.16026 9.26715 7.08252 9.35011 6.99089 9.41551C6.89925 9.48091 6.79553 9.52747 6.68576 9.55247C6.62133 9.57536 6.55468 9.59145 6.4869 9.60047ZM10.3612 23.829C9.8187 23.829 9.2884 23.6682 8.83734 23.3668C8.38628 23.0654 8.03472 22.637 7.82712 22.1358C7.61952 21.6346 7.5652 21.0831 7.67103 20.5511C7.77687 20.019 8.0381 19.5303 8.42169 19.1467C8.80529 18.7631 9.29402 18.5019 9.82608 18.396C10.3581 18.2902 10.9096 18.3445 11.4108 18.5521C11.912 18.7597 12.3404 19.1113 12.6418 19.5623C12.9432 20.0134 13.104 20.5437 13.104 21.0862C13.104 21.8136 12.8151 22.5113 12.3007 23.0257C11.7863 23.5401 11.0886 23.829 10.3612 23.829ZM10.3612 20.0302C10.155 20.0302 9.95353 20.0913 9.78212 20.2058C9.61072 20.3204 9.47713 20.4832 9.39824 20.6736C9.31935 20.8641 9.29871 21.0736 9.33893 21.2758C9.37915 21.478 9.47841 21.6637 9.62418 21.8095C9.76995 21.9552 9.95566 22.0545 10.1578 22.0947C10.36 22.1349 10.5696 22.1143 10.7601 22.0354C10.9505 21.9565 11.1133 21.8229 11.2278 21.6515C11.3423 21.4801 11.4035 21.2786 11.4035 21.0725C11.4035 20.796 11.2937 20.5309 11.0982 20.3355C10.9027 20.14 10.6376 20.0302 10.3612 20.0302ZM19.8378 23.829C19.2953 23.829 18.765 23.6682 18.3139 23.3668C17.8628 23.0654 17.5113 22.637 17.3037 22.1358C17.0961 21.6346 17.0418 21.0831 17.1476 20.5511C17.2534 20.019 17.5147 19.5303 17.8983 19.1467C18.2819 18.7631 18.7706 18.5019 19.3027 18.396C19.8347 18.2902 20.3862 18.3445 20.8874 18.5521C21.3886 18.7597 21.817 19.1113 22.1184 19.5623C22.4197 20.0134 22.5806 20.5437 22.5806 21.0862C22.5806 21.8136 22.2916 22.5113 21.7773 23.0257C21.2629 23.5401 20.5652 23.829 19.8378 23.829ZM19.8378 20.0302C19.6319 20.0315 19.4311 20.0938 19.2606 20.2092C19.0901 20.3245 18.9576 20.4878 18.8797 20.6783C18.8019 20.8689 18.7822 21.0783 18.8232 21.28C18.8642 21.4817 18.964 21.6668 19.11 21.8119C19.2561 21.9569 19.4418 22.0555 19.6438 22.0952C19.8458 22.1349 20.055 22.1138 20.245 22.0347C20.4351 21.9557 20.5975 21.8221 20.7117 21.6508C20.8259 21.4796 20.8869 21.2783 20.8869 21.0725C20.8869 20.935 20.8597 20.7989 20.8069 20.672C20.7541 20.5451 20.6767 20.4299 20.5792 20.333C20.4817 20.2362 20.366 20.1595 20.2387 20.1075C20.1115 20.0556 19.9752 20.0293 19.8378 20.0302Z"/>
                                    <path d="M19.8375 20.0302H8.41352C7.70608 20.0302 7.02761 19.7491 6.52737 19.2489C6.02713 18.7487 5.74609 18.0702 5.74609 17.3627C5.74609 16.6553 6.02713 15.9768 6.52737 15.4766C7.02761 14.9763 7.70608 14.6953 8.41352 14.6953H10.2307C10.458 14.6953 10.676 14.7856 10.8368 14.9464C10.9975 15.1071 11.0878 15.3251 11.0878 15.5525C11.0878 15.7798 10.9975 15.9978 10.8368 16.1585C10.676 16.3193 10.458 16.4096 10.2307 16.4096H8.41352C8.16073 16.4096 7.9183 16.51 7.73955 16.6888C7.5608 16.8675 7.46038 17.11 7.46038 17.3627C7.46038 17.6155 7.5608 17.858 7.73955 18.0367C7.9183 18.2155 8.16073 18.3159 8.41352 18.3159H19.8375C20.0649 18.3159 20.2829 18.4062 20.4436 18.5669C20.6044 18.7277 20.6947 18.9457 20.6947 19.173C20.6947 19.4004 20.6044 19.6184 20.4436 19.7791C20.2829 19.9399 20.0649 20.0302 19.8375 20.0302Z"/>
                                </svg>
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="#FFFFFF"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path d="M18.8368 16.4092H10.231C9.4479 16.4036 8.68937 16.1348 8.07745 15.6461C7.46554 15.1573 7.03579 14.4769 6.85733 13.7143L5.4859 8.13946C5.35973 7.62182 5.35326 7.08222 5.46699 6.5617C5.58072 6.04119 5.81166 5.55346 6.14223 5.13561C6.4728 4.71777 6.89431 4.38081 7.37469 4.15037C7.85508 3.91992 8.38169 3.80206 8.91447 3.80575H20.2288C20.7615 3.80206 21.2882 3.91992 21.7685 4.15037C22.2489 4.38081 22.6704 4.71777 23.001 5.13561C23.3316 5.55346 23.5625 6.04119 23.6762 6.5617C23.79 7.08222 23.7835 7.62182 23.6573 8.13946L22.2859 13.728C22.1007 14.5001 21.6583 15.1862 21.0315 15.6734C20.4046 16.1607 19.6306 16.4202 18.8368 16.4092Z"/>
                                    <path d="M6.4869 9.60047C6.29107 9.59816 6.10194 9.52886 5.95098 9.4041C5.80003 9.27934 5.69634 9.10664 5.65719 8.91476L4.42976 3.58676C4.31642 3.1014 4.0417 2.66887 3.65057 2.35995C3.25943 2.05103 2.77503 1.884 2.27661 1.88618H1.1589C0.931572 1.88618 0.713555 1.79588 0.552809 1.63513C0.392064 1.47439 0.301758 1.25637 0.301758 1.02904C0.301758 0.801713 0.392064 0.583696 0.552809 0.42295C0.713555 0.262205 0.931572 0.171899 1.1589 0.171899H2.27661C3.16242 0.168804 4.0231 0.466168 4.71807 1.01542C5.41304 1.56467 5.90123 2.33335 6.1029 3.1959L7.32347 8.5239C7.34989 8.63334 7.35431 8.74694 7.33648 8.8581C7.31864 8.96927 7.27891 9.07578 7.21959 9.17147C7.16026 9.26715 7.08252 9.35011 6.99089 9.41551C6.89925 9.48091 6.79553 9.52747 6.68576 9.55247C6.62133 9.57536 6.55468 9.59145 6.4869 9.60047ZM10.3612 23.829C9.8187 23.829 9.2884 23.6682 8.83734 23.3668C8.38628 23.0654 8.03472 22.637 7.82712 22.1358C7.61952 21.6346 7.5652 21.0831 7.67103 20.5511C7.77687 20.019 8.0381 19.5303 8.42169 19.1467C8.80529 18.7631 9.29402 18.5019 9.82608 18.396C10.3581 18.2902 10.9096 18.3445 11.4108 18.5521C11.912 18.7597 12.3404 19.1113 12.6418 19.5623C12.9432 20.0134 13.104 20.5437 13.104 21.0862C13.104 21.8136 12.8151 22.5113 12.3007 23.0257C11.7863 23.5401 11.0886 23.829 10.3612 23.829ZM10.3612 20.0302C10.155 20.0302 9.95353 20.0913 9.78212 20.2058C9.61072 20.3204 9.47713 20.4832 9.39824 20.6736C9.31935 20.8641 9.29871 21.0736 9.33893 21.2758C9.37915 21.478 9.47841 21.6637 9.62418 21.8095C9.76995 21.9552 9.95566 22.0545 10.1578 22.0947C10.36 22.1349 10.5696 22.1143 10.7601 22.0354C10.9505 21.9565 11.1133 21.8229 11.2278 21.6515C11.3423 21.4801 11.4035 21.2786 11.4035 21.0725C11.4035 20.796 11.2937 20.5309 11.0982 20.3355C10.9027 20.14 10.6376 20.0302 10.3612 20.0302ZM19.8378 23.829C19.2953 23.829 18.765 23.6682 18.3139 23.3668C17.8628 23.0654 17.5113 22.637 17.3037 22.1358C17.0961 21.6346 17.0418 21.0831 17.1476 20.5511C17.2534 20.019 17.5147 19.5303 17.8983 19.1467C18.2819 18.7631 18.7706 18.5019 19.3027 18.396C19.8347 18.2902 20.3862 18.3445 20.8874 18.5521C21.3886 18.7597 21.817 19.1113 22.1184 19.5623C22.4197 20.0134 22.5806 20.5437 22.5806 21.0862C22.5806 21.8136 22.2916 22.5113 21.7773 23.0257C21.2629 23.5401 20.5652 23.829 19.8378 23.829ZM19.8378 20.0302C19.6319 20.0315 19.4311 20.0938 19.2606 20.2092C19.0901 20.3245 18.9576 20.4878 18.8797 20.6783C18.8019 20.8689 18.7822 21.0783 18.8232 21.28C18.8642 21.4817 18.964 21.6668 19.11 21.8119C19.2561 21.9569 19.4418 22.0555 19.6438 22.0952C19.8458 22.1349 20.055 22.1138 20.245 22.0347C20.4351 21.9557 20.5975 21.8221 20.7117 21.6508C20.8259 21.4796 20.8869 21.2783 20.8869 21.0725C20.8869 20.935 20.8597 20.7989 20.8069 20.672C20.7541 20.5451 20.6767 20.4299 20.5792 20.333C20.4817 20.2362 20.366 20.1595 20.2387 20.1075C20.1115 20.0556 19.9752 20.0293 19.8378 20.0302Z"/>
                                    <path d="M19.8375 20.0302H8.41352C7.70608 20.0302 7.02761 19.7491 6.52737 19.2489C6.02713 18.7487 5.74609 18.0702 5.74609 17.3627C5.74609 16.6553 6.02713 15.9768 6.52737 15.4766C7.02761 14.9763 7.70608 14.6953 8.41352 14.6953H10.2307C10.458 14.6953 10.676 14.7856 10.8368 14.9464C10.9975 15.1071 11.0878 15.3251 11.0878 15.5525C11.0878 15.7798 10.9975 15.9978 10.8368 16.1585C10.676 16.3193 10.458 16.4096 10.2307 16.4096H8.41352C8.16073 16.4096 7.9183 16.51 7.73955 16.6888C7.5608 16.8675 7.46038 17.11 7.46038 17.3627C7.46038 17.6155 7.5608 17.858 7.73955 18.0367C7.9183 18.2155 8.16073 18.3159 8.41352 18.3159H19.8375C20.0649 18.3159 20.2829 18.4062 20.4436 18.5669C20.6044 18.7277 20.6947 18.9457 20.6947 19.173C20.6947 19.4004 20.6044 19.6184 20.4436 19.7791C20.2829 19.9399 20.0649 20.0302 19.8375 20.0302Z"/>
                                </svg>
                                <?php echo $button_cart; ?>
                            </button>
                        <?php } else { ?>
                            <button class="product--cart-button btn btn-lg btn-outline-secondary"
                                    data-toggle="add-to-cart" data-product-id="<?php echo $product_id; ?>">
                                <?php echo $button_not_available; ?>
                            </button>
                        <?php } ?>
                        <?php if ($quantity > 0) { ?>
                            <div class="product--status"><?php echo $stock; ?></div>
                        <?php } else { ?>
                            <div class="product--status unavailable"><?php echo $stock; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <?php if (!empty($inventory) && $quantity > 0) { ?>
                    <div class="product--content-block product--inventory-block">
                        <div class="product-inventory--heading">
                            <?php echo $text_inventory; ?>&nbsp;(<?php echo $quantity > 6 ? '6+' : $quantity; ?>)
                        </div>
                        <div class="product-inventory--list">
                            <?php foreach ($inventory as $inventory_item) { ?>
                                <div class="product-inventory--item">
                                    <div class="product-inventory--item--location-details">
                                        <p><?php echo $inventory_item['name']; ?></p>
                                        <small><?php echo $inventory_item['address']; ?></small>
                                        <a href="tel:<?php echo $inventory_item['telephone']; ?>">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                                <defs>
                                                    <style>.fa-secondary {
                                                            opacity: .4
                                                        }</style>
                                                </defs>
                                                <path d="M400 32H48A48 48 0 0 0 0 80v352a48 48 0 0 0 48 48h352a48 48 0 0 0 48-48V80a48 48 0 0 0-48-48zm-16.38 307.37l-15 65A15 15 0 0 1 354 416C194 416 64 286.29 64 126a15 15 0 0 1 11.63-14.61l65-15a15 15 0 0 1 17.16 8.7l30 70a15 15 0 0 1-4.29 17.52l-37.89 31A231.94 231.94 0 0 0 256.4 334.39l31-37.89a15 15 0 0 1 17.52-4.29l70 30a15 15 0 0 1 8.7 17.16z"
                                                      class="fa-secondary"/>
                                                <path d="M383.62 339.37l-15 65A15 15 0 0 1 354 416C193.94 416 64 286.29 64 126a15 15 0 0 1 11.63-14.61l65-15a15 15 0 0 1 17.16 8.7l30 70a15 15 0 0 1-4.29 17.52l-37.89 31a231.92 231.92 0 0 0 110.78 110.78l31-37.89a15 15 0 0 1 17.52-4.29l70 30a15 15 0 0 1 8.71 17.16z"
                                                      class="fa-primary"/>
                                            </svg>
                                            <?php echo $inventory_item['telephone']; ?>
                                        </a>
                                    </div>
                                    <div class="product-inventory-item--quantity">
                                        <?php echo $inventory_item['quantity'] > 6 ? '6+' : $inventory_item['quantity']; ?><small><?php echo $text_pcs; ?></small>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>

                <?php if ($products_2) { ?>
                    <div class="product--content-block product--analogues-block">
                        <div class="product--analogues-heading">
                            <div class="product--analogues-title"><?php echo $text_analogues; ?>
                                (<?php echo count($products_2); ?>)
                            </div>
                            <div class="product--analogues-price-range">
                                <?php
                                $min_price = min(array_keys($products_2_prices));
                                $max_price = max(array_keys($products_2_prices));
                                ?>
                                від <b><?php echo $products_2_prices[$min_price]; ?></b>
                                <?php if ($max_price != $min_price) { ?>
                                    до <b><?php echo $products_2_prices[$max_price]; ?></b>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="product--analogues-list" aria-labelledby="analogues-dropdown">
                            <?php foreach ($products_2 as $product) { ?>
                                <?php include DIR_TEMPLATE . 'amitek/template/product/product/product_list_min.tpl'; ?>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>

                <?php if ($quantity == 0) { ?>
                    <div class="product--content-block product--no-stock-block">
                        <div class="product--no-stock-left" style="margin-right: 20px;">
                            <div class="product--no-stock-title"><?php echo $text_no_stock_title; ?></div>
                            <div class="product--no-stock-content"><?php echo $text_no_stock_description; ?></div>
                        </div>
                        <a class="product--no-stock-button" role="button" href="tel:<?php echo $telephone; ?>">
                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512">
                                <path d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z"></path>
                            </svg>
                        </a>
                    </div>
                <?php } ?>

                <div class="product--content-column-right">
                    <?php if (!$products_2) echo $column_right; ?>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="product-tabs">
            <?php
            $showDescription = !$products_2 && !$products;
            $showAnalogues = $products_2;
            $showRelated = !$showDescription && !$showAnalogues && $products;
            ?>
            <div class="product-tabs--header">
                <ul>
                    <li class="<?php echo $showDescription ? 'active' : ''; ?>" role="tab" data-toggle="collapse"
                        data-target="#tab-description">
                        <?php echo $tab_description; ?>
                    </li>
                    <li class="<?php echo $showAnalogues ? 'active' : ''; ?>" role="tab" data-toggle="collapse"
                        data-target="#tab-analogues">
                        <?php echo $text_analogues; ?> <span class="badge"><?php echo count($products_2); ?></span>
                    </li>
                    <li class="<?php echo $showRelated ? 'active' : ''; ?>" role="tab" data-toggle="collapse"
                        data-target="#tab-related">
                        <?php echo $text_related; ?> <span class="badge"><?php echo count($products); ?></span>
                    </li>
                </ul>
            </div>
            <div class="product-tab--content">
                <div class="tab-pane collapse <?php echo $showDescription ? 'show' : ''; ?>" id="tab-description">
                    <div class="product-description">
                        <?php if (!empty($description)) { ?>
                            <div class="product-description--content">
                                <?php echo $description; ?>
                            </div>
                        <?php } else { ?>
                            <div class="product-description--content">
                                <?php echo $text_no_description; ?>
                            </div>
                        <?php } ?>
                    </div>
                </div>

                <div class="tab-pane collapse <?php echo $showAnalogues ? 'show' : ''; ?>" id="tab-analogues">
                    <div id="product-analogues">
                        <div class="module-container_content">
                            <div class="module-products--container products-container--scrollable-x">
                                <?php
                                if ($products_2) {
                                    foreach ($products_2 as $product) {
                                        include DIR_TEMPLATE . 'amitek/template/product/product/product_card.tpl';
                                    }
                                } else {
                                    echo $text_no_analogues;
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane collapse <?php echo $showRelated ? 'show' : ''; ?>" id="tab-related">
                    <div id="product-related">
                        <div class="module-container_content">
                            <div class="module-products--container products-container--scrollable-x">
                                <?php
                                if ($products) {
                                    foreach ($products as $product) {
                                        include DIR_TEMPLATE . 'amitek/template/product/product/product_card.tpl';
                                    }
                                } else {
                                    echo $text_no_related;
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-block d-lg-none">
            <?php if ($products_2) echo $column_right; ?>
        </div>

        <div class="d-none d-lg-block">
            <?php if ($products_2) echo $column_right; ?>
        </div>

        <?php echo $content_bottom; ?>
    </div>

<?php echo $footer; ?>