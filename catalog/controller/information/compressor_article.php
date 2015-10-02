<?php
class ControllerInformationCompressorArticle extends Controller {
    public function index() {

        $this->load->model('design/home_article');

        $result = $this->model_design_home_article->getArticleCompressor('compressor_article');

        $data['compressor_article'] = html_entity_decode($result);

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/compressor_article.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/information/compressor_article.tpl', $data);
        } else {
            return $this->load->view('default/template/information/compressor_article.tpl', $data);
        }

    }
}