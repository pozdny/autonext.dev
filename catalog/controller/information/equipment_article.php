<?php
class ControllerInformationEquipmentArticle extends Controller {
    public function index() {

        $this->load->model('design/home_article');

        $result = $this->model_design_home_article->getArticleEquipment('equipment_article');

        $data['equipment_article'] = html_entity_decode($result);

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/equipment_article.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/information/equipment_article.tpl', $data);
        } else {
            return $this->load->view('default/template/information/equipment_article.tpl', $data);
        }

    }
}