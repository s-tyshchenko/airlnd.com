<?php
class ControllerExtensionModuleCategory extends Controller {
	public function index() {
		$this->load->language('extension/module/category');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(999999);

        foreach ($categories as $category) {
            if ($category['top']) {
                // Level 2
                $children_data = array();

                $children = $this->model_catalog_category->getCategories($category['category_id']);

                foreach ($children as $child) {
                    // Level 3
                    $children_data_2 = array();

                    $children_2 = $this->model_catalog_category->getCategories($child['category_id']);

                    foreach ($children_2 as $child_2) {

                        $children_data_2[] = array(
                            'name'  => $child_2['name'],
                            'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_2['category_id']),
                            'children' => $children_data_2,
                        );
                    }

                    if($category['image_menu']){
                        $image = $this->model_tool_image->resize($child['image'], 200, 200);
                    } else {
                        $image = false;
                    }

                    $filter_data = array(
                        'filter_category_id'  => $child['category_id'],
                        'filter_sub_category' => true
                    );

                    $children_data[] = array(
                        'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
                        'children' => $children_data_2,
                        'image'    => $image,
                    );
                }

                if($category['image_menu']){
                    $image = $this->model_tool_image->resize($category['image_menu'], 24, 24);
                } else {
                    $image = false;
                }

                // Level 1
                $data['categories'][] = array(
                    'name'     => $category['name'],
                    'image'    => $image,
                    'children' => $children_data,
                    'column'   => $category['column'] ? $category['column'] : 1,
                    'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }

		return $this->load->view('extension/module/category', $data);
	}
}