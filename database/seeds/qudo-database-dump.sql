-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: qudo-database
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (4,'2023-01-25 20:57:08.256231',1,1,1,'2023-01-24 22:38:17.163697','admin','pbkdf2_sha256$390000$w8qUp5IZ9aj2tZaLWulA7B$b8khrKbvTxMieClcxd/Tla2mDdCf9Y50+pykSpIY+Ok='),(6,NULL,0,0,1,'2023-01-26 00:18:34.585891','wtmorco@live.co.uk','pbkdf2_sha256$390000$x2YHnGVB70eUU8BmCC5lxy$PAFwK5raU3nOBaZUJyrFgCreJB6CYqcgUhAUWtzmnlM='),(9,NULL,0,0,1,'2023-01-26 00:25:53.761538','will@will.com','pbkdf2_sha256$390000$UTvCn3nHcTMyj6S0MNoIz0$ol3bJBIRd8XskOHz4vMRvCL0nCsgMQS14J/UTYBfR9k=');
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_groups`
--

DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_groups`
--

LOCK TABLES `accounts_user_groups` WRITE;
/*!40000 ALTER TABLE `accounts_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_user_permissions`
--

DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_user_permissions`
--

LOCK TABLES `accounts_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add products',6,'add_products'),(22,'Can change products',6,'change_products'),(23,'Can delete products',6,'delete_products'),(24,'Can view products',6,'view_products'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add Token',8,'add_token'),(30,'Can change Token',8,'change_token'),(31,'Can delete Token',8,'delete_token'),(32,'Can view Token',8,'view_token'),(33,'Can add token',9,'add_tokenproxy'),(34,'Can change token',9,'change_tokenproxy'),(35,'Can delete token',9,'delete_tokenproxy'),(36,'Can view token',9,'view_tokenproxy'),(37,'Can add products',10,'add_products'),(38,'Can change products',10,'change_products'),(39,'Can delete products',10,'delete_products'),(40,'Can view products',10,'view_products'),(41,'Can add orders',11,'add_orders'),(42,'Can change orders',11,'change_orders'),(43,'Can delete orders',11,'delete_orders'),(44,'Can view orders',11,'view_orders'),(45,'Can add order items',12,'add_orderitems'),(46,'Can change order items',12,'change_orderitems'),(47,'Can delete order items',12,'delete_orderitems'),(48,'Can view order items',12,'view_orderitems');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('d159e4cff3ed6e784b137907ac8fc1b1d74a8b9e','2023-01-26 11:06:28.203270',9);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-01-25 20:57:18.160007','2','Orders object (2)',3,'',11,4),(2,'2023-01-25 20:57:18.163502','1','Orders object (1)',3,'',11,4),(3,'2023-01-26 00:00:13.781852','8','OrderItems object (8)',3,'',12,4),(4,'2023-01-26 00:00:13.784348','7','OrderItems object (7)',3,'',12,4),(5,'2023-01-26 00:00:13.785847','6','OrderItems object (6)',3,'',12,4),(6,'2023-01-26 00:00:13.786846','5','OrderItems object (5)',3,'',12,4),(7,'2023-01-26 00:00:13.788344','4','OrderItems object (4)',3,'',12,4),(8,'2023-01-26 00:00:13.789342','3','OrderItems object (3)',3,'',12,4),(9,'2023-01-26 00:00:13.790342','2','OrderItems object (2)',3,'',12,4),(10,'2023-01-26 00:00:13.791340','1','OrderItems object (1)',3,'',12,4),(11,'2023-01-26 00:00:21.303943','11','Orders object (11)',3,'',11,4),(12,'2023-01-26 00:00:21.306940','10','Orders object (10)',3,'',11,4),(13,'2023-01-26 00:00:21.308438','9','Orders object (9)',3,'',11,4),(14,'2023-01-26 00:00:21.318426','8','Orders object (8)',3,'',11,4),(15,'2023-01-26 00:00:21.319425','7','Orders object (7)',3,'',11,4),(16,'2023-01-26 00:00:21.321423','6','Orders object (6)',3,'',11,4),(17,'2023-01-26 00:00:21.322421','5','Orders object (5)',3,'',11,4),(18,'2023-01-26 00:00:21.323420','4','Orders object (4)',3,'',11,4),(19,'2023-01-26 00:00:21.324919','3','Orders object (3)',3,'',11,4),(20,'2023-01-26 00:10:20.323511','12','OrderItems object (12)',3,'',12,4),(21,'2023-01-26 00:10:20.326508','11','OrderItems object (11)',3,'',12,4),(22,'2023-01-26 00:10:20.328006','10','OrderItems object (10)',3,'',12,4),(23,'2023-01-26 00:10:20.329005','9','OrderItems object (9)',3,'',12,4),(24,'2023-01-26 00:10:25.139349','15','Orders object (15)',3,'',11,4),(25,'2023-01-26 00:10:25.141846','14','Orders object (14)',3,'',11,4),(26,'2023-01-26 00:10:25.142845','13','Orders object (13)',3,'',11,4),(27,'2023-01-26 00:10:25.143844','12','Orders object (12)',3,'',11,4),(28,'2023-01-26 00:17:49.711651','5','will',3,'',7,4),(29,'2023-01-26 00:17:57.869060','1','admin@admin.com',3,'',7,4),(30,'2023-01-26 00:24:51.090222','8','',3,'',7,4);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'accounts','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(8,'authtoken','token'),(9,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(6,'order','products'),(12,'products','orderitems'),(11,'products','orders'),(10,'products','products'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-24 22:18:02.323339'),(2,'contenttypes','0002_remove_content_type_name','2023-01-24 22:18:02.369785'),(3,'auth','0001_initial','2023-01-24 22:18:02.548075'),(4,'auth','0002_alter_permission_name_max_length','2023-01-24 22:18:02.591524'),(5,'auth','0003_alter_user_email_max_length','2023-01-24 22:18:02.599515'),(6,'auth','0004_alter_user_username_opts','2023-01-24 22:18:02.607506'),(7,'auth','0005_alter_user_last_login_null','2023-01-24 22:18:02.612500'),(8,'auth','0006_require_contenttypes_0002','2023-01-24 22:18:02.614997'),(9,'auth','0007_alter_validators_add_error_messages','2023-01-24 22:18:02.623487'),(10,'auth','0008_alter_user_username_max_length','2023-01-24 22:18:02.628980'),(11,'auth','0009_alter_user_last_name_max_length','2023-01-24 22:18:02.633974'),(12,'auth','0010_alter_group_name_max_length','2023-01-24 22:18:02.645461'),(13,'auth','0011_update_proxy_permissions','2023-01-24 22:18:02.651454'),(14,'auth','0012_alter_user_first_name_max_length','2023-01-24 22:18:02.658446'),(15,'accounts','0001_initial','2023-01-24 22:18:02.931125'),(16,'admin','0001_initial','2023-01-24 22:18:03.013528'),(17,'admin','0002_logentry_remove_auto_add','2023-01-24 22:18:03.022018'),(18,'admin','0003_logentry_add_action_flag_choices','2023-01-24 22:18:03.028011'),(19,'authtoken','0001_initial','2023-01-24 22:18:03.079451'),(20,'authtoken','0002_auto_20160226_1747','2023-01-24 22:18:03.097929'),(21,'authtoken','0003_tokenproxy','2023-01-24 22:18:03.100925'),(22,'order','0001_initial','2023-01-24 22:18:03.103922'),(23,'sessions','0001_initial','2023-01-24 22:18:03.130890'),(24,'accounts','0002_remove_user_username','2023-01-24 22:38:07.522511'),(25,'order','0002_delete_products','2023-01-24 23:05:26.743380'),(26,'products','0001_initial','2023-01-24 23:06:23.952295'),(27,'products','0002_orders_orderitems','2023-01-25 16:29:40.376660'),(28,'products','0003_alter_orderitems_id_alter_orders_id','2023-01-25 17:50:57.510163');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('cxkseq8ddv5amnty84x9bmu79co6yxds','.eJxVjEEOwiAQRe_C2pAODFBcuvcMZGBAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hYnEWKE6_W6T0yG0HfKd2m2Wa27pMUe6KPGiX15nz83K4fweVev3WxbJTABhZccwWNQ7aeKARTbTGa1TkdQFCh6qMMCQHCXMx2lkFCo14fwDBmDZ7:1pKmpQ:rKliypkjhIxVk2Roej-90sQNUasBu4SD7teD2K8feXk','2023-02-08 20:57:08.258229');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `quantity_in_stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'quia',2,0),(2,'qui',4,8),(3,'sed',7,1),(4,'adipisci',2,0),(5,'perferendis',1,5),(6,'aliquid',9,0),(7,'mollitia',9,3),(8,'asperiores',9,8),(9,'nobis',0,5),(10,'recusandae',9,7),(11,'ut',7,1),(12,'dolores',7,5),(13,'non',8,6),(14,'nesciunt',8,2),(15,'quo',7,7),(16,'eos',1,1),(17,'unde',5,5),(18,'quis',8,0),(19,'est',1,0),(20,'ipsam',4,0),(21,'enim',9,2),(22,'eaque',4,6),(23,'dolor',9,0),(24,'iure',6,0),(25,'cum',4,1),(26,'possimus',5,2),(27,'ullam',2,5),(28,'id',4,5),(29,'itaque',9,4),(30,'eius',5,0),(31,'magni',7,8),(32,'eum',7,1),(33,'et',7,3),(34,'ducimus',3,0),(35,'officiis',9,0),(36,'nihil',6,7),(37,'vel',8,0),(38,'dolore',4,0),(39,'harum',7,1),(40,'aut',8,8),(41,'fugiat',8,0),(42,'tempora',7,9),(43,'sint',8,2),(44,'commodi',7,0),(45,'dolorem',6,2),(46,'in',1,7),(47,'ipsa',8,3),(48,'omnis',3,9),(49,'voluptatibus',2,3),(50,'consectetur',4,8),(51,'explicabo',0,4),(52,'temporibus',2,4),(53,'consequuntur',9,4),(54,'minus',3,1),(55,'hic',7,6),(56,'architecto',1,9),(57,'ipsum',3,1),(58,'earum',0,9),(59,'quas',3,1),(60,'delectus',0,1),(61,'illum',7,2),(62,'dignissimos',7,8),(63,'voluptates',1,1),(64,'assumenda',6,3),(65,'dolorum',5,3),(66,'velit',8,3),(67,'laudantium',7,7),(68,'quaerat',4,1),(69,'labore',5,7),(70,'quasi',1,0),(71,'molestias',1,8),(72,'ea',0,2),(73,'consequatur',1,8),(74,'ratione',4,9),(75,'rerum',0,0),(76,'molestiae',5,4),(77,'totam',6,7),(78,'corrupti',0,3),(79,'saepe',6,3),(80,'dicta',0,2),(81,'voluptatem',6,8),(82,'occaecati',5,8),(83,'sequi',4,6),(84,'similique',4,0),(85,'illo',8,1),(86,'exercitationem',0,2),(87,'odio',5,4),(88,'sit',1,3),(89,'voluptate',1,4),(90,'animi',9,6),(91,'perspiciatis',6,7),(92,'soluta',8,7),(93,'a',4,0),(94,'vitae',8,0),(95,'voluptatum',2,5),(96,'voluptas',1,6),(97,'veritatis',7,7),(98,'incidunt',5,9),(99,'quos',7,8),(100,'debitis',6,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_orderitems`
--

DROP TABLE IF EXISTS `products_orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_orderitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_orderitems_product_id_06cb5ae9_fk_products_id` (`product_id`),
  KEY `products_orderitems_order_id_4e93d267_fk` (`order_id`),
  CONSTRAINT `products_orderitems_order_id_4e93d267_fk` FOREIGN KEY (`order_id`) REFERENCES `products_orders` (`id`),
  CONSTRAINT `products_orderitems_product_id_06cb5ae9_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_orderitems`
--

LOCK TABLES `products_orderitems` WRITE;
/*!40000 ALTER TABLE `products_orderitems` DISABLE KEYS */;
INSERT INTO `products_orderitems` VALUES (13,3,16,25),(14,1,17,25),(15,1,18,25);
/*!40000 ALTER TABLE `products_orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_orders`
--

DROP TABLE IF EXISTS `products_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_orders_user_id_2e88aed7_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `products_orders_user_id_2e88aed7_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_orders`
--

LOCK TABLES `products_orders` WRITE;
/*!40000 ALTER TABLE `products_orders` DISABLE KEYS */;
INSERT INTO `products_orders` VALUES (16,4),(17,4),(18,4);
/*!40000 ALTER TABLE `products_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-26 11:12:57
