<?php
class ModelExtensionModuleMenu extends Model {
	public function getMenuTitle(){
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		
		$this->load->model('tool/image');
		$this->load->model('catalog/category');
		
		$data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "footertitle ft LEFT JOIN " . DB_PREFIX . "footertitle_description ftd ON (ft.footertitle_id = ftd.footertitle_id) where ftd.language_id = '" . (int)$this->config->get('config_language_id') . "' and ft.status=1 order by ft.sort_order");

		foreach($query->rows as $row){
			$query2 = $this->db->query("SELECT * FROM " . DB_PREFIX . "footerlink f LEFT JOIN " . DB_PREFIX . "footerlink_description fd ON (f.footerlink_id = fd.footerlink_id) where fd.language_id = '" . (int)$this->config->get('config_language_id') . "' and f.status=1 and f.selectheading='".$row['footertitle_id']."' order by f.sort_order");
			
			$columns = array();
			
			foreach($query2->rows as $row2){
				$categories = array();
				
				if(!empty(json_decode($row2['selected_category']))){
					foreach(json_decode($row2['selected_category']) as $category_id){
						$category_info = $this->model_catalog_category->getCategory($category_id);
						
						if(!empty($category_info)){
							$categories[] = array(
								'name' => $category_info['name'],
								'link' => $this->url->link('product/category', 'path=' . $category_info['category_id'])
							);
						}
					}
				}

                $link = json_decode(
                    htmlspecialchars_decode($row2['link'])
                );
                if ($link) {
                    $row2['link'] = $this->url->link(...$link);
                } else {
                    $row2['link'] = $this->url->link($row2['link']);
                }

                $columns[] = array(
                    'title' => $row2['title'],
                    'link' => $row2['link'],
                    'style_heading' => $row2['style_heading'],
                    'categories' => $categories
                );
			}
			
			$video = false;
			if($row['image']){
				if(pathinfo(DIR_IMAGE . $row['image'], PATHINFO_EXTENSION) !== 'mp4'){
					$image = $server . 'image/' . $row['image'];
				} else {
					$image = $server . 'image/' . $row['image'];
					$video = true;
				}
			} else {
				$image = '';
			}
			
			$data[] = array(
				'title' => $row['title'],
				'image' => $image,
				'video' => $video,
				'link' => $row['link'],
				'columns' => $columns
			);
		}
		
		// print_r($data);
		
		return $data;
	}
}