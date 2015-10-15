<?php
class ControllerCommonColumnLeft extends Controller {
    public function index() {
        $this->load->model('design/layout');

        if (isset($this->request->get['route'])) {
            $route = (string)$this->request->get['route'];
        } else {
            $route = 'common/home';
        }

        $layout_id = 0;

        if (($route == 'product/category') && isset($this->request->get['path'])) {
            $this->load->model('catalog/category');

            $path = explode('_', (string)$this->request->get['path']); //echo '<pre>'; print_r($path); echo '</pre>';

            $layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));//echo '<pre>'; print_r(end($path)); echo '</pre>';
        }
        if (($route == 'product/category/api_search_result') && isset($this->request->get['path'])) {
            $this->load->model('catalog/category');

            $path = explode('_', (string)$this->request->get['path']); //echo '<pre>'; print_r($path); echo '</pre>';

            $layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));//echo '<pre>'; print_r(end($path)); echo '</pre>';
        }
        /*if ($route == 'product/product' && isset($this->request->get['product_id'])) {
            $this->load->model('catalog/product');
            $path = explode('_', (string)$this->request->get['path']); //echo '<pre>'; print_r($path); echo '</pre>';

            $layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));//echo '<pre>'; print_r(end($path)); echo '</pre>';
        }*/

        if ($route == 'information/information' && isset($this->request->get['information_id'])) {
            $this->load->model('catalog/information');

            $layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
        }
        if ($route == 'product/equipment') {
            $this->load->model('catalog/category');
            $layout_id = 3;//echo '<pre>'; print_r(end($path)); echo '</pre>';
        }

        if (!$layout_id) {
            $layout_id = $this->model_design_layout->getLayout($route);
        }

        if (!$layout_id) {
            $layout_id = $this->config->get('config_layout_id');
        }

        $this->load->model('extension/module');

        $data['modules'] = array();

        $modules = $this->model_design_layout->getLayoutModules($layout_id, 'column_left');

        foreach ($modules as $module) {
            $part = explode('.', $module['code']);

            if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
                $data['modules'][] = $this->load->controller('module/' . $part[0]);
            }

            if (isset($part[1])) {
                $setting_info = $this->model_extension_module->getModule($part[1]);

                if ($setting_info && $setting_info['status']) {
                    $data['modules'][] = $this->load->controller('module/' . $part[0], $setting_info);
                }
            }
        }
        //categories

        $data['categories'] = array();
        if ($route == 'product/category' || $route = 'product/category/api_search_result'){
            $this->load->model('catalog/category');

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
                if (isset($parts[0])) {
                    $data['category_id'] = $parts[0];
                } else {
                    $data['category_id'] = 0;
                }

                if (isset($parts[1])) {
                    $data['child_id'] = $parts[1];
                } else {
                    $data['child_id'] = 0;
                }

                $category_id = (int)array_pop($parts);
                $arr_path = explode('_', $this->request->get['path']);
                if(sizeof($arr_path) > 1){
                    if(sizeof($arr_path) > 2){
                        $cat_id = (int)array_shift($arr_path);
                        $cat_id_child = (int)array_shift($arr_path);
                        $parts = $arr_path;
                        $data['child_id_sub'] = $parts[0];
                    }
                    else{
                        $cat_id = (int)array_shift($arr_path);
                        $cat_id_child = (int)array_shift($arr_path);
                        $data['child_id_sub'] = '';
                    }

                }
                else{
                    $cat_id = (int)array_pop($arr_path);
                    $parts = explode('_', (string)$this->request->get['path']);
                    $data['child_id_sub'] = '';
                }
//echo '<pre>'; print_r($parts); echo '</pre>';
                foreach ($parts as $path_id) {
                    if (!$path) {
                        $path = (int)$path_id;
                    } else {
                        $path .= '_' . (int)$path_id;
                    }

                    $category_info = $this->model_catalog_category->getCategory($path_id);
                    $data['categories'] = array();
                    $data['getSectionsList'] = null;
                    if ($category_info) {
                        $data['breadcrumbs'][] = array(
                            'text' => $category_info['name'],
                            'href' => $this->url->link('product/category', 'path=' . $path . $url)
                        );
                        if($category_info['alias'] == 'zapasnye-chasti'){
                            $data['getSectionsList'] = 'getSectionsList';
                            $cat_id = array();
                            if(sizeof($arr_path) <= 1){
                                $parts = array();
                            }
                            $categories = $this->model_catalog_category->getCategoriesAuto($cat_id);
                            foreach($categories as $category){
                                $data['categories'][] = array(
                                    'category_id'  => $category['category_id'],
                                    'name'  => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                                    'href'  => $this->url->link('product/category', 'path=' . $category['parent_id'] . '_' . $category['category_id'] . $url),
                                    'children'    => '',
                                    'active'   => in_array($category['category_id'], $parts),
                                );
                            }
                        }
                        else{
                            $categories = $this->model_catalog_category->getCategories($cat_id); //echo '<pre>'; print_r($categories); echo '</pre>';
                            foreach ($categories as $category) {
                                if(isset($cat_id_child)){
                                    $children_data = array();
                                    if ($category['category_id'] == $data['child_id']) {
                                        $children = $this->model_catalog_category->getCategories($category['category_id']);

                                        foreach($children as $child) {
                                            $filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

                                            $children_data[] = array(
                                                'category_id' => $child['category_id'],
                                                'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                                                'href' => $this->url->link('product/category', 'path=' . $cat_id . '_' . $category['category_id'] . '_' . $child['category_id'])
                                            );
                                        }
                                    }
                                }
                                else{
                                    $children_data = null;
                                    /*$children_data = array();
                                    $children = $this->model_catalog_category->getCategories($category['category_id']);

                                    foreach($children as $child) {
                                        $filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

                                        $children_data[] = array(
                                            'category_id' => $child['category_id'],
                                            'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                                            'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                                        );
                                    }*/
                                    // echo '<pre>'; print_r($children_data); echo '</pre>';
                                }
                                $filter_data = array(
                                    'filter_category_id'  => $category['category_id'],
                                    'filter_sub_category' => true
                                );
                                $parts = explode('_', (string)$this->request->get['path']);
                                $data['categories'][] = array(
                                    'category_id'  => '',
                                    'name'  => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                                    'href'  => $this->url->link('product/category', 'path=' . $category['parent_id'] . '_' . $category['category_id'] . $url),
                                    'children'    => $children_data,
                                    'active'   => in_array($category['category_id'], $parts),
                                );
                                //echo $category['category_id'];
                            }
                        }

                    }
                }
            } else {
                $category_id = 0;
            }
        }
//echo '<pre>';print_r($data['categories']); echo '</pre>';
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/column_left.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/common/column_left.tpl', $data);
        } else {
            return $this->load->view('default/template/common/column_left.tpl', $data);
        }
    }
}