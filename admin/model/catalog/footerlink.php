<?php
class ModelCatalogFooterlink extends Model {
	public function addfooterlink($data) {
		if(empty($data['selected_category'])){
			$data['selected_category'] = array();
		}
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "footerlink SET link = '" . $data['link'] . "', selectheading = '" . $this->db->escape($data['selectheading']) . "', style_heading = '" . $this->db->escape($data['style_heading']) . "', selected_category = '" . $this->db->escape(json_encode($data['selected_category'])) . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "'");

		$footerlink_id = $this->db->getLastId(); 
		
		foreach ($data['footerlink_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "footerlink_description SET footerlink_id = '" . (int)$footerlink_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "'");
		}

		$this->cache->delete('footerlink');
	}
	
	public function editfooterlink($footerlink_id, $data) {
		if(empty($data['selected_category'])){
			$data['selected_category'] = array();
		}
		
		$this->db->query("UPDATE " . DB_PREFIX . "footerlink SET link = '" . $data['link'] . "', selectheading = '" . $this->db->escape($data['selectheading']) . "', style_heading = '" . $this->db->escape($data['style_heading']) . "', selected_category = '" . $this->db->escape(json_encode($data['selected_category'])) . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE footerlink_id = '" . (int)$footerlink_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "footerlink_description WHERE footerlink_id = '" . (int)$footerlink_id . "'");
		
		foreach ($data['footerlink_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "footerlink_description SET footerlink_id = '" . (int)$footerlink_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "'");
		}
		
		$this->cache->delete('footerlink');
	}
	
	public function deletefooterlink($footerlink_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "footerlink WHERE footerlink_id = '" . (int)$footerlink_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "footerlink_description WHERE footerlink_id = '" . (int)$footerlink_id . "'");
		
		

		$this->cache->delete('footerlink');
	}	
	public function getfooterlink($footerlink_id) {
	
			$sql = "SELECT * FROM " . DB_PREFIX . "footerlink where footerlink_id='".$footerlink_id."' ";
			$query = $this->db->query($sql);
			return $query->row;
		
	}
		

	
	public function getfooterlinks($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "footerlink i LEFT JOIN " . DB_PREFIX . "footerlink_description id ON (i.footerlink_id = id.footerlink_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
			$sort_data = array(
				'id.title',
				'i.sort_order',
				'i.link'
			);		
		
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY i.selectheading, i.sort_order";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
		
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}		

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
			
			$query = $this->db->query($sql);
			
			return $query->rows;
		} else {
			$footerlink_data = $this->cache->get('footerlink.' . (int)$this->config->get('config_language_id'));
		
			if (!$footerlink_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "footerlink i LEFT JOIN " . DB_PREFIX . "footerlink_description id ON (i.footerlink_id = id.footerlink_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");
	
				$footerlink_data = $query->rows;
			
				$this->cache->set('footerlink.' . (int)$this->config->get('config_language_id'), $footerlink_data);
			}	
	
			return $footerlink_data;			
		}
	}
	
	public function getfooterlinkDescriptions($footerlink_id) {
		$footerlink_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "footerlink_description WHERE footerlink_id = '" . (int)$footerlink_id . "'");

		foreach ($query->rows as $result) {
			$footerlink_description_data[$result['language_id']] = array(
				'title'       => $result['title'],
				);
		}
		
		return $footerlink_description_data;
	}
	
	
		
	public function getTotalfooterlinks() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "footerlink_description");
		
		return $query->row['total'];
	}	
	
	
}
?>