<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');	

		$data['logged'] = $this->customer->isLogged();
		
		// Live Search
		$data['live_search'] = '';
		
		if($this->config->get('live_search_ajax_status')){
			$this->load->language('product/search');
        	$text_view_all_results = $this->config->get('live_search_view_all_results');

        	$liveSearch = [
				'text_view_all_results'               => htmlspecialchars($text_view_all_results[$this->config->get('config_language_id')]['name']),
				'text_empty'                          => $this->language->get('text_empty'),
                'text_sku'                            => $this->language->get('text_sku'),
				'module_live_search_show_image'       => (int)$this->config->get('live_search_show_image'),
				'module_live_search_show_price'       => (int)$this->config->get('live_search_show_price'),
				'module_live_search_show_description' => (int)$this->config->get('live_search_show_description'),
				'module_live_search_min_length'       => (int)$this->config->get('live_search_min_length'),
				'module_live_search_show_add_button'  => (int)$this->config->get('live_search_show_add_button'),
        	];
			
            $this->document->addStyle('assets/amitek/vendor/live-search/live-search.css');

            $data['live_search'] .= '<script type="text/javascript">
				$(document).ready(function() {
					const LiveSearchInstance = new LiveSearchJs('.json_encode($liveSearch).');
				});
			</script>';
		}

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_open'] = $this->language->get('text_open');
		$data['text_privacy_policy'] = $this->language->get('text_privacy_policy');
		$data['text_public_offer'] = $this->language->get('text_public_offer');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));
		
		$data['address'] = nl2br($this->config->get('config_address'));
		$data['telephone'] = $this->config->get('config_telephone');
		$data['fax'] = $this->config->get('config_fax');
		$data['open'] = nl2br($this->config->get('config_open'));
		$data['phones'] = explode("\n", $this->config->get('config_comment'));
		$data['email'] = $this->config->get('config_email');
		
		// Custom Menu
		$this->load->model('extension/module/menu');
		
		$data['menu_data'] = $this->model_extension_module_menu->getMenuTitle();
		
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
		
		$data['instagram'] = $this->config->get('config_instagram');
		$data['whatsapp'] = $this->config->get('config_whatsapp');
		$data['telegram'] = $this->config->get('config_telegram');
		
		$data['confirm_link_1'] = $this->url->link('information/information', 'information_id=' . $this->config->get('config_account_id'), true);
		$data['confirm_link_2'] = $this->url->link('information/information', 'information_id=' . $this->config->get('config_checkout_id'), true);

        $data['language'] = $this->load->controller('common/language');

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
