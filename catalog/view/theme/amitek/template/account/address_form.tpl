<?php echo $header; ?>
<div class="container">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <?php $i = 0;
            foreach ($breadcrumbs as $breadcrumb) {
                $i++; ?>
                <?php if ($i < count($breadcrumbs)) { ?>
                    <li class="breadcrumb-item"><a
                                href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } else { ?>
                    <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb['text']; ?></li>
                <?php } ?>
            <?php } ?>
        </ol>
    </nav>

    <h1><?php echo $heading_title; ?></h1>

    <div class="account-layout">
        <?php echo $column_left; ?>

        <div class="content">
            <?php echo $content_top; ?>

            <form action="<?php echo $action; ?>" class="row" method="post" enctype="multipart/form-data">

                <input name="middlename" type="hidden"/>

                <div class="col-md-6">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                        <input type="text" name="firstname" value="<?php echo $firstname; ?>"
                               placeholder="<?php echo $entry_firstname; ?>" id="input-firstname"
                               class="form-control  <?php echo($error_firstname ? 'has-error' : ''); ?>"/>
                        <?php if ($error_firstname) { ?>
                            <div class="text-danger"><?php echo $error_firstname; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                        <input type="text" name="lastname" value="<?php echo $lastname; ?>"
                               placeholder="<?php echo $entry_lastname; ?>" id="input-lastname"
                               class="form-control <?php echo($error_lastname ? 'has-error' : ''); ?>"/>
                        <?php if ($error_lastname) { ?>
                            <div class="text-danger"><?php echo $error_lastname; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                        <input type="tel" name="telephone" value="<?php echo $telephone; ?>"
                               placeholder="<?php echo $entry_telephone; ?>" id="input-telephone"
                               class="form-control <?php echo($error_telephone ? 'has-error' : ''); ?>"/>
                        <?php if ($error_telephone) { ?>
                            <div class="text-danger"><?php echo $error_telephone; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <div class="col-md-6 hidden">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-company"><?php echo $entry_company; ?></label>
                        <input type="text" name="company" value="" placeholder="<?php echo $entry_company; ?>"
                               id="input-company" class="form-control"/>
                    </div>
                </div>

                <div class="col-md-6 hidden">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-zone"><?php echo $entry_zone; ?></label>
                        <!-- <select name="zone_id" id="input-zone" class="form-control <?php echo($error_zone ? 'has-error' : ''); ?>">
            </select> -->
                        <input class="form-control" type="text" name="zone_id" value=""/>
                        <?php if ($error_zone) { ?>
                            <div class="text-danger"><?php echo $error_zone; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-city"><?php echo $entry_city; ?></label>
                        <input type="text" name="city" value="<?php echo $city; ?>" id="input-city"
                               class="form-control <?php echo($error_city ? 'has-error' : ''); ?>"/>
                        <?php if ($error_city) { ?>
                            <div class="text-danger"><?php echo $error_city; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
                        <input type="text" name="address_1" value="<?php echo $address_1; ?>" id="input-address-1"
                               class="form-control <?php echo($error_address_1 ? 'has-error' : ''); ?>"/>
                        <?php if ($error_address_1) { ?>
                            <div class="text-danger"><?php echo $error_address_1; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <div class="col-md-6 hidden">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
                        <input type="text" name="address_2" value="" id="input-address-2"
                               class="form-control <?php echo($error_address_2 ? 'has-error' : ''); ?>"/>
                    </div>
                </div>

                <div class="col-md-6 hidden">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                        <input type="text" name="postcode" value="" placeholder="<?php echo $entry_postcode; ?>"
                               id="input-postcode" class="form-control"/>
                        <?php if ($error_postcode) { ?>
                            <div class="text-danger"><?php echo $error_postcode; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <div class="col-md-6 hidden">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-country"><?php echo $entry_country; ?></label>
                        <select name="country_id" id="input-country" class="form-control">
                            <option value=""><?php echo $text_select; ?></option>
                            <?php foreach ($countries as $country) { ?>
                                <?php if ($country['country_id'] == $country_id) { ?>
                                    <option value="<?php echo $country['country_id']; ?>"
                                            selected="selected"><?php echo $country['name']; ?></option>
                                <?php } else { ?>
                                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                <?php } ?>
                            <?php } ?>
                        </select>
                        <?php if ($error_country) { ?>
                            <div class="text-danger"><?php echo $error_country; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <?php foreach ($custom_fields as $custom_field) { ?>
                    <div class="col-md-6">
                        <?php if ($custom_field['location'] == 'address') { ?>
                            <?php if ($custom_field['type'] == 'select') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"
                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                            id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                            class="form-control">
                                        <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                            <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                                                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                        selected="selected"><?php echo $custom_field_value['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'radio') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"><?php echo $custom_field['name']; ?></label>
                                    <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                        <div class="radio">
                                            <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $address_custom_field[$custom_field['custom_field_id']]) { ?>
                                                <label>
                                                    <input type="radio"
                                                           name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                           value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                           checked="checked"/>
                                                    <?php echo $custom_field_value['name']; ?></label>
                                            <?php } else { ?>
                                                <label>
                                                    <input type="radio"
                                                           name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                           value="<?php echo $custom_field_value['custom_field_value_id']; ?>"/>
                                                    <?php echo $custom_field_value['name']; ?></label>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>
                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'checkbox') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"><?php echo $custom_field['name']; ?></label>
                                    <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                        <div class="checkbox">
                                            <?php if (isset($address_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $address_custom_field[$custom_field['custom_field_id']])) { ?>
                                                <label>
                                                    <input type="checkbox"
                                                           name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]"
                                                           value="<?php echo $custom_field_value['custom_field_value_id']; ?>"
                                                           checked="checked"/>
                                                    <?php echo $custom_field_value['name']; ?></label>
                                            <?php } else { ?>
                                                <label>
                                                    <input type="checkbox"
                                                           name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]"
                                                           value="<?php echo $custom_field_value['custom_field_value_id']; ?>"/>
                                                    <?php echo $custom_field_value['name']; ?></label>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>
                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'text') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"
                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>

                                    <input type="text"
                                           name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                           value="<?php echo(isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                           placeholder="<?php echo $custom_field['name']; ?>"
                                           id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                           class="form-control"/>
                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'textarea') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"
                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>

                                    <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                              rows="5" placeholder="<?php echo $custom_field['name']; ?>"
                                              id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                              class="form-control"><?php echo(isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'file') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"><?php echo $custom_field['name']; ?></label>

                                    <button type="button"
                                            id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                            data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i
                                                class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                    <input type="hidden"
                                           name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                           value="<?php echo(isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : ''); ?>"/>
                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'date') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"
                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="input-group date">
                                        <input type="text"
                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                               value="<?php echo(isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                               placeholder="<?php echo $custom_field['name']; ?>"
                                               data-date-format="YYYY-MM-DD"
                                               id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                               class="form-control"/>
                                        <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'time') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"
                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="input-group time">
                                        <input type="text"
                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                               value="<?php echo(isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                               placeholder="<?php echo $custom_field['name']; ?>"
                                               data-date-format="HH:mm"
                                               id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                               class="form-control"/>
                                        <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'datetime') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"
                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div class="input-group datetime">
                                        <input type="text"
                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                               value="<?php echo(isset($address_custom_field[$custom_field['custom_field_id']]) ? $address_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                               placeholder="<?php echo $custom_field['name']; ?>"
                                               data-date-format="YYYY-MM-DD HH:mm"
                                               id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                               class="form-control"/>
                                        <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>
                <?php } ?>

                <div class="col-md-12">
                    <div class="mb-3">
                        <input type="checkbox" name="default" value="1"
                               id="default" <?php echo($default ? 'checked="checked"' : ''); ?>>
                        <label for="default"><?php echo $entry_default; ?></label>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="buttons clearfix">
                    <div class="text-center">
                        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary"/>
                    </div>
                </div>
            </form>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
    $('button[id^=\'button-custom-field\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $(node).parent().find('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>

<script type="text/javascript"><!--
    $(document).ready(function () {
        if ($('*').is('.has-error')) {
            $('html, body').animate({
                scrollTop: $('.has-error').offset().top - 50
            }, 300);
        }

        getNPCity();
        setTimeout(function () {
            getNPWarehouses();
        }, 300);
    });

    function getNPCity() {
        // Получаем список городов
        $(document).on("focus", 'input[name="city"]', function (e) {
            var city_input = $('input[name="city"]');

            if (!$(this).data("autocomplete")) {
                $(this).autocomplete({
                    'source': function (request, response) {
                        $.ajax({
                            url: 'index.php?route=checkout/quick_checkout/getNPCity&search=' + encodeURIComponent(request.term),
                            dataType: 'json',
                            success: function (json) {
                                response($.map(json, function (item) {
                                    return {
                                        label: item['text'],
                                        value: item['text']
                                    }
                                }));
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                        });
                    },
                    'select': function (item) {
                        city_input.val(item.value);
                        setTimeout(function () {
                            getNPWarehouses();
                        }, 100);
                    }
                });
            } else {
                if ($('input[name="city"]').hasClass('ui-autocomplete-input')) {
                    $('input[name="city"]').autocomplete('destroy');
                }
            }
        });
    }

    function getNPWarehouses() {

        // Формируем список отделений доставки
        if ($('input[name="city"]').val()) {

            var city_name = $('input[name="city"]').val();

            if ($('select').is('select[name="address_1"]')) {
                var warehouse_name = $('select[name="address_1"]').find(":selected").val();
            } else {
                var warehouse_name = $('input[name="address_1"]').val();
            }

            $.ajax({
                url: 'index.php?route=checkout/quick_checkout/getNPWarehouses&search=' + encodeURIComponent(city_name),
                dataType: 'json',
                success: function (json) {

                    console.log();

                    html = '<select class="form-control" name="address_1">';

                    $.map(json, function (item) {
                        if (warehouse_name == item['text']) {
                            html += '<option value="' + item['text'] + '" selected="selected">' + item['text'] + '</option>';
                        } else {
                            html += '<option value="' + item['text'] + '">' + item['text'] + '</option>';
                        }
                    });

                    html += '</select>';

                    $('input[name="address_1"], select[name="address_1"]').replaceWith(html);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });

        } else {
            html = '<input class="form-control" type="text" placeholder="" name="address_1" value="" disabled>';

            $('input[name="address_1"], select[name="address_1"]').replaceWith(html);
        }
    }

    //--></script>

<?php echo $footer; ?>
