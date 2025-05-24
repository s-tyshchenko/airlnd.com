<?php

class ControllerCheckoutQuickCheckout extends Controller
{
    private $error = array();

    public function index()
    {

        $this->load->language('checkout/quick_checkout');

        $this->load->model('account/customer');
        $this->load->model('account/address');
        $this->load->model('tool/image');
        $this->load->model('tool/upload');

        $this->document->setTitle($this->language->get('heading_title'));
        $data['heading_title'] = $this->language->get('heading_title');

        $data['logged'] = $this->customer->isLogged();

        // Add JS
        $this->document->addScript('assets/amitek/scripts/quick_checkout.js');
        $this->document->addStyle('assets/amitek/styles/checkout.css');
//		$this->document->addScript('catalog/view/javascript/jquery/jquery-ui/jquery-ui.min.js');
//		$this->document->addStyle('catalog/view/javascript/jquery/jquery-ui/jquery-ui.min.css');

        // Text
        $data['text_info'] = $this->language->get('text_info');
        $data['text_error'] = $this->language->get('text_error');
        $data['text_step_1'] = $this->language->get('text_step_1');
        $data['text_step_2'] = $this->language->get('text_step_2');
        $data['text_step_3'] = $this->language->get('text_step_3');
        $data['text_country_1'] = $this->language->get('text_country_1');
        $data['text_country_2'] = $this->language->get('text_country_2');
        $data['text_password_reset'] = $this->language->get('text_password_reset');
        $data['text_or'] = $this->language->get('text_or');
        $data['text_register'] = $this->language->get('text_register');
        $data['text_free'] = $this->language->get('text_free');
        $data['text_cart_subtotal'] = $this->language->get('text_cart_subtotal');
        $data['text_cart_total'] = $this->language->get('text_cart_total');
        $data['text_shipping_cost'] = $this->language->get('text_shipping_cost');

        $confirm_link_1 = $this->url->link('information/information', 'information_id=' . $this->config->get('config_checkout_id'), true);
        $confirm_link_2 = $this->url->link('information/information', 'information_id=' . $this->config->get('config_account_id'), true);
        $data['text_order_confirm'] = sprintf($this->language->get('text_order_confirm'), $confirm_link_1, $confirm_link_2);

        // Entry
        $data['entry_firstname'] = $this->language->get('entry_firstname');
        $data['entry_lastname'] = $this->language->get('entry_lastname');
        $data['entry_telephone'] = $this->language->get('entry_telephone');
        $data['entry_address'] = $this->language->get('entry_address');
        $data['entry_address_id'] = $this->language->get('entry_address_id');
        $data['entry_address_1'] = $this->language->get('entry_address_1');
        $data['entry_address_2'] = $this->language->get('entry_address_2');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_shipping_method'] = $this->language->get('entry_shipping_method');
        $data['entry_payment_method'] = $this->language->get('entry_payment_method');
        $data['entry_comment'] = $this->language->get('entry_comment');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_post_office'] = $this->language->get('entry_post_office');
        $data['entry_comment'] = $this->language->get('entry_comment');
        $data['entry_total'] = $this->language->get('entry_total');
        $data['entry_username'] = $this->language->get('entry_username');
        $data['entry_password'] = $this->language->get('entry_password');
        $data['entry_remember'] = $this->language->get('entry_remember');

        // Placeholder
        $data['placeholder_city'] = $this->language->get('placeholder_city');
        $data['placeholder_address'] = $this->language->get('placeholder_address');

        // Button
        $data['button_checkout'] = $this->language->get('button_checkout');
        $data['button_continue'] = $this->language->get('button_continue');
        $data['button_login'] = $this->language->get('button_login');
        $data['button_first_checkout'] = $this->language->get('button_first_checkout');
        $data['button_register'] = $this->language->get('button_register');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('common/home'),
            'text' => $this->language->get('text_home')
        );

        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('checkout/quick_checkout'),
            'text' => $this->language->get('heading_title')
        );

        $data['home'] = $this->url->link('common/home');

        // Cart
        $data['cart'] = $this->cart_data();

        $data['count_products'] = $this->cart->countProducts();

        // User Info
        if ($this->customer->isLogged()) {

            $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

            // Получаем адреса пользователя и выбираем главный добавленный адрес
            $addresses = $this->model_account_address->getAddresses();

            $data['addresses'] = $addresses;

            $data['address_id'] = $customer_info['address_id'];

            if (!empty($addresses[$customer_info['address_id']])) {
                $address_info = $addresses[$customer_info['address_id']];
            } elseif (!empty($addresses) && !empty(reset($addresses))) {
                $address_info = reset($addresses);
            } else {
                $address_info = array();
            }

            // Если адрес найден - назначем все значения соответсвующим полям
            if (!empty($address_info)) {

                $data['firstname'] = $address_info['firstname'];
                $data['lastname'] = $address_info['lastname'];
                // $data['email'] = $address_info['email'];
                $data['telephone'] = $address_info['telephone'];
                $data['country_id'] = $address_info['country_id'];
                $data['country'] = $address_info['country'];
                $data['zone_id'] = $address_info['zone_id'];
                $data['address_1'] = $address_info['address_1'];
                $data['address_2'] = $address_info['address_2'];
                $data['city'] = $address_info['city'];
                $data['shipping_method'] = '';

            } else {

                // Если Адрес не найден - назнаяаем дефолтные данные из кабинета пользователя

                $data['country_id'] = 220;
                $data['country'] = 'Украина';
                $data['zone_id'] = '';
                $data['address_1'] = '';
                $data['address_2'] = '';
                $data['city'] = '';
                $data['shipping_method'] = 'novaposhta.warehouse';

                if (!empty($customer_info)) {
                    $data['firstname'] = $customer_info['firstname'];
                } else {
                    $data['firstname'] = '';
                }

                if (!empty($customer_info)) {
                    $data['lastname'] = $customer_info['lastname'];
                } else {
                    $data['lastname'] = '';
                }

                if (!empty($customer_info)) {
                    $data['telephone'] = $customer_info['telephone'];
                } else {
                    $data['telephone'] = '';
                }
            }

            if (!empty($customer_info)) {
                $data['email'] = $customer_info['email'];
            } else {
                $data['email'] = '';
            }

        } else {
            // Если пользователь не авторизован - добавляем все данные дефолтно
            $data['firstname'] = '';
            $data['lastname'] = '';
            $data['email'] = '';
            $data['telephone'] = '';

            $data['country_id'] = 220;
            $data['country'] = 'Украина';
            $data['zone_id'] = '';
            $data['address_1'] = '';
            $data['address_2'] = '';
            $data['city'] = '';
            $data['shipping_method'] = 'novaposhta.warehouse';

            $data['addresses'] = array();
            $data['address_id'] = '';
        }

        /* ============ QUICK CHECKOUT ============= */

        $data['payment_methods'] = array();
        $data['shipping_methods'] = array();

        // Добавляем дефолтные данные и получаем Методы Доставки
        // Дефлолтный адресс доставки

        $this->session->data['shipping_address']['firstname'] = $data['firstname'];
        $this->session->data['shipping_address']['lastname'] = $data['lastname'];
        $this->session->data['shipping_address']['company'] = '';
        $this->session->data['shipping_address']['address_1'] = $data['address_1'];

        $this->session->data['shipping_address']['address_2'] = $data['address_2'];
        $this->session->data['shipping_address']['postcode'] = '';
        $this->session->data['shipping_address']['city'] = $data['city'];

        $this->session->data['shipping_address']['country_id'] = $data['country_id'];
        $this->session->data['shipping_address']['zone_id'] = $data['zone_id'];

        $this->load->model('localisation/country');

        $country_info = $this->model_localisation_country->getCountry($data['country_id']);

        if ($country_info) {
            $this->session->data['shipping_address']['country'] = $country_info['name'];
            $this->session->data['shipping_address']['iso_code_2'] = $country_info['iso_code_2'];
            $this->session->data['shipping_address']['iso_code_3'] = $country_info['iso_code_3'];
            $this->session->data['shipping_address']['address_format'] = $country_info['address_format'];
        } else {
            $this->session->data['shipping_address']['country'] = $data['country'];
            $this->session->data['shipping_address']['iso_code_2'] = '';
            $this->session->data['shipping_address']['iso_code_3'] = '';
            $this->session->data['shipping_address']['address_format'] = '{firstname} {lastname}' . "\n" . '{telephone}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{address_1}';
        }

        $this->session->data['shipping_address']['custom_field'] = array();

        $this->load->model('localisation/zone');

        $zone_info = $this->model_localisation_zone->getZone(2743);

        if ($zone_info) {
            $this->session->data['shipping_address']['zone'] = $zone_info['name'];
            $this->session->data['shipping_address']['zone_code'] = $zone_info['code'];
        } else {
            $this->session->data['shipping_address']['zone'] = '';
            $this->session->data['shipping_address']['zone_code'] = '';
        }

        // Список методов доставки
        if (isset($this->session->data['shipping_address'])) {
            // Shipping Methods
            $method_data = array();

            $this->load->model('extension/extension');

            $results = $this->model_extension_extension->getExtensions('shipping');

            foreach ($results as $key => $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('extension/shipping/' . $result['code']);

                    $quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($this->session->data['shipping_address']);

                    if ($quote) {
                        $method_data[$result['code']] = array(
                            'title' => $quote['title'],
                            'quote' => $quote['quote'],
                            'sort_order' => $quote['sort_order'],
                            'error' => $quote['error']
                        );

                        // Назначаем первый метод оплаты по умолчанию
                        if ($key == count($results) - 1) {
                            $this->session->data['shipping_method'] = end($method_data[$result['code']]['quote']);
                        }
                    }
                }
            }

            $sort_order = array();

            foreach ($method_data as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $method_data);

            $data['shipping_methods'] = $this->session->data['shipping_methods'] = $method_data;
        }

        if (isset($this->request->post['shipping_method'])) {
            $data['shipping_method_code'] = $this->request->post['shipping_method'];
        } else {
            $data['shipping_method_code'] = $this->session->data['shipping_method']['code'];
        }


        $this->session->data['payment_address']['firstname'] = $data['firstname'];
        $this->session->data['payment_address']['lastname'] = $data['lastname'];
        $this->session->data['payment_address']['company'] = '';
        $this->session->data['payment_address']['address_1'] = $data['address_1'];

        $this->session->data['payment_address']['address_2'] = $data['address_2'];
        $this->session->data['payment_address']['postcode'] = '';
        $this->session->data['payment_address']['city'] = $data['city'];

        $this->session->data['payment_address']['country_id'] = $data['country_id'];
        $this->session->data['payment_address']['zone_id'] = $data['zone_id'];

        $this->load->model('localisation/country');

        $country_info = $this->model_localisation_country->getCountry($data['country_id']);

        if ($country_info) {
            $this->session->data['payment_address']['country'] = $country_info['name'];
            $this->session->data['payment_address']['iso_code_2'] = $country_info['iso_code_2'];
            $this->session->data['payment_address']['iso_code_3'] = $country_info['iso_code_3'];
            $this->session->data['payment_address']['address_format'] = $country_info['address_format'];
        } else {
            $this->session->data['payment_address']['country'] = $data['country'];
            $this->session->data['payment_address']['iso_code_2'] = '';
            $this->session->data['payment_address']['iso_code_3'] = '';
            $this->session->data['payment_address']['address_format'] = '{firstname} {lastname}' . "\n" . '{telephone}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{address_1}';
        }

        $this->session->data['payment_address']['custom_field'] = array();

        $this->load->model('localisation/zone');

        $zone_info = $this->model_localisation_zone->getZone(2743);

        if ($zone_info) {
            $this->session->data['payment_address']['zone'] = $zone_info['name'];
            $this->session->data['payment_address']['zone_code'] = $zone_info['code'];
        } else {
            $this->session->data['payment_address']['zone'] = '';
            $this->session->data['payment_address']['zone_code'] = '';
        }

        // Список Методов Оплаты
        if (isset($this->session->data['payment_address'])) {
            // Totals
            $totals = array();
            $taxes = $this->cart->getTaxes();
            $total = 0;

            // Because __call can not keep var references so we put them into an array.
            $total_data = array(
                'totals' => &$totals,
                'taxes' => &$taxes,
                'total' => &$total
            );

            $this->load->model('extension/extension');

            $sort_order = array();

            $results = $this->model_extension_extension->getExtensions('total');

            foreach ($results as $key => $value) {
                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
            }

            array_multisort($sort_order, SORT_ASC, $results);

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('extension/total/' . $result['code']);

                    // We have to put the totals in an array so that they pass by reference.
                    $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
                }
            }

            // Payment Methods
            $method_data = array();

            $this->load->model('extension/extension');

            $results = $this->model_extension_extension->getExtensions('payment');

            $recurring = $this->cart->hasRecurringProducts();

            $num_method = 0;
            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('extension/payment/' . $result['code']);

                    $method = $this->{'model_extension_payment_' . $result['code']}->getMethod($this->session->data['payment_address'], $total);

                    if ($method) {

                        $num_method++;

                        if ($num_method == 1) {
                            $this->session->data['payment_method'] = $result['code'];
                        }

                        if ($recurring) {
                            if (property_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
                                $method_data[$result['code']] = $method;
                            }
                        } else {
                            $method_data[$result['code']] = $method;
                        }
                    }
                }
            }

            $sort_order = array();

            foreach ($method_data as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $method_data);

            $data['payment_methods'] = $this->session->data['payment_methods'] = $method_data;

        }

        if (isset($this->request->post['payment_method'])) {
            $data['payment_method_code'] = $this->request->post['payment_method'];
        } else {
            $data['payment_method_code'] = $this->session->data['payment_method'];
        }

        // Список регионов для Новой почты
        $data['zones'] = $this->model_localisation_zone->getZonesByCountryId($data['country_id']);

        /* ============ QUICK CHECKOUT ============= */


        $data['continue'] = $this->url->link('common/home');

        $data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

        $this->load->model('extension/extension');

        $data['checkout_buttons'] = array();

        $files = glob(DIR_APPLICATION . '/controller/total/*.php');

        if ($files) {
            foreach ($files as $file) {
                $extension = basename($file, '.php');

                $data[$extension] = $this->load->controller('total/' . $extension);
            }
        }

        // Total
        $data['totals'] = array();

        foreach ($totals as $total) {
            $data['totals'][$total['code']] = array(
                'code' => $total['code'],
                'title' => $total['title'],
                'text' => $this->currency->format($total['value'], $this->session->data['currency']),
            );
        }

        $data['total'] = $this->currency->format($this->cart->getTotal(), $this->session->data['currency']);

        foreach ($totals as $total) {
            if ($total['code'] == 'total') {
                $data['total'] = $this->currency->format($total['value'], $this->session->data['currency']);
            }
        }

        /* echo '<!--';
        print_r($this->session->data);
        echo '-->'; */

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        if ($this->cart->getProducts()) {
            $this->response->setOutput($this->load->view('checkout/quick_checkout.tpl', $data));
        } else {
            $data['text_message'] = $this->language->get('text_error');

            $this->response->setOutput($this->load->view('checkout/error.tpl', $data));
        }

    }

    // Totals
    public function getTotals()
    {
        $this->load->language('checkout/quick_checkout');

        $data['text_cart_subtotal'] = $this->language->get('text_cart_subtotal');
        $data['text_cart_total'] = $this->language->get('text_cart_total');

        $data['button_checkout'] = $this->language->get('button_checkout');

        $data['count_products'] = $this->cart->countProducts();

        // Total
        $data['total'] = $this->currency->format($this->cart->getTotal(), $this->session->data['currency']);

        $this->load->model('extension/extension');

        $totals = array();
        $taxes = $this->cart->getTaxes();
        $total = 0;

        // Because __call can not keep var references so we put them into an array.
        $total_data = array(
            'totals' => &$totals,
            'taxes' => &$taxes,
            'total' => &$total
        );

        // Display prices
        if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
            $sort_order = array();

            $results = $this->model_extension_extension->getExtensions('total');

            foreach ($results as $key => $value) {
                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
            }

            array_multisort($sort_order, SORT_ASC, $results);

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('extension/total/' . $result['code']);

                    // We have to put the totals in an array so that they pass by reference.
                    $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
                }
            }

            $sort_order = array();

            foreach ($totals as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $totals);
        }

        $data['totals'] = array();

        foreach ($totals as $total) {
            $data['totals'][$total['code']] = array(
                'code' => $total['code'],
                'title' => $total['title'],
                'text' => $this->currency->format($total['value'], $this->session->data['currency']),
            );
        }

        $data['total'] = $this->currency->format($this->cart->getTotal(), $this->session->data['currency']);
        $data['total_old'] = $this->currency->format($this->cart->getSubTotal(), $this->session->data['currency']);

        $data['totals'] = array();

        foreach ($totals as $total) {
            if ($total['code'] == 'total') {
                $data['total'] = $this->currency->format($total['value'], $this->session->data['currency']);
            }

            $data['totals'][$total['code']] = array(
                'title' => $this->language->get('text_totals_' . $total['code']),
                'text' => $this->currency->format($total['value'], $this->session->data['currency']),
            );
        }

        $data['total_special'] = $this->currency->format($this->cart->getSubTotal() - $this->cart->getTotal(), $this->session->data['currency']);

        $this->response->setOutput($this->load->view('checkout/quick_checkout_totals.tpl', $data));
    }

    // Cart
    public function cart()
    {
        $this->response->setOutput($this->cart_data());
    }

    protected function cart_data()
    {

        $this->load->language('checkout/quick_checkout');

        $data['heading_title'] = $this->language->get('heading_title');

        // Text
        $data['text_cart'] = $this->language->get('text_cart');
        $data['text_model'] = $this->language->get('text_model');
        $data['text_article'] = $this->language->get('text_article');
        $data['text_quantity'] = $this->language->get('text_quantity');
        $data['text_price'] = $this->language->get('text_price');
        $data['text_total'] = $this->language->get('text_total');
        $data['text_cart_subtotal'] = $this->language->get('text_cart_subtotal');
        $data['text_cart_total'] = $this->language->get('text_cart_total');
        $data['text_special'] = $this->language->get('text_special');
        $data['text_product_out_of_stock'] = $this->language->get('text_product_out_of_stock');

        // Entry
        $data['entry_product_name'] = $this->language->get('entry_product_name');
        $data['entry_size'] = $this->language->get('entry_size');
        $data['entry_color'] = $this->language->get('entry_color');
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['entry_price'] = $this->language->get('entry_price');
        $data['entry_total'] = $this->language->get('entry_total');

        // Button
        $data['button_confirm'] = $this->language->get('button_checkout');

        // Outstock Error
        if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
            $data['error_warning'] = $this->language->get('error_stock');
        } elseif (isset($this->session->data['error'])) {
            $data['error_warning'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } else {
            $data['error_warning'] = '';
        }

        // Total
        $data['total'] = $this->currency->format($this->cart->getTotal(), $this->session->data['currency']);

        // Totals
        $this->load->model('extension/extension');

        $totals = array();
        $taxes = $this->cart->getTaxes();
        $total = 0;

        // Because __call can not keep var references so we put them into an array.
        $total_data = array(
            'totals' => &$totals,
            'taxes' => &$taxes,
            'total' => &$total
        );

        // Display prices
        if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
            $sort_order = array();

            $results = $this->model_extension_extension->getExtensions('total');

            foreach ($results as $key => $value) {
                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
            }

            array_multisort($sort_order, SORT_ASC, $results);

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('extension/total/' . $result['code']);

                    // We have to put the totals in an array so that they pass by reference.
                    $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
                }
            }

            $sort_order = array();

            foreach ($totals as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $totals);
        }

        $data['totals'] = array();

        foreach ($totals as $total) {
            $data['totals'][$total['code']] = array(
                'code' => $total['code'],
                'title' => $total['title'],
                'text' => $this->currency->format($total['value'], $this->session->data['currency']),
            );
        }

        $data['total'] = $this->currency->format($this->cart->getTotal(), $this->session->data['currency']);
        $data['total_old'] = $this->currency->format($this->cart->getSubTotal(), $this->session->data['currency']);

        $data['totals'] = array();

        foreach ($totals as $total) {
            if ($total['code'] == 'total') {
                $data['total'] = $this->currency->format($total['value'], $this->session->data['currency']);
            }

            $data['totals'][$total['code']] = array(
                'title' => $this->language->get('text_totals_' . $total['code']),
                'text' => $this->currency->format($total['value'], $this->session->data['currency']),
            );
        }


        $data['total_special'] = $this->currency->format(preg_replace('~\D+~', '', $data['total_old']) - preg_replace('~\D+~', '', $data['total']), $this->session->data['currency']);

        // Products

        // Custom Option (Данные этих конфигов не выведены в админку и менются в oc_setting)
        $data['color_option_id'] = $this->config->get('config_color_option_id');
        $data['size_option_id'] = $this->config->get('config_size_option_id');

        $this->load->model('tool/image');
        $this->load->model('tool/upload');

        $data['products'] = array();

        $products = $this->cart->getProducts();

        foreach ($products as $product) {

            $product_total = 0;
            foreach ($products as $product_2) {
                if ($product_2['product_id'] == $product['product_id']) {
                    $product_total += $product_2['quantity'];
                }
            }

            if ($product['minimum'] > $product_total) {
                $data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
            }

            if ($product['image']) {
                $image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
            }

            $option_data = array();

            foreach ($product['option'] as $option) {
                if ($option['type'] != 'file') {
                    $value = $option['value'];
                } else {
                    $upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

                    if ($upload_info) {
                        $value = $upload_info['name'];
                    } else {
                        $value = '';
                    }
                }

                $option_data[] = array(
                    'option_id' => $option['option_id'],
                    'option_value_id' => $option['option_value_id'],
                    'name' => $option['name'],
                    'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
                    'type' => $option['type']
                );
            }

            // Display prices
            if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                $unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
                $unit_price_old = $this->tax->calculate($product['price_old'], $product['tax_class_id'], $this->config->get('config_tax'));

                $price_old = $this->currency->format($unit_price_old, $this->session->data['currency']);
                $price = $this->currency->format($unit_price, $this->session->data['currency']);
                $total_old = $this->currency->format($unit_price_old * $product['quantity'], $this->session->data['currency']);
                $total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
            } else {
                $price_old = false;
                $price = false;
                $total_old = false;
                $total = false;
            }

            $data['products'][] = array(
                'cart_id' => $product['cart_id'],
                'thumb' => $image,
                'name' => $product['name'],
                'model' => $product['model'],
                'sku' => $product['sku'],
                'manufacturer' => $product['manufacturer'],
                'option' => $option_data,
                'recurring' => ($product['recurring'] ? $product['recurring']['name'] : ''),
                'quantity' => $product['quantity'],
                'price' => $price,
                'price_old' => $price_old,
                'total' => $total,
                'total_old' => $total_old,
                'href' => $this->url->link('product/product', 'product_id=' . $product['product_id']),
                'stock' => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
            );
        }

        // Modules
        $this->load->model('extension/extension');

        $data['modules'] = array();

        $files = glob(DIR_APPLICATION . '/controller/extension/total/*.php');

        if ($files) {
            foreach ($files as $file) {
                $result = $this->load->controller('extension/total/' . basename($file, '.php'));

                if ($result) {
                    $data['modules'][] = $result;
                }
            }
        }

        return $this->load->view('checkout/quick_checkout_cart.tpl', $data);
    }

    public function checkout()
    {

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            // ================= Записываем дефолтные данные в сессию =========================
            // Дефолтная информация о покупателе
            if (!$this->customer->isLogged()) {
                $this->session->data['account'] = 'guest';

                $this->session->data['guest']['customer_group_id'] = 1;
                $this->session->data['guest']['firstname'] = $this->request->post['firstname'];
                $this->session->data['guest']['lastname'] = $this->request->post['lastname'];
                $this->session->data['guest']['email'] = $this->request->post['email'];
                $this->session->data['guest']['telephone'] = $this->request->post['telephone'];
                $this->session->data['guest']['fax'] = '';

                $this->session->data['guest']['custom_field'] = array();
            } else {
                $this->session->data['customer_info']['firstname'] = $this->request->post['firstname'];
                $this->session->data['customer_info']['lastname'] = $this->request->post['lastname'];
                $this->session->data['customer_info']['email'] = $this->request->post['email'];
                $this->session->data['customer_info']['telephone'] = $this->request->post['telephone'];
            }

            // Дефлолтная платежная информация
            $this->session->data['payment_address']['telephone'] = $this->request->post['telephone'];
            $this->session->data['payment_address']['email'] = $this->request->post['email'];
            $this->session->data['payment_address']['firstname'] = $this->request->post['firstname'];
            $this->session->data['payment_address']['lastname'] = $this->request->post['lastname'];
            $this->session->data['payment_address']['company'] = '';

            if (isset($this->request->post['address_1'])) {
                $this->session->data['payment_address']['address_1'] = $this->request->post['address_1'];
            } else {
                $this->session->data['payment_address']['address_1'] = '';
            }

            if (isset($this->request->post['address_2'])) {
                $this->session->data['payment_address']['address_2'] = $this->request->post['address_2'];
            } else {
                $this->session->data['payment_address']['address_2'] = '';
            }

            if (isset($this->request->post['postcode'])) {
                $this->session->data['payment_address']['postcode'] = $this->request->post['postcode'];
            } else {
                $this->session->data['payment_address']['postcode'] = '';
            }

            if (isset($this->request->post['city'])) {
                $this->session->data['payment_address']['city'] = $this->request->post['city'];
            } else {
                $this->session->data['payment_address']['city'] = '';
            }

            if (isset($this->request->post['country_id'])) {
                $this->session->data['payment_address']['country_id'] = $this->request->post['country_id'];
            } else {
                $this->session->data['payment_address']['country_id'] = 0;
            }

            if (isset($this->request->post['zone_id'])) {
                $this->session->data['payment_address']['zone_id'] = $this->request->post['zone_id'];
            } else {
                $this->session->data['payment_address']['zone_id'] = 0;
            }

            $this->load->model('localisation/country');

            $country_info = $this->model_localisation_country->getCountry($this->config->get('config_country_id'));

            if ($country_info) {
                $this->session->data['payment_address']['country'] = $country_info['name'];
                $this->session->data['payment_address']['iso_code_2'] = $country_info['iso_code_2'];
                $this->session->data['payment_address']['iso_code_3'] = $country_info['iso_code_3'];
                $this->session->data['payment_address']['address_format'] = $country_info['address_format'];
            } else {
                $this->session->data['payment_address']['country'] = '';
                $this->session->data['payment_address']['iso_code_2'] = '';
                $this->session->data['payment_address']['iso_code_3'] = '';
                $this->session->data['payment_address']['address_format'] = '';
            }

            $this->session->data['payment_address']['custom_field'] = array();

            $this->session->data['payment_address']['zone'] = '';
            $this->session->data['payment_address']['zone_code'] = '';

            // Дефолтный адрес доставки
            $this->session->data['guest']['shipping_address'] = true;

            if ($this->session->data['guest']['shipping_address']) {
                $this->session->data['shipping_address']['telephone'] = $this->request->post['telephone'];
                $this->session->data['shipping_address']['email'] = $this->request->post['email'];
                $this->session->data['shipping_address']['firstname'] = $this->request->post['firstname'];
                $this->session->data['shipping_address']['lastname'] = $this->request->post['lastname'];
                $this->session->data['shipping_address']['company'] = '';


                if (isset($this->request->post['address_1'])) {
                    $this->session->data['shipping_address']['address_1'] = $this->request->post['address_1'];
                } else {
                    $this->session->data['shipping_address']['address_1'] = '';
                }

                if (isset($this->request->post['address_2'])) {
                    $this->session->data['shipping_address']['address_2'] = $this->request->post['address_2'];
                } else {
                    $this->session->data['shipping_address']['address_2'] = '';
                }

                if (isset($this->request->post['postcode'])) {
                    $this->session->data['shipping_address']['postcode'] = $this->request->post['postcode'];
                } else {
                    $this->session->data['shipping_address']['postcode'] = '';
                }

                if (isset($this->request->post['city'])) {
                    $this->session->data['shipping_address']['city'] = $this->request->post['city'];
                } else {
                    $this->session->data['shipping_address']['city'] = '';
                }

                if (isset($this->request->post['country_id'])) {
                    $this->session->data['shipping_address']['country_id'] = $this->request->post['country_id'];
                } else {
                    $this->session->data['shipping_address']['country_id'] = 0;
                }

                if (isset($this->request->post['zone_id'])) {
                    $this->session->data['shipping_address']['zone_id'] = $this->request->post['zone_id'];
                } else {
                    $this->session->data['shipping_address']['zone_id'] = 0;
                }

                if ($country_info) {
                    $this->session->data['shipping_address']['country'] = $country_info['name'];
                    $this->session->data['shipping_address']['iso_code_2'] = $country_info['iso_code_2'];
                    $this->session->data['shipping_address']['iso_code_3'] = $country_info['iso_code_3'];
                    $this->session->data['shipping_address']['address_format'] = $country_info['address_format'];
                } else {
                    $this->session->data['shipping_address']['country'] = '';
                    $this->session->data['shipping_address']['iso_code_2'] = '';
                    $this->session->data['shipping_address']['iso_code_3'] = '';
                    $this->session->data['shipping_address']['address_format'] = '';
                }

                $this->session->data['shipping_address']['zone'] = '';
                $this->session->data['shipping_address']['zone_code'] = '';

                $this->session->data['shipping_address']['custom_field'] = array();
            }

            // Комментарий
            $this->session->data['comment'] = '';

            // Методы доставки
            if (isset($this->session->data['shipping_address'])) {
                // Shipping Methods
                $method_data = array();

                $this->load->model('extension/extension');

                $results = $this->model_extension_extension->getExtensions('shipping');

                $num_method = 0;
                foreach ($results as $result) {
                    if ($this->config->get($result['code'] . '_status')) {
                        $this->load->model('extension/shipping/' . $result['code']);

                        $quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($this->session->data['shipping_address']);

                        if ($quote) {
                            $num_method++;

                            $method_data[$result['code']] = array(
                                'title' => $quote['title'],
                                'quote' => $quote['quote'],
                                'sort_order' => $quote['sort_order'],
                                'error' => $quote['error']
                            );

                            // Назначаем первый метод оплаты по умолчанию
                            if ($num_method == 1) {
                                $this->session->data['shipping_method'] = end($method_data[$result['code']]['quote']);
                            }
                        }
                    }
                }

                $sort_order = array();

                foreach ($method_data as $key => $value) {
                    $sort_order[$key] = $value['sort_order'];
                }

                array_multisort($sort_order, SORT_ASC, $method_data);

                $data['shipping_methods'] = $this->session->data['shipping_methods'] = $method_data;
            }

            // Тут перезаписываем выбраный метод доствки
            if (!isset($this->request->post['shipping_method'])) {
                $this->error['shipping'] = $this->language->get('error_shipping');
            } else {
                $shipping = explode('.', $this->request->post['shipping_method']);
                if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
                    $this->error['shipping'] = $this->language->get('error_shipping');
                }
            }

            if (empty($this->error)) {
                $this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
            } else {
                $this->response->addHeader('Content-Type: application/json');
                $this->response->setOutput(json_encode($this->error));
                exit;
            }

            // Список Методов Оплаты
            if (isset($this->session->data['payment_address'])) {
                // Totals
                $totals = array();
                $taxes = $this->cart->getTaxes();
                $total = 0;

                // Because __call can not keep var references so we put them into an array.
                $total_data = array(
                    'totals' => &$totals,
                    'taxes' => &$taxes,
                    'total' => &$total
                );

                $this->load->model('extension/extension');

                $sort_order = array();

                $results = $this->model_extension_extension->getExtensions('total');

                foreach ($results as $key => $value) {
                    $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
                }

                array_multisort($sort_order, SORT_ASC, $results);

                foreach ($results as $result) {
                    if ($this->config->get($result['code'] . '_status')) {
                        $this->load->model('extension/total/' . $result['code']);

                        // We have to put the totals in an array so that they pass by reference.
                        $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
                    }
                }

                // Payment Methods
                $method_data = array();

                $this->load->model('extension/extension');

                $results = $this->model_extension_extension->getExtensions('payment');

                $recurring = $this->cart->hasRecurringProducts();

                foreach ($results as $result) {
                    if ($this->config->get($result['code'] . '_status')) {
                        $this->load->model('extension/payment/' . $result['code']);

                        $method = $this->{'model_extension_payment_' . $result['code']}->getMethod($this->session->data['payment_address'], $total);

                        if ($method) {
                            if ($recurring) {
                                if (property_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
                                    $method_data[$result['code']] = $method;
                                }
                            } else {
                                $method_data[$result['code']] = $method;
                            }
                        }
                    }
                }

                $sort_order = array();

                foreach ($method_data as $key => $value) {
                    $sort_order[$key] = $value['sort_order'];
                }

                array_multisort($sort_order, SORT_ASC, $method_data);

                $this->session->data['payment_methods'] = $method_data;
            }

            // Тут перезаписываем выбраный метод оплаты
            if (isset($this->request->post['payment_method'])) {
                $this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
            } else {
                $this->response->addHeader('Content-Type: application/json');
                $this->response->setOutput(json_encode($this->error));
                exit;
            }

            // ============== Конец записи данных ==================

            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode(array('success' => true)));
        } else {
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($this->error));
        }

    }

    protected function validate()
    {

        // Подключаем файл конфигурации
        $this->load->config('quick_checkout');

        if ($this->config->get('qc_shipping')) {
            $config_qc = $this->config->get('qc_shipping');
        } else {
            $config_qc = false;
        }

        $this->load->language('checkout/quick_checkout');

        // Проверка на наличие товара
        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            $this->error['redirect'] = true;
        }

        // Проверка на минимальное количество товара
        $products = $this->cart->getProducts();

        foreach ($products as $product) {
            $product_total = 0;

            foreach ($products as $product_2) {
                if ($product_2['product_id'] == $product['product_id']) {
                    $product_total += $product_2['quantity'];
                }
            }

            if ($product['minimum'] > $product_total) {
                $this->error['redirect'] = true;
            }
        }

        // Проверка полей
        if (!isset($this->request->post['firstname']) || (utf8_strlen($this->request->post['firstname']) < 3) || (utf8_strlen($this->request->post['firstname']) > 64)) {
            $this->error['error_fields']['firstname'] = $this->language->get('error_firstname');
        }

        if (!isset($this->request->post['lastname']) || (utf8_strlen($this->request->post['lastname']) < 3) || (utf8_strlen($this->request->post['lastname']) > 64)) {
            $this->error['error_fields']['lastname'] = $this->language->get('error_lastname');
        }

        if (!isset($this->request->post['telephone']) || (utf8_strlen($this->request->post['telephone']) < 10)) {
            $this->error['error_fields']['telephone'] = $this->language->get('error_telephone');
        }

        if (!preg_match($this->config->get('config_mail_regexp'), $this->request->post['email'])) {
            $this->error['error_fields']['email'] = $this->language->get('error_email');
        }

        // Проверка полей для метода доставки
        if (!empty($this->request->post['shipping_method'])) {

            $shipping_method = $this->request->post['shipping_method'];

            if ($config_qc && !empty($config_qc[$shipping_method]['fields'])) {
                foreach ($config_qc[$shipping_method]['fields'] as $field => $field_data) {

                    $error_field = false;

                    if (!empty($field_data['validate']) && isset($this->request->post[$field])) {

                        foreach ($field_data['validate'] as $operation => $value) {
                            if ($operation == 'empty') {
                                if (empty($this->request->post[$field])) {
                                    $error_field = true;
                                    $this->error['error_fields_'] = utf8_strlen($this->request->post[$field]);
                                }
                            } elseif ($operation == '>=') {
                                if (utf8_strlen($this->request->post[$field]) >= (int)$value) {
                                    $error_field = true;
                                }
                            } elseif ($operation == '<=') {
                                if (utf8_strlen($this->request->post[$field]) <= (int)$value) {
                                    $error_field = true;
                                    $this->error['error_fields_'] = utf8_strlen($this->request->post[$field]);
                                }
                            } elseif ($operation == '==') {
                                if ($this->request->post[$field] == $value) {
                                    $error_field = true;
                                    $this->error['error_fields_'] = utf8_strlen($this->request->post[$field]);
                                }
                            }
                        }

                    } else {
                        $error_field = true;
                    }

                    if ($error_field) {
                        $this->error['error_fields'][$field] = (!empty($field_data['error'][(int)$this->config->get('config_language_id')]) ? $field_data['error'][(int)$this->config->get('config_language_id')] : true);
                    }

                }
            }

        }

        return !$this->error;
    }

    public function getAddressFields()
    {

        $json = array();

        if (!empty($this->request->post['address_id'])) {
            $this->load->model('account/address');

            // Получаем адреса пользователя и выбираем адрес
            $addresses = $this->model_account_address->getAddresses();

            if (!empty($addresses[$this->request->post['address_id']])) {
                $address_info = $addresses[$this->request->post['address_id']];

                $json['values_fields'] = $address_info;
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function getShippingFields()
    {

        // Подключаем файл конфигурации
        $this->load->config('quick_checkout');

        if ($this->config->get('qc_shipping')) {
            $config_qc = $this->config->get('qc_shipping');
        } else {
            $config_qc = false;
        }

        $data['fields'] = array();

        if ($this->customer->isLogged()) {
            $this->load->model('account/customer');
            $this->load->model('account/address');

            $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

            // Получаем адреса пользователя и выбираем главный добавленный адрес
            $addresses = $this->model_account_address->getAddresses();

            if (!empty($addresses[$customer_info['address_id']])) {
                $address_info = $addresses[$customer_info['address_id']];
            } elseif (!empty($addresses) && !empty(reset($addresses))) {
                $address_info = reset($addresses);
            } else {
                $address_info = array();
            }
        }

        // Проверка полей для метода доставки
        if (!empty($this->request->post['shipping_method'])) {

            $shipping_method = $this->request->post['shipping_method'];

            if ($config_qc && !empty($config_qc[$shipping_method]['fields'])) {

                foreach ($config_qc[$shipping_method]['fields'] as $field => $field_data) {

                    $data['fields'][$field] = array();

                    if (!empty($this->request->post[$field])) {
                        $data['fields'][$field]['value'] = $this->request->post[$field];
                    } elseif (!empty($address_info[$field])) {
                        $data['fields'][$field]['value'] = $address_info[$field];
                    } else {
                        $data['fields'][$field]['value'] = '';
                    }

                    if (!empty($field_data['type'])) {
                        $data['fields'][$field]['type'] = $field_data['type'];
                    } else {
                        $data['fields'][$field]['type'] = 'text';
                    }

                    if (!empty($field_data['name'][(int)$this->config->get('config_language_id')])) {
                        $data['fields'][$field]['name'] = $field_data['name'][(int)$this->config->get('config_language_id')];
                    } else {
                        $data['fields'][$field]['name'] = '';
                    }

                    if (!empty($field_data['placeholder'][(int)$this->config->get('config_language_id')])) {
                        $data['fields'][$field]['placeholder'] = $field_data['placeholder'][(int)$this->config->get('config_language_id')];
                    } else {
                        $data['fields'][$field]['placeholder'] = '';
                    }
                }

            }

        }

        // print_r($data['fields']);

        $this->response->setOutput($this->load->view('checkout/quick_checkout_fields.tpl', $data));
    }
}
