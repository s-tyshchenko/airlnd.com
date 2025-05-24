<?php

/**
 * @example php console/index.php route=google_merchant/upload limit=5 offset=10 updated_after=2023-12-01
 */
class ControllerGoogleMerchantUpload extends Controller
{
    private $service;

    public function __construct($registry)
    {
        parent::__construct($registry);

        $google_account_credentials = DIR_APPLICATION . 'google-account-credentials.json';
        if (!file_exists($google_account_credentials)) {
            $this->log('Configuration file missing: ' . $google_account_credentials);
            return;
        }

        putenv('GOOGLE_APPLICATION_CREDENTIALS=' . $google_account_credentials);

        $client = new Google_Client();
        $client->useApplicationDefaultCredentials();

        $client->setScopes([Google_Service_ShoppingContent::CONTENT]);
        $client->addScope('https://www.googleapis.com/auth/content');

        $this->service = new Google_Service_ShoppingContent($client);
    }

    public function index()
    {
        $start = microtime(true);

        try {
            $this->load->model('google_merchant/product');
            $this->load->model('google_merchant/country');

            $limit = isset($this->request->get['limit']) ? $this->request->get['limit'] : false;
            $offset = isset($this->request->get['offset']) ? $this->request->get['offset'] : false;
            $updated_after = isset($this->request->get['updated_after']) ? $this->request->get['updated_after'] : false;

            $products = $this->model_google_merchant_product->getProducts([
                'language_id' => (int)$this->config->get('config_language_id'),
                'store_id' => (int)$this->config->get('config_store_id'),
                'limit' => $limit,
                'offset' => $offset,
                'updated_after' => $updated_after
            ]);

            $country = $this->model_google_merchant_country->getCountry(['country_id' => $this->config->get('config_country_id')]);
            $this->config->set('config_country_key', $country['iso_code_2']);

            foreach ($products as $product_info) {
                $categories = $this->model_google_merchant_product->getProductCategories([
                    'product_id' => $product_info['product_id'],
                    'language_id' => (int)$this->config->get('config_language_id')
                ]);

                $product_info['category'] = implode(' > ', array_column($categories, 'name'));

                $this->service->products->insert($this->config->get('google_merchant_id'), $this->createProduct($product_info));
            }

            $time = microtime(true) - $start;
            $this->log(sprintf('Uploaded %s products for %.4F s. ', count($products), $time));
        } catch (Exception $exception) {
            $this->log('Error uploading product: ' . $exception->getMessage());
        }
    }


    private function createProduct($product_info)
    {
        $product = new Google_Service_ShoppingContent_Product();

        $product->setOfferId($product_info['product_id']);
        $product->setTitle($product_info['name']);
        $product->setDescription($product_info['description'] ? $product_info['description'] : $product_info['name']);
        $product->setLink($this->url->link('product/product', 'product_id=' . $product_info['product_id']));
        $product->setImageLink(($this->config->get('config_secure') ? HTTPS_SERVER : HTTP_SERVER) . 'image/' . $product_info['image']);
        $product->setContentLanguage($this->config->get('config_language'));
        $product->setTargetCountry($this->config->get('config_country_key'));
        $product->setChannel('online');
        if ($product_info['quantity'] > 0) {
            $product->setAvailability('in_stock');
        } else {
            $product->setAvailability('backorder');
            $product->setAvailabilityDate(date('Y-m-d\TH:i:s\Z', strtotime('+1 week')));
        }
        $product->setCondition('new');
        $product->setGoogleProductCategory($product_info['category']);
        $product->setMpn($product_info['sku']);

        $price = new Google_Service_ShoppingContent_Price();
        $price->setValue($product_info['price']);
        $price->setCurrency('UAH');

        $product->setPrice($price);

        return $product;
    }

    private function log($string) {
        $log = new Log('google_merchant_upload.log');
        $log->write($string);
    }
}