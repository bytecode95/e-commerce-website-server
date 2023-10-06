-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_website
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_id_prefix` char(5) NOT NULL DEFAULT 'SC10',
  `user_id` int NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_signup` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'SC10',1,'2023-09-23 08:25:36',5002.50,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(2,'SC10',1,'2023-09-23 08:48:44',6152.50,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(7,'SC10',1,'2023-09-23 13:06:41',5175.00,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(11,'SC10',1,'2023-09-23 13:11:35',5175.00,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(12,'SC10',1,'2023-09-23 13:15:09',5175.00,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(13,'SC10',1,'2023-09-23 13:15:51',5175.00,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(14,'SC10',2,'2023-09-23 13:43:32',3967.50,'Cash on Delivery','27A, akbartown, araliya garden, wattala','pending'),(15,'SC10',3,'2023-09-23 13:56:09',1630.00,'Cash on Delivery','11, Welsiripura, Madiwela, Kotte','pending'),(16,'SC10',3,'2023-09-23 13:59:38',2205.00,'Cash on Delivery','11, Welsiripura, Madiwela, Kotte','pending'),(17,'SC10',4,'2023-09-23 14:06:46',3967.50,'Cash on Delivery','25/A, Pragathipura, Madiwela, Kotte','pending'),(18,'SC10',4,'2023-09-23 14:10:30',3967.50,'Cash on Delivery','25/A, Pragathipura, Madiwela, Kotte','pending'),(19,'SC10',4,'2023-09-23 14:11:41',2262.50,'Cash on Delivery','25/A, Pragathipura, Madiwela, Kotte','pending'),(20,'SC10',4,'2023-09-23 14:14:15',1745.00,'Cash on Delivery','25/A, Pragathipura, Madiwela, Kotte','pending'),(21,'SC10',4,'2023-09-23 14:16:37',1745.00,'Cash on Delivery','25/A, Pragathipura, Madiwela, Kotte','pending'),(22,'SC10',1,'2023-09-23 14:18:23',2587.50,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(23,'SC10',1,'2023-09-27 06:41:59',4427.50,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(24,'SC10',2,'2023-09-27 07:02:12',2472.50,'Cash on Delivery','27A, akbartown, araliya garden, wattala','pending'),(25,'SC10',1,'2023-09-27 07:08:50',2587.50,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(26,'SC10',1,'2023-09-27 07:11:32',1572.50,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(27,'SC10',1,'2023-09-27 07:17:29',20.00,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(28,'SC10',1,'2023-09-27 13:54:21',3450.00,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(29,'SC10',2,'2023-09-27 14:07:11',1227.50,'Cash on Delivery','27A, akbartown, araliya garden, wattala','pending'),(30,'SC10',2,'2023-09-27 14:12:59',1917.50,'Cash on Delivery','27A, akbartown, araliya garden, wattala','pending'),(31,'SC10',2,'2023-09-27 14:17:34',3622.50,'Cash on Delivery','27A, akbartown, araliya garden, wattala','pending'),(32,'SC10',1,'2023-09-27 19:07:45',2875.00,'Cash on Delivery','10, Pragthipura, Madiwela, Kotte','pending'),(33,'SC10',2,'2023-09-27 19:10:05',2357.50,'Cash on Delivery','27A, akbartown, araliya garden, wattala','pending'),(34,'SC10',1,'2023-09-28 08:22:59',3105.00,'Cash on Delivery','10, Welsiripura, Madiwela, Kotte','pending'),(35,'SC10',1,'2023-09-28 10:49:04',4255.00,'Cash on Delivery','10, Welsiripura, Madiwela, Kotte','pending'),(36,'SC10',1,'2023-10-04 15:57:58',1745.00,'Cash on Delivery','10, Welsiripura, Madiwela, Kotte','pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-06 14:25:46
