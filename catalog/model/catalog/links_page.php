<?php
class ModelCatalogLinksPage extends Model {
    public function getLink($num){
        $sql = "SELECT * FROM " . DB_PREFIX . "download_files WHERE number_sell_file = ".$num;
        $query = $this->db->query($sql);

        if ($query->num_rows) {
            return $query->rows;
        } else {
            return 0;
        }
    }

}