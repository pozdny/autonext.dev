<?php
class ModelCatalogCategory extends Model {
	public function getCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT *, ua.keyword as alias  FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "url_alias ua ON (ua.query LIKE 'category_id=".$category_id."') LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");
		return $query->row;
	}

	public function getCategories($parent_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");
		return $query->rows;
	}
	public function getCategoriesAuto($cat_id = array()) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_auto");
		return $query->rows;
	}
	public function getCategoryFilters($category_id) {
		$implode = array();

		$query = $this->db->query("SELECT filter_id FROM " . DB_PREFIX . "category_filter WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$implode[] = (int)$result['filter_id'];
		}

		$filter_group_data = array();

		if ($implode) {
			$filter_group_query = $this->db->query("SELECT DISTINCT f.filter_group_id, fgd.name, fg.sort_order FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_group fg ON (f.filter_group_id = fg.filter_group_id) LEFT JOIN " . DB_PREFIX . "filter_group_description fgd ON (fg.filter_group_id = fgd.filter_group_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND fgd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY f.filter_group_id ORDER BY fg.sort_order, LCASE(fgd.name)");

			foreach ($filter_group_query->rows as $filter_group) {
				$filter_data = array();

				$filter_query = $this->db->query("SELECT DISTINCT f.filter_id, fd.name FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_description fd ON (f.filter_id = fd.filter_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND f.filter_group_id = '" . (int)$filter_group['filter_group_id'] . "' AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY f.sort_order, LCASE(fd.name)");

				foreach ($filter_query->rows as $filter) {
					$filter_data[] = array(
						'filter_id' => $filter['filter_id'],
						'name'      => $filter['name']
					);
				}

				if ($filter_data) {
					$filter_group_data[] = array(
						'filter_group_id' => $filter_group['filter_group_id'],
						'name'            => $filter_group['name'],
						'filter'          => $filter_data
					);
				}
			}
		}

		return $filter_group_data;
	}

	public function getCategoryLayoutId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_layout WHERE category_id = '" . (int)$category_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}

	public function getTotalCategoriesByCategoryId($parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row['total'];
	}

	public function getLink($data){
		$sql = "SELECT * FROM " . DB_PREFIX . "download_files df WHERE df.category_id = ".(int)$data;
		$query = $this->db->query($sql);

		if ($query->num_rows) {
			return $query->rows;
		} else {
			return 0;
		}
	}
	public function getSectionsList($catalog_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "category_auto ca WHERE ca.category_id = ".(int)$catalog_id;
		$query = $this->db->query($sql);
		$category_name = $query->row['name'];

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_section_auto cts LEFT JOIN " . DB_PREFIX . "category_section_auto csa ON (cts.category_section_id = csa.category_id)  WHERE cts.parent_id = '" . (int)$catalog_id."' ORDER BY csa.name");
		if ($query->num_rows) {
			$section_data = array();
			foreach ($query->rows as $result) {
				$section_data[] = array(
					'category_id'   => $result['category_id'],
					'name'          => $result['name'],
					'parent_id'     => $result['parent_id'],
					'photo'         => $result['photo']
				);
			}
			$parent_name = array();
			$parent_name[] = $category_name;

			return array(
				'parent_name' => $parent_name,
				'parent_id'   => $catalog_id,
				'sections'    => $section_data
			);
		} else {
			return 0;
		}

	}
	public function getSubSectionsList($catalog_id, $section_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "category_auto ca WHERE ca.category_id = ".(int)$catalog_id;
		$query = $this->db->query($sql);
		$catalog_name = $query->row['name'];

		$sql = "SELECT * FROM " . DB_PREFIX . "category_section_auto cs WHERE cs.category_id = ".(int)$section_id;
		$query = $this->db->query($sql);
		$section_name = $query->row['name'];

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_subsection_auto cts LEFT JOIN " . DB_PREFIX . "category_subsection_auto csa ON (cts.category_subsection_id = csa.category_id)  WHERE cts.parent_id = '" . (int)$section_id."' AND cts.catalog_id = '" . (int)$catalog_id."' ORDER BY csa.name");
		if ($query->num_rows) {
			$section_data = array();
			foreach ($query->rows as $result) {
				$section_data[] = array(
					'category_id'   => $result['category_id'],
					'name'          => $result['name'],
					'parent_id'     => $result['parent_id'],
					'photo'         => $result['photo']
				);
			}
			$parent_name = array();
			$parent_name[] = $catalog_name;
			$parent_name[] = $section_name;
			return array(
				'parent_name' => $parent_name,
				'parent_id'   => $catalog_id,
				'parent_section_id'   => $section_id,
				'sections'    => $section_data
			);
		} else {
			return 0;
		}

	}

	public function putListItems($catalog_id, $section_id, $data){

		if(isset($data->part_types)){
			$part_types = $data->part_types;
			foreach($part_types as $key=>$value){
				$section_section_id = $key;
				$name = $value;
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_section_section_auto css  WHERE css.section_id = '" . $section_section_id ."'");
				if (!$query->num_rows) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "category_section_section_auto SET `section_id` = '" . (int)$section_section_id . "',`parent_id` = '" . (int)$catalog_id . "',  `name` = '" . $name . "'");
				}
				else{
					$this->db->query("UPDATE " . DB_PREFIX . "category_section_section_auto SET `parent_id` = '" . (int)$catalog_id . "',  `name` = '" . $name . "' WHERE section_id = '" . $section_section_id ."'");

				}
			}
 		}
		if(isset($data->items)){
			$items = $data->items;
			foreach($items as $key=>$value){
				$article = $key;
				$item_id = $value->id;
				$name = $value->name;
				$cat_id = $value->cat_id;
				$part_type_id = $value->part_type_id;
				$model_id = $value->model_id;
				$manufacturer_id = $value->manufacturer_id;
				if($value->photo){
					$photo = str_replace(' ', '&amp;', $value->photo);
				}
				else{
					$photo = '';
				}
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_items_auto cia  WHERE cia.item_id = '" . $item_id ."'");
				if (!$query->num_rows) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "category_items_auto SET `item_id` = '" . (int)$item_id . "',  `name` = '" . $name . "', `cat_id` = '" . (int)$cat_id . "', `part_type_id` = '" . (int)$part_type_id . "' ,`model_id` = '" . (int)$model_id . "', `manufacturer_id` = '" . (int)$manufacturer_id . "', `photo` = '" . $photo . "' , `article` = '" . (int)$article . "'");
				}
				else{
					$this->db->query("UPDATE " . DB_PREFIX . "category_items_auto SET `name` = '" . $name . "', `cat_id` = '" . (int)$cat_id . "', `part_type_id` = '" . (int)$part_type_id . "' ,`model_id` = '" . (int)$model_id . "', `manufacturer_id` = '" . (int)$manufacturer_id . "', `photo` = '" . $photo . "' , `article` = '" . (int)$article . "' WHERE item_id = '" . $item_id ."' ");
				}
			}
		}

	}
	public function putItemsQuantity($data){
		foreach($data as $key=>$value){
			$item_id = $value->id;
			$stocks = $value->stocks;
			foreach($stocks as $key2=>$stock){
				$storage_id = $stock->id;
				$quantity = $stock->quantity_unpacked;
				if($quantity == ' '){
					$quantity = '+';
				}
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "items_auto_quantity iqa  WHERE iqa.item_id = '" . $item_id ."' AND iqa.storage_id = '" . $storage_id ."'");
				if (!$query->num_rows) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "items_auto_quantity SET `item_id` = '" . (int)$item_id . "',  `storage_id` = '" . (int)$storage_id . "', `quantity` = '" . $quantity . "'");
				}
				else{
					$this->db->query("UPDATE " . DB_PREFIX . "items_auto_quantity SET `quantity` = '" . $quantity . "' WHERE item_id = '" . $item_id ."' AND storage_id = '" . $storage_id ."'");
				}
			}
		}
	}
	public function getItems($catalog_id, $section_id, $item_id){
		$query = $this->db->query("SELECT *, ca.name as category_name, cssa.name as part_type FROM " . DB_PREFIX . "category_items_auto caa LEFT JOIN " . DB_PREFIX . "category_auto ca ON (caa.cat_id = ca.category_id) LEFT JOIN " . DB_PREFIX . "category_section_section_auto cssa ON (caa.part_type_id = cssa.section_id) WHERE caa.cat_id = '" . $catalog_id ."' AND caa.manufacturer_id = '" . $section_id ."' AND caa.model_id = '" . $item_id ."' ORDER BY caa.part_type_id");
		if ($query->num_rows) {
			foreach ($query->rows as $result) {
				$product_data[$result['part_type_id']][] = $result;
			}
			return $product_data;
		} else {
			return 0;
		}
	}
}