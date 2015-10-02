<?php
class ControllerCatalogLinksPage extends Controller {
    public function index() {

        $this->load->model('catalog/links_page');
        $data = array();
        $data["name_links_down"] = $this->language->get('name_links_down');

        $res = $this->model_catalog_links_page->getLinkAd1();


        if($res) {
            foreach ($res as $name_f) {
                $arr[] = $name_f['name_file'];
            }
            if(sizeof($arr) > 0) {
                $data['name_file'] = $arr; echo '777';
            }
            else{
                $data['name_file'] = null;
            }
        }
        else{
            $data['name_file'] = null;
        }

        $this->response->setOutput($this->load->view('catalog/links_page.tpl', array()));

    }
}