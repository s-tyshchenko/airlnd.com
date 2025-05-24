<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		$this->document->addStyle('assets/amitek/styles/home.css');

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->url->link('common/home', '' ,true), 'canonical');
		}

        if ($this->config->get('seoproml_status')) {
            $seodata = $this->config->get('seoproml_tags')[$this->config->get('config_language_id')]['home'];

            if (!empty($seodata['meta_title'])) {
                $this->document->setTitle($seodata['meta_title']);
            }

            if (!empty($seodata['meta_description'])) {
                $this->document->setDescription($seodata['meta_description']);
            }

            if (!empty($seodata['meta_keywords'])) {
                $this->document->setKeywords($seodata['meta_keywords']);
            }

            if (!empty($seodata['h1'])) {
                $data['seo_h1'] = $seodata['h1'];
            }

            if (!empty($seodata['description'])) {
                $data['seo_description'] = html_entity_decode($seodata['description'], ENT_QUOTES, 'UTF-8');
            }
        }

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
