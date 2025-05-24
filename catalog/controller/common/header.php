<?php

class ControllerCommonHeader extends Controller
{
    public function index()
    {

        // Remember Me Login
        if (!$this->customer->isLogged() && isset($_COOKIE['oc_customer_id_cookie']) && $_COOKIE['oc_customer_id_cookie'] != '') {
            $remember_token = $_COOKIE['oc_customer_id_cookie'];

            $customer_id = $this->model_account_customer->getCustomerByRememberToken($remember_token);
            if (!empty($customer_id)) {
                if ($this->customer->login_token($remember_token)) {
                    // Unset guest
                    unset($this->session->data['guest']);

                    // Default Shipping Address
                    $this->load->model('account/address');

                    if ($this->config->get('config_tax_customer') == 'payment') {
                        $this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
                    }

                    if ($this->config->get('config_tax_customer') == 'shipping') {
                        $this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
                    }

                    // Wishlist
                    if (isset($this->session->data['wishlist']) && is_array($this->session->data['wishlist'])) {
                        $this->load->model('account/wishlist');

                        foreach ($this->session->data['wishlist'] as $key => $product_id) {
                            $this->model_account_wishlist->addWishlist($product_id);

                            unset($this->session->data['wishlist'][$key]);
                        }
                    }
                }
            }
        }

        // Analytics
        $this->load->model('extension/extension');

        $data['analytics'] = array();

        $analytics = $this->model_extension_extension->getExtensions('analytics');

        foreach ($analytics as $analytic) {
            if ($this->config->get($analytic['code'] . '_status')) {
                $data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
            }
        }

        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
            $this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
        }

        $data['title'] = $this->document->getTitle();

        $data['base'] = $server;
        $data['description'] = $this->document->getDescription();
        $data['keywords'] = $this->document->getKeywords();
        $data['links'] = $this->document->getLinks();
        $data['styles'] = $this->document->getStyles();
        $data['scripts'] = $this->document->getScripts();

        // OCFilter start
        $data['noindex'] = $this->document->isNoindex();
        // OCFilter end

        $data['lang'] = $this->language->get('code');
        $data['direction'] = $this->language->get('direction');

        $data['name'] = $this->config->get('config_name');
        $data['hreflangs'] = array();
        if ($this->config->get('seoproml_status')) {
            $data['hreflangs'] = $this->getHreflang($this->document->getLinks());
        }

        if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
            $data['logo'] = $server . 'image/' . $this->config->get('config_logo');
        } else {
            $data['logo'] = '';
        }

        $this->load->language('common/header');
        $data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI']) - 1));
        $data['og_image'] = $this->document->getOgImage();

        $data['text_home'] = $this->language->get('text_home');

        // Wishlist
        if ($this->customer->isLogged()) {
            $this->load->model('account/wishlist');

            $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
        } else {
            $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
        }

        $data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
        $data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

        $data['text_account'] = $this->language->get('text_account');
        $data['text_register'] = $this->language->get('text_register');
        $data['text_login'] = $this->language->get('text_login');
        $data['text_login_mobile'] = $this->language->get('text_login_mobile');
        $data['text_order'] = $this->language->get('text_order');
        $data['text_transaction'] = $this->language->get('text_transaction');
        $data['text_download'] = $this->language->get('text_download');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_checkout'] = $this->language->get('text_checkout');
        $data['text_page'] = $this->language->get('text_page');
        $data['text_category'] = $this->language->get('text_category');
        $data['text_all'] = $this->language->get('text_all');
        $data['text_more'] = $this->language->get('text_more');
        $data['text_back'] = $this->language->get('text_back');

        $data['home'] = $this->url->link('common/home');
        $data['wishlist'] = $this->url->link('account/wishlist', '', true);
        $data['logged'] = $this->customer->isLogged();
        $data['account'] = $this->url->link('account/account', '', true);
        $data['register'] = $this->url->link('account/register', '', true);
        $data['login'] = $this->url->link('account/login', '', true);
        $data['order'] = $this->url->link('account/order', '', true);
        $data['transaction'] = $this->url->link('account/transaction', '', true);
        $data['download'] = $this->url->link('account/download', '', true);
        $data['logout'] = $this->url->link('account/logout', '', true);
        $data['shopping_cart'] = $this->url->link('checkout/cart');
        $data['checkout'] = $this->url->link('checkout/checkout', '', true);
        $data['contact'] = $this->url->link('information/contact');
        $data['telephone'] = $this->config->get('config_telephone');

        // Cart
        $data['total_products'] = $this->cart->countProducts();

        // Languages
        $data['code'] = $this->session->data['language'];

        $this->load->model('localisation/language');

        $data['languages'] = array();

        $results = $this->model_localisation_language->getLanguages();

        foreach ($results as $result) {
            if ($result['status']) {
                $data['languages'][] = array(
                    'name' => $result['name'],
                    'code' => $result['code']
                );
            }
        }

        // Menu
        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $data['categories'] = array();

        $categories = $this->model_catalog_category->getCategories(999999);
