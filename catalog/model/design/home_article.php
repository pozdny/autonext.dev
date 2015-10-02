<?php
class ModelDesignHomeArticle extends Model {
    public function getArticle(){
        $query = $this->db->query("SELECT home_article FROM " . DB_PREFIX . "layout WHERE layout_id = 1");

        if ($query->num_rows) {
            return $query->row['home_article'];
        } else {
            return 0;
        }
    }

    public function getArticleZip(){
        $query = $this->db->query("SELECT home_article FROM " . DB_PREFIX . "layout WHERE layout_id = 15");

        if ($query->num_rows) {
            return $query->row['home_article'];
        } else {
            return 0;
        }
    }

    public function getArticleOil(){
        $query = $this->db->query("SELECT home_article FROM " . DB_PREFIX . "layout WHERE layout_id = 14");

        if ($query->num_rows) {
            return $query->row['home_article'];
        } else {
            return 0;
        }
    }

    public function getArticleEquipment(){
        $query = $this->db->query("SELECT home_article FROM " . DB_PREFIX . "layout WHERE layout_id = 16");

        if ($query->num_rows) {
            return $query->row['home_article'];
        } else {
            return 0;
        }
    }

    public function getArticleCompressor(){
        $query = $this->db->query("SELECT home_article FROM " . DB_PREFIX . "layout WHERE layout_id = 17");

        if ($query->num_rows) {
            return $query->row['home_article'];
        } else {
            return 0;
        }
    }

}