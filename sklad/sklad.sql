-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: sklad
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('ff4a18f009ce');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text,
  `year` year NOT NULL,
  `publisher` varchar(30) NOT NULL,
  `author` varchar(30) NOT NULL,
  `rating_sum` int NOT NULL,
  `rating_num` int NOT NULL,
  `amount` int NOT NULL,
  `visits_count` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_books_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (7,'Пальто','',1901,'Яра Дыбовая','Зима',0,0,100,7),(8,'','qweqwe',2016,'qweqwe','qwe',0,0,500,0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_genres`
--

DROP TABLE IF EXISTS `books_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `books_id` int NOT NULL,
  `genres_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_books_genres_books_id_books` (`books_id`),
  KEY `fk_books_genres_genres_id_genres` (`genres_id`),
  CONSTRAINT `fk_books_genres_books_id_books` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_books_genres_genres_id_genres` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_genres`
--

LOCK TABLES `books_genres` WRITE;
/*!40000 ALTER TABLE `books_genres` DISABLE KEYS */;
INSERT INTO `books_genres` VALUES (3,7,2),(4,8,3);
/*!40000 ALTER TABLE `books_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `covers`
--

DROP TABLE IF EXISTS `covers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covers` (
  `id` varchar(100) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `md5_hash` varchar(100) NOT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_covers_md5_hash` (`md5_hash`),
  UNIQUE KEY `uq_covers_book_id` (`book_id`),
  CONSTRAINT `fk_covers_book_id_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covers`
--

LOCK TABLES `covers` WRITE;
/*!40000 ALTER TABLE `covers` DISABLE KEYS */;
INSERT INTO `covers` VALUES ('6c9a8ef0-8875-4a2d-bd9f-417e4541d793','photo_2023-10-20_15.17.54.jpeg','image/jpeg','4143bb25f1b291e3ddd5ff20ded494fb',7),('c2c8bfd1-f851-4e27-8098-1f7e32b95e38','LFE71FMSKfg.jpg','image/jpeg','5287fa1c279c2febcff5f5eb8cfeb442',8);
/*!40000 ALTER TABLE `covers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_genres_genre_name` (`genre_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (3,'Аксессуары'),(2,'Верхняя одежда'),(4,'Лифчики'),(1,'Обувь'),(6,'Платья'),(7,'Свитера'),(8,'Футболки'),(5,'Штаны');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `rating` int NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_book_id_books` (`book_id`),
  KEY `fk_reviews_user_id_users` (`user_id`),
  CONSTRAINT `fk_reviews_book_id_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_reviews_user_id_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_roles_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Администратор',NULL),(2,'Модератор',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `role_id` int NOT NULL,
  `password_hash` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_login` (`login`),
  KEY `fk_users_role_id_roles` (`role_id`),
  CONSTRAINT `fk_users_role_id_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ronaldo228','Donald','Trump','Obama',1,'pbkdf2:sha256:260000$1iQRV7sTigecqUU8$2718c843c4965e9f90d0528667a123da289ed261056b55d9d8aabad9bbd23d28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_logs`
--

DROP TABLE IF EXISTS `visit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(50) NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `book_id` int NOT NULL,
  `book_name` varchar(100) NOT NULL,
  `fio_user` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_logs`
--

LOCK TABLES `visit_logs` WRITE;
/*!40000 ALTER TABLE `visit_logs` DISABLE KEYS */;
INSERT INTO `visit_logs` VALUES (1,'/book/show/1',1,'2023-10-12 15:02:52',1,'Лифчик hello kitty','Trump Donald Obama'),(2,'/book/show/1',1,'2023-10-12 15:03:00',1,'Лифчик hello kitty','Trump Donald Obama'),(3,'/book/show/1',1,'2023-10-12 15:03:02',1,'Лифчик hello kitty','Trump Donald Obama'),(4,'/book/show/1',1,'2023-10-12 15:03:03',1,'Лифчик hello kitty','Trump Donald Obama'),(5,'/book/show/1',1,'2023-10-12 15:03:04',1,'Лифчик hello kitty','Trump Donald Obama'),(6,'/book/show/1',1,'2023-10-12 15:03:04',1,'Лифчик hello kitty','Trump Donald Obama'),(7,'/book/show/1',1,'2023-10-12 15:03:04',1,'Лифчик hello kitty','Trump Donald Obama'),(8,'/book/show/1',1,'2023-10-12 15:03:16',1,'Лифчик hello kitty','Trump Donald Obama'),(9,'/book/show/1',1,'2023-10-12 15:03:17',1,'Лифчик hello kitty','Trump Donald Obama'),(10,'/book/show/1',1,'2023-10-12 15:03:17',1,'Лифчик hello kitty','Trump Donald Obama'),(11,'/book/show/1',1,'2023-10-12 15:04:28',1,'Лифчик hello kitty','Trump Donald Obama'),(12,'/book/show/1',1,'2023-10-12 15:04:30',1,'Лифчик hello kitty','Trump Donald Obama'),(13,'/book/show/1',1,'2023-10-12 15:04:31',1,'Лифчик hello kitty','Trump Donald Obama'),(14,'/book/show/1',1,'2023-10-12 15:04:32',1,'Лифчик hello kitty','Trump Donald Obama'),(15,'/book/show/1',1,'2023-10-12 15:04:32',1,'Лифчик hello kitty','Trump Donald Obama'),(16,'/book/show/1',1,'2023-10-12 15:05:27',1,'Лифчик hello kitty','Trump Donald Obama'),(17,'/book/show/1',1,'2023-10-12 15:05:28',1,'Лифчик hello kitty','Trump Donald Obama'),(18,'/book/show/1',1,'2023-10-12 15:05:29',1,'Лифчик hello kitty','Trump Donald Obama'),(19,'/book/show/1',1,'2023-10-12 15:06:09',1,'Лифчик hello kitty','Trump Donald Obama'),(20,'/book/show/1',1,'2023-10-12 15:06:10',1,'Лифчик hello kitty','Trump Donald Obama'),(21,'/book/show/1',1,'2023-10-12 15:06:13',1,'Лифчик hello kitty','Trump Donald Obama'),(22,'/book/show/1',1,'2023-10-12 15:09:05',1,'Лифчик hello kitty','Trump Donald Obama'),(23,'/book/show/1',1,'2023-10-12 15:12:56',1,'Лифчик hello kitty','Trump Donald Obama'),(24,'/book/show/1',1,'2023-10-12 15:13:02',1,'Лифчик hello kitty','Trump Donald Obama'),(25,'/book/show/1',1,'2023-10-12 15:13:17',1,'Лифчик hello kitty','Trump Donald Obama'),(26,'/book/show/1',1,'2023-10-12 15:18:04',1,'Лифчик hello kitty','Trump Donald Obama'),(27,'/book/show/1',1,'2023-10-12 15:18:12',1,'Лифчик hello kitty','Trump Donald Obama'),(28,'/book/show/1',1,'2023-10-12 15:18:17',1,'Лифчик hello kitty','Trump Donald Obama'),(29,'/book/show/1',1,'2023-10-12 15:18:24',1,'Лифчик hello kitty','Trump Donald Obama'),(30,'/book/show/1',1,'2023-10-12 15:18:28',1,'Лифчик hello kitty','Trump Donald Obama'),(31,'/book/show/1',1,'2023-10-12 15:18:32',1,'Лифчик hello kitty','Trump Donald Obama'),(32,'/book/show/1',1,'2023-10-12 15:18:55',1,'Лифчик hello kitty','Trump Donald Obama'),(33,'/book/show/1',1,'2023-10-12 15:18:59',1,'Лифчик hello kitty','Trump Donald Obama'),(34,'/book/show/1',1,'2023-10-12 15:19:30',1,'Лифчик hello kitty','Trump Donald Obama'),(35,'/book/show/1',1,'2023-10-12 15:19:37',1,'Лифчик hello kitty','Trump Donald Obama'),(36,'/book/show/1',1,'2023-10-12 15:19:41',1,'Лифчик hello kitty','Trump Donald Obama'),(37,'/book/show/1',1,'2023-10-12 15:19:45',1,'Лифчик hello kitty','Trump Donald Obama'),(38,'/book/show/1',1,'2023-10-12 15:22:35',1,'Лифчик hello kitty','Trump Donald Obama'),(39,'/book/show/1',1,'2023-10-12 15:22:42',1,'Лифчик hello kitty','Trump Donald Obama'),(40,'/book/show/1',1,'2023-10-12 15:22:43',1,'Лифчик hello kitty','Trump Donald Obama'),(41,'/book/show/1',1,'2023-10-12 15:22:55',1,'Лифчик hello kitty','Trump Donald Obama'),(42,'/book/show/1',1,'2023-10-12 15:22:58',1,'Лифчик hello kitty','Trump Donald Obama'),(43,'/book/show/1',1,'2023-10-12 15:22:59',1,'Лифчик hello kitty','Trump Donald Obama'),(44,'/book/show/1',1,'2023-10-12 15:23:00',1,'Лифчик hello kitty','Trump Donald Obama'),(45,'/book/show/1',1,'2023-10-12 15:23:02',1,'Лифчик hello kitty','Trump Donald Obama'),(46,'/book/show/1',1,'2023-10-12 15:23:43',1,'Лифчик hello kitty','Trump Donald Obama'),(47,'/book/show/1',1,'2023-10-12 15:23:47',1,'Лифчик hello kitty','Trump Donald Obama'),(48,'/book/show/1',1,'2023-10-12 15:23:48',1,'Лифчик hello kitty','Trump Donald Obama'),(49,'/book/show/1',1,'2023-10-12 15:23:50',1,'Лифчик hello kitty','Trump Donald Obama'),(50,'/book/show/1',1,'2023-10-12 15:24:13',1,'Лифчик hello kitty','Trump Donald Obama'),(51,'/book/show/1',1,'2023-10-12 15:24:27',1,'Лифчик hello kitty','Trump Donald Obama'),(52,'/book/show/1',1,'2023-10-12 15:25:01',1,'Лифчик hello kitty','Trump Donald Obama'),(53,'/book/show/1',1,'2023-10-12 15:25:03',1,'Лифчик hello kitty','Trump Donald Obama'),(54,'/book/show/1',1,'2023-10-12 15:25:03',1,'Лифчик hello kitty','Trump Donald Obama'),(55,'/book/show/1',1,'2023-10-12 15:26:17',1,'Лифчик hello kitty','Trump Donald Obama'),(56,'/book/show/1',1,'2023-10-12 15:26:20',1,'Лифчик hello kitty','Trump Donald Obama'),(57,'/book/show/1',1,'2023-10-12 15:26:52',1,'Лифчик hello kitty','Trump Donald Obama'),(58,'/book/show/1',1,'2023-10-12 15:34:12',1,'Лифчик hello kitty','Trump Donald Obama'),(59,'/book/show/1',1,'2023-10-20 12:14:48',1,'Лифчик hello kitty','Trump Donald Obama'),(60,'/book/show/7',1,'2023-10-20 12:28:10',7,'Пальто','Trump Donald Obama'),(61,'/book/show/7',1,'2023-10-20 12:29:47',7,'Пальто','Trump Donald Obama'),(62,'/book/show/7',1,'2023-10-20 12:32:47',7,'Пальто','Trump Donald Obama'),(63,'/book/show/7',1,'2023-10-27 12:01:26',7,'Пальто','Trump Donald Obama'),(64,'/book/show/7',1,'2023-10-27 12:32:17',7,'Пальто','Trump Donald Obama'),(65,'/book/show/7',1,'2023-11-01 22:22:30',7,'Пальто','Trump Donald Obama'),(66,'/book/show/7',1,'2023-11-01 22:22:34',7,'Пальто','Trump Donald Obama'),(67,'/book/show/7',1,'2023-11-01 22:22:48',7,'Пальто','Trump Donald Obama'),(68,'/book/show/8',1,'2023-11-01 22:23:30',8,'','Trump Donald Obama');
/*!40000 ALTER TABLE `visit_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-02 14:19:45
