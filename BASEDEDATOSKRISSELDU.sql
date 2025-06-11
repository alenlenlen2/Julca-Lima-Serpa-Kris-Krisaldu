-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: krisseldu
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `ejercicio_id` bigint NOT NULL,
  `asistencia` enum('presente','ausente','realizado') NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `ejercicio_id` (`ejercicio_id`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES (1,77,8,'ausente','2025-06-07 17:39:22','https://videoserver.com/videos/video_general.mp4'),(2,19,5,'realizado','2025-06-07 17:49:02','https://videoserver.com/videos/video_grabado.mp4'),(3,79,6,'ausente','2025-06-07 18:34:35','https://videoserver.com/videos/video_general.mp4'),(4,78,6,'realizado','2025-06-07 20:52:15','https://videoserver.com/videos/video_grabado.mp4'),(5,39,6,'realizado','2025-06-07 21:00:03','https://videoserver.com/videos/video_grabado.mp4'),(6,39,5,'realizado','2025-06-07 21:01:59','https://videoserver.com/videos/video_grabado.mp4'),(7,41,6,'realizado','2025-06-07 21:11:34','https://videoserver.com/videos/video_grabado.mp4'),(8,41,5,'realizado','2025-06-07 21:15:28','https://videoserver.com/videos/video_grabado.mp4'),(9,36,5,'realizado','2025-06-07 21:16:54','https://videoserver.com/videos/video_grabado.mp4'),(10,43,7,'realizado','2025-06-08 02:17:08','https://videoserver.com/videos/video_grabado.mp4'),(11,80,7,'realizado','2025-06-08 02:55:37','https://videoserver.com/videos/video_grabado.mp4'),(12,82,7,'realizado','2025-06-09 03:07:51','https://videoserver.com/videos/video_grabado.mp4'),(13,82,8,'realizado','2025-06-09 03:14:03','https://www.youtube.com/watch?v=qMjqrK-ecic&ab_channel=GimnasioVirtual%7CFundaci%C3%B3nSielBleu'),(14,81,7,'realizado','2025-06-10 00:51:43','https://videoserver.com/videos/video_grabado.mp4'),(15,81,8,'realizado','2025-06-10 01:08:35','https://videoserver.com/videos/video_grabado.mp4'),(16,36,6,'realizado','2025-06-10 11:27:47','https://www.youtube.com/watch?v=qMjqrK-ecic&ab_channel=GimnasioVirtual%7CFundaci%C3%B3nSielBleu'),(17,53,6,'realizado','2025-06-10 11:38:10',''),(18,83,8,'realizado','2025-06-10 12:08:55',''),(19,83,7,'realizado','2025-06-10 12:12:13',''),(20,84,5,'realizado','2025-06-10 15:22:08',''),(21,84,6,'realizado','2025-06-10 15:42:50',''),(22,85,7,'realizado','2025-06-11 04:44:45',NULL),(23,85,8,'realizado','2025-06-11 04:46:25',''),(24,86,5,'realizado','2025-06-11 05:08:47',''),(25,87,7,'ausente','2025-06-11 05:35:21','https://videoserver.com/videos/video_general.mp4'),(26,86,6,'ausente','2025-06-11 06:07:11','https://videoserver.com/videos/video_general.mp4');
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicion_ejercicio`
--

DROP TABLE IF EXISTS `condicion_ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condicion_ejercicio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `condicion_id` bigint NOT NULL,
  `ejercicio_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `condicion_id` (`condicion_id`),
  KEY `ejercicio_id` (`ejercicio_id`),
  CONSTRAINT `condicion_ejercicio_ibfk_1` FOREIGN KEY (`condicion_id`) REFERENCES `condiciones` (`id`),
  CONSTRAINT `condicion_ejercicio_ibfk_2` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicion_ejercicio`
--

LOCK TABLES `condicion_ejercicio` WRITE;
/*!40000 ALTER TABLE `condicion_ejercicio` DISABLE KEYS */;
INSERT INTO `condicion_ejercicio` VALUES (1,1,5),(2,1,6),(3,2,7),(4,2,8);
/*!40000 ALTER TABLE `condicion_ejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicion_terapeuta`
--

DROP TABLE IF EXISTS `condicion_terapeuta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condicion_terapeuta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `condicion_id` bigint NOT NULL,
  `terapeuta_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `condicion_id` (`condicion_id`),
  KEY `terapeuta_id` (`terapeuta_id`),
  CONSTRAINT `condicion_terapeuta_ibfk_1` FOREIGN KEY (`condicion_id`) REFERENCES `condiciones` (`id`),
  CONSTRAINT `condicion_terapeuta_ibfk_2` FOREIGN KEY (`terapeuta_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicion_terapeuta`
--

LOCK TABLES `condicion_terapeuta` WRITE;
/*!40000 ALTER TABLE `condicion_terapeuta` DISABLE KEYS */;
INSERT INTO `condicion_terapeuta` VALUES (1,1,9),(2,2,10),(3,2,17),(4,1,54);
/*!40000 ALTER TABLE `condicion_terapeuta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condiciones`
--

DROP TABLE IF EXISTS `condiciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condiciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condiciones`
--

LOCK TABLES `condiciones` WRITE;
/*!40000 ALTER TABLE `condiciones` DISABLE KEYS */;
INSERT INTO `condiciones` VALUES (2,'Esguince de tobillo'),(1,'Tendinitis');
/*!40000 ALTER TABLE `condiciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejercicios`
--

DROP TABLE IF EXISTS `ejercicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejercicios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `horarios` varchar(255) DEFAULT NULL,
  `realizado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicios`
--

LOCK TABLES `ejercicios` WRITE;
/*!40000 ALTER TABLE `ejercicios` DISABLE KEYS */;
INSERT INTO `ejercicios` VALUES (5,'Ejercicio de estiramiento para tendinitis','Estiramiento del tendón afectado para mejorar la flexibilidad.','Mañana y tarde',1),(6,'Fortalecimiento muscular para tendinitis','Ejercicios para fortalecer músculos relacionados.','Tarde',0),(7,'Movilización suave para esguince de tobillo','Movilización para recuperar movilidad articular.','Mañana',0),(8,'Ejercicio de equilibrio para esguince de tobillo','Ejercicios para mejorar el equilibrio y estabilidad.','Noche',0);
/*!40000 ALTER TABLE `ejercicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `terapeuta_id` bigint NOT NULL,
  `paciente_id` bigint NOT NULL,
  `contenido` text NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `leido` tinyint(1) DEFAULT '0',
  `video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `terapeuta_id` (`terapeuta_id`),
  KEY `paciente_id` (`paciente_id`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`terapeuta_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`paciente_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES (1,10,64,'hola\r\n','2025-06-02 18:29:55',0,NULL),(2,10,69,'hola','2025-06-02 18:30:44',1,NULL),(3,10,69,'hola como estas? este ejerccicio va acorde a lo que te pedi','2025-06-02 18:31:43',1,NULL),(4,10,69,'sdngfsfgfadg','2025-06-02 19:47:14',1,NULL),(5,54,41,'hola','2025-06-03 02:46:41',1,NULL),(6,10,69,'holallala','2025-06-03 03:20:03',1,NULL),(7,10,69,'holsoladk','2025-06-03 03:26:56',1,NULL),(8,10,69,'fdgfdg','2025-06-03 03:33:16',1,NULL),(9,10,69,'dfgdfgfdgfd','2025-06-03 03:33:21',1,NULL),(10,10,69,'ghfgh','2025-06-03 03:47:30',1,NULL),(11,10,69,'fghgfhgf','2025-06-03 03:47:34',1,NULL),(12,10,69,'hfghgfh','2025-06-03 03:47:37',1,NULL),(13,10,69,'fdfsdfdsf','2025-06-03 04:43:09',1,NULL),(14,54,70,'hola\r\n','2025-06-03 04:56:54',1,NULL),(15,54,75,'dfhsjdf','2025-06-03 22:14:37',1,NULL),(16,54,75,'rjjfd\r\n','2025-06-04 19:56:42',0,NULL),(17,9,75,'435346346 hola gamer\r\n','2025-06-06 18:15:16',0,NULL),(18,54,75,'hola','2025-06-06 18:16:18',0,NULL),(19,54,75,'fdfdsfsd','2025-06-06 20:07:49',0,NULL),(20,9,41,'hola','2025-06-07 23:52:07',1,NULL),(21,9,79,'hola, como estas?','2025-06-08 02:26:15',1,NULL),(22,10,43,'hola','2025-06-08 02:28:37',1,NULL),(23,10,82,'hola, que tal, como le va?','2025-06-09 03:08:52',1,NULL),(24,9,84,'hjryury','2025-06-10 15:26:25',1,NULL),(25,9,39,'fwefwefew','2025-06-11 04:07:17',0,NULL),(26,9,84,'ewfdefwefwef','2025-06-11 04:08:31',1,NULL),(27,9,84,'dsfsdfsd','2025-06-11 04:10:56',1,NULL),(28,9,86,'hola, como estas','2025-06-11 05:30:05',1,NULL);
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `mensaje_id` bigint NOT NULL,
  `vista` varchar(100) DEFAULT NULL,
  `leido` tinyint(1) DEFAULT '0',
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `mensaje_id` (`mensaje_id`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`mensaje_id`) REFERENCES `mensajes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,64,1,'home',0,'2025-06-02 18:29:55'),(2,69,2,'home',0,'2025-06-02 18:30:44'),(3,69,3,'home',0,'2025-06-02 18:31:43'),(4,69,4,'home',0,'2025-06-02 19:47:14'),(5,41,5,'home',0,'2025-06-03 02:46:41'),(6,69,6,'home',0,'2025-06-03 03:20:03'),(7,69,7,'home',0,'2025-06-03 03:26:56'),(8,69,8,'home',0,'2025-06-03 03:33:16'),(9,69,9,'home',0,'2025-06-03 03:33:21'),(10,69,10,'home',0,'2025-06-03 03:47:30'),(11,69,11,'home',0,'2025-06-03 03:47:34'),(12,69,12,'home',0,'2025-06-03 03:47:37'),(13,69,13,'home',0,'2025-06-03 04:43:09'),(14,70,14,'home',0,'2025-06-03 04:56:54'),(15,75,15,'home',0,'2025-06-03 22:14:37'),(16,75,16,'home',0,'2025-06-04 19:56:42'),(17,75,17,'home',0,'2025-06-06 18:15:16'),(18,75,18,'home',0,'2025-06-06 18:16:18'),(19,75,19,'home',0,'2025-06-06 20:07:49'),(20,41,20,'home',0,'2025-06-07 23:52:07'),(21,79,21,'home',0,'2025-06-08 02:26:15'),(22,43,22,'home',0,'2025-06-08 02:28:37'),(23,82,23,'home',0,'2025-06-09 03:08:52'),(24,84,24,'home',0,'2025-06-10 15:26:25'),(25,39,25,'home',0,'2025-06-11 04:07:17'),(26,84,26,'home',0,'2025-06-11 04:08:31'),(27,84,27,'home',0,'2025-06-11 04:10:56'),(28,86,28,'home',0,'2025-06-11 05:30:05');
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_token`
--

DROP TABLE IF EXISTS `password_reset_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `token` varchar(100) NOT NULL,
  `fecha_expiracion` timestamp NOT NULL,
  `usado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `password_reset_token_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_token`
--

LOCK TABLES `password_reset_token` WRITE;
/*!40000 ALTER TABLE `password_reset_token` DISABLE KEYS */;
INSERT INTO `password_reset_token` VALUES (4,79,'7e3c3f80-ad9a-4be4-81bf-a9d85469b0cc','2025-06-08 04:48:37',0),(5,79,'886010a3-86e5-490b-b531-ed7b11de9164','2025-06-08 04:50:53',0),(6,79,'3f95a5bf-9234-43b6-b3ea-7c24ff3932bb','2025-06-08 04:57:50',0),(7,79,'a3e7fadc-c355-4da9-a7bb-a75d78295ee2','2025-06-08 04:58:23',0),(8,79,'0cc16975-6c5b-4155-8331-4eca45b8917c','2025-06-08 04:58:30',0),(9,79,'bd794378-03aa-411c-b40d-d5b8e780de0f','2025-06-08 04:58:35',0),(10,79,'ace3f19e-5243-45c7-8cd7-f9c5a405a1fc','2025-06-08 05:00:56',0),(11,79,'b1ad290c-c029-480f-adb5-17d35b91b4da','2025-06-08 05:04:31',0),(12,79,'49e746ff-769d-451d-a203-1ff8aafae56f','2025-06-08 05:04:39',0),(13,79,'892278e7-b343-4a5b-a31f-72d5f710532b','2025-06-08 05:04:53',0),(14,79,'c1e85770-a0e3-461a-8506-6b9c08d8b5c3','2025-06-08 05:15:13',0),(15,81,'725654','2025-06-08 05:21:45',0),(16,81,'638103','2025-06-08 05:22:58',0),(17,81,'238741','2025-06-08 04:31:23',0),(18,79,'130881','2025-06-08 04:35:30',0),(19,79,'972600','2025-06-08 04:42:21',0),(20,79,'199212','2025-06-08 04:42:45',0);
/*!40000 ALTER TABLE `password_reset_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `terapeuta_id` bigint DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_terapeuta` (`terapeuta_id`),
  CONSTRAINT `fk_terapeuta` FOREIGN KEY (`terapeuta_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (9,'Carlos','Ramírez',35,'236732846','carlos.terapeuta','hashedpass1','TERAPEUTA',NULL,NULL),(10,'María','López',40,'87654321','maria.terapeuta','hashedpass2','TERAPEUTA',NULL,NULL),(11,'Juan','Pérez',28,'11223344','juan.paciente','hashedpass3','PACIENTE',NULL,NULL),(12,'Ana','Gómez',32,'44332211','ana.paciente','hashedpass4','PACIENTE',NULL,NULL),(14,'alen','serpa',45,'75678934','alenlenlen','cerpa2828','PACIENTE',NULL,NULL),(15,'Kristel','Julca',20,'234324','Julca','kristel','PACIENTE',NULL,NULL),(16,'Edu','Lima',23,'75678937','Edu','cerpa','PACIENTE',NULL,NULL),(17,'Alfredo','Serpa',37,'23412123','Alfredo.terapeuta','cerpa2828','TERAPEUTA',NULL,NULL),(18,'alens','serpa',28,'75678937','alenlenlens','cerpa','PACIENTE',NULL,NULL),(19,'carlos','serva',26,'75678930','carlos','cerpa','PACIENTE',NULL,NULL),(20,'eduar','serr',35,'7883434','alenss','cerpa','PACIENTE',NULL,NULL),(21,'alen','cerpa',24,'75678939','alx','cerpa','PACIENTE',NULL,NULL),(22,'Cristopher','saravia',39,'324234324','Cristopher','cerpa','PACIENTE',NULL,NULL),(23,'alex','serpa',39,'32423412','alex','cerpa','PACIENTE',NULL,NULL),(24,'asd','asd',34,'213123','alem','cerpa','PACIENTE',NULL,NULL),(28,'alemm','axd',34,'75678939','alemm','cerpa2828','PACIENTE',NULL,NULL),(32,'alens','serpa',45,'453453','a123','123','PACIENTE',NULL,NULL),(33,'moly','julca',23,'12312312','moly','1234','PACIENTE',NULL,NULL),(34,'Cristopher','serpa',23,'123123','2343423','cerpa2828','PACIENTE',NULL,NULL),(36,'alen','Julca',56,'232324','alennne','cerpa2828','PACIENTE',NULL,NULL),(37,'omar','serpa',46,'75678937','omar','omar','PACIENTE',NULL,NULL),(38,'cris','serps',34,'75678937','cris','cris','PACIENTE',NULL,NULL),(39,'alec','alx',34,'332432324','alec','ccerpa2828','PACIENTE',NULL,NULL),(40,'ramona','serpa',38,'34235654','ramona','ramona','PACIENTE',NULL,NULL),(41,'Roberto','Serpa',39,'2343247','roberto','cerpa2828','PACIENTE',NULL,NULL),(42,'carmen','yares',34,'3246667','Carmen','cerpa2828','PACIENTE',NULL,NULL),(43,'Alfredo','Carlin',35,'34324342234','Al','cerpa2828','PACIENTE',NULL,NULL),(44,'Cesar','Hba',38,'32423545','Cesar','cerpa2828','PACIENTE',NULL,NULL),(46,'Cristopher','carwasi',39,'3243545','Cristopheer','cerpa2828','PACIENTE',NULL,NULL),(47,'Javier','Caceres',34,'75693784','Javier','cerpa2828','PACIENTE',NULL,NULL),(51,'Cesar','Ramírez',45,'12345678','cesar123','cerpa','TERAPEUTA',NULL,NULL),(52,'Paolo','Ramirez',38,'5345545','Paolo','cerpa2828','PACIENTE',NULL,NULL),(53,'Carlos','Julca',68,'2343445','Caarlos','cerpa2828','PACIENTE',NULL,NULL),(54,'henry','Ramírez',45,'12345678','Henry.terapeuta','henry','TERAPEUTA',NULL,NULL),(55,'Alfonso','Ugarte',25,'75678939','Alfonso1','123','PACIENTE',NULL,NULL),(56,'cvbdfb','fdgdfg',14,'34324453','alenlen2','cerpa','PACIENTE',NULL,NULL),(57,'Alessandro','supe',34,'75678934','supe123','123','PACIENTE',NULL,NULL),(58,'Cristophere','asddasf',19,'234324','Cristophere','Cristophere','PACIENTE',NULL,NULL),(61,'alen','324',34,'324234','123','123','PACIENTE',NULL,NULL),(63,'alens','ertrgrtg',15,'3432545','alen3','cerpa','PACIENTE',NULL,NULL),(64,'123','120',120,'123124434','a1234','1234','PACIENTE',NULL,NULL),(66,'alen','4343',14,'343432423','alenx','1234','PACIENTE',NULL,NULL),(67,'Castillo','Castillo',46,'234324325','Castillo','Castillo','PACIENTE',NULL,NULL),(68,'Luz','cardenas',35,'545435435','luzz','luz','PACIENTE',NULL,NULL),(69,'Shirley','Saravia',36,'31033865','Shirley','shirley123','PACIENTE',NULL,NULL),(70,'Mario','Serpa',23,'343545454','mario','mario','PACIENTE',NULL,NULL),(71,'dsfsd','dfsdfs',26,'32434','ase','ase','PACIENTE',NULL,NULL),(72,'324324','34324',34,'32434','alñ','alñ','PACIENTE',NULL,NULL),(73,'Lola','mento',23,'324234234','Lola','Lola','PACIENTE',NULL,NULL),(74,'Carla','Supe',29,'76348926','Carla','Carla','PACIENTE',NULL,NULL),(75,'Samuel','Samar',20,'23648273','Samuel1','Samuel1','PACIENTE',NULL,NULL),(76,'alenlen','carl',34,'23432443','alenlen','cerpa2828','PACIENTE',NULL,NULL),(77,'Samuel ','Samar',34,'23443232','samuel12','samuel12','PACIENTE',NULL,NULL),(78,'Hector','Vilcarromero',28,'73135724','samuelgamer','samuelgamer','PACIENTE',NULL,'samuelsamar2005@gmail.com'),(79,'Alfredo','Cerpa',36,'34572729','alen','cerpa2828','PACIENTE',NULL,'alenlen2802@gmail.com'),(80,'Ramon','Valdez',19,'63683487',NULL,'cerpa2828','PACIENTE',NULL,'ramon13@gmail.com'),(81,'Moly','Julca',20,'74132851',NULL,'kristel123','PACIENTE',NULL,'julcacorsino21@gmail.com'),(82,'ramones','carlsf',25,'43534543',NULL,'111111','PACIENTE',NULL,'1111@gmail.com'),(83,'maria','Serpa',26,'34656877',NULL,'cerpa2828','PACIENTE',NULL,'maria1@gmail.com'),(84,'lllo','dfghj',22,'11111111',NULL,'12345678','PACIENTE',NULL,'11110@gmail.com'),(85,'34545','34543',12,'23242349',NULL,'cerpa2828','PACIENTE',NULL,'233@gmail.com'),(86,'34234','4234',34,'34356763',NULL,'cerpa2828','PACIENTE',NULL,'213213@gmail.com'),(87,'anita','melania',45,'74328243',NULL,'anita123','PACIENTE',NULL,'anita123@gmail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_condicion`
--

DROP TABLE IF EXISTS `usuario_condicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_condicion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `condicion_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `condicion_id` (`condicion_id`),
  CONSTRAINT `usuario_condicion_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `usuario_condicion_ibfk_2` FOREIGN KEY (`condicion_id`) REFERENCES `condiciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_condicion`
--

LOCK TABLES `usuario_condicion` WRITE;
/*!40000 ALTER TABLE `usuario_condicion` DISABLE KEYS */;
INSERT INTO `usuario_condicion` VALUES (1,11,1),(2,12,2),(3,14,2),(4,15,1),(5,16,1),(6,18,1),(7,19,1),(8,20,1),(9,21,2),(10,22,2),(11,23,2),(12,24,1),(13,28,1),(14,32,1),(15,33,2),(16,34,2),(17,36,1),(18,37,1),(19,38,2),(20,39,1),(21,40,2),(22,41,1),(23,42,2),(24,43,2),(25,44,1),(26,46,1),(27,47,2),(28,51,1),(29,51,1),(30,52,2),(31,53,1),(32,55,2),(33,56,2),(34,57,2),(35,58,2),(36,61,1),(37,63,2),(38,64,2),(39,66,2),(40,67,1),(41,68,2),(42,69,2),(43,70,1),(44,71,2),(45,72,2),(46,73,1),(47,74,1),(48,75,1),(49,76,1),(50,77,2),(51,78,1),(52,79,1),(53,80,2),(54,81,2),(55,82,2),(56,83,2),(57,84,1),(58,85,2),(59,86,1),(60,87,2);
/*!40000 ALTER TABLE `usuario_condicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_ejercicio`
--

DROP TABLE IF EXISTS `usuario_ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_ejercicio` (
  `usuario_id` bigint NOT NULL,
  `ejercicio_id` bigint NOT NULL,
  `realizado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`usuario_id`,`ejercicio_id`),
  KEY `ejercicio_id` (`ejercicio_id`),
  CONSTRAINT `usuario_ejercicio_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `usuario_ejercicio_ibfk_2` FOREIGN KEY (`ejercicio_id`) REFERENCES `ejercicios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_ejercicio`
--

LOCK TABLES `usuario_ejercicio` WRITE;
/*!40000 ALTER TABLE `usuario_ejercicio` DISABLE KEYS */;
INSERT INTO `usuario_ejercicio` VALUES (11,5,1),(11,6,1),(12,7,1),(12,8,1),(14,7,1),(14,8,1),(15,5,1),(15,6,1),(16,5,1),(16,6,1),(19,5,1),(19,6,1),(20,5,1),(21,7,1),(22,7,1),(22,8,1),(23,7,1),(24,5,1),(32,5,1),(32,6,1),(33,7,0),(33,8,0),(36,5,1),(36,6,1),(39,5,1),(39,6,1),(40,7,1),(40,8,1),(41,5,1),(41,6,1),(43,7,1),(43,8,0),(46,5,0),(46,6,0),(47,7,1),(52,7,1),(53,5,1),(53,6,1),(56,7,1),(56,8,0),(57,7,1),(63,7,0),(63,8,0),(64,7,1),(64,8,1),(66,7,1),(66,8,1),(67,5,1),(67,6,1),(68,7,1),(68,8,0),(69,7,1),(69,8,1),(70,5,1),(72,7,0),(72,8,0),(73,5,0),(73,6,0),(74,5,0),(74,6,1),(75,5,1),(75,6,1),(76,5,0),(76,6,0),(77,7,1),(77,8,0),(78,5,1),(78,6,1),(79,5,1),(79,6,1),(80,7,1),(80,8,0),(81,7,1),(81,8,1),(82,7,1),(82,8,1),(83,7,1),(83,8,1),(84,5,1),(84,6,1),(85,7,1),(85,8,1),(86,5,1),(86,6,0),(87,7,0),(87,8,0);
/*!40000 ALTER TABLE `usuario_ejercicio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-11  1:24:59
