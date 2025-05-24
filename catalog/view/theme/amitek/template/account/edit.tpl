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

    <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="account-layout">
        <?php echo $column_left; ?>

        <div class="content">
            <?php echo $content_top; ?>

            <form action="<?php echo $action; ?>" class="row" method="post" enctype="multipart/form-data">

                <?php if ($success) { ?>
                    <div class="col-md-12">
                        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                        </div>
                    </div>
                <?php } ?>

                <?php if ($customer_type_id > 1) { ?>
                    <div class="col-md-6">
                        <div class="mb-3 required">
                            <label class="form-label" for="input-edrpou"><?php echo $entry_edrpou; ?> </label>
                            <input type="text" name="edrpou" value="<?php echo $edrpou; ?>" id="input-edrpou"
                                   class="form-control <?php echo($error_edrpou ? 'has-error' : ''); ?>"/>
                            <?php if ($error_edrpou) { ?>
                                <div class="text-danger"><?php echo $error_edrpou; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="mb-3 required">
                            <label class="form-label" for="input-ipn"><?php echo $entry_ipn; ?> </label>
                            <input type="text" name="ipn" value="<?php echo $ipn; ?>" id="input-ipn"
                                   class="form-control <?php echo($error_ipn ? 'has-error' : ''); ?>"/>
                            <?php if ($error_ipn) { ?>
                                <div class="text-danger"><?php echo $error_ipn; ?></div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="mb-3 required">
                            <label class="form-label" for="input-company"><?php echo $entry_company; ?> </label>
                            <input type="text" name="company" value="<?php echo $company; ?>" id="input-company"
                                   class="form-control <?php echo($error_company ? 'has-error' : ''); ?>"/>
                            <?php if ($error_company) { ?>
                                <div class="text-danger"><?php echo $error_company; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                <?php } else { ?>
                    <input type="hidden" name="edrpou" value="<?php echo $edrpou; ?>"/>
                    <input type="hidden" name="ipn" value="<?php echo $ipn; ?>"/>
                    <input type="hidden" name="company" value="<?php echo $company; ?>"/>
                <?php } ?>

                <div class="col-md-6">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-firstname"><?php echo $entry_firstname; ?> </label>
                        <input type="text" name="firstname" value="<?php echo $firstname; ?>" id="input-firstname"
                               class="form-control <?php echo($error_firstname ? 'has-error' : ''); ?>"/>
                        <?php if ($error_firstname) { ?>
                            <div class="text-danger"><?php echo $error_firstname; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                        <input type="text" name="lastname" value="<?php echo $lastname; ?>" id="input-lastname"
                               class="form-control <?php echo($error_lastname ? 'has-error' : ''); ?>"/>
                        <?php if ($error_lastname) { ?>
                            <div class="text-danger"><?php echo $error_lastname; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <?php if ($customer_type_id > 1) { ?>
                    <div class="col-md-6">
                        <div class="mb-3 required">
                            <label class="form-label"
                                   for="input-middlename"><?php echo $entry_middlename; ?> </label>
                            <input type="text" name="middlename" value="<?php echo $middlename; ?>"
                                   id="input-middlename"
                                   class="form-control <?php echo($error_middlename ? 'has-error' : ''); ?>"/>
                            <?php if ($error_middlename) { ?>
                                <div class="text-danger"><?php echo $error_middlename; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                <?php } else { ?>
                    <input type="hidden" name="middlename" value="<?php echo $middlename; ?>"/>
                <?php } ?>

                <div class="col-md-6">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-email"><?php echo $entry_email; ?></label>
                        <input type="email" name="email" value="<?php echo $email; ?>" id="input-email"
                               class="form-control <?php echo($error_email ? 'has-error' : ''); ?>"/>
                        <?php if ($error_email) { ?>
                            <div class="text-danger"><?php echo $error_email; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="mb-3 required">
                        <label class="form-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                        <input type="tel" name="telephone" value="<?php echo $telephone; ?>" id="input-telephone"
                               class="form-control <?php echo($error_telephone ? 'has-error' : ''); ?>"/>
                        <?php if ($error_telephone) { ?>
                            <div class="text-danger"><?php echo $error_telephone; ?></div>
                        <?php } ?>
                    </div>
                </div>

                <?php if ($customer_type_id > 1) { ?>
                    <div class="col-md-6">
                        <div class="mb-3 required">
                            <label class="form-label" for="input-fax"><?php echo $entry_fax; ?></label>
                            <input type="tel" name="fax" value="<?php echo $fax; ?>" id="input-fax"
                                   class="form-control <?php echo($error_fax ? 'has-error' : ''); ?>"/>
                            <?php if ($error_fax) { ?>
                                <div class="text-danger"><?php echo $error_fax; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                <?php } else { ?>
                    <input type="hidden" name="fax" value="<?php echo $fax; ?>"/>
                <?php } ?>

                <div class="clearfix"></div>

                <?php foreach ($custom_fields as $custom_field) { ?>
                    <div class="col-md-6">
                        <?php if ($custom_field['location'] == 'account') { ?>
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
                                            <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
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
                                            <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
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
                                    <div>
                                        <div>
                                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                                                <div class="checkbox">
                                                    <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
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
                                        </div>
                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'text') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"
                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div>
                                        <input type="text"
                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                               value="<?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                               id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                               class="form-control"/>
                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'textarea') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"
                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div>
                                        <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                  rows="5"
                                                  id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                  class="form-control"><?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'file') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"><?php echo $custom_field['name']; ?></label>
                                    <div>
                                        <button type="button"
                                                id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                data-loading-text="<?php echo $text_loading; ?>"
                                                class="btn btn-default"><i
                                                    class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                        <input type="hidden"
                                               name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                               value="<?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>"/>
                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'date') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"
                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div>
                                        <div class="input-group date">
                                            <input type="text"
                                                   name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                   value="<?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                   data-date-format="YYYY-MM-DD"
                                                   id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                   class="form-control"/>
                                            <span class="input-group-btn">
                                    <button type="button" class="btn btn-default"><i
                                                class="fa fa-calendar"></i></button>
                                </span></div>
                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'time') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"
                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div>
                                        <div class="input-group time">
                                            <input type="text"
                                                   name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                   value="<?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                   data-date-format="HH:mm"
                                                   id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                   class="form-control"/>
                                            <span class="input-group-btn">
                                    <button type="button" class="btn btn-default"><i
                                                class="fa fa-calendar"></i></button>
                                </span></div>
                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if ($custom_field['type'] == 'datetime') { ?>
                                <div class="mb-3<?php echo($custom_field['required'] ? ' required' : ''); ?> custom-field"
                                     data-sort="<?php echo $custom_field['sort_order']; ?>">
                                    <label class="form-label"
                                           for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                                    <div>
                                        <div class="input-group datetime">
                                            <input type="text"
                                                   name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]"
                                                   value="<?php echo(isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>"
                                                   data-date-format="YYYY-MM-DD HH:mm"
                                                   id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"
                                                   class="form-control"/>
                                            <span class="input-group-btn">
                                    <button type="button" class="btn btn-default"><i
                                                class="fa fa-calendar"></i></button>
                                </span></div>
                                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                                            <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>
                <?php } ?>

                <div class="clearfix"></div>

                <div class="buttons clearfix col-md-12">
                    <div class="text-center">
                        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary"/>
                    </div>
                </div>

            </form>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>

<script type="text/javascript">
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
</script>
<script type="text/javascript">
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });
</script>
<?php echo $footer; ?>
