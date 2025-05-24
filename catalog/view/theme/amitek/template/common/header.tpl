<?php

/**
 * @var string $title
 * @var string $description
 * @var string $keywords
 * @var string $logo
 * @var string $direction
 * @var string $lang
 * @var string $noindex
 * @var string $base
 * @var string $og_url
 * @var string $og_image
 * @var string $name
 * @var array $styles
 * @var array $scripts
 * @var array $links
 * @var array $hreflangs
 * @var integer $total_wishlist
 * @var string $home
 * @var array $informations
 * @var array $open
 * @var string $phone
 * @var string $fax
 * @var string $language
 * @var string $search
 * @var boolean $logged
 * @var string $account
 * @var string $wishlist
 * @var string $cart
 * @var string $checkout
 * @var string $text_account
 * @var string $text_login
 * @var string $text_category
 * @var string $text_shopping_cart
 * @var string $text_wishlist
 * @var string $analytics
 * @var string $ajax_auth
 * @var integer $total_products
 */

?>
<!DOCTYPE html>

<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title;  ?></title>

    <?php if ($noindex) { ?>
    <!-- OCFilter Start -->
    <meta name="robots" content="noindex,nofollow"/>
    <!-- OCFilter End -->
    <?php } ?>

    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <meta property="og:description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta property="og:title" content="<?php echo $title; ?>"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="<?php echo $og_url; ?>"/>
    <?php if ($og_image) { ?>
    <meta property="og:image" content="<?php echo $og_image; ?>"/>
    <?php } else { ?>
    <meta property="og:image" content="<?php echo $logo; ?>"/>
    <?php } ?>
    <meta property="og:site_name" content="<?php echo $name; ?>"/>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preload" as="style" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" onload="this.onload=null;this.rel='stylesheet'">

    <link rel="stylesheet" href="assets/amitek/styles/main.css">

    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>

    <?php foreach ($hreflangs as $hreflang) { ?>
        <link rel="alternate" hreflang="<?php echo $hreflang['hreflang']; ?>" href="<?php echo $hreflang['href']; ?>">
    <?php } ?>

    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
</head>

<body>
<?php echo $cart; ?>

<?php echo $ajax_auth; ?>

