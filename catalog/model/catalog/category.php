<?php
class ModelCatalogCategory extends Model {
	public function getCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT *, ua.keyword as alias  FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "url_alias ua ON (ua.query LIKE 'category_id=".$category_id."') LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");
		return $query->row;
	}
	public function getCategoryByName($keyword) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "url_alias WHERE keyword LIKE '".$keyword."'");
		if ($query->num_rows) {
			$category_id_str = $query->row['query'];
			$pos = strpos($category_id_str, '=');
			$category_id = substr($category_id_str, $pos + 1);
			return $category_id;
		} else {
			return 0;
		}

	}
	public function getCategories($parent_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");
		return $query->rows;
	}
	public function getCategoriesAuto($cat_id = array()) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_auto ORDER BY name");
		return $query->rows;
	}
	public function getCategoryAutoById($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_auto WHERE category_id=".$category_id);
		return $query->row;
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

		$category_id = $this->getCategoryByName('avtozapchasti');

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


            $cat_data = array(
				'name' => $category_name,
				'href' => $this->url->link('product/category', 'path=' . $category_id ).'&apisearch=catalog&catalog_id='.$catalog_id
			);
			$parent_name = array();
			$parent_name[] = $cat_data;
			return array(
				'parent_name' => $parent_name,
				'parent_id'   => $catalog_id,
				'sections'    => $section_data
			);
		} else {
			return 0;
		}

	}
	public function getSectionAutoById($section_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "category_section_auto csa WHERE csa.category_id = ".(int)$section_id;
		$query = $this->db->query($sql);
		if ($query->num_rows) {
			return $query->row;
		} else {
			return 0;
		}

	}
	public function getSubSectionsList($catalog_id, $section_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "category_auto ca WHERE ca.category_id = ".(int)$catalog_id;
		$query = $this->db->query($sql);
		$catalog_name = $query->row['name'];

		$category_id = $this->getCategoryByName('avtozapchasti');

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
			$cat_data = array(
				'name' => $catalog_name,
				'href' => $this->url->link('product/category', 'path=' . $category_id ).'&apisearch=catalog&catalog_id='.$catalog_id
			);
			$sec_data = array(
				'name' => $section_name,
				'href' => $this->url->link('product/category', 'path=' . $category_id ).'&apisearch=catalog&catalog_id='.$catalog_id.'&section_id='.$section_id
			);
			$parent_name = array();
			$parent_name[] = $cat_data;
			$parent_name[] = $sec_data;
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
					$photo = str_replace('#', '%23', $photo);
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
			$price = $value->price;
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
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_items_auto cia  WHERE cia.item_id = '" . $item_id ."'");
			if ($query->num_rows) {
				$this->db->query("UPDATE " . DB_PREFIX . "category_items_auto SET `price` = '" . $price . "' WHERE item_id = '" . $item_id ."'");
			}
		}
	}
	public function getItems($catalog_id, $section_id, $item_id){
		$product_data = $items_data = array();
		$model_name = $model_photo = '';
		$query = $this->db->query("SELECT *, ca.name as category_name, cssa.name as part_type, csubsa.name as model_name, csubsa.photo as model_photo, caa.name as item_name, caa.photo as item_photo  FROM " . DB_PREFIX . "category_items_auto caa LEFT JOIN " . DB_PREFIX . "category_auto ca ON (caa.cat_id = ca.category_id) LEFT JOIN " . DB_PREFIX . "category_section_section_auto cssa ON (caa.part_type_id = cssa.section_id) LEFT JOIN " . DB_PREFIX . "category_subsection_auto csubsa ON (csubsa.category_id = caa.model_id) WHERE caa.cat_id = '" . $catalog_id ."' AND caa.manufacturer_id = '" . $section_id ."' AND caa.model_id = '" . $item_id ."' ORDER BY caa.part_type_id");
		if ($query->num_rows) {
			foreach ($query->rows as $result) {
				$model_name = $result['model_name'];
				$model_photo = $result['model_photo'];
				$part_type = $result['part_type'];
				$tax_class_id = $result['tax_class_id'];
				if($part_type == ''){
					$part_type = 'Вид запасной части не указан';
				}
				$query2 = $this->db->query("SELECT *, sa.name as storage_name FROM " . DB_PREFIX . "items_auto_quantity iaq LEFT JOIN " . DB_PREFIX . "category_items_auto cia ON (iaq.item_id = cia.item_id) LEFT JOIN " . DB_PREFIX . "storages_auto sa ON (iaq.storage_id = sa.storage_id) WHERE iaq.item_id = '" . $result["item_id"] ."'");
				if ($query2->num_rows) {
					$storage_quantity = array();
					foreach ($query2->rows as $result2){
						$storage_quantity[] = array(
							"storage_id" => $result2["storage_id"],
							"storage_name" => $result2["storage_name"],
							"legend" => $result2["legend"],
							"address" => $result2["address"],
							"storage_name_en" => $result2["name_en"],
							"quantity" => $result2["quantity"]
						);
					}
				}
				else{
					$storage_quantity = null;
				}
				//echo '<pre>'; print_r($result); echo '</pre>';
				if(sizeof($storage_quantity) > 0 && $result["price"]){
					$items_data[$part_type][] = array(
						"item_id" => $result["item_id"],
						"name"    => $result["item_name"],
						"category_id"  => $result["category_id"],
						"section_id"  => $result["section_id"],
						"part_type_id" => $result["part_type_id"],
						"model_id" => $result["model_id"],
						"manufacturer_id" => $result["manufacturer_id"],
						"photo" => $result["item_photo"],
						"price" => $result["price"],
						"part_type_name" => $result["part_type"],
						"storage_quantity" => $storage_quantity,
						"tax_class_id" => $result["tax_class_id"]

					);
				}

			}
			$product_data = array(
				"model_name" => $model_name,
				"model_photo" => $model_photo,
				"tax_class_id" => $tax_class_id,
				"items" => $items_data
			);
 			return $product_data;
		} else {
			return 0;
		}
	}
	public function getStorages(){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "storages_auto");
		if ($query->num_rows) {
			return $query->rows;
		}
		else{
			return 0;
		}
	}
}