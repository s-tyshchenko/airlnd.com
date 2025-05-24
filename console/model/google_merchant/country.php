<?php

class ModelGoogleMerchantCountry extends Model
{
    public function getCountry($args) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country c WHERE c.country_id = '" . $args['country_id'] . "'");

        return $query->row;
    }

}