<!-- Header Mobile -->
<div class="header-mobile">
    <div class="header-mobile--menu-button" data-toggle="mobile-menu">
        <svg width="30" height="30" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 6H26V8H0V6Z" fill="#FFB500"></path>
            <path d="M0 12H26V14H0V12Z" fill="#FFB500"></path>
            <path d="M0 18H26V20H0V18Z" fill="#FFB500"></path>
        </svg>
    </div>
    <div class="header-mobile--links">
        <a href="<?php echo $checkout; ?>"
           class="header-mobile--links-item <?php echo ($total_products ? 'active' : ''); ?>" data-toggle="cart">
            <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M2.5 4.25C2.5 3.83579 2.83579 3.5 3.25 3.5H3.80826C4.75873 3.5 5.32782 4.13899 5.65325 4.73299C5.87016 5.12894 6.02708 5.58818 6.14982 6.00395C6.18306 6.00134 6.21674 6 6.2508 6H18.7481C19.5783 6 20.1778 6.79442 19.9502 7.5928L18.1224 14.0019C17.7856 15.1832 16.7062 15.9978 15.4779 15.9978H9.52977C8.29128 15.9978 7.2056 15.1699 6.87783 13.9756L6.11734 11.2045L4.85874 6.95578L4.8567 6.94834C4.701 6.38051 4.55487 5.85005 4.33773 5.4537C4.12686 5.0688 3.95877 5 3.80826 5H3.25C2.83579 5 2.5 4.66421 2.5 4.25ZM7.57283 10.8403L8.32434 13.5786C8.47333 14.1215 8.96682 14.4978 9.52977 14.4978H15.4779C16.0362 14.4978 16.5268 14.1275 16.68 13.5906L18.4168 7.5H6.58549L7.55906 10.7868C7.56434 10.8046 7.56892 10.8224 7.57283 10.8403ZM11 19C11 20.1046 10.1046 21 9 21C7.89543 21 7 20.1046 7 19C7 17.8954 7.89543 17 9 17C10.1046 17 11 17.8954 11 19ZM9.5 19C9.5 18.7239 9.27614 18.5 9 18.5C8.72386 18.5 8.5 18.7239 8.5 19C8.5 19.2761 8.72386 19.5 9 19.5C9.27614 19.5 9.5 19.2761 9.5 19ZM18 19C18 20.1046 17.1046 21 16 21C14.8954 21 14 20.1046 14 19C14 17.8954 14.8954 17 16 17C17.1046 17 18 17.8954 18 19ZM16.5 19C16.5 18.7239 16.2761 18.5 16 18.5C15.7239 18.5 15.5 18.7239 15.5 19C15.5 19.2761 15.7239 19.5 16 19.5C16.2761 19.5 16.5 19.2761 16.5 19Z"></path>
            </svg>
            <span class="header-mobile--links-badge"><?php echo $total_products; ?></span>
        </a>
        <?php if ($wishlist_enabled = false) { ?>
        <a href="<?php echo $wishlist; ?>"
           class="header-mobile--links-item header-wishlist_btn <?php echo ($total_wishlist ? 'active' : ''); ?>">
            <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g>
                    <path
                          d="M12.8197 5.57959L11.999 6.4021L11.1757 5.57885C9.07663 3.47978 5.67337 3.47978 3.5743 5.57885C1.47523 7.67792 1.47523 11.0812 3.5743 13.1802L11.4697 21.0756C11.7626 21.3685 12.2374 21.3685 12.5303 21.0756L20.4318 13.1788C22.5262 11.0728 22.5298 7.67904 20.4303 5.57959C18.3274 3.4767 14.9226 3.47671 12.8197 5.57959ZM19.3682 12.1211L12 19.4846L4.63496 12.1196C3.12168 10.6063 3.12168 8.15279 4.63496 6.63951C6.14824 5.12623 8.60176 5.12623 10.115 6.63951L11.4725 7.99695C11.7703 8.29482 12.255 8.28901 12.5457 7.9841L13.8803 6.64025C15.3974 5.12315 17.8526 5.12315 19.3697 6.64025C20.8833 8.1539 20.8807 10.6001 19.3682 12.1211Z"
                          fill="#FFB500"></path>
                </g>
            </svg>
            <span class="header-mobile--links-item-count"><?php echo $total_wishlist; ?></span>
        </a>
        <?php } ?>
        <a href="#" class="header-mobile--links-item active" data-toggle="mobile-search">
            <svg width="30" height="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g id="Search">
                    <path
                          d="M10 2.75C14.0041 2.75 17.25 5.99594 17.25 10C17.25 11.7319 16.6427 13.3219 15.6295 14.5688L20.5303 19.4697C20.8232 19.7626 20.8232 20.2374 20.5303 20.5303C20.2641 20.7966 19.8474 20.8208 19.5538 20.6029L19.4697 20.5303L14.5688 15.6295C13.3219 16.6427 11.7319 17.25 10 17.25C5.99594 17.25 2.75 14.0041 2.75 10C2.75 5.99594 5.99594 2.75 10 2.75ZM10 4.25C6.82436 4.25 4.25 6.82436 4.25 10C4.25 13.1756 6.82436 15.75 10 15.75C13.1756 15.75 15.75 13.1756 15.75 10C15.75 6.82436 13.1756 4.25 10 4.25Z"
                          fill="#FFB500"></path>
                </g>
            </svg>
        </a>
    </div>

    <?php if ($home == $og_url) { ?>
    <div class="header-mobile--logo">
        <img src="assets/amitek/images/header-logo.svg" title="<?php echo $name; ?>" alt="<?php echo $name; ?>">
    </div>
    <?php } else { ?>
    <a href="<?php echo $home; ?>" class="header-mobile--logo">
        <img src="assets/amitek/images/header-logo.svg" title="<?php echo $name; ?>" alt="<?php echo $name; ?>">
    </a>
    <?php } ?>
    <div class="clearfix"></div>

    <form id="search_mobile" class="header-mobile--search">
        <input type="text" name="search" class="mobile-search--input" value="" placeholder="Я шукаю..."
               autocomplete="off">

        <button class="mobile-search--button" type="submit">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M10 2.75C14.0041 2.75 17.25 5.99594 17.25 10C17.25 11.7319 16.6427 13.3219 15.6295 14.5688L20.5303 19.4697C20.8232 19.7626 20.8232 20.2374 20.5303 20.5303C20.2641 20.7966 19.8474 20.8208 19.5538 20.6029L19.4697 20.5303L14.5688 15.6295C13.3219 16.6427 11.7319 17.25 10 17.25C5.99594 17.25 2.75 14.0041 2.75 10C2.75 5.99594 5.99594 2.75 10 2.75ZM10 4.25C6.82436 4.25 4.25 6.82436 4.25 10C4.25 13.1756 6.82436 15.75 10 15.75C13.1756 15.75 15.75 13.1756 15.75 10C15.75 6.82436 13.1756 4.25 10 4.25Z" fill="#828282"></path>
            </svg>
        </button>
    </form>
