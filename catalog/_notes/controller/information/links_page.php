<?php
class ControllerInformationLinksPage extends Controller {
    public function index() {

        $this->load->model('catalog/links_page');
        $this->load->language('information/information');
        $data = array();
        $data["name_links_down"] = $this->language->get('name_links_down');

        if (isset($this->request->get['num'])) {
            $num = $this->request->get['num'];
        } else {
            $num = '1';
        }
        $res = $this->model_catalog_links_page->getLink($num);


        if($res) {
            $data['name_file'] = $res;
        }
        else{
            $data['name_file'] = null;
        }


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/links_page.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/information/links_page.tpl', $data);
        } else {
            return $this->load->view('default/template/information/links_page.tpl', $data);
        }

    }
}