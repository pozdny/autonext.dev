<?php
class ControllerCommonContentBottom extends Controller {
	public function index() {
		$this->load->model('design/layout');

		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}

		$layout_id = 0;

		if ($route == 'product/category' && isset($this->request->get['path'])) {
			$this->load->model('catalog/category');
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

		if ($route == 'product/product' && isset($this->request->get['product_id'])) {
			$this->load->model('catalog/product');

			$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		}

		if ($route == 'information/information' && isset($this->request->get['information_id'])) {
			$this->load->model('catalog/information');

			$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}

		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}

		if (!$layout_id) {
			$layout_id = $this->config->get('config_layout_id');
		}

		$this->load->model('extension/module');

		$data['modules'] = array();

		$modules = $this->model_design_layout->getLayoutModules($layout_id, 'content_bottom');

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

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/content_bottom.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/content_bottom.tpl', $data);
		} else {
			return $this->load->view('default/template/common/content_bottom.tpl', $data);
		}
	}
}