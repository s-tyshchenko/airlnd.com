<?php
class ControllerInformationAbout extends Controller {

	public function index() {
		$this->load->language('information/about');

		$this->document->setTitle($this->language->get('heading_title'));
        $this->document->addStyle('assets/amitek/styles/about.css');

        $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/about')
		);

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_hero'] = $this->language->get('text_hero');

		$data['heading_categories'] = $this->language->get('heading_categories');
		$data['heading_category_1'] = $this->language->get('heading_category_1');
		$data['text_category_1']    = $this->language->get('text_category_1');
		$data['heading_category_2'] = $this->language->get('heading_category_2');
		$data['text_category_2']    = $this->language->get('text_category_2');
		$data['heading_category_3'] = $this->language->get('heading_category_3');
		$data['text_category_3']    = $this->language->get('text_category_3');
		$data['heading_category_4'] = $this->language->get('heading_category_4');
		$data['text_category_4']    = $this->language->get('text_category_4');
		$data['heading_category_5'] = $this->language->get('heading_category_5');
		$data['text_category_5']    = $this->language->get('text_category_5');
		$data['heading_category_6'] = $this->language->get('heading_category_6');
        $data['text_category_6']    = $this->language->get('text_category_6');
		$data['heading_category_7'] = $this->language->get('heading_category_7');
        $data['text_category_7']    = $this->language->get('text_category_7');

        $data['heading_delivery']   = $this->language->get('heading_delivery');
        $data['heading_delivery_1'] = $this->language->get('heading_delivery_1');
        $data['text_delivery_1']    = $this->language->get('text_delivery_1');
		$data['heading_delivery_2'] = $this->language->get('heading_delivery_2');
        $data['text_delivery_2']    = $this->language->get('text_delivery_2');

		$this->load->model('tool/image');

		$data['hero_banner'] = $this->model_tool_image->resize('information/about/hero-banner.png', 1920, 1080);
		$data['category_image_1'] = $this->model_tool_image->resize('information/about/category-image-1.png', 768, 432);
		$data['category_image_2'] = $this->model_tool_image->resize('information/about/category-image-2.png', 768, 432);
		$data['delivery_image_1'] = $this->model_tool_image->resize('information/about/delivery-image-1.png', 768, 432);
		$data['delivery_image_2'] = $this->model_tool_image->resize('information/about/delivery-image-2.png', 768, 432);

        $data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/about', $data));
	}

}
