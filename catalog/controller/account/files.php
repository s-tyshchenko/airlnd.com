<?php
class ControllerAccountFiles extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/files', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}
		
		$this->document->addStyle('assets/amitek/styles/account.css');

		$this->load->language('account/files');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/files', $url, true)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_list'] = $this->language->get('text_list');

		$data['button_view'] = $this->language->get('button_view');
		$data['button_ocstore_payeer_onpay'] = $this->language->get('button_ocstore_payeer_onpay');
		$data['button_ocstore_yk_onpay'] = $this->language->get('button_ocstore_yk_onpay');
		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_download'] = $this->language->get('button_download');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['files'] = array();

		$this->load->model('account/files');

		$files_total = $this->model_account_files->getTotalFiles();

		$files = $this->model_account_files->getFiles(($page - 1) * 10, 10);

		foreach ($files as $file) {
			$data['download_file'] = array(
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($file['date_added'])),
				'name' 			=> $file['name'],
				'link' 			=> $this->url->link('account/files/download', 'download_id=' . $file['file_id'], true),
				'total' 		=> $this->currency->format($file['total'], $this->session->data['currency'])
			);
		}

		$pagination = new Pagination();
		$pagination->total = $files_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('account/files', 'page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($files_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($files_total - 10)) ? $files_total : ((($page - 1) * 10) + 10), $files_total, ceil($files_total / 10));

		$data['continue'] = $this->url->link('account/account', '', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/files', $data));
	}
	
	public function download() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/download', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->model('account/files');

		if (isset($this->request->get['download_id'])) {
			$download_id = $this->request->get['download_id'];
		} else {
			$download_id = 0;
		}

		$download_info = $this->model_account_files->getFile($download_id);

		if ($download_info) {
			$file = DIR_DOWNLOAD . $download_info['filename'];
			$mask = basename($download_info['name']);

			if (!headers_sent()) {
				if (file_exists($file)) {
					header('Content-Type: application/octet-stream');
					header('Content-Disposition: attachment; filename="' . ($mask ? $mask : basename($file)) . '"');
					header('Expires: 0');
					header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
					header('Pragma: public');
					header('Content-Length: ' . filesize($file));

					if (ob_get_level()) {
						ob_end_clean();
					}

					readfile($file, 'rb');

					exit();
				} else {
					exit('Error: Could not find file ' . $file . '!');
				}
			} else {
				exit('Error: Headers already sent out!');
			}
		} else {
			$this->response->redirect($this->url->link('account/files', '', true));
		}
	}
}