<?php
class ControllerInformationHomeArticle extends Controller {
    public function index() {

        $this->load->model('design/home_article');

        $result = $this->model_design_home_article->getArticle('home_article');

        $data['home_article'] = html_entity_decode($result);

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/home_article.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/information/home_article.tpl', $data);
        } else {
            return $this->load->view('default/template/information/home_article.tpl', $data);
        }

    }
}