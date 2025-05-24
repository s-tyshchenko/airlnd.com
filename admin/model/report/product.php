<?php
class ModelReportProduct extends Model
{
    public function getTotal()
    {
        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product p";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getProductsViewed($data = array())
    {
        $sql = "SELECT pd.name, p.model, p.viewed FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.viewed > 0 ORDER BY p.viewed DESC";

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
    }

    public function getTotalProductViews()
    {
        $query = $this->db->query("SELECT SUM(viewed) AS total FROM " . DB_PREFIX . "product");

        return $query->row['total'];
    }

    public function getTotalProductsViewed()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE viewed > 0");

        return $query->row['total'];
    }

    public function reset()
    {
        $this->db->query("UPDATE " . DB_PREFIX . "product SET viewed = '0'");
    }

    public function getPurchased($data = array())
    {
        $sql = "SELECT op.name, op.model, SUM(op.quantity) AS quantity, SUM(op.price + (op.tax * op.quantity)) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)";

        if (!empty($data['filter_order_status_id'])) {
            $sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
        } else {
            $sql .= " WHERE o.order_status_id > '0'";
        }

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
        }

        $sql .= " GROUP BY op.product_id ORDER BY total DESC";

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
    }

    public function getTotalPurchased($data)
    {
        $sql = "SELECT COUNT(DISTINCT op.product_id) AS total FROM `" . DB_PREFIX . "order_product` op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)";

        if (!empty($data['filter_order_status_id'])) {
            $sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
        } else {
            $sql .= " WHERE o.order_status_id > '0'";
        }

        if (!empty($data['filter_date_start'])) {
            $sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
        }

        if (!empty($data['filter_date_end'])) {
            $sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getProductsSynchronization($data = array()) {
        $sql = "SELECT pd.name, p.price, p.image, p.date_added, p.date_modified, p.model, p.sku, p.product_id,
            (p.price IS NULL OR p.price = 0) AS missing_price,
            ((pi.image IS NULL OR pi.image = '') AND (p.image IS NULL OR p.image = '')) AS missing_photo,
            CASE
                WHEN DATE(p.date_added) = CURDATE() THEN 'created_today'
                WHEN DATE(p.date_modified) = CURDATE() THEN 'updated_today'
                WHEN p.date_added >= NOW() - INTERVAL 7 DAY THEN 'created_this_week'
                WHEN p.date_modified >= NOW() - INTERVAL 7 DAY THEN 'updated_this_week'
                ELSE ''
            END AS info
            FROM " . DB_PREFIX . "product p 
            LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) 
            LEFT JOIN " . DB_PREFIX . "product_image pi ON (p.product_id = pi.product_id) 
            WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
            AND (
                (p.price IS NULL OR p.price = 0) 
                OR ((pi.image IS NULL OR pi.image = '') AND (p.image IS NULL OR p.image = ''))
                OR p.date_added >= NOW() - INTERVAL 7 DAY 
                OR p.date_modified >= NOW() - INTERVAL 7 DAY
            )";

        if (isset($data['order_by'])) {
            $sql .= " ORDER BY 
            CASE 
                WHEN (p.price IS NULL OR p.price = 0) THEN 1
                WHEN ((pi.image IS NULL OR pi.image = '') AND (p.image IS NULL OR p.image = '')) THEN 2
                WHEN DATE(p.date_added) = CURDATE() THEN 3
                WHEN DATE(p.date_modified) = CURDATE() THEN 4
                WHEN p.date_added >= NOW() - INTERVAL 7 DAY THEN 5
                WHEN p.date_modified >= NOW() - INTERVAL 7 DAY THEN 6
                ELSE 7
            END,
            " . $data['order_by'];
        } else {
            // Default ordering
            $sql .= " ORDER BY 
            CASE 
                WHEN (p.price IS NULL OR p.price = 0) THEN 1
                WHEN ((pi.image IS NULL OR pi.image = '') AND (p.image IS NULL OR p.image = '')) THEN 2
                WHEN DATE(p.date_added) = CURDATE() THEN 3
                WHEN DATE(p.date_modified) = CURDATE() THEN 4
                WHEN p.date_added >= NOW() - INTERVAL 7 DAY THEN 5
                WHEN p.date_modified >= NOW() - INTERVAL 7 DAY THEN 6
                ELSE 7
            END";
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
    }

    public function getTotalProductsSynchronization() {
        $sql = "SELECT COUNT(*) AS total 
            FROM " . DB_PREFIX . "product p 
            LEFT JOIN " . DB_PREFIX . "product_image pi ON (p.product_id = pi.product_id) 
            WHERE (
                (p.price IS NULL OR p.price = 0) 
                OR ((pi.image IS NULL OR pi.image = '') AND (p.image IS NULL OR p.image = '')) 
                OR p.date_added >= NOW() - INTERVAL 7 DAY 
                OR p.date_modified >= NOW() - INTERVAL 7 DAY
            )";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getMissingPrice($data)
    {
        $sql = "SELECT pd.name, p.model FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE (p.price IS NULL OR p.price = 0) AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
    }

    public function getTotalMissingPrice()
    {
        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE (p.price IS NULL OR p.price = 0) AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getMissingPhoto($data)
    {
        $sql = "SELECT pd.name, p.model FROM " . DB_PREFIX . "product p 
        LEFT JOIN " . DB_PREFIX . "product_image pi ON (p.product_id = pi.product_id) 
        WHERE ((pi.image IS NULL OR pi.image = '') AND (p.image IS NULL OR p.image = ''))";

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
    }

    public function getTotalMissingPhoto()
    {
        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product p 
        LEFT JOIN " . DB_PREFIX . "product_image pi ON (p.product_id = pi.product_id) 
        WHERE ((pi.image IS NULL OR pi.image = '') AND (p.image IS NULL OR p.image = ''))";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getProductsByDate($column, $days, $data = array()) {
        $sql = "SELECT pd.name, p.model, p.viewed, p.price, p.image FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'  AND p." . $column . " >= NOW() - INTERVAL " . $days . " DAY";

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
    }

    public function getTotalProductsByDate($column, $days) {
        $sql = "SELECT COUNT(*) AS total  FROM " . DB_PREFIX . "product  WHERE " . $column . " >= NOW() - INTERVAL " . $days . " DAY";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

}
