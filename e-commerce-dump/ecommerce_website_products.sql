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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pro_image` varchar(255) DEFAULT NULL,
  `pro_name` varchar(40) NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'image-1694700104642.blacktea.jpg','black tea -500g',20,250,'This is good product'),(4,'image-1694761198899.blackpepper.jpg','BlackPepper-500g',100,450,''),(5,'image-1694761246602.f70u_fkqn_210609.jpg','Chili Powder - 200g',50,500,'Good product'),(6,'image-1695492345626.cardmon.jpg','cardmon-250g',100,250,'Newly Launched'),(7,'image-1695651564157.assortment-ginger-wooden-board.jpg','Ginger 250g',100,500,'Good product'),(8,'image-1695790530882.stack-cinnamon.jpg','Cinnamon',50,750,'This is premium quality'),(9,'image-1695791713233.curry powder.jpg','Curry Powder- 500g',25,400,'Curry Powder'),(10,'image-1695791929702.green tea.jpg','Green Tea - 500g',50,250,'Green Tea'),(11,'image-1695792447727.paprika.jpg','Paprika -100g',25,150,'Paprika'),(12,'image-1695792787378.safron.jpg','Safron',50,500,'Safron'),(13,'image-1695792963344.basil.jpg','Basil',50,500,'Basil'),(14,'image-1695793428402.cups-herbal-tea-with-spices-wooden-board.jpg','Herbal Tea - 100g',50,500,'Herbal Tea'),(15,'image-1695793665109.OIUGVK0.jpg','Scent',50,300,'Scent'),(18,'image-1696097466452.5101.jpg','Chili-Peeper-200g',50,250,'good product');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-06 14:25:47
