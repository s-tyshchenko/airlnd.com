//Voice Search
var $voiceTrigger = $('.header-search_icon-mic');
var $searchInput = $('.header-search_input');

window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

if (window.SpeechRecognition) {

    /* setup Speech Recognition */
    var recognition = new SpeechRecognition();
    recognition.interimResults = true;
    recognition.lang = 'ua-UA';
    recognition.addEventListener('result', _transcriptHandler);

    recognition.onerror = function (event) {
        console.log(event.error);

        /* Revert input and icon CSS if no speech is detected */
        if (event.error == 'no-speech') {
            $voiceTrigger.removeClass('active');
            $searchInput.attr("placeholder", "Пошук...");
        }
    }
} else {
    $voiceTrigger.remove();
}

$(document).ready(function () {
    // Mask
    $('input[type="tel"]').mask('+38 (999) 999-99-99');

    // Catalog Menu
    $('.header-menu').hover(
        function () {
            $('.mega-menu--header-background').show();
        },
        function () {
            $('.mega-menu--header-background').hide();
        }
    );

    // Search
    $('.header-search_icon-close').click(function () {
        $('.header-search_input').val('');
    });
    $(document).on('click', '[data-toggle="mobile-search"]', function () {
        $('.header-mobile--search').slideToggle();
    });
    $('#search button').on('click', function () {
        var url = $('#search').attr('data-url');
        var value = $('#search input[name=\'search\']').val();
        if (value) {
            url += '?search=' + encodeURIComponent(value);
        }
        location = url;
    });
    $('#search input[name=\'search\']').on('keydown', function (e) {
        if (e.keyCode == 13) {
            $('#search input[name=\'search\']').closest('#search').find('button').trigger('click');
        }
    });
    $('#search_mobile').on('submit', function (e) {
        e.preventDefault()
        var url = $('base').attr('href') + 'index.php?route=product/search';
        var value = $('#search_mobile input[name=\'search\']').val();
        if (value) {
            url += '&search=' + encodeURIComponent(value);
        }
        location = url;
    });

    $voiceTrigger.on('click touch', listenStart);

    // Mobile Menu
    $(document).on('click', '[data-toggle="mobile-menu"]', function () {
        if ($('.mobile-menu').is(':visible')) {
            $('.mobile-menu').hide();
            $('body').removeClass('not-scroll');
        } else {
            $('.mobile-menu').show();
            $('body').addClass('not-scroll');
        }
    });
    $(document).on('click', '[data-toggle="mobile-menu-subcategory"]', function () {
        var btn_subcategories = $(this);
        var subcategories_container = btn_subcategories.parent().find('.mobile-menu--subcategories');

        btn_subcategories.parent().addClass('active');
        subcategories_container.height($('.mobile-menu').height());
    });
    $(document).on('click', '.mobile-menu--nav-button', function () {
        $(this).closest('.active').removeClass('active');
    });

    $(document).on('click', '.owl-product--image-item', function () {
        var imageUrl = $(this).attr('src');
        var imageAlt = $(this).attr('alt');

        var modalHtml = `
        <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered d-flex justify-content-center align-items-center">
                <img src="${imageUrl}" alt="${imageAlt}" class="rounded-3">
            </div>
        </div>
        `;

        $('body').append(modalHtml);

        var imageModal = new bootstrap.Modal(document.getElementById('imageModal'));

        imageModal.show();

        $('#imageModal').on('hidden.bs.modal', function () {
            $(this).remove();
        });
    });


    // Mobile Menu
    var prevScrollpos = window.pageYOffset;
    window.onscroll = function () {
        var currentScrollPos = window.pageYOffset;
        if (currentScrollPos > 80) {
            if (prevScrollpos > currentScrollPos) {
                $('.header-mobile').addClass('active').css('top', '0');
            } else {
                $('.header-mobile').removeClass('active').css('top', '-70px');
            }
            prevScrollpos = currentScrollPos;
        } else {
            $('.header-mobile').removeClass('active').css('top', '0');
        }
    }

    // Home Slider
    if ($('*').is('#home-slider')) {
        var owl_home_slider = $('#home-slider').owlCarousel({
            items: 1,
            slideBy: 1,
            loop: true,
            nav: true,
            dots: true,
            navText: ['<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none"><path d="M10.3687 15.5L16.8381 8.95476C17.0582 8.7321 17.0533 8.37598 16.8271 8.15934C16.6009 7.9427 16.2391 7.94758 16.019 8.17024L9.16187 15.1077C8.94604 15.3261 8.94604 15.6739 9.16187 15.8923L16.019 22.8298C16.2391 23.0524 16.6009 23.0573 16.8271 22.8407C17.0533 22.624 17.0582 22.2679 16.8381 22.0452L10.3687 15.5Z" fill="white"/></svg>', '<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" fill="none"><path d="M19.6313 14.5L13.1619 21.0452C12.9418 21.2679 12.9467 21.624 13.1729 21.8407C13.3991 22.0573 13.7609 22.0524 13.981 21.8298L20.8381 14.8923C21.054 14.6739 21.054 14.3261 20.8381 14.1077L13.981 7.17024C13.7609 6.94758 13.3991 6.9427 13.1729 7.15934C12.9467 7.37598 12.9418 7.7321 13.1619 7.95476L19.6313 14.5Z" fill="white"/></svg>']
        });
    }

    // Module Manufacturers
    if ($('*').is('.manufacturer-carousel')) {
        var owl_manufacturer_slider = $('.manufacturer-carousel').owlCarousel({
            slideBy: 1,
            loop: true,
            stagePadding: 2,
            margin: 15,
            nav: false,
            dots: false,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1
                },
                767: {
                    items: 2
                },
                991: {
                    items: 5
                }
            }
        });

        $('.manufacturer-carousel--next').click(function () {
            owl_manufacturer_slider.trigger('next.owl.carousel');
        })
        $('.manufacturer-carousel--prev').click(function () {
            owl_manufacturer_slider.trigger('prev.owl.carousel');
        });
    }

    // Product Images
    if ($('*').is('.owl-product--image')) {
        initProductImages();
    }

    /* === System === */

    // Language
    $('#form-language .language-select, .mobile-languages a, .footer-language_item').on('click', function (e) {
        e.preventDefault();

        $('#form-language input[name=\'code\']').val($(this).attr('data-code'));

        $('#form-language').submit();

        return false;
    });

    // Product Views
    $(document).on('click', '[data-toggle="toggle-search-view"][data-view]', function () {
        var products_view = $(this).attr('data-view');
        console.log(products_view);
        $.ajax({
            url: 'index.php?route=product/category/setProductsView',
            type: 'post',
            data: 'products_view=' + products_view,
            success: function () {
                location.reload();
            }
        });
    });

    $('body').on('click', '.module-products--btn-more', function () {
        $(this).parent().find('.product-card_min').show();
        $(this).hide();
    });

    // Wishlist
    $('body').on('click', '.wishlist_btn:not(.active)', function () {
        var product_id = $(this).attr('data-product-id');
        $(this).addClass('active');
        wishlist.add(product_id);
        return false;

    });
    $('body').on('click', '.wishlist_btn.active', function () {
        var product_id = $(this).attr('data-product-id');
        $(this).removeClass('active');
        wishlist.remove(product_id);
        return false;
    });
    $('body').on('click', '.wishlist-btn_select-all:not(.active)', function () {
        $('.wishlist-content_products input').prop('checked', true).trigger('change');
    });
    $('body').on('click', '.wishlist-btn_select-all.active', function () {
        $('.wishlist-content_products input').prop('checked', false).trigger('change');
    });

    $('body').on('change', '.wishlist-content_products input', function () {
        if ($('*').is('.wishlist-content_products input:checked')) {
            $('.wishlist-btn_remove').removeClass('not-active');

            $('.wishlist-btn_select-all.active').show();
            $('.wishlist-btn_select-all:not(.active)').hide();
        } else {
            $('.wishlist-btn_remove').addClass('not-active');

            $('.wishlist-btn_select-all.active').hide();
            $('.wishlist-btn_select-all:not(.active)').show();
        }
    });
    $('body').on('click', '.wishlist-total_btn', function () {
        $('.wishlist-content_products input').each(function (elem, index) {
            var product_id = $(this).val();
            cart.add(product_id);
        });
    });
    $('body').on('click', '.wishlist-btn_remove:not(.not-active)', function () {
        $('.wishlist-content_products input:checked').each(function (elem, index) {
            var product_id = $(this).val();
            wishlist.remove(product_id);

            location.reload();
        });
    });

    // Cart
    $(document).on('click', '[data-toggle="cart"]', function () {
        openPopupCart();
        return false;
    });
    $(document).on('click', '[data-toggle="add-to-cart"][data-product-id]', function () {
        var productId = $(this).attr('data-product-id');
        $(this).addClass('added');
        cart.add(productId);
        return false;
    });
    $(document).on('click', '.cart-item--quantity-plus', function () {
        var quantity_input = $(this).parent().find('input');
        var minimum = Number(quantity_input.attr('data-minimum'));
        var value = Number(quantity_input.val());

        quantity_input.val(value + minimum);

        $('.cart-item--quantity-input').trigger('change');

        return false;
    });
    $(document).on('click', '.cart-item--quantity-minus', function () {
        var quantity_input = $(this).parent().find('input');
        var minimum = Number(quantity_input.attr('data-minimum'));
        var value = Number(quantity_input.val());

        quantity_input.val(value - minimum);

        $('.cart-item--quantity-input').trigger('change');

        return false;
    });

    // Cart Quantity
    $(document).on('change', '.cart-item--quantity-input', function () {
        var form_data = $('#popup-cart--form').serialize();

        $.ajax({
            url: 'index.php?route=checkout/cart/edit',
            type: 'post',
            data: form_data,
            dataType: 'json',
            success: function (json) {
                if (json['success']) {
                    // Cart Update
					setTimeout(function () {
						if (form_data == $('#popup-cart--form').serialize()) {
							$('.popup-cart .loader-bg').show();
							updatePopupCart();
						}
                    }, 100);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

    });

    /* OC Filter */
    $(document).on('click', '.ocfilter-option .ocf-option-name', function () {
        $(this).parent().toggleClass('open');
        $(this).parent().find('.ocf-option-values').slideToggle('slow');
    });

    $('.search-nav--left').append($('.ocfilter_selected').html());

	// Products Ajax Loading	
	$(document).on('click', '[data-toggle="products-load-more"]', function () {
	 
		var btn_load = $(this);
		var next_page = $('.pagination-block').find('.active').next().find('a').attr('href');
		if(next_page){

			$('.products_loading').show();
			
			btn_load.button('loading');
			
			// Loading Products
			$.ajax({
				url: next_page,
				dataType: 'html',
				success: function(data) {
					var products = $(data).find('.search-content--products-grid').html();
					$('.search-content--products-grid').append(products);

					if (typeof $.Lazy !== "undefined") {
					    $('.lazy').Lazy();
                    }

					$('.pagination').load(next_page + ' .pagination', function(){
						setLocation(next_page);
						
						next_page = $('.pagination-block').find('.active').next().find('a').attr('href');
						if(!next_page){
							$('[data-toggle="products-load-more"]').hide();
						}
					});
					
					btn_load.button('reset');
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
			
		} else {
			$('[data-toggle="products-load-more"]').hide();
		}
	});	
	
	$(document).on('click', '.product-list-min_img', function (e) {
		e.preventDefault;
	 
		var product_id = $(this).attr('data-product-id');
		var popup_img = $('#product_img_popup');
		
		popup_img.modal('show');
		
		popup_img.find('.modal-content').html('<div class="loading-icon"></div>');
		
		$.ajax({
			url: '/index.php?route=product/product/getImages&product_id=' + product_id,
			dataType: 'html',
			success: function(data) {
				
				data = '<div class="product-images">' + data + '</data>';
				
				popup_img.find('.modal-content').html(data);
				
				setTimeout(function(){
					initProductImages();
				}, 100);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		
		return false;
	});

    $(document).on('click', '.product-tabs [data-toggle="collapse"]', function (e) {
        var targetTabButton = $(this)
        var targetTab = $(targetTabButton.attr('data-target'));

        $('.product-tabs .tab-pane.collapse').collapse('hide');
        $('.product-tabs ul > li').removeClass('active');

        targetTabButton.addClass('active')
        targetTab.collapse('show')
    });

    $(document).on('click', '.product-list--min [data-toggle="collapse-related"]', function (e) {
        event.stopPropagation();
        event.preventDefault();

        var targetProductButton = $(this)
        var targetProductId = targetProductButton.attr('data-product-id');

        $('.product-list--related-products-container.show:not([data-product-id="' + targetProductId + '"])').removeClass('show');
        $('.product-list--related-products-container[data-product-id="' + targetProductId + '"]').toggleClass('show');
    });

    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
});

function setLocation(curLoc){
    try {
      history.pushState(null, null, curLoc);
      return;
    } catch(e) {}
    location.hash = '#' + curLoc;
}

function openPopupCart() {

    updatePopupCart();

    setTimeout(function () {
        $('#popup-cart').modal('show');
    }, 100);

    return false;
}

function updatePopupCart() {
    $.ajax({
        url: '/index.php?route=common/cart/info&ajax_update=true',
        type: 'post',
        dataType: 'html',
        success: function (data) {
            $('.cart-modal--body').html(data);
			$('.loader-bg').hide();
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

    $.ajax({
        url: 'index.php?route=checkout/cart/getCountProducts',
        type: 'post',
        dataType: 'json',
        success: function (json) {
            $('.alert').remove();

            if (json['total']) {
                $('[data-toggle="cart"] .header-links_item-count').html(json['total']);
                $('[data-toggle="cart"] .header-mobile_links-item-count').html(json['total']);
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
	
	if($('*').is('#quick-checkout-cart')){
		$('#quick_checkout_cart').load('/index.php?route=checkout/quick_checkout/cart');
		//$('.quick-checkout--totals').load('/index.php?route=checkout/quick_checkout/getTotals');
	}
}

// Cart add remove functions
var cart = {
    'add': function (product_id, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof (quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            success: function (json) {
                $('.alert').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                }

                if (json['success']) {
                    openPopupCart();
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'update': function (key, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/edit',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            success: function (json) {
                // Обновляем корзину
                updatePopupCart();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function (key) {
		$('.popup-cart .loader-bg').show();
		
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            success: function (json) {
                // Обновляем корзину
                updatePopupCart();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
}

var wishlist = {
    'add': function (product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function (json) {
                $('.alert').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                }

                if (json['total']) {
                    $('.header-wishlist_btn').addClass('active');
                    $('.header-wishlist_btn .header-links_item-count').html(json['total']);
                    $('.header-wishlist_btn .header-mobile_links-item-count').html(json['total']);
                } else {
                    $('.header-wishlist_btn').removeClass('active');
                }

                // $('html, body').animate({ scrollTop: 0 }, 'slow');
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function (product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/remove',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function (json) {
                $('.alert').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                }

                if (json['total']) {
                    $('.header-wishlist_btn').addClass('active');
                    $('.header-wishlist_btn .header-links_item-count').html(json['total']);
                    $('.header-wishlist_btn .header-mobile_links-item-count').html(json['total']);
                } else {
                    $('.header-wishlist_btn').removeClass('active');
                }

                // $('html, body').animate({ scrollTop: 0 }, 'slow');
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
}

function listenStart(e) {
    e.preventDefault();
    /* Update input and icon CSS to show that the browser is listening */
    $searchInput.attr("placeholder", "Говорите...");
    $voiceTrigger.addClass('active');
    /* Start voice recognition */
    recognition.start();
}

function _parseTranscript(e) {
    return Array.from(e.results).map(function (result) {
        return result[0]
    }).map(function (result) {
        return result.transcript
    }).join('')
}

function _transcriptHandler(e) {
    var speechOutput = _parseTranscript(e)
    $searchInput.val(speechOutput);
    if (e.results[0].isFinal) {
        $('#search input[name=\'search\']').closest('#search').find('button').trigger('click');
    }
}

function initProductImages(){
	let owlJq = $('.owl-product--image .owl-carousel');
	let btns = document.querySelectorAll(':scope .owl-product--thumbs-image');

	var owl_product = owlJq.on("initialized.owl.carousel changed.owl.carousel", function (e) {
		if (!e.namespace) {
			return;
		}

		$('.owl-product--thumbs-image').removeClass('active');
		$('.owl-product--thumbs-image:eq(' + e.relatedTarget.relative(e.item.index) + ')').addClass('active');

	}).owlCarousel({
		items: 1,
		loop: false,
		margin: 10,
		nav: false,
		dots: false,
		loop: true
	});

	for (let btn of btns) {
		btn.addEventListener('click', function () {
			owlJq.trigger('to.owl.carousel', [$(this).index()]);
		})
	}

	$('.owl-product--image .owl-product--next').click(function () {
		owl_product.trigger('next.owl.carousel');
	})
	$('.owl-product--image .owl-product--prev').click(function () {
		owl_product.trigger('prev.owl.carousel');
	});
}
