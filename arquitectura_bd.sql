-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: eva3
-- ------------------------------------------------------
-- Server version	9.2.0

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_usuario'),(22,'Can change user',6,'change_usuario'),(23,'Can delete user',6,'delete_usuario'),(24,'Can view user',6,'view_usuario'),(25,'Can add categoria',7,'add_categoria'),(26,'Can change categoria',7,'change_categoria'),(27,'Can delete categoria',7,'delete_categoria'),(28,'Can view categoria',7,'view_categoria'),(29,'Can add experiencia',8,'add_experiencia'),(30,'Can change experiencia',8,'change_experiencia'),(31,'Can delete experiencia',8,'delete_experiencia'),(32,'Can view experiencia',8,'view_experiencia'),(33,'Can add inscripcion',9,'add_inscripcion'),(34,'Can change inscripcion',9,'change_inscripcion'),(35,'Can delete inscripcion',9,'delete_inscripcion'),(36,'Can view inscripcion',9,'view_inscripcion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas_usuario`
--

DROP TABLE IF EXISTS `cuentas_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `rol` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_usuario`
--

LOCK TABLES `cuentas_usuario` WRITE;
/*!40000 ALTER TABLE `cuentas_usuario` DISABLE KEYS */;
INSERT INTO `cuentas_usuario` VALUES (1,'pbkdf2_sha256$1000000$DwixaInfOfdcWW8qNiOuin$hER5rfv6e1uwslVPxuwq8lKrVTSENnOrckf6j9x2IT0=','2026-11-16 03:03:36.498726',1,'admin','Agustin','cONTRERAS','admin@aventurasdelsur.cl',1,1,'2026-11-15 05:39:28.059672','admin'),(2,'pbkdf2_sha256$1000000$ii8R0KpfzImFv4ea5CbyIH$yPXr9uNCjNEQL9xFxAoYlycxge7oxgrxbgBcy7KtZW0=','2026-11-16 01:50:54.509434',0,'guia1','Carolina','Castillo','guia1@aventurasdelsur.cl',0,1,'2026-11-15 05:39:28.643643','guia'),(3,'pbkdf2_sha256$1000000$QACwfzCdBL9Utn3ZawCnhh$tW9MDdbebz+ezhxpNV++2JeOT7VHenwDNPSwhxOjzzM=',NULL,0,'guia2','Nacho','Peralta','guia2@aventurasdelsur.cl',0,1,'2026-11-15 05:39:29.264267','guia'),(4,'pbkdf2_sha256$1000000$1hvSKBkFEmdVNpbhcLa8V9$8q00nTvs1Niec+hyNgE/pQ6dsihiipvRvnGMu1aoLG4=','2026-11-16 01:58:46.979546',0,'turista1','Matias','Contreras','turista1@correo.cl',0,1,'2026-11-15 05:39:29.891523','turista'),(5,'pbkdf2_sha256$1000000$vilC7zLdRO6JJRZydutZ5H$Bhse0LCJmmfqoTNAhtVM7nGmMKW8ZR9ZhgiAQR6TaMY=',NULL,0,'turista2','Luis','Miguel','turista2@correo.cl',0,1,'2026-11-15 05:39:30.486761','turista');
/*!40000 ALTER TABLE `cuentas_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas_usuario_groups`
--

DROP TABLE IF EXISTS `cuentas_usuario_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_usuario_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cuentas_usuario_groups_usuario_id_group_id_f5ef6c73_uniq` (`usuario_id`,`group_id`),
  KEY `cuentas_usuario_groups_group_id_e6725cc8_fk_auth_group_id` (`group_id`),
  CONSTRAINT `cuentas_usuario_groups_group_id_e6725cc8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `cuentas_usuario_groups_usuario_id_251ff583_fk_cuentas_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `cuentas_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_usuario_groups`
--

LOCK TABLES `cuentas_usuario_groups` WRITE;
/*!40000 ALTER TABLE `cuentas_usuario_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentas_usuario_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas_usuario_user_permissions`
--

DROP TABLE IF EXISTS `cuentas_usuario_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_usuario_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cuentas_usuario_user_per_usuario_id_permission_id_26c0acea_uniq` (`usuario_id`,`permission_id`),
  KEY `cuentas_usuario_user_permission_id_1753ad79_fk_auth_perm` (`permission_id`),
  CONSTRAINT `cuentas_usuario_user_permission_id_1753ad79_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `cuentas_usuario_user_usuario_id_5a9718f1_fk_cuentas_u` FOREIGN KEY (`usuario_id`) REFERENCES `cuentas_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_usuario_user_permissions`
