<?php
class ControllerExtensionModuleSlideshow extends Controller {
	public function index($setting) {
		static $module = 0;		

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('assets/amitek/vendor/owl/owl-carousel.css');
		$this->document->addScript('assets/amitek/vendor/owl/owl-carousel.js', 'footer');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => html_entity_decode($result['title']),
					'link'  => $result['link'],
					'image' => $this->model_tool_image->responsive_resize($result['image'], $setting['width'], $setting['height']),
					'image_mobile' => $this->model_tool_image->responsive_resize($result['image'], 320, 320)
				);
			}
		}

		$data['module'] = $module++;

		return $this->load->view('extension/module/slideshow', $data);
	}
}
