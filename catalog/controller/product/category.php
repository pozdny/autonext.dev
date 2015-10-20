<?php
class ControllerProductCategory extends Controller {
	public function index() {
		if (isset($this->request->get['apisearch'])) {
			if (isset($this->request->get['path'])) {
				$category_id = $this->request->get['path'];
			}
			$data['apisearch'] = $this->indexSearch('yes', $category_id);

		}
		else{
			$data['apisearch'] = '';
		}
		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		$data['catalog_id'] = $data['section_id'] = '';
		if (isset($this->request->get['catalog_id'])) {
			$data['catalog_id'] = $this->request->get['catalog_id'];
		}
		if (isset($this->request->get['section_id'])) {
			$data['section_id'] = $this->request->get['section_id'];
		}
		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}
		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
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
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_product_limit');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);


		if (isset($this->request->get['path'])) {
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

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
					);
					$category_name = $category_info['name'];
					if($category_name == 'Оборудование'){
						$data['oborudovanie_show'] = true;
					}
					else{
						$data['oborudovanie_show'] = false;
					}
				}
			}
		} else {
			$category_id = 0;
		}
		$arr_path = explode('_', $this->request->get['path']);

		if(sizeof($arr_path) > 1 ){
			$data['catone'] = 0;
		}
		else{
			$data['catone'] = $category_id;
		}

		$data['form_order'] = $this->load->controller('product/form_order');

		if ($route == 'product/category' && isset($this->request->get['path'])) {
			$data['name_files'] = array();
			$path = explode('_', (string)$this->request->get['path']);
			$arr_path = explode('_', $this->request->get['path']);
			if(sizeof($arr_path) == 1){
				$this->load->language('product/category');
				$data["title_links_down_prezent"] = $this->language->get('title_links_down_prezent');
				$data["title_links_down_price"] = $this->language->get('title_links_down_price');
				$cat_id = (int)array_pop($arr_path);
				$res = $this->model_catalog_category->getLink($cat_id);

				$data['name_files'] = $res;
			}
			else{
				$cat_id = '';

			}
			if($cat_id == 69){
				$data['prezentaciya'] = 'yes';
			}
			else{
				$data['prezentaciya'] = '';
			}

			$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
		}
		else{
			$data['name_files'] = '';
		}

		$category_info = $this->model_catalog_category->getCategory($category_id); //echo '<pre>'; print_r($category_info); echo '</pre>';

		if ($category_info) {
			$this->document->setTitle($category_info['meta_title']);
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/category', 'path=' . $this->request->get['path']), 'canonical');

			$data['heading_title'] = $category_info['name'];

			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);

			if ($category_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
			} else {
				$data['thumb'] = '';
			}

			$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['categories'] = array();

			$results = $this->model_catalog_category->getCategories($category_id);

			/*foreach ($results as $result) {
				$filter_data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);

				$data['categories'][] = array(
					'name'  => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
				);
			}*/

			$data['products'] = array();

			$filter_data = array(
				'filter_category_id' => $category_id,
				'filter_filter'      => $filter,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);

			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

			$results = $this->model_catalog_product->getProducts($filter_data);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				}


