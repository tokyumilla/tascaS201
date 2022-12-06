CREATE DATABASE  IF NOT EXISTS `n1exercici2` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `n1exercici2`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: n1exercici2
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
-- Table structure for table `burger`
--

DROP TABLE IF EXISTS `burger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `burger` (
  `idBurger` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`idBurger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `burger`
--

LOCK TABLES `burger` WRITE;
/*!40000 ALTER TABLE `burger` DISABLE KEYS */;
/*!40000 ALTER TABLE `burger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `Surnames` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `Address` varchar(300) COLLATE utf8mb3_bin DEFAULT NULL,
  `ZIP Code` int DEFAULT NULL,
  `City` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `Province` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `PhoneNumber` int DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinks`
--

DROP TABLE IF EXISTS `drinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drinks` (
  `idDrinks` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`idDrinks`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinks`
--

LOCK TABLES `drinks` WRITE;
/*!40000 ALTER TABLE `drinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `drinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrders` int NOT NULL AUTO_INCREMENT,
  `DateTime` datetime NOT NULL,
  `SendHome` tinyint(1) NOT NULL,
  `TotalCost` float NOT NULL,
  `Clients_idClient` int NOT NULL,
  `Shop_idShop` int NOT NULL,
  PRIMARY KEY (`idOrders`),
  KEY `fk_Orders_Clients1_idx` (`Clients_idClient`),
  KEY `fk_Orders_Shop1_idx` (`Shop_idShop`),
  CONSTRAINT `fk_Orders_Clients1` FOREIGN KEY (`Clients_idClient`) REFERENCES `clients` (`idClient`),
  CONSTRAINT `fk_Orders_Shop1` FOREIGN KEY (`Shop_idShop`) REFERENCES `shop` (`idShop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_has_products`
--

DROP TABLE IF EXISTS `orders_has_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_products` (
  `Orders_idOrders` int NOT NULL,
  `Products_idProducts` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`Orders_idOrders`,`Products_idProducts`),
  KEY `fk_Orders_has_Products_Products1_idx` (`Products_idProducts`),
  KEY `fk_Orders_has_Products_Orders1_idx` (`Orders_idOrders`),
  CONSTRAINT `fk_Orders_has_Products_Orders1` FOREIGN KEY (`Orders_idOrders`) REFERENCES `orders` (`idOrders`),
  CONSTRAINT `fk_Orders_has_Products_Products1` FOREIGN KEY (`Products_idProducts`) REFERENCES `products` (`idProducts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_products`
--

LOCK TABLES `orders_has_products` WRITE;
/*!40000 ALTER TABLE `orders_has_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_has_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzas`
--

DROP TABLE IF EXISTS `pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzas` (
  `idPizzas` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `PizzasCategories_idPizzasCategories` int NOT NULL,
  PRIMARY KEY (`idPizzas`),
  KEY `fk_Pizzas_PizzasCategories1_idx` (`PizzasCategories_idPizzasCategories`),
  CONSTRAINT `fk_Pizzas_PizzasCategories1` FOREIGN KEY (`PizzasCategories_idPizzasCategories`) REFERENCES `pizzascategories` (`idPizzasCategories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzas`
--

LOCK TABLES `pizzas` WRITE;
/*!40000 ALTER TABLE `pizzas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzascategories`
--

DROP TABLE IF EXISTS `pizzascategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzascategories` (
  `idPizzasCategories` int NOT NULL AUTO_INCREMENT,
  `Category` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`idPizzasCategories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzascategories`
--

LOCK TABLES `pizzascategories` WRITE;
/*!40000 ALTER TABLE `pizzascategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizzascategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idProducts` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(300) COLLATE utf8mb3_bin DEFAULT NULL,
  `Image` blob,
  `Drinks_idDrinks` int DEFAULT NULL,
  `Burger_idBurger` int DEFAULT NULL,
  `Pizzas_idPizzas` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`idProducts`),
  UNIQUE KEY `Drinks_idDrinks_UNIQUE` (`Drinks_idDrinks`),
  UNIQUE KEY `Burger_idBurger_UNIQUE` (`Burger_idBurger`),
  UNIQUE KEY `Pizzas_idPizzas_UNIQUE` (`Pizzas_idPizzas`),
  KEY `fk_Products_Drinks1_idx` (`Drinks_idDrinks`),
  KEY `fk_Products_Burger1_idx` (`Burger_idBurger`),
  KEY `fk_Products_Pizzas1_idx` (`Pizzas_idPizzas`),
  CONSTRAINT `fk_Products_Burger1` FOREIGN KEY (`Burger_idBurger`) REFERENCES `burger` (`idBurger`),
  CONSTRAINT `fk_Products_Drinks1` FOREIGN KEY (`Drinks_idDrinks`) REFERENCES `drinks` (`idDrinks`),
  CONSTRAINT `fk_Products_Pizzas1` FOREIGN KEY (`Pizzas_idPizzas`) REFERENCES `pizzas` (`idPizzas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendhomeorders`
--

DROP TABLE IF EXISTS `sendhomeorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sendhomeorders` (
  `Orders_idOrders` int NOT NULL,
  `DateTime` datetime DEFAULT NULL,
  `DeliveredBy` int NOT NULL,
  PRIMARY KEY (`Orders_idOrders`),
  KEY `fk_SendHomeOrders_Workers1_idx` (`DeliveredBy`),
  KEY `fk_SendHomeOrders_Orders1_idx` (`Orders_idOrders`),
  CONSTRAINT `fk_SendHomeOrders_Orders1` FOREIGN KEY (`Orders_idOrders`) REFERENCES `orders` (`idOrders`),
  CONSTRAINT `fk_SendHomeOrders_Workers1` FOREIGN KEY (`DeliveredBy`) REFERENCES `workers` (`idWorkers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendhomeorders`
--

LOCK TABLES `sendhomeorders` WRITE;
/*!40000 ALTER TABLE `sendhomeorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sendhomeorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `idShop` int NOT NULL AUTO_INCREMENT,
  `Address` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `ZIP Code` int DEFAULT NULL,
  `City` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `Province` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`idShop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers` (
  `idWorkers` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `Surnames` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `NIF` int DEFAULT NULL,
  `PhoneNumber` int DEFAULT NULL,
  `WorkerTypes_idWorkerTypes` int NOT NULL,
  `Shop_idShop` int NOT NULL,
  PRIMARY KEY (`idWorkers`),
  KEY `fk_Workers_WorkerTypes1_idx` (`WorkerTypes_idWorkerTypes`),
  KEY `fk_Workers_Shop1_idx` (`Shop_idShop`),
  CONSTRAINT `fk_Workers_Shop1` FOREIGN KEY (`Shop_idShop`) REFERENCES `shop` (`idShop`),
  CONSTRAINT `fk_Workers_WorkerTypes1` FOREIGN KEY (`WorkerTypes_idWorkerTypes`) REFERENCES `workertypes` (`idWorkerTypes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workertypes`
--

DROP TABLE IF EXISTS `workertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workertypes` (
  `idWorkerTypes` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) COLLATE utf8mb3_bin NOT NULL COMMENT 'Cocinero o repartidor',
  PRIMARY KEY (`idWorkerTypes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workertypes`
--

LOCK TABLES `workertypes` WRITE;
/*!40000 ALTER TABLE `workertypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `workertypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-06 20:35:11
