class LiveSearchJs {
    options = {};

    constructor(options) {
        this.options = options;
        this.init();
        this.initOnce();
        this.initOnce('_mobile');
    }

    init() {
        $(document).on("mouseup touchend", (e) => {
            const containers = $('.live-search, .live-search--mobile');
            let clickedOutside = true;

            for (let i = 0; i < containers.length; i++) {
                if ($(containers[i]).is(e.target) || $(containers[i]).has(e.target).length > 0) {
                    clickedOutside = false;
                    break;
                }
            }

            if (clickedOutside) {
                containers.hide();
                $('.mega-menu--header-background').hide();
            }
        });
    }

    initOnce(suffix = '') {
        const liveSearch = {
            selector: `#search${suffix} input[name='search']`,
            textNoMatches: this.options.text_empty,
            textSku: this.options.text_sku,
            height: '50px',
        };

        $(liveSearch.selector).after(
            `<div class="live-search${suffix}"><ul class="live-search--container"></ul><div class="result-text${suffix}"></div></div>`
        );

        $(liveSearch.selector).autocomplete({
            delay: 500,
            source: (request, response) => {
                const filterName = $(liveSearch.selector).val();
                const catId = 0;
                const liveSearchMinLength = this.options.module_live_search_min_length;

                if (filterName.length < liveSearchMinLength) {
                    $(`.live-search${suffix}`).css('display', 'none');
                } else {
                    var liveSearchHref = 'index.php?route=extension/module/live_search&filter_name=';
                    var allSearchHref = 'index.php?route=product/search&search=';
                    if (catId > 0) {
                        liveSearchHref = liveSearchHref + encodeURIComponent(filterName) + '&cat_id=' + Math.abs(catId);
                        allSearchHref = allSearchHref + encodeURIComponent(filterName) + '&category_id=' + Math.abs(catId);
                    } else {
                        liveSearchHref = liveSearchHref + encodeURIComponent(filterName);
                        allSearchHref = allSearchHref + encodeURIComponent(filterName);
                    }

                    var html = '<li style="text-align: center;height:10px;">';
                    html += '<img class="loading" src="assets/amitek/vendor/live-search/loading.gif" />';
                    html += '</li>';
                    $(`.live-search${suffix} ul`).html(html);
                    $(`.live-search${suffix}`).css('display', 'block');

                    const ajaxCallback = function (result) {
                        var products = result.products;
                        $(`.live-search${suffix} ul li`).remove();
                        $(`.result-text${suffix}`).html('');
                        if (!$.isEmptyObject(products)) {
                            var show_image = this.options.module_live_search_show_image;
                            var show_price = this.options.module_live_search_show_price;
                            var show_description = this.options.module_live_search_show_description;
                            var show_add_button = this.options.module_live_search_show_add_button;

                            $(`.result-tex${suffix}t`).html('<a href="' + allSearchHref + '" class="live-search--btn-all">' + this.options.text_view_all_results + ' (' + result.total + ')</a>');

                            $.each(products, function (index, product) {
                                var html = '<li class="live-search--item">';
                                html += '<a href="' + product.url + '">';
                                // show image
                                if (product.image && show_image == "1") {
                                    html += '<div class="live-search--image"><img alt="' + product.name + '" src="' + product.image + '"></div>';
                                }

                                // show name & extra_info
                                html += '<div class="live-search--name">';
                                html += '<p>' + product.name + '</p>'
                                if (show_description == "1") {
                                    html += '<p class="text-muted">' + product.extra_info + '</p>';
                                }
                                html += '<small class="text-muted">' + liveSearch.textSku + ': ' + product.sku + '</small>';
                                html += '</div>';
                                // show price & special price
                                if (show_price == "1") {
                                    if (product.special) {
                                        html += '<div class="live-search--price live-search--discount">' + product.price + '<span>' + product.special + '</span></div>';
                                    } else {
                                        html += '<div class="live-search--price">' + product.price + '</div>';
                                    }
                                }
                                html += '</div>';

                                // show_add_button
                                if (show_add_button == "1") {
                                    if (product.minimum == 0) {
                                        product.minimum = 1;
                                    }
                                    html += '<button class="btn btn-outline-secondary live-search--cart-btn" data-toggle="add-to-cart" data-product-id="' + product.product_id + '">';
                                    html += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path d="M2.5 4.25C2.5 3.83579 2.83579 3.5 3.25 3.5H3.80826C4.75873 3.5 5.32782 4.13899 5.65325 4.73299C5.87016 5.12894 6.02708 5.58818 6.14982 6.00395C6.18306 6.00134 6.21674 6 6.2508 6H18.7481C19.5783 6 20.1778 6.79442 19.9502 7.5928L18.1224 14.0019C17.7856 15.1832 16.7062 15.9978 15.4779 15.9978H9.52977C8.29128 15.9978 7.2056 15.1699 6.87783 13.9756L6.11734 11.2045L4.85874 6.95578L4.8567 6.94834C4.701 6.38051 4.55487 5.85005 4.33773 5.4537C4.12686 5.0688 3.95877 5 3.80826 5H3.25C2.83579 5 2.5 4.66421 2.5 4.25ZM7.57283 10.8403L8.32434 13.5786C8.47333 14.1215 8.96682 14.4978 9.52977 14.4978H15.4779C16.0362 14.4978 16.5268 14.1275 16.68 13.5906L18.4168 7.5H6.58549L7.55906 10.7868C7.56434 10.8046 7.56892 10.8224 7.57283 10.8403ZM11 19C11 20.1046 10.1046 21 9 21C7.89543 21 7 20.1046 7 19C7 17.8954 7.89543 17 9 17C10.1046 17 11 17.8954 11 19ZM9.5 19C9.5 18.7239 9.27614 18.5 9 18.5C8.72386 18.5 8.5 18.7239 8.5 19C8.5 19.2761 8.72386 19.5 9 19.5C9.27614 19.5 9.5 19.2761 9.5 19ZM18 19C18 20.1046 17.1046 21 16 21C14.8954 21 14 20.1046 14 19C14 17.8954 14.8954 17 16 17C17.1046 17 18 17.8954 18 19ZM16.5 19C16.5 18.7239 16.2761 18.5 16 18.5C15.7239 18.5 15.5 18.7239 15.5 19C15.5 19.2761 15.7239 19.5 16 19.5C16.2761 19.5 16.5 19.2761 16.5 19Z"/></svg>';
                                    html += '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path d="M2.5 4.25C2.5 3.83579 2.83579 3.5 3.25 3.5H3.80826C4.75873 3.5 5.32782 4.13899 5.65325 4.73299C5.87016 5.12894 6.02708 5.58818 6.14982 6.00395C6.18306 6.00134 6.21674 6 6.2508 6H18.7481C19.5783 6 20.1778 6.79442 19.9502 7.5928L18.1224 14.0019C17.7856 15.1832 16.7062 15.9978 15.4779 15.9978H9.52977C8.29128 15.9978 7.2056 15.1699 6.87783 13.9756L6.11734 11.2045L4.85874 6.95578L4.8567 6.94834C4.701 6.38051 4.55487 5.85005 4.33773 5.4537C4.12686 5.0688 3.95877 5 3.80826 5H3.25C2.83579 5 2.5 4.66421 2.5 4.25ZM9 21C10.1046 21 11 20.1046 11 19C11 17.8954 10.1046 17 9 17C7.89543 17 7 17.8954 7 19C7 20.1046 7.89543 21 9 21ZM16 21C17.1046 21 18 20.1046 18 19C18 17.8954 17.1046 17 16 17C14.8954 17 14 17.8954 14 19C14 20.1046 14.8954 21 16 21Z"></path></svg>';
                                    html += '</button>';
                                }

                                html += '</a>';
                                html += '</li>';
                                $(`.live-search${suffix} ul`).append(html);
                            });
                        } else {
                            var html = '';
                            html += '<li style="padding:20px 20px 10px 20px;"><div>';
                            html += liveSearch.text_no_matches;
                            html += '</div></li>';

                            $(`.live-search${suffix} ul`).html(html);
                        }
                        $(`.live-search${suffix}`).css('display', 'block');
                        $('.mega-menu--header-background').show();

                        return false;
                    }

                    $.ajax({
                        url: liveSearchHref,
                        dataType: 'json',
                        success: ajaxCallback.bind(this)
                    });
                }
            },
            select: (product) => {
                $(liveSearch.selector).val(product.name);
            },
        });
    }
}