--

LOCK TABLES `cuentas_usuario_user_permissions` WRITE;
/*!40000 ALTER TABLE `cuentas_usuario_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentas_usuario_user_permissions` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_cuentas_usuario_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_cuentas_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `cuentas_usuario` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(6,'cuentas','usuario'),(7,'experiencias','categoria'),(8,'experiencias','experiencia'),(9,'experiencias','inscripcion'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-11-16 02:59:17.760288'),(2,'contenttypes','0002_remove_content_type_name','2026-11-16 02:59:17.939733'),(3,'auth','0001_initial','2026-11-16 02:59:18.445346'),(4,'auth','0002_alter_permission_name_max_length','2026-11-16 02:59:18.552352'),(5,'auth','0003_alter_user_email_max_length','2026-11-16 02:59:18.562800'),(6,'auth','0004_alter_user_username_opts','2026-11-16 02:59:18.573159'),(7,'auth','0005_alter_user_last_login_null','2026-11-16 02:59:18.583266'),(8,'auth','0006_require_contenttypes_0002','2026-11-16 02:59:18.590106'),(9,'auth','0007_alter_validators_add_error_messages','2026-11-16 02:59:18.601925'),(10,'auth','0008_alter_user_username_max_length','2026-11-16 02:59:18.616403'),(11,'auth','0009_alter_user_last_name_max_length','2026-11-16 02:59:18.631050'),(12,'auth','0010_alter_group_name_max_length','2026-11-16 02:59:18.660540'),(13,'auth','0011_update_proxy_permissions','2026-11-16 02:59:18.671895'),(14,'auth','0012_alter_user_first_name_max_length','2026-11-16 02:59:18.683194'),(15,'cuentas','0001_initial','2026-11-16 02:59:19.256647'),(16,'admin','0001_initial','2026-11-16 02:59:19.570930'),(17,'admin','0002_logentry_remove_auto_add','2026-11-16 02:59:19.588219'),(18,'admin','0003_logentry_add_action_flag_choices','2026-11-16 02:59:19.601170'),(19,'experiencias','0001_initial','2026-11-16 02:59:20.177782'),(20,'sessions','0001_initial','2026-11-16 02:59:20.253029');
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
INSERT INTO `django_session` VALUES ('fyr13g9x1sbkp4u7hlah3hrbz1rp0l3g','.eJxVjDkOwjAQAP-yNbK88a6PlPS8IVpfOIASKUeF-DuKlALamdG8YZB9a8O-lmUYM_SAcPllUdKzTIfID5nus0rztC1jVEeiTruq25zL63q2f4Mma4MeiFgEE9lkvNiYjNchZGfEa0bEGgqzqxRQYvbW5-AMayTsOiZTScPnC8VeNoI:1xSn0K:KmdQ7K32320NSNpJtNfboXEht6h2MRAHgZuJhEuim_U','2026-11-30 03:03:36.506361');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_categoria`
--

DROP TABLE IF EXISTS `experiencias_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_categoria`
--

LOCK TABLES `experiencias_categoria` WRITE;
/*!40000 ALTER TABLE `experiencias_categoria` DISABLE KEYS */;
INSERT INTO `experiencias_categoria` VALUES (1,'Trekking','Caminatas guiadas por senderos del parque.',1),(2,'Canopy','Circuitos de tirolesa entre árboles.',1),(3,'Kayak','Navegación en kayak por el lago.',1),(4,'Arriendo de equipos','Arriendo de equipamiento outdoor.',1);
/*!40000 ALTER TABLE `experiencias_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_experiencia`
--

DROP TABLE IF EXISTS `experiencias_experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_experiencia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cupo_maximo` int unsigned NOT NULL,
  `fecha_hora` datetime(6) NOT NULL,
  `categoria_id` bigint NOT NULL,
  `creador_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiencias_experie_categoria_id_b03f452f_fk_experienc` (`categoria_id`),
  KEY `experiencias_experie_creador_id_70b19025_fk_cuentas_u` (`creador_id`),
  CONSTRAINT `experiencias_experie_categoria_id_b03f452f_fk_experienc` FOREIGN KEY (`categoria_id`) REFERENCES `experiencias_categoria` (`id`),
  CONSTRAINT `experiencias_experie_creador_id_70b19025_fk_cuentas_u` FOREIGN KEY (`creador_id`) REFERENCES `cuentas_usuario` (`id`),
  CONSTRAINT `experiencias_experiencia_chk_1` CHECK ((`cupo_maximo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_experiencia`
--

LOCK TABLES `experiencias_experiencia` WRITE;
/*!40000 ALTER TABLE `experiencias_experiencia` DISABLE KEYS */;
INSERT INTO `experiencias_experiencia` VALUES (1,'Trekking Cerro Mirador','Ascenso de 4 horas con vista al valle.',15000.00,12,'2026-11-20 05:39:30.491020',1,2),(2,'Canopy Bosque Nativo','Circuito de 8 tirolesas sobre bosque nativo.',25000.00,8,'2026-11-22 05:39:30.491020',2,2),(3,'Kayak en el Lago','Travesía guiada de 2 horas con equipo incluido.',20000.00,10,'2026-11-24 05:39:30.491020',3,2),(4,'Arriendo Kit de Camping','Carpa, saco de dormir y cocinilla por un día.',12000.00,15,'2026-11-26 05:39:30.491020',4,2),(5,'Trekking Cascada Escondida','Sendero de dificultad media hasta una cascada.',18000.00,10,'2026-11-21 05:39:30.491020',1,3),(6,'Canopy Nocturno','Tirolesas con iluminación bajo las estrellas.',30000.00,6,'2026-11-23 05:39:30.491020',2,3),(7,'Kayak al Amanecer','Salida temprana para ver la fauna del lago.',22000.00,8,'2026-11-25 05:39:30.491020',3,3),(8,'Arriendo Bicicletas de Montaña','Bicicleta con casco para recorrer las rutas.',10000.00,12,'2026-11-27 05:39:30.491020',4,3);
/*!40000 ALTER TABLE `experiencias_experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_inscripcion`
--

DROP TABLE IF EXISTS `experiencias_inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_inscripcion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_inscripcion` datetime(6) NOT NULL,
  `estado_pago` varchar(12) NOT NULL,
  `experiencia_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiencias_inscrip_experiencia_id_2fbecc6b_fk_experienc` (`experiencia_id`),
  KEY `experiencias_inscrip_usuario_id_9d6f5da2_fk_cuentas_u` (`usuario_id`),
  CONSTRAINT `experiencias_inscrip_experiencia_id_2fbecc6b_fk_experienc` FOREIGN KEY (`experiencia_id`) REFERENCES `experiencias_experiencia` (`id`),
  CONSTRAINT `experiencias_inscrip_usuario_id_9d6f5da2_fk_cuentas_u` FOREIGN KEY (`usuario_id`) REFERENCES `cuentas_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_inscripcion`
--

LOCK TABLES `experiencias_inscripcion` WRITE;
/*!40000 ALTER TABLE `experiencias_inscripcion` DISABLE KEYS */;
INSERT INTO `experiencias_inscripcion` VALUES (3,'2026-11-15 05:39:30.501659','confirmado',5,4),(4,'2026-11-15 05:39:30.501972','pendiente',3,5),(5,'2026-11-15 05:39:30.502263','confirmado',6,5),(6,'2026-11-15 05:39:30.502537','confirmado',7,5),(7,'2026-11-15 06:06:40.575339','pendiente',8,4),(8,'2026-11-15 06:07:41.591945','pendiente',4,4);
/*!40000 ALTER TABLE `experiencias_inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'eva3'
--

--
-- Dumping routines for database 'eva3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-16  0:08:09
