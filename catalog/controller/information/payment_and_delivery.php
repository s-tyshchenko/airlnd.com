<?php
class ControllerInformationPaymentAndDelivery extends Controller {

	public function index() {
		$this->load->language('information/payment_and_delivery');

		$this->document->setTitle($this->language->get('heading_title'));
        $this->document->addStyle('assets/amitek/styles/payment-and-delivery.css');

        $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/payment_and_delivery')
		);

		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_payment_methods'] = $this->language->get('heading_payment_methods');
		$data['subheading_payment_methods'] = $this->language->get('subheading_payment_methods');
		$data['heading_delivery_methods'] = $this->language->get('heading_delivery_methods');
		$data['subheading_delivery_methods'] = $this->language->get('subheading_delivery_methods');

        $data['heading_payment_method_1']  = $this->language->get('heading_payment_method_1');
        $data['text_payment_method_1']     = $this->language->get('text_payment_method_1');
        $data['heading_payment_method_2']  = $this->language->get('heading_payment_method_2');
        $data['text_payment_method_2']     = $this->language->get('text_payment_method_2');
        $data['heading_payment_method_3']  = $this->language->get('heading_payment_method_3');
        $data['text_payment_method_3']     = $this->language->get('text_payment_method_3');

        $data['heading_delivery_method_1']  = $this->language->get('heading_delivery_method_1');
        $data['text_delivery_method_1']     = $this->language->get('text_delivery_method_1');
        $data['heading_delivery_method_2']  = $this->language->get('heading_delivery_method_2');
		$data['text_delivery_method_2']     = $this->language->get('text_delivery_method_2');
        $data['heading_delivery_method_3']  = $this->language->get('heading_delivery_method_3');
        $data['text_delivery_method_3']     = $this->language->get('text_delivery_method_3');
        $data['heading_delivery_method_4']  = $this->language->get('heading_delivery_method_4');
        $data['text_delivery_method_4']     = $this->language->get('text_delivery_method_4');

        $data['heading_out_of_stock'] = $this->language->get('heading_out_of_stock');
        $data['text_out_of_stock'] = $this->language->get('text_out_of_stock');

        $data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/payment_and_delivery', $data));
	}

}
