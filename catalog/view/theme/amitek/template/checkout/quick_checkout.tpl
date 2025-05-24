<?php echo $header; ?>

    <div class="container">
        <form id="quick_checkout" action="#" class="quick-checkout--page">

            <div class="quick-checkout--title"><?php echo $heading_title; ?></div>

            <div class="loader-container loader"></div>

            <div id="quick_checkout_cart">

            </div>

            <div class="quick-checkout--content">

                <div class="quick-checkout--details">
                    <div class="quick-checkout--user-form">
                        <div class="quick-checkout--subtitle"><?php echo $text_step_1; ?></div>

                        <div class="row">
                            <?php if (count($addresses) > 1) { ?>
                                <div class="col-12">
                                    <div class="mb-3">
                                        <label class="form-label"
                                               for="qc_address_id"><?php echo $entry_address_id; ?></label>
                                        <select id="qc_address_id" class="form-control" name="address_id">
                                            <?php foreach ($addresses as $address) { ?>
                                                <option value="<?php echo $address['address_id']; ?>" <?php echo($address['address_id'] == $address_id ? 'selected="selected"' : ''); ?>>
                                                    <?php echo $address['firstname']; ?>,
                                                    <?php echo $address['lastname']; ?>,
                                                    <?php echo $address['telephone']; ?>,
                                                    <?php echo $address['city']; ?>,
                                                    <?php echo $address['address_1']; ?>
                                                </option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                            <?php } ?>
                            <div class="col-12 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="qc_lastname"><?php echo $entry_lastname; ?></label>
                                    <input type="text" class="form-control" id="qc_lastname" name="lastname"
                                           value="<?php echo $lastname; ?>">
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="qc_firstname"><?php echo $entry_firstname; ?></label>
                                    <input type="text" class="form-control" id="qc_firstname" name="firstname"
                                           value="<?php echo $firstname; ?>">
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="qc_telephone"><?php echo $entry_telephone; ?></label>
                                    <input type="text" class="form-control" id="qc_telephone" name="telephone"
                                           value="<?php echo $telephone; ?>">
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="qc_email"><?php echo $entry_email; ?></label>
                                    <input type="text" class="form-control" id="qc_email" name="email"
                                           value="<?php echo $email; ?>">
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="quick-checkout--content-block">
                        <div class="quick-checkout--subtitle"><?php echo $text_step_2; ?></div>
                        <div class="quick-checkout--radio-block">
                            <?php if ($shipping_methods) { ?>
                                <?php foreach ($shipping_methods as $shipping_method) { ?>
                                    <?php if (!$shipping_method['error']) { ?>
                                        <?php foreach ($shipping_method['quote'] as $key => $quote) { ?>
                                            <div class="form-check quick-checkout--radio-item mb-3">
                                                <input id="shipping_<?php echo str_replace(".", "_", $quote['code']); ?>"
                                                       class="form-check-input" type="radio" name="shipping_method"
                                                       value="<?php echo $quote['code']; ?>"
                                                       <?php echo($quote['code'] == $shipping_method_code ? 'checked="checked"' : ''); ?>data-code="<?php echo str_replace(".", "_", $quote['code']); ?>">
                                                <label class="form-check-label"
                                                       for="shipping_<?php echo str_replace(".", "_", $quote['code']); ?>">
                                                    <span class="quick-checkout--radio-title"><?php echo $quote['title']; ?></span>
                                                    <div class="quick-checkout--radio-value">
                                                        <?php if ($quote['text']) { ?>
                                                            <span class="text-secondary"><?php echo $text_shipping_cost; ?> <?php echo $quote['text']; ?></span>
                                                        <?php } ?>
                                                        <?php if (!empty($quote['text_period'])) { ?>
                                                            <span class="text-secondary"><?php echo $quote['text_period']; ?></span>
                                                        <?php } ?>
                                                    </div>
                                                </label>
                                            </div>
                                            <div id="shipping_fields_<?php echo str_replace(".", "_", $quote['code']); ?>" style="display: none;" class="shipping_fields my-3"></div>
                                        <?php } ?>
                                    <?php } ?>
                                <?php } ?>
                            <?php } ?>
                        </div>

                        <div class="quick-checkout--subtitle mt-3"><?php echo $text_step_3; ?></div>
                        <div class="quick-checkout--radio-block">
                            <?php if ($payment_methods) { ?>
                                <?php foreach ($payment_methods as $key => $payment_method) { ?>
                                    <div class="form-check quick-checkout--radio-item mb-3">
                                        <input id="shipping_<?php echo $payment_method['code']; ?>"
                                               class="form-check-input"
                                               type="radio" name="payment_method"
                                               value="<?php echo $payment_method['code']; ?>"
                                            <?php echo($payment_method['code'] == $payment_method_code || $key == 1 ? 'checked="checked"' : ''); ?>>
                                        <label class="form-check-label"
                                               for="shipping_<?php echo $payment_method['code']; ?>">
                                            <span class="quick-checkout--radio-title"><?php echo $payment_method['title']; ?></span>
                                            <?php if (isset($payment_method['description']) && !empty($payment_method['description'])) { ?>
                                                <span class="quick-checkout--radio-subtitle"><?php echo $payment_method['description']; ?></span>
                                            <?php } ?>

                                            <?php if ($payment_method['terms']) { ?>
                                                <span class="quick-checkout--radio-subtitle"><?php echo $payment_method['terms']; ?></span>
                                            <?php } ?>
                                        </label>
                                    </div>
                                <?php } ?>
                            <?php } ?>
                        </div>

                    </div>
                </div>

                <?php echo $cart; ?>

            </div>

            <script>
                var entry_address_1 = '<?php echo $entry_address_1; ?>';
                var entry_post_office = '<?php echo $entry_post_office; ?>';
            </script>
        </form>

        <div id="payment-block" class="d-none"></div>
    </div>

    <script type="text/javascript">
        /* Autocomplete for shipping addresses */
        (function ($) {
            var methods = {
                init: function (options) {
                    return this.each(function () {
                        var $this = $(this);
                        var data = $this.data('autocompleteAddress');

                        /* If the plugin is not yet initialized */
                        if (!data) {
                            $this.timer = null;
                            $this.items = new Array();

                            $.extend($this, options);

                            $this.attr('autocomplete', 'new-password');

                            /* Focus */
                            $this.on('focus.autocompleteAddress', function () {
                                $this.request('');
                            });

                            /* Blur */
                            $this.on('blur.autocompleteAddress', function () {
                                setTimeout(function (object) {
                                    object.hide();
                                }, 200, $this);
                            });

                            /* Keydown */
                            $this.on('keydown.autocompleteAddress', function (event) {
                                switch (event.keyCode) {
                                    case 27: // escape
                                        $this.hide();
                                        break;
                                    default:
                                        $this.request();
                                        break;
                                }
                            });

                            /* Click */
                            $this.click = function (event) {
                                event.preventDefault();

                                var id = $(event.target).parent().attr('data-id');
                                var value = $(event.target).parent().attr('data-value');

                                if (value && $this.items[id]) {
                                    $this.select($this.items[id]);
                                }
                            }

                            /* Show */
                            $this.show = function () {
                                var pos = $this.position();

                                $this.siblings('ul.' + $this.class).css({
                                    'top': pos.top + $this.outerHeight(),
                                    'left': pos.left
                                });

                                $this.siblings('ul.' + $this.class).show();
                            }

                            /* Hide */
                            $this.hide = function () {
                                $this.siblings('ul.' + $this.class).hide();
                            }

                            /* Request */
                            $this.request = function (search) {
                                clearTimeout($this.timer);

                                $this.timer = setTimeout(function (object) {
                                    search = (typeof (search) === 'undefined') ? object.val() : search;

                                    object.source(search, $.proxy(object.response, object));
                                }, 200, $this);
                            }

                            /* Response */
                            $this.response = function (json) {
                                var html = '';

                                if (json.length) {
                                    for (i = 0; i < json.length; i++) {
                                        this.items[i] = json[i];

                                        html += '<li data-id="' + i + '" data-value="' + json[i]['value'] + '"><a href="#" class="dropdown-item">' + json[i]['label'] + '</a></li>';
                                    }
                                }

                                if (html && $this.is(':focus')) {
                                    $this.show();
                                } else {
                                    $this.hide();
                                }

                                $this.siblings('ul.' + $this.class).html(html);
                            }

                            $this.after('<ul class="' + $this.class + '"></ul>');
                            $this.siblings('ul.' + $this.class).delegate('a', 'click', $.proxy($this.click, $this));
                            $this.data('autocompleteAddress', true);
                        }
                    });
                },
                destroy: function () {
                    return this.each(function () {
                        var $this = $(this);

                        $this.removeData('autocompleteAddress');

                        $this.off('.autocompleteAddress');
                    });
                }
            };

            $.fn.autocompleteAddress = function (method) {
                if (methods[method]) {
                    return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
                } else if (typeof (method) === 'object' || !method) {
                    return methods.init.apply(this, arguments);
                } else {
                    $.error('Method "' + method + '" does not exist for jQuery.autocompleteAddress');
                }
            }
        })(window.jQuery);

        /* ShippingData object */
        function ShippingData() {
            var self = this;
            var src, method, lang, city;

            self.methods_city = [
                'novaposhta.department',
                'novaposhta.doors',
                'novaposhta.poshtomat',
                'ukrposhta.express_department',
                'ukrposhta.standard_department',
                'ukrposhta.express_doors',
                'ukrposhta.standard_doors',
                'justin.department'
            ];

            self.methods_department = [
                'novaposhta.department',
                'novaposhta.poshtomat',
                'ukrposhta.express_department',
                'ukrposhta.standard_department',
                'justin.department',
                'pickup.pickup'
            ];

            self.methods_address = [
                'novaposhta.doors'
            ];

            self.setProp = function () {
                self.method = $('input[name="shipping_method"]:checked').val() || $('select[name="shipping_method"]').val();
                self.lang = $('html').attr('lang') || 'uk';
            }

            self.handlerChanges = function (name, value) {
                if ($.inArray(self.method, self.methods_city.concat(self.methods_department, self.methods_address)) != -1) {
                    if (name.match(/zone/i)) {
                        $('input[name*="city"]:visible').val('');
                        $('input[name*="address_1"]:visible, input[name*="address_2"]:visible, input[name*="street"]:visible').val('');
                    } else if (name.match(/city/i)) {
                        $('input[name*="address_1"]:visible, input[name*="address_2"]:visible, input[name*="street"]:visible').val('');
                    } else if (name.match(/shipping\_method/i)) {
                        $('input[name*="address_1"]:visible, input[name*="address_2"]:visible, input[name*="street"]:visible').val('').autocompleteAddress('destroy');

                        self.method = value;
                    }
                } else if ($.inArray(value, self.methods_city.concat(self.methods_department, self.methods_address)) != -1) {
                    if (name.match(/shipping\_method/i)) {
                        $('input[name*="address_1"]:visible, input[name*="address_2"]:visible, input[name*="street"]:visible').val('');

                        self.method = value;
                    }
                }
            }

            self.getAddress = function (element, search) {
                var filter, action;

                if (element[0].name.match(/city/i)) {
                    action = 'getCities';
                    filter = $('[name*="zone"]:visible').val() || '';
                } else if (element[0].name.match(/address_1/i)) {
                    action = 'getDepartments';
                    filter = $('[name*="city"]:visible').val();
                } else if (element[0].name.match(/address_2|street/i)) {
                    action = 'getStreets';
                    filter = self.city || $('[name*="city"]:visible').val();
                }

                if (!search) {
                    search = element[0].value;
                }

                return $.ajax({
                    url: 'index.php?route=extension/module/shippingdata/getShippingData',
                    type: 'POST',
                    data: 'shipping=' + self.method + '&action=' + action + '&filter=' + encodeURIComponent(filter) + '&search=' + encodeURIComponent(search),
                    dataType: 'json',
                    global: false,
                    success: function (json) {
                        self.src = json;
                    }
                });
            }
        }

        /* DOOM loaded */
        $(function () {
            var shippingData = new ShippingData();

            /* Settings properties after DOOM load */
            shippingData.setProp();

            /* Settings properties after ajaxStop */
            $(document).ajaxStop(function () {
                shippingData.setProp();
            });

            /* Check changes */
            $(document).on('change', '[name*="zone"]:visible, [name*="city"]:visible, [name*="shipping_method"]', function (e) {
                shippingData.handlerChanges(e.target.name, e.target.value);
            });

            /* Add autocomplete for city */
            $('body').on('focus', 'input[name*="city"]:visible', function () {
                if (this.name.match(/city/i) && $.inArray(shippingData.method, shippingData.methods_city) != -1) {
                    $(this).autocompleteAddress({
                        source: function (request, response) {
                            shippingData.getAddress(this, request).done(function () {
                                response($.map(shippingData.src, function (item) {
                                    return {
                                        id: item['id'] || '',
                                        label: item['full_description'] || item['description'],
                                        value: item['description']
                                    }
                                }));
                            });
                        },
                        select: function (e) {
                            if (e.value != this.val()) {
                                this.val(e.value);
                                shippingData.city = e.id;

                                this.trigger('change');
                            }
                        },
                        class: 'dropdown-menu'
                    });
                }
            });

            /* Add autocomplete for department */
            $('body').on('focus', 'input[name*="address_1"]:visible', function () {
                if (this.name.match(/address_1/i) && $.inArray(shippingData.method, shippingData.methods_department) != -1) {
                    $(this).autocompleteAddress({
                        source: function (request, response) {
                            shippingData.getAddress(this, request).done(function () {
                                response($.map(shippingData.src, function (item) {
                                    return {
                                        label: item['full_description'] || item['description'],
                                        value: item['description'],
                                        postcode: item['postcode'] || ''
                                    }
                                }));
                            });
                        },
                        select: function (e) {
                            if (e.value != this.val()) {
                                if (e.postcode) {
                                    $('input[name*="postcode"]:visible').val(e.postcode);
                                }

                                this.val(e.value);

                                this.trigger('change');
                            }
                        },
                        class: 'dropdown-menu'
                    });
                }
            });

            /* Add autocomplete for address */
            $('body').on('focus', 'input[name*="address_2"]:visible, input[name*="street"]:visible', function () {
                if (this.name.match(/address_2|street/i) && $.inArray(shippingData.method, shippingData.methods_address) != -1) {
                    $(this).autocompleteAddress({
                        source: function (request, response) {
                            shippingData.getAddress(this, request).done(function () {
                                response($.map(shippingData.src, function (item) {
                                    return {
                                        label: item['full_description'] || item['description'],
                                        value: item['description']
                                    }
                                }));
                            });
                        },
                        select: function (e) {
                            if (e.value != this.val()) {
                                this.val(e.value);

                                this.trigger('change');
                            }
                        },
                        class: 'dropdown-menu'
                    });
                }
            });
        });
    </script>

<?php echo $footer; ?>