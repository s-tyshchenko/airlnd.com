$(document).ready(function () {

    $(document).on('shown.bs.tab', '[data-bs-target="#tab-register"]', function (event) {
        $(event.target).parents('.modal').first().addClass('modal-lg')
    })

    $(document).on('shown.bs.tab', '[data-bs-target="#tab-login"]', function (event) {
        $(event.target).parents('.modal').first().removeClass('modal-lg')
    })

    $(document).on('click', '[data-action="login"]', function (e) {
        e.preventDefault();
        var form = $(this).attr('data-form');
        ajaxLogin(form);
        return false;
    });

    $(document).on('click', '[data-action="register"]', function (e) {
        e.preventDefault();
        var form = $(this).parents('form').first();
        ajaxRegister(form);
        return false;
    });

    $(document).on('shown.bs.tab', '#tab-login [data-bs-toggle="tab"]', function (e) {
        var target = $(e.target).attr('data-bs-target');
        $('[data-action="login"]').attr('data-form', target)
    });

    // Steps Nav
    $('body').on('click', '.register-business--step:not(.disabled)', function () {
        var step_id = $(this).attr('data-step');
        $('.step_form').hide();
        $(step_id).show();

        $('.register-business--step').removeClass('active');
        $('.register-business--step[data-step="' + step_id + '"]').addClass('active');
        $('.register-business--step[data-step="' + step_id + '"]').prevAll().removeClass('disabled');
        $('.register-business--step[data-step="' + step_id + '"]').nextAll().addClass('disabled');
    });

    // User Group Type
    $(document).on('change', 'input[name="user_group"]', function () {
        var value = $(this).val();

        if (value == '2') {
            $('#form-register--business input[name="edrpou"]').parent().hide();
        } else {
            $('#form-register--business input[name="edrpou"]').parent().show();
        }
    });

    // Validate Step
    $(document).on('click', '[data-action="register-next-step"]', function (e) {

        e.preventDefault();

        var form = $(this).closest('.step_form');

        var next_step_id = $(this).attr('data-next-step');

        var step_data = form.find("select, textarea, input").serialize();

        $.ajax({
            url: 'index.php?route=account/ajax_auth/validate_step',
            type: 'post',
            data: step_data,
            dataType: 'json',
            success: function (json) {
                console.log(json);

                $('.text-danger').remove();
                $('.has-error').removeClass('has-error');

                if (json['next_step']) {
                    $('.step_form').hide();
                    $(next_step_id).show();
                    $('.register-business--step').removeClass('active');
                    $('.register-business--step[data-step="' + next_step_id + '"]').addClass('active');
                    $('.register-business--step[data-step="' + next_step_id + '"]').prevAll().removeClass('disabled');
                    $('.register-business--step[data-step="' + next_step_id + '"]').nextAll().addClass('disabled');
					
					getRegisterNPCity();
					setTimeout(function(){
                        getRegisterNPWarehouses();
                    }, 300);
                }

                if (json['redirect']) {
                    location.reload();
                }

                // Валидация полей формы
                if (json['error_fields']) {
                    $.each(json['error_fields'], function (key, value) {
                        if (key !== 'confirm_check') {
                            form.find('input[name=' + key + ']').addClass('has-error');
                            form.find('input[name=' + key + ']').after('<small class="text-danger">' + value + '</small>');
                        } else {
                            form.find('input[name=' + key + '] + label').after('<small class="text-danger">' + value + '</small>');
                        }
                    });
                }

                if (json['register']) {
                    ajaxRegister('#form-register--business');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

        return false;
    });

});

function ajaxLogin(login_form) {

    var form = $(login_form);
    var form_data = $(login_form).find("select, textarea, input").serialize();

    $.ajax({
        url: 'index.php?route=account/ajax_auth/login',
        type: 'post',
        data: form_data,
        dataType: 'json',
        success: function (json) {
            $('.text-danger').remove();
            $('.has-error').removeClass('has-error');

            if (json['redirect']) {
                location.reload();
            }

            if (json['error_fields']) {
                $.each(json['error_fields'], function (key, value) {
                    if (key !== 'confirm_check') {
                        form.find('input[name=' + key + ']').addClass('has-error');
                        form.find('input[name=' + key + ']').after('<small class="text-danger">' + value + '</small>');
                    } else {
                        form.find('input[name=' + key + '] + label').after('<small class="text-danger">' + value + '</small>');
                    }
                });
            }

            if (json['success']) {
                window.location.href = 'index.php?route=account/account';
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

    return false;

}

function ajaxRegister(register_form) {

    var form = $(register_form);
    var form_data = $(register_form).find("select, textarea, input").serialize();

    console.log(form_data);

    $.ajax({
        url: 'index.php?route=account/ajax_auth/register',
        type: 'post',
        data: form_data,
        dataType: 'json',
        success: function (json) {
            console.log(json);

            $('.text-danger').remove();
            $('.has-error').removeClass('has-error');

            // Если уже авторизован
            if (json['redirect']) {
                location.reload();
            }

            // Валидация полей формы
            if (json['error_fields']) {
                $.each(json['error_fields'], function (key, value) {
                    if (key !== 'confirm_check') {
                        form.find('input[name=' + key + ']').addClass('has-error');
                        form.find('input[name=' + key + ']').after('<div class="text-danger">' + value + '</div>');
                    } else {
                        form.find('input[name=' + key + '] + label').after('<div class="text-danger">' + value + '</div>');
                    }
                });
            }

            if (json['success']) {
                window.location.href = 'index.php?route=account/account';
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });

    return false;

}
     
function getRegisterNPCity(){
	// Получаем список городов
	$(document).on("focus", '#popup_register input[name="city"]', function(e) {
		var city_input = $(this);
		
		if($('#popup_register input[name="city"]').hasClass('ui-autocomplete-input')) {
			$('#popup_register input[name="city"]').autocomplete('destroy');
		}
		
		if (!$(this).data("autocomplete")) {
			$(this).autocomplete({
				'source': function(request, response) {
					$.ajax({
						url: 'index.php?route=checkout/quick_checkout/getNPCity&search=' +  encodeURIComponent(request.term),
						dataType: 'json',
						success: function(json) {
							response($.map(json, function(item) {
								return {
									label: item['text'],
									value: item['text']
								}
							}));
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});
				},
				'select': function(item) {
					city_input.val(item.value);	
                    setTimeout(function(){
                        getRegisterNPWarehouses();
                    }, 100);
				}
			});
		}
	});
}

function getRegisterNPWarehouses(){
	
	// Формируем список отделений доставки    
	if($('#popup_register input[name="city"]').val()){
	
		var city_name = $('#popup_register input[name="city"]').val();
        
		if($('select').is('#popup_register select[name="address_1"]')){
			var warehouse_name = $('#popup_register select[name="address_1"]').find(":selected").val();
		} else{
			var warehouse_name = $('#popup_register input[name="address_1"]').val();
		}
	
		$.ajax({
			url: 'index.php?route=checkout/quick_checkout/getNPWarehouses&search=' +  encodeURIComponent(city_name),
			dataType: 'json',
			success: function(json) {
				
				console.log();
				
				html = '<select class="form-control" name="address_1">';
				
				$.map(json, function(item) {
					if(warehouse_name == item['text']){
						html += '<option value="' + item['text'] + '" selected="selected">' + item['text'] + '</option>';
					} else {
						html += '<option value="' + item['text'] + '">' + item['text'] + '</option>';
					}
				});
				
				html += '</select>';
				
				$('#popup_register input[name="address_1"], #popup_register select[name="address_1"]').replaceWith(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		
	} else {
        html = '<input class="form-control" type="text" placeholder="" name="address_1" value="" disabled>';
		
		$('#popup_register input[name="address_1"], #popup_register select[name="address_1"]').replaceWith(html);
	}
}