</div>

<!-- Mobile Menu -->
<?php include DIR_TEMPLATE . 'amitek/template/common/menu_mobile.tpl'; ?>

<!-- Header Start -->
<header class="header">
    <div class="header--top-line">
        <div class="container mx-auto d-flex justify-content-center">
            <div class="header-logo">
                <?php if ($home == $og_url) { ?>
                <div>
                    <img src="assets/amitek/images/header-logo.svg" title="<?php echo $name; ?>"
                         alt="<?php echo $name; ?>">
                </div>
                <?php } else { ?>
                <a href="<?php echo $home; ?>">
                    <img src="assets/amitek/images/header-logo.svg" title="<?php echo $name; ?>"
                         alt="<?php echo $name; ?>">
                </a>
                <?php } ?>
            </div>
            <div class="header-content">
                <div class="header-nav-links">
                    <?php foreach($informations as $information){ ?>
                    <a href="<?php echo $information['href']; ?>"
                       class="header-nav-links--item"><?php echo $information['title']; ?></a>
                    <?php } ?>
                </div>

                <div class="header-working-hours">
                    <?php foreach($open as $item){ ?>
                    <div class="header-working-hours--item"><?php echo $item; ?></div>
                    <?php } ?>
                </div>

                <div class="header-phones">
                    <?php if(!empty($telephone)){ ?>
                    <a href="tel:<?php echo preg_replace('~\D+~','', $telephone); ?>"
                       class="header-phones--item"><?php echo $telephone; ?></a>
                    <?php } ?>
                    <?php if(!empty($fax)){ ?>
                    <a href="tel:<?php echo preg_replace('~\D+~','', $fax); ?>"
                       class="header-phones--item"><?php echo $fax; ?></a>
                    <?php } ?>
                </div>

                <?php echo $language; ?>
            </div>
        </div>
    </div>
