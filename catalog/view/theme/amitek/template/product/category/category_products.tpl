<div class="search-nav">
    <div class="search-nav--left">
        <?php if ($filter_ocfilter) { ?>
            <div class="search-total"><?php echo $text_total; ?></div>
        <?php } ?>
    </div>

    <div class="search-nav--right">

        <?php if ($products_view == 'list') { ?>
            <button class="btn btn-outline-secondary search-nav--filter-button" data-toggle="offcanvas">
                <span class="d-none d-lg-inline"><?php echo $text_filter; ?></span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="d-block d-lg-none"><defs><style>.fa-secondary{opacity:.4}</style></defs><path d="M480 384H352C334.327 384 320 398.327 320 416V416C320 433.673 334.327 448 352 448H480C497.673 448 512 433.673 512 416V416C512 398.327 497.673 384 480 384ZM480 224H352C334.327 224 320 238.327 320 256V256C320 273.673 334.327 288 352 288H480C497.673 288 512 273.673 512 256V256C512 238.327 497.673 224 480 224ZM480 64H448C430.327 64 416 78.327 416 96V96C416 113.673 430.327 128 448 128H480C497.673 128 512 113.673 512 96V96C512 78.327 497.673 64 480 64Z" class="fa-secondary"/><path d="M346.93 99.877L224 244.635V429.986C224 444.625 207.523 453.016 195.687 444.73L135.689 402.742C130.859 399.379 128 393.871 128 388V244.635L5.07 99.877C-6.85 85.5 3.582 64 22.482 64H329.518C348.416 64 358.85 85.5 346.93 99.877Z" class="fa-primary"/></svg>
            </button>
        <?php } ?>

        <div class="btn-group search-nav--sort-button">
            <button class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown">
                <span class="d-none d-lg-inline"><?php echo $text_sort; ?></span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" class="d-block d-lg-none"><defs><style>.fa-secondary{opacity:.4}</style></defs><path d="M292.342 288H27.658C3.055 288 -9.229 317.773 8.119 335.121L140.582 471.891C145.934 477.297 152.973 480 160.027 480C167.08 480 174.146 477.297 179.553 471.891L311.881 335.121C329.229 317.773 316.945 288 292.342 288Z" class="fa-secondary"/><path d="M27.658 224H292.342C316.945 224 329.229 194.225 311.881 176.877L179.553 40.107C174.146 34.701 167.08 32 160.027 32C152.973 32 145.934 34.701 140.582 40.107L8.119 176.877C-9.229 194.225 3.055 224 27.658 224Z" class="fa-primary"/></svg>
            </button>
            <ul class="dropdown-menu">
                <?php foreach ($sorts as $sorts) { ?>
                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <li class="active"
                            onclick="location = '<?php echo $sorts['href']; ?>';"><?php echo $sorts['text']; ?></li>
                    <?php } else { ?>
                        <li onclick="location = '<?php echo $sorts['href']; ?>';"><?php echo $sorts['text']; ?></li>
                    <?php } ?>
                <?php } ?>
            </ul>
        </div>

        <div class="btn-group search-nav--view-group">

            <div data-toggle="toggle-search-view" data-view="list"
                 class="search-nav--view-button btn <?php echo($products_view == 'list' ? 'btn-secondary' : 'btn-outline-secondary'); ?>">
                <?php if ($products_view == 'list') { ?>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                        <!-- Font Awesome Pro 6.0.0-alpha2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) -->
                        <path d="M416 224H32C14.327 224 0 238.327 0 256V256C0 273.673 14.327 288 32 288H416C433.673 288 448 273.673 448 256V256C448 238.327 433.673 224 416 224ZM416 384H32C14.327 384 0 398.327 0 416V416C0 433.673 14.327 448 32 448H416C433.673 448 448 433.673 448 416V416C448 398.327 433.673 384 416 384ZM416 64H32C14.327 64 0 78.327 0 96V96C0 113.673 14.327 128 32 128H416C433.673 128 448 113.673 448 96V96C448 78.327 433.673 64 416 64Z"/>
                    </svg>
                <?php } else { ?>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                        <!-- Font Awesome Pro 6.0.0-alpha2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) -->
                        <defs>
                            <style>.fa-secondary {
                                    opacity: .4
                                }</style>
                        </defs>
                        <path d="M448 256V256C448 273.673 433.673 288 416 288H32C14.327 288 0 273.673 0 256V256C0 238.327 14.327 224 32 224H416C433.673 224 448 238.327 448 256Z"
                              class="fa-secondary"/>
                        <path d="M416 384H32C14.327 384 0 398.327 0 416V416C0 433.673 14.327 448 32 448H416C433.673 448 448 433.673 448 416V416C448 398.327 433.673 384 416 384ZM416 64H32C14.327 64 0 78.327 0 96V96C0 113.673 14.327 128 32 128H416C433.673 128 448 113.673 448 96V96C448 78.327 433.673 64 416 64Z"
                              class="fa-primary"/>
                    </svg>                <?php } ?>
            </div>
            <div data-toggle="toggle-search-view" data-view="list_2"
                 class="search-nav--view-button btn <?php echo($products_view == 'list_2' ? 'btn-secondary' : 'btn-outline-secondary'); ?>">
                <?php if ($products_view == 'list_2') { ?>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <!-- Font Awesome Pro 6.0.0-alpha2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) -->
                        <path d="M80 48H16C7.156 48 0 55.156 0 64V128C0 136.844 7.156 144 16 144H80C88.844 144 96 136.844 96 128V64C96 55.156 88.844 48 80 48ZM80 208H16C7.156 208 0 215.156 0 224V288C0 296.844 7.156 304 16 304H80C88.844 304 96 296.844 96 288V224C96 215.156 88.844 208 80 208ZM80 368H16C7.156 368 0 375.156 0 384V448C0 456.844 7.156 464 16 464H80C88.844 464 96 456.844 96 448V384C96 375.156 88.844 368 80 368ZM192 128H480C497.674 128 512 113.674 512 96S497.674 64 480 64H192C174.326 64 160 78.326 160 96S174.326 128 192 128ZM480 384H192C174.326 384 160 398.326 160 416S174.326 448 192 448H480C497.674 448 512 433.674 512 416S497.674 384 480 384ZM480 224H192C174.326 224 160 238.326 160 256S174.326 288 192 288H480C497.674 288 512 273.674 512 256S497.674 224 480 224Z"/>
                    </svg>
                <?php } else { ?>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <!-- Font Awesome Pro 6.0.0-alpha2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) -->
                        <defs>
                            <style>.fa-secondary {
                                    opacity: .4
                                }</style>
                        </defs>
                        <path d="M192 128H480C497.674 128 512 113.674 512 96S497.674 64 480 64H192C174.326 64 160 78.326 160 96S174.326 128 192 128ZM480 384H192C174.326 384 160 398.326 160 416S174.326 448 192 448H480C497.674 448 512 433.674 512 416S497.674 384 480 384ZM480 224H192C174.326 224 160 238.326 160 256S174.326 288 192 288H480C497.674 288 512 273.674 512 256S497.674 224 480 224Z"
                              class="fa-secondary"/>
                        <path d="M80 48H16C7.156 48 0 55.156 0 64V128C0 136.844 7.156 144 16 144H80C88.844 144 96 136.844 96 128V64C96 55.156 88.844 48 80 48ZM80 208H16C7.156 208 0 215.156 0 224V288C0 296.844 7.156 304 16 304H80C88.844 304 96 296.844 96 288V224C96 215.156 88.844 208 80 208ZM80 368H16C7.156 368 0 375.156 0 384V448C0 456.844 7.156 464 16 464H80C88.844 464 96 456.844 96 448V384C96 375.156 88.844 368 80 368Z"
                              class="fa-primary"/>
                    </svg>
                <?php } ?>
            </div>
            <div data-toggle="toggle-search-view" data-view="grid"
                 class="search-nav--view-button btn <?php echo($products_view == 'grid' ? 'btn-secondary' : 'btn-outline-secondary'); ?>">
                <?php if ($products_view == 'grid') { ?>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <!-- Font Awesome Pro 6.0.0-alpha2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) -->
                        <path d="M96 0H32C14.326 0 0 14.326 0 32V96C0 113.674 14.326 128 32 128H96C113.674 128 128 113.674 128 96V32C128 14.326 113.674 0 96 0ZM288 0H224C206.326 0 192 14.326 192 32V96C192 113.674 206.326 128 224 128H288C305.674 128 320 113.674 320 96V32C320 14.326 305.674 0 288 0ZM480 0H416C398.326 0 384 14.326 384 32V96C384 113.674 398.326 128 416 128H480C497.674 128 512 113.674 512 96V32C512 14.326 497.674 0 480 0ZM96 384H32C14.326 384 0 398.326 0 416V480C0 497.674 14.326 512 32 512H96C113.674 512 128 497.674 128 480V416C128 398.326 113.674 384 96 384ZM288 384H224C206.326 384 192 398.326 192 416V480C192 497.674 206.326 512 224 512H288C305.674 512 320 497.674 320 480V416C320 398.326 305.674 384 288 384ZM480 384H416C398.326 384 384 398.326 384 416V480C384 497.674 398.326 512 416 512H480C497.674 512 512 497.674 512 480V416C512 398.326 497.674 384 480 384ZM96 192H32C14.326 192 0 206.326 0 224V288C0 305.674 14.326 320 32 320H96C113.674 320 128 305.674 128 288V224C128 206.326 113.674 192 96 192ZM288 192H224C206.326 192 192 206.326 192 224V288C192 305.674 206.326 320 224 320H288C305.674 320 320 305.674 320 288V224C320 206.326 305.674 192 288 192ZM480 192H416C398.326 192 384 206.326 384 224V288C384 305.674 398.326 320 416 320H480C497.674 320 512 305.674 512 288V224C512 206.326 497.674 192 480 192Z"/>
                    </svg>
                <?php } else { ?>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <!-- Font Awesome Pro 6.0.0-alpha2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) -->
                        <defs>
                            <style>.fa-secondary {
                                    opacity: .4
                                }</style>
                        </defs>
                        <path d="M288 0H224C206.326 0 192 14.326 192 32V96C192 113.674 206.326 128 224 128H288C305.674 128 320 113.674 320 96V32C320 14.326 305.674 0 288 0ZM288 384H224C206.326 384 192 398.326 192 416V480C192 497.674 206.326 512 224 512H288C305.674 512 320 497.674 320 480V416C320 398.326 305.674 384 288 384ZM96 192H32C14.326 192 0 206.326 0 224V288C0 305.674 14.326 320 32 320H96C113.674 320 128 305.674 128 288V224C128 206.326 113.674 192 96 192ZM480 192H416C398.326 192 384 206.326 384 224V288C384 305.674 398.326 320 416 320H480C497.674 320 512 305.674 512 288V224C512 206.326 497.674 192 480 192Z"
                              class="fa-secondary"/>
                        <path d="M96 0H32C14.326 0 0 14.326 0 32V96C0 113.674 14.326 128 32 128H96C113.674 128 128 113.674 128 96V32C128 14.326 113.674 0 96 0ZM480 0H416C398.326 0 384 14.326 384 32V96C384 113.674 398.326 128 416 128H480C497.674 128 512 113.674 512 96V32C512 14.326 497.674 0 480 0ZM96 384H32C14.326 384 0 398.326 0 416V480C0 497.674 14.326 512 32 512H96C113.674 512 128 497.674 128 480V416C128 398.326 113.674 384 96 384ZM480 384H416C398.326 384 384 398.326 384 416V480C384 497.674 398.326 512 416 512H480C497.674 512 512 497.674 512 480V416C512 398.326 497.674 384 480 384ZM288 192H224C206.326 192 192 206.326 192 224V288C192 305.674 206.326 320 224 320H288C305.674 320 320 305.674 320 288V224C320 206.326 305.674 192 288 192Z"
                              class="fa-primary"/>
                    </svg>
                <?php } ?>
            </div>
        </div>
    </div>
