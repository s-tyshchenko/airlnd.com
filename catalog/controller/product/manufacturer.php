<?php

class ControllerProductManufacturer extends Controller
{
    public function index()
    {
        $this->load->language('product/manufacturer');

        $this->load->model('catalog/manufacturer');

        $this->load->model('tool/image');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_index'] = $this->language->get('text_index');
        $data['text_empty'] = $this->language->get('text_empty');

        $data['button_continue'] = $this->language->get('button_continue');


        // OCFilter start
        if (isset($this->request->get['filter_ocfilter'])) {
            $filter_ocfilter = $this->request->get['filter_ocfilter'];
        } else {
            $filter_ocfilter = '';
        }
        // OCFilter end

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_brand'),
            'href' => $this->url->link('product/manufacturer')
        );

        $data['categories'] = array();

        $results = $this->model_catalog_manufacturer->getManufacturers();

        foreach ($results as $result) {
            $name = $result['name'];

            if (is_numeric(utf8_substr($name, 0, 1))) {
                $key = '0 - 9';
            } else {
                $key = utf8_substr(utf8_strtoupper($name), 0, 1);
            }

            if (!isset($data['categories'][$key])) {
                $data['categories'][$key]['name'] = $key;
            }

            $data['categories'][$key]['manufacturer'][] = array(
                'name' => $name,
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
            );
        }

