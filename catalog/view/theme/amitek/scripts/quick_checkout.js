$(document).ready(function(){	
	
	// Выбор метода доставки
	$(document).on('change', 'input[name="shipping_method"]', function(){
		updateAddressForm();
	});
	
	updateAddressForm();
	
	// Отправка заказа
	$(document).on('submit', '#quick_checkout', function(){
		
		console.log('start');
		
		// Сохранение выбранного метода доставки
		saveShippingMethod();
		return false;
	});
	
	// Выбор адреса доставки из списка существущих
	$(document).on('change', 'select[name="address_id"]', function(){
		var address_id = $(this).val();
	
		var form = $('#quick_checkout');
		
		$.ajax({
			url: 'index.php?route=checkout/quick_checkout/getAddressFields',
			type: 'post',
			data: 'address_id=' + address_id,
			dataType: 'json',
			success: function(json) {
				console.log(json);
				
				html = '<input class="form-control" type="text" placeholder="" id="qc_address_1" name="address_1" value="" disabled>';
				$('#quick_checkout input[name="address_1"], #quick_checkout select[name="address_1"]').replaceWith(html);
				
				if(json['values_fields']){
					$.each(json['values_fields'], function(key, value){
						form.find('input[name=' + key + ']').val(value);
					});
				}
				
				setTimeout(function(){
					getCheckoutNPWarehouses();
				}, 100);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});

function updateAddressForm(){
	$('.shipping_fields').html('');
	$('.shipping_fields').hide();

	var shipping_method = $('input[name="shipping_method"]:checked').attr('data-code');

	$.ajax({
		url: 'index.php?route=checkout/quick_checkout/getShippingFields',
		type: 'post',
		data: $('#quick_checkout').serialize(),
		dataType: 'html',
		success: function(html) {
			$('#shipping_fields_' + shipping_method).html(html);
			$('#shipping_fields_' + shipping_method).show('')
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
	
}

function saveShippingMethod(){	
	$.ajax({
		url: 'index.php?route=checkout/shipping_method/save',
		type: 'post',
		data: $('#quick_checkout').serialize(),
		success: function(data) {
			savePaymentMethod();
		},
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
		success: function(json) {
			sendOrderForm();
		},
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

function getCheckoutNPCity(){
	$('body').on("focus", '#qc_city', function(e) {
		var city_input = $(this);
		
		if (!$(this).data("autocomplete")) {
			$(this).autocomplete({
				'appendTo': $(this).parent(),
				'classes': {
					'ui-autocomplete': 'dropdown-menu show',
					'ui-menu-item': '',
					'ui-menu-item-wrapper': 'dropdown-item'
				},
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

					var shipping_method = $('input[name="shipping_method"]:checked').val();

					if(shipping_method !== 'novaposhta.doors'){				
						setTimeout(function(){
							getCheckoutNPWarehouses();
						}, 100);	
					}
				}
			});
		} else {
			if($('#quick_checkout input[name="city"]').hasClass('ui-autocomplete-input')) {
				$('#quick_checkout input[name="city"]').autocomplete('destroy');
			}
		}
	});
}

function getCheckoutNPWarehouses(){
	
	console.log($('#quick_checkout input[name="city"]').val());
	// Формируем список отделений доставки
	if($('#quick_checkout input[name="city"]').val()){
	
		var city_name = $('#quick_checkout input[name="city"]').val();
		
		console.log(city_name);
		
		if($('select').is('#quick_checkout select[name="address_1"]')){
			var warehouse_name = $('#quick_checkout select[name="address_1"]').find(":selected").val();
		} else{
			var warehouse_name = $('#quick_checkout input[name="address_1"]').val();
		}
		
		console.log(warehouse_name);
	
		$.ajax({
			url: 'index.php?route=checkout/quick_checkout/getNPWarehouses&search=' +  encodeURIComponent(city_name),
			dataType: 'json',
			success: function(json) {
				
				html = '<select id="qc_address_1" class="form-control" name="address_1">';
				
				$.map(json, function(item) {
					if(warehouse_name == item['text']){
						html += '<option value="' + item['text'] + '" selected="selected">' + item['text'] + '</option>';
					} else {
						html += '<option value="' + item['text'] + '">' + item['text'] + '</option>';
					}
				});
				
				html += '</select>';
				
				$('#quick_checkout input[name="address_1"], #quick_checkout select[name="address_1"]').replaceWith(html);
				
				/* $(document).on("focus", '#input-post_office', function(e) {
					if (!$(this).data("autocomplete")) {
						$(this).autocomplete();
					}
				}); */
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
		
	} else {
        html = '<input class="form-control" type="text" placeholder="" id="qc_address_1" name="address_1" value="" disabled>';
		
		$('#quick_checkout input[name="address_1"], #quick_checkout select[name="address_1"]').replaceWith(html);
	}
}