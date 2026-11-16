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
-- Dumping data for table `cuentas_usuario`
--

LOCK TABLES `cuentas_usuario` WRITE;
/*!40000 ALTER TABLE `cuentas_usuario` DISABLE KEYS */;
INSERT INTO `cuentas_usuario` VALUES (1,'pbkdf2_sha256$1000000$DwixaInfOfdcWW8qNiOuin$hER5rfv6e1uwslVPxuwq8lKrVTSENnOrckf6j9x2IT0=','2026-11-16 02:43:21.089375',1,'admin','Agustin','cONTRERAS','admin@aventurasdelsur.cl',1,1,'2026-11-15 05:39:28.059672','admin'),(2,'pbkdf2_sha256$1000000$ii8R0KpfzImFv4ea5CbyIH$yPXr9uNCjNEQL9xFxAoYlycxge7oxgrxbgBcy7KtZW0=','2026-11-16 01:50:54.509434',0,'guia1','Carolina','Castillo','guia1@aventurasdelsur.cl',0,1,'2026-11-15 05:39:28.643643','guia'),(3,'pbkdf2_sha256$1000000$QACwfzCdBL9Utn3ZawCnhh$tW9MDdbebz+ezhxpNV++2JeOT7VHenwDNPSwhxOjzzM=',NULL,0,'guia2','Nacho','Peralta','guia2@aventurasdelsur.cl',0,1,'2026-11-15 05:39:29.264267','guia'),(4,'pbkdf2_sha256$1000000$1hvSKBkFEmdVNpbhcLa8V9$8q00nTvs1Niec+hyNgE/pQ6dsihiipvRvnGMu1aoLG4=','2026-11-16 01:58:46.979546',0,'turista1','Matias','Contreras','turista1@correo.cl',0,1,'2026-11-15 05:39:29.891523','turista'),(5,'pbkdf2_sha256$1000000$vilC7zLdRO6JJRZydutZ5H$Bhse0LCJmmfqoTNAhtVM7nGmMKW8ZR9ZhgiAQR6TaMY=',NULL,0,'turista2','Luis','Miguel','turista2@correo.cl',0,1,'2026-11-15 05:39:30.486761','turista');
/*!40000 ALTER TABLE `cuentas_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `experiencias_categoria`
--

LOCK TABLES `experiencias_categoria` WRITE;
/*!40000 ALTER TABLE `experiencias_categoria` DISABLE KEYS */;
INSERT INTO `experiencias_categoria` VALUES (1,'Trekking','Caminatas guiadas por senderos del parque.',1),(2,'Canopy','Circuitos de tirolesa entre árboles.',1),(3,'Kayak','Navegación en kayak por el lago.',1),(4,'Arriendo de equipos','Arriendo de equipamiento outdoor.',1);
/*!40000 ALTER TABLE `experiencias_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `experiencias_experiencia`
--

LOCK TABLES `experiencias_experiencia` WRITE;
/*!40000 ALTER TABLE `experiencias_experiencia` DISABLE KEYS */;
INSERT INTO `experiencias_experiencia` VALUES (1,'Trekking Cerro Mirador','Ascenso de 4 horas con vista al valle.',15000.00,12,'2026-11-20 05:39:30.491020',1,2),(2,'Canopy Bosque Nativo','Circuito de 8 tirolesas sobre bosque nativo.',25000.00,8,'2026-11-22 05:39:30.491020',2,2),(3,'Kayak en el Lago','Travesía guiada de 2 horas con equipo incluido.',20000.00,10,'2026-11-24 05:39:30.491020',3,2),(4,'Arriendo Kit de Camping','Carpa, saco de dormir y cocinilla por un día.',12000.00,15,'2026-11-26 05:39:30.491020',4,2),(5,'Trekking Cascada Escondida','Sendero de dificultad media hasta una cascada.',18000.00,10,'2026-11-21 05:39:30.491020',1,3),(6,'Canopy Nocturno','Tirolesas con iluminación bajo las estrellas.',30000.00,6,'2026-11-23 05:39:30.491020',2,3),(7,'Kayak al Amanecer','Salida temprana para ver la fauna del lago.',22000.00,8,'2026-11-25 05:39:30.491020',3,3),(8,'Arriendo Bicicletas de Montaña','Bicicleta con casco para recorrer las rutas.',10000.00,12,'2026-11-27 05:39:30.491020',4,3);
/*!40000 ALTER TABLE `experiencias_experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `experiencias_inscripcion`
--

LOCK TABLES `experiencias_inscripcion` WRITE;
/*!40000 ALTER TABLE `experiencias_inscripcion` DISABLE KEYS */;
INSERT INTO `experiencias_inscripcion` VALUES (3,'2026-11-15 05:39:30.501659','confirmado',5,4),(4,'2026-11-15 05:39:30.501972','pendiente',3,5),(5,'2026-11-15 05:39:30.502263','confirmado',6,5),(6,'2026-11-15 05:39:30.502537','confirmado',7,5),(7,'2026-11-15 06:06:40.575339','pendiente',8,4),(8,'2026-11-15 06:07:41.591945','pendiente',4,4);
/*!40000 ALTER TABLE `experiencias_inscripcion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-15 23:46:14
