<?php
class ControllerProductFormOrder extends Controller {
	public function index() {
        $data = array();
        $arr_path = explode('_', $this->request->get['path']);
        if(sizeof($arr_path) > 1){
            $cat_id = (int)array_shift($arr_path);
        }
        else{
            $cat_id = (int)array_pop($arr_path);
        }
        if($cat_id == 71){
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/form_equipment.tpl')) {
                return $this->load->view($this->config->get('config_template') . '/template/product/form_equipment.tpl', $data);
            } else {
                return $this->load->view('default/template/product/form_equipment.tpl', $data);
            }
        }
        elseif($cat_id == 70){
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/form_zapchasti.tpl')) {
                return $this->load->view($this->config->get('config_template') . '/template/product/form_zapchasti.tpl', $data);
            } else {
                return $this->load->view('default/template/product/form_zapchasti.tpl', $data);
            }
        }

	}
}
