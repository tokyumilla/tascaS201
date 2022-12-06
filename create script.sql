CREATE DATABASE `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
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

CREATE TABLE `framecolours` (
  `idFrameColours` int NOT NULL AUTO_INCREMENT,
  `Colour` varchar(45) NOT NULL,
  PRIMARY KEY (`idFrameColours`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `frametype` (
  `idFrameType` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  PRIMARY KEY (`idFrameType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `glasscolour` (
  `idGlassColour` int NOT NULL AUTO_INCREMENT,
  `Colour` varchar(45) NOT NULL,
  PRIMARY KEY (`idGlassColour`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

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

CREATE TABLE `sellers` (
  `idSellers` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`idSellers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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

CREATE TABLE `trademarks` (
  `idTrademarks` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Supplier_idSupplier` int NOT NULL,
  PRIMARY KEY (`idTrademarks`,`Supplier_idSupplier`),
  KEY `fk_Trademarks_Supplier1_idx` (`Supplier_idSupplier`),
  CONSTRAINT `fk_Trademarks_Supplier1` FOREIGN KEY (`Supplier_idSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
