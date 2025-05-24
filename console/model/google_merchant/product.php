<?php

class ModelGoogleMerchantProduct extends Model
{

    public function getProducts($args)
    {
        $sql = "SELECT p.product_id, p.image, p.price, p.sku, p.quantity, DATE_FORMAT(GREATEST(p.date_added, p.date_modified),'%Y-%m-%dT%TZ') as date_modified, pd.name, pd.description FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . $args['language_id'] . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . $args['store_id'] . "' AND p.image != '' AND price > 0";

        if ($args['updated_after']) {
            $sql .= " AND date_modified >= '{$args['updated_after']}'";
        }

        if ($args['limit']) {
            $sql .= " LIMIT {$args['limit']}";

            if ($args['offset']) {
                $sql .= " OFFSET {$args['offset']}";
            }
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getProductCategories($args) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_description cd WHERE cd.language_id = " . $args['language_id'] . " AND cd.category_id IN (SELECT p2c.category_id FROM " . DB_PREFIX . "product_to_category p2c WHERE p2c.product_id = '" . $args['product_id'] . "' AND p2c.category_id != '999999') ORDER BY cd.category_id ASC");

        return $query->rows;
    }

}