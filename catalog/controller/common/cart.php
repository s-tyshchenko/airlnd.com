<?php
class ControllerCommonCart extends Controller {
	public function index() {
		
		$this->load->language('common/cart');

		// Totals
		$this->load->model('extension/extension');

		$totals = array();
		$taxes = $this->cart->getTaxes();
		$total = 0;
        $total_old = 0;

		// Because __call can not keep var references so we put them into an array.
		$total_data = array(
			'totals' => &$totals,
			'taxes'  => &$taxes,
			'total'  => &$total
		);		

		if(!empty($this->request->get['ajax_update'])){
			$data['ajax_update'] = true;
		} else {
			$data['ajax_update'] = false;
		}
			
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

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_model'] = $this->language->get('text_model');
		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_cart'] = $this->language->get('text_cart');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_recurring'] = $this->language->get('text_recurring');
		$data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_related'] = $this->language->get('text_related');

		$data['count_products'] = $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0);

		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_continue'] = $this->language->get('button_continue');

		$this->load->model('tool/image');
		$this->load->model('tool/upload');

		$data['products'] = array();
		$data['products_related'] = array();

		foreach ($this->cart->getProducts() as $product) {
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
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
					'type'  => $option['type']
				);
			}

			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
				
				$price = $this->currency->format($unit_price, $this->session->data['currency']);
				$total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
                $total_old = $this->currency->format($product['total_old'], $this->session->data['currency']);
			} else {
				$price = false;
				$total = false;
                $total_old = $product['total_old'];
			}

			$this->load->model('catalog/product');

			$data['products'][] = array(
			    'product_id' => $product['product_id'],
				'cart_id'   => $product['cart_id'],
				'thumb'     => $image,
				'name'      => $product['name'],
				'model'     => $product['model'],
				'sku'     	=> $product['sku'],
				'option'    => $option_data,
				'recurring' => ($product['recurring'] ? $product['recurring']['name'] : ''),
				'quantity'  => $product['quantity'],
				'minimum'   => $product['minimum'],
				'price'     => $price,
				'total'     => $total,
				'total_discount' => $total_old,
				'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id']),
			);

            if ($products_related = $this->model_catalog_product->getProductRelated($product['product_id'])) {
                foreach ($products_related as $key => $product_related) {
                    if ($product_related['quantity'] == 0) {
                        continue;
                    }

                    if (in_array($product_related['product_id'], array_column($data['products_related'], 'product_id'))) {
                        continue;
                    }

                    if (count($data['products_related']) >= 4) {
                        continue;
                    }

                    if ($product_related['image']) {
                        $product_related['thumb'] = $this->model_tool_image->resize($product_related['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
                    } else {
                        $product_related['thumb'] = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
                    }

                    if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                        $product_related['price'] = $this->currency->format($this->tax->calculate($product_related['price'], $product_related['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $product_related['price'] = false;
                    }

                    if ((float)$product_related['special']) {
                        $product_related['special'] = $this->currency->format($this->tax->calculate($product_related['special'], $product_related['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $product_related['special'] = false;
                    }

                    if ($this->config->get('config_tax')) {
                        $product_related['tax'] = $this->currency->format((float)$product_related['special'] ? $product_related['special'] : $product_related['price'], $this->session->data['currency']);
                    } else {
                        $product_related['tax'] = false;
                    }

                    if ($product_related['quantity'] <= 0) {
                        $product_related['stock'] = $product_related['stock_status'];
                    } elseif($product_related['quantity'] > 10) {
                        $product_related['stock'] = $this->language->get('text_instock_2');
                    } else {
                        $product_related['stock'] = $this->language->get('text_instock');
                    }

                    $data['products_related'][] = $product_related;
                }
            }
        }

		foreach ($data['products_related'] as $key => $product_related) {
            if (in_array($product_related['product_id'], array_column($data['products'], 'product_id'))) {
                unset($data['products_related'][$key]);
            }
        }

		// Gift Voucher
		$data['vouchers'] = array();

		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $key => $voucher) {
				$data['vouchers'][] = array(
					'key'         => $key,
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency'])
				);
			}
		}

		$data['totals'] = array();

		foreach ($totals as $total) {
			$data['totals'][] = array(
				'code' => $total['code'],
				'title' => $total['title'],
				'text'  => $this->currency->format($total['value'], $this->session->data['currency']),
			);
		}

		$data['cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/quick_checkout', '', true);

		return $this->load->view('common/cart', $data);
	}

	public function info() {		
		$this->response->setOutput($this->index());
	}
}
