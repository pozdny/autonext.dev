/*
Navicat MySQL Data Transfer

Source Server         : denwer
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : autonext

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-10-05 20:20:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `oc_address`
-- ----------------------------
DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_address
-- ----------------------------
INSERT INTO `oc_address` VALUES ('1', '1', 'енрено', 'генген', '', '7ьарао', 'лорл', 'лроло', 'лорл', '176', '68', '');
INSERT INTO `oc_address` VALUES ('2', '2', '23454', '534534', 'retre', 'erterter', 'terter', 'terterte', 'tertet', '20', '3', '');

-- ----------------------------
-- Table structure for `oc_affiliate`
-- ----------------------------
DROP TABLE IF EXISTS `oc_affiliate`;
CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_affiliate
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_affiliate_activity`
-- ----------------------------
DROP TABLE IF EXISTS `oc_affiliate_activity`;
CREATE TABLE `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_affiliate_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_affiliate_login`
-- ----------------------------
DROP TABLE IF EXISTS `oc_affiliate_login`;
CREATE TABLE `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_affiliate_login
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_affiliate_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `oc_affiliate_transaction`;
CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_affiliate_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_api`
-- ----------------------------
DROP TABLE IF EXISTS `oc_api`;
CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_api
-- ----------------------------
INSERT INTO `oc_api` VALUES ('1', 'CAclpejaMYbUu55S3yXxsRmx0DBvVUZoz0H7XxBnk6bJicOd1FsFmCv6aCsgVSYw', '', '', '9hJLd91sVWy0t13hNNbP3pR7W3wJsIuvhHjR5DDqeojZSI7c7OhRiKL1qnNoc1encjVQv9ng9zr1OSXQDHAMkhbnYOBCkclXu3fH9xlO21MLhUK6h3198wFRcsNSE5F9ZGCzje5yIxFXNOVfYhEov4Gy4Ewa6Q7dcL7bhDnQwkUbRA35mCpL44fMtTtaMdL02IO42eslwP7YrpzONbolbwQd5aCTyjxFp73QkxKyKx7MfMHZMr93UgZmfZtEyhxM', '1', '2015-06-24 10:50:42', '2015-06-24 10:50:42');

-- ----------------------------
-- Table structure for `oc_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute
-- ----------------------------
INSERT INTO `oc_attribute` VALUES ('1', '6', '1');
INSERT INTO `oc_attribute` VALUES ('2', '6', '5');
INSERT INTO `oc_attribute` VALUES ('3', '6', '3');
INSERT INTO `oc_attribute` VALUES ('4', '3', '1');
INSERT INTO `oc_attribute` VALUES ('5', '3', '2');
INSERT INTO `oc_attribute` VALUES ('6', '3', '3');
INSERT INTO `oc_attribute` VALUES ('7', '3', '4');
INSERT INTO `oc_attribute` VALUES ('8', '3', '5');
INSERT INTO `oc_attribute` VALUES ('9', '3', '6');
INSERT INTO `oc_attribute` VALUES ('10', '3', '7');
INSERT INTO `oc_attribute` VALUES ('11', '3', '8');

-- ----------------------------
-- Table structure for `oc_attribute_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute_description
-- ----------------------------
INSERT INTO `oc_attribute_description` VALUES ('1', '1', 'Description');
INSERT INTO `oc_attribute_description` VALUES ('2', '1', 'No. of Cores');
INSERT INTO `oc_attribute_description` VALUES ('4', '1', 'test 1');
INSERT INTO `oc_attribute_description` VALUES ('5', '1', 'test 2');
INSERT INTO `oc_attribute_description` VALUES ('6', '1', 'test 3');
INSERT INTO `oc_attribute_description` VALUES ('7', '1', 'test 4');
INSERT INTO `oc_attribute_description` VALUES ('8', '1', 'test 5');
INSERT INTO `oc_attribute_description` VALUES ('9', '1', 'test 6');
INSERT INTO `oc_attribute_description` VALUES ('10', '1', 'test 7');
INSERT INTO `oc_attribute_description` VALUES ('11', '1', 'test 8');
INSERT INTO `oc_attribute_description` VALUES ('3', '1', 'Clockspeed');

-- ----------------------------
-- Table structure for `oc_attribute_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute_group
-- ----------------------------
INSERT INTO `oc_attribute_group` VALUES ('3', '2');
INSERT INTO `oc_attribute_group` VALUES ('4', '1');
INSERT INTO `oc_attribute_group` VALUES ('5', '3');
INSERT INTO `oc_attribute_group` VALUES ('6', '4');

-- ----------------------------
-- Table structure for `oc_attribute_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute_group_description
-- ----------------------------
INSERT INTO `oc_attribute_group_description` VALUES ('3', '1', 'Memory');
INSERT INTO `oc_attribute_group_description` VALUES ('4', '1', 'Technical');
INSERT INTO `oc_attribute_group_description` VALUES ('5', '1', 'Motherboard');
INSERT INTO `oc_attribute_group_description` VALUES ('6', '1', 'Processor');

-- ----------------------------
-- Table structure for `oc_banner`
-- ----------------------------
DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_banner
-- ----------------------------
INSERT INTO `oc_banner` VALUES ('6', 'HP Products', '1');
INSERT INTO `oc_banner` VALUES ('7', 'Home Page Slideshow', '1');
INSERT INTO `oc_banner` VALUES ('8', 'Manufacturers', '1');

-- ----------------------------
-- Table structure for `oc_banner_image`
-- ----------------------------
DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_banner_image
-- ----------------------------
INSERT INTO `oc_banner_image` VALUES ('113', '7', '/avtozapchasti', 'catalog/banner_na_glavnoi/avtozapchasti.jpg', '0');
INSERT INTO `oc_banner_image` VALUES ('87', '6', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', '0');
INSERT INTO `oc_banner_image` VALUES ('94', '8', '', 'catalog/demo/manufacturer/nfl.png', '0');
INSERT INTO `oc_banner_image` VALUES ('95', '8', '', 'catalog/demo/manufacturer/redbull.png', '0');
INSERT INTO `oc_banner_image` VALUES ('96', '8', '', 'catalog/demo/manufacturer/sony.png', '0');
INSERT INTO `oc_banner_image` VALUES ('91', '8', '', 'catalog/demo/manufacturer/cocacola.png', '0');
INSERT INTO `oc_banner_image` VALUES ('92', '8', '', 'catalog/demo/manufacturer/burgerking.png', '0');
INSERT INTO `oc_banner_image` VALUES ('93', '8', '', 'catalog/demo/manufacturer/canon.png', '0');
INSERT INTO `oc_banner_image` VALUES ('88', '8', '', 'catalog/demo/manufacturer/harley.png', '0');
INSERT INTO `oc_banner_image` VALUES ('89', '8', '', 'catalog/demo/manufacturer/dell.png', '0');
INSERT INTO `oc_banner_image` VALUES ('90', '8', '', 'catalog/demo/manufacturer/disney.png', '0');
INSERT INTO `oc_banner_image` VALUES ('114', '7', '/smazochnye-materialy', 'catalog/banner_na_glavnoi/masla.jpg', '0');
INSERT INTO `oc_banner_image` VALUES ('97', '8', '', 'catalog/demo/manufacturer/starbucks.png', '0');
INSERT INTO `oc_banner_image` VALUES ('98', '8', '', 'catalog/demo/manufacturer/nintendo.png', '0');
INSERT INTO `oc_banner_image` VALUES ('112', '7', '/oborudovanie', 'catalog/banner_na_glavnoi/oborudovanie.jpg', '0');
INSERT INTO `oc_banner_image` VALUES ('111', '7', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/banner_na_glavnoi/diagnostika.jpg', '0');

-- ----------------------------
-- Table structure for `oc_banner_image_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_banner_image_description`;
CREATE TABLE `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_banner_image_description
-- ----------------------------
INSERT INTO `oc_banner_image_description` VALUES ('114', '1', '7', 'Линейка масел Fanfaro');
INSERT INTO `oc_banner_image_description` VALUES ('87', '1', '6', 'HP Banner');
INSERT INTO `oc_banner_image_description` VALUES ('93', '1', '8', 'Canon');
INSERT INTO `oc_banner_image_description` VALUES ('92', '1', '8', 'Burger King');
INSERT INTO `oc_banner_image_description` VALUES ('91', '1', '8', 'Coca Cola');
INSERT INTO `oc_banner_image_description` VALUES ('90', '1', '8', 'Disney');
INSERT INTO `oc_banner_image_description` VALUES ('89', '1', '8', 'Dell');
INSERT INTO `oc_banner_image_description` VALUES ('113', '1', '7', 'Доставка любых автозапчастей');
INSERT INTO `oc_banner_image_description` VALUES ('88', '1', '8', 'Harley Davidson');
INSERT INTO `oc_banner_image_description` VALUES ('94', '1', '8', 'NFL');
INSERT INTO `oc_banner_image_description` VALUES ('95', '1', '8', 'RedBull');
INSERT INTO `oc_banner_image_description` VALUES ('96', '1', '8', 'Sony');
INSERT INTO `oc_banner_image_description` VALUES ('97', '1', '8', 'Starbucks');
INSERT INTO `oc_banner_image_description` VALUES ('98', '1', '8', 'Nintendo');
INSERT INTO `oc_banner_image_description` VALUES ('112', '1', '7', 'Оборудование для Вашей станции');
INSERT INTO `oc_banner_image_description` VALUES ('111', '1', '7', 'Скидки до 50% на диагностику двигателя');

-- ----------------------------
-- Table structure for `oc_category`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category
-- ----------------------------
INSERT INTO `oc_category` VALUES ('63', '', '71', '1', '1', '0', '1', '2015-06-25 12:06:42', '2015-07-16 23:06:21');
INSERT INTO `oc_category` VALUES ('64', '', '71', '1', '1', '0', '1', '2015-06-25 12:08:17', '2015-07-16 23:05:08');
INSERT INTO `oc_category` VALUES ('65', '', '71', '1', '1', '0', '1', '2015-06-25 12:09:49', '2015-07-16 23:04:48');
INSERT INTO `oc_category` VALUES ('66', '', '71', '1', '1', '0', '1', '2015-06-25 12:10:33', '2015-07-16 23:04:09');
INSERT INTO `oc_category` VALUES ('67', '', '71', '0', '1', '0', '1', '2015-06-25 12:11:04', '2015-07-16 23:03:48');
INSERT INTO `oc_category` VALUES ('68', '', '71', '1', '1', '0', '1', '2015-06-25 12:11:27', '2015-07-16 23:06:44');
INSERT INTO `oc_category` VALUES ('69', '', '73', '0', '1', '0', '1', '2015-07-16 09:59:55', '2015-07-16 23:08:18');
INSERT INTO `oc_category` VALUES ('70', '', '73', '0', '1', '0', '1', '2015-07-16 13:01:36', '2015-07-16 18:54:39');
INSERT INTO `oc_category` VALUES ('71', '', '0', '1', '1', '1', '1', '2015-07-16 16:14:11', '2015-07-16 21:01:33');
INSERT INTO `oc_category` VALUES ('60', '', '71', '1', '2', '0', '1', '2015-06-24 14:28:59', '2015-07-16 23:04:29');
INSERT INTO `oc_category` VALUES ('72', '', '0', '1', '1', '2', '1', '2015-07-16 18:45:48', '2015-08-12 15:32:09');
INSERT INTO `oc_category` VALUES ('73', '', '0', '1', '1', '3', '1', '2015-07-16 18:46:19', '2015-07-16 21:21:35');
INSERT INTO `oc_category` VALUES ('74', '', '0', '1', '1', '4', '1', '2015-07-16 18:47:00', '2015-08-17 10:00:31');
INSERT INTO `oc_category` VALUES ('75', '', '72', '0', '1', '0', '1', '2015-08-12 15:32:57', '2015-08-14 12:27:51');
INSERT INTO `oc_category` VALUES ('76', '', '75', '0', '1', '0', '1', '2015-08-13 11:15:02', '2015-08-13 11:15:02');
INSERT INTO `oc_category` VALUES ('77', '', '75', '0', '1', '0', '1', '2015-08-13 11:44:14', '2015-08-13 11:44:14');
INSERT INTO `oc_category` VALUES ('78', '', '72', '0', '1', '0', '1', '2015-08-13 16:17:06', '2015-08-13 16:17:06');

-- ----------------------------
-- Table structure for `oc_category_auto`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_auto`;
CREATE TABLE `oc_category_auto` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_auto
-- ----------------------------
INSERT INTO `oc_category_auto` VALUES ('36', 'Автостекла. Оригинальные стёкла (лобовые, боковые, задние, форточки)', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('23', 'КРАШ (кузовные детали, оптика, радиаторы)', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('70', 'Элементы подвески (шаровые опоры, линки, втулки, опоры стоек, подвесные подшипники, рычаги и тяги)', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('63', 'Радиаторы ДВС, радиаторы кондиционера, диффузоры, крыльчатки', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('96102', 'Моторчики отопителя в сборе с крыльчаткой', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('73', 'Радиаторы отопителя салона', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('68', 'Детали двигателя (шкивы, гофры, натяжители приводного ремня, подушки двигателя ,вискомуфты)', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('98102', 'Колодки тормозные', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('59', 'Элементы трансмиссии (ШРУСа, валы карданные, крестовины, полуоси и приводные валы)', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('71', 'Провода высоковольтные и катушки зажигания', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('76', 'Крыльчатки и Вискомуфты', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('105102', 'Насосы водяного охлаждения', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('72', 'Оригинальные запчасти NISSAN', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('80', 'Оригинальные запчасти TOYOTA', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('32', 'Комплекты для замены цепей газораспределительного механизма', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('62', 'Амортизаторы крышки багажника и капота', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('19', 'Головки блока цилиндров', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('26', 'Каталог необходимых деталей для замены газораспределительного механизма', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('5', 'Молдинги для лобовых стёкол', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('28', 'Молдинги для лобовых и задних автостёкол, универсальные', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('37', 'Инструмент и расходные материалы для замены автостёкол', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('38', 'Подшипники, ролики', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('95102', 'Каталог ступичных подшипников', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('67', 'Сальники,прокладки, маслосъёмные колпачки, ремкомплекты ГУР и рулевых реек, Япония', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('21', 'Ремни ГРМ, ручейковые и клиновидные от Японской компании Mitsuboshi.', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('91102', 'Диски тормозные', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('90102', 'Тросики ручного тормоза', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('89102', 'Приводные валы в сборе', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('88102', 'Шланги тормозные', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('55', 'Стойки и амортизаторы', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('77', 'Рейки рулевые', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('25', 'Пробки для радиаторов ДВС', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('84102', 'Гайки, шпильки колёсные, эксцентрики', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('6', 'Грузовой и коммерческий транспорт', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('61', 'Зеркала для грузовых автомобилей и микроавтобусов', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('86102', 'Тюнинг (оптика, подножки, обвесы, рейлинги, ветровики)', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('93102', 'Плунжерные пары и распылители DENSO, ZEXEL', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('50', 'Шкворневые комплекты,пальцы рессор для Японских грузовиков', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('85102', 'Бензонасосы универсальные', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('100102', 'Щётки стеклоочистителя', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('99102', 'Фильтры', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('103102', 'Насосы ГУР', '72', 'zapasnye_chasti');
INSERT INTO `oc_category_auto` VALUES ('104102', 'Суппорта тормозные', '72', 'zapasnye_chasti');

-- ----------------------------
-- Table structure for `oc_category_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_description
-- ----------------------------
INSERT INTO `oc_category_description` VALUES ('60', '1', 'Масло индустриальное', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Масло индустриальное', '', '');
INSERT INTO `oc_category_description` VALUES ('63', '1', 'Масло моторное для 2-х и 4-х тактных ДВС', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Масло моторное для 2-х и 4-х тактных ДВС', '', '');
INSERT INTO `oc_category_description` VALUES ('64', '1', 'Масло моторное для дизельных ДВС', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Масло моторное для дизельных ДВС', '', '');
INSERT INTO `oc_category_description` VALUES ('65', '1', 'Масло моторное для бензиновых ДВС', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Масло моторное для бензиновых ДВС', '', '');
INSERT INTO `oc_category_description` VALUES ('66', '1', 'Жидкость трансмиссионная', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Жидкость трансмиссионная', '', '');
INSERT INTO `oc_category_description` VALUES ('67', '1', 'Жидкость охлаждающая', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Жидкость охлаждающая', '', '');
INSERT INTO `oc_category_description` VALUES ('68', '1', 'Прочее', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Прочее', '', '');
INSERT INTO `oc_category_description` VALUES ('69', '1', 'об1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Канистры', '', '');
INSERT INTO `oc_category_description` VALUES ('70', '1', 'об2', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'об2', '', '');
INSERT INTO `oc_category_description` VALUES ('71', '1', 'Смазочные материалы ', '&lt;p&gt;Вы внимательно прочтете мой профиль, то без труда узнаете мое настоящее \r\nимя и даже фамилию с отчеством. А подробности меня интересуют не из \r\nпраздного любопытства. Обычно они нужны для работы. Потому что холодное \r\nостекление - это алюминиевый профиль, а теплое - ПВХ. Все компании имеют\r\n различные материалы и фронт работ, поэтому глупо писать под копирку, \r\nосновываясь на материалах конкурентов. Но, дело ваше. Не смею \r\nзадерживать.&lt;/p&gt;', 'ывафы', '', '');
INSERT INTO `oc_category_description` VALUES ('73', '1', 'Оборудование', '&lt;p&gt;&lt;strong&gt;У нас Вы найдете:&lt;/strong&gt;&lt;br&gt;&lt;br&gt;&lt;strong&gt;1&lt;/strong&gt; – Слесарный\r\n инструмент (молотки слесарные, молотки гвоздодеры, молотки рихтовочные,\r\n кувалды, киянки, ключи шестигранники, биты отверточные, отвертки, \r\nнаборы инструмента, головки, ключи свечные, ключи торцевые, удлинители, \r\nшарниры для сменных головок, воротки, ключи динамометрические, ключи \r\nбалонные, ключи рожковые, ключи накидные, ключи комбинированные, \r\nразводные, газовые, трубные, напильники, рашпили, надфили, циклевки, \r\nпатроны сверлильные, шарнирно-губцевый инструмент, пассатижи, кусачки, \r\nбокорезы, клещи, зубила, керны);&lt;br&gt;&lt;br&gt;&lt;strong&gt;2&lt;/strong&gt; – Столярный \r\nинструмент (струбцины, рубанки, скобели, топоры, колуны, топорища, \r\nстусла, пилы, ножовки, лобзики, долота, гвоздодеры, верстаки);&lt;br&gt;&lt;br&gt;&lt;strong&gt;3&lt;/strong&gt; – Измерительный инструмент (линейки, рулетки, микрометры, штангенциркули, угольники, угломеры, уровни, дальномеры);&lt;br&gt;&lt;br&gt;&lt;strong&gt;4&lt;/strong&gt;\r\n – Крепежные инструменты (заклепочники, заклепки, степлеры, скобы, \r\nсаморезы, тросы, кронштейны, дюбели, хомуты, перфорированный крепеж, \r\nшурупы);&lt;br&gt;&lt;br&gt;&lt;strong&gt;5&lt;/strong&gt; – Автомобильный инструмент (домкраты,\r\n растяжки гидравлические, тали, лебедки, прессы, съемники, масленки, \r\nворонки, хомуты, зимние аксессуары, ареометры, автомобильные аксессуары,\r\n специальные приспособления, пневмоинструмент, моечные машины);&lt;br&gt;&lt;br&gt;&lt;strong&gt;6&lt;/strong&gt;\r\n – Садовый инвентарь (пилы, секаторы, садовые ножницы, лопаты, грабли, \r\nкультиваторы, совки, мотыжки, наборы садового инструмента, метла, косы, \r\nвилы, серпы, парники, теплицы, опрыскиватели, распылители, адаптеры для \r\nшлангов, тройники, муфты, разветвители, шланги, катушки, лейки, \r\nрукомойники, ведра, перчатки, рукавицы, черенки, тачки, колеса, камеры, \r\nсадовые ограждения, товары для отдыха, декоративные аксессуары, мебель \r\nдля пикника, садовые тенты, палатки, посуда, термосумки, коврики для \r\nпикника, мангалы, решетки-гриль, шампуры, товары для зимнего отдыха, \r\nпленки, укрывные материалы, газонокосилки, триммеры, дозатор);&lt;br&gt;&lt;br&gt;&lt;strong&gt;7&lt;/strong&gt;\r\n – Режущий инструмент (сверла по дереву, по бетону, по металлу, насадки \r\nна перфоратор, коронки по металлу, сверла алмазы, сверла по керамической\r\n плитке и стеклу, диски, круги, фрезы, ленты, щетки для дрелей и УШМ, \r\nабразивные сетки, шкурка шлифовальная, губки для шлифования, \r\nполировальные диски, метчики, плашки, резьбонарезные наборы, ножовки по \r\nметаллу, полотна по металлу, ножницы по металлу, болторезы, труборезы, \r\nножи, лезвия для ножей);&lt;br&gt;&lt;br&gt;&lt;strong&gt;8&lt;/strong&gt; – \r\nСтроительно-отделочный инструмент (валики, бюгели, кюветы, ведра для \r\nкраски, кисти, щетки, сопутствующий малярный и строительный инструмент, \r\nшпатели, мастерки, лопатки, терки, гладилки, стеклорезы, стеклодомкраты,\r\n плиткорезы, обдирочный инструмент, крестики и клинья для кладки плитки,\r\n приспособления для укладки напольных покрытий, шприцы для выдавливания \r\nгерметиков, ленты малярные, скотчи, изоленты, уплотнители, «ФУМ» ленты, \r\nсредства для защиты труда, респираторы);&lt;br&gt;&lt;br&gt;&lt;strong&gt;9&lt;/strong&gt; – \r\nПрочее (перчатки универсальные, фонари, энергосберегающие лампы, \r\nгирлянды, ящики, шкафы, органайзеры, лотки, губки, салфетки, \r\nпакеты/мешки для мусора, ведра, тазы, вешалки для одежды, щетки, совки, \r\nшвабры, водосгоны, мышеловки, паяльники, замки, лупы, петли, инструмент \r\nдля сантехники, клеевые пистолеты, клеевые стержни, прожекторы, \r\nудлинители, керосиновые лампы, удлинители электрические, веревки, шнуры,\r\n сварочные аппараты, генераторы дизельные/бензиновые, электроинструмент,\r\n цепные пилы, станки сверлильные, бетоносмесители, тепловые пушки, \r\nлестницы, стремянки, водяные насосы, растворосмесители ОАО «Строймаш»).&lt;br&gt;&lt;br&gt;Более подробно со списком товаров, ценами и брендами Вы можете ознакомиться скачав прайс-лист.&lt;/p&gt;', 'Оборудование для станций', '', '');
INSERT INTO `oc_category_description` VALUES ('72', '1', 'Автозапчасти', '&lt;p&gt;Закажите запчасти у нас, даже если необходимого товара не окажется в \r\nналичии мы быстро и недорого доставим его со складов наших поставщиков. \r\nТак же привезем под заказ любые запчасти которых нет в городе. Мы \r\nзанимаемся новыми и контрактными запасными частями (детали ходовой, \r\nдетали двигателя, кузовное, оптика, топливная система, система \r\nзажигания, конрактные ДВС и АКПП). Мы предоставляем гарантию на весь \r\nтовар, приобретенный у нас. Если у Вас нет времени для визита к нам, \r\nблагодаря удобным формам оплаты: безналичный (перевод на расчетный \r\nсчет), перевод на карту сбербанка, Вы можете заказать детали по \r\nтелефону. Также возможен наличный расчет, для этого необходимо подъехать\r\n к нам в офис.&lt;/p&gt;', 'Автозапчасти', '', '');
INSERT INTO `oc_category_description` VALUES ('74', '1', 'Компрессора', '&lt;br&gt;&lt;p&gt;&lt;img src=&quot;http://autonext.dev/image/catalog/03.jpg&quot;&gt;&lt;img src=&quot;http://autonext.dev/image/catalog/vint_3.jpg&quot;&gt;&lt;img src=&quot;http://autonext.dev/image/catalog/vint_5.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Компрессоры можно разделить на два основных типа – это &lt;strong&gt;винтовые компрессоры&lt;/strong&gt;&amp;nbsp;и&amp;nbsp;&lt;strong&gt;поршневые компрессоры&lt;/strong&gt;.&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Поршневой компрессор&lt;/strong&gt;, который также ещё называют объемным&amp;nbsp;&lt;strong&gt;компрессором&lt;/strong&gt;,\r\n всасывает определённый объем воздуха и при помощи поршня, соединенного с\r\n коленчатым валом, сжимает исходный объем воздуха до меньшего объема.&amp;nbsp;&lt;strong&gt;Поршневые компрессоры&amp;nbsp;&lt;/strong&gt;бывают различных видов: масляные и безмасляные, с различным числом и объёмом цилиндров, с ременной или прямой передачей.&amp;nbsp;&lt;br&gt;Основным преимуществом&amp;nbsp;&lt;strong&gt;поршневых компрессоров&amp;nbsp;&lt;/strong&gt;является их простота и низкая стоимость по сравнению с&amp;nbsp;&lt;strong&gt;винтовыми компрессорами,&amp;nbsp;&lt;/strong&gt;а также и требуют меньших затрат на обслуживание.&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Поршневые компрессоры&amp;nbsp;&lt;/strong&gt;являются\r\n самыми распространенными в России странах СНГ, среди установленных \r\nкомпрессоров с производительностью до 100 м3/мин. Данная технология \r\nиспользуется для сжатия воздуха на протяжении уже двух столетий, в силу \r\nотносительной простоты её технической реализации.&amp;nbsp;&lt;br&gt;&lt;strong&gt;Поршневые компрессоры&amp;nbsp;&lt;/strong&gt;по своим характеристикам и ценовым параметрам предпочтительнее&amp;nbsp;&lt;strong&gt;компрессоров&amp;nbsp;&lt;/strong&gt;других типов в следующих случаях:&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Большие перепады в потреблении сжатого воздуха.&amp;nbsp;&lt;strong&gt;Промышленные поршневые компрессоры&amp;nbsp;&lt;/strong&gt;одинаково хорошо работают в повторно-кратковременном режиме, когда они намного экономичнее, чем&amp;nbsp;&lt;strong&gt;винтовые компрессоры&amp;nbsp;&lt;/strong&gt;.&lt;/li&gt;&lt;li&gt;Неблагоприятные условия эксплуатации&amp;nbsp;&lt;strong&gt;компрессора&amp;nbsp;&lt;/strong&gt;. При неблагоприятных условиях эксплуатации&amp;nbsp;&lt;strong&gt;компрессора&amp;nbsp;&lt;/strong&gt;,\r\n например, при использовании в установках расфасовки цемента, на \r\nугольных складах или мельницах для помола зерна, либо при больших \r\nколебаниях температуры,&amp;nbsp;&lt;strong&gt;поршневые компрессоры&amp;nbsp;&lt;/strong&gt;обеспечивают более длительный срок службы.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Компания МегаПром может вам предложить&amp;nbsp;&lt;strong&gt;поршневые компрессоры&amp;nbsp;&lt;/strong&gt;следующих видов:&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Компрессоры с прямым и ременным приводом&lt;/li&gt;&lt;li&gt;Компрессоры передвижные для строительных работ&lt;/li&gt;&lt;li&gt;Компрессоры высокого давления и дожимные компрессоры (БУСТЕРЫ)&lt;/li&gt;&lt;li&gt;Компрессоры низкого давления (воздуходувки)&lt;/li&gt;&lt;li&gt;Компрессоры безмасляные медицинские&lt;/li&gt;&lt;/ul&gt;&lt;hr&gt;&lt;p&gt;&lt;strong&gt;Винтовые компрессоры&lt;/strong&gt;,\r\n были разработаны в 30 годы 20 века, когда экономика Европы развивалась \r\nбыстрыми темпами. Особенность данного вида объемных компрессоров \r\nзаключается в том, что рабочий орган винтового компрессора выполняется в\r\n виде червячных роторов, находящихся в зацеплении. Это значительно \r\nповлияло на повышение стабильной работы компрессора в различных условиях\r\n и температурных режимах.&amp;nbsp;&lt;br&gt;В отличие от поршневого, данный вид&amp;nbsp;&lt;strong&gt;компрессоров&amp;nbsp;&lt;/strong&gt;не имеет клапанов, что приводит к устранению механических нагрузок, которые вызывают разбалансировку&amp;nbsp;&lt;strong&gt;винтового компрессора&lt;/strong&gt;.\r\n При этом скорость вращения винтового блока компрессора значительно \r\nувеличивается. Эта особенность конструкции компрессора позволяет \r\nполучить достаточно высокую величины потока, что соответственно приводит\r\n к увеличению производительности работы&amp;nbsp;&lt;strong&gt;ротационного компрессора&lt;/strong&gt;,\r\n не изменяя габаритных размеров. Показатель соотношения мощности потока к\r\n габаритам компрессора равен 0,75 что для того времени был достаточно \r\nвысоким. Разность давления между входом компрессора и на выходе из&amp;nbsp;&lt;strong&gt;компрессора&lt;/strong&gt;,\r\n так называемое осевое усилие, принимается подшипниками, установленными в\r\n винтовом блоке компрессора. Изначально винт компрессора был \r\nсимметричным, но на сегодняшний день, он имеет различные сечения.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Винтовой компрессор&amp;nbsp;&lt;/strong&gt;обладает целым рядом преимуществ по сравнению с поршневыми или центробежными компрессорами.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;высокая надежность;&lt;/li&gt;&lt;li&gt;длительный ресурс работы;&lt;/li&gt;&lt;li&gt;возможность непрерывного круглосуточного функционирования;&lt;/li&gt;&lt;li&gt;простота монтажа и подключения;&lt;/li&gt;&lt;li&gt;сравнительно небольшие эксплуатационные затраты;&lt;/li&gt;&lt;li&gt;наличие системы автоматического управления;&lt;/li&gt;&lt;li&gt;более низкий уровень шума;&lt;/li&gt;&lt;li&gt;высокая чистота получаемого сжатого воздуха;&lt;/li&gt;&lt;li&gt;низкий уровень энергозатрат на куб. метр произведенного воздуха.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Мы предлагаем Вашему вниманию&amp;nbsp;&lt;strong&gt;Винтовые компрессоры&lt;/strong&gt;&amp;nbsp;знаменитых\r\n производителей Германии, Италии, Беларуси и России. Отличное качество \r\nизготовления и конструктивные особенности позволяют проводить плановую \r\nпроверку винтовых компрессоров всего несколько раз в год. Использование \r\nвинтовой пары позволяет значительно снизить расход электроэнергии при \r\nодновременном повышении производительности. Учитывая темпы роста \r\nстоимости энергоносителей, винтовые компрессоры окупаются в первый год \r\nсвоей работы. Кроме того, некоторые винтовые компрессоры обладают \r\nвозможностью регулировать частоту вращения, что позволяет исключить \r\nработу в холостом режиме.&amp;nbsp;&lt;strong&gt;Винтовые компрессоры&amp;nbsp;&lt;/strong&gt;прекрасно\r\n подходит для оптимизации экономичного производственного процесса, как в\r\n условиях промышленного производства, так и для небольших предприятий.&lt;/p&gt;&lt;p&gt;Всегда в наличии на нашем складе винтовые компрессоры следующих производителей:&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Компрессоры DALGAKIRAN (Турция)&lt;/li&gt;&lt;li&gt;Компрессоры REMEZA (Беларусь)&lt;/li&gt;&lt;li&gt;Компрессоры АВАС (Италия)&lt;/li&gt;&lt;li&gt;Компрессоры ALUP (Германия)&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Компрессоры', '', '');
INSERT INTO `oc_category_description` VALUES ('75', '1', 'Детали газораспределительного механизма', '&lt;p&gt;sdfsdfasdf&lt;br&gt;&lt;/p&gt;', 'Детали газораспределительного механизма', '', '');
INSERT INTO `oc_category_description` VALUES ('76', '1', '111', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '111', '', '');
INSERT INTO `oc_category_description` VALUES ('77', '1', '222', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '222', '', '');
INSERT INTO `oc_category_description` VALUES ('78', '1', 'Детали для ремонта', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'фваыв', '', '');

-- ----------------------------
-- Table structure for `oc_category_filter`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_filter`;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_filter
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_category_path`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_path`;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_path
-- ----------------------------
INSERT INTO `oc_category_path` VALUES ('72', '72', '0');
INSERT INTO `oc_category_path` VALUES ('63', '63', '1');
INSERT INTO `oc_category_path` VALUES ('70', '70', '1');
INSERT INTO `oc_category_path` VALUES ('69', '69', '1');
INSERT INTO `oc_category_path` VALUES ('68', '68', '1');
INSERT INTO `oc_category_path` VALUES ('67', '67', '1');
INSERT INTO `oc_category_path` VALUES ('66', '66', '1');
INSERT INTO `oc_category_path` VALUES ('64', '64', '1');
INSERT INTO `oc_category_path` VALUES ('65', '65', '1');
INSERT INTO `oc_category_path` VALUES ('71', '71', '0');
INSERT INTO `oc_category_path` VALUES ('60', '60', '1');
INSERT INTO `oc_category_path` VALUES ('73', '73', '0');
INSERT INTO `oc_category_path` VALUES ('74', '74', '0');
INSERT INTO `oc_category_path` VALUES ('67', '71', '0');
INSERT INTO `oc_category_path` VALUES ('66', '71', '0');
INSERT INTO `oc_category_path` VALUES ('60', '71', '0');
INSERT INTO `oc_category_path` VALUES ('63', '71', '0');
INSERT INTO `oc_category_path` VALUES ('65', '71', '0');
INSERT INTO `oc_category_path` VALUES ('64', '71', '0');
INSERT INTO `oc_category_path` VALUES ('68', '71', '0');
INSERT INTO `oc_category_path` VALUES ('69', '73', '0');
INSERT INTO `oc_category_path` VALUES ('70', '73', '0');
INSERT INTO `oc_category_path` VALUES ('75', '72', '0');
INSERT INTO `oc_category_path` VALUES ('75', '75', '1');
INSERT INTO `oc_category_path` VALUES ('76', '72', '0');
INSERT INTO `oc_category_path` VALUES ('76', '75', '1');
INSERT INTO `oc_category_path` VALUES ('76', '76', '2');
INSERT INTO `oc_category_path` VALUES ('77', '72', '0');
INSERT INTO `oc_category_path` VALUES ('77', '75', '1');
INSERT INTO `oc_category_path` VALUES ('77', '77', '2');
INSERT INTO `oc_category_path` VALUES ('78', '72', '0');
INSERT INTO `oc_category_path` VALUES ('78', '78', '1');

-- ----------------------------
-- Table structure for `oc_category_section_auto`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_section_auto`;
CREATE TABLE `oc_category_section_auto` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_section_auto
-- ----------------------------
INSERT INTO `oc_category_section_auto` VALUES ('1', 'NISSAN', 'http://autotrade.su/files/photo/marks/NISSAN.gif');
INSERT INTO `oc_category_section_auto` VALUES ('2', 'LEXUS', 'http://autotrade.su/files/photo/marks/LEXUS.gif');
INSERT INTO `oc_category_section_auto` VALUES ('3', 'TOYOTA', 'http://autotrade.su/files/photo/marks/TOYOTA.gif');
INSERT INTO `oc_category_section_auto` VALUES ('4', 'BMW', 'http://autotrade.su/files/photo/marks/BMW.gif');
INSERT INTO `oc_category_section_auto` VALUES ('5', 'VOLKSWAGEN', 'http://autotrade.su/files/photo/marks/VOLKSWAGEN.gif');
INSERT INTO `oc_category_section_auto` VALUES ('6', 'ACURA', 'http://autotrade.su/files/photo/marks/ACURA.gif');
INSERT INTO `oc_category_section_auto` VALUES ('7', 'ALFA ROMEO', 'http://autotrade.su/files/photo/marks/ALFA ROMEO.gif');
INSERT INTO `oc_category_section_auto` VALUES ('8', 'AUDI', 'http://autotrade.su/files/photo/marks/AUDI.gif');
INSERT INTO `oc_category_section_auto` VALUES ('9', 'CADILLAC', 'http://autotrade.su/files/photo/marks/CADILLAC.gif');
INSERT INTO `oc_category_section_auto` VALUES ('10', 'CHEVROLET', 'http://autotrade.su/files/photo/marks/CHEVROLET.gif');
INSERT INTO `oc_category_section_auto` VALUES ('11', 'GENERAL MOTORS', 'http://autotrade.su/files/photo/marks/GENERAL MOTORS.gif');
INSERT INTO `oc_category_section_auto` VALUES ('12', 'CHRYSLER', 'http://autotrade.su/files/photo/marks/CHRYSLER.gif');
INSERT INTO `oc_category_section_auto` VALUES ('13', 'CITROEN', 'http://autotrade.su/files/photo/marks/CITROEN.gif');
INSERT INTO `oc_category_section_auto` VALUES ('14', 'DAEWOO', 'http://autotrade.su/files/photo/marks/DAEWOO.gif');
INSERT INTO `oc_category_section_auto` VALUES ('15', 'DODGE', 'http://autotrade.su/files/photo/marks/DODGE.gif');
INSERT INTO `oc_category_section_auto` VALUES ('16', 'MERCEDES BENZ', '');
INSERT INTO `oc_category_section_auto` VALUES ('17', 'FORD', 'http://autotrade.su/files/photo/marks/FORD.gif');
INSERT INTO `oc_category_section_auto` VALUES ('18', 'FIAT', 'http://autotrade.su/files/photo/marks/FIAT.gif');
INSERT INTO `oc_category_section_auto` VALUES ('19', 'VOLVO', 'http://autotrade.su/files/photo/marks/VOLVO.gif');
INSERT INTO `oc_category_section_auto` VALUES ('20', 'KIA', 'http://autotrade.su/files/photo/marks/KIA.gif');
INSERT INTO `oc_category_section_auto` VALUES ('21', 'SUZUKI', 'http://autotrade.su/files/photo/marks/SUZUKI.gif');
INSERT INTO `oc_category_section_auto` VALUES ('22', 'INFINITI', 'http://autotrade.su/files/photo/marks/INFINITI.gif');
INSERT INTO `oc_category_section_auto` VALUES ('23', 'MITSUBISHI', 'http://autotrade.su/files/photo/marks/MITSUBISHI.gif');
INSERT INTO `oc_category_section_auto` VALUES ('24', 'RENAULT', 'http://autotrade.su/files/photo/marks/RENAULT.gif');
INSERT INTO `oc_category_section_auto` VALUES ('25', 'FREIGHTLINER', 'http://autotrade.su/files/photo/marks/FREIGHTLINER.gif');
INSERT INTO `oc_category_section_auto` VALUES ('26', 'MAZDA', 'http://autotrade.su/files/photo/marks/MAZDA.gif');
INSERT INTO `oc_category_section_auto` VALUES ('27', 'MERCEDES', 'http://autotrade.su/files/photo/marks/MERCEDES.gif');
INSERT INTO `oc_category_section_auto` VALUES ('28', 'PEUGEOT', 'http://autotrade.su/files/photo/marks/PEUGEOT.gif');
INSERT INTO `oc_category_section_auto` VALUES ('29', 'SUBARU', 'http://autotrade.su/files/photo/marks/SUBARU.gif');
INSERT INTO `oc_category_section_auto` VALUES ('30', 'HONDA', 'http://autotrade.su/files/photo/marks/HONDA.gif');
INSERT INTO `oc_category_section_auto` VALUES ('31', 'ISUZU', 'http://autotrade.su/files/photo/marks/ISUZU.gif');
INSERT INTO `oc_category_section_auto` VALUES ('32', 'HYUNDAI', 'http://autotrade.su/files/photo/marks/HYUNDAI.gif');
INSERT INTO `oc_category_section_auto` VALUES ('33', 'DAIHATSU', 'http://autotrade.su/files/photo/marks/DAIHATSU.gif');
INSERT INTO `oc_category_section_auto` VALUES ('34', 'OPEL', 'http://autotrade.su/files/photo/marks/OPEL.gif');
INSERT INTO `oc_category_section_auto` VALUES ('35', 'SKODA', 'http://autotrade.su/files/photo/marks/SKODA.gif');
INSERT INTO `oc_category_section_auto` VALUES ('36', 'LAND ROVER', 'http://autotrade.su/files/photo/marks/LAND ROVER.gif');
INSERT INTO `oc_category_section_auto` VALUES ('38', 'SSANGYONG', 'http://autotrade.su/files/photo/marks/SSANGYONG.gif');
INSERT INTO `oc_category_section_auto` VALUES ('40', 'JEEP', 'http://autotrade.su/files/photo/marks/JEEP.gif');
INSERT INTO `oc_category_section_auto` VALUES ('41', 'DAF', 'http://autotrade.su/files/photo/marks/DAF.gif');
INSERT INTO `oc_category_section_auto` VALUES ('42', 'JAGUAR', 'http://autotrade.su/files/photo/marks/JAGUAR.gif');
INSERT INTO `oc_category_section_auto` VALUES ('43', 'MAN', 'http://autotrade.su/files/photo/marks/MAN.gif');
INSERT INTO `oc_category_section_auto` VALUES ('44', 'PONTIAC', 'http://autotrade.su/files/photo/marks/PONTIAC.gif');
INSERT INTO `oc_category_section_auto` VALUES ('45', 'SCANIA', '');
INSERT INTO `oc_category_section_auto` VALUES ('46', 'MACK', 'http://autotrade.su/files/photo/marks/MACK.gif');
INSERT INTO `oc_category_section_auto` VALUES ('47', 'GEELY', 'http://autotrade.su/files/photo/marks/GEELY.gif');
INSERT INTO `oc_category_section_auto` VALUES ('48', 'IVECO', 'http://autotrade.su/files/photo/marks/IVECO.gif');
INSERT INTO `oc_category_section_auto` VALUES ('49', 'BYD', 'http://autotrade.su/files/photo/marks/BYD.gif');
INSERT INTO `oc_category_section_auto` VALUES ('50', 'CHERY', 'http://autotrade.su/files/photo/marks/CHERY.gif');
INSERT INTO `oc_category_section_auto` VALUES ('51', 'HINO', 'http://autotrade.su/files/photo/marks/HINO.gif');
INSERT INTO `oc_category_section_auto` VALUES ('52', 'UNIVERSAL', '');
INSERT INTO `oc_category_section_auto` VALUES ('53', 'BUICK', 'http://autotrade.su/files/photo/marks/BUICK.gif');
INSERT INTO `oc_category_section_auto` VALUES ('54', 'MERCURY', 'http://autotrade.su/files/photo/marks/MERCURY.gif');
INSERT INTO `oc_category_section_auto` VALUES ('55', 'LINCOLN', 'http://autotrade.su/files/photo/marks/LINCOLN.gif');
INSERT INTO `oc_category_section_auto` VALUES ('56', 'GAZ', 'http://autotrade.su/files/photo/marks/GAZ.gif');
INSERT INTO `oc_category_section_auto` VALUES ('57', 'GREAT WALL', 'http://autotrade.su/files/photo/marks/GREAT WALL.gif');
INSERT INTO `oc_category_section_auto` VALUES ('58', 'FOTON', 'http://autotrade.su/files/photo/marks/FOTON.gif');
INSERT INTO `oc_category_section_auto` VALUES ('59', 'KENWORTH', 'http://autotrade.su/files/photo/marks/KENWORTH.gif');
INSERT INTO `oc_category_section_auto` VALUES ('60', 'LADA', '');
INSERT INTO `oc_category_section_auto` VALUES ('62', 'OLDSMOBILE', 'http://autotrade.su/files/photo/marks/OLDSMOBILE.gif');
INSERT INTO `oc_category_section_auto` VALUES ('63', 'PORSCHE', 'http://autotrade.su/files/photo/marks/PORSCHE.gif');
INSERT INTO `oc_category_section_auto` VALUES ('64', 'HOWO', 'http://autotrade.su/files/photo/marks/HOWO.gif');
INSERT INTO `oc_category_section_auto` VALUES ('65', 'HUMMER', 'http://autotrade.su/files/photo/marks/HUMMER.gif');
INSERT INTO `oc_category_section_auto` VALUES ('66', 'INTERNATIONAL', 'http://autotrade.su/files/photo/marks/INTERNATIONAL.gif');
INSERT INTO `oc_category_section_auto` VALUES ('67', 'HAFEI', 'http://autotrade.su/files/photo/marks/HAFEI.gif');
INSERT INTO `oc_category_section_auto` VALUES ('68', 'SAAB', 'http://autotrade.su/files/photo/marks/SAAB.gif');
INSERT INTO `oc_category_section_auto` VALUES ('70', 'IRAN KHODRO', 'http://autotrade.su/files/photo/marks/IRAN KHODRO.gif');
INSERT INTO `oc_category_section_auto` VALUES ('71', 'SEAT', 'http://autotrade.su/files/photo/marks/SEAT.gif');
INSERT INTO `oc_category_section_auto` VALUES ('72', 'MINI', 'http://autotrade.su/files/photo/marks/MINI.gif');
INSERT INTO `oc_category_section_auto` VALUES ('74', 'ROVER', 'http://autotrade.su/files/photo/marks/ROVER.gif');
INSERT INTO `oc_category_section_auto` VALUES ('75', 'SATURN', 'http://autotrade.su/files/photo/marks/SATURN.gif');
INSERT INTO `oc_category_section_auto` VALUES ('76', 'UAZ', 'http://autotrade.su/files/photo/marks/UAZ.gif');
INSERT INTO `oc_category_section_auto` VALUES ('80', 'UNIVERSAL TYPE', '');
INSERT INTO `oc_category_section_auto` VALUES ('81', 'ЭЛЕКТРИКА', '');
INSERT INTO `oc_category_section_auto` VALUES ('82', 'КУЗОВНОЕ', '');
INSERT INTO `oc_category_section_auto` VALUES ('83', 'ПОДВЕСКА', '');
INSERT INTO `oc_category_section_auto` VALUES ('84', 'ДВИГАТЕЛЬ', '');
INSERT INTO `oc_category_section_auto` VALUES ('85', 'Инструменты и расходные материалы для установки автостекла', '');
INSERT INTO `oc_category_section_auto` VALUES ('87', 'PLYMOUTH', '');
INSERT INTO `oc_category_section_auto` VALUES ('89', 'DACIA', 'http://autotrade.su/files/photo/marks/DACIA.gif');
INSERT INTO `oc_category_section_auto` VALUES ('91', 'LADA', '');
INSERT INTO `oc_category_section_auto` VALUES ('94', 'DONG FENG', 'http://autotrade.su/files/photo/marks/DONG FENG.gif');
INSERT INTO `oc_category_section_auto` VALUES ('95', 'LIFAN', 'http://autotrade.su/files/photo/marks/LIFAN.gif');
INSERT INTO `oc_category_section_auto` VALUES ('96', 'BENTLEY', 'http://autotrade.su/files/photo/marks/BENTLEY.gif');
INSERT INTO `oc_category_section_auto` VALUES ('100', 'ШРУСы', '');
INSERT INTO `oc_category_section_auto` VALUES ('101', 'ПОЛУОСИ, ВАЛЫ ПРИВОДНЫЕ', '');
INSERT INTO `oc_category_section_auto` VALUES ('102', 'КАРДАННЫЕ ВАЛЫ', '');
INSERT INTO `oc_category_section_auto` VALUES ('103', 'КРЕСТОВИНЫ', '');
INSERT INTO `oc_category_section_auto` VALUES ('104', 'КАРДАНЫ РУЛЕВЫЕ', '');
INSERT INTO `oc_category_section_auto` VALUES ('105', 'ПРОКЛАДКИ КЛАПАННОЙ КРЫШКИ', '');
INSERT INTO `oc_category_section_auto` VALUES ('106', 'ПРОКЛАДКИ МАСЛЯННОГО НАСОСА', '');
INSERT INTO `oc_category_section_auto` VALUES ('107', 'РЕМ-КОМПЛЕКТЫ РУЛЕВОГО УПРАВЛЕНИЯ NOK', '');
INSERT INTO `oc_category_section_auto` VALUES ('108', 'САЛЬНИКИ ДВИГАТЕЛЯ NOK', '');
INSERT INTO `oc_category_section_auto` VALUES ('109', 'САЛЬНИКИ ТРАНСМИССИИ NOK', '');
INSERT INTO `oc_category_section_auto` VALUES ('110', 'УПЛОТНЕНИЯ СВЕЧНЫХ КОЛОДЦЕВ NOK', '');
INSERT INTO `oc_category_section_auto` VALUES ('111', 'Гофра воздушного фильтра', '');
INSERT INTO `oc_category_section_auto` VALUES ('112', 'Шкив коленвала', '');
INSERT INTO `oc_category_section_auto` VALUES ('113', 'Вискомуфта', '');
INSERT INTO `oc_category_section_auto` VALUES ('114', 'Натяжитель ремня   ремень', '');
INSERT INTO `oc_category_section_auto` VALUES ('115', 'Катушки зажигания', '');
INSERT INTO `oc_category_section_auto` VALUES ('116', 'Провода зажигания высоковольтные', '');
INSERT INTO `oc_category_section_auto` VALUES ('117', 'Подушка двигателя', '');
INSERT INTO `oc_category_section_auto` VALUES ('118', 'АКСЕССУАРЫ', '');
INSERT INTO `oc_category_section_auto` VALUES ('120101', 'BEIFANG BENCHI', 'http://autotrade.su/files/photo/marks/BEIFANG BENCHI.gif');
INSERT INTO `oc_category_section_auto` VALUES ('121101', 'FAW', 'http://autotrade.su/files/photo/marks/FAW.gif');
INSERT INTO `oc_category_section_auto` VALUES ('122101', 'VORTEX', 'http://autotrade.su/files/photo/marks/VORTEX.gif');
INSERT INTO `oc_category_section_auto` VALUES ('123101', 'PETERBILT', 'http://autotrade.su/files/photo/marks/PETERBILT.gif');
INSERT INTO `oc_category_section_auto` VALUES ('124101', 'MUDAN', 'http://autotrade.su/files/photo/marks/MUDAN.gif');
INSERT INTO `oc_category_section_auto` VALUES ('125101', 'KAMAZ', 'http://autotrade.su/files/photo/marks/KAMAZ.gif');
INSERT INTO `oc_category_section_auto` VALUES ('126101', 'SHAANXI', 'http://autotrade.su/files/photo/marks/SHAANXI.gif');
INSERT INTO `oc_category_section_auto` VALUES ('127101', 'ZAZ', 'http://autotrade.su/files/photo/marks/ZAZ.gif');
INSERT INTO `oc_category_section_auto` VALUES ('128101', 'JAC', 'http://autotrade.su/files/photo/marks/JAC.gif');
INSERT INTO `oc_category_section_auto` VALUES ('129101', 'BRILLIANCE', 'http://autotrade.su/files/photo/marks/BRILLIANCE.gif');
INSERT INTO `oc_category_section_auto` VALUES ('130101', 'HUANGHAI', 'http://autotrade.su/files/photo/marks/HUANGHAI.gif');
INSERT INTO `oc_category_section_auto` VALUES ('131102', 'Шпилька', '');
INSERT INTO `oc_category_section_auto` VALUES ('132102', 'Гайка', '');
INSERT INTO `oc_category_section_auto` VALUES ('133102', 'Эксцентрик', '');
INSERT INTO `oc_category_section_auto` VALUES ('135102', 'BAW', 'http://autotrade.su/files/photo/marks/BAW.gif');
INSERT INTO `oc_category_section_auto` VALUES ('136102', 'ПРИВОДА', '');
INSERT INTO `oc_category_section_auto` VALUES ('137102', 'TAGAZ', '');
INSERT INTO `oc_category_section_auto` VALUES ('138102', 'TIANYA (ZXAUTO)', '');
INSERT INTO `oc_category_section_auto` VALUES ('139102', 'LDV', '');
INSERT INTO `oc_category_section_auto` VALUES ('141102', 'HANIA', '');
INSERT INTO `oc_category_section_auto` VALUES ('142102', 'GMC', '');
INSERT INTO `oc_category_section_auto` VALUES ('143102', 'LANDWIND', '');
INSERT INTO `oc_category_section_auto` VALUES ('144102', 'YUEJIN', '');
INSERT INTO `oc_category_section_auto` VALUES ('145102', 'ПРОКЛАДКИ ТЕРМОСТАТА', '');
INSERT INTO `oc_category_section_auto` VALUES ('146102', 'TATA', '');
INSERT INTO `oc_category_section_auto` VALUES ('149102', 'Щётки каркасные', '');
INSERT INTO `oc_category_section_auto` VALUES ('150102', 'Щётки бескаркасные', '');
INSERT INTO `oc_category_section_auto` VALUES ('151102', 'Щётки зимние', '');

-- ----------------------------
-- Table structure for `oc_category_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_to_layout
-- ----------------------------
INSERT INTO `oc_category_to_layout` VALUES ('65', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('64', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('63', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('60', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('66', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('67', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('68', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('69', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('70', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('71', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('72', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('73', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('74', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('75', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('76', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('77', '0', '0');
INSERT INTO `oc_category_to_layout` VALUES ('78', '0', '0');

-- ----------------------------
-- Table structure for `oc_category_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_to_store
-- ----------------------------
INSERT INTO `oc_category_to_store` VALUES ('60', '0');
INSERT INTO `oc_category_to_store` VALUES ('63', '0');
INSERT INTO `oc_category_to_store` VALUES ('64', '0');
INSERT INTO `oc_category_to_store` VALUES ('65', '0');
INSERT INTO `oc_category_to_store` VALUES ('66', '0');
INSERT INTO `oc_category_to_store` VALUES ('67', '0');
INSERT INTO `oc_category_to_store` VALUES ('68', '0');
INSERT INTO `oc_category_to_store` VALUES ('69', '0');
INSERT INTO `oc_category_to_store` VALUES ('70', '0');
INSERT INTO `oc_category_to_store` VALUES ('71', '0');
INSERT INTO `oc_category_to_store` VALUES ('72', '0');
INSERT INTO `oc_category_to_store` VALUES ('73', '0');
INSERT INTO `oc_category_to_store` VALUES ('74', '0');
INSERT INTO `oc_category_to_store` VALUES ('75', '0');
INSERT INTO `oc_category_to_store` VALUES ('76', '0');
INSERT INTO `oc_category_to_store` VALUES ('77', '0');
INSERT INTO `oc_category_to_store` VALUES ('78', '0');

-- ----------------------------
-- Table structure for `oc_country`
-- ----------------------------
DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_country
-- ----------------------------
INSERT INTO `oc_country` VALUES ('20', 'Белоруссия (Беларусь)', 'BY', 'BLR', '', '0', '1');
INSERT INTO `oc_country` VALUES ('80', 'Грузия', 'GE', 'GEO', '', '0', '1');
INSERT INTO `oc_country` VALUES ('109', 'Казахстан', 'KZ', 'KAZ', '', '0', '1');
INSERT INTO `oc_country` VALUES ('115', 'Киргизия (Кыргызстан)', 'KG', 'KGZ', '', '0', '1');
INSERT INTO `oc_country` VALUES ('176', 'Российская Федерация', 'RU', 'RUS', '', '0', '1');
INSERT INTO `oc_country` VALUES ('220', 'Украина', 'UA', 'UKR', '', '0', '1');
INSERT INTO `oc_country` VALUES ('226', 'Узбекистан', 'UZ', 'UZB', '', '0', '1');

-- ----------------------------
-- Table structure for `oc_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon
-- ----------------------------
INSERT INTO `oc_coupon` VALUES ('4', '-10% Discount', '2222', 'P', '10.0000', '0', '0', '0.0000', '2014-01-01', '2020-01-01', '10', '10', '0', '2009-01-27 13:55:03');
INSERT INTO `oc_coupon` VALUES ('5', 'Free Shipping', '3333', 'P', '0.0000', '0', '1', '100.0000', '2014-01-01', '2014-02-01', '10', '10', '0', '2009-03-14 21:13:53');
INSERT INTO `oc_coupon` VALUES ('6', '-10.00 Discount', '1111', 'F', '10.0000', '0', '0', '10.0000', '2014-01-01', '2020-01-01', '100000', '10000', '0', '2009-03-14 21:15:18');

-- ----------------------------
-- Table structure for `oc_coupon_category`
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon_category`;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon_category
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_coupon_history`
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon_history
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_coupon_product`
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon_product
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_currency`
-- ----------------------------
DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_currency
-- ----------------------------
INSERT INTO `oc_currency` VALUES ('1', 'Рубль', 'RUB', '', 'р.', '0', '66.15399933', '1', '2015-10-05 04:12:16');
INSERT INTO `oc_currency` VALUES ('2', 'Доллар', 'USD', '$', '', '', '1.00000000', '1', '2015-10-05 15:55:03');

-- ----------------------------
-- Table structure for `oc_customer`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer
-- ----------------------------
INSERT INTO `oc_customer` VALUES ('1', '1', '0', 'енрено', 'генген', 'tt@tt.ru', '5646757', '', 'fa47d004bd180deee93f1fd8be333f9f191d42ed', 'f82fa6f74', 'a:1:{s:96:\"YToyOntzOjEwOiJwcm9kdWN0X2lkIjtpOjQ3O3M6Njoib3B0aW9uIjthOjE6e2k6MjI1O3M6MTA6IjIwMTEtMDQtMjIiO319\";i:1;}', 'a:2:{i:0;i:43;i:1;i:49;}', '0', '1', '', '127.0.0.1', '1', '1', '0', '', '2015-06-26 13:44:53');
INSERT INTO `oc_customer` VALUES ('2', '1', '0', '23454', '534534', '232@vc.vx', '6567467', '', '51072119d02aeab1f810ae482d031c154b585fa0', '6eba1cf89', 'a:1:{s:40:\"YToxOntzOjEwOiJwcm9kdWN0X2lkIjtpOjQ5O30=\";i:1;}', '', '0', '2', '', '127.0.0.1', '1', '1', '0', '', '2015-06-29 16:07:58');

-- ----------------------------
-- Table structure for `oc_customer_activity`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_activity`;
CREATE TABLE `oc_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_activity
-- ----------------------------
INSERT INTO `oc_customer_activity` VALUES ('1', '1', 'register', 'a:2:{s:11:\"customer_id\";i:1;s:4:\"name\";s:25:\"енрено генген\";}', '127.0.0.1', '2015-06-26 13:44:53');
INSERT INTO `oc_customer_activity` VALUES ('2', '1', 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:25:\"енрено генген\";s:8:\"order_id\";i:2;}', '127.0.0.1', '2015-06-26 13:45:03');
INSERT INTO `oc_customer_activity` VALUES ('3', '1', 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:25:\"енрено генген\";s:8:\"order_id\";i:6;}', '127.0.0.1', '2015-06-26 13:59:08');
INSERT INTO `oc_customer_activity` VALUES ('4', '1', 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"1\";s:4:\"name\";s:25:\"енрено генген\";s:8:\"order_id\";i:18;}', '127.0.0.1', '2015-06-26 14:35:26');
INSERT INTO `oc_customer_activity` VALUES ('5', '0', 'order_guest', 'a:2:{s:4:\"name\";s:13:\"fsdfsd sdfsdf\";s:8:\"order_id\";i:41;}', '127.0.0.1', '2015-06-26 16:18:10');
INSERT INTO `oc_customer_activity` VALUES ('6', '0', 'order_guest', 'a:2:{s:4:\"name\";s:13:\"ццц ццц\";s:8:\"order_id\";i:44;}', '127.0.0.1', '2015-06-26 16:52:30');
INSERT INTO `oc_customer_activity` VALUES ('7', '2', 'register', 'a:2:{s:11:\"customer_id\";i:2;s:4:\"name\";s:12:\"23454 534534\";}', '127.0.0.1', '2015-06-29 16:07:58');
INSERT INTO `oc_customer_activity` VALUES ('8', '2', 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"2\";s:4:\"name\";s:12:\"23454 534534\";s:8:\"order_id\";i:52;}', '127.0.0.1', '2015-06-29 16:08:09');
INSERT INTO `oc_customer_activity` VALUES ('9', '2', 'order_account', 'a:3:{s:11:\"customer_id\";s:1:\"2\";s:4:\"name\";s:12:\"23454 534534\";s:8:\"order_id\";i:53;}', '127.0.0.1', '2015-06-30 10:35:45');
INSERT INTO `oc_customer_activity` VALUES ('10', '0', 'order_guest', 'a:2:{s:4:\"name\";s:11:\"333 default\";s:8:\"order_id\";i:54;}', '127.0.0.1', '2015-07-01 16:44:34');
INSERT INTO `oc_customer_activity` VALUES ('11', '0', 'order_guest', 'a:2:{s:4:\"name\";s:12:\"tttt default\";s:8:\"order_id\";i:55;}', '127.0.0.1', '2015-07-01 16:46:32');
INSERT INTO `oc_customer_activity` VALUES ('12', '0', 'order_guest', 'a:2:{s:4:\"name\";s:27:\"Валентина  default\";s:8:\"order_id\";i:56;}', '127.0.0.1', '2015-07-01 16:54:17');
INSERT INTO `oc_customer_activity` VALUES ('13', '0', 'order_guest', 'a:2:{s:4:\"name\";s:20:\"Валентина  \";s:8:\"order_id\";i:57;}', '127.0.0.1', '2015-07-01 16:57:01');
INSERT INTO `oc_customer_activity` VALUES ('14', '0', 'order_guest', 'a:2:{s:4:\"name\";s:6:\"456   \";s:8:\"order_id\";i:59;}', '127.0.0.1', '2015-07-01 16:59:36');
INSERT INTO `oc_customer_activity` VALUES ('15', '0', 'order_guest', 'a:2:{s:4:\"name\";s:18:\"5463456 NoLastName\";s:8:\"order_id\";i:60;}', '127.0.0.1', '2015-07-01 17:05:09');
INSERT INTO `oc_customer_activity` VALUES ('16', '0', 'order_guest', 'a:2:{s:4:\"name\";s:16:\"afsdf noLastName\";s:8:\"order_id\";i:61;}', '127.0.0.1', '2015-07-01 17:07:12');
INSERT INTO `oc_customer_activity` VALUES ('17', '0', 'order_guest', 'a:2:{s:4:\"name\";s:15:\"6566 noLastName\";s:8:\"order_id\";i:62;}', '127.0.0.1', '2015-07-03 12:18:39');
INSERT INTO `oc_customer_activity` VALUES ('18', '0', 'order_guest', 'a:2:{s:4:\"name\";s:17:\"ппп noLastName\";s:8:\"order_id\";i:68;}', '127.0.0.1', '2015-07-16 21:16:19');
INSERT INTO `oc_customer_activity` VALUES ('19', '0', 'order_guest', 'a:2:{s:4:\"name\";s:14:\"sdf noLastName\";s:8:\"order_id\";i:69;}', '127.0.0.1', '2015-07-22 12:09:45');
INSERT INTO `oc_customer_activity` VALUES ('20', '0', 'order_guest', 'a:2:{s:4:\"name\";s:14:\"www noLastName\";s:8:\"order_id\";i:70;}', '127.0.0.1', '2015-07-22 12:27:07');
INSERT INTO `oc_customer_activity` VALUES ('21', '0', 'order_guest', 'a:2:{s:4:\"name\";s:26:\"fffffffffffffff noLastName\";s:8:\"order_id\";i:71;}', '127.0.0.1', '2015-07-22 12:34:23');
INSERT INTO `oc_customer_activity` VALUES ('22', '0', 'order_guest', 'a:2:{s:4:\"name\";s:14:\"fff noLastName\";s:8:\"order_id\";i:72;}', '127.0.0.1', '2015-07-22 14:26:43');
INSERT INTO `oc_customer_activity` VALUES ('23', '0', 'order_guest', 'a:2:{s:4:\"name\";s:22:\"ddddddddddd noLastName\";s:8:\"order_id\";i:81;}', '127.0.0.1', '2015-07-22 15:15:50');
INSERT INTO `oc_customer_activity` VALUES ('24', '0', 'order_guest', 'a:2:{s:4:\"name\";s:32:\"rrrrrrrrrrrrrrrrrrrrr noLastName\";s:8:\"order_id\";i:106;}', '127.0.0.1', '2015-07-22 17:26:14');
INSERT INTO `oc_customer_activity` VALUES ('25', '0', 'order_guest', 'a:2:{s:4:\"name\";s:24:\"ddddddddddddd noLastName\";s:8:\"order_id\";i:109;}', '127.0.0.1', '2015-07-22 17:37:04');
INSERT INTO `oc_customer_activity` VALUES ('26', '0', 'order_guest', 'a:2:{s:4:\"name\";s:33:\"ыыыыыыыыыыы noLastName\";s:8:\"order_id\";i:110;}', '127.0.0.1', '2015-07-22 17:39:56');
INSERT INTO `oc_customer_activity` VALUES ('27', '0', 'order_guest', 'a:2:{s:4:\"name\";s:16:\"qqqqq noLastName\";s:8:\"order_id\";i:112;}', '127.0.0.1', '2015-07-22 17:45:17');
INSERT INTO `oc_customer_activity` VALUES ('28', '0', 'order_guest', 'a:2:{s:4:\"name\";s:29:\"Валентина noLastName\";s:8:\"order_id\";i:137;}', '127.0.0.1', '2015-07-22 20:41:13');

-- ----------------------------
-- Table structure for `oc_customer_ban_ip`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_ban_ip`;
CREATE TABLE `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_ban_ip
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_group
-- ----------------------------
INSERT INTO `oc_customer_group` VALUES ('1', '0', '1');

-- ----------------------------
-- Table structure for `oc_customer_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_group_description
-- ----------------------------
INSERT INTO `oc_customer_group_description` VALUES ('1', '1', 'Default', 'test');

-- ----------------------------
-- Table structure for `oc_customer_history`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_history`;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_history
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_customer_ip`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_ip
-- ----------------------------
INSERT INTO `oc_customer_ip` VALUES ('1', '1', '127.0.0.1', '2015-06-26 13:44:53');
INSERT INTO `oc_customer_ip` VALUES ('2', '2', '127.0.0.1', '2015-06-29 16:07:58');

-- ----------------------------
-- Table structure for `oc_customer_login`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_login`;
CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_login
-- ----------------------------
INSERT INTO `oc_customer_login` VALUES ('1', '', '127.0.0.1', '5', '2015-06-26 13:22:28', '2015-06-29 16:06:58');

-- ----------------------------
-- Table structure for `oc_customer_online`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_online`;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_online
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_customer_reward`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_reward
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_customer_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_custom_field`
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field`;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_custom_field_customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_customer_group
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_custom_field_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_description`;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_description
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_custom_field_value`
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_value`;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_value
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_custom_field_value_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_value_description`;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_value_description
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_download`
-- ----------------------------
DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_download
-- ----------------------------
INSERT INTO `oc_download` VALUES ('1', 'Fanfaro MG Commercial.pdf.f3a9e6cf3a0c8a88b356f0f6d4a66e76', 'Fanfaro MG 17639', '2015-07-06 17:09:09');

-- ----------------------------
-- Table structure for `oc_download_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_download_description
-- ----------------------------
INSERT INTO `oc_download_description` VALUES ('1', '1', 'Fanfaro MG Commercial');

-- ----------------------------
-- Table structure for `oc_download_files`
-- ----------------------------
DROP TABLE IF EXISTS `oc_download_files`;
CREATE TABLE `oc_download_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_download_files
-- ----------------------------
INSERT INTO `oc_download_files` VALUES ('80', 'kompres3.htm', 'ссылка что надо', '71');
INSERT INTO `oc_download_files` VALUES ('81', 'kompres10.htm', 'качай, не пожалеешь', '72');
INSERT INTO `oc_download_files` VALUES ('83', 'Fanfaro SS Commercial.ppsx', 'ещё одна ссылка', '72');
INSERT INTO `oc_download_files` VALUES ('84', 'kompres34.htm', 'и ещё одна', '72');
INSERT INTO `oc_download_files` VALUES ('86', 'Fanfaro SS Commercial.ppsx', 'простая ссылка', '73');
INSERT INTO `oc_download_files` VALUES ('87', 'kompres16.htm', 'сложная ссылка', '73');
INSERT INTO `oc_download_files` VALUES ('88', 'kompres13.htm', 'пипец ссылка', '74');
INSERT INTO `oc_download_files` VALUES ('90', 'Fanfaro SS Commercial.pdf', 'лучшая ссылка', '74');
INSERT INTO `oc_download_files` VALUES ('92', 'kompres3.htm', 'Офигенская ссылка', '74');
INSERT INTO `oc_download_files` VALUES ('98', 'Новый текстовый документ (2).txt', 'hhhhh', '72');
INSERT INTO `oc_download_files` VALUES ('109', 'пароли для Каскада.txt', '123', '71');

-- ----------------------------
-- Table structure for `oc_event`
-- ----------------------------
DROP TABLE IF EXISTS `oc_event`;
CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_event
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_extension`
-- ----------------------------
DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=431 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_extension
-- ----------------------------
INSERT INTO `oc_extension` VALUES ('23', 'payment', 'cod');
INSERT INTO `oc_extension` VALUES ('22', 'total', 'shipping');
INSERT INTO `oc_extension` VALUES ('57', 'total', 'sub_total');
INSERT INTO `oc_extension` VALUES ('58', 'total', 'tax');
INSERT INTO `oc_extension` VALUES ('59', 'total', 'total');
INSERT INTO `oc_extension` VALUES ('410', 'module', 'banner');
INSERT INTO `oc_extension` VALUES ('426', 'module', 'carousel');
INSERT INTO `oc_extension` VALUES ('390', 'total', 'credit');
INSERT INTO `oc_extension` VALUES ('387', 'shipping', 'flat');
INSERT INTO `oc_extension` VALUES ('349', 'total', 'handling');
INSERT INTO `oc_extension` VALUES ('350', 'total', 'low_order_fee');
INSERT INTO `oc_extension` VALUES ('389', 'total', 'coupon');
INSERT INTO `oc_extension` VALUES ('413', 'module', 'category');
INSERT INTO `oc_extension` VALUES ('408', 'module', 'account');
INSERT INTO `oc_extension` VALUES ('393', 'total', 'reward');
INSERT INTO `oc_extension` VALUES ('398', 'total', 'voucher');
INSERT INTO `oc_extension` VALUES ('407', 'payment', 'free_checkout');
INSERT INTO `oc_extension` VALUES ('427', 'module', 'featured');
INSERT INTO `oc_extension` VALUES ('419', 'module', 'slideshow');
INSERT INTO `oc_extension` VALUES ('428', 'module', 'html');
INSERT INTO `oc_extension` VALUES ('429', 'module', 'latest');

-- ----------------------------
-- Table structure for `oc_filter`
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter`;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_filter_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter_description`;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter_description
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_filter_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter_group`;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter_group
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_filter_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter_group_description`;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter_group_description
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_geo_zone`
-- ----------------------------
DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_geo_zone
-- ----------------------------
INSERT INTO `oc_geo_zone` VALUES ('3', 'Зона НДС', 'Облагаемые НДС', '2014-09-09 11:48:13', '2014-05-21 22:30:20');

-- ----------------------------
-- Table structure for `oc_information`
-- ----------------------------
DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information
-- ----------------------------
INSERT INTO `oc_information` VALUES ('3', '1', '3', '0');
INSERT INTO `oc_information` VALUES ('4', '1', '1', '1');
INSERT INTO `oc_information` VALUES ('5', '1', '4', '0');
INSERT INTO `oc_information` VALUES ('6', '1', '2', '1');

-- ----------------------------
-- Table structure for `oc_information_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information_description
-- ----------------------------
INSERT INTO `oc_information_description` VALUES ('4', '1', 'О нас', '&lt;p&gt;\r\n	About Us&lt;/p&gt;', 'О нас', '', '');
INSERT INTO `oc_information_description` VALUES ('5', '1', 'Условия соглашения', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;', 'Условия соглашения', '', '');
INSERT INTO `oc_information_description` VALUES ('3', '1', 'Политика Безопасности', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;', 'Политика Безопасности', '', '');
INSERT INTO `oc_information_description` VALUES ('6', '1', 'Доставка', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;', 'Доставка', '', '');

-- ----------------------------
-- Table structure for `oc_information_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information_to_layout
-- ----------------------------
INSERT INTO `oc_information_to_layout` VALUES ('3', '0', '0');
INSERT INTO `oc_information_to_layout` VALUES ('5', '0', '0');
INSERT INTO `oc_information_to_layout` VALUES ('4', '0', '1');

-- ----------------------------
-- Table structure for `oc_information_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information_to_store
-- ----------------------------
INSERT INTO `oc_information_to_store` VALUES ('3', '0');
INSERT INTO `oc_information_to_store` VALUES ('4', '0');
INSERT INTO `oc_information_to_store` VALUES ('5', '0');
INSERT INTO `oc_information_to_store` VALUES ('6', '0');

-- ----------------------------
-- Table structure for `oc_language`
-- ----------------------------
DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_language
-- ----------------------------
INSERT INTO `oc_language` VALUES ('1', 'Russian', 'ru', 'ru_RU.UTF-8,ru_RU,russian', 'ru.png', 'russian', '1', '1');

-- ----------------------------
-- Table structure for `oc_layout`
-- ----------------------------
DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `home_article` text NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_layout
-- ----------------------------
INSERT INTO `oc_layout` VALUES ('1', 'Home', '&lt;p&gt;Автонекст &amp;ndash; входит в число лидеров по продажам автозапчастей , смазочных материалов и оборудования для автотехцентров в г. Новосибирск и Новосибирской области. Мы работаем с начала 2014 года, предоставляя своим клиентам только самые качественные запасные части и оборудование по доступной цене. Клиент, который работал с нами хотя бы раз, вернется с вероятностью 99,9 %. Мы поможем найти необходимую Вам запасную часть в кратчайшие сроки, по самой выгодной цене. Даже если товара нет на нашем складе, мы закажем его у наших поставщиков . Вы будете удивлены нашими ценами при заказе деталей!позвоните нам и мы решим Вашу проблему. Работа с нами оградит Вас от некачественного, неверно подобранного товара, т.к. в нашем штате работают только опытные специалисты в сфере обслуживания автомобилей и подбора запчастей. Мы берем на себя полную ответственность за применимость товара. Если Вам нужен помощник в поиске и подборе запасных частей, обратитесь к нам, мы ответственно, а главное с необходимой долей профессионализма найдем и доставим Вам запчасти. Если у вас нет времени и желания искать запасные части, позвоните нам, мы доставим их на дом. Принимаем наличный, безналичный расчет, перевод на банковскую карту.&lt;/p&gt;\r\n');
INSERT INTO `oc_layout` VALUES ('2', 'Product', '');
INSERT INTO `oc_layout` VALUES ('3', 'Category', '');
INSERT INTO `oc_layout` VALUES ('4', 'Default', '');
INSERT INTO `oc_layout` VALUES ('5', 'Manufacturer', '');
INSERT INTO `oc_layout` VALUES ('6', 'Account', '');
INSERT INTO `oc_layout` VALUES ('7', 'Checkout', '');
INSERT INTO `oc_layout` VALUES ('8', 'Contact', '');
INSERT INTO `oc_layout` VALUES ('9', 'Sitemap', '');
INSERT INTO `oc_layout` VALUES ('10', 'Affiliate', '');
INSERT INTO `oc_layout` VALUES ('11', 'Information', '');
INSERT INTO `oc_layout` VALUES ('12', 'Compare', '');
INSERT INTO `oc_layout` VALUES ('13', 'Search', '');
INSERT INTO `oc_layout` VALUES ('17', 'compressor', '&lt;p&gt;Компрессоры можно разделить на два основных типа &amp;ndash; это &lt;strong&gt;винтовые компрессоры&lt;/strong&gt;&amp;nbsp;и&amp;nbsp;&lt;strong&gt;поршневые компрессоры&lt;/strong&gt;.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Поршневой компрессор&lt;/strong&gt;, который также ещё называют объемным&amp;nbsp;&lt;strong&gt;компрессором&lt;/strong&gt;, всасывает определённый объем воздуха и при помощи поршня, соединенного с коленчатым валом, сжимает исходный объем воздуха до меньшего объема.&amp;nbsp;&lt;strong&gt;Поршневые компрессоры&amp;nbsp;&lt;/strong&gt;бывают различных видов: масляные и безмасляные, с различным числом и объёмом цилиндров, с ременной или прямой передачей.&amp;nbsp;&lt;br /&gt;\r\nОсновным преимуществом&amp;nbsp;&lt;strong&gt;поршневых компрессоров&amp;nbsp;&lt;/strong&gt;является их простота и низкая стоимость по сравнению с&amp;nbsp;&lt;strong&gt;винтовыми компрессорами,&amp;nbsp;&lt;/strong&gt;а также и требуют меньших затрат на обслуживание.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Поршневые компрессоры&amp;nbsp;&lt;/strong&gt;являются самыми распространенными в России странах СНГ, среди установленных компрессоров с производительностью до 100 м3/мин. Данная технология используется для сжатия воздуха на протяжении уже двух столетий, в силу относительной простоты её технической реализации.&amp;nbsp;&lt;br /&gt;\r\n&lt;strong&gt;Поршневые компрессоры&amp;nbsp;&lt;/strong&gt;по своим характеристикам и ценовым параметрам предпочтительнее&amp;nbsp;&lt;strong&gt;компрессоров&amp;nbsp;&lt;/strong&gt;других типов в следующих случаях:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Большие перепады в потреблении сжатого воздуха.&amp;nbsp;&lt;strong&gt;Промышленные поршневые компрессоры&amp;nbsp;&lt;/strong&gt;одинаково хорошо работают в повторно-кратковременном режиме, когда они намного экономичнее, чем&amp;nbsp;&lt;strong&gt;винтовые компрессоры&amp;nbsp;&lt;/strong&gt;.&lt;/li&gt;\r\n	&lt;li&gt;Неблагоприятные условия эксплуатации&amp;nbsp;&lt;strong&gt;компрессора&amp;nbsp;&lt;/strong&gt;. При неблагоприятных условиях эксплуатации&amp;nbsp;&lt;strong&gt;компрессора&amp;nbsp;&lt;/strong&gt;, например, при использовании в установках расфасовки цемента, на угольных складах или мельницах для помола зерна, либо при больших колебаниях температуры,&amp;nbsp;&lt;strong&gt;поршневые компрессоры&amp;nbsp;&lt;/strong&gt;обеспечивают более длительный срок службы.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;Компания МегаПром может вам предложить&amp;nbsp;&lt;strong&gt;поршневые компрессоры&amp;nbsp;&lt;/strong&gt;следующих видов:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Компрессоры с прямым и ременным приводом&lt;/li&gt;\r\n	&lt;li&gt;Компрессоры передвижные для строительных работ&lt;/li&gt;\r\n	&lt;li&gt;Компрессоры высокого давления и дожимные компрессоры (БУСТЕРЫ)&lt;/li&gt;\r\n	&lt;li&gt;Компрессоры низкого давления (воздуходувки)&lt;/li&gt;\r\n	&lt;li&gt;Компрессоры безмасляные медицинские&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;hr /&gt;\r\n&lt;p&gt;&lt;strong&gt;Винтовые компрессоры&lt;/strong&gt;, были разработаны в 30 годы 20 века, когда экономика Европы развивалась быстрыми темпами. Особенность данного вида объемных компрессоров заключается в том, что рабочий орган винтового компрессора выполняется в виде червячных роторов, находящихся в зацеплении. Это значительно повлияло на повышение стабильной работы компрессора в различных условиях и температурных режимах.&amp;nbsp;&lt;br /&gt;\r\nВ отличие от поршневого, данный вид&amp;nbsp;&lt;strong&gt;компрессоров&amp;nbsp;&lt;/strong&gt;не имеет клапанов, что приводит к устранению механических нагрузок, которые вызывают разбалансировку&amp;nbsp;&lt;strong&gt;винтового компрессора&lt;/strong&gt;. При этом скорость вращения винтового блока компрессора значительно увеличивается. Эта особенность конструкции компрессора позволяет получить достаточно высокую величины потока, что соответственно приводит к увеличению производительности работы&amp;nbsp;&lt;strong&gt;ротационного компрессора&lt;/strong&gt;, не изменяя габаритных размеров. Показатель соотношения мощности потока к габаритам компрессора равен 0,75 что для того времени был достаточно высоким. Разность давления между входом компрессора и на выходе из&amp;nbsp;&lt;strong&gt;компрессора&lt;/strong&gt;, так называемое осевое усилие, принимается подшипниками, установленными в винтовом блоке компрессора. Изначально винт компрессора был симметричным, но на сегодняшний день, он имеет различные сечения.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Винтовой компрессор&amp;nbsp;&lt;/strong&gt;обладает целым рядом преимуществ по сравнению с поршневыми или центробежными компрессорами.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;высокая надежность;&lt;/li&gt;\r\n	&lt;li&gt;длительный ресурс работы;&lt;/li&gt;\r\n	&lt;li&gt;возможность непрерывного круглосуточного функционирования;&lt;/li&gt;\r\n	&lt;li&gt;простота монтажа и подключения;&lt;/li&gt;\r\n	&lt;li&gt;сравнительно небольшие эксплуатационные затраты;&lt;/li&gt;\r\n	&lt;li&gt;наличие системы автоматического управления;&lt;/li&gt;\r\n	&lt;li&gt;более низкий уровень шума;&lt;/li&gt;\r\n	&lt;li&gt;высокая чистота получаемого сжатого воздуха;&lt;/li&gt;\r\n	&lt;li&gt;низкий уровень энергозатрат на куб. метр произведенного воздуха.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;Мы предлагаем Вашему вниманию&amp;nbsp;&lt;strong&gt;Винтовые компрессоры&lt;/strong&gt;&amp;nbsp;знаменитых производителей Германии, Италии, Беларуси и России. Отличное качество изготовления и конструктивные особенности позволяют проводить плановую проверку винтовых компрессоров всего несколько раз в год. Использование винтовой пары позволяет значительно снизить расход электроэнергии при одновременном повышении производительности. Учитывая темпы роста стоимости энергоносителей, винтовые компрессоры окупаются в первый год своей работы. Кроме того, некоторые винтовые компрессоры обладают возможностью регулировать частоту вращения, что позволяет исключить работу в холостом режиме.&amp;nbsp;&lt;strong&gt;Винтовые компрессоры&amp;nbsp;&lt;/strong&gt;прекрасно подходит для оптимизации экономичного производственного процесса, как в условиях промышленного производства, так и для небольших предприятий.&lt;/p&gt;\r\n\r\n&lt;p&gt;Всегда в наличии на нашем складе винтовые компрессоры следующих производителей:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Компрессоры DALGAKIRAN (Турция)&lt;/li&gt;\r\n	&lt;li&gt;Компрессоры REMEZA (Беларусь)&lt;/li&gt;\r\n	&lt;li&gt;Компрессоры АВАС (Италия)&lt;/li&gt;\r\n	&lt;li&gt;Компрессоры ALUP (Германия)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n');

-- ----------------------------
-- Table structure for `oc_layout_module`
-- ----------------------------
DROP TABLE IF EXISTS `oc_layout_module`;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_layout_module
-- ----------------------------
INSERT INTO `oc_layout_module` VALUES ('2', '4', '0', 'content_top', '0');
INSERT INTO `oc_layout_module` VALUES ('3', '4', '0', 'content_top', '1');
INSERT INTO `oc_layout_module` VALUES ('20', '5', '0', 'column_left', '2');
INSERT INTO `oc_layout_module` VALUES ('69', '10', 'affiliate', 'column_right', '1');
INSERT INTO `oc_layout_module` VALUES ('68', '6', 'account', 'column_right', '1');
INSERT INTO `oc_layout_module` VALUES ('127', '1', 'slideshow.27', 'content_top', '1');
INSERT INTO `oc_layout_module` VALUES ('128', '1', 'featured.37', 'content_top', '2');
INSERT INTO `oc_layout_module` VALUES ('129', '1', 'html.42', 'content_top', '1');

-- ----------------------------
-- Table structure for `oc_layout_route`
-- ----------------------------
DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_layout_route
-- ----------------------------
INSERT INTO `oc_layout_route` VALUES ('38', '6', '0', 'account/%');
INSERT INTO `oc_layout_route` VALUES ('17', '10', '0', 'affiliate/%');
INSERT INTO `oc_layout_route` VALUES ('104', '1', '0', 'common/home');
INSERT INTO `oc_layout_route` VALUES ('20', '2', '0', 'product/product');
INSERT INTO `oc_layout_route` VALUES ('24', '11', '0', 'information/information');
INSERT INTO `oc_layout_route` VALUES ('23', '7', '0', 'checkout/%');
INSERT INTO `oc_layout_route` VALUES ('31', '8', '0', 'information/contact');
INSERT INTO `oc_layout_route` VALUES ('32', '9', '0', 'information/sitemap');
INSERT INTO `oc_layout_route` VALUES ('34', '4', '0', '');
INSERT INTO `oc_layout_route` VALUES ('45', '5', '0', 'product/manufacturer');
INSERT INTO `oc_layout_route` VALUES ('52', '12', '0', 'product/compare');
INSERT INTO `oc_layout_route` VALUES ('53', '13', '0', 'product/search');
INSERT INTO `oc_layout_route` VALUES ('100', '17', '0', 'product/compressor');
INSERT INTO `oc_layout_route` VALUES ('112', '3', '0', 'product/category');

-- ----------------------------
-- Table structure for `oc_length_class`
-- ----------------------------
DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_length_class
-- ----------------------------
INSERT INTO `oc_length_class` VALUES ('1', '1.00000000');
INSERT INTO `oc_length_class` VALUES ('2', '10.00000000');
INSERT INTO `oc_length_class` VALUES ('3', '0.39370000');

-- ----------------------------
-- Table structure for `oc_length_class_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_length_class_description
-- ----------------------------
INSERT INTO `oc_length_class_description` VALUES ('1', '1', 'Сантиметр', 'см');
INSERT INTO `oc_length_class_description` VALUES ('2', '1', 'Миллиметр', 'мм');

-- ----------------------------
-- Table structure for `oc_location`
-- ----------------------------
DROP TABLE IF EXISTS `oc_location`;
CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_location
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_manufacturer`
-- ----------------------------
DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_manufacturer
-- ----------------------------
INSERT INTO `oc_manufacturer` VALUES ('5', 'HTC', 'catalog/demo/htc_logo.jpg', '0');
INSERT INTO `oc_manufacturer` VALUES ('6', 'Palm', 'catalog/demo/palm_logo.jpg', '0');
INSERT INTO `oc_manufacturer` VALUES ('7', 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', '0');
INSERT INTO `oc_manufacturer` VALUES ('8', 'Apple', 'catalog/demo/apple_logo.jpg', '0');
INSERT INTO `oc_manufacturer` VALUES ('9', 'Canon', 'catalog/demo/canon_logo.jpg', '0');
INSERT INTO `oc_manufacturer` VALUES ('10', 'Sony', 'catalog/demo/sony_logo.jpg', '0');

-- ----------------------------
-- Table structure for `oc_manufacturer_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_manufacturer_to_store
-- ----------------------------
INSERT INTO `oc_manufacturer_to_store` VALUES ('5', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('6', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('7', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('8', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('9', '0');
INSERT INTO `oc_manufacturer_to_store` VALUES ('10', '0');

-- ----------------------------
-- Table structure for `oc_marketing`
-- ----------------------------
DROP TABLE IF EXISTS `oc_marketing`;
CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_marketing
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_modification`
-- ----------------------------
DROP TABLE IF EXISTS `oc_modification`;
CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_modification
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_module`
-- ----------------------------
DROP TABLE IF EXISTS `oc_module`;
CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_module
-- ----------------------------
INSERT INTO `oc_module` VALUES ('30', 'Banner - Category', 'banner', 'a:5:{s:4:\"name\";s:17:\"Banner - Category\";s:9:\"banner_id\";s:1:\"6\";s:5:\"width\";s:3:\"300\";s:6:\"height\";s:3:\"300\";s:6:\"status\";s:1:\"0\";}');
INSERT INTO `oc_module` VALUES ('29', 'Carousel - Home Page', 'carousel', 'a:5:{s:4:\"name\";s:20:\"Carousel - Home Page\";s:9:\"banner_id\";s:1:\"8\";s:5:\"width\";s:3:\"130\";s:6:\"height\";s:3:\"100\";s:6:\"status\";s:1:\"1\";}');
INSERT INTO `oc_module` VALUES ('27', 'Slideshow - Home Page', 'slideshow', 'a:5:{s:4:\"name\";s:21:\"Slideshow - Home Page\";s:9:\"banner_id\";s:1:\"7\";s:5:\"width\";s:3:\"847\";s:6:\"height\";s:3:\"388\";s:6:\"status\";s:1:\"1\";}');
INSERT INTO `oc_module` VALUES ('31', 'rtr', 'slideshow', 'a:5:{s:4:\"name\";s:3:\"rtr\";s:9:\"banner_id\";s:1:\"7\";s:5:\"width\";s:2:\"12\";s:6:\"height\";s:2:\"12\";s:6:\"status\";s:1:\"0\";}');
INSERT INTO `oc_module` VALUES ('38', 'new', 'latest', 'a:5:{s:4:\"name\";s:3:\"new\";s:5:\"limit\";s:2:\"12\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}');
INSERT INTO `oc_module` VALUES ('37', 'Featured - Home Page', 'featured', 'a:6:{s:4:\"name\";s:20:\"Featured - Home Page\";s:7:\"product\";a:8:{i:0;s:2:\"30\";i:1;s:2:\"28\";i:2;s:2:\"33\";i:3;s:2:\"50\";i:4;s:2:\"41\";i:5;s:2:\"47\";i:6;s:2:\"46\";i:7;s:2:\"49\";}s:5:\"limit\";s:2:\"12\";s:5:\"width\";s:3:\"150\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}');
INSERT INTO `oc_module` VALUES ('39', 'Лучшие', 'featured', 'a:6:{s:4:\"name\";s:12:\"Лучшие\";s:7:\"product\";a:3:{i:0;s:2:\"50\";i:1;s:2:\"54\";i:2;s:2:\"53\";}s:5:\"limit\";s:3:\"100\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}');
INSERT INTO `oc_module` VALUES ('40', 'оборудование -&gt; мы рекомендуем', 'featured', 'a:6:{s:4:\"name\";s:58:\"оборудование -&gt; мы рекомендуем\";s:7:\"product\";a:2:{i:0;s:2:\"54\";i:1;s:2:\"53\";}s:5:\"limit\";s:3:\"100\";s:5:\"width\";s:3:\"200\";s:6:\"height\";s:3:\"200\";s:6:\"status\";s:1:\"1\";}');
INSERT INTO `oc_module` VALUES ('42', 'О нас', 'html', 'a:3:{s:4:\"name\";s:9:\"О нас\";s:18:\"module_description\";a:1:{i:1;a:2:{s:5:\"title\";s:9:\"О нас\";s:11:\"description\";s:2263:\"&lt;p&gt;Автонекст – входит в число лидеров по продажам автозапчастей , смазочных\r\n материалов и оборудования для автотехцентров в г. Новосибирск и \r\nНовосибирской области. Мы работаем с начала 2014 года, предоставляя \r\nсвоим клиентам только самые качественные запасные части и оборудование \r\nпо доступной цене. Клиент, который работал с нами хотя бы раз, вернется с\r\n вероятностью 99,9 %. Мы поможем найти необходимую Вам запасную часть в \r\nкратчайшие сроки, по самой выгодной цене. Даже если товара нет на нашем \r\nскладе, мы закажем его у наших поставщиков . Вы будете удивлены нашими \r\nценами при заказе деталей!позвоните нам и мы решим Вашу проблему. Работа\r\n с нами оградит Вас от некачественного, неверно подобранного товара, \r\nт.к. в нашем штате работают только опытные специалисты в сфере \r\nобслуживания автомобилей и подбора запчастей. Мы берем на себя полную \r\nответственность за применимость товара. Если Вам нужен помощник в поиске\r\n и подборе запасных частей, обратитесь к нам, мы ответственно, а главное\r\n с необходимой долей профессионализма найдем и доставим Вам запчасти. \r\nЕсли у вас нет времени и желания искать запасные части, позвоните нам, \r\nмы доставим их на дом. Принимаем наличный, безналичный расчет, перевод \r\nна банковскую карту.&lt;/p&gt;\";}}s:6:\"status\";s:1:\"1\";}');

-- ----------------------------
-- Table structure for `oc_option`
-- ----------------------------
DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option
-- ----------------------------
INSERT INTO `oc_option` VALUES ('1', 'radio', '1');
INSERT INTO `oc_option` VALUES ('2', 'checkbox', '2');
INSERT INTO `oc_option` VALUES ('4', 'text', '3');
INSERT INTO `oc_option` VALUES ('5', 'select', '4');
INSERT INTO `oc_option` VALUES ('6', 'textarea', '5');
INSERT INTO `oc_option` VALUES ('7', 'file', '6');
INSERT INTO `oc_option` VALUES ('8', 'date', '7');
INSERT INTO `oc_option` VALUES ('9', 'time', '8');
INSERT INTO `oc_option` VALUES ('10', 'datetime', '9');
INSERT INTO `oc_option` VALUES ('11', 'select', '10');
INSERT INTO `oc_option` VALUES ('12', 'date', '11');

-- ----------------------------
-- Table structure for `oc_option_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option_description
-- ----------------------------
INSERT INTO `oc_option_description` VALUES ('1', '1', 'Radio');
INSERT INTO `oc_option_description` VALUES ('2', '1', 'Checkbox');
INSERT INTO `oc_option_description` VALUES ('4', '1', 'Text');
INSERT INTO `oc_option_description` VALUES ('6', '1', 'Textarea');
INSERT INTO `oc_option_description` VALUES ('8', '1', 'Date');
INSERT INTO `oc_option_description` VALUES ('7', '1', 'File');
INSERT INTO `oc_option_description` VALUES ('5', '1', 'Select');
INSERT INTO `oc_option_description` VALUES ('9', '1', 'Time');
INSERT INTO `oc_option_description` VALUES ('10', '1', 'Date &amp; Time');
INSERT INTO `oc_option_description` VALUES ('12', '1', 'Delivery Date');
INSERT INTO `oc_option_description` VALUES ('11', '1', 'Size');

-- ----------------------------
-- Table structure for `oc_option_value`
-- ----------------------------
DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option_value
-- ----------------------------
INSERT INTO `oc_option_value` VALUES ('43', '1', '', '3');
INSERT INTO `oc_option_value` VALUES ('32', '1', '', '1');
INSERT INTO `oc_option_value` VALUES ('45', '2', '', '4');
INSERT INTO `oc_option_value` VALUES ('44', '2', '', '3');
INSERT INTO `oc_option_value` VALUES ('42', '5', '', '4');
INSERT INTO `oc_option_value` VALUES ('41', '5', '', '3');
INSERT INTO `oc_option_value` VALUES ('39', '5', '', '1');
INSERT INTO `oc_option_value` VALUES ('40', '5', '', '2');
INSERT INTO `oc_option_value` VALUES ('31', '1', '', '2');
INSERT INTO `oc_option_value` VALUES ('23', '2', '', '1');
INSERT INTO `oc_option_value` VALUES ('24', '2', '', '2');
INSERT INTO `oc_option_value` VALUES ('46', '11', '', '1');
INSERT INTO `oc_option_value` VALUES ('47', '11', '', '2');
INSERT INTO `oc_option_value` VALUES ('48', '11', '', '3');

-- ----------------------------
-- Table structure for `oc_option_value_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option_value_description
-- ----------------------------
INSERT INTO `oc_option_value_description` VALUES ('43', '1', '1', 'Large');
INSERT INTO `oc_option_value_description` VALUES ('32', '1', '1', 'Small');
INSERT INTO `oc_option_value_description` VALUES ('45', '1', '2', 'Checkbox 4');
INSERT INTO `oc_option_value_description` VALUES ('44', '1', '2', 'Checkbox 3');
INSERT INTO `oc_option_value_description` VALUES ('31', '1', '1', 'Medium');
INSERT INTO `oc_option_value_description` VALUES ('42', '1', '5', 'Yellow');
INSERT INTO `oc_option_value_description` VALUES ('41', '1', '5', 'Green');
INSERT INTO `oc_option_value_description` VALUES ('39', '1', '5', 'Red');
INSERT INTO `oc_option_value_description` VALUES ('40', '1', '5', 'Blue');
INSERT INTO `oc_option_value_description` VALUES ('23', '1', '2', 'Checkbox 1');
INSERT INTO `oc_option_value_description` VALUES ('24', '1', '2', 'Checkbox 2');
INSERT INTO `oc_option_value_description` VALUES ('48', '1', '11', 'Large');
INSERT INTO `oc_option_value_description` VALUES ('47', '1', '11', 'Medium');
INSERT INTO `oc_option_value_description` VALUES ('46', '1', '11', 'Small');

-- ----------------------------
-- Table structure for `oc_order`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order
-- ----------------------------
INSERT INTO `oc_order` VALUES ('1', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '1', '1', 'енрено', 'генген', 'tt@tt.ru', '5646757', '', 'b:0;', 'енрено', 'генген', '', '7ьарао', 'лорл', 'лроло', 'лорл', 'Российская Федерация', '176', 'Калужская область', '68', '', 'b:0;', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '133200.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-06-26 13:44:53', '2015-06-26 13:44:53');
INSERT INTO `oc_order` VALUES ('2', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '1', '1', 'енрено', 'генген', 'tt@tt.ru', '5646757', '', 'b:0;', 'енрено', 'генген', '', '7ьарао', 'лорл', 'лроло', 'лорл', 'Российская Федерация', '176', 'Калужская область', '68', '', 'b:0;', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '133200.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-06-26 13:44:58', '2015-06-26 13:45:02');
INSERT INTO `oc_order` VALUES ('3', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 13:48:01', '2015-06-26 13:48:01');
INSERT INTO `oc_order` VALUES ('4', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 13:48:03', '2015-06-26 13:48:03');
INSERT INTO `oc_order` VALUES ('5', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '1', '1', 'енрено', 'генген', 'tt@tt.ru', '5646757', '', 'b:0;', 'енрено', 'генген', '', '7ьарао', 'лорл', 'лроло', 'лорл', 'Российская Федерация', '176', 'Калужская область', '68', '', 'b:0;', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-06-26 13:58:55', '2015-06-26 13:58:55');
INSERT INTO `oc_order` VALUES ('6', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '1', '1', 'енрено', 'генген', 'tt@tt.ru', '5646757', '', 'b:0;', 'енрено', 'генген', '', '7ьарао', 'лорл', 'лроло', 'лорл', 'Российская Федерация', '176', 'Калужская область', '68', '', 'b:0;', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-06-26 13:58:57', '2015-06-26 13:59:08');
INSERT INTO `oc_order` VALUES ('7', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 14:08:55', '2015-06-26 14:08:55');
INSERT INTO `oc_order` VALUES ('8', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 14:08:56', '2015-06-26 14:08:56');
INSERT INTO `oc_order` VALUES ('9', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 14:09:21', '2015-06-26 14:09:21');
INSERT INTO `oc_order` VALUES ('10', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 14:09:23', '2015-06-26 14:09:23');
INSERT INTO `oc_order` VALUES ('11', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 14:09:43', '2015-06-26 14:09:43');
INSERT INTO `oc_order` VALUES ('12', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 14:09:45', '2015-06-26 14:09:45');
INSERT INTO `oc_order` VALUES ('13', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 14:12:08', '2015-06-26 14:12:08');
INSERT INTO `oc_order` VALUES ('14', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 14:12:09', '2015-06-26 14:12:09');
INSERT INTO `oc_order` VALUES ('15', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '1', '1', 'енрено', 'генген', 'tt@tt.ru', '5646757', '', 'b:0;', 'енрено', 'генген', '', '7ьарао', 'лорл', 'лроло', 'лорл', 'Российская Федерация', '176', 'Калужская область', '68', '', 'b:0;', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '80.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-06-26 14:19:47', '2015-06-26 14:19:47');
INSERT INTO `oc_order` VALUES ('16', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '1', '1', 'енрено', 'генген', 'tt@tt.ru', '5646757', '', 'b:0;', 'енрено', 'генген', '', '7ьарао', 'лорл', 'лроло', 'лорл', 'Российская Федерация', '176', 'Калужская область', '68', '', 'b:0;', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '80.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-06-26 14:19:50', '2015-06-26 14:19:50');
INSERT INTO `oc_order` VALUES ('17', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '1', '1', 'енрено', 'генген', 'tt@tt.ru', '5646757', '', 'b:0;', 'енрено', 'генген', '', '7ьарао', 'лорл', 'лроло', 'лорл', 'Российская Федерация', '176', 'Калужская область', '68', '', 'b:0;', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '180.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-06-26 14:35:18', '2015-06-26 14:35:18');
INSERT INTO `oc_order` VALUES ('18', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '1', '1', 'енрено', 'генген', 'tt@tt.ru', '5646757', '', 'b:0;', 'енрено', 'генген', '', '7ьарао', 'лорл', 'лроло', 'лорл', 'Российская Федерация', '176', 'Калужская область', '68', '', 'b:0;', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '180.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-06-26 14:35:21', '2015-06-26 14:35:26');
INSERT INTO `oc_order` VALUES ('19', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 14:53:18', '2015-06-26 14:53:18');
INSERT INTO `oc_order` VALUES ('20', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 14:59:57', '2015-06-26 14:59:57');
INSERT INTO `oc_order` VALUES ('21', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 15:00:14', '2015-06-26 15:00:14');
INSERT INTO `oc_order` VALUES ('22', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 15:00:32', '2015-06-26 15:00:32');
INSERT INTO `oc_order` VALUES ('23', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 15:00:52', '2015-06-26 15:00:52');
INSERT INTO `oc_order` VALUES ('24', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 15:03:51', '2015-06-26 15:03:51');
INSERT INTO `oc_order` VALUES ('25', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 15:44:56', '2015-06-26 15:44:56');
INSERT INTO `oc_order` VALUES ('26', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 15:44:59', '2015-06-26 15:44:59');
INSERT INTO `oc_order` VALUES ('27', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 15:53:58', '2015-06-26 15:53:58');
INSERT INTO `oc_order` VALUES ('28', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 15:59:46', '2015-06-26 15:59:46');
INSERT INTO `oc_order` VALUES ('29', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 15:59:52', '2015-06-26 15:59:52');
INSERT INTO `oc_order` VALUES ('30', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:02:16', '2015-06-26 16:02:16');
INSERT INTO `oc_order` VALUES ('31', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:02:18', '2015-06-26 16:02:18');
INSERT INTO `oc_order` VALUES ('32', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:04:33', '2015-06-26 16:04:33');
INSERT INTO `oc_order` VALUES ('33', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:05:26', '2015-06-26 16:05:26');
INSERT INTO `oc_order` VALUES ('34', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:05:32', '2015-06-26 16:05:32');
INSERT INTO `oc_order` VALUES ('35', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:11:55', '2015-06-26 16:11:55');
INSERT INTO `oc_order` VALUES ('36', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:12:00', '2015-06-26 16:12:00');
INSERT INTO `oc_order` VALUES ('37', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:14:58', '2015-06-26 16:14:58');
INSERT INTO `oc_order` VALUES ('38', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:15:02', '2015-06-26 16:15:02');
INSERT INTO `oc_order` VALUES ('39', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:15:52', '2015-06-26 16:15:52');
INSERT INTO `oc_order` VALUES ('40', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:17:21', '2015-06-26 16:17:21');
INSERT INTO `oc_order` VALUES ('41', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'fsdfsd', 'sdfsdf', 'ee@ffd.ru', '322245', '', 'a:0:{}', 'fsdfsd', 'sdfsdf', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:18:07', '2015-06-26 16:18:10');
INSERT INTO `oc_order` VALUES ('42', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'ццц', 'ццц', 'pozdny@mail.ru', '234234', '', 'a:0:{}', 'ццц', 'ццц', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '300.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:43:47', '2015-06-26 16:43:47');
INSERT INTO `oc_order` VALUES ('43', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'ццц', 'ццц', 'pozdny@mail.ru', '234234', '', 'a:0:{}', 'ццц', 'ццц', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '300.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:46:33', '2015-06-26 16:46:33');
INSERT INTO `oc_order` VALUES ('44', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'ццц', 'ццц', 'pozdny@mail.ru', '234234', '', 'a:0:{}', 'ццц', 'ццц', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '300.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 16:52:20', '2015-06-26 16:52:30');
INSERT INTO `oc_order` VALUES ('45', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '0', '', '', '', '', '', '', 'ццц', 'ццц', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'c', 'c', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '200.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 17:08:37', '2015-06-26 17:08:37');
INSERT INTO `oc_order` VALUES ('46', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '0', '', '', '', '', '', '', 'ццц', 'ццц', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'c', 'c', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '200.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 17:11:52', '2015-06-26 17:11:52');
INSERT INTO `oc_order` VALUES ('47', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '0', '', '', '', '', '', '', 'ццц', 'ццц', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'c', 'c', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '200.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 17:11:54', '2015-06-26 17:11:54');
INSERT INTO `oc_order` VALUES ('48', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '0', '', '', '', '', '', '', 'ццц', 'ццц', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'c', 'c', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '200.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 17:12:25', '2015-06-26 17:12:25');
INSERT INTO `oc_order` VALUES ('49', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'ttt', 'ttt', 'pozdny@mail.ru', '23423423', '', 'a:0:{}', 'ttt', 'ttt', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '200.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 17:27:27', '2015-06-26 17:27:27');
INSERT INTO `oc_order` VALUES ('50', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'ttt', 'ttt', 'pozdny@mail.ru', '23423423', '', 'a:0:{}', 'ttt', 'ttt', '', 'ghsfsh', '', 'fhgfshs', '523534', 'Российская Федерация', '176', 'Алтайский край', '50', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '200.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-06-26 17:27:31', '2015-06-26 17:27:31');
INSERT INTO `oc_order` VALUES ('51', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '2', '1', '23454', '534534', '232@vc.vx', '6567467', '', 'b:0;', '23454', '534534', 'retre', 'erterter', 'terter', 'terterte', 'tertet', 'Белоруссия (Беларусь)', '20', 'Минск', '3', '', 'b:0;', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '7280.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-06-29 16:07:59', '2015-06-29 16:07:59');
INSERT INTO `oc_order` VALUES ('52', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '2', '1', '23454', '534534', '232@vc.vx', '6567467', '', 'b:0;', '23454', '534534', 'retre', 'erterter', 'terter', 'terterte', 'tertet', 'Белоруссия (Беларусь)', '20', 'Минск', '3', '', 'b:0;', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '7280.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-06-29 16:08:04', '2015-06-29 16:08:08');
INSERT INTO `oc_order` VALUES ('53', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '2', '1', '23454', '534534', '232@vc.vx', '6567467', '', 'b:0;', '23454', '534534', 'retre', 'erterter', 'terter', 'terterte', 'tertet', 'Белоруссия (Беларусь)', '20', 'Минск', '3', '', 'b:0;', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-06-30 10:35:40', '2015-06-30 10:35:44');
INSERT INTO `oc_order` VALUES ('54', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', '333', 'default', '', '555', '', 'a:0:{}', '333', 'default', '', '', '', '', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '100.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-01 16:44:31', '2015-07-01 16:44:33');
INSERT INTO `oc_order` VALUES ('55', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'tttt', 'default', 'default', '666666', '', 'a:0:{}', 'tttt', 'default', '', '', '', '', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '500.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-01 16:46:30', '2015-07-01 16:46:32');
INSERT INTO `oc_order` VALUES ('56', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'Валентина ', 'default', 'somebody@example.com', '45667', '', 'a:0:{}', 'Валентина ', 'default', '', '', '', '', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '500.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-01 16:54:13', '2015-07-01 16:54:17');
INSERT INTO `oc_order` VALUES ('57', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'Валентина', ' ', 'somebody@example.com', '8888', '', 'a:0:{}', 'Валентина', ' ', '', '', '', '', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '500.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-01 16:56:56', '2015-07-01 16:57:01');
INSERT INTO `oc_order` VALUES ('58', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', '456', '  ', 'somebody@example.com', 'ggg', '', 'a:0:{}', '456', '  ', '', '', '', '', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '500.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-01 16:58:25', '2015-07-01 16:58:25');
INSERT INTO `oc_order` VALUES ('59', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', '456', '  ', 'somebody@example.com', 'ggg', '', 'a:0:{}', '456', '  ', '', '', '', '', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '500.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-01 16:59:34', '2015-07-01 16:59:36');
INSERT INTO `oc_order` VALUES ('60', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', '5463456', 'NoLastName', 'somebody@example.com', '34634634', '', 'a:0:{}', '5463456', 'NoLastName', '', '', '', '', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '1000.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-01 17:05:08', '2015-07-01 17:05:09');
INSERT INTO `oc_order` VALUES ('61', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'afsdf', 'noLastName', 'somebody@example.com', 'asdfsdf', '', 'a:0:{}', 'afsdf', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '500.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-01 17:07:10', '2015-07-01 17:07:11');
INSERT INTO `oc_order` VALUES ('62', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', '6566', 'noLastName', 'somebody@example.com', '654642224345', '', 'a:0:{}', '6566', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '700.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-07-03 12:18:35', '2015-07-03 12:18:39');
INSERT INTO `oc_order` VALUES ('63', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'проол', 'noLastName', 'somebody@example.com', '6456457', '', 'a:0:{}', 'проол', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '300.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-07-03 15:14:09', '2015-07-03 15:14:09');
INSERT INTO `oc_order` VALUES ('64', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'проол', 'noLastName', 'somebody@example.com', '6456457', '', 'a:0:{}', 'проол', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '300.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-07-03 15:18:09', '2015-07-03 15:18:09');
INSERT INTO `oc_order` VALUES ('65', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'проол', 'noLastName', 'somebody@example.com', '6456457', '', 'a:0:{}', 'проол', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '1500.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-07-09 16:54:25', '2015-07-09 16:54:25');
INSERT INTO `oc_order` VALUES ('66', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://openk/', '0', '1', 'имсимсимс', 'noLastName', 'somebody@example.com', '455454545', '', 'a:0:{}', 'имсимсимс', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '1500.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2015-07-09 17:20:38', '2015-07-09 17:20:38');
INSERT INTO `oc_order` VALUES ('67', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ggg', 'noLastName', 'somebody@example.com', '+7(555) 555-5555', '', 'a:0:{}', 'ggg', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '3000.0000', '0', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-16 21:14:23', '2015-07-16 21:14:23');
INSERT INTO `oc_order` VALUES ('68', '0', 'INV-2015-00', '0', 'AVTONEXTNSK - Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ппп', 'noLastName', 'somebody@example.com', '+7(555) 555-555555', '', 'a:0:{}', 'ппп', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '3000.0000', '1', '0', '0.0000', '0', '', '1', '1', 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-16 21:16:15', '2015-07-16 21:16:19');
INSERT INTO `oc_order` VALUES ('69', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'sdf', 'noLastName', 'somebody@example.com', '+7(444) 444-4444', '', 'a:0:{}', 'sdf', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '28.6000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 12:09:40', '2015-07-22 12:09:45');
INSERT INTO `oc_order` VALUES ('70', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'www', 'noLastName', 'somebody@example.com', '+7(555) 555-5555', '', 'a:0:{}', 'www', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '28.6000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 12:27:03', '2015-07-22 12:27:07');
INSERT INTO `oc_order` VALUES ('71', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'fffffffffffffff', 'noLastName', 'somebody@example.com', '+7(333) 333-3333', '', 'a:0:{}', 'fffffffffffffff', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '28.6000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 12:34:15', '2015-07-22 12:34:22');
INSERT INTO `oc_order` VALUES ('72', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'fff', 'noLastName', 'somebody@example.com', '+7(333) 333-3333', '', 'a:0:{}', 'fff', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 14:26:40', '2015-07-22 14:26:42');
INSERT INTO `oc_order` VALUES ('73', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddd', 'noLastName', 'somebody@example.com', '+7(555) 555-5555', '', 'a:0:{}', 'ddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 14:30:12', '2015-07-22 14:30:12');
INSERT INTO `oc_order` VALUES ('74', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddd', 'noLastName', 'somebody@example.com', '+7(555) 555-5555', '', 'a:0:{}', 'ddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 14:34:03', '2015-07-22 14:34:03');
INSERT INTO `oc_order` VALUES ('75', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddd', 'noLastName', 'somebody@example.com', '+7(555) 555-5555', '', 'a:0:{}', 'ddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 14:49:25', '2015-07-22 14:49:25');
INSERT INTO `oc_order` VALUES ('76', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddd', 'noLastName', 'somebody@example.com', '+7(555) 555-5555', '', 'a:0:{}', 'ddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:06:20', '2015-07-22 15:06:20');
INSERT INTO `oc_order` VALUES ('77', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddd', 'noLastName', 'somebody@example.com', '+7(555) 555-5555', '', 'a:0:{}', 'ddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:08:02', '2015-07-22 15:08:02');
INSERT INTO `oc_order` VALUES ('78', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddd', 'noLastName', 'somebody@example.com', '+7(555) 555-5555', '', 'a:0:{}', 'ddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:10:27', '2015-07-22 15:10:27');
INSERT INTO `oc_order` VALUES ('79', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddd', 'noLastName', 'somebody@example.com', '+7(555) 555-5555', '', 'a:0:{}', 'ddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:11:23', '2015-07-22 15:11:23');
INSERT INTO `oc_order` VALUES ('80', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddd', 'noLastName', 'somebody@example.com', '+7(555) 555-5555', '', 'a:0:{}', 'ddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '39.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:11:49', '2015-07-22 15:11:49');
INSERT INTO `oc_order` VALUES ('81', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddd', 'noLastName', 'somebody@example.com', '+7(555) 555-5555', '', 'a:0:{}', 'ddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '39.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:15:47', '2015-07-22 15:15:49');
INSERT INTO `oc_order` VALUES ('82', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', 'somebody@example.com', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:25:32', '2015-07-22 15:25:32');
INSERT INTO `oc_order` VALUES ('83', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:44:54', '2015-07-22 15:44:54');
INSERT INTO `oc_order` VALUES ('84', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:46:47', '2015-07-22 15:46:47');
INSERT INTO `oc_order` VALUES ('85', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', 'somebody@example.com', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:47:30', '2015-07-22 15:47:30');
INSERT INTO `oc_order` VALUES ('86', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:48:40', '2015-07-22 15:48:40');
INSERT INTO `oc_order` VALUES ('87', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:50:18', '2015-07-22 15:50:18');
INSERT INTO `oc_order` VALUES ('88', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 15:51:40', '2015-07-22 15:51:40');
INSERT INTO `oc_order` VALUES ('89', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:20:16', '2015-07-22 16:20:16');
INSERT INTO `oc_order` VALUES ('90', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:24:39', '2015-07-22 16:24:39');
INSERT INTO `oc_order` VALUES ('91', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:26:17', '2015-07-22 16:26:17');
INSERT INTO `oc_order` VALUES ('92', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:34:57', '2015-07-22 16:34:57');
INSERT INTO `oc_order` VALUES ('93', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:35:21', '2015-07-22 16:35:21');
INSERT INTO `oc_order` VALUES ('94', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:35:47', '2015-07-22 16:35:47');
INSERT INTO `oc_order` VALUES ('95', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:36:12', '2015-07-22 16:36:12');
INSERT INTO `oc_order` VALUES ('96', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:36:25', '2015-07-22 16:36:25');
INSERT INTO `oc_order` VALUES ('97', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:37:06', '2015-07-22 16:37:06');
INSERT INTO `oc_order` VALUES ('98', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:45:19', '2015-07-22 16:45:19');
INSERT INTO `oc_order` VALUES ('99', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:45:59', '2015-07-22 16:45:59');
INSERT INTO `oc_order` VALUES ('100', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', 'pozdny@mail.ru', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:46:45', '2015-07-22 16:46:45');
INSERT INTO `oc_order` VALUES ('101', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', 'pozdny@mail.ru', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:51:12', '2015-07-22 16:51:12');
INSERT INTO `oc_order` VALUES ('102', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', 'somebody@example.com', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 16:55:39', '2015-07-22 16:55:39');
INSERT INTO `oc_order` VALUES ('103', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', 'pozdny@mail.ru', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:25:17', '2015-07-22 17:25:17');
INSERT INTO `oc_order` VALUES ('104', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', 'somebody@example.com', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:25:43', '2015-07-22 17:25:43');
INSERT INTO `oc_order` VALUES ('105', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', 'somebody@example.com', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:25:59', '2015-07-22 17:25:59');
INSERT INTO `oc_order` VALUES ('106', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', 'somebody@example.com', '+7(444) 444-4444', '', 'a:0:{}', 'rrrrrrrrrrrrrrrrrrrrr', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:26:06', '2015-07-22 17:26:14');
INSERT INTO `oc_order` VALUES ('107', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddddd', 'noLastName', 'somebody@example.com', '+7-913-949-27-86', '', 'a:0:{}', 'ddddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '26.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:30:22', '2015-07-22 17:30:22');
INSERT INTO `oc_order` VALUES ('108', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddddd', 'noLastName', 'somebody@example.com', '+7(913)949-2786', '', 'a:0:{}', 'ddddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '26.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:34:53', '2015-07-22 17:34:53');
INSERT INTO `oc_order` VALUES ('109', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ddddddddddddd', 'noLastName', 'somebody@example.com', '+7(913)949-2786', '', 'a:0:{}', 'ddddddddddddd', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '26.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:36:55', '2015-07-22 17:37:03');
INSERT INTO `oc_order` VALUES ('110', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ыыыыыыыыыыы', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ыыыыыыыыыыы', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '39.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:39:53', '2015-07-22 17:39:56');
INSERT INTO `oc_order` VALUES ('111', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'qqqqq', 'noLastName', 'somebody@example.com', '+7(913)-9492786', '', 'a:0:{}', 'qqqqq', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:44:33', '2015-07-22 17:44:33');
INSERT INTO `oc_order` VALUES ('112', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'qqqqq', 'noLastName', 'somebody@example.com', '+7(913)949-2786', '', 'a:0:{}', 'qqqqq', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:45:05', '2015-07-22 17:45:17');
INSERT INTO `oc_order` VALUES ('113', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:46:19', '2015-07-22 17:46:19');
INSERT INTO `oc_order` VALUES ('114', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:47:39', '2015-07-22 17:47:39');
INSERT INTO `oc_order` VALUES ('115', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:48:05', '2015-07-22 17:48:05');
INSERT INTO `oc_order` VALUES ('116', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:48:26', '2015-07-22 17:48:26');
INSERT INTO `oc_order` VALUES ('117', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:49:02', '2015-07-22 17:49:04');
INSERT INTO `oc_order` VALUES ('118', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:57:34', '2015-07-22 17:57:36');
INSERT INTO `oc_order` VALUES ('119', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 17:59:56', '2015-07-22 17:59:57');
INSERT INTO `oc_order` VALUES ('120', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:00:24', '2015-07-22 18:00:26');
INSERT INTO `oc_order` VALUES ('121', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:01:05', '2015-07-22 18:01:05');
INSERT INTO `oc_order` VALUES ('122', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:01:44', '2015-07-22 18:01:47');
INSERT INTO `oc_order` VALUES ('123', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:02:57', '2015-07-22 18:02:57');
INSERT INTO `oc_order` VALUES ('124', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:04:07', '2015-07-22 18:04:09');
INSERT INTO `oc_order` VALUES ('125', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:04:50', '2015-07-22 18:04:53');
INSERT INTO `oc_order` VALUES ('126', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:05:56', '2015-07-22 18:06:06');
INSERT INTO `oc_order` VALUES ('127', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:06:53', '2015-07-22 18:06:54');
INSERT INTO `oc_order` VALUES ('128', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:07:16', '2015-07-22 18:07:20');
INSERT INTO `oc_order` VALUES ('129', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:08:20', '2015-07-22 18:08:22');
INSERT INTO `oc_order` VALUES ('130', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:09:08', '2015-07-22 18:09:10');
INSERT INTO `oc_order` VALUES ('131', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:09:47', '2015-07-22 18:09:48');
INSERT INTO `oc_order` VALUES ('132', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:11:34', '2015-07-22 18:11:36');
INSERT INTO `oc_order` VALUES ('133', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:14:22', '2015-07-22 18:14:28');
INSERT INTO `oc_order` VALUES ('134', '0', 'INV-2015-00', '0', 'AVTONEXTNSK &lt;br&gt;Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'ssssssssssss', 'noLastName', 'pozdny@mail.ru', '+7(913)949-2786', '', 'a:0:{}', 'ssssssssssss', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 18:20:02', '2015-07-22 18:20:11');
INSERT INTO `oc_order` VALUES ('135', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '13.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 20:40:04', '2015-07-22 20:40:04');
INSERT INTO `oc_order` VALUES ('136', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '28.6000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 20:40:46', '2015-07-22 20:40:46');
INSERT INTO `oc_order` VALUES ('137', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '44.2000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 20:41:06', '2015-07-22 20:41:13');
INSERT INTO `oc_order` VALUES ('138', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '44.2000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 20:43:15', '2015-07-22 20:43:18');
INSERT INTO `oc_order` VALUES ('139', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '44.2000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 20:46:33', '2015-07-22 20:46:35');
INSERT INTO `oc_order` VALUES ('140', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '44.2000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 20:47:32', '2015-07-22 20:47:34');
INSERT INTO `oc_order` VALUES ('141', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '44.2000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 20:54:06', '2015-07-22 20:54:08');
INSERT INTO `oc_order` VALUES ('142', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '44.2000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 20:58:47', '2015-07-22 20:58:48');
INSERT INTO `oc_order` VALUES ('143', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '44.2000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 20:59:14', '2015-07-22 20:59:18');
INSERT INTO `oc_order` VALUES ('144', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '44.2000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 21:00:27', '2015-07-22 21:00:28');
INSERT INTO `oc_order` VALUES ('145', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '44.2000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 21:01:07', '2015-07-22 21:01:08');
INSERT INTO `oc_order` VALUES ('146', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'Валентина', 'noLastName', 'pozdny@mail.ru', '+7(913) 949-2786', '', 'a:0:{}', 'Валентина', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '44.2000', '1', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-22 21:03:12', '2015-07-22 21:03:13');
INSERT INTO `oc_order` VALUES ('147', '0', 'INV-2015-00', '0', 'AVTONEXTNSK Автозапчасти от мировых брендов', 'http://autonext.dev/', '0', '1', 'sdfas', 'noLastName', 'somebody@example.com', '+7(444) 444-4444', '', 'a:0:{}', 'sdfas', 'noLastName', '', 'noAddress_1', '', 'no_City', '', 'Российская Федерация', '176', 'Новосибирская область', '90', '', 'a:0:{}', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', '', '0', '', '0', '', 'a:0:{}', '', '', '', '500.0000', '0', '0', '0.0000', '0', '', '1', '2', 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2015-07-30 09:29:13', '2015-07-30 09:29:13');

-- ----------------------------
-- Table structure for `oc_order_custom_field`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_custom_field`;
CREATE TABLE `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_custom_field
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_order_history`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_history
-- ----------------------------
INSERT INTO `oc_order_history` VALUES ('1', '2', '1', '0', '', '2015-06-26 13:45:02');
INSERT INTO `oc_order_history` VALUES ('2', '6', '1', '0', '', '2015-06-26 13:59:08');
INSERT INTO `oc_order_history` VALUES ('3', '18', '1', '0', '', '2015-06-26 14:35:26');
INSERT INTO `oc_order_history` VALUES ('4', '41', '1', '0', '', '2015-06-26 16:18:10');
INSERT INTO `oc_order_history` VALUES ('5', '44', '1', '0', '', '2015-06-26 16:52:30');
INSERT INTO `oc_order_history` VALUES ('6', '52', '1', '0', '', '2015-06-29 16:08:08');
INSERT INTO `oc_order_history` VALUES ('7', '53', '1', '0', '', '2015-06-30 10:35:44');
INSERT INTO `oc_order_history` VALUES ('8', '54', '1', '0', '', '2015-07-01 16:44:33');
INSERT INTO `oc_order_history` VALUES ('9', '55', '1', '0', '', '2015-07-01 16:46:32');
INSERT INTO `oc_order_history` VALUES ('10', '56', '1', '0', '', '2015-07-01 16:54:17');
INSERT INTO `oc_order_history` VALUES ('11', '57', '1', '0', '', '2015-07-01 16:57:01');
INSERT INTO `oc_order_history` VALUES ('12', '59', '1', '0', '', '2015-07-01 16:59:36');
INSERT INTO `oc_order_history` VALUES ('13', '60', '1', '0', '', '2015-07-01 17:05:09');
INSERT INTO `oc_order_history` VALUES ('14', '61', '1', '0', '', '2015-07-01 17:07:11');
INSERT INTO `oc_order_history` VALUES ('15', '62', '1', '0', '', '2015-07-03 12:18:39');
INSERT INTO `oc_order_history` VALUES ('16', '68', '1', '0', '', '2015-07-16 21:16:19');
INSERT INTO `oc_order_history` VALUES ('17', '69', '1', '0', '', '2015-07-22 12:09:45');
INSERT INTO `oc_order_history` VALUES ('18', '70', '1', '0', '', '2015-07-22 12:27:07');
INSERT INTO `oc_order_history` VALUES ('19', '71', '1', '0', '', '2015-07-22 12:34:22');
INSERT INTO `oc_order_history` VALUES ('20', '72', '1', '0', '', '2015-07-22 14:26:42');
INSERT INTO `oc_order_history` VALUES ('21', '81', '1', '0', '', '2015-07-22 15:15:49');
INSERT INTO `oc_order_history` VALUES ('22', '106', '1', '0', '', '2015-07-22 17:26:14');
INSERT INTO `oc_order_history` VALUES ('23', '109', '1', '0', '', '2015-07-22 17:37:03');
INSERT INTO `oc_order_history` VALUES ('24', '110', '1', '0', '', '2015-07-22 17:39:56');
INSERT INTO `oc_order_history` VALUES ('25', '112', '1', '0', '', '2015-07-22 17:45:17');
INSERT INTO `oc_order_history` VALUES ('26', '117', '1', '0', '', '2015-07-22 17:49:04');
INSERT INTO `oc_order_history` VALUES ('27', '118', '1', '0', '', '2015-07-22 17:57:36');
INSERT INTO `oc_order_history` VALUES ('28', '119', '1', '0', '', '2015-07-22 17:59:57');
INSERT INTO `oc_order_history` VALUES ('29', '120', '1', '0', '', '2015-07-22 18:00:26');
INSERT INTO `oc_order_history` VALUES ('30', '122', '1', '0', '', '2015-07-22 18:01:47');
INSERT INTO `oc_order_history` VALUES ('31', '124', '1', '0', '', '2015-07-22 18:04:09');
INSERT INTO `oc_order_history` VALUES ('32', '125', '1', '0', '', '2015-07-22 18:04:53');
INSERT INTO `oc_order_history` VALUES ('33', '126', '1', '0', '', '2015-07-22 18:06:06');
INSERT INTO `oc_order_history` VALUES ('34', '127', '1', '0', '', '2015-07-22 18:06:54');
INSERT INTO `oc_order_history` VALUES ('35', '128', '1', '0', '', '2015-07-22 18:07:20');
INSERT INTO `oc_order_history` VALUES ('36', '129', '1', '0', '', '2015-07-22 18:08:22');
INSERT INTO `oc_order_history` VALUES ('37', '130', '1', '0', '', '2015-07-22 18:09:10');
INSERT INTO `oc_order_history` VALUES ('38', '131', '1', '0', '', '2015-07-22 18:09:48');
INSERT INTO `oc_order_history` VALUES ('39', '132', '1', '0', '', '2015-07-22 18:11:36');
INSERT INTO `oc_order_history` VALUES ('40', '133', '1', '0', '', '2015-07-22 18:14:28');
INSERT INTO `oc_order_history` VALUES ('41', '134', '1', '0', '', '2015-07-22 18:20:11');
INSERT INTO `oc_order_history` VALUES ('42', '137', '1', '0', '', '2015-07-22 20:41:13');
INSERT INTO `oc_order_history` VALUES ('43', '138', '1', '0', '', '2015-07-22 20:43:18');
INSERT INTO `oc_order_history` VALUES ('44', '139', '1', '0', '', '2015-07-22 20:46:35');
INSERT INTO `oc_order_history` VALUES ('45', '140', '1', '0', '', '2015-07-22 20:47:34');
INSERT INTO `oc_order_history` VALUES ('46', '141', '1', '0', '', '2015-07-22 20:54:08');
INSERT INTO `oc_order_history` VALUES ('47', '142', '1', '0', '', '2015-07-22 20:58:48');
INSERT INTO `oc_order_history` VALUES ('48', '143', '1', '0', '', '2015-07-22 20:59:18');
INSERT INTO `oc_order_history` VALUES ('49', '144', '1', '0', '', '2015-07-22 21:00:28');
INSERT INTO `oc_order_history` VALUES ('50', '145', '1', '0', '', '2015-07-22 21:01:08');
INSERT INTO `oc_order_history` VALUES ('51', '146', '1', '0', '', '2015-07-22 21:03:13');

-- ----------------------------
-- Table structure for `oc_order_option`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_option
-- ----------------------------
INSERT INTO `oc_order_option` VALUES ('1', '15', '15', '226', '15', 'Select', 'Red', 'select');
INSERT INTO `oc_order_option` VALUES ('2', '16', '16', '226', '15', 'Select', 'Red', 'select');
INSERT INTO `oc_order_option` VALUES ('3', '17', '17', '226', '15', 'Select', 'Red', 'select');
INSERT INTO `oc_order_option` VALUES ('4', '17', '18', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('5', '18', '19', '226', '15', 'Select', 'Red', 'select');
INSERT INTO `oc_order_option` VALUES ('6', '18', '20', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('7', '19', '21', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('8', '20', '22', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('9', '21', '23', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('10', '22', '24', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('11', '23', '25', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('12', '24', '26', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('13', '25', '27', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('14', '26', '28', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('15', '27', '29', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('16', '28', '30', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('17', '29', '31', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('18', '30', '32', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('19', '31', '33', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('20', '32', '34', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('21', '33', '35', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('22', '34', '36', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('23', '35', '37', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('24', '36', '38', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('25', '37', '39', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('26', '38', '40', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('27', '39', '41', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('28', '40', '42', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('29', '41', '43', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('30', '42', '45', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('31', '43', '47', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('32', '44', '49', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('33', '51', '56', '226', '15', 'Select', 'Red', 'select');
INSERT INTO `oc_order_option` VALUES ('34', '51', '57', '225', '0', 'Delivery Date', '2011-04-22', 'date');
INSERT INTO `oc_order_option` VALUES ('35', '52', '62', '226', '15', 'Select', 'Red', 'select');
INSERT INTO `oc_order_option` VALUES ('36', '52', '63', '225', '0', 'Delivery Date', '2011-04-22', 'date');

-- ----------------------------
-- Table structure for `oc_order_product`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_product
-- ----------------------------
INSERT INTO `oc_order_product` VALUES ('1', '1', '33', 'Масло LL', 'Product 6', '666', '200.0000', '133200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('2', '2', '33', 'Масло LL', 'Product 6', '666', '200.0000', '133200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('3', '3', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('4', '4', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('5', '5', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('6', '6', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('7', '7', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('8', '8', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('9', '9', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('10', '10', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('11', '11', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('12', '12', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('13', '13', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('14', '14', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('15', '15', '30', 'Масло', 'Product 3', '1', '80.0000', '80.0000', '18.0000', '200');
INSERT INTO `oc_order_product` VALUES ('16', '16', '30', 'Масло', 'Product 3', '1', '80.0000', '80.0000', '18.0000', '200');
INSERT INTO `oc_order_product` VALUES ('17', '17', '30', 'Масло', 'Product 3', '1', '80.0000', '80.0000', '18.0000', '200');
INSERT INTO `oc_order_product` VALUES ('18', '17', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('19', '18', '30', 'Масло', 'Product 3', '1', '80.0000', '80.0000', '18.0000', '200');
INSERT INTO `oc_order_product` VALUES ('20', '18', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('21', '19', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('22', '20', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('23', '21', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('24', '22', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('25', '23', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('26', '24', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('27', '25', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('28', '26', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('29', '27', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('30', '28', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('31', '29', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('32', '30', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('33', '31', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('34', '32', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('35', '33', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('36', '34', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('37', '35', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('38', '36', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('39', '37', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('40', '38', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('41', '39', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('42', '40', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('43', '41', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('44', '42', '41', 'Масло GG', 'Product 14', '2', '100.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('45', '42', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('46', '43', '41', 'Масло GG', 'Product 14', '2', '100.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('47', '43', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('48', '44', '41', 'Масло GG', 'Product 14', '2', '100.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('49', '44', '47', 'Масло DD', 'Product 21', '1', '100.0000', '100.0000', '18.0000', '300');
INSERT INTO `oc_order_product` VALUES ('50', '45', '41', 'Масло GG', 'Product 14', '2', '100.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('51', '46', '41', 'Масло GG', 'Product 14', '2', '100.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('52', '47', '41', 'Масло GG', 'Product 14', '2', '100.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('53', '48', '41', 'Масло GG', 'Product 14', '2', '100.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('54', '49', '41', 'Масло GG', 'Product 14', '2', '100.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('55', '50', '41', 'Масло GG', 'Product 14', '2', '100.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('56', '51', '30', 'Масло', 'Product 3', '1', '80.0000', '80.0000', '18.0000', '200');
INSERT INTO `oc_order_product` VALUES ('57', '51', '47', 'Масло DD', 'Product 21', '3', '100.0000', '300.0000', '18.0000', '900');
INSERT INTO `oc_order_product` VALUES ('58', '51', '41', 'Масло GG', 'Product 14', '20', '100.0000', '2000.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('59', '51', '33', 'Масло LL', 'Product 6', '2', '200.0000', '400.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('60', '51', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('61', '51', '46', 'Масло UU', 'Product 19', '4', '1000.0000', '4000.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('62', '52', '30', 'Масло', 'Product 3', '1', '80.0000', '80.0000', '18.0000', '200');
INSERT INTO `oc_order_product` VALUES ('63', '52', '47', 'Масло DD', 'Product 21', '3', '100.0000', '300.0000', '18.0000', '900');
INSERT INTO `oc_order_product` VALUES ('64', '52', '41', 'Масло GG', 'Product 14', '20', '100.0000', '2000.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('65', '52', '33', 'Масло LL', 'Product 6', '2', '200.0000', '400.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('66', '52', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('67', '52', '46', 'Масло UU', 'Product 19', '4', '1000.0000', '4000.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('68', '53', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('69', '54', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('70', '55', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('71', '56', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('72', '57', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('73', '58', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('74', '59', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('75', '60', '46', 'Масло UU', 'Product 19', '1', '1000.0000', '1000.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('76', '61', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('77', '62', '33', 'Масло LL', 'Product 6', '1', '200.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('78', '62', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('79', '63', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('80', '63', '33', 'Масло LL', 'Product 6', '1', '200.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('81', '64', '28', 'Масло RR', 'Product 1', '1', '100.0000', '100.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('82', '64', '33', 'Масло LL', 'Product 6', '1', '200.0000', '200.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('83', '65', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('84', '65', '46', 'Масло UU', 'Product 19', '1', '1000.0000', '1000.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('85', '66', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('86', '66', '46', 'Масло UU', 'Product 19', '1', '1000.0000', '1000.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('87', '67', '41', 'Масло GG', 'Product 14', '2', '1500.0000', '3000.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('88', '68', '41', 'Масло GG', 'Product 14', '2', '1500.0000', '3000.0000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('89', '69', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('90', '69', '33', 'Масло LL', 'Product 6', '1', '15.6000', '15.6000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('91', '70', '33', 'Масло LL', 'Product 6', '1', '15.6000', '15.6000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('92', '70', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('93', '71', '33', 'Масло LL', 'Product 6', '1', '15.6000', '15.6000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('94', '71', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('95', '72', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('96', '73', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('97', '74', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('98', '75', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('99', '76', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('100', '77', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('101', '78', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('102', '79', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('103', '80', '28', 'Масло RR', 'Product 1', '3', '13.0000', '39.0000', '18.0000', '1200');
INSERT INTO `oc_order_product` VALUES ('104', '81', '28', 'Масло RR', 'Product 1', '3', '13.0000', '39.0000', '18.0000', '1200');
INSERT INTO `oc_order_product` VALUES ('105', '82', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('106', '83', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('107', '84', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('108', '85', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('109', '86', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('110', '87', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('111', '88', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('112', '89', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('113', '90', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('114', '91', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('115', '92', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('116', '93', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('117', '94', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('118', '95', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('119', '96', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('120', '97', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('121', '98', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('122', '99', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('123', '100', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('124', '101', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('125', '102', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('126', '103', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('127', '104', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('128', '105', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('129', '106', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('130', '107', '28', 'Масло RR', 'Product 1', '2', '13.0000', '26.0000', '18.0000', '800');
INSERT INTO `oc_order_product` VALUES ('131', '108', '28', 'Масло RR', 'Product 1', '2', '13.0000', '26.0000', '18.0000', '800');
INSERT INTO `oc_order_product` VALUES ('132', '109', '28', 'Масло RR', 'Product 1', '2', '13.0000', '26.0000', '18.0000', '800');
INSERT INTO `oc_order_product` VALUES ('133', '110', '28', 'Масло RR', 'Product 1', '3', '13.0000', '39.0000', '18.0000', '1200');
INSERT INTO `oc_order_product` VALUES ('134', '111', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('135', '112', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('136', '113', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('137', '114', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('138', '115', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('139', '116', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('140', '117', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('141', '118', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('142', '119', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('143', '120', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('144', '121', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('145', '122', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('146', '123', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('147', '124', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('148', '125', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('149', '126', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('150', '127', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('151', '128', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('152', '129', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('153', '130', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('154', '131', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('155', '132', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('156', '133', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('157', '134', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('158', '135', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('159', '136', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('160', '136', '33', 'Масло LL', 'Product 6', '1', '15.6000', '15.6000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('161', '137', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('162', '137', '33', 'Масло LL', 'Product 6', '2', '15.6000', '31.2000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('163', '138', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('164', '138', '33', 'Масло LL', 'Product 6', '2', '15.6000', '31.2000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('165', '139', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('166', '139', '33', 'Масло LL', 'Product 6', '2', '15.6000', '31.2000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('167', '140', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('168', '140', '33', 'Масло LL', 'Product 6', '2', '15.6000', '31.2000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('169', '141', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('170', '141', '33', 'Масло LL', 'Product 6', '2', '15.6000', '31.2000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('171', '142', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('172', '142', '33', 'Масло LL', 'Product 6', '2', '15.6000', '31.2000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('173', '143', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('174', '143', '33', 'Масло LL', 'Product 6', '2', '15.6000', '31.2000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('175', '144', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('176', '144', '33', 'Масло LL', 'Product 6', '2', '15.6000', '31.2000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('177', '145', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('178', '145', '33', 'Масло LL', 'Product 6', '2', '15.6000', '31.2000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('179', '146', '28', 'Масло RR', 'Product 1', '1', '13.0000', '13.0000', '18.0000', '400');
INSERT INTO `oc_order_product` VALUES ('180', '146', '33', 'Масло LL', 'Product 6', '2', '15.6000', '31.2000', '18.0000', '0');
INSERT INTO `oc_order_product` VALUES ('181', '147', '50', 'Масло FF', 'подсолнечное', '1', '500.0000', '500.0000', '0.0000', '0');

-- ----------------------------
-- Table structure for `oc_order_recurring`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_recurring`;
CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_recurring
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_order_recurring_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_recurring_transaction`;
CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_recurring_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_order_status`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_status
-- ----------------------------
INSERT INTO `oc_order_status` VALUES ('1', '1', 'Ожидание');
INSERT INTO `oc_order_status` VALUES ('2', '1', 'В обработке');
INSERT INTO `oc_order_status` VALUES ('3', '1', 'Доставлено');
INSERT INTO `oc_order_status` VALUES ('7', '1', 'Отменено');
INSERT INTO `oc_order_status` VALUES ('5', '1', 'Сделка завершена');
INSERT INTO `oc_order_status` VALUES ('8', '1', 'Возврат');
INSERT INTO `oc_order_status` VALUES ('9', '1', 'Отмена и аннулирование');
INSERT INTO `oc_order_status` VALUES ('10', '1', 'Неудавшийся');
INSERT INTO `oc_order_status` VALUES ('11', '1', 'Возмещенный');
INSERT INTO `oc_order_status` VALUES ('12', '1', 'Полностью измененный');
INSERT INTO `oc_order_status` VALUES ('13', '1', 'Полный возврат');

-- ----------------------------
-- Table structure for `oc_order_total`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_total
-- ----------------------------
INSERT INTO `oc_order_total` VALUES ('1', '1', 'sub_total', 'Сумма', '133200.0000', '1');
INSERT INTO `oc_order_total` VALUES ('2', '1', 'total', 'Итого', '133200.0000', '9');
INSERT INTO `oc_order_total` VALUES ('3', '2', 'sub_total', 'Сумма', '133200.0000', '1');
INSERT INTO `oc_order_total` VALUES ('4', '2', 'total', 'Итого', '133200.0000', '9');
INSERT INTO `oc_order_total` VALUES ('5', '3', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('6', '3', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('7', '4', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('8', '4', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('9', '5', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('10', '5', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('11', '6', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('12', '6', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('13', '7', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('14', '7', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('15', '8', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('16', '8', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('17', '9', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('18', '9', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('19', '10', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('20', '10', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('21', '11', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('22', '11', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('23', '12', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('24', '12', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('25', '13', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('26', '13', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('27', '14', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('28', '14', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('29', '15', 'sub_total', 'Сумма', '80.0000', '1');
INSERT INTO `oc_order_total` VALUES ('30', '15', 'total', 'Итого', '80.0000', '9');
INSERT INTO `oc_order_total` VALUES ('31', '16', 'sub_total', 'Сумма', '80.0000', '1');
INSERT INTO `oc_order_total` VALUES ('32', '16', 'total', 'Итого', '80.0000', '9');
INSERT INTO `oc_order_total` VALUES ('33', '17', 'sub_total', 'Сумма', '180.0000', '1');
INSERT INTO `oc_order_total` VALUES ('34', '17', 'total', 'Итого', '180.0000', '9');
INSERT INTO `oc_order_total` VALUES ('35', '18', 'sub_total', 'Сумма', '180.0000', '1');
INSERT INTO `oc_order_total` VALUES ('36', '18', 'total', 'Итого', '180.0000', '9');
INSERT INTO `oc_order_total` VALUES ('37', '19', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('38', '19', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('39', '20', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('40', '20', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('41', '21', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('42', '21', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('43', '22', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('44', '22', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('45', '23', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('46', '23', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('47', '24', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('48', '24', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('49', '25', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('50', '25', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('51', '26', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('52', '26', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('53', '27', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('54', '27', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('55', '28', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('56', '28', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('57', '29', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('58', '29', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('59', '30', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('60', '30', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('61', '31', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('62', '31', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('63', '32', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('64', '32', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('65', '33', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('66', '33', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('67', '34', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('68', '34', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('69', '35', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('70', '35', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('71', '36', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('72', '36', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('73', '37', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('74', '37', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('75', '38', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('76', '38', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('77', '39', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('78', '39', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('79', '40', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('80', '40', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('81', '41', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('82', '41', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('83', '42', 'sub_total', 'Сумма', '300.0000', '1');
INSERT INTO `oc_order_total` VALUES ('84', '42', 'total', 'Итого', '300.0000', '9');
INSERT INTO `oc_order_total` VALUES ('85', '43', 'sub_total', 'Сумма', '300.0000', '1');
INSERT INTO `oc_order_total` VALUES ('86', '43', 'total', 'Итого', '300.0000', '9');
INSERT INTO `oc_order_total` VALUES ('87', '44', 'sub_total', 'Сумма', '300.0000', '1');
INSERT INTO `oc_order_total` VALUES ('88', '44', 'total', 'Итого', '300.0000', '9');
INSERT INTO `oc_order_total` VALUES ('89', '45', 'sub_total', 'Сумма', '200.0000', '1');
INSERT INTO `oc_order_total` VALUES ('90', '45', 'total', 'Итого', '200.0000', '9');
INSERT INTO `oc_order_total` VALUES ('91', '46', 'sub_total', 'Сумма', '200.0000', '1');
INSERT INTO `oc_order_total` VALUES ('92', '46', 'total', 'Итого', '200.0000', '9');
INSERT INTO `oc_order_total` VALUES ('93', '47', 'sub_total', 'Сумма', '200.0000', '1');
INSERT INTO `oc_order_total` VALUES ('94', '47', 'total', 'Итого', '200.0000', '9');
INSERT INTO `oc_order_total` VALUES ('95', '48', 'sub_total', 'Сумма', '200.0000', '1');
INSERT INTO `oc_order_total` VALUES ('96', '48', 'total', 'Итого', '200.0000', '9');
INSERT INTO `oc_order_total` VALUES ('97', '49', 'sub_total', 'Сумма', '200.0000', '1');
INSERT INTO `oc_order_total` VALUES ('98', '49', 'total', 'Итого', '200.0000', '9');
INSERT INTO `oc_order_total` VALUES ('99', '50', 'sub_total', 'Сумма', '200.0000', '1');
INSERT INTO `oc_order_total` VALUES ('100', '50', 'total', 'Итого', '200.0000', '9');
INSERT INTO `oc_order_total` VALUES ('101', '51', 'sub_total', 'Сумма', '7280.0000', '1');
INSERT INTO `oc_order_total` VALUES ('102', '51', 'total', 'Итого', '7280.0000', '9');
INSERT INTO `oc_order_total` VALUES ('103', '52', 'sub_total', 'Сумма', '7280.0000', '1');
INSERT INTO `oc_order_total` VALUES ('104', '52', 'total', 'Итого', '7280.0000', '9');
INSERT INTO `oc_order_total` VALUES ('105', '53', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('106', '53', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('107', '54', 'sub_total', 'Сумма', '100.0000', '1');
INSERT INTO `oc_order_total` VALUES ('108', '54', 'total', 'Итого', '100.0000', '9');
INSERT INTO `oc_order_total` VALUES ('109', '55', 'sub_total', 'Сумма', '500.0000', '1');
INSERT INTO `oc_order_total` VALUES ('110', '55', 'total', 'Итого', '500.0000', '9');
INSERT INTO `oc_order_total` VALUES ('111', '56', 'sub_total', 'Сумма', '500.0000', '1');
INSERT INTO `oc_order_total` VALUES ('112', '56', 'total', 'Итого', '500.0000', '9');
INSERT INTO `oc_order_total` VALUES ('113', '57', 'sub_total', 'Сумма', '500.0000', '1');
INSERT INTO `oc_order_total` VALUES ('114', '57', 'total', 'Итого', '500.0000', '9');
INSERT INTO `oc_order_total` VALUES ('115', '58', 'sub_total', 'Сумма', '500.0000', '1');
INSERT INTO `oc_order_total` VALUES ('116', '58', 'total', 'Итого', '500.0000', '9');
INSERT INTO `oc_order_total` VALUES ('117', '59', 'sub_total', 'Сумма', '500.0000', '1');
INSERT INTO `oc_order_total` VALUES ('118', '59', 'total', 'Итого', '500.0000', '9');
INSERT INTO `oc_order_total` VALUES ('119', '60', 'sub_total', 'Сумма', '1000.0000', '1');
INSERT INTO `oc_order_total` VALUES ('120', '60', 'total', 'Итого', '1000.0000', '9');
INSERT INTO `oc_order_total` VALUES ('121', '61', 'sub_total', 'Сумма', '500.0000', '1');
INSERT INTO `oc_order_total` VALUES ('122', '61', 'total', 'Итого', '500.0000', '9');
INSERT INTO `oc_order_total` VALUES ('123', '62', 'sub_total', 'Сумма', '700.0000', '1');
INSERT INTO `oc_order_total` VALUES ('124', '62', 'total', 'Итого', '700.0000', '9');
INSERT INTO `oc_order_total` VALUES ('125', '63', 'sub_total', 'Сумма', '300.0000', '1');
INSERT INTO `oc_order_total` VALUES ('126', '63', 'total', 'Итого', '300.0000', '9');
INSERT INTO `oc_order_total` VALUES ('127', '64', 'sub_total', 'Сумма', '300.0000', '1');
INSERT INTO `oc_order_total` VALUES ('128', '64', 'total', 'Итого', '300.0000', '9');
INSERT INTO `oc_order_total` VALUES ('129', '65', 'sub_total', 'Сумма', '1500.0000', '1');
INSERT INTO `oc_order_total` VALUES ('130', '65', 'total', 'Итого', '1500.0000', '9');
INSERT INTO `oc_order_total` VALUES ('131', '66', 'sub_total', 'Сумма', '1500.0000', '1');
INSERT INTO `oc_order_total` VALUES ('132', '66', 'total', 'Итого', '1500.0000', '9');
INSERT INTO `oc_order_total` VALUES ('133', '67', 'sub_total', 'Сумма', '3000.0000', '1');
INSERT INTO `oc_order_total` VALUES ('134', '67', 'total', 'Итого', '3000.0000', '9');
INSERT INTO `oc_order_total` VALUES ('135', '68', 'sub_total', 'Сумма', '3000.0000', '1');
INSERT INTO `oc_order_total` VALUES ('136', '68', 'total', 'Итого', '3000.0000', '9');
INSERT INTO `oc_order_total` VALUES ('137', '69', 'sub_total', 'Сумма', '28.6000', '1');
INSERT INTO `oc_order_total` VALUES ('138', '69', 'total', 'Итого', '28.6000', '9');
INSERT INTO `oc_order_total` VALUES ('139', '70', 'sub_total', 'Сумма', '28.6000', '1');
INSERT INTO `oc_order_total` VALUES ('140', '70', 'total', 'Итого', '28.6000', '9');
INSERT INTO `oc_order_total` VALUES ('141', '71', 'sub_total', 'Сумма', '28.6000', '1');
INSERT INTO `oc_order_total` VALUES ('142', '71', 'total', 'Итого', '28.6000', '9');
INSERT INTO `oc_order_total` VALUES ('143', '72', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('144', '72', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('145', '73', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('146', '73', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('147', '74', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('148', '74', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('149', '75', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('150', '75', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('151', '76', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('152', '76', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('153', '77', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('154', '77', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('155', '78', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('156', '78', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('157', '79', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('158', '79', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('159', '80', 'sub_total', 'Сумма', '39.0000', '1');
INSERT INTO `oc_order_total` VALUES ('160', '80', 'total', 'Итого', '39.0000', '9');
INSERT INTO `oc_order_total` VALUES ('161', '81', 'sub_total', 'Сумма', '39.0000', '1');
INSERT INTO `oc_order_total` VALUES ('162', '81', 'total', 'Итого', '39.0000', '9');
INSERT INTO `oc_order_total` VALUES ('163', '82', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('164', '82', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('165', '83', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('166', '83', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('167', '84', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('168', '84', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('169', '85', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('170', '85', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('171', '86', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('172', '86', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('173', '87', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('174', '87', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('175', '88', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('176', '88', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('177', '89', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('178', '89', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('179', '90', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('180', '90', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('181', '91', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('182', '91', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('183', '92', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('184', '92', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('185', '93', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('186', '93', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('187', '94', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('188', '94', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('189', '95', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('190', '95', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('191', '96', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('192', '96', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('193', '97', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('194', '97', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('195', '98', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('196', '98', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('197', '99', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('198', '99', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('199', '100', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('200', '100', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('201', '101', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('202', '101', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('203', '102', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('204', '102', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('205', '103', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('206', '103', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('207', '104', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('208', '104', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('209', '105', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('210', '105', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('211', '106', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('212', '106', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('213', '107', 'sub_total', 'Сумма', '26.0000', '1');
INSERT INTO `oc_order_total` VALUES ('214', '107', 'total', 'Итого', '26.0000', '9');
INSERT INTO `oc_order_total` VALUES ('215', '108', 'sub_total', 'Сумма', '26.0000', '1');
INSERT INTO `oc_order_total` VALUES ('216', '108', 'total', 'Итого', '26.0000', '9');
INSERT INTO `oc_order_total` VALUES ('217', '109', 'sub_total', 'Сумма', '26.0000', '1');
INSERT INTO `oc_order_total` VALUES ('218', '109', 'total', 'Итого', '26.0000', '9');
INSERT INTO `oc_order_total` VALUES ('219', '110', 'sub_total', 'Сумма', '39.0000', '1');
INSERT INTO `oc_order_total` VALUES ('220', '110', 'total', 'Итого', '39.0000', '9');
INSERT INTO `oc_order_total` VALUES ('221', '111', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('222', '111', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('223', '112', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('224', '112', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('225', '113', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('226', '113', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('227', '114', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('228', '114', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('229', '115', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('230', '115', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('231', '116', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('232', '116', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('233', '117', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('234', '117', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('235', '118', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('236', '118', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('237', '119', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('238', '119', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('239', '120', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('240', '120', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('241', '121', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('242', '121', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('243', '122', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('244', '122', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('245', '123', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('246', '123', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('247', '124', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('248', '124', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('249', '125', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('250', '125', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('251', '126', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('252', '126', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('253', '127', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('254', '127', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('255', '128', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('256', '128', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('257', '129', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('258', '129', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('259', '130', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('260', '130', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('261', '131', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('262', '131', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('263', '132', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('264', '132', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('265', '133', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('266', '133', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('267', '134', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('268', '134', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('269', '135', 'sub_total', 'Сумма', '13.0000', '1');
INSERT INTO `oc_order_total` VALUES ('270', '135', 'total', 'Итого', '13.0000', '9');
INSERT INTO `oc_order_total` VALUES ('271', '136', 'sub_total', 'Сумма', '28.6000', '1');
INSERT INTO `oc_order_total` VALUES ('272', '136', 'total', 'Итого', '28.6000', '9');
INSERT INTO `oc_order_total` VALUES ('273', '137', 'sub_total', 'Сумма', '44.2000', '1');
INSERT INTO `oc_order_total` VALUES ('274', '137', 'total', 'Итого', '44.2000', '9');
INSERT INTO `oc_order_total` VALUES ('275', '138', 'sub_total', 'Сумма', '44.2000', '1');
INSERT INTO `oc_order_total` VALUES ('276', '138', 'total', 'Итого', '44.2000', '9');
INSERT INTO `oc_order_total` VALUES ('277', '139', 'sub_total', 'Сумма', '44.2000', '1');
INSERT INTO `oc_order_total` VALUES ('278', '139', 'total', 'Итого', '44.2000', '9');
INSERT INTO `oc_order_total` VALUES ('279', '140', 'sub_total', 'Сумма', '44.2000', '1');
INSERT INTO `oc_order_total` VALUES ('280', '140', 'total', 'Итого', '44.2000', '9');
INSERT INTO `oc_order_total` VALUES ('281', '141', 'sub_total', 'Сумма', '44.2000', '1');
INSERT INTO `oc_order_total` VALUES ('282', '141', 'total', 'Итого', '44.2000', '9');
INSERT INTO `oc_order_total` VALUES ('283', '142', 'sub_total', 'Сумма', '44.2000', '1');
INSERT INTO `oc_order_total` VALUES ('284', '142', 'total', 'Итого', '44.2000', '9');
INSERT INTO `oc_order_total` VALUES ('285', '143', 'sub_total', 'Сумма', '44.2000', '1');
INSERT INTO `oc_order_total` VALUES ('286', '143', 'total', 'Итого', '44.2000', '9');
INSERT INTO `oc_order_total` VALUES ('287', '144', 'sub_total', 'Сумма', '44.2000', '1');
INSERT INTO `oc_order_total` VALUES ('288', '144', 'total', 'Итого', '44.2000', '9');
INSERT INTO `oc_order_total` VALUES ('289', '145', 'sub_total', 'Сумма', '44.2000', '1');
INSERT INTO `oc_order_total` VALUES ('290', '145', 'total', 'Итого', '44.2000', '9');
INSERT INTO `oc_order_total` VALUES ('291', '146', 'sub_total', 'Сумма', '44.2000', '1');
INSERT INTO `oc_order_total` VALUES ('292', '146', 'total', 'Итого', '44.2000', '9');
INSERT INTO `oc_order_total` VALUES ('293', '147', 'sub_total', 'Сумма', '500.0000', '1');
INSERT INTO `oc_order_total` VALUES ('294', '147', 'total', 'Итого', '500.0000', '9');

-- ----------------------------
-- Table structure for `oc_order_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_opt` decimal(15,4) NOT NULL,
  `price_opt_big` decimal(15,4) NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product
-- ----------------------------
INSERT INTO `oc_product` VALUES ('28', 'Product 1', '', '', '', '', '', '', '', '939', '7', 'catalog/b_23943G-Energy.jpg', '5', '1', '13.0000', '11.5000', '10.0000', '0', '9', '2009-02-03', '146.40000000', '2', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '0', '1', '134', '2009-02-03 16:06:50', '2015-07-22 11:28:49');
INSERT INTO `oc_product` VALUES ('51', 'еуке5', '', '', '', '', '', '', '', '1', '7', '', '0', '1', '0.0000', '0.0000', '0.0000', '0', '0', '2015-07-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-07-03 17:03:17', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('33', 'Product 6', '', '', '', '', '', '', '', '1000', '6', 'catalog/b_23943G-Energy.jpg', '0', '1', '15.6000', '13.8000', '12.0000', '0', '9', '2009-02-03', '5.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '2', '1', '1', '0', '1', '173', '2009-02-03 17:08:31', '2015-07-22 12:08:17');
INSERT INTO `oc_product` VALUES ('41', 'Product 14', '', '', '', '', '', '', '', '977', '5', 'catalog/b_23943G-Energy.jpg', '8', '1', '19.5000', '17.2500', '15.0000', '0', '9', '2009-02-03', '5.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '2', '0', '1', '81', '2009-02-03 21:07:26', '2015-07-22 12:05:46');
INSERT INTO `oc_product` VALUES ('46', 'Product 19', '', '', '', '', '', '', '', '1000', '5', 'catalog/b_23943G-Energy.jpg', '10', '1', '0.0000', '0.0000', '222.0000', '0', '9', '2009-02-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '2', '1', '1', '0', '1', '26', '2009-02-03 21:08:29', '2015-07-15 14:15:21');
INSERT INTO `oc_product` VALUES ('47', 'Product 21', '', '', '', '', '', '', '', '1000', '7', 'catalog/b_23943G-Energy.jpg', '7', '1', '20.8000', '18.4000', '16.0000', '0', '9', '2009-02-03', '1.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '3', '0', '1', '148', '2009-02-03 21:08:40', '2015-07-22 12:06:41');
INSERT INTO `oc_product` VALUES ('49', 'SAM1', '', '', '', '', '', '', '', '0', '8', 'catalog/b_23943G-Energy.jpg', '0', '1', '0.0000', '0.0000', '100.0000', '0', '9', '2011-04-25', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '48', '2011-04-26 08:57:34', '2015-07-16 22:58:58');
INSERT INTO `oc_product` VALUES ('50', 'подсолнечное', '', '', '', '', '', '', '', '1', '7', 'catalog/b_23943G-Energy.jpg', '0', '1', '500.0000', '0.0000', '0.0000', '0', '0', '2015-06-25', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '26', '2015-06-25 14:25:21', '2015-07-16 21:08:10');
INSERT INTO `oc_product` VALUES ('52', 'кенкенке', '', '', '', '', '', '', '', '1', '7', '', '0', '1', '0.0000', '0.0000', '1.0000', '0', '0', '2015-07-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '11', '2015-07-03 17:04:20', '2015-07-20 14:24:44');
INSERT INTO `oc_product` VALUES ('53', '75676737', '', '', '', '', '', '', '', '1', '7', '', '0', '1', '0.0000', '6757657.0000', '75675.0000', '0', '0', '2015-07-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-07-03 17:05:48', '2015-07-16 22:51:58');
INSERT INTO `oc_product` VALUES ('54', '333333', '', '', '', '', '', '', '', '1', '7', 'catalog/4444.jpg', '0', '1', '6.5000', '5.7500', '5.0000', '0', '0', '2015-07-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-07-03 17:30:14', '2015-08-07 16:07:44');
INSERT INTO `oc_product` VALUES ('55', '645654654', '', '', '', '', '', '', '', '1', '7', '', '0', '1', '0.0000', '0.0000', '0.0000', '0', '0', '2015-07-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-07-03 17:32:34', '2015-07-16 22:52:37');
INSERT INTO `oc_product` VALUES ('56', 'Model 444', '', '', '', '', '', '', '', '1', '7', '', '0', '1', '0.0000', '0.0000', '0.0000', '0', '0', '2015-07-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-07-03 17:36:05', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('57', 'енгенгенг', '', '', '', '', '', '', '', '1', '7', '', '0', '1', '0.0000', '0.0000', '0.0000', '0', '0', '2015-07-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-07-03 17:37:12', '2015-07-06 16:29:48');
INSERT INTO `oc_product` VALUES ('58', 'нкенкенкен', '', '', '', '', '', '', '', '1', '7', '', '0', '1', '0.0000', '0.0000', '0.0000', '0', '0', '2015-07-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '0', '2015-07-03 17:38:45', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('59', 'нкенкенкен', '', '', '', '', '', '', '56456', '1', '7', '', '0', '1', '64564.0000', '6546.0000', '0.0000', '0', '0', '2015-07-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2', '2015-07-03 17:43:26', '2015-07-16 22:58:39');
INSERT INTO `oc_product` VALUES ('60', 'нкенкенкен', '', '', '', '', '', '', '56456', '1', '7', '', '0', '1', '64564.0000', '6546.0000', '0.0000', '0', '0', '2015-07-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '1', '2015-07-03 17:44:33', '2015-07-16 22:58:10');
INSERT INTO `oc_product` VALUES ('61', 'hhhhhhhhhhhhhhh', '', '', '', '', '', '', '', '1', '7', '', '0', '1', '0.0000', '0.0000', '0.0000', '0', '0', '2015-07-03', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2', '2015-07-03 17:45:35', '0000-00-00 00:00:00');
INSERT INTO `oc_product` VALUES ('62', 'xxx', '', '', '', '', '', '', '', '1', '7', '', '0', '1', '0.0000', '0.0000', '1.0000', '0', '0', '2015-07-20', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '2', '2015-07-20 16:42:07', '2015-07-20 16:42:35');
INSERT INTO `oc_product` VALUES ('63', 'Subaru', '', '', '', '', '', '', '', '1', '7', '', '0', '1', '77.0000', '0.0000', '0.0000', '0', '0', '2015-08-12', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '87', '2015-08-12 15:30:31', '2015-08-12 15:34:01');

-- ----------------------------
-- Table structure for `oc_product_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_attribute
-- ----------------------------
INSERT INTO `oc_product_attribute` VALUES ('47', '4', '1', '16GB');
INSERT INTO `oc_product_attribute` VALUES ('47', '2', '1', '4');

-- ----------------------------
-- Table structure for `oc_product_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_description
-- ----------------------------
INSERT INTO `oc_product_description` VALUES ('46', '1', 'Масло UU', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel\'s latest, most powerful innovation yet: Intel® Centrino® 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Масло UU', '', '');
INSERT INTO `oc_product_description` VALUES ('47', '1', 'Масло DD', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you\'re at the office&lt;/p&gt;\r\n', '', 'Масло DD', '', '');
INSERT INTO `oc_product_description` VALUES ('41', '1', 'Масло GG', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'Масло GG', '', '');
INSERT INTO `oc_product_description` VALUES ('33', '1', 'Масло LL', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it\'s not hard to imagine.&lt;/div&gt;\r\n', '', 'Масло LL', '', '');
INSERT INTO `oc_product_description` VALUES ('49', '1', 'Масло WW', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world’s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 – includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick – a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader’s Hub, Music Hub and Samsung Mini Apps Tray – which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;äö&lt;/p&gt;\r\n', '', 'Масло WW', '', '');
INSERT INTO `oc_product_description` VALUES ('51', '1', '654ка', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'hjkkj', '', '');
INSERT INTO `oc_product_description` VALUES ('28', '1', 'Масло RR', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm® MSM 7201A™ 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile® 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO™ 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth® 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi®: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB™ (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD™ memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Масло RR', '', '');
INSERT INTO `oc_product_description` VALUES ('52', '1', 'енкнкен', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'некнкен', '', '');
INSERT INTO `oc_product_description` VALUES ('53', '1', '356767657', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '73w756756', '', '');
INSERT INTO `oc_product_description` VALUES ('54', '1', '33333333', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '33333', '', '');
INSERT INTO `oc_product_description` VALUES ('55', '1', '6456456', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '45645645', '', '');
INSERT INTO `oc_product_description` VALUES ('56', '1', 'Масло еее', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'масло', '', '');
INSERT INTO `oc_product_description` VALUES ('57', '1', 'генгенгенг', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'негенгенгнег', '', '');
INSERT INTO `oc_product_description` VALUES ('58', '1', 'рнкенкенкенкен', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'нкенкенкен', '', '');
INSERT INTO `oc_product_description` VALUES ('59', '1', 'рнкенкенкенкен', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'нкенкенкен', '', '');
INSERT INTO `oc_product_description` VALUES ('60', '1', 'рнкенкенкенкен', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'нкенкенкен', '', '');
INSERT INTO `oc_product_description` VALUES ('61', '1', 'hhhhhhhhh', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'hhhhhhhhhhhhhhh', '', '');
INSERT INTO `oc_product_description` VALUES ('50', '1', 'Масло FF', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Масло FF', '', '');
INSERT INTO `oc_product_description` VALUES ('62', '1', 'xxx', '&lt;p&gt;xxx&lt;br&gt;&lt;/p&gt;', '', 'xxx', '', '');
INSERT INTO `oc_product_description` VALUES ('63', '1', 'Ремень ГРМ Subaru Legacy / Legacy Wagon ej202', '&lt;p&gt;&lt;span style=&quot;font-family: \'Comic Sans MS\';&quot;&gt;Ремень ГРМ для автомобилей Subaru Legacy / Legacy Wagon двс ej202&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: \'Comic Sans MS\';&quot;&gt;Товар Оригинальный, срок доставки 1-2 дня&lt;/span&gt;&lt;/p&gt;', 'Ремень ГРМ Subaru Legacy / Legacy Wagon ej202', 'Ремень ГРМ Subaru Legacy / Legacy Wagon ej202', 'Ремень ГРМ Subaru Legacy / Legacy Wagon ej202', 'Ремень ГРМ Subaru Legacy / Legacy Wagon ej202');

-- ----------------------------
-- Table structure for `oc_product_discount`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=465 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_discount
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_filter`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_filter`;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_filter
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_image`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2504 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_image
-- ----------------------------
INSERT INTO `oc_product_image` VALUES ('2499', '47', '', '0');
INSERT INTO `oc_product_image` VALUES ('2495', '28', '', '0');
INSERT INTO `oc_product_image` VALUES ('2497', '41', '', '0');
INSERT INTO `oc_product_image` VALUES ('2498', '47', '', '0');
INSERT INTO `oc_product_image` VALUES ('2494', '28', '', '0');
INSERT INTO `oc_product_image` VALUES ('2496', '41', '', '0');
INSERT INTO `oc_product_image` VALUES ('2465', '46', 'catalog/demo/sony_vaio_2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2462', '46', 'catalog/demo/sony_vaio_5.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2463', '46', 'catalog/demo/sony_vaio_4.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2464', '46', 'catalog/demo/sony_vaio_3.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2485', '49', 'catalog/demo/samsung_tab_4.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2484', '49', 'catalog/demo/samsung_tab_5.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2483', '49', 'catalog/demo/samsung_tab_6.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2482', '49', 'catalog/demo/samsung_tab_7.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2481', '49', 'catalog/demo/samsung_tab_2.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2480', '49', 'catalog/demo/samsung_tab_3.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2503', '54', 'catalog/03.jpg', '0');

-- ----------------------------
-- Table structure for `oc_product_option`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_option
-- ----------------------------
INSERT INTO `oc_product_option` VALUES ('225', '47', '12', '2011-04-22', '1');

-- ----------------------------
-- Table structure for `oc_product_option_value`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_option_value
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_recurring`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_recurring`;
CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_recurring
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_related`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_related
-- ----------------------------
INSERT INTO `oc_product_related` VALUES ('33', '63');
INSERT INTO `oc_product_related` VALUES ('41', '63');
INSERT INTO `oc_product_related` VALUES ('54', '63');
INSERT INTO `oc_product_related` VALUES ('63', '33');
INSERT INTO `oc_product_related` VALUES ('63', '41');
INSERT INTO `oc_product_related` VALUES ('63', '54');

-- ----------------------------
-- Table structure for `oc_product_reward`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=574 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_reward
-- ----------------------------
INSERT INTO `oc_product_reward` VALUES ('573', '28', '1', '400');
INSERT INTO `oc_product_reward` VALUES ('569', '49', '1', '1000');

-- ----------------------------
-- Table structure for `oc_product_special`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_special
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_to_category`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_category
-- ----------------------------
INSERT INTO `oc_product_to_category` VALUES ('28', '68');
INSERT INTO `oc_product_to_category` VALUES ('41', '60');
INSERT INTO `oc_product_to_category` VALUES ('41', '71');
INSERT INTO `oc_product_to_category` VALUES ('46', '60');
INSERT INTO `oc_product_to_category` VALUES ('47', '64');
INSERT INTO `oc_product_to_category` VALUES ('47', '71');
INSERT INTO `oc_product_to_category` VALUES ('49', '60');
INSERT INTO `oc_product_to_category` VALUES ('49', '65');
INSERT INTO `oc_product_to_category` VALUES ('50', '71');
INSERT INTO `oc_product_to_category` VALUES ('52', '67');
INSERT INTO `oc_product_to_category` VALUES ('52', '71');
INSERT INTO `oc_product_to_category` VALUES ('53', '70');
INSERT INTO `oc_product_to_category` VALUES ('53', '73');
INSERT INTO `oc_product_to_category` VALUES ('54', '69');
INSERT INTO `oc_product_to_category` VALUES ('54', '73');
INSERT INTO `oc_product_to_category` VALUES ('55', '70');
INSERT INTO `oc_product_to_category` VALUES ('55', '73');
INSERT INTO `oc_product_to_category` VALUES ('59', '66');
INSERT INTO `oc_product_to_category` VALUES ('59', '71');
INSERT INTO `oc_product_to_category` VALUES ('60', '60');
INSERT INTO `oc_product_to_category` VALUES ('60', '71');
INSERT INTO `oc_product_to_category` VALUES ('62', '67');
INSERT INTO `oc_product_to_category` VALUES ('63', '75');

-- ----------------------------
-- Table structure for `oc_product_to_download`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_download
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_layout
-- ----------------------------
INSERT INTO `oc_product_to_layout` VALUES ('41', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('51', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('33', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('52', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('50', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('47', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('28', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('46', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('49', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('53', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('54', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('55', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('56', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('57', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('58', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('59', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('60', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('61', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('62', '0', '0');
INSERT INTO `oc_product_to_layout` VALUES ('63', '0', '0');

-- ----------------------------
-- Table structure for `oc_product_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_store
-- ----------------------------
INSERT INTO `oc_product_to_store` VALUES ('28', '0');
INSERT INTO `oc_product_to_store` VALUES ('33', '0');
INSERT INTO `oc_product_to_store` VALUES ('41', '0');
INSERT INTO `oc_product_to_store` VALUES ('46', '0');
INSERT INTO `oc_product_to_store` VALUES ('47', '0');
INSERT INTO `oc_product_to_store` VALUES ('49', '0');
INSERT INTO `oc_product_to_store` VALUES ('50', '0');
INSERT INTO `oc_product_to_store` VALUES ('51', '0');
INSERT INTO `oc_product_to_store` VALUES ('52', '0');
INSERT INTO `oc_product_to_store` VALUES ('53', '0');
INSERT INTO `oc_product_to_store` VALUES ('54', '0');
INSERT INTO `oc_product_to_store` VALUES ('55', '0');
INSERT INTO `oc_product_to_store` VALUES ('56', '0');
INSERT INTO `oc_product_to_store` VALUES ('57', '0');
INSERT INTO `oc_product_to_store` VALUES ('58', '0');
INSERT INTO `oc_product_to_store` VALUES ('59', '0');
INSERT INTO `oc_product_to_store` VALUES ('60', '0');
INSERT INTO `oc_product_to_store` VALUES ('61', '0');
INSERT INTO `oc_product_to_store` VALUES ('62', '0');
INSERT INTO `oc_product_to_store` VALUES ('63', '0');

-- ----------------------------
-- Table structure for `oc_recurring`
-- ----------------------------
DROP TABLE IF EXISTS `oc_recurring`;
CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_recurring
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_recurring_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_recurring_description`;
CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_recurring_description
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_return`
-- ----------------------------
DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_return_action`
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_action
-- ----------------------------
INSERT INTO `oc_return_action` VALUES ('1', '1', 'Возвращены средства');
INSERT INTO `oc_return_action` VALUES ('2', '1', 'Выдан в кредит');
INSERT INTO `oc_return_action` VALUES ('3', '1', 'Отправлен другой товар для замены');

-- ----------------------------
-- Table structure for `oc_return_history`
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_history
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_return_reason`
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_reason
-- ----------------------------
INSERT INTO `oc_return_reason` VALUES ('1', '1', 'Получен/доставлен неисправным (сломан)');
INSERT INTO `oc_return_reason` VALUES ('2', '1', 'Получен не тот (ошибочный) товар');
INSERT INTO `oc_return_reason` VALUES ('4', '1', 'Ошибка, пожалуйста укажите/приложите подробности');
INSERT INTO `oc_return_reason` VALUES ('5', '1', 'Другое (другая причина), пожалуйста укажите/приложите подробности');

-- ----------------------------
-- Table structure for `oc_return_status`
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_status
-- ----------------------------
INSERT INTO `oc_return_status` VALUES ('1', '1', 'Рассматриваемый ');
INSERT INTO `oc_return_status` VALUES ('3', '1', 'Готов (к отправке) ');
INSERT INTO `oc_return_status` VALUES ('2', '1', 'Заказ в ожидании ');

-- ----------------------------
-- Table structure for `oc_review`
-- ----------------------------
DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_review
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_setting`
-- ----------------------------
DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5720 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_setting
-- ----------------------------
INSERT INTO `oc_setting` VALUES ('1', '0', 'shipping', 'shipping_sort_order', '3', '0');
INSERT INTO `oc_setting` VALUES ('2', '0', 'sub_total', 'sub_total_sort_order', '1', '0');
INSERT INTO `oc_setting` VALUES ('3', '0', 'sub_total', 'sub_total_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('5', '0', 'total', 'total_sort_order', '9', '0');
INSERT INTO `oc_setting` VALUES ('6', '0', 'total', 'total_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('8', '0', 'free_checkout', 'free_checkout_sort_order', '1', '0');
INSERT INTO `oc_setting` VALUES ('9', '0', 'cod', 'cod_sort_order', '5', '0');
INSERT INTO `oc_setting` VALUES ('10', '0', 'cod', 'cod_total', '0.01', '0');
INSERT INTO `oc_setting` VALUES ('11', '0', 'cod', 'cod_order_status_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('12', '0', 'cod', 'cod_geo_zone_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('13', '0', 'cod', 'cod_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('14', '0', 'shipping', 'shipping_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('15', '0', 'shipping', 'shipping_estimator', '1', '0');
INSERT INTO `oc_setting` VALUES ('27', '0', 'coupon', 'coupon_sort_order', '4', '0');
INSERT INTO `oc_setting` VALUES ('28', '0', 'coupon', 'coupon_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('34', '0', 'flat', 'flat_sort_order', '1', '0');
INSERT INTO `oc_setting` VALUES ('35', '0', 'flat', 'flat_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('36', '0', 'flat', 'flat_geo_zone_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('37', '0', 'flat', 'flat_tax_class_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('41', '0', 'flat', 'flat_cost', '5.00', '0');
INSERT INTO `oc_setting` VALUES ('42', '0', 'credit', 'credit_sort_order', '7', '0');
INSERT INTO `oc_setting` VALUES ('43', '0', 'credit', 'credit_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('53', '0', 'reward', 'reward_sort_order', '2', '0');
INSERT INTO `oc_setting` VALUES ('54', '0', 'reward', 'reward_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('3749', '0', 'category', 'category_status', '0', '0');
INSERT INTO `oc_setting` VALUES ('634', '0', 'account', 'account_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('159', '0', 'affiliate', 'affiliate_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('5719', '0', 'config', 'config_google_captcha_status', '0', '0');
INSERT INTO `oc_setting` VALUES ('5718', '0', 'config', 'config_google_captcha_secret', '', '0');
INSERT INTO `oc_setting` VALUES ('5717', '0', 'config', 'config_google_captcha_public', '', '0');
INSERT INTO `oc_setting` VALUES ('5716', '0', 'config', 'config_google_analytics_status', '0', '0');
INSERT INTO `oc_setting` VALUES ('5715', '0', 'config', 'config_google_analytics', '', '0');
INSERT INTO `oc_setting` VALUES ('5714', '0', 'config', 'config_error_filename', 'error.log', '0');
INSERT INTO `oc_setting` VALUES ('5713', '0', 'config', 'config_error_log', '1', '0');
INSERT INTO `oc_setting` VALUES ('5712', '0', 'config', 'config_error_display', '1', '0');
INSERT INTO `oc_setting` VALUES ('5711', '0', 'config', 'config_compression', '0', '0');
INSERT INTO `oc_setting` VALUES ('5710', '0', 'config', 'config_encryption', 'c071a681446fc7322e70a043ef182331', '0');
INSERT INTO `oc_setting` VALUES ('5709', '0', 'config', 'config_password', '1', '0');
INSERT INTO `oc_setting` VALUES ('5708', '0', 'config', 'config_maintenance', '0', '0');
INSERT INTO `oc_setting` VALUES ('5704', '0', 'config', 'config_seo_url', '0', '0');
INSERT INTO `oc_setting` VALUES ('5705', '0', 'config', 'config_file_max_size', '300000', '0');
INSERT INTO `oc_setting` VALUES ('94', '0', 'voucher', 'voucher_sort_order', '8', '0');
INSERT INTO `oc_setting` VALUES ('95', '0', 'voucher', 'voucher_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('5706', '0', 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', '0');
INSERT INTO `oc_setting` VALUES ('103', '0', 'free_checkout', 'free_checkout_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('104', '0', 'free_checkout', 'free_checkout_order_status_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('5707', '0', 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', '0');
INSERT INTO `oc_setting` VALUES ('5701', '0', 'config', 'config_secure', '0', '0');
INSERT INTO `oc_setting` VALUES ('5702', '0', 'config', 'config_shared', '0', '0');
INSERT INTO `oc_setting` VALUES ('5703', '0', 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', '0');
INSERT INTO `oc_setting` VALUES ('5698', '0', 'config', 'config_mail_smtp_port', '25', '0');
INSERT INTO `oc_setting` VALUES ('5700', '0', 'config', 'config_mail_alert', 'ppozdny@gmail.com', '0');
INSERT INTO `oc_setting` VALUES ('5699', '0', 'config', 'config_mail_smtp_timeout', '5', '0');
INSERT INTO `oc_setting` VALUES ('5697', '0', 'config', 'config_mail_smtp_password', '', '0');
INSERT INTO `oc_setting` VALUES ('5696', '0', 'config', 'config_mail_smtp_username', '', '0');
INSERT INTO `oc_setting` VALUES ('5695', '0', 'config', 'config_mail_smtp_hostname', '', '0');
INSERT INTO `oc_setting` VALUES ('5694', '0', 'config', 'config_mail_parameter', '', '0');
INSERT INTO `oc_setting` VALUES ('5693', '0', 'config', 'config_mail_protocol', 'mail', '0');
INSERT INTO `oc_setting` VALUES ('5692', '0', 'config', 'config_ftp_status', '0', '0');
INSERT INTO `oc_setting` VALUES ('5691', '0', 'config', 'config_ftp_root', '', '0');
INSERT INTO `oc_setting` VALUES ('5690', '0', 'config', 'config_ftp_password', '', '0');
INSERT INTO `oc_setting` VALUES ('5689', '0', 'config', 'config_ftp_username', '', '0');
INSERT INTO `oc_setting` VALUES ('5688', '0', 'config', 'config_ftp_port', '21', '0');
INSERT INTO `oc_setting` VALUES ('5687', '0', 'config', 'config_ftp_hostname', 'openk', '0');
INSERT INTO `oc_setting` VALUES ('5686', '0', 'config', 'config_image_location_height', '50', '0');
INSERT INTO `oc_setting` VALUES ('5685', '0', 'config', 'config_image_location_width', '268', '0');
INSERT INTO `oc_setting` VALUES ('5684', '0', 'config', 'config_image_cart_height', '47', '0');
INSERT INTO `oc_setting` VALUES ('5683', '0', 'config', 'config_image_cart_width', '47', '0');
INSERT INTO `oc_setting` VALUES ('5682', '0', 'config', 'config_image_wishlist_height', '47', '0');
INSERT INTO `oc_setting` VALUES ('5681', '0', 'config', 'config_image_wishlist_width', '47', '0');
INSERT INTO `oc_setting` VALUES ('5680', '0', 'config', 'config_image_compare_height', '90', '0');
INSERT INTO `oc_setting` VALUES ('5679', '0', 'config', 'config_image_compare_width', '90', '0');
INSERT INTO `oc_setting` VALUES ('5678', '0', 'config', 'config_image_related_height', '80', '0');
INSERT INTO `oc_setting` VALUES ('5677', '0', 'config', 'config_image_related_width', '80', '0');
INSERT INTO `oc_setting` VALUES ('5676', '0', 'config', 'config_image_additional_height', '74', '0');
INSERT INTO `oc_setting` VALUES ('5675', '0', 'config', 'config_image_additional_width', '74', '0');
INSERT INTO `oc_setting` VALUES ('5674', '0', 'config', 'config_image_product_height', '228', '0');
INSERT INTO `oc_setting` VALUES ('5673', '0', 'config', 'config_image_product_width', '228', '0');
INSERT INTO `oc_setting` VALUES ('5672', '0', 'config', 'config_image_popup_height', '500', '0');
INSERT INTO `oc_setting` VALUES ('5671', '0', 'config', 'config_image_popup_width', '500', '0');
INSERT INTO `oc_setting` VALUES ('5670', '0', 'config', 'config_image_thumb_height', '228', '0');
INSERT INTO `oc_setting` VALUES ('5669', '0', 'config', 'config_image_thumb_width', '228', '0');
INSERT INTO `oc_setting` VALUES ('5668', '0', 'config', 'config_image_category_height', '80', '0');
INSERT INTO `oc_setting` VALUES ('5667', '0', 'config', 'config_image_category_width', '80', '0');
INSERT INTO `oc_setting` VALUES ('5666', '0', 'config', 'config_icon', 'catalog/x.jpg', '0');
INSERT INTO `oc_setting` VALUES ('5665', '0', 'config', 'config_logo', 'catalog/logo22.png', '0');
INSERT INTO `oc_setting` VALUES ('5663', '0', 'config', 'config_return_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('5664', '0', 'config', 'config_return_status_id', '2', '0');
INSERT INTO `oc_setting` VALUES ('5662', '0', 'config', 'config_affiliate_mail', '0', '0');
INSERT INTO `oc_setting` VALUES ('5661', '0', 'config', 'config_affiliate_id', '4', '0');
INSERT INTO `oc_setting` VALUES ('5660', '0', 'config', 'config_affiliate_commission', '5', '0');
INSERT INTO `oc_setting` VALUES ('5659', '0', 'config', 'config_affiliate_auto', '0', '0');
INSERT INTO `oc_setting` VALUES ('5658', '0', 'config', 'config_affiliate_approval', '0', '0');
INSERT INTO `oc_setting` VALUES ('5657', '0', 'config', 'config_stock_checkout', '0', '0');
INSERT INTO `oc_setting` VALUES ('5656', '0', 'config', 'config_stock_warning', '0', '0');
INSERT INTO `oc_setting` VALUES ('5655', '0', 'config', 'config_stock_display', '0', '0');
INSERT INTO `oc_setting` VALUES ('5654', '0', 'config', 'config_order_mail', '1', '0');
INSERT INTO `oc_setting` VALUES ('5650', '0', 'config', 'config_checkout_id', '5', '0');
INSERT INTO `oc_setting` VALUES ('5651', '0', 'config', 'config_order_status_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('5652', '0', 'config', 'config_processing_status', 'a:1:{i:0;s:1:\"2\";}', '1');
INSERT INTO `oc_setting` VALUES ('5653', '0', 'config', 'config_complete_status', 'a:1:{i:0;s:1:\"5\";}', '1');
INSERT INTO `oc_setting` VALUES ('5649', '0', 'config', 'config_checkout_guest', '1', '0');
INSERT INTO `oc_setting` VALUES ('5648', '0', 'config', 'config_cart_weight', '1', '0');
INSERT INTO `oc_setting` VALUES ('5647', '0', 'config', 'config_api_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('5646', '0', 'config', 'config_invoice_prefix', 'INV-2015-00', '0');
INSERT INTO `oc_setting` VALUES ('5645', '0', 'config', 'config_account_mail', '0', '0');
INSERT INTO `oc_setting` VALUES ('5644', '0', 'config', 'config_account_id', '3', '0');
INSERT INTO `oc_setting` VALUES ('5643', '0', 'config', 'config_login_attempts', '5', '0');
INSERT INTO `oc_setting` VALUES ('5642', '0', 'config', 'config_customer_price', '0', '0');
INSERT INTO `oc_setting` VALUES ('5641', '0', 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:\"1\";}', '1');
INSERT INTO `oc_setting` VALUES ('5639', '0', 'config', 'config_customer_online', '0', '0');
INSERT INTO `oc_setting` VALUES ('5640', '0', 'config', 'config_customer_group_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('5638', '0', 'config', 'config_tax_customer', 'shipping', '0');
INSERT INTO `oc_setting` VALUES ('5637', '0', 'config', 'config_tax_default', 'shipping', '0');
INSERT INTO `oc_setting` VALUES ('5636', '0', 'config', 'config_tax', '0', '0');
INSERT INTO `oc_setting` VALUES ('5634', '0', 'config', 'config_voucher_min', '1', '0');
INSERT INTO `oc_setting` VALUES ('5635', '0', 'config', 'config_voucher_max', '1000', '0');
INSERT INTO `oc_setting` VALUES ('5633', '0', 'config', 'config_review_mail', '0', '0');
INSERT INTO `oc_setting` VALUES ('5632', '0', 'config', 'config_review_guest', '1', '0');
INSERT INTO `oc_setting` VALUES ('5631', '0', 'config', 'config_review_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('5630', '0', 'config', 'config_limit_admin', '20', '0');
INSERT INTO `oc_setting` VALUES ('5629', '0', 'config', 'config_product_description_length', '100', '0');
INSERT INTO `oc_setting` VALUES ('5628', '0', 'config', 'config_product_limit', '12', '0');
INSERT INTO `oc_setting` VALUES ('5627', '0', 'config', 'config_product_count', '0', '0');
INSERT INTO `oc_setting` VALUES ('5626', '0', 'config', 'config_weight_class_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('5625', '0', 'config', 'config_length_class_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('5624', '0', 'config', 'config_currency_auto', '1', '0');
INSERT INTO `oc_setting` VALUES ('5623', '0', 'config', 'config_currency_out', 'RUB', '0');
INSERT INTO `oc_setting` VALUES ('5622', '0', 'config', 'config_currency', 'USD', '0');
INSERT INTO `oc_setting` VALUES ('5621', '0', 'config', 'config_admin_language', 'ru', '0');
INSERT INTO `oc_setting` VALUES ('5620', '0', 'config', 'config_language', 'ru', '0');
INSERT INTO `oc_setting` VALUES ('5619', '0', 'config', 'config_zone_id', '', '0');
INSERT INTO `oc_setting` VALUES ('5618', '0', 'config', 'config_country_id', '176', '0');
INSERT INTO `oc_setting` VALUES ('5617', '0', 'config', 'config_layout_id', '4', '0');
INSERT INTO `oc_setting` VALUES ('5616', '0', 'config', 'config_template', 'default', '0');
INSERT INTO `oc_setting` VALUES ('5612', '0', 'config', 'config_comment', '', '0');
INSERT INTO `oc_setting` VALUES ('5613', '0', 'config', 'config_meta_title', 'AVTONEXTNSK - Автозапчасти от мировых брендов', '0');
INSERT INTO `oc_setting` VALUES ('5614', '0', 'config', 'config_meta_description', 'Мой магазин', '0');
INSERT INTO `oc_setting` VALUES ('5615', '0', 'config', 'config_meta_keyword', 'Автонекст,  смазочные материалы, оборудование,  качественные запасные части , оборудование по доступной цене,  контрактными запасными частями (детали ходовой, детали двигателя, кузова, оптика, топливная система, система зажигания, контрактные ДВС и АКПП), гарантия на весь товар', '0');
INSERT INTO `oc_setting` VALUES ('5611', '0', 'config', 'config_open', '', '0');
INSERT INTO `oc_setting` VALUES ('5610', '0', 'config', 'config_image', '', '0');
INSERT INTO `oc_setting` VALUES ('5609', '0', 'config', 'config_email', 'pozdny@mail.ru', '0');
INSERT INTO `oc_setting` VALUES ('5608', '0', 'config', 'config_telephone', '8(383) 292-58-19 &lt;br&gt;  8(383) 3-757-223', '0');
INSERT INTO `oc_setting` VALUES ('5607', '0', 'config', 'config_geocode', '', '0');
INSERT INTO `oc_setting` VALUES ('5606', '0', 'config', 'config_address', 'г.Новосибирск Мира, 63а к5', '0');
INSERT INTO `oc_setting` VALUES ('5605', '0', 'config', 'config_owner', 'Иванов Иван', '0');
INSERT INTO `oc_setting` VALUES ('5604', '0', 'config', 'config_name', 'AVTONEXTNSK Автозапчасти от мировых брендов', '0');

-- ----------------------------
-- Table structure for `oc_stock_status`
-- ----------------------------
DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_stock_status
-- ----------------------------
INSERT INTO `oc_stock_status` VALUES ('7', '1', 'В наличии');
INSERT INTO `oc_stock_status` VALUES ('8', '1', 'Предзаказ');
INSERT INTO `oc_stock_status` VALUES ('5', '1', 'Нет в наличии');
INSERT INTO `oc_stock_status` VALUES ('6', '1', 'Ожидание 2-3 дня');

-- ----------------------------
-- Table structure for `oc_store`
-- ----------------------------
DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_store
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_tax_class`
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_class
-- ----------------------------
INSERT INTO `oc_tax_class` VALUES ('9', 'Налоги', 'Облагаемые налогом', '2014-06-06 23:00:00', '2014-09-09 11:50:31');

-- ----------------------------
-- Table structure for `oc_tax_rate`
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_rate
-- ----------------------------
INSERT INTO `oc_tax_rate` VALUES ('87', '3', 'НДС', '18.0000', 'F', '2011-09-21 21:49:23', '2014-09-09 11:49:32');

-- ----------------------------
-- Table structure for `oc_tax_rate_to_customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_rate_to_customer_group
-- ----------------------------
INSERT INTO `oc_tax_rate_to_customer_group` VALUES ('86', '1');
INSERT INTO `oc_tax_rate_to_customer_group` VALUES ('87', '1');

-- ----------------------------
-- Table structure for `oc_tax_rule`
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_rule
-- ----------------------------
INSERT INTO `oc_tax_rule` VALUES ('121', '10', '86', 'payment', '1');
INSERT INTO `oc_tax_rule` VALUES ('120', '10', '87', 'store', '0');
INSERT INTO `oc_tax_rule` VALUES ('127', '9', '87', 'shipping', '2');

-- ----------------------------
-- Table structure for `oc_upload`
-- ----------------------------
DROP TABLE IF EXISTS `oc_upload`;
CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_upload
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_url_alias`
-- ----------------------------
DROP TABLE IF EXISTS `oc_url_alias`;
CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=1090 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_url_alias
-- ----------------------------
INSERT INTO `oc_url_alias` VALUES ('1034', 'product_id=59', 'rnkenkenkenken765');
INSERT INTO `oc_url_alias` VALUES ('1033', 'product_id=60', 'rnkenkenkenkenhfjhf');
INSERT INTO `oc_url_alias` VALUES ('730', 'manufacturer_id=8', 'apple');
INSERT INTO `oc_url_alias` VALUES ('1026', 'information_id=4', 'about_us');
INSERT INTO `oc_url_alias` VALUES ('1022', 'product_id=50', 'maslo-podsolnechnoe');
INSERT INTO `oc_url_alias` VALUES ('958', 'product_id=61', 'hhhhhhhhh');
INSERT INTO `oc_url_alias` VALUES ('1046', 'category_id=69', 'kanistry');
INSERT INTO `oc_url_alias` VALUES ('1041', 'category_id=60', 'industrial-oil');
INSERT INTO `oc_url_alias` VALUES ('1044', 'category_id=63', 'maslo-motornoe');
INSERT INTO `oc_url_alias` VALUES ('1043', 'category_id=64', 'maslo-motornoe-dlja-dizelnyx-dvs');
INSERT INTO `oc_url_alias` VALUES ('1042', 'category_id=65', 'maslo-motornoe-dlja-benzinovyx-dvs');
INSERT INTO `oc_url_alias` VALUES ('1040', 'category_id=66', 'zhidkost-transmissionnaja');
INSERT INTO `oc_url_alias` VALUES ('1039', 'category_id=67', 'zhidkost-oxlazhdajuschaja');
INSERT INTO `oc_url_alias` VALUES ('1045', 'category_id=68', 'prochee');
INSERT INTO `oc_url_alias` VALUES ('1012', 'category_id=70', 'ob2');
INSERT INTO `oc_url_alias` VALUES ('1019', 'category_id=71', 'smazochnye-materialy');
INSERT INTO `oc_url_alias` VALUES ('948', 'product_id=51', '654ka');
INSERT INTO `oc_url_alias` VALUES ('1074', 'product_id=47', 'hp-lp3065');
INSERT INTO `oc_url_alias` VALUES ('1072', 'product_id=28', 'htc-touch-hd');
INSERT INTO `oc_url_alias` VALUES ('953', 'product_id=56', 'maslo-motornoe-dlja-benzinovyx-dvs-2');
INSERT INTO `oc_url_alias` VALUES ('1029', 'product_id=55', '6456456');
INSERT INTO `oc_url_alias` VALUES ('1079', 'product_id=54', '33333333');
INSERT INTO `oc_url_alias` VALUES ('1028', 'product_id=53', '356767657');
INSERT INTO `oc_url_alias` VALUES ('1052', 'product_id=52', 'enknken');
INSERT INTO `oc_url_alias` VALUES ('1035', 'product_id=49', 'samsung-galaxy-tab-10-1');
INSERT INTO `oc_url_alias` VALUES ('1075', 'product_id=33', 'samsung-syncmaster-941bw');
INSERT INTO `oc_url_alias` VALUES ('964', 'product_id=46', 'sony-vaio');
INSERT INTO `oc_url_alias` VALUES ('1073', 'product_id=41', 'imac');
INSERT INTO `oc_url_alias` VALUES ('955', 'product_id=58', 'rnkenkenkenken');
INSERT INTO `oc_url_alias` VALUES ('962', 'product_id=57', 'gengengeng');
INSERT INTO `oc_url_alias` VALUES ('828', 'manufacturer_id=9', 'canon');
INSERT INTO `oc_url_alias` VALUES ('829', 'manufacturer_id=5', 'htc');
INSERT INTO `oc_url_alias` VALUES ('830', 'manufacturer_id=7', 'hewlett-packard');
INSERT INTO `oc_url_alias` VALUES ('831', 'manufacturer_id=6', 'palm');
INSERT INTO `oc_url_alias` VALUES ('832', 'manufacturer_id=10', 'sony');
INSERT INTO `oc_url_alias` VALUES ('841', 'information_id=6', 'delivery');
INSERT INTO `oc_url_alias` VALUES ('930', 'information_id=3', 'privacy');
INSERT INTO `oc_url_alias` VALUES ('931', 'information_id=5', 'terms');
INSERT INTO `oc_url_alias` VALUES ('845', 'common/home', '');
INSERT INTO `oc_url_alias` VALUES ('846', 'information/contact', 'contact-us');
INSERT INTO `oc_url_alias` VALUES ('847', 'information/sitemap', 'sitemap');
INSERT INTO `oc_url_alias` VALUES ('848', 'product/special', 'specials');
INSERT INTO `oc_url_alias` VALUES ('849', 'product/manufacturer', 'brands');
INSERT INTO `oc_url_alias` VALUES ('850', 'product/compare', 'compare-products');
INSERT INTO `oc_url_alias` VALUES ('851', 'product/search', 'search');
INSERT INTO `oc_url_alias` VALUES ('852', 'checkout/cart', 'cart');
INSERT INTO `oc_url_alias` VALUES ('853', 'checkout/checkout', 'checkout');
INSERT INTO `oc_url_alias` VALUES ('854', 'account/login', 'login');
INSERT INTO `oc_url_alias` VALUES ('855', 'account/logout', 'logout');
INSERT INTO `oc_url_alias` VALUES ('856', 'account/voucher', 'vouchers');
INSERT INTO `oc_url_alias` VALUES ('857', 'account/wishlist', 'wishlist');
INSERT INTO `oc_url_alias` VALUES ('858', 'account/account', 'my-account');
INSERT INTO `oc_url_alias` VALUES ('859', 'account/order', 'order-history');
INSERT INTO `oc_url_alias` VALUES ('860', 'account/newsletter', 'newsletter');
INSERT INTO `oc_url_alias` VALUES ('861', 'account/return/add', 'return-add');
INSERT INTO `oc_url_alias` VALUES ('862', 'account/forgotten', 'forgot-password');
INSERT INTO `oc_url_alias` VALUES ('863', 'account/download', 'downloads');
INSERT INTO `oc_url_alias` VALUES ('864', 'account/return', 'returns');
INSERT INTO `oc_url_alias` VALUES ('865', 'account/transaction', 'transactions');
INSERT INTO `oc_url_alias` VALUES ('866', 'account/register', 'create-account');
INSERT INTO `oc_url_alias` VALUES ('867', 'account/recurring', 'recurring');
INSERT INTO `oc_url_alias` VALUES ('868', 'account/address', 'address-book');
INSERT INTO `oc_url_alias` VALUES ('869', 'account/reward', 'reward-points');
INSERT INTO `oc_url_alias` VALUES ('870', 'account/edit', 'edit-account');
INSERT INTO `oc_url_alias` VALUES ('871', 'account/password', 'change-password');
INSERT INTO `oc_url_alias` VALUES ('880', 'affiliate/forgotten', 'affiliate-forgot-password');
INSERT INTO `oc_url_alias` VALUES ('881', 'affiliate/register', 'create-affiliate-account');
INSERT INTO `oc_url_alias` VALUES ('882', 'affiliate/login', 'affiliate-login');
INSERT INTO `oc_url_alias` VALUES ('883', 'affiliate/payment', 'affiliate-payment');
INSERT INTO `oc_url_alias` VALUES ('884', 'affiliate/tracking', 'affiliate-tracking');
INSERT INTO `oc_url_alias` VALUES ('885', 'affiliate/transaction', 'affiliate-transaction');
INSERT INTO `oc_url_alias` VALUES ('886', 'affiliate/account', 'affiliates');
INSERT INTO `oc_url_alias` VALUES ('1082', 'category_id=72', 'zapasnye-chasti');
INSERT INTO `oc_url_alias` VALUES ('1024', 'category_id=73', 'oborudovanie');
INSERT INTO `oc_url_alias` VALUES ('1089', 'category_id=74', 'kompressory');
INSERT INTO `oc_url_alias` VALUES ('1054', 'product_id=62', 'xxx');
INSERT INTO `oc_url_alias` VALUES ('1084', 'product_id=63', 'remen-grm-subaru-legacy-legacy-wagon-ej202');
INSERT INTO `oc_url_alias` VALUES ('1088', 'category_id=75', 'detali-gazoraspredelitelnogo-mexanizma');
INSERT INTO `oc_url_alias` VALUES ('1085', 'category_id=76', '111');
INSERT INTO `oc_url_alias` VALUES ('1086', 'category_id=77', '222');
INSERT INTO `oc_url_alias` VALUES ('1087', 'category_id=78', 'detali-dlja-remonta');

-- ----------------------------
-- Table structure for `oc_user`
-- ----------------------------
DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_user
-- ----------------------------
INSERT INTO `oc_user` VALUES ('1', '1', 'admin', 'ea335f593b3359c99f4eb7a2cdf721758d2e8087', 'ff6c5cd99', 'John', 'Doe', 'pozdny@mail.ru', '', '', '127.0.0.1', '1', '2015-06-24 10:50:42');

-- ----------------------------
-- Table structure for `oc_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_user_group
-- ----------------------------
INSERT INTO `oc_user_group` VALUES ('1', 'Administrator', 'a:2:{s:6:\"access\";a:124:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:20:\"catalog/cachemanager\";i:3;s:16:\"catalog/category\";i:4;s:16:\"catalog/download\";i:5;s:14:\"catalog/filter\";i:6;s:19:\"catalog/information\";i:7;s:20:\"catalog/manufacturer\";i:8;s:14:\"catalog/option\";i:9;s:15:\"catalog/product\";i:10;s:17:\"catalog/recurring\";i:11;s:14:\"catalog/review\";i:12;s:18:\"common/column_left\";i:13;s:18:\"common/filemanager\";i:14;s:11:\"common/menu\";i:15;s:14:\"common/profile\";i:16;s:12:\"common/stats\";i:17;s:13:\"design/banner\";i:18;s:13:\"design/layout\";i:19;s:14:\"extension/feed\";i:20;s:19:\"extension/installer\";i:21;s:22:\"extension/modification\";i:22;s:16:\"extension/module\";i:23;s:17:\"extension/openbay\";i:24;s:17:\"extension/payment\";i:25;s:18:\"extension/shipping\";i:26;s:15:\"extension/total\";i:27;s:16:\"feed/google_base\";i:28;s:19:\"feed/google_sitemap\";i:29;s:20:\"localisation/country\";i:30;s:21:\"localisation/currency\";i:31;s:21:\"localisation/geo_zone\";i:32;s:21:\"localisation/language\";i:33;s:25:\"localisation/length_class\";i:34;s:21:\"localisation/location\";i:35;s:25:\"localisation/order_status\";i:36;s:26:\"localisation/return_action\";i:37;s:26:\"localisation/return_reason\";i:38;s:26:\"localisation/return_status\";i:39;s:25:\"localisation/stock_status\";i:40;s:22:\"localisation/tax_class\";i:41;s:21:\"localisation/tax_rate\";i:42;s:25:\"localisation/weight_class\";i:43;s:17:\"localisation/zone\";i:44;s:19:\"marketing/affiliate\";i:45;s:17:\"marketing/contact\";i:46;s:16:\"marketing/coupon\";i:47;s:19:\"marketing/marketing\";i:48;s:14:\"module/account\";i:49;s:16:\"module/affiliate\";i:50;s:13:\"module/banner\";i:51;s:17:\"module/bestseller\";i:52;s:15:\"module/carousel\";i:53;s:15:\"module/category\";i:54;s:15:\"module/featured\";i:55;s:13:\"module/filter\";i:56;s:22:\"module/google_hangouts\";i:57;s:11:\"module/html\";i:58;s:18:\"module/information\";i:59;s:13:\"module/latest\";i:60;s:16:\"module/pp_button\";i:61;s:15:\"module/pp_login\";i:62;s:16:\"module/slideshow\";i:63;s:14:\"module/special\";i:64;s:12:\"module/store\";i:65;s:21:\"payment/bank_transfer\";i:66;s:14:\"payment/cheque\";i:67;s:11:\"payment/cod\";i:68;s:21:\"payment/free_checkout\";i:69;s:14:\"payment/liqpay\";i:70;s:18:\"payment/pp_express\";i:71;s:14:\"payment/pp_pro\";i:72;s:19:\"payment/pp_standard\";i:73;s:16:\"report/affiliate\";i:74;s:25:\"report/affiliate_activity\";i:75;s:22:\"report/affiliate_login\";i:76;s:24:\"report/customer_activity\";i:77;s:22:\"report/customer_credit\";i:78;s:21:\"report/customer_login\";i:79;s:22:\"report/customer_online\";i:80;s:21:\"report/customer_order\";i:81;s:22:\"report/customer_reward\";i:82;s:16:\"report/marketing\";i:83;s:24:\"report/product_purchased\";i:84;s:21:\"report/product_viewed\";i:85;s:18:\"report/sale_coupon\";i:86;s:17:\"report/sale_order\";i:87;s:18:\"report/sale_return\";i:88;s:20:\"report/sale_shipping\";i:89;s:15:\"report/sale_tax\";i:90;s:17:\"sale/custom_field\";i:91;s:13:\"sale/customer\";i:92;s:20:\"sale/customer_ban_ip\";i:93;s:19:\"sale/customer_group\";i:94;s:10:\"sale/order\";i:95;s:14:\"sale/recurring\";i:96;s:11:\"sale/return\";i:97;s:12:\"sale/voucher\";i:98;s:18:\"sale/voucher_theme\";i:99;s:15:\"setting/setting\";i:100;s:13:\"setting/store\";i:101;s:17:\"shipping/citylink\";i:102;s:13:\"shipping/flat\";i:103;s:13:\"shipping/free\";i:104;s:13:\"shipping/item\";i:105;s:15:\"shipping/pickup\";i:106;s:15:\"shipping/weight\";i:107;s:11:\"tool/backup\";i:108;s:14:\"tool/error_log\";i:109;s:11:\"tool/upload\";i:110;s:12:\"total/coupon\";i:111;s:12:\"total/credit\";i:112;s:14:\"total/handling\";i:113;s:19:\"total/low_order_fee\";i:114;s:12:\"total/reward\";i:115;s:14:\"total/shipping\";i:116;s:15:\"total/sub_total\";i:117;s:9:\"total/tax\";i:118;s:11:\"total/total\";i:119;s:13:\"total/voucher\";i:120;s:8:\"user/api\";i:121;s:9:\"user/user\";i:122;s:20:\"user/user_permission\";i:123;s:16:\"module/cartpopup\";}s:6:\"modify\";a:124:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:20:\"catalog/cachemanager\";i:3;s:16:\"catalog/category\";i:4;s:16:\"catalog/download\";i:5;s:14:\"catalog/filter\";i:6;s:19:\"catalog/information\";i:7;s:20:\"catalog/manufacturer\";i:8;s:14:\"catalog/option\";i:9;s:15:\"catalog/product\";i:10;s:17:\"catalog/recurring\";i:11;s:14:\"catalog/review\";i:12;s:18:\"common/column_left\";i:13;s:18:\"common/filemanager\";i:14;s:11:\"common/menu\";i:15;s:14:\"common/profile\";i:16;s:12:\"common/stats\";i:17;s:13:\"design/banner\";i:18;s:13:\"design/layout\";i:19;s:14:\"extension/feed\";i:20;s:19:\"extension/installer\";i:21;s:22:\"extension/modification\";i:22;s:16:\"extension/module\";i:23;s:17:\"extension/openbay\";i:24;s:17:\"extension/payment\";i:25;s:18:\"extension/shipping\";i:26;s:15:\"extension/total\";i:27;s:16:\"feed/google_base\";i:28;s:19:\"feed/google_sitemap\";i:29;s:20:\"localisation/country\";i:30;s:21:\"localisation/currency\";i:31;s:21:\"localisation/geo_zone\";i:32;s:21:\"localisation/language\";i:33;s:25:\"localisation/length_class\";i:34;s:21:\"localisation/location\";i:35;s:25:\"localisation/order_status\";i:36;s:26:\"localisation/return_action\";i:37;s:26:\"localisation/return_reason\";i:38;s:26:\"localisation/return_status\";i:39;s:25:\"localisation/stock_status\";i:40;s:22:\"localisation/tax_class\";i:41;s:21:\"localisation/tax_rate\";i:42;s:25:\"localisation/weight_class\";i:43;s:17:\"localisation/zone\";i:44;s:19:\"marketing/affiliate\";i:45;s:17:\"marketing/contact\";i:46;s:16:\"marketing/coupon\";i:47;s:19:\"marketing/marketing\";i:48;s:14:\"module/account\";i:49;s:16:\"module/affiliate\";i:50;s:13:\"module/banner\";i:51;s:17:\"module/bestseller\";i:52;s:15:\"module/carousel\";i:53;s:15:\"module/category\";i:54;s:15:\"module/featured\";i:55;s:13:\"module/filter\";i:56;s:22:\"module/google_hangouts\";i:57;s:11:\"module/html\";i:58;s:18:\"module/information\";i:59;s:13:\"module/latest\";i:60;s:16:\"module/pp_button\";i:61;s:15:\"module/pp_login\";i:62;s:16:\"module/slideshow\";i:63;s:14:\"module/special\";i:64;s:12:\"module/store\";i:65;s:21:\"payment/bank_transfer\";i:66;s:14:\"payment/cheque\";i:67;s:11:\"payment/cod\";i:68;s:21:\"payment/free_checkout\";i:69;s:14:\"payment/liqpay\";i:70;s:18:\"payment/pp_express\";i:71;s:14:\"payment/pp_pro\";i:72;s:19:\"payment/pp_standard\";i:73;s:16:\"report/affiliate\";i:74;s:25:\"report/affiliate_activity\";i:75;s:22:\"report/affiliate_login\";i:76;s:24:\"report/customer_activity\";i:77;s:22:\"report/customer_credit\";i:78;s:21:\"report/customer_login\";i:79;s:22:\"report/customer_online\";i:80;s:21:\"report/customer_order\";i:81;s:22:\"report/customer_reward\";i:82;s:16:\"report/marketing\";i:83;s:24:\"report/product_purchased\";i:84;s:21:\"report/product_viewed\";i:85;s:18:\"report/sale_coupon\";i:86;s:17:\"report/sale_order\";i:87;s:18:\"report/sale_return\";i:88;s:20:\"report/sale_shipping\";i:89;s:15:\"report/sale_tax\";i:90;s:17:\"sale/custom_field\";i:91;s:13:\"sale/customer\";i:92;s:20:\"sale/customer_ban_ip\";i:93;s:19:\"sale/customer_group\";i:94;s:10:\"sale/order\";i:95;s:14:\"sale/recurring\";i:96;s:11:\"sale/return\";i:97;s:12:\"sale/voucher\";i:98;s:18:\"sale/voucher_theme\";i:99;s:15:\"setting/setting\";i:100;s:13:\"setting/store\";i:101;s:17:\"shipping/citylink\";i:102;s:13:\"shipping/flat\";i:103;s:13:\"shipping/free\";i:104;s:13:\"shipping/item\";i:105;s:15:\"shipping/pickup\";i:106;s:15:\"shipping/weight\";i:107;s:11:\"tool/backup\";i:108;s:14:\"tool/error_log\";i:109;s:11:\"tool/upload\";i:110;s:12:\"total/coupon\";i:111;s:12:\"total/credit\";i:112;s:14:\"total/handling\";i:113;s:19:\"total/low_order_fee\";i:114;s:12:\"total/reward\";i:115;s:14:\"total/shipping\";i:116;s:15:\"total/sub_total\";i:117;s:9:\"total/tax\";i:118;s:11:\"total/total\";i:119;s:13:\"total/voucher\";i:120;s:8:\"user/api\";i:121;s:9:\"user/user\";i:122;s:20:\"user/user_permission\";i:123;s:16:\"module/cartpopup\";}}');
INSERT INTO `oc_user_group` VALUES ('10', 'Demonstration', 'a:2:{s:6:\"access\";a:1:{i:0;s:20:\"catalog/cachemanager\";}s:6:\"modify\";a:1:{i:0;s:20:\"catalog/cachemanager\";}}');

-- ----------------------------
-- Table structure for `oc_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_voucher_history`
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher_history
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_voucher_theme`
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher_theme
-- ----------------------------
INSERT INTO `oc_voucher_theme` VALUES ('8', 'catalog/demo/canon_eos_5d_2.jpg');
INSERT INTO `oc_voucher_theme` VALUES ('7', 'catalog/demo/gift-voucher-birthday.jpg');
INSERT INTO `oc_voucher_theme` VALUES ('6', 'catalog/demo/apple_logo.jpg');

-- ----------------------------
-- Table structure for `oc_voucher_theme_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher_theme_description
-- ----------------------------
INSERT INTO `oc_voucher_theme_description` VALUES ('6', '1', 'Новый год');
INSERT INTO `oc_voucher_theme_description` VALUES ('7', '1', 'День рождения');
INSERT INTO `oc_voucher_theme_description` VALUES ('8', '1', 'Другое');

-- ----------------------------
-- Table structure for `oc_weight_class`
-- ----------------------------
DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_weight_class
-- ----------------------------
INSERT INTO `oc_weight_class` VALUES ('1', '1.00000000');
INSERT INTO `oc_weight_class` VALUES ('2', '1000.00000000');
INSERT INTO `oc_weight_class` VALUES ('5', '2.20460000');
INSERT INTO `oc_weight_class` VALUES ('6', '35.27400000');

-- ----------------------------
-- Table structure for `oc_weight_class_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_weight_class_description
-- ----------------------------
INSERT INTO `oc_weight_class_description` VALUES ('1', '1', 'Килограмм', 'кг');
INSERT INTO `oc_weight_class_description` VALUES ('2', '1', 'Грамм', 'г');

-- ----------------------------
-- Table structure for `oc_zone`
-- ----------------------------
DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_zone
-- ----------------------------
INSERT INTO `oc_zone` VALUES ('1', '20', 'Брест', 'BR', '1');
INSERT INTO `oc_zone` VALUES ('2', '20', 'Гомель', 'HO', '1');
INSERT INTO `oc_zone` VALUES ('3', '20', 'Минск', 'HM', '1');
INSERT INTO `oc_zone` VALUES ('4', '20', 'Гродно', 'HR', '1');
INSERT INTO `oc_zone` VALUES ('5', '20', 'Могилев', 'MA', '1');
INSERT INTO `oc_zone` VALUES ('6', '20', 'Минская область', 'MI', '1');
INSERT INTO `oc_zone` VALUES ('7', '20', 'Витебск', 'VI', '1');
INSERT INTO `oc_zone` VALUES ('8', '80', 'Abkhazia', 'AB', '1');
INSERT INTO `oc_zone` VALUES ('9', '80', 'Ajaria', 'AJ', '1');
INSERT INTO `oc_zone` VALUES ('10', '80', 'Tbilisi', 'TB', '1');
INSERT INTO `oc_zone` VALUES ('11', '80', 'Guria', 'GU', '1');
INSERT INTO `oc_zone` VALUES ('12', '80', 'Imereti', 'IM', '1');
INSERT INTO `oc_zone` VALUES ('13', '80', 'Kakheti', 'KA', '1');
INSERT INTO `oc_zone` VALUES ('14', '80', 'Kvemo Kartli', 'KK', '1');
INSERT INTO `oc_zone` VALUES ('15', '80', 'Mtskheta-Mtianeti', 'MM', '1');
INSERT INTO `oc_zone` VALUES ('16', '80', 'Racha Lechkhumi and Kvemo Svanet', 'RL', '1');
INSERT INTO `oc_zone` VALUES ('17', '80', 'Samegrelo-Zemo Svaneti', 'SZ', '1');
INSERT INTO `oc_zone` VALUES ('18', '80', 'Samtskhe-Javakheti', 'SJ', '1');
INSERT INTO `oc_zone` VALUES ('19', '80', 'Shida Kartli', 'SK', '1');
INSERT INTO `oc_zone` VALUES ('20', '109', 'Алматинская область', 'AL', '1');
INSERT INTO `oc_zone` VALUES ('21', '109', 'Алматы - город республ-го значения', 'AC', '1');
INSERT INTO `oc_zone` VALUES ('22', '109', 'Акмолинская область', 'AM', '1');
INSERT INTO `oc_zone` VALUES ('23', '109', 'Актюбинская область', 'AQ', '1');
INSERT INTO `oc_zone` VALUES ('24', '109', 'Астана - город республ-го значения', 'AS', '1');
INSERT INTO `oc_zone` VALUES ('25', '109', 'Атырауская область', 'AT', '1');
INSERT INTO `oc_zone` VALUES ('26', '109', 'Западно-Казахстанская область', 'BA', '1');
INSERT INTO `oc_zone` VALUES ('27', '109', 'Байконур - город республ-го значения', 'BY', '1');
INSERT INTO `oc_zone` VALUES ('28', '109', 'Мангистауская область', 'MA', '1');
INSERT INTO `oc_zone` VALUES ('29', '109', 'Южно-Казахстанская область', 'ON', '1');
INSERT INTO `oc_zone` VALUES ('30', '109', 'Павлодарская область', 'PA', '1');
INSERT INTO `oc_zone` VALUES ('31', '109', 'Карагандинская область', 'QA', '1');
INSERT INTO `oc_zone` VALUES ('32', '109', 'Костанайская область', 'QO', '1');
INSERT INTO `oc_zone` VALUES ('33', '109', 'Кызылординская область', 'QY', '1');
INSERT INTO `oc_zone` VALUES ('34', '109', 'Восточно-Казахстанская область', 'SH', '1');
INSERT INTO `oc_zone` VALUES ('35', '109', 'Северо-Казахстанская область', 'SO', '1');
INSERT INTO `oc_zone` VALUES ('36', '109', 'Жамбылская область', 'ZH', '1');
INSERT INTO `oc_zone` VALUES ('37', '115', 'Bishkek', 'GB', '1');
INSERT INTO `oc_zone` VALUES ('38', '115', 'Batken', 'B', '1');
INSERT INTO `oc_zone` VALUES ('39', '115', 'Chu', 'C', '1');
INSERT INTO `oc_zone` VALUES ('40', '115', 'Jalal-Abad', 'J', '1');
INSERT INTO `oc_zone` VALUES ('41', '115', 'Naryn', 'N', '1');
INSERT INTO `oc_zone` VALUES ('42', '115', 'Osh', 'O', '1');
INSERT INTO `oc_zone` VALUES ('43', '115', 'Talas', 'T', '1');
INSERT INTO `oc_zone` VALUES ('44', '115', 'Ysyk-Kol', 'Y', '1');
INSERT INTO `oc_zone` VALUES ('45', '176', 'Республика Хакасия', 'KK', '1');
INSERT INTO `oc_zone` VALUES ('46', '176', 'Московская область', 'MOS', '1');
INSERT INTO `oc_zone` VALUES ('47', '176', 'Чукотский АО', 'CHU', '1');
INSERT INTO `oc_zone` VALUES ('48', '176', 'Архангельская область', 'ARK', '1');
INSERT INTO `oc_zone` VALUES ('49', '176', 'Астраханская область', 'AST', '1');
INSERT INTO `oc_zone` VALUES ('50', '176', 'Алтайский край', 'ALT', '1');
INSERT INTO `oc_zone` VALUES ('51', '176', 'Белгородская область', 'BEL', '1');
INSERT INTO `oc_zone` VALUES ('52', '176', 'Еврейская АО', 'YEV', '1');
INSERT INTO `oc_zone` VALUES ('53', '176', 'Амурская область', 'AMU', '1');
INSERT INTO `oc_zone` VALUES ('54', '176', 'Брянская область', 'BRY', '1');
INSERT INTO `oc_zone` VALUES ('55', '176', 'Чувашская Республика', 'CU', '1');
INSERT INTO `oc_zone` VALUES ('56', '176', 'Челябинская область', 'CHE', '1');
INSERT INTO `oc_zone` VALUES ('57', '176', 'Карачаево-Черкеcсия', 'KC', '1');
INSERT INTO `oc_zone` VALUES ('58', '176', 'Забайкальский край', 'ZAB', '1');
INSERT INTO `oc_zone` VALUES ('59', '176', 'Ленинградская область', 'LEN', '1');
INSERT INTO `oc_zone` VALUES ('60', '176', 'Республика Калмыкия', 'KL', '1');
INSERT INTO `oc_zone` VALUES ('61', '176', 'Сахалинская область', 'SAK', '1');
INSERT INTO `oc_zone` VALUES ('62', '176', 'Республика Алтай', 'AL', '1');
INSERT INTO `oc_zone` VALUES ('63', '176', 'Чеченская Республика', 'CE', '1');
INSERT INTO `oc_zone` VALUES ('64', '176', 'Иркутская область', 'IRK', '1');
INSERT INTO `oc_zone` VALUES ('65', '176', 'Ивановская область', 'IVA', '1');
INSERT INTO `oc_zone` VALUES ('66', '176', 'Удмуртская Республика', 'UD', '1');
INSERT INTO `oc_zone` VALUES ('67', '176', 'Калининградская область', 'KGD', '1');
INSERT INTO `oc_zone` VALUES ('68', '176', 'Калужская область', 'KLU', '1');
INSERT INTO `oc_zone` VALUES ('69', '176', 'Республика Татарстан', 'TA', '1');
INSERT INTO `oc_zone` VALUES ('70', '176', 'Кемеровская область', 'KEM', '1');
INSERT INTO `oc_zone` VALUES ('71', '176', 'Хабаровский край', 'KHA', '1');
INSERT INTO `oc_zone` VALUES ('72', '176', 'Ханты-Мансийский АО - Югра', 'KHM', '1');
INSERT INTO `oc_zone` VALUES ('73', '176', 'Костромская область', 'KOS', '1');
INSERT INTO `oc_zone` VALUES ('74', '176', 'Краснодарский край', 'KDA', '1');
INSERT INTO `oc_zone` VALUES ('75', '176', 'Красноярский край', 'KYA', '1');
INSERT INTO `oc_zone` VALUES ('76', '176', 'Курганская область', 'KGN', '1');
INSERT INTO `oc_zone` VALUES ('77', '176', 'Курская область', 'KRS', '1');
INSERT INTO `oc_zone` VALUES ('78', '176', 'Республика Тыва', 'TY', '1');
INSERT INTO `oc_zone` VALUES ('79', '176', 'Липецкая область', 'LIP', '1');
INSERT INTO `oc_zone` VALUES ('80', '176', 'Магаданская область', 'MAG', '1');
INSERT INTO `oc_zone` VALUES ('81', '176', 'Республика Дагестан', 'DA', '1');
INSERT INTO `oc_zone` VALUES ('82', '176', 'Республика Адыгея', 'AD', '1');
INSERT INTO `oc_zone` VALUES ('83', '176', 'Москва', 'MOW', '1');
INSERT INTO `oc_zone` VALUES ('84', '176', 'Мурманская область', 'MUR', '1');
INSERT INTO `oc_zone` VALUES ('85', '176', 'Республика Кабардино-Балкария', 'KB', '1');
INSERT INTO `oc_zone` VALUES ('86', '176', 'Ненецкий АО', 'NEN', '1');
INSERT INTO `oc_zone` VALUES ('87', '176', 'Республика Ингушетия', 'IN', '1');
INSERT INTO `oc_zone` VALUES ('88', '176', 'Нижегородская область', 'NIZ', '1');
INSERT INTO `oc_zone` VALUES ('89', '176', 'Новгородская область', 'NGR', '1');
INSERT INTO `oc_zone` VALUES ('90', '176', 'Новосибирская область', 'NVS', '1');
INSERT INTO `oc_zone` VALUES ('91', '176', 'Омская область', 'OMS', '1');
INSERT INTO `oc_zone` VALUES ('92', '176', 'Орловская область', 'ORL', '1');
INSERT INTO `oc_zone` VALUES ('93', '176', 'Оренбургская область', 'ORE', '1');
INSERT INTO `oc_zone` VALUES ('94', '176', 'Пензенская область', 'PNZ', '1');
INSERT INTO `oc_zone` VALUES ('95', '176', 'Пермский край', 'PER', '1');
INSERT INTO `oc_zone` VALUES ('96', '176', 'Камчатский край', 'KAM', '1');
INSERT INTO `oc_zone` VALUES ('97', '176', 'Республика Карелия', 'KR', '1');
INSERT INTO `oc_zone` VALUES ('98', '176', 'Псковская область', 'PSK', '1');
INSERT INTO `oc_zone` VALUES ('99', '176', 'Ростовская область', 'ROS', '1');
INSERT INTO `oc_zone` VALUES ('100', '176', 'Рязанская область', 'RYA', '1');
INSERT INTO `oc_zone` VALUES ('101', '176', 'Ямало-Ненецкий АО', 'YAN', '1');
INSERT INTO `oc_zone` VALUES ('102', '176', 'Самарская область', 'SAM', '1');
INSERT INTO `oc_zone` VALUES ('103', '176', 'Республика Мордовия', 'MO', '1');
INSERT INTO `oc_zone` VALUES ('104', '176', 'Саратовская область', 'SAR', '1');
INSERT INTO `oc_zone` VALUES ('105', '176', 'Смоленская область', 'SMO', '1');
INSERT INTO `oc_zone` VALUES ('106', '176', 'Санкт-Петербург', 'SPE', '1');
INSERT INTO `oc_zone` VALUES ('107', '176', 'Ставропольский край', 'STA', '1');
INSERT INTO `oc_zone` VALUES ('108', '176', 'Республика Коми', 'KO', '1');
INSERT INTO `oc_zone` VALUES ('109', '176', 'Тамбовская область', 'TAM', '1');
INSERT INTO `oc_zone` VALUES ('110', '176', 'Томская область', 'TOM', '1');
INSERT INTO `oc_zone` VALUES ('111', '176', 'Тульская область', 'TUL', '1');
INSERT INTO `oc_zone` VALUES ('112', '176', 'Тверская область', 'TVE', '1');
INSERT INTO `oc_zone` VALUES ('113', '176', 'Тюменская область', 'TYU', '1');
INSERT INTO `oc_zone` VALUES ('114', '176', 'Республика Башкортостан', 'BA', '1');
INSERT INTO `oc_zone` VALUES ('115', '176', 'Ульяновская область', 'ULY', '1');
INSERT INTO `oc_zone` VALUES ('116', '176', 'Республика Бурятия', 'BU', '1');
INSERT INTO `oc_zone` VALUES ('117', '176', 'Республика Северная Осетия', 'SE', '1');
INSERT INTO `oc_zone` VALUES ('118', '176', 'Владимирская область', 'VLA', '1');
INSERT INTO `oc_zone` VALUES ('119', '176', 'Приморский край', 'PRI', '1');
INSERT INTO `oc_zone` VALUES ('120', '176', 'Волгоградская область', 'VGG', '1');
INSERT INTO `oc_zone` VALUES ('121', '176', 'Вологодская область', 'VLG', '1');
INSERT INTO `oc_zone` VALUES ('122', '176', 'Воронежская область', 'VOR', '1');
INSERT INTO `oc_zone` VALUES ('123', '176', 'Кировская область', 'KIR', '1');
INSERT INTO `oc_zone` VALUES ('124', '176', 'Республика Саха', 'SA', '1');
INSERT INTO `oc_zone` VALUES ('125', '176', 'Ярославская область', 'YAR', '1');
INSERT INTO `oc_zone` VALUES ('126', '176', 'Свердловская область', 'SVE', '1');
INSERT INTO `oc_zone` VALUES ('127', '176', 'Республика Марий Эл', 'ME', '1');
INSERT INTO `oc_zone` VALUES ('128', '176', 'Республика Крым', 'CR', '1');
INSERT INTO `oc_zone` VALUES ('129', '220', 'Черкассы', 'CK', '1');
INSERT INTO `oc_zone` VALUES ('130', '220', 'Чернигов', 'CH', '1');
INSERT INTO `oc_zone` VALUES ('131', '220', 'Черновцы', 'CV', '1');
INSERT INTO `oc_zone` VALUES ('132', '220', 'Днепропетровск', 'DN', '1');
INSERT INTO `oc_zone` VALUES ('133', '220', 'Донецк', 'DO', '1');
INSERT INTO `oc_zone` VALUES ('134', '220', 'Ивано-Франковск', 'IV', '1');
INSERT INTO `oc_zone` VALUES ('135', '220', 'Харьков', 'KH', '1');
INSERT INTO `oc_zone` VALUES ('136', '220', 'Хмельницкий', 'KM', '1');
INSERT INTO `oc_zone` VALUES ('137', '220', 'Кировоград', 'KR', '1');
INSERT INTO `oc_zone` VALUES ('138', '220', 'Киевская область', 'KV', '1');
INSERT INTO `oc_zone` VALUES ('139', '220', 'Киев', 'KY', '1');
INSERT INTO `oc_zone` VALUES ('140', '220', 'Луганск', 'LU', '1');
INSERT INTO `oc_zone` VALUES ('141', '220', 'Львов', 'LV', '1');
INSERT INTO `oc_zone` VALUES ('142', '220', 'Николаев', 'MY', '1');
INSERT INTO `oc_zone` VALUES ('143', '220', 'Одесса', 'OD', '1');
INSERT INTO `oc_zone` VALUES ('144', '220', 'Полтава', 'PO', '1');
INSERT INTO `oc_zone` VALUES ('145', '220', 'Ровно', 'RI', '1');
INSERT INTO `oc_zone` VALUES ('146', '176', 'Севастополь', 'SE', '1');
INSERT INTO `oc_zone` VALUES ('147', '220', 'Сумы', 'SU', '1');
INSERT INTO `oc_zone` VALUES ('148', '220', 'Тернополь', 'TE', '1');
INSERT INTO `oc_zone` VALUES ('149', '220', 'Винница', 'VI', '1');
INSERT INTO `oc_zone` VALUES ('150', '220', 'Луцк', 'VO', '1');
INSERT INTO `oc_zone` VALUES ('151', '220', 'Ужгород', 'ZK', '1');
INSERT INTO `oc_zone` VALUES ('152', '220', 'Запорожье', 'ZA', '1');
INSERT INTO `oc_zone` VALUES ('153', '220', 'Житомир', 'ZH', '1');
INSERT INTO `oc_zone` VALUES ('154', '220', 'Херсон', 'KE', '1');
INSERT INTO `oc_zone` VALUES ('155', '226', 'Andijon', 'AN', '1');
INSERT INTO `oc_zone` VALUES ('156', '226', 'Buxoro', 'BU', '1');
INSERT INTO `oc_zone` VALUES ('157', '226', 'Farg\'ona', 'FA', '1');
INSERT INTO `oc_zone` VALUES ('158', '226', 'Jizzax', 'JI', '1');
INSERT INTO `oc_zone` VALUES ('159', '226', 'Namangan', 'NG', '1');
INSERT INTO `oc_zone` VALUES ('160', '226', 'Navoiy', 'NW', '1');
INSERT INTO `oc_zone` VALUES ('161', '226', 'Qashqadaryo', 'QA', '1');
INSERT INTO `oc_zone` VALUES ('162', '226', 'Qoraqalpog\'iston Republikasi', 'QR', '1');
INSERT INTO `oc_zone` VALUES ('163', '226', 'Samarqand', 'SA', '1');
INSERT INTO `oc_zone` VALUES ('164', '226', 'Sirdaryo', 'SI', '1');
INSERT INTO `oc_zone` VALUES ('165', '226', 'Surxondaryo', 'SU', '1');
INSERT INTO `oc_zone` VALUES ('166', '226', 'Toshkent City', 'TK', '1');
INSERT INTO `oc_zone` VALUES ('167', '226', 'Toshkent Region', 'TO', '1');
INSERT INTO `oc_zone` VALUES ('168', '226', 'Xorazm', 'XO', '1');

-- ----------------------------
-- Table structure for `oc_zone_to_geo_zone`
-- ----------------------------
DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_zone_to_geo_zone
-- ----------------------------
INSERT INTO `oc_zone_to_geo_zone` VALUES ('1', '222', '0', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `oc_zone_to_geo_zone` VALUES ('110', '176', '0', '3', '2014-09-09 11:48:13', '0000-00-00 00:00:00');
