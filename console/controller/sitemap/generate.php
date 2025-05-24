<?php

class ControllerSitemapGenerate extends Controller
{
    const SITEMAP_FILENAME = 'sitemap.xml';

    private $error = array();
    private $prefix;
    private $sitemap_path;

    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->prefix = (version_compare(VERSION, '3.0', '>=')) ? 'feed_' : '';
        $this->sitemap_path = DIR_SITEMAP . '/' . self::SITEMAP_FILENAME;
    }

    public function index()
    {
        if ($this->config->get($this->prefix . 'simple_google_sitemap_status')) {
            $this->load->model('sitemap/sitemap');
            $this->load->model('tool/image');

            $default_language_id = (int)$this->config->get('config_language_id');
            $default_language_code = $this->config->get('config_language');

            $args = array(
                'language_id' => $default_language_id,
                'store_id' => (int)$this->config->get('config_store_id')
            );

            $start = microtime(true);
            $output = '<?xml version="1.0" encoding="UTF-8"?>';
            $output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1" xmlns:xhtml="http://www.w3.org/1999/xhtml">' . PHP_EOL;

            $products = $this->model_sitemap_sitemap->getProducts($args);
            $languages = $this->model_sitemap_sitemap->getLanguages();
            $language_prefixes = $this->config->get('seoproml_prefix');

            foreach ($this->getStaticPages() as $static_page) {
                $output .= "<url>" . PHP_EOL;
                $output .= "  <loc>" . $this->url->link($static_page['route'], '', true) . "</loc>" . PHP_EOL;
                foreach ($languages as $language) {
                    $this->setLanguage($language['language_id'], $language['code']);
                    $language_prefix = $language_prefixes[$language['code']];
                    $output .= '  <xhtml:link rel="alternate" hreflang="' . $language_prefix . '" href="' . $this->url->link($static_page['route'], '', true) . '"/>' . PHP_EOL;
                }
                $this->setLanguage($default_language_id, $default_language_code);
                $output .= '  <xhtml:link rel="alternate" hreflang="x-default" href="' . $this->url->link($static_page['route'], '', true) . '"/>' . PHP_EOL;
                $output .= "  <changefreq>monthly</changefreq>" . PHP_EOL;
                $output .= "  <priority>" . $static_page['priority'] . "</priority>" . PHP_EOL;
                $output .= "</url>" . PHP_EOL;
            }

            if ($products) {
                foreach ($products as $product) {
                    $this->setLanguage($default_language_id, $default_language_code);
                    $output .= "<url>" . PHP_EOL;
                    $output .= "  <loc>" . $this->url->link('product/product', 'product_id=' . $product['product_id'], true) . "</loc>" . PHP_EOL;

                    foreach ($languages as $language) {
                        $this->setLanguage($language['language_id'], $language['code']);
                        $language_prefix = $language_prefixes[$language['code']];
                        $output .= '  <xhtml:link rel="alternate" hreflang="' . $language_prefix . '" href="' . $this->url->link('product/product', 'product_id=' . $product['product_id'], true) . '"/>' . PHP_EOL;
                    }
                    $this->setLanguage($default_language_id, $default_language_code);
                    $output .= '  <xhtml:link rel="alternate" hreflang="x-default" href="' . $this->url->link('product/product', 'product_id=' . $product['product_id'], true) . '"/>' . PHP_EOL;
                    $output .= "  <lastmod>" . $product['date_modified'] . "</lastmod>" . PHP_EOL;
                    $output .= "  <changefreq>daily</changefreq>" . PHP_EOL;
                    $output .= "  <priority>1.0</priority>" . PHP_EOL;
                    if ($this->config->get($this->prefix . 'simple_google_sitemap_image') && !empty($product['image']) && is_file(DIR_IMAGE . $product['image'])) {
                        if ($this->config->get($this->prefix . 'simple_google_sitemap_image') == 1) {
                            $image = $this->model_tool_image->resize($product['image'], $this->config->get('theme_' . str_replace('theme_', '', $this->config->get('config_theme')) . '_image_popup_width'), $this->config->get('theme_' . str_replace('theme_', '', $this->config->get('config_theme')) . '_image_popup_height'));
                        } else {
                            $image = ($this->config->get('config_secure') ? HTTPS_SERVER : HTTP_SERVER) . 'image/' . $product['image'];
                        }
                        $output .= "  <image:image>" . PHP_EOL;
                        $output .= '    <image:loc>' . $image . "</image:loc>" . PHP_EOL;
                        $output .= '    <image:caption><![CDATA[' . $product['name'] . "]]></image:caption>" . PHP_EOL;
                        $output .= '    <image:title><![CDATA[' . $product['name'] . "]]></image:title>" . PHP_EOL;
                        $output .= "  </image:image>" . PHP_EOL;
                    }
                    $output .= "</url>" . PHP_EOL;
                }
            }

            $categories = $this->model_sitemap_sitemap->getCategories($args);
            if ($categories) {
                foreach ($categories as $category) {
                    $output .= "<url>" . PHP_EOL;
                    $output .= "  <loc>" . $this->url->link('product/category', 'path=' . $category['category_id'], true) . "</loc>" . PHP_EOL;
                    foreach ($languages as $language) {
                        $this->setLanguage($language['language_id'], $language['code']);
                        $language_prefix = $language_prefixes[$language['code']];
                        $output .= '  <xhtml:link rel="alternate" hreflang="' . $language_prefix . '" href="' . $this->url->link('product/category', 'path=' . $category['category_id'], true) . '"/>' . PHP_EOL;
                    }
                    $this->setLanguage($default_language_id, $default_language_code);
                    $output .= '  <xhtml:link rel="alternate" hreflang="x-default" href="' . $this->url->link('product/category', 'path=' . $category['category_id'], true) . '"/>' . PHP_EOL;
                    $output .= "  <lastmod>" . $category['date_modified'] . "</lastmod>" . PHP_EOL;
                    $output .= "  <changefreq>weekly</changefreq>" . PHP_EOL;
                    $output .= "  <priority>0.7</priority>" . PHP_EOL;
                    $output .= "</url>" . PHP_EOL;
                }
            }

            $manufacturers = $this->model_sitemap_sitemap->getManufacturers($args);
            if ($manufacturers) {
                foreach ($manufacturers as $manufacturer) {
                    $output .= "<url>" . PHP_EOL;
                    $output .= '  <loc>' . $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id'], true) . "</loc>" . PHP_EOL;
                    foreach ($languages as $language) {
                        $this->setLanguage($language['language_id'], $language['code']);
                        $language_prefix = $language_prefixes[$language['code']];
                        $output .= '  <xhtml:link rel="alternate" hreflang="' . $language_prefix . '" href="' . $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id'], true) . '"/>' . PHP_EOL;
                    }
                    $this->setLanguage($default_language_id, $default_language_code);
                    $output .= '  <xhtml:link rel="alternate" hreflang="x-default" href="' . $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id'], true) . '"/>' . PHP_EOL;
                    $output .= "  <changefreq>weekly</changefreq>" . PHP_EOL;
                    $output .= "  <priority>0.7</priority>" . PHP_EOL;
                    $output .= "</url>" . PHP_EOL;
                }
            }

            $informations = $this->model_sitemap_sitemap->getInformations($args);
            if ($informations) {
                foreach ($informations as $information) {
                    $output .= "<url>" . PHP_EOL;
                    $output .= '  <loc>' . $this->url->link('information/information', 'information_id=' . $information['information_id'], true) . "</loc>" . PHP_EOL;
                    foreach ($languages as $language) {
                        $this->setLanguage($language['language_id'], $language['code']);
                        $language_prefix = $language_prefixes[$language['code']];
                        $output .= '  <xhtml:link rel="alternate" hreflang="' . $language_prefix . '" href="' . $this->url->link('information/information', 'information_id=' . $information['information_id'], true) . '"/>' . PHP_EOL;
                    }
                    $this->setLanguage($default_language_id, $default_language_code);
                    $output .= '  <xhtml:link rel="alternate" hreflang="x-default" href="' . $this->url->link('information/information', 'information_id=' . $information['information_id'], true) . '"/>' . PHP_EOL;
                    $output .= "  <changefreq>weekly</changefreq>" . PHP_EOL;
                    $output .= "  <priority>0.5</priority>" . PHP_EOL;
                    $output .= "</url>" . PHP_EOL;
                }
            }

            $output .= "</urlset>" . PHP_EOL;

            $time = microtime(true) - $start;
            $this->log(sprintf('Sitemap was generated for %.4F s. ', $time));

            file_put_contents($this->sitemap_path, $output);

            $this->pingGoogleSearchConsole();
        }
    }

    private function getStaticPages()
    {
        return [
            [
                'route' => 'common/home',
                'priority' => 1
            ],
            [
                'route' => 'information/contact',
                'priority' => 0.5,
            ],
            [
                'route' => 'information/payment_and_delivery',
                'priority' => 0.5,
            ],
            [
                'route' => 'information/about',
                'priority' => 0.5,
            ]
        ];
    }

    private function setLanguage($id, $code)
    {
        $this->config->set('config_language_id', $id);
        $this->config->set('config_language', $code);
    }

    private function log($string)
    {
        if ($this->config->get($this->prefix . 'simple_google_sitemap_log')) {
            $log = new Log('simple_google_sitemap.log');
            $log->write($string);
        }
    }

    private function pingGoogleSearchConsole()
    {
        $site_url = $this->config->get('config_secure') ? HTTPS_SERVER : HTTP_SERVER;
        $sitemap_path = str_replace(DIR_OPENCART, '', $this->sitemap_path);

        $endpoint = "https://www.google.com/ping?sitemap={$site_url}{$sitemap_path}";

        $ch = curl_init($endpoint);

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        $response = curl_exec($ch);

        if (curl_errno($ch)) {
            $this->log('Google Search Console Error: ' . curl_error($ch));
        } else {
            $this->log('Sitemap was updated on Google Search Console');
        }

        curl_close($ch);
    }
}
