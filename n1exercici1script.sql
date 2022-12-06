-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idAddress` int NOT NULL AUTO_INCREMENT,
  `Street` varchar(45) NOT NULL,
  `Flat` smallint DEFAULT NULL,
  `Door` varchar(4) DEFAULT NULL,
  `City` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `ZIP Code` int DEFAULT NULL,
  PRIMARY KEY (`idAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idClients` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `PhoneNumber` int DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `CreationDate` date DEFAULT NULL,
  `Address_idAddress` int DEFAULT NULL,
  `RecommendedBy` int DEFAULT NULL,
  PRIMARY KEY (`idClients`),
  KEY `fk_Clients_Address1_idx` (`Address_idAddress`),
  KEY `fk_Clients_Clients1_idx` (`RecommendedBy`),
  CONSTRAINT `fk_Clients_Address1` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`),
  CONSTRAINT `fk_Clients_Clients1` FOREIGN KEY (`RecommendedBy`) REFERENCES `clients` (`idClients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `framecolours`
--

DROP TABLE IF EXISTS `framecolours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `framecolours` (
  `idFrameColours` int NOT NULL AUTO_INCREMENT,
  `Colour` varchar(45) NOT NULL,
  PRIMARY KEY (`idFrameColours`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `framecolours`
--

LOCK TABLES `framecolours` WRITE;
/*!40000 ALTER TABLE `framecolours` DISABLE KEYS */;
INSERT INTO `framecolours` VALUES (1,'Rojo'),(2,'Verde'),(3,'Azul');
/*!40000 ALTER TABLE `framecolours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frametype`
--

DROP TABLE IF EXISTS `frametype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frametype` (
  `idFrameType` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`idFrameType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frametype`
--

LOCK TABLES `frametype` WRITE;
/*!40000 ALTER TABLE `frametype` DISABLE KEYS */;
INSERT INTO `frametype` VALUES (1,'Pasta'),(2,'Flotante'),(3,'Metal');
/*!40000 ALTER TABLE `frametype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasscolour`
--

DROP TABLE IF EXISTS `glasscolour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasscolour` (
  `idGlassColour` int NOT NULL AUTO_INCREMENT,
  `Colour` varchar(45) NOT NULL,
  PRIMARY KEY (`idGlassColour`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasscolour`
--

LOCK TABLES `glasscolour` WRITE;
/*!40000 ALTER TABLE `glasscolour` DISABLE KEYS */;
INSERT INTO `glasscolour` VALUES (1,'Rojo'),(2,'Verde'),(3,'Azul');
/*!40000 ALTER TABLE `glasscolour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `idGlasses` int NOT NULL AUTO_INCREMENT,
  `Graduation` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Trademarks_idTrademarks` int DEFAULT NULL,
  `FrameColours_idFrameColours` int DEFAULT NULL,
  `FrameType_idFrameType` int DEFAULT NULL,
  `GlassColour_idGlassColour` int DEFAULT NULL,
  PRIMARY KEY (`idGlasses`),
  KEY `fk_Glasses_Trademarks1_idx` (`Trademarks_idTrademarks`),
  KEY `fk_Glasses_FrameColours1_idx` (`FrameColours_idFrameColours`),
  KEY `fk_Glasses_FrameType1_idx` (`FrameType_idFrameType`),
  KEY `fk_Glasses_GlassColour1_idx` (`GlassColour_idGlassColour`),
  CONSTRAINT `fk_Glasses_FrameColours1` FOREIGN KEY (`FrameColours_idFrameColours`) REFERENCES `framecolours` (`idFrameColours`),
  CONSTRAINT `fk_Glasses_FrameType1` FOREIGN KEY (`FrameType_idFrameType`) REFERENCES `frametype` (`idFrameType`),
  CONSTRAINT `fk_Glasses_GlassColour1` FOREIGN KEY (`GlassColour_idGlassColour`) REFERENCES `glasscolour` (`idGlassColour`),
  CONSTRAINT `fk_Glasses_Trademarks1` FOREIGN KEY (`Trademarks_idTrademarks`) REFERENCES `trademarks` (`idTrademarks`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (6,1,1,1,1,1,1),(7,2,1,2,2,1,2);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `idSales` int NOT NULL AUTO_INCREMENT,
  `Clients_idClients` int NOT NULL,
  `Sellers_idSellers` int NOT NULL,
  PRIMARY KEY (`idSales`),
  KEY `fk_Sales_Clients1_idx` (`Clients_idClients`),
  KEY `fk_Sales_Sellers1_idx` (`Sellers_idSellers`),
  CONSTRAINT `fk_Sales_Clients1` FOREIGN KEY (`Clients_idClients`) REFERENCES `clients` (`idClients`),
  CONSTRAINT `fk_Sales_Sellers1` FOREIGN KEY (`Sellers_idSellers`) REFERENCES `sellers` (`idSellers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `idSellers` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`idSellers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Phone Number` int DEFAULT NULL,
  `Fax` int DEFAULT NULL,
  `Address_idAddress` int DEFAULT NULL,
  PRIMARY KEY (`idSupplier`),
  KEY `fk_Supplier_Address_idx` (`Address_idAddress`),
  CONSTRAINT `fk_Supplier_Address` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'PAco',NULL,NULL,NULL),(2,'Manuel',NULL,NULL,NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trademarks`
--

DROP TABLE IF EXISTS `trademarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trademarks` (
  `idTrademarks` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Supplier_idSupplier` int NOT NULL,
  PRIMARY KEY (`idTrademarks`,`Supplier_idSupplier`),
  KEY `fk_Trademarks_Supplier1_idx` (`Supplier_idSupplier`),
  CONSTRAINT `fk_Trademarks_Supplier1` FOREIGN KEY (`Supplier_idSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trademarks`
--

LOCK TABLES `trademarks` WRITE;
/*!40000 ALTER TABLE `trademarks` DISABLE KEYS */;
INSERT INTO `trademarks` VALUES (1,'GafasPaco',1),(2,'GafasJose',2);
/*!40000 ALTER TABLE `trademarks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-06 18:49:26
