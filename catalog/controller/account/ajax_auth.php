<?php
class ControllerAccountAjaxAuth extends Controller {
	private $error = array();
	
	public function index() {
		
		$this->load->language('account/ajax_auth');

		$data['logged'] = $this->customer->isLogged();

		$this->load->model('localisation/zone');

		$data['zones'] = $this->model_localisation_zone->getZonesByCountryId('220');

		$data = array_merge($data, $this->language->all());

		return $this->load->view('account/ajax_auth', $data);
	}
	
	public function register() {
		
		$json = array();
		
		if ($this->customer->isLogged()) {
			$json['success'] = true;
		}

		$this->load->language('account/register');

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->ajax_validate()) {
			
			if(!empty($this->request->post['user_group'])){
				$data['customer_group_id'] = 1;
				$data['customer_type_id'] = $this->request->post['user_group'];
			}
			
			// Дефолтные данные для адреса
			$this->request->post['postcode'] = '';
			$this->request->post['country_id'] = '220';
			$this->request->post['address_2'] = '';
			$this->request->post['zone_id'] = '';
			if(isset($this->request->post['user_default'])){
				$this->request->post['middlename'] = '';
				$this->request->post['address_1'] = '';
				$this->request->post['fax'] = '';
				$this->request->post['city'] = '';
				$this->request->post['company'] = '';
				$this->request->post['edrpou'] = '';
				$this->request->post['ipn'] = '';
				$this->request->post['pdv'] = '';
			}
			
			$customer_id = $this->model_account_customer->addCustomer($this->request->post);

			// Clear any previous login attempts for unregistered accounts.
			$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);

			$this->customer->login($this->request->post['email'], $this->request->post['password']);

			unset($this->session->data['guest']);

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				$activity_data = array(
					'customer_id' => $customer_id,
					'name'        => $this->request->post['firstname'] . ' ' . $this->request->post['lastname']
				);

