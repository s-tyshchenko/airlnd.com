<?php if ($options || $show_price) { ?>
    <div class="ocf-offcanvas ocfilter-mobile <?php echo !$show_mobile ? "d-lg-none" : ""; ?>">
        <div class="ocfilter-mobile-handle">
            <button type="button" class="btn btn-primary" data-toggle="offcanvas">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 640 512"><defs><style>.fa-secondary{opacity:.4}</style></defs><path d="M172.533 96H28.613C4.561 96 -8.719 123.365 6.453 141.662L160 326.822V400C160 407.828 163.813 415.172 170.25 419.656L250.25 475.641C266.031 486.688 288 475.5 288 455.984V326.822L320 288.234V274.363L173.82 98.088C173.285 97.441 173.039 96.662 172.533 96Z" class="fa-secondary"/><path d="M611.387 32H220.613C196.561 32 183.281 59.365 198.453 77.662L352 262.822V368C352 375.828 355.813 383.172 362.25 387.656L442.25 443.641C458.031 454.688 480 443.5 480 423.984V262.822L633.547 77.662C648.719 59.365 635.438 32 611.387 32Z" class="fa-primary"/></svg>
            </button>
        </div>
        <div class="ocf-offcanvas-body"></div>
    </div>

    <div class="panel ocfilter panel-default" id="ocfilter">
        <div class="d-none" id="ocfilter-button">
            <button class="btn btn-primary disabled"
                    data-loading-text="<i class='fa fa-refresh fa-spin'></i> Загрузка.."></button>
        </div>
        <div class="list-group">
            <div class="ocfilter_selected">
                <?php include 'selected_filter.tpl'; ?>
            </div>

            <?php include 'filter_price.tpl'; ?>

            <?php include 'filter_list.tpl'; ?>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            $('body').append($('.ocfilter-mobile').remove().get(0).outerHTML);

            var options = {
                mobile: $('.ocfilter-mobile').is(':visible'),
                php: {
                    searchButton: <?php echo $search_button; ?>,
                    showPrice: <?php echo $show_price; ?>,
                    showCounter: <?php echo $show_counter; ?>,
                    manualPrice: <?php echo $manual_price; ?>,
                    link: '<?php echo $link; ?>',
                    path: '<?php echo $path; ?>',
                    params: '<?php echo $params; ?>',
                    index: '<?php echo $index; ?>'
                },
                text: {
                    show_all: '<?php echo $text_show_all; ?>',
                    hide: '<?php echo $text_hide; ?>',
                    load: '<?php echo $text_load; ?>',
                    any: '<?php echo $text_any; ?>',
                    select: '<?php echo $button_select; ?>'
                }
            };

            if (options.mobile) {
                $('.ocf-offcanvas-body').html($('#ocfilter').remove().get(0).outerHTML);
            }

            $('[data-toggle="offcanvas"]').on('click', function (e) {
                $(this).toggleClass('active');
                $('body').toggleClass('modal-open');
                $('.ocfilter-mobile').toggleClass('active');
            });

            setTimeout(function () {
                $('#ocfilter').ocfilter(options);
            }, 1);
        });
    </script>
<?php } ?>