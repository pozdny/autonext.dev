<?php
class ControllerInformationOilArticle extends Controller {
    public function index() {

        $this->load->model('design/home_article');

        $result = $this->model_design_home_article->getArticleOil('oil_article');

        $data['oil_article'] = $result;

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/oil_article.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/information/oil_article.tpl', $data);
        } else {
            return $this->load->view('default/template/information/oil_article.tpl', $data);
        }

    }
}