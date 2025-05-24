$(document).ready(function () {

    $(document).on('change', 'input[name="shipping_method"]', function () {
        updateAddressForm();
        saveShippingMethod();
    });

    $(document).on('change', 'input[name="payment_method"]', function () {
        savePaymentMethod();
    });

    updateAddressForm();
    updateTotals();

    $(document).on('submit', '#quick_checkout', function () {
        sendOrderForm();
        return false;
    });

    $(document).on('focus', '#shipping_pickup_pickup', function () {
        updatePickupShippingFields();
    });

    function updateAddressForm() {
        $('.shipping_fields').html('');
        $('.shipping_fields').hide();

        var shippingMethod = $('input[name="shipping_method"]:checked').attr('data-code');

        $.ajax({
            url: 'index.php?route=checkout/quick_checkout/getShippingFields',
            type: 'post',
            data: $('#quick_checkout').serialize(),
            dataType: 'html',
            success: function(html) {
                // Hide all shipping fields
                $('.shipping_fields').hide();

                if (shippingMethod === 'pickup.pickup') {
                    updatePickupShippingFields();
                }

                $('#shipping_fields_' + shippingMethod).html(html).show();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }

    function updatePickupShippingFields() {
        $.ajax({
            url: 'index.php?route=extension/shipping/self',
            type: 'get',
            dataType: 'json',
            success: function (json) {
                var $shippingFields = $('#shipping_fields_pickup_pickup');
                $shippingFields.empty();

                if (json && json.length > 0) {
                    var dropdownHtml = '<ul class="dropdown-menu">';
                    $.each(json, function (index, option) {
                        dropdownHtml += '<li data-id="' + option.id + '" data-value="' + option.value + '"><a href="#" class="dropdown-item">' + option.text + '</a></li>';
                    });
                    dropdownHtml += '</ul>';

                    $shippingFields.html(dropdownHtml);
                    $shippingFields.show();
                } else {
                    $shippingFields.hide();
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }

    function updateTotals() {
        $.ajax({
            url: 'index.php?route=checkout/quick_checkout/getTotals',
            type: 'post',
            data: $('#quick_checkout').serialize(),
            dataType: 'html',
            success: function (html) {
                $('#checkout_totals').html(html);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }

    function saveShippingMethod(){
        $.ajax({
            url: 'index.php?route=checkout/shipping_method/save',
            type: 'post',
            data: $('#quick_checkout').serialize(),
            success: updateTotals,
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }

    function savePaymentMethod(){
        $.ajax({
            url: 'index.php?route=checkout/payment_method/save',
            type: 'post',
            data: $('#quick_checkout').serialize(),
            dataType: 'json',
            success: updateTotals,
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }

    function sendOrderForm(){
        var form = $('#quick_checkout');
        var button = form.find('button[type=submit]');

        $.ajax({
            url: 'index.php?route=checkout/quick_checkout/checkout',
            type: 'post',
            data: form.serialize(),
            dataType: 'json',
            beforeSend: function() {
                //button.button('loading');
                $('.loader-container').show();
            },
            complete: function() {
                $('.loader-container').hide();
            },
            success: function(json) {
                $('.text-danger').remove();
                $('.has-error').removeClass('has-error');

                if (json['success']) {
                    // Загружаем шаблон модуля оплаты
                    $.ajax({
                        url: 'index.php?route=checkout/confirm',
                        dataType: 'html',
                        success: function(html) {
                            $('#payment-block').html(html);
                            setTimeout(function(){
                                // Подтверждение оплаты
                                $('#payment-block #button-confirm, #payment-block .button, #payment-block .btn, #payment-block .button_oc, #payment-block input[type=submit]').click();
                            }, 200);
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }

                // Если корзина пуста
                if(json['redirect']){
                    location.reload();
                }

                // Валидация полей формы
                if(json['error_fields']){
                    $.each(json['error_fields'], function(key, value){
                        form.find('input[name=' + key + ']').addClass('has-error');
                        form.find('input[name=' + key + ']').after('<div class="text-danger">' + value + '</div>');
                    });
                }

                if($('*').is('.has-error')){
                    $('html, body').animate({
                        scrollTop: $(".has-error").offset().top - 50
                    }, 1000);
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
});