///////////////////////////////////////////

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {

					if($result['price'] != 0){
						$price = $this->currency->format($this->tax->calculate($this->currency->convert($result['price'], $this->config->get('config_currency'), $this->config->get('config_currency_out')),  $result['tax_class_id'], $this->config->get('config_tax')), $this->config->get('config_currency_out'), '');
					}
					else{
						$price = $result['price_opt_big'] + $result['price_opt_big']*0.3;
						$price = $this->currency->format($this->tax->calculate($this->currency->convert($price, $this->config->get('config_currency'), $this->config->get('config_currency_out')),  $result['tax_class_id'], $this->config->get('config_tax')), $this->config->get('config_currency_out'), '');
					}
				} else {
					$price = $this->currency->format($this->tax->calculate($this->currency->convert(0, $this->config->get('config_currency'), $this->config->get('config_currency_out')),  $result['tax_class_id'], $this->config->get('config_tax')), $this->config->get('config_currency_out'), '');;

				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);

			if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}

			/*$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);*/

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

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
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');

			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/category.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/product/category.tpl', $data));
			}
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
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
				'href' => $this->url->link('product/category', $url)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}
	public function getApiData(){
		$json = array();
		$this->load->model('catalog/category');
		if (isset($this->request->post['data'])) {
			$data = json_decode(html_entity_decode($this->request->post['data']));
			$action = $data->action;
			if($action == 'getSectionsList'){
				$catalog_id = $data->catalog_id;
				$result = $this->model_catalog_category->getSectionsList($catalog_id);
				$json['response'] = $result;
			}
			if($action == 'getSubSectionsList'){
				$catalog_id = $data->params->catalog_id;
				$section_id = $data->params->section_id;
				$result = $this->model_catalog_category->getSubSectionsList($catalog_id, $section_id);
				$json['response'] = $result;
			}

		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	public function searchApiResult(){
		$json = array();

		$this->load->model('catalog/category');
		if (isset($this->request->post['data'])) {
			$data =  json_decode(html_entity_decode($this->request->post['data']));
			$action = $data->action;
			if($action == 'putData'){
				$catalog_id = $data->catalog_id;
				$section_id = $data->section_id;
				$list = $data->list;
				$result = $this->model_catalog_category->putListItems($catalog_id, $section_id, $list);
			}
			elseif($action == 'putItemsQuantity'){
				$list = $data->list;
				$result = $this->model_catalog_category->putItemsQuantity($list);
			}
		}
		$json['action'] = $action;
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function api_search_result()
	{
		$this->response->setOutput($this->indexSearch('no'));
	}
	public function indexSearch($get, $category_id = ''){
		$this->load->model('catalog/category');
		if($get == 'yes'){
			$data = array();
			$data['breadcrumbs_api'] = array();
			$sections = $subsections = $items = $chooseInfo = '';
			$storages = array();
			$category_info = $this->model_catalog_category->getCategory($category_id);
			if (isset($this->request->get['catalog_id'])) {
				$catalog_id = $this->request->get['catalog_id'];
				$category_auto_info = $this->model_catalog_category->getCategoryAutoById($catalog_id);
			}
			else{
				$catalog_id = '';
				$category_auto_info = '';
			}
			if (isset($this->request->get['section_id'])) {
				$section_id = $this->request->get['section_id'];
				$section_auto_info = $this->model_catalog_category->getSectionAutoById($section_id);
			}else{
				$section_auto_info = '';
			}
			if (isset($this->request->get['subsection_id'])) {
				$subsection_id = $this->request->get['subsection_id'];
				//$subsection_auto_info = $this->model_catalog_category->getSectionAutoById($section_id);
			}else{
				//$section_auto_info = '';
			}
			if($category_info){
				$data['heading_title'] = $category_info['name'];
			}
			else{
				$data['heading_title'] = 'Запасные части';
			}

//echo '<pre>'; print_r($section_auto_info); echo '</pre>';
			if($category_auto_info){
				$data['breadcrumbs_api'][] = array(
					'text' => $category_auto_info['name'],
					'href'  => $this->url->link('product/category', 'path=' . $category_id ).'&apisearch=catalog&catalog_id='.$catalog_id
				);
			}
			if($section_auto_info){
				$data['breadcrumbs_api'][] = array(
					'text' => $section_auto_info['name'],
					'href'  => $this->url->link('product/category', 'path=' . $category_id ).'&apisearch=catalog&catalog_id='.$catalog_id.'&section_id='.$section_id
				);
			}
			if (isset($this->request->get['catalog_id']) && !isset($this->request->get['section_id'])) {
				$chooseInfo = "Выберите раздел:";
				$results = $this->model_catalog_category->getSectionsList($catalog_id);//echo '<pre>'; print_r($results); echo '</pre>';
				$sections = $results['sections'];
			}
			elseif(isset($this->request->get['catalog_id']) && isset($this->request->get['section_id']) && !isset($this->request->get['subsection_id'])){
				$chooseInfo = "Выберите подраздел:";
				$sections = '';
				$results = $this->model_catalog_category->getSubSectionsList($catalog_id, $section_id);//echo '<pre>'; print_r($results); echo '</pre>';
				$subsections = $results['sections'];
			}
			elseif(isset($this->request->get['catalog_id']) && isset($this->request->get['section_id']) && isset($this->request->get['subsection_id'])){
				$sections = '';
				$subsections = '';
				$results = $this->model_catalog_category->getItems($catalog_id, $section_id, $subsection_id);//echo '<pre>'; print_r($results); echo '</pre>';
				$items = $results;
				//storages
				$storages = $this->model_catalog_category->getStorages(); //echo '<pre>'; print_r($result); echo '</pre>';
			}
			else{
				$sections = '';
			}
			$data['chooseInfo'] = $chooseInfo;
			$data['sections'] = $sections;
			$data['subsections'] = $subsections;
			$data['results'] = $items;
			$data['storages'] = $storages;
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/api_search_result_full.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/product/api_search_result_full.tpl', $data);
			} else {
				return $this->load->view('default/template/product/api_search_result_full.tpl', $data);
			}
		}
		else{
			$data = array();

			$catalog_id = $section_id = $subsection_id = '';
			//echo '<pre>';print_r($this->request->get);echo '</pre>';

			if (isset($this->request->get['catalog_id'])) {
				$catalog_id = $this->request->get['catalog_id'];
			}
			if (isset($this->request->get['section_id'])) {
				$section_id = $this->request->get['section_id'];
			}
			if (isset($this->request->get['subsection_id'])) {
				$subsection_id = $this->request->get['subsection_id'];
			}
			$result = $this->model_catalog_category->getItems($catalog_id, $section_id, $subsection_id);
			//storages
			$storages = $this->model_catalog_category->getStorages(); //echo '<pre>'; print_r($result); echo '</pre>';
			$data['storages'] = $storages;
			$data['results'] = $result;
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/api_search_result.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/product/api_search_result.tpl', $data);
			} else {
				return $this->load->view('default/template/product/api_search_result.tpl', $data);
			}
		}

	}
}