</header>
<header class="header header--sticky">
    <div class="header--bottom-line">

        <div class="container mx-auto d-flex justify-content-center position-relative">
            <div class="header-menu">
                <button class="header-menu--button btn btn-secondary">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_155_9461)">
                            <path d="M13 21V11H21V21H13ZM3 13V3H11V13H3ZM9 11V5H5V11H9ZM3 21V15H11V21H3ZM5 19H9V17H5V19ZM15 19H19V13H15V19ZM13 3H21V9H13V3ZM15 5V7H19V5H15Z" fill="#FFB500"/>
                        </g>
                        <defs>
                            <clipPath id="clip0_155_9461">
                                <rect width="24" height="24" fill="white"/>
                            </clipPath>
                        </defs>
                    </svg>
                    <span><?php echo $text_category; ?></span>
                </button>

                <?php include DIR_TEMPLATE . 'amitek/template/common/menu.tpl'; ?>
            </div>

            <?php echo $search; ?>

            <div class="header-links">

                <a href="<?php echo $checkout; ?>"
                   class="header-links--item <?php echo ($total_products ? 'active' : ''); ?>" data-toggle="cart">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                         xmlns="http://www.w3.org/2000/svg">
                        <g>
                            <path
                                  d="M2.5 4.25C2.5 3.83579 2.83579 3.5 3.25 3.5H3.80826C4.75873 3.5 5.32782 4.13899 5.65325 4.73299C5.87016 5.12894 6.02708 5.58818 6.14982 6.00395C6.18306 6.00134 6.21674 6 6.2508 6H18.7481C19.5783 6 20.1778 6.79442 19.9502 7.5928L18.1224 14.0019C17.7856 15.1832 16.7062 15.9978 15.4779 15.9978H9.52977C8.29128 15.9978 7.2056 15.1699 6.87783 13.9756L6.11734 11.2045L4.85874 6.95578L4.8567 6.94834C4.701 6.38051 4.55487 5.85005 4.33773 5.4537C4.12686 5.0688 3.95877 5 3.80826 5H3.25C2.83579 5 2.5 4.66421 2.5 4.25ZM7.57283 10.8403L8.32434 13.5786C8.47333 14.1215 8.96682 14.4978 9.52977 14.4978H15.4779C16.0362 14.4978 16.5268 14.1275 16.68 13.5906L18.4168 7.5H6.58549L7.55906 10.7868C7.56434 10.8046 7.56892 10.8224 7.57283 10.8403ZM11 19C11 20.1046 10.1046 21 9 21C7.89543 21 7 20.1046 7 19C7 17.8954 7.89543 17 9 17C10.1046 17 11 17.8954 11 19ZM9.5 19C9.5 18.7239 9.27614 18.5 9 18.5C8.72386 18.5 8.5 18.7239 8.5 19C8.5 19.2761 8.72386 19.5 9 19.5C9.27614 19.5 9.5 19.2761 9.5 19ZM18 19C18 20.1046 17.1046 21 16 21C14.8954 21 14 20.1046 14 19C14 17.8954 14.8954 17 16 17C17.1046 17 18 17.8954 18 19ZM16.5 19C16.5 18.7239 16.2761 18.5 16 18.5C15.7239 18.5 15.5 18.7239 15.5 19C15.5 19.2761 15.7239 19.5 16 19.5C16.2761 19.5 16.5 19.2761 16.5 19Z"
                                  fill="#0f172a"></path>
                        </g>
                    </svg>
                    <span class="header-links--item-text"><?php echo $text_shopping_cart; ?></span>
                    <?php if ($total_products) { ?>
                    <span class="header-links--item-badge"><?php echo $total_products; ?></span>
                    <?php } ?>
                </a>
                <?php if ($wishlist_enabled = false) { ?>
                <a href="<?php echo $wishlist; ?>"
                   class="header-links--item header-wishlist_btn <?php echo ($total_wishlist ? 'active' : ''); ?>">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                         xmlns="http://www.w3.org/2000/svg">
                        <g>
                            <path
                                  d="M12.8197 5.57959L11.999 6.4021L11.1757 5.57885C9.07663 3.47978 5.67337 3.47978 3.5743 5.57885C1.47523 7.67792 1.47523 11.0812 3.5743 13.1802L11.4697 21.0756C11.7626 21.3685 12.2374 21.3685 12.5303 21.0756L20.4318 13.1788C22.5262 11.0728 22.5298 7.67904 20.4303 5.57959C18.3274 3.4767 14.9226 3.47671 12.8197 5.57959ZM19.3682 12.1211L12 19.4846L4.63496 12.1196C3.12168 10.6063 3.12168 8.15279 4.63496 6.63951C6.14824 5.12623 8.60176 5.12623 10.115 6.63951L11.4725 7.99695C11.7703 8.29482 12.255 8.28901 12.5457 7.9841L13.8803 6.64025C15.3974 5.12315 17.8526 5.12315 19.3697 6.64025C20.8833 8.1539 20.8807 10.6001 19.3682 12.1211Z"
                                  fill="#0f172a"></path>
                        </g>
                    </svg>
                    <span class="header-links--item-text"><?php echo $text_wishlist; ?></span>
                    <span class="header-links--item-badge"><?php echo $total_wishlist; ?></span>
                </a>
                <?php } ?>
                <a role="button" <?php echo ($logged ? 'href="' . $account . '"' : ''); ?> <?php echo (!$logged ? 'data-bs-toggle="modal" data-bs-target="#auth-modal"' : ''); ?>
                class="header-links--item active">
                <svg class="header-links--item-img" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                     fill="none">
                    <path fill="#0f172a"
                          d="M17.755 14a2.249 2.249 0 0 1 2.248 2.249v.575c0 .894-.32 1.76-.9 2.439C17.532 21.096 15.145 22 12 22s-5.532-.905-7.098-2.74a3.75 3.75 0 0 1-.898-2.434v-.578a2.249 2.249 0 0 1 2.249-2.25h11.502Zm0 1.5H6.252a.749.749 0 0 0-.75.749v.578c0 .535.192 1.053.54 1.46 1.253 1.468 3.22 2.214 5.957 2.214 2.739 0 4.706-.746 5.963-2.214a2.25 2.25 0 0 0 .54-1.463v-.575a.749.749 0 0 0-.748-.75ZM12 2.005a5 5 0 1 1 0 10 5 5 0 0 1 0-10Zm0 1.5a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7Z"/>
                </svg>
                <span class="header-links--item-text"><?php echo ($logged ? $text_account : $text_login); ?></span>
                </a>

            </div>
        </div>

    </div>
</header>
<!-- Header End -->

<main class="main">
