<?php
class ControllerCommonSearch extends Controller {
	public function index() {
		$this->load->language('common/search');

		$data['url'] = $this->url->link('product/search');
		$data['text_search'] = $this->language->get('text_search');
		$data['btn_search'] = $this->language->get('btn_search');

		if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}

		return $this->load->view('common/search', $data);
	}
}