//		$categories = $this->model_catalog_category->getCategories(0);

        foreach ($categories as $category) {
            if ($category['top']) {
                // Level 2
                $children_data = array();

                $children = $this->model_catalog_category->getCategories($category['category_id']);

                foreach ($children as $child) {
                    // Level 3
                    $children_data_2 = array();

                    $children_2 = $this->model_catalog_category->getCategories($child['category_id']);

                    foreach ($children_2 as $child_2) {

                        $children_data_2[] = array(
                            'name' => $child_2['name'],
                            'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_2['category_id']),
                            'children' => $children_data_2,
                        );
                    }

                    if ($category['image_menu']) {
                        $image = $this->model_tool_image->resize($child['image'], 200, 200);
                    } else {
                        $image = false;
                    }

                    $filter_data = array(
                        'filter_category_id' => $child['category_id'],
                        'filter_sub_category' => true
                    );

                    $children_data[] = array(
                        'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
                        'image' => $image,
                        'children' => $children_data_2,
                    );
                }

                if ($category['image_menu']) {
                    $image = $this->model_tool_image->resize($category['image_menu'], 24, 24);
                } else {
                    $image = false;
                }

                // Level 1
                $data['categories'][] = array(
                    'name' => $category['name'],
                    'image' => $image,
                    'children' => $children_data,
                    'column' => $category['column'] ? $category['column'] : 1,
                    'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }

        // Informations
        $this->load->model('catalog/information');

        $data['informations'] = array(
            array(
                'title' => $this->language->get('text_about'),
                'href' => $this->url->link('information/about')
            ),
            array(
                'title' => $this->language->get('text_payment_and_delivery'),
                'href' => $this->url->link('information/payment_and_delivery')
            ),
            array(
                'title' => $this->language->get('text_contact'),
                'href' => $this->url->link('information/contact')
            )
        );

        /*foreach ($this->model_catalog_information->getInformations() as $result) {
            if ($result['bottom']) {
                $data['informations'][] = array(
                    'title' => $result['title'],
                    'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
                );
            }
        }*/

        $data['address'] = nl2br($this->config->get('config_address'));
        $data['telephone'] = $this->config->get('config_telephone');
        $data['fax'] = $this->config->get('config_fax');
        $data['open'] = explode("\n", $this->config->get('config_open'));
        $data['comment'] = $this->config->get('config_comment');

        // Wishlist
        if ($this->customer->isLogged()) {
            $data['total_wishlist'] = $this->model_account_wishlist->getTotalWishlist();
        } else {
            if (!isset($this->session->data['wishlist'])) {
                $this->session->data['wishlist'] = array();
            }

            $data['total_wishlist'] = (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0);
        }

        $data['ajax_auth'] = $this->load->controller('account/ajax_auth');
        $data['language'] = $this->load->controller('common/language');
        $data['currency'] = $this->load->controller('common/currency');
        $data['search'] = $this->load->controller('common/search');
        $data['cart'] = $this->load->controller('common/cart');

        if ($this->config->get('seoproml_logo_status')) {
            $ml_logo = $this->config->get('seoproml_logo');
            if (!empty($ml_logo)) {
                if (is_file(DIR_IMAGE . $ml_logo[$this->config->get('config_language_id')])) {
                    $data['logo'] = $server . 'image/' . $ml_logo[$this->config->get('config_language_id')];
                }
            }
        }

        // For page specific css
        if (isset($this->request->get['route'])) {
            if (isset($this->request->get['product_id'])) {
                $class = '-' . $this->request->get['product_id'];
            } elseif (isset($this->request->get['path'])) {
                $class = '-' . $this->request->get['path'];
            } elseif (isset($this->request->get['manufacturer_id'])) {
                $class = '-' . $this->request->get['manufacturer_id'];
            } elseif (isset($this->request->get['information_id'])) {
                $class = '-' . $this->request->get['information_id'];
            } else {
                $class = '';
            }

            $data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
        } else {
            $data['class'] = 'common-home';
        }

        return $this->load->view('common/header', $data);
    }

    protected function getHreflang()
    {
        $result = array();
        $hreflangs = $this->config->get('seoproml_hreflang');

        $this->load->model('localisation/language');
        $languages = $this->model_localisation_language->getLanguages();

        if (!empty($this->request->get['route'])) {
            $current_language_id = $this->config->get('config_language_id');
            if (isset($this->session->data['language'])) {
                $current_language_code = $this->session->data['language'];
            }

            $_route = $this->request->get['route'];
            $_params = $this->request->get;
            unset($_params['route'], $_params['_route_']);
            foreach ($languages as $language) {
                $this->config->set('config_language_id', $language['language_id']);
                $this->session->data['language'] = $language['code'];
                $hreflang = !empty($hreflangs[$language['language_id']]) ? $hreflangs[$language['language_id']] : $language['code'];
                $result[$hreflang] = array(
                    'language_id' => $language['language_id'],
                    'code' => $language['code'],
                    'name' => $language['name'],
                    'hreflang' => $hreflang,
                    'href' => $this->url->link($_route, http_build_query($_params), true)
                );
                if ($language['code'] == $this->config->get('seoproml_xdefault')) {
                    $result['x-default'] = array(
                        'language_id' => $language['language_id'],
                        'code' => $language['code'],
                        'name' => $language['name'],
                        'hreflang' => 'x-default',
                        'href' => $this->url->link($_route, http_build_query($_params), true)
                    );
                }
            }

            if (isset($current_language_code)) {
                $this->session->data['language'] = $current_language_code;
            }
            $this->config->set('config_language_id', $current_language_id);
        }

        return $result;
    }
}