				$this->model_account_activity->addActivity('register', $activity_data);
			}

			$json['success'] = true;
		} else {
			$json['error_fields'] = $this->error;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	private function ajax_validate() {

		// Постоянные поля для всех пользователей
		if (empty($this->request->post['firstname']) || (utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if (empty($this->request->post['lastname']) || (utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if (empty($this->request->post['email']) || (utf8_strlen($this->request->post['email']) > 96) || !preg_match($this->config->get('config_mail_regexp'), $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_exists_email');
		}

		if (empty($this->request->post['telephone']) || (utf8_strlen($this->request->post['telephone']) < 10) || (utf8_strlen($this->request->post['telephone']) > 25)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}

		if ($this->model_account_customer->getTotalCustomersByTelephone($this->request->post['telephone'])) {
			$this->error['telephone'] = $this->language->get('error_exists_telephone');
		}		
		
		if (empty($this->request->post['password']) || (utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if (empty($this->request->post['confirm']) || $this->request->post['confirm'] != $this->request->post['password']) {
			$this->error['confirm'] = $this->language->get('error_confirm');
		}
		
		if (empty($this->request->post['confirm_check'])) {
			$this->error['confirm_check'] = $this->language->get('error_confirm_check');
		}
		
		// Специальные поля для ФОП
		if(empty($this->request->post['user_default'])){
			if(!empty($this->request->post['user_group']) && $this->request->post['user_group'] == 3){
				if (empty($this->request->post['edrpou']) || (utf8_strlen(trim($this->request->post['edrpou'])) < 2) || (utf8_strlen(trim($this->request->post['edrpou'])) > 256)) {
					$this->error['edrpou'] = $this->language->get('error_edrpou');
				}
			}
			
			if (empty($this->request->post['ipn']) || (utf8_strlen(trim($this->request->post['ipn'])) < 2) || (utf8_strlen(trim($this->request->post['ipn'])) > 256)) {
				$this->error['ipn'] = $this->language->get('error_ipn');
			}
			
			if (empty($this->request->post['company']) || (utf8_strlen(trim($this->request->post['company'])) < 2) || (utf8_strlen(trim($this->request->post['company'])) > 256)) {
				$this->error['company'] = $this->language->get('error_company');
			}

			if (empty($this->request->post['middlename']) || (utf8_strlen(trim($this->request->post['middlename'])) < 1) || (utf8_strlen(trim($this->request->post['middlename'])) > 32)) {
				$this->error['middlename'] = $this->language->get('error_middlename');
			}

			if (empty($this->request->post['fax']) || (utf8_strlen($this->request->post['fax']) < 10) || (utf8_strlen($this->request->post['fax']) > 25)) {
				$this->error['fax'] = $this->language->get('error_fax');
			}
			
			if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '' || !is_numeric($this->request->post['zone_id'])) {
				//$this->error['zone'] = $this->language->get('error_zone');
			}

			if (empty($this->request->post['city']) || (utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
				$this->error['city'] = $this->language->get('error_city');
			}
			
			if (empty($this->request->post['address_1']) || (utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
				$this->error['address_1'] = $this->language->get('error_address_1');
			}
			
			if (empty($this->request->post['address_2']) || (utf8_strlen(trim($this->request->post['address_2'])) < 3) || (utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
				//$this->error['address_2'] = $this->language->get('error_address_2');
			}
		}

		return !$this->error;
	}

	public function validate_step() {
		$json = array();
		
		$this->load->model('account/customer');
		
		$this->load->language('account/register');
		
		if ($this->customer->isLogged()) {
			$json['redirect'] = true;
		}
		
		if (!empty($this->request->post['fop_step'])) {
			
			if($this->request->post['fop_step'] =='1'){
				if(!empty($this->request->post['user_group']) && $this->request->post['user_group'] == 3){
					if (empty($this->request->post['edrpou']) || (utf8_strlen(trim($this->request->post['edrpou'])) < 2) || (utf8_strlen(trim($this->request->post['edrpou'])) > 256)) {
						$this->error['edrpou'] = $this->language->get('error_edrpou');
					}
				}
				
				if (empty($this->request->post['ipn']) || (utf8_strlen(trim($this->request->post['ipn'])) < 2) || (utf8_strlen(trim($this->request->post['ipn'])) > 256)) {
					$this->error['ipn'] = $this->language->get('error_ipn');
				}
				
				if (empty($this->request->post['company']) || (utf8_strlen(trim($this->request->post['company'])) < 2) || (utf8_strlen(trim($this->request->post['company'])) > 256)) {
					$this->error['company'] = $this->language->get('error_company');
				}
				
				if (empty($this->request->post['password']) || (utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
					$this->error['password'] = $this->language->get('error_password');
				}

				if (empty($this->request->post['confirm']) || $this->request->post['confirm'] != $this->request->post['password']) {
					$this->error['confirm'] = $this->language->get('error_confirm');
				}
				
			} elseif($this->request->post['fop_step'] == '2'){
				
				if (empty($this->request->post['firstname']) || (utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
					$this->error['firstname'] = $this->language->get('error_firstname');
				}

				if (empty($this->request->post['lastname']) || (utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
					$this->error['lastname'] = $this->language->get('error_lastname');
				}

				if (empty($this->request->post['middlename']) || (utf8_strlen(trim($this->request->post['middlename'])) < 1) || (utf8_strlen(trim($this->request->post['middlename'])) > 32)) {
					$this->error['middlename'] = $this->language->get('error_middlename');
				}

				if (empty($this->request->post['email']) || (utf8_strlen($this->request->post['email']) > 96) || !preg_match($this->config->get('config_mail_regexp'), $this->request->post['email'])) {
					$this->error['email'] = $this->language->get('error_email');
				}

				if (empty($this->request->post['email']) && $this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
					$this->error['email'] = $this->language->get('error_exists_email');
				}

				if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
					$this->error['email'] = $this->language->get('error_exists_email');
				}

				if (empty($this->request->post['telephone']) || (utf8_strlen($this->request->post['telephone']) < 10) || (utf8_strlen($this->request->post['telephone']) > 25)) {
					$this->error['telephone'] = $this->language->get('error_telephone');
				}

				if (empty($this->request->post['telephone']) && $this->model_account_customer->getTotalCustomersByTelephone($this->request->post['telephone'])) {
					$this->error['telephone'] = $this->language->get('error_exists_telephone');
				}

				if ($this->model_account_customer->getTotalCustomersByTelephone($this->request->post['telephone'])) {
					$this->error['telephone'] = $this->language->get('error_exists_telephone');
				}

				if (empty($this->request->post['fax']) || (utf8_strlen($this->request->post['fax']) < 10) || (utf8_strlen($this->request->post['fax']) > 25)) {
					$this->error['fax'] = $this->language->get('error_fax');
				}

				if ($this->model_account_customer->getTotalCustomersByTelephone($this->request->post['fax'])) {
					$this->error['fax'] = $this->language->get('error_exists_telephone');
				}
				
			} elseif($this->request->post['fop_step'] == '3') {
				
				if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '' || !is_numeric($this->request->post['zone_id'])) {
					//$this->error['zone'] = $this->language->get('error_zone');
				}

				if (empty($this->request->post['city']) || (utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
					$this->error['city'] = $this->language->get('error_city');
				}
				
				if (empty($this->request->post['address_1']) || (utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
					$this->error['address_1'] = $this->language->get('error_address_1');
				}
				
				if (empty($this->request->post['address_2']) || (utf8_strlen(trim($this->request->post['address_2'])) < 3) || (utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
					//$this->error['address_2'] = $this->language->get('error_address_2');
				}
				
				if (empty($this->request->post['confirm_check'])) {
					$this->error['confirm_check'] = $this->language->get('error_confirm_check');
				}
				
				$json['register'] = true;
		
			} else {
				$this->error['fop_step'] = $this->request->post['fop_step'];
			}
			
			if(!$this->error){
				$json['next_step'] = true;
			} else {
				$json['error_fields'] = $this->error;
			}
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	// Login
	public function login() {
		
		$json = array();
		
		$this->load->model('account/customer');

		if ($this->customer->isLogged()) {
			$json['success'] = true;
		}

		$this->load->language('account/login');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->login_validate()) {
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

			// Add to activity log
			if ($this->config->get('config_customer_activity')) {
				$this->load->model('account/activity');

				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
				);

				$this->model_account_activity->addActivity('login', $activity_data);
			}
			
			// Remember Me
			if (isset($this->request->post['remember'])) {
				$remember_token = $this->model_account_customer->editRememberToken($this->customer->getId());
				
				setcookie("oc_customer_id_cookie", $remember_token, time() + (10 * 365 * 24 * 60 * 60), "/");
			}

			$json['success'] = true;
		} else {
			$json['error_fields'] = $this->error;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	protected function login_validate() {

		if(!empty($this->request->post['user_default'])){
			// Check if customer has been approved.
			$customer_info = $this->model_account_customer->getCustomerByEmailOrPhone($this->request->post['username']);

			/* if ($customer_info && !$customer_info['approved']) {
				$this->error['username'] = $this->language->get('error_approved');
				$this->error['password'] = $this->language->get('error_approved');
			} */
			
			if (!$this->error) {
				if (!$this->customer->login($this->request->post['username'], $this->request->post['password'])) {
					$this->error['username'] = $this->language->get('error_login');
					$this->error['password'] = $this->language->get('error_login');
				}
			}
		} else {
			
			// Check if customer has been approved.
			$customer_info = $this->model_account_customer->getCustomerByEdrpuOrIpn($this->request->post['username']);

			/* if ($customer_info && !$customer_info['approved']) {
				$this->error['username'] = $this->language->get('error_approved');
				$this->error['password'] = $this->language->get('error_approved');
			} */
			
			if (!$this->error) {
				if (!$this->customer->login($this->request->post['username'], $this->request->post['password'])) {
					$this->error['username'] = $this->language->get('error_login');
					$this->error['password'] = $this->language->get('error_login');
				}
			}
		}

		return !$this->error;
	}
}