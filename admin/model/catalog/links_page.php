<?php
class ModelCatalogLinksPage extends Model {
    public function getLinks($data){
        $sql = "SELECT df.id as link_id, df.name as file_name, df.link as link FROM " . DB_PREFIX . "download_files df LEFT JOIN " . DB_PREFIX . "category ct ON(ct.category_id = df.category_id) WHERE df.category_id = '" . (int)$data . "'";
        $query = $this->db->query($sql);

        if ($query->num_rows) {
            return $query->rows;
        } else {
            return 0;
        }
    }

    public function updateLink($data = array()){
        if (!empty($data['id'])) {
            $id = $data['id'];
        }
        if (!empty($data['val'])) {
            $val = $data['val'];
        }
        else{
            $val = '';

        }
        $sql = "UPDATE ". DB_PREFIX ."download_files SET link = '" . $this->db->escape($val) . "' WHERE id =".$id;
        $query = $this->db->query($sql);

        return true;
    }
    public function deleteLinks($id){
        if (!empty($id)) {
            $links_id = $id;
        }

        $sql = "DELETE FROM ". DB_PREFIX ."download_files  WHERE id =".$links_id;
        $query = $this->db->query($sql);

        return true;
    }

}