</div>

<div class="search-page">

    <?php if ($column_left) { ?>
        <div class="search-filters <?php if ($products_view === 'list') { echo 'search-filters--collapsed'; } ?>">
            <?php echo $column_left; ?>
        </div>
    <?php } ?>

    <div class="search-content <?php echo($column_left ? 'search-content_margin-left' : ''); ?>">

        <?php if ($products) { ?>
            <div class="search-content--products-grid <?php if ($products_view == 'list') { echo 'search-content--products-grid--compressed'; } ?>">
                <?php foreach ($products as $product) { ?>
                    <?php if ($products_view == 'list') { ?>
                        <?php include DIR_TEMPLATE . 'amitek/template/product/product/product_list_min.tpl'; ?>
                    <?php } elseif ($products_view == 'list_2') { ?>
                        <?php include DIR_TEMPLATE . 'amitek/template/product/product/product_list.tpl'; ?>
                    <?php } else { ?>
                        <?php include DIR_TEMPLATE . 'amitek/template/product/product/product_card.tpl'; ?>
                    <?php } ?>
                <?php } ?>
            </div>
        <?php } else { ?>
            <div class="search-content--no-products-banner">
                <h2><?php echo $text_no_search_results_title; ?></h2>
                <p><?php echo $text_no_search_results_subtitle; ?></p>
            </div>
        <?php } ?>

        <div class="clearfix"></div>

        <?php if ($pagination) { ?>
            <div class="pagination-block">
                <button class="btn btn-primary" data-toggle="products-load-more"
                        data-loading-text="<span class='loading-icon'></span>">
                        <span>
                            <?php echo $button_more; ?>
                            <svg xmlns="http://www.w3.org/2000/svg" width="13" height="12" viewBox="0 0 13 12">
                                <path d="M6.5 1.5C6.77614 1.5 7 1.72386 7 2V8.79289L9.64645 6.14645C9.84171 5.95118 10.1583 5.95118 10.3536 6.14645C10.5488 6.34171 10.5488 6.65829 10.3536 6.85355L6.85355 10.3536C6.65829 10.5488 6.34171 10.5488 6.14645 10.3536L2.64645 6.85355C2.45118 6.65829 2.45118 6.34171 2.64645 6.14645C2.84171 5.95118 3.15829 5.95118 3.35355 6.14645L6 8.79289V2C6 1.72386 6.22386 1.5 6.5 1.5Z"></path>
                            </svg>
                        </span>
                </button>

                <?php echo $pagination; ?>
            </div>
        <?php } ?>

    </div>

</div>

<div class="clearfix"></div>

<?php echo $content_bottom; ?>

<div id="ocfilter_ajax" class="hidden"></div>
