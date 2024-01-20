-- MySQL dump 10.13  Distrib 8.2.0, for macos14.0 (arm64)
--
-- Host: 127.0.0.1    Database: fims
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `balance` decimal(10,0) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bond`
--

DROP TABLE IF EXISTS `bond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bond` (
  `bond_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` datetime NOT NULL,
  `open` double(12,6) DEFAULT NULL,
  `high` double(12,6) DEFAULT NULL,
  `low` double(12,6) DEFAULT NULL,
  `close` double(12,6) DEFAULT NULL,
  `adj_close` double(12,6) DEFAULT NULL,
  `volume` int DEFAULT NULL,
  PRIMARY KEY (`bond_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bond`
--

LOCK TABLES `bond` WRITE;
/*!40000 ALTER TABLE `bond` DISABLE KEYS */;
/*!40000 ALTER TABLE `bond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund`
--

DROP TABLE IF EXISTS `fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund` (
  `fund_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` datetime NOT NULL,
  `open` double(12,6) DEFAULT NULL,
  `high` double(12,6) DEFAULT NULL,
  `low` double(12,6) DEFAULT NULL,
  `close` double(12,6) DEFAULT NULL,
  `adj_close` double(12,6) DEFAULT NULL,
  `volume` int DEFAULT NULL,
  PRIMARY KEY (`fund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund`
--

LOCK TABLES `fund` WRITE;
/*!40000 ALTER TABLE `fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` datetime NOT NULL,
  `open` double(12,6) DEFAULT NULL,
  `high` double(12,6) DEFAULT NULL,
  `low` double(12,6) DEFAULT NULL,
  `close` double(12,6) DEFAULT NULL,
  `adj_close` double(12,6) DEFAULT NULL,
  `volume` int DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `stock_id` int DEFAULT NULL,
  `fund_id` int DEFAULT NULL,
  `bond_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `date` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `transaction_user_user_id_fk` (`user_id`),
  KEY `transaction_stock_stock_id_fk` (`stock_id`),
  KEY `transaction_fund_fund_id_fk` (`fund_id`),
  KEY `transaction_bond_bond_id_fk` (`bond_id`),
  CONSTRAINT `transaction_bond_bond_id_fk` FOREIGN KEY (`bond_id`) REFERENCES `bond` (`bond_id`),
  CONSTRAINT `transaction_fund_fund_id_fk` FOREIGN KEY (`fund_id`) REFERENCES `fund` (`fund_id`),
  CONSTRAINT `transaction_stock_stock_id_fk` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`stock_id`),
  CONSTRAINT `transaction_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户的id',
  `account_id` int NOT NULL COMMENT '用户钱包账号的id',
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'unknown' COMMENT '用户姓名',
  `gender` enum('man','woman','unknown') COLLATE utf8mb4_bin DEFAULT NULL COMMENT '性别',
  `user_type` enum('person','institution') COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户的类型',
  `disable` tinyint(1) DEFAULT NULL COMMENT '账户是否禁用',
  PRIMARY KEY (`user_id`),
  KEY `user_account_account_id_fk` (`account_id`),
  CONSTRAINT `user_account_account_id_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-20 17:40:52
