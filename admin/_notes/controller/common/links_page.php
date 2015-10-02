<?php
class ControllerCommonLinksPage extends Controller {
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
                $data['name_file'] = $arr; echo '777'; echo '<pre>'; print_r($data['name_file']); echo '</pre>';
            }
            else{
                $data['name_file'] = null; echo '111';
            }
        }
        else{
            $data['name_file'] = null; echo '222';
        }

echo '567';
        $this->response->setOutput($this->load->view('catalog/links_page.tpl', $data));

    }
}