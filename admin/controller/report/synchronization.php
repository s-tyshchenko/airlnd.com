<?php
class ControllerReportSynchronization extends Controller {
    public function index() {
        $this->load->language('report/synchronization');

        $this->document->setTitle($this->language->get('heading_title'));

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('report/synchronization', 'token=' . $this->session->data['token'] . $url, true)
        );

        $this->load->model('report/product');

        $filter_data = array(
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $product_total = $this->model_report_product->getTotalProductsSynchronization();

        $results = $this->model_report_product->getProductsSynchronization($filter_data);
        $data['products'] = [];
        foreach ($results as $result) {
            $data['products'][] = array_merge($result, [
                'link' => $this->url->link('catalog/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $result['product_id'], true),
            ]);
        }

        $data['total'] = $this->model_report_product->getTotal();
        $data['total_missing_photo'] = $this->model_report_product->getTotalMissingPhoto();
        $data['total_missing_price'] = $this->model_report_product->getTotalMissingPrice();
        $data['total_created_today'] = $this->model_report_product->getTotalProductsByDate('date_added', 1);
        $data['total_updated_today'] = $this->model_report_product->getTotalProductsByDate('date_modified', 1);
        $data['total_created_this_week'] = $this->model_report_product->getTotalProductsByDate('date_added', 7);
        $data['total_updated_this_week'] = $this->model_report_product->getTotalProductsByDate('date_modified', 7);

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_missing_photo']     = $this->language->get('text_missing_photo');
        $data['text_missing_price']     = $this->language->get('text_missing_price');
        $data['text_created_today']     = $this->language->get('text_created_today');
        $data['text_updated_today']     = $this->language->get('text_updated_today');
        $data['text_created_this_week'] = $this->language->get('text_created_this_week');
        $data['text_updated_this_week'] = $this->language->get('text_updated_this_week');

        $data['column_model'] = $this->language->get('column_model');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_sku'] = $this->language->get('column_sku');
        $data['column_error'] = $this->language->get('column_error');
        $data['column_info'] = $this->language->get('column_info');
        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_date_modified'] = $this->language->get('column_date_modified');

        if (isset($this->session->data['error'])) {
            $data['error_warning'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } elseif (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('report/synchronization', 'token=' . $this->session->data['token'] . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('report/synchronization', $data));
    }
}