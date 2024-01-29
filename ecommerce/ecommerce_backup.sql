-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.23.10.1

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(10) DEFAULT NULL,
  `Minit` char(3) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `CPF` char(11) NOT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `unique_cpf_client` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Maria','M','Silva','12346789'),(2,'Matheus','O','Pimentel','987654321'),(3,'Ricardo','F','Silva','45678913'),(4,'Julia','S','França','789123456'),(5,'Roberta','G','Assis','98745631'),(6,'Isabela','M','Cruz','654789123');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `old_clients_record` BEFORE DELETE ON `clients` FOR EACH ROW begin
	INSERT INTO `ecommerce`.`old_clients`
		(`idClient`,`Fname`,`Minit`,`Lname`,`CPF`)
	VALUES
		(OLD.idClient, OLD.Fname, OLD.Minit, OLD.Lname, OLD.CPF);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `old_address_clean` BEFORE DELETE ON `clients` FOR EACH ROW begin
	delete from clientsAddress
		where idAddressClient = OLD.idClient;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientsAddress`
--

DROP TABLE IF EXISTS `clientsAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientsAddress` (
  `idAdress` int NOT NULL AUTO_INCREMENT,
  `idAddressClient` int NOT NULL,
  `Lname` varchar(10) NOT NULL,
  `Address1` varchar(120) DEFAULT NULL,
  `Address2` varchar(120) DEFAULT NULL,
  `Address3` varchar(120) DEFAULT NULL,
  `City` varchar(100) NOT NULL,
  `State` char(2) NOT NULL,
  `Country` char(2) NOT NULL,
  `PostalCode` varchar(9) NOT NULL,
  PRIMARY KEY (`idAdress`),
  KEY `fk_address_client` (`idAddressClient`),
  KEY `inx_city` (`City`),
  CONSTRAINT `fk_address_client` FOREIGN KEY (`idAddressClient`) REFERENCES `clients` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientsAddress`
--

