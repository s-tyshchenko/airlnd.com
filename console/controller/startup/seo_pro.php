<?php

class ControllerStartupSeoPro extends Controller
{

    private $cache_data = null;
    private $languages = array();
    private $prefix = array();
    private $config_language;

    private $is_cli_request = true;

    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->prefix = $this->config->get('seoproml_prefix');

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "language WHERE status = '1'");
        foreach ($query->rows as $result) {
            $this->languages[$this->prefix[$result['code']]] = $result;
        }
        $this->cache_data = $this->cache->get('seo_pro');
        if (!$this->cache_data) {
            $query = $this->db->query("SELECT LOWER(`keyword`) as 'keyword', `query` FROM " . DB_PREFIX . "url_alias ORDER BY url_alias_id", ['ttl' => $this->config->get('url_alias_cache_ttl')]);
            $this->cache_data = array();
            foreach ($query->rows as $row) {
                if (isset($this->cache_data['keywords'][$row['keyword']])) {
                    $this->cache_data['keywords'][$row['query']] = $this->cache_data['keywords'][$row['keyword']];
                    continue;
                }
                $this->cache_data['keywords'][$row['keyword']] = $row['query'];
                $this->cache_data['queries'][$row['query']] = $row['keyword'];
            }
            $this->cache->set('seo_pro', $this->cache_data);
        }
    }

    public function index()
    {
        if ($this->config->get('seoproml_status')) {
            $code = null;
            if (isset($this->request->get['_route_'])) {
                $route_ = $this->request->get['_route_'];
                $tokens = explode('/', $this->request->get['_route_']);

                if (array_key_exists($tokens[0], $this->languages)) {
                    $code = $tokens[0];
                    $this->request->get['_route_'] = substr($this->request->get['_route_'], strlen($code) + 1);
                }

                if (trim($this->request->get['_route_']) == '' || trim($this->request->get['_route_']) == 'index.php') {
                    unset($this->request->get['_route_']);
                }
            }

            $xhttprequested = isset($this->request->server['HTTP_X_REQUESTED_WITH']) && (strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest');

            $code = $this->prefix[$this->config->get('config_language')];

            if (!isset($this->session->data['language']) || $this->session->data['language'] != $this->languages[$code]['code']) {
                $this->session->data['language'] = $this->languages[$code]['code'];
            }

            $captcha = isset($this->request->get['route']) && strripos($this->request->get['route'], 'extension/captcha');

            if (!$xhttprequested && !$captcha && !$this->is_cli_request) {
                setcookie('language', $this->languages[$code]['code'], time() + 60 * 60 * 24 * 30, '/',
                    ($this->request->server['HTTP_HOST'] != 'localhost') ? $this->request->server['HTTP_HOST'] : false);
            }

            $this->config->set('config_language_id', $this->languages[$code]['language_id']);
            $this->config->set('config_language', $this->languages[$code]['code']);

            $language = new Language($this->languages[$code]['code']);
            $language->load('default');
            $language->load($this->languages[$code]['code']);
            $this->registry->set('language', $language);
        }

        // Add rewrite to url class
        if ($this->config->get('config_seo_url')) {
            $this->url->addRewrite($this);

            // OCFilter start
            if (!is_null($this->registry->get('ocfilter'))) {
                $this->url->addRewrite($this->registry->get('ocfilter'));
            }
            // OCFilter end

        } else {
            return;
        }

        // Decode URL
        if (!isset($this->request->get['_route_'])) {
            $this->validate();
        } else {
            $route_ = $route = $this->request->get['_route_'];
            unset($this->request->get['_route_']);
            $parts = explode('/', trim(utf8_strtolower($route), '/'));
            list($last_part) = explode('.', array_pop($parts));
            array_push($parts, $last_part);

            $rows = array();
            foreach ($parts as $keyword) {
                if (isset($this->cache_data['keywords'][$keyword])) {
                    $rows[] = array('keyword' => $keyword, 'query' => $this->cache_data['keywords'][$keyword]);
                }
            }

            if (isset($this->cache_data['keywords'][$route])) {
                $keyword = $route;
                $parts = array($keyword);
                $rows = array(array('keyword' => $keyword, 'query' => $this->cache_data['keywords'][$keyword]));
            }

            if (count($rows) == sizeof($parts)) {
                $queries = array();
                foreach ($rows as $row) {
                    $queries[utf8_strtolower($row['keyword'])] = $row['query'];
                }

                reset($parts);
                foreach ($parts as $part) {
                    if (!isset($queries[$part])) return false;
                    $url = explode('=', $queries[$part], 2);

                    if ($url[0] == 'category_id') {
                        if (!isset($this->request->get['path'])) {
                            $this->request->get['path'] = $url[1];
                        } else {
                            $this->request->get['path'] .= '_' . $url[1];
                        }
                    } elseif (count($url) > 1) {
                        $this->request->get[$url[0]] = $url[1];
                    }
                }
            } else {
                $this->request->get['route'] = 'error/not_found';
            }

            if (isset($this->request->get['product_id'])) {
                $this->request->get['route'] = 'product/product';
                if (!isset($this->request->get['path'])) {
                    $path = $this->getPathByProduct($this->request->get['product_id']);
                    if ($path) $this->request->get['path'] = $path;
                }
            } elseif (isset($this->request->get['path'])) {
                $this->request->get['route'] = 'product/category';
            } elseif (isset($this->request->get['manufacturer_id'])) {
                $this->request->get['route'] = 'product/manufacturer/info';
            } elseif (isset($this->request->get['information_id'])) {
                $this->request->get['route'] = 'information/information';
            } elseif (isset($this->cache_data['queries'][$route_]) && isset($this->request->server['SERVER_PROTOCOL'])) {
                header($this->request->server['SERVER_PROTOCOL'] . ' 301 Moved Permanently');
                $this->response->redirect($this->cache_data['queries'][$route_], 301);
            } else {
                if (isset($queries[$parts[0]])) {
                    $this->request->get['route'] = $queries[$parts[0]];
                }
            }

            $this->validate();

            if (isset($this->request->get['route'])) {
                return new Action($this->request->get['route']);
            }
        }
    }

    public function rewrite($link, $code = '')
    {
        if (!$code) {
            $code = $this->prefix[$this->config->get('config_language')];
        }
        if (!$this->config->get('config_seo_url')) return $link;

        $seo_url = '';

        $component = parse_url(str_replace('&amp;', '&', $link));

        $data = array();
        parse_str($component['query'], $data);

        $route = $data['route'];
        unset($data['route']);

        switch ($route) {
            case 'product/product':
                if (isset($data['product_id'])) {
                    $tmp = $data;
                    $data = array();
                    if ($this->config->get('config_seo_url_include_path')) {
                        $data['path'] = $this->getPathByProduct($tmp['product_id']);
                        if (!$data['path']) return $link;
                    }
                    $data['product_id'] = $tmp['product_id'];
                    $seo_pro_utm = preg_replace('~\r?\n~', "\n", $this->config->get('config_seo_pro_utm'));
                    $allowed_parameters = explode("\n", $seo_pro_utm);
                    foreach ($allowed_parameters as $ap) {
                        if (isset($tmp[trim($ap)])) {
                            $data[trim($ap)] = $tmp[trim($ap)];
                        }
                    }
                }
                break;

            case 'product/category':
                if (isset($data['path'])) {
                    $category = explode('_', $data['path']);
                    $category = end($category);
                    $data['path'] = $this->getPathByCategory($category);
                    if (!$data['path']) return $link;
                }
                break;

            case 'product/product/review':
            case 'information/information/agree':
                return $link;
                break;

            default:
                break;
        }

        if ($component['scheme'] == 'https') {
            $link = $this->config->get('config_ssl');
        } else {
            $link = $this->config->get('config_url');
        }

        if ($this->languages[$code]['code'] != $this->config->get('seoproml_xdefault')) {
            $lang_prefix = $code . '/';
        } else{
            $lang_prefix = '';
        }

        $link .= $lang_prefix;

        $link .= 'index.php?route=' . $route;

        if (count($data)) {
            $link .= '&amp;' . urldecode(http_build_query($data, '', '&amp;'));
        }

        $queries = array();
        if (!in_array($route, array('product/search'))) {
            foreach ($data as $key => $value) {
                switch ($key) {
                    case 'product_id':
                    case 'manufacturer_id':
                    case 'category_id':
                    case 'information_id':
                    case 'order_id':
                        $queries[] = $key . '=' . $value;
                        unset($data[$key]);
                        $postfix = 1;
                        break;

                    case 'path':
                        $categories = explode('_', $value);
                        foreach ($categories as $category) {
                            $queries[] = 'category_id=' . $category;
                        }
                        unset($data[$key]);
                        break;

                    default:
                        break;
                }
            }
        }


        if (empty($queries)) {
            $queries[] = $route;
        }

        $rows = array();
        foreach ($queries as $query) {
            if (isset($this->cache_data['queries'][$query])) {
                $rows[] = array('query' => $query, 'keyword' => $this->cache_data['queries'][$query]);
            }
        }

        if (count($rows) == count($queries)) {
            $aliases = array();
            foreach ($rows as $row) {
                $aliases[$row['query']] = $row['keyword'];
            }
            foreach ($queries as $query) {
                $seo_url .= '/' . rawurlencode($aliases[$query]);
            }
        }

        if ($seo_url == '') return $link;

        $seo_url = $lang_prefix . trim($seo_url, '/');

        if ($component['scheme'] == 'https') {
            $seo_url = $this->config->get('config_ssl') . $seo_url;
        } else {
            $seo_url = $this->config->get('config_url') . $seo_url;
        }

        if (isset($postfix)) {
            $seo_url .= trim($this->config->get('config_seo_url_postfix'));
        } else {
            $seo_url .= '/';
        }

        if (substr($seo_url, -2) == '//') {
            $seo_url = substr($seo_url, 0, -1);
        }

        if (count($data)) {
            $seo_url .= '?' . urldecode(http_build_query($data, '', '&amp;'));
        }

        return $seo_url;
    }

    private function getPathByProduct($product_id)
    {
        $product_id = (int)$product_id;
        if ($product_id < 1) return false;

        static $path = null;
        if (!isset($path)) {
            $path = $this->cache->get('product.seopath');
            if (!isset($path)) $path = array();
        }

        if (!isset($path[$product_id])) {
            $query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . $product_id . "' ORDER BY main_category DESC LIMIT 1");

            $path[$product_id] = $this->getPathByCategory($query->num_rows ? (int)$query->row['category_id'] : 0);

            $this->cache->set('product.seopath', $path);
        }

        return $path[$product_id];
    }

    private function getPathByCategory($category_id)
    {
        $category_id = (int)$category_id;
        if ($category_id < 1) return false;

        static $path = null;
        if (!isset($path)) {
            $path = $this->cache->get('category.seopath');
            if (!isset($path)) $path = array();
        }

        if (!isset($path[$category_id])) {
            $max_level = 10;

            $sql = "SELECT CONCAT_WS('_'";
            for ($i = $max_level - 1; $i >= 0; --$i) {
                $sql .= ",t$i.category_id";
            }
            $sql .= ") AS path FROM " . DB_PREFIX . "category t0";
            for ($i = 1; $i < $max_level; ++$i) {
                $sql .= " LEFT JOIN " . DB_PREFIX . "category t$i ON (t$i.category_id = t" . ($i - 1) . ".parent_id)";
            }
            $sql .= " WHERE t0.category_id = '" . $category_id . "'";

            $query = $this->db->query($sql);

            $path[$category_id] = $query->num_rows ? $query->row['path'] : false;

            $this->cache->set('category.seopath', $path);
        }

        return $path[$category_id];
    }

    private function validate()
    {
        if (php_sapi_name() == "cli") {
            return;
        }
        if (isset($this->request->get['route']) && $this->request->get['route'] == 'error/not_found') {
            return;
        }
        if (empty($this->request->get['route'])) {
            $this->request->get['route'] = 'common/home';
        }

        if (isset($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            return;
        }

        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $config_ssl = substr($this->config->get('config_ssl'), 0, $this->strpos_offset('/', $this->config->get('config_ssl'), 3) + 1);
            $url = str_replace('&amp;', '&', $config_ssl . ltrim($this->request->server['REQUEST_URI'], '/'));
            $seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array('route')), true));
        } else {
            $config_url = substr($this->config->get('config_url'), 0, $this->strpos_offset('/', $this->config->get('config_url'), 3) + 1);
            $url = str_replace('&amp;', '&', $config_url . ltrim($this->request->server['REQUEST_URI'], '/'));
            $seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array('route')), false));
        }

        if (rawurldecode($url) != rawurldecode($seo) && isset($this->request->server['SERVER_PROTOCOL'])) {
            header($this->request->server['SERVER_PROTOCOL'] . ' 301 Moved Permanently');

            $this->response->redirect($seo, 301);
        }
    }

    private function strpos_offset($needle, $haystack, $occurrence)
    {
        // explode the haystack
        $arr = explode($needle, $haystack);
        // check the needle is not out of bounds
        switch ($occurrence) {
            case $occurrence == 0:
                return false;
            case $occurrence > max(array_keys($arr)):
                return false;
            default:
                return strlen(implode($needle, array_slice($arr, 0, $occurrence)));
        }
    }

    private function getQueryString($exclude = array())
    {
        if (!is_array($exclude)) {
            $exclude = array();
        }

        return urldecode(http_build_query(array_diff_key($this->request->get, array_flip($exclude))));
    }
}

?>
