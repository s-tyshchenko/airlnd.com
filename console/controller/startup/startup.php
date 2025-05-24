<?php

class ControllerStartupStartup extends Controller
{
    public function index()
    {
        // Store
        if (isset($this->request->get['store_id'])) {
            $store_id = $this->request->get['store_id'];
        } else {
            $store_id = 0;
        }
        $this->config->set('config_store_id', $store_id);

        $this->config->set('config_url', HTTP_SERVER);
        $this->config->set('config_ssl', HTTPS_SERVER);

        // Settings
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "setting` WHERE store_id = '0' OR store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY store_id ASC");

        foreach ($query->rows as $result) {
            if (!$result['serialized']) {
                $this->config->set($result['key'], $result['value']);
            } else {
                $this->config->set($result['key'], json_decode($result['value'], true));
            }
        }

        // Language
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "language` WHERE code = '" . $this->db->escape($this->config->get('config_language')) . "'");

        if ($query->num_rows) {
            $this->config->set('config_language_id', $query->row['language_id']);
        }

        // Url
        $this->registry->set('url', new Url($this->config->get('config_url'), $this->config->get('config_secure') ? $this->config->get('config_ssl') : $this->config->get('config_url')));
    }
}