LOCK TABLES `clientsAddress` WRITE;
/*!40000 ALTER TABLE `clientsAddress` DISABLE KEYS */;
INSERT INTO `clientsAddress` VALUES (1,1,'Casa','rua chuva de prata n29',NULL,NULL,'Jaraguá','SC','BR','89201-455'),(2,2,'Casa','rua chuva de ouro n30',NULL,NULL,'Joinville','SC','BR','89202-456'),(3,3,'Casa','rua chuva de água n31',NULL,NULL,'Araquari','SC','BR','89203-457'),(4,4,'Casa','rua chuva de prata n32',NULL,NULL,'Jaraguá','SC','BR','89201-455'),(5,5,'Casa','rua chuva de ouro n33',NULL,NULL,'Joinville','SC','BR','89202-456'),(6,6,'Casa','rua chuva de água n34',NULL,NULL,'Araquari','SC','BR','89203-457'),(7,1,'Trabalho','rua luz da lua n55',NULL,NULL,'São Francisco do Sul','SC','BR','89200-405'),(8,2,'Trabalho','rua plutao n66',NULL,NULL,'Barra Velha','SC','BR','89300-504');
/*!40000 ALTER TABLE `clientsAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clients_by_city_view`
--

DROP TABLE IF EXISTS `clients_by_city_view`;
/*!50001 DROP VIEW IF EXISTS `clients_by_city_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clients_by_city_view` AS SELECT 
 1 AS `City`,
 1 AS `State`,
 1 AS `client_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `old_clients`
--

DROP TABLE IF EXISTS `old_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `old_clients` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(10) DEFAULT NULL,
  `Minit` char(3) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `CPF` char(11) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_clients`
--

LOCK TABLES `old_clients` WRITE;
/*!40000 ALTER TABLE `old_clients` DISABLE KEYS */;
INSERT INTO `old_clients` VALUES (8,'Testeson','T','do Testemunho','654987321');
/*!40000 ALTER TABLE `old_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `idOrderClient` int DEFAULT NULL,
  `orderStatus` enum('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
  `orderDescription` varchar(255) DEFAULT NULL,
  `sendValue` float DEFAULT '10',
  `paymentCash` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idOrder`),
  KEY `fk_ordes_client` (`idOrderClient`),
  CONSTRAINT `fk_ordes_client` FOREIGN KEY (`idOrderClient`) REFERENCES `clients` (`idClient`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'Em processamento','compra via aplicativo',NULL,1),(2,2,'Em processamento','compra via aplicativo',50,0),(3,3,'Confirmado',NULL,NULL,1),(4,4,'Em processamento','compra via web site',150,0),(5,1,'Em processamento',NULL,10,0),(6,3,'Em processamento',NULL,10,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `idclient` int NOT NULL,
  `idPayment` int NOT NULL,
  `typePayment` enum('Boleto','Cartão','Dois cartões','Pix') DEFAULT NULL,
  `limitAvailable` float DEFAULT NULL,
  PRIMARY KEY (`idclient`,`idPayment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `Pname` varchar(255) NOT NULL,
  `classification_kids` tinyint(1) DEFAULT '0',
  `category` enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis','Limpeza','Acessórios','Informática','Pet Shop') NOT NULL,
  `avaliação` float DEFAULT '0',
  `size` varchar(10) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Fone de ouvido',0,'Eletrônico',4,NULL,59.90),(2,'Barbie Elsa',1,'Brinquedos',3,NULL,59.90),(3,'Body Carters',1,'Vestimenta',5,NULL,99.90),(4,'Microfone Vedo - Youtuber',0,'Eletrônico',4,NULL,89.90),(5,'Sofá retrátil',0,'Móveis',3,'3x57x80',259.90),(6,'Farinha de arroz',0,'Alimentos',2,NULL,1559.90),(7,'Alcool 70',0,'Limpeza',5,NULL,5.50),(8,'Memoria Ram DD4 Fireground',0,'Informática',3,NULL,189.90),(9,'Guia Fluffy Dog Temas',0,'Pet Shop',3,NULL,29.90),(10,'Kit de amarrador de cabelo c/10',0,'Acessórios',3,NULL,9.99);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productOrder`
--

DROP TABLE IF EXISTS `productOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productOrder` (
  `idPOproduct` int NOT NULL,
  `idPOorder` int NOT NULL,
  `poQuantity` int DEFAULT '1',
  `poStatus` enum('Disponível','Sem estoque') DEFAULT 'Disponível',
  PRIMARY KEY (`idPOproduct`,`idPOorder`),
  KEY `fk_productorder_order` (`idPOorder`),
  CONSTRAINT `fk_productorder_order` FOREIGN KEY (`idPOorder`) REFERENCES `orders` (`idOrder`),
  CONSTRAINT `fk_productorder_product` FOREIGN KEY (`idPOproduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productOrder`
--

LOCK TABLES `productOrder` WRITE;
/*!40000 ALTER TABLE `productOrder` DISABLE KEYS */;
INSERT INTO `productOrder` VALUES (1,1,2,NULL),(1,6,1,'Disponível'),(2,2,1,NULL),(3,3,3,NULL),(4,4,1,NULL),(4,6,1,'Disponível'),(8,6,2,'Disponível');
/*!40000 ALTER TABLE `productOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productSeller`
--

DROP TABLE IF EXISTS `productSeller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productSeller` (
  `idPseller` int NOT NULL,
  `idPproduct` int NOT NULL,
  `prodQuantity` int DEFAULT '1',
  PRIMARY KEY (`idPseller`,`idPproduct`),
  KEY `fk_product_product` (`idPproduct`),
  CONSTRAINT `fk_product_product` FOREIGN KEY (`idPproduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_product_seller` FOREIGN KEY (`idPseller`) REFERENCES `seller` (`idSeller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productSeller`
--

LOCK TABLES `productSeller` WRITE;
/*!40000 ALTER TABLE `productSeller` DISABLE KEYS */;
INSERT INTO `productSeller` VALUES (1,6,80),(2,7,10);
/*!40000 ALTER TABLE `productSeller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productStorage`
--

DROP TABLE IF EXISTS `productStorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productStorage` (
  `idProdStorage` int NOT NULL AUTO_INCREMENT,
  `storageLocation` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT '0',
  PRIMARY KEY (`idProdStorage`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productStorage`
--

LOCK TABLES `productStorage` WRITE;
/*!40000 ALTER TABLE `productStorage` DISABLE KEYS */;
INSERT INTO `productStorage` VALUES (1,'Rio de Janeiro',1000),(2,'Rio de Janeiro',500),(3,'São Paulo',10),(4,'São Paulo',100),(5,'São Paulo',10),(6,'Brasília',60);
/*!40000 ALTER TABLE `productStorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productSupplier`
--

DROP TABLE IF EXISTS `productSupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productSupplier` (
  `idPsSupplier` int NOT NULL,
  `idPsProduct` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idPsSupplier`,`idPsProduct`),
  KEY `fk_product_supplier_prodcut` (`idPsProduct`),
  CONSTRAINT `fk_product_supplier_prodcut` FOREIGN KEY (`idPsProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_product_supplier_supplier` FOREIGN KEY (`idPsSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productSupplier`
--

LOCK TABLES `productSupplier` WRITE;
/*!40000 ALTER TABLE `productSupplier` DISABLE KEYS */;
INSERT INTO `productSupplier` VALUES (1,1,500),(1,2,400),(2,4,633),(2,5,10),(3,3,5);
/*!40000 ALTER TABLE `productSupplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `idSeller` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(255) NOT NULL,
  `AbstName` varchar(255) DEFAULT NULL,
  `CNPJ` char(15) DEFAULT NULL,
  `CPF` char(9) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact` char(11) NOT NULL,
  PRIMARY KEY (`idSeller`),
  UNIQUE KEY `unique_cnpj_seller` (`CNPJ`),
  UNIQUE KEY `unique_cpf_seller` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Tech eletronics',NULL,'123456789456321',NULL,'Rio de Janeiro','219946287'),(2,'Botique Durgas',NULL,NULL,'123456783','Rio de Janeiro','219567895'),(3,'Kids World',NULL,'456789123654485',NULL,'São Paulo','1198657484');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storageLocation`
--

DROP TABLE IF EXISTS `storageLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storageLocation` (
  `idLproduct` int NOT NULL,
  `idLstorage` int NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`idLproduct`,`idLstorage`),
  KEY `fk_storage_location_storage` (`idLstorage`),
  CONSTRAINT `fk_storage_location_product` FOREIGN KEY (`idLproduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_storage_location_storage` FOREIGN KEY (`idLstorage`) REFERENCES `productStorage` (`idProdStorage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storageLocation`
--

LOCK TABLES `storageLocation` WRITE;
/*!40000 ALTER TABLE `storageLocation` DISABLE KEYS */;
INSERT INTO `storageLocation` VALUES (1,2,'RJ'),(2,6,'GO');
/*!40000 ALTER TABLE `storageLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(255) NOT NULL,
  `CNPJ` char(15) NOT NULL,
  `contact` char(11) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  UNIQUE KEY `unique_supplier` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Almeida e filhos','123456789123456','21985474'),(2,'Eletrônicos Silva','854519649143457','21985484'),(3,'Eletrônicos Valma','934567893934695','21975474');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `clients_by_city_view`
--

/*!50001 DROP VIEW IF EXISTS `clients_by_city_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clients_by_city_view` AS select `ca`.`City` AS `City`,`ca`.`State` AS `State`,count(`c`.`idClient`) AS `client_count` from (`clients` `c` join `clientsAddress` `ca` on((`c`.`idClient` = `ca`.`idAddressClient`))) group by `ca`.`City`,`ca`.`State` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-29  6:43:33