        $data['continue'] = $this->url->link('common/home');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $this->response->setOutput($this->load->view('product/manufacturer_list', $data));
    }

    public function info()
    {
        $this->load->language('product/manufacturer');

        $this->load->model('catalog/manufacturer');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $this->document->addStyle('assets/amitek/vendor/owl/owl-carousel.css');
        $this->document->addStyle('assets/amitek/styles/search.css');
        $this->document->addStyle('catalog/view/theme/amitek/css/product.css');

        $this->document->addScript('assets/amitek/vendor/owl/owl-carousel.js', 'footer');

        if (isset($this->request->get['manufacturer_id'])) {
            $manufacturer_id = (int)$this->request->get['manufacturer_id'];
        } else {
            $manufacturer_id = 0;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'p.sort_order';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->get['limit'])) {
            $limit = (int)$this->request->get['limit'];
        } else {
            $limit = (int)$this->config->get($this->config->get('config_theme') . '_product_limit');
        }

        if (isset($this->request->get['filter_ocfilter'])) {
            $data['filter_ocfilter'] = $this->request->get['filter_ocfilter'];
        } else {
            $data['filter_ocfilter'] = false;
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        /* $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_brand'),
            'href' => $this->url->link('product/manufacturer')
        ); */

        $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);

        if ($manufacturer_info) {
            $this->document->setTitle($manufacturer_info['name']);

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $manufacturer_info['name'],
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
            );

            if ($manufacturer_info['meta_title']) {
                $this->document->setTitle($manufacturer_info['meta_title']);
            } else {
                $this->document->setTitle($manufacturer_info['name']);
            }

            if ($manufacturer_info['meta_h1']) {
                $data['heading_title'] = $manufacturer_info['meta_h1'];
            } else {
                $data['heading_title'] = $manufacturer_info['name'];
            }

            if ($manufacturer_info['image']) {
                $data['thumb'] = $this->model_tool_image->resize($manufacturer_info['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
                $this->document->setOgImage($data['thumb']);
            } else {
                $data['thumb'] = '';
            }

            $data['description'] = html_entity_decode($manufacturer_info['description'], ENT_QUOTES, 'UTF-8');

            $data['text_empty'] = $this->language->get('text_empty');
            $data['text_quantity'] = $this->language->get('text_quantity');
            $data['text_manufacturer'] = $this->language->get('text_manufacturer');
            $data['text_model'] = $this->language->get('text_model');
            $data['text_price'] = $this->language->get('text_price');
            $data['text_tax'] = $this->language->get('text_tax');
            $data['text_points'] = $this->language->get('text_points');
            $data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
            $data['text_sort'] = $this->language->get('text_sort');
            $data['text_filter'] = $this->language->get('text_filter');
            $data['text_limit'] = $this->language->get('text_limit');
            $data['text_model'] = $this->language->get('text_model');

            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');
            $data['button_continue'] = $this->language->get('button_continue');
            $data['button_list'] = $this->language->get('button_list');
            $data['button_grid'] = $this->language->get('button_grid');
            $data['button_more'] = $this->language->get('button_more');
            $data['button_clean_filter'] = $this->language->get('button_clean_filter');

            $data['compare'] = $this->url->link('product/compare');

            // Products View
            if (!empty($this->session->data['products_view'])) {
                $data['products_view'] = $this->session->data['products_view'];
            } else {
                $data['products_view'] = 'grid';
            }

            // Wishlist
            $this->load->model('account/wishlist');
            $wishlist_products = $this->model_account_wishlist->getWishlist();

            $data['products'] = array();

            $filter_data = array(
                'filter_manufacturer_id' => $manufacturer_id,
                'sort' => $sort,
                'order' => $order,
                'start' => ($page - 1) * $limit,
                'limit' => $limit,
                'with_related' => false
            );

            // OCFilter start
            if (isset($this->request->get['filter_ocfilter'])) {
                $filter_ocfilter = $this->request->get['filter_ocfilter'];
            } else {
                $filter_ocfilter = '';
            }

            $filter_data['filter_ocfilter'] = $filter_ocfilter;
            // OCFilter end

            $product_total = $this->model_catalog_product->getTotalProducts($filter_data);

            $results = $this->model_catalog_product->getProducts($filter_data);

            foreach ($results as $result) {

                if (!empty($wishlist_products[$result['product_id']])) {
                    $wishlist = true;
                } else {
                    $wishlist = false;
                }

                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                }

                if (!intval($result['price'])) {
                    $price = $this->language->get('text_no_price');
                } else if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = false;
                }

                if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $special = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
                } else {
                    $tax = false;
                }

                if ($this->config->get('config_review_status')) {
                    $rating = (int)$result['rating'];
                } else {
                    $rating = false;
                }

                if ($result['quantity'] <= 0) {
                    $stock = $result['stock_status'];
                } else {
                    $stock = $this->language->get('text_instock') . ' (' . ($result['quantity'] > 6 ? '6+' : $result['quantity']) . ')';
                }

                $attribute_groups = $this->model_catalog_product->getProductAttributes($result['product_id']);

                $inventory = $this->model_catalog_product->getProductInventory($result['product_id']);

                $related_products = [];
                if ($result['total_related'] > 0) {
                    $related_products = $this->model_catalog_product->getProductRelated2($result['product_id']);

                    foreach ($related_products as $key => $related_product) {
                        if ($related_product['image']) {
                            $related_product_image = $this->model_tool_image->resize($related_product['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                        } else {
                            $related_product_image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                        }

                        if (!intval($related_product['price'])) {
                            $related_product_price = $this->language->get('text_no_price');
                        } else if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                            $related_product_price = $this->currency->format($this->tax->calculate($related_product['price'], $related_product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                        } else {
                            $related_product_price = false;
                        }

                        if ((float)$related_product['special']) {
                            $related_product_special = $this->currency->format($this->tax->calculate($related_product['special'], $related_product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                        } else {
                            $related_product_special = false;
                        }

                        if ($this->config->get('config_tax')) {
                            $related_product_tax = $this->currency->format((float)$related_product['special'] ? $related_product['special'] : $related_product['price'], $this->session->data['currency']);
                        } else {
                            $related_product_tax = false;
                        }

                        if ($this->config->get('config_review_status')) {
                            $related_product_rating = (int)$related_product['rating'];
                        } else {
                            $related_product_rating = false;
                        }

                        if ($related_product['quantity'] <= 0) {
                            $related_product_stock = $related_product['stock_status'];
                        } else {
                            $related_product_stock = $this->language->get('text_instock') . ' (' . ($related_product['quantity'] > 6 ? '6+' : $related_product['quantity']) . ')';
                        }

                        $related_product_inventory = $this->model_catalog_product->getProductInventory($result['product_id']);

                        $related_products[$key] = array(
                            'product_id' => $related_product['product_id'],
                            'thumb' => $related_product_image,
                            'model' => $related_product['sku'],
                            'quantity' => $related_product['quantity'],
                            'name' => $related_product['name'],
                            'name_min' => mb_strimwidth($related_product['name'], 0, 45, "..."),
                            'manufacturer' => $related_product['manufacturer'],
                            'description' => utf8_substr(strip_tags(html_entity_decode($related_product['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                            'price' => $related_product_price,
                            'special' => $related_product_special,
                            'stock' => $related_product_stock,
                            'tax' => $related_product_tax,
                            'minimum' => ($related_product['minimum'] > 0) ? $related_product['minimum'] : 1,
                            'rating' => $related_product_rating,
                            'inventory' => $related_product_inventory,
                            'href' => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
                        );
                    }
                }

                $data['products'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb' => $image,
                    'model' => $result['sku'],
                    'quantity' => $result['quantity'],
                    'name' => $result['name'],
                    'manufacturer' => $result['manufacturer'],
                    'name_min' => mb_strimwidth($result['name'], 0, 45, "..."),
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                    'price' => $price,
                    'special' => $special,
                    'stock' => $stock,
                    'tax' => $tax,
                    'minimum' => ($result['minimum'] > 0) ? $result['minimum'] : 1,
                    'rating' => $rating,
                    'wishlist' => $wishlist,
                    'attribute_groups' => $attribute_groups,
                    'inventory' => $inventory,
                    'related_products' => $related_products,
                    'href' => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
                );
            }

            if ($manufacturer_info['meta_description']) {
                $this->document->setDescription($manufacturer_info['meta_description']);
            } else {
                $this->document->setDescription(sprintf($this->language->get('text_meta_description_default'), $product_total, $manufacturer_info['name'], $manufacturer_info['name']));
            }

            if ($manufacturer_info['meta_keyword']) {
                $this->document->setKeywords($manufacturer_info['meta_keyword']);
            } else {
                $this->document->setKeywords(sprintf($this->language->get('text_meta_keywords_default'), $manufacturer_info['name']));
            }

            $url = '';

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['sorts'] = array();

            $data['sorts'][] = array(
                'text' => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.sort_order&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=pd.name&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=pd.name&order=DESC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.price&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.price&order=DESC' . $url)
            );

            if ($this->config->get('config_review_status')) {
                $data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_desc'),
                    'value' => 'rating-DESC',
                    'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=rating&order=DESC' . $url)
                );

                $data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_asc'),
                    'value' => 'rating-ASC',
                    'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=rating&order=ASC' . $url)
                );
            }

            $data['sorts'][] = array(
                'text' => $this->language->get('text_model_asc'),
                'value' => 'p.model-ASC',
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.model&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_model_desc'),
                'value' => 'p.model-DESC',
                'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.model&order=DESC' . $url)
            );

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            $data['limits'] = array();

            $limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

            sort($limits);

            foreach ($limits as $value) {
                $data['limits'][] = array(
                    'text' => $value,
                    'value' => $value,
                    'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url . '&limit=' . $value)
                );
            }

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url . '&page={page}');

            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

            // http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
            if ($page == 1) {
                $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'], true), 'canonical');
            } elseif ($page == 2) {
                $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'], true), 'prev');
            } else {
                $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url . '&page=' . ($page - 1), true), 'prev');
            }

            if ($limit && ceil($product_total / $limit) > $page) {
                $this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url . '&page=' . ($page + 1), true), 'next');
            }

            $data['sort'] = $sort;
            $data['order'] = $order;
            $data['limit'] = $limit;

            // OCFilter Start
            if (isset($this->request->get['filter_ocfilter'])) {
                if (!$product_total) {
                    $this->response->redirect($this->url->link('product/category', 'path=' . $this->request->get['path']));
                }

                $data['description'] = '';

                $this->document->deleteLink('canonical');
            }

            $ocfilter_page_info = $this->load->controller('extension/module/ocfilter/getPageInfo');

            if ($ocfilter_page_info) {
                $this->document->setTitle($ocfilter_page_info['meta_title']);

                if ($ocfilter_page_info['meta_description']) {
                    $this->document->setDescription($ocfilter_page_info['meta_description']);
                }

                if ($ocfilter_page_info['meta_keyword']) {
                    $this->document->setKeywords($ocfilter_page_info['meta_keyword']);
                }

                $data['heading_title'] = $ocfilter_page_info['title'];

                if ($ocfilter_page_info['description'] && !isset($this->request->get['page']) && !isset($this->request->get['sort']) && !isset($this->request->get['order']) && !isset($this->request->get['search']) && !isset($this->request->get['limit'])) {
                    $data['description'] = html_entity_decode($ocfilter_page_info['description'], ENT_QUOTES, 'UTF-8');
                }

                $data['breadcrumbs'][] = array(
                    'text' => $ocfilter_page_info['title'],
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
                );
            } else {
                $meta_title = $this->document->getTitle();
                $meta_description = $this->document->getDescription();
                $meta_keyword = $this->document->getKeywords();

                $filter_title = $this->load->controller('extension/module/ocfilter/getSelectedsFilterTitle');

                if ($filter_title) {
                    if (false !== strpos($meta_title, '{filter}')) {
                        $meta_title = trim(str_replace('{filter}', $filter_title, $meta_title));
                    } else {
                        $meta_title .= ' ' . $filter_title;
                    }

                    $this->document->setTitle($meta_title);

                    if ($meta_description) {
                        if (false !== strpos($meta_description, '{filter}')) {
                            $meta_description = trim(str_replace('{filter}', $filter_title, $meta_description));
                        } else {
                            $meta_description .= ' ' . $filter_title;
                        }

                        $this->document->setDescription($meta_description);
                    }

                    if ($meta_keyword) {
                        if (false !== strpos($meta_keyword, '{filter}')) {
                            $meta_keyword = trim(str_replace('{filter}', $filter_title, $meta_keyword));
                        } else {
                            $meta_keyword .= ' ' . $filter_title;
                        }

                        $this->document->setKeywords($meta_keyword);
                    }

                    $heading_title = $data['heading_title'];

                    if (false !== strpos($heading_title, '{filter}')) {
                        $heading_title = trim(str_replace('{filter}', $filter_title, $heading_title));
                    } else {
                        $heading_title .= ' ' . $filter_title;
                    }

                    $data['heading_title'] = $heading_title;

                    $data['description'] = '';

                    $data['breadcrumbs'][] = array(
                        'text' => (utf8_strlen($heading_title) > 30 ? utf8_substr($heading_title, 0, 30) . '..' : $heading_title),
                        'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
                    );
                } else {
                    $this->document->setTitle(trim(str_replace('{filter}', '', $meta_title)));
                    $this->document->setDescription(trim(str_replace('{filter}', '', $meta_description)));
                    $this->document->setKeywords(trim(str_replace('{filter}', '', $meta_keyword)));

                    $data['heading_title'] = trim(str_replace('{filter}', '', $data['heading_title']));
                }
            }
            // OCFilter End


            $data['continue'] = $this->url->link('common/home');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('product/manufacturer_info', $data));
        } else {
            $url = '';

            if (isset($this->request->get['manufacturer_id'])) {
                $url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('product/manufacturer/info', $url)
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_error');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

            $data['header'] = $this->load->controller('common/header');
            $data['footer'] = $this->load->controller('common/footer');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }
    }
}
