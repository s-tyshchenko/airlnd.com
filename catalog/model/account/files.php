<?php
class ModelAccountFiles extends Model {
	public function getFiles($start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 1;
		}
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_files WHERE customer_id = '" . (int)$this->customer->getId() . "' ORDER BY date_added LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}	
	
	public function getTotalFiles() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_files WHERE customer_id = '" . (int)$this->customer->getId() . "'");

		return $query->row['total'];
	}

	public function getFile($file_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_files WHERE file_id = '" . (int)$file_id . "' LIMIT 1");

		return $query->row;
	}
}