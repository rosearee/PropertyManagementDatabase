-- MySQL dump 10.13  Distrib 9.2.0, for macos15 (arm64)
--
-- Host: localhost    Database: realestatesys
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `Adjustments`
--

DROP TABLE IF EXISTS `Adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Adjustments` (
  `AdjustmentID` int NOT NULL,
  `AdjustmentType` varchar(10) NOT NULL,
  `Amount` int NOT NULL,
  PRIMARY KEY (`AdjustmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adjustments`
--

LOCK TABLES `Adjustments` WRITE;
/*!40000 ALTER TABLE `Adjustments` DISABLE KEYS */;
INSERT INTO `Adjustments` VALUES (8001,'Discount',100),(8002,'LateFee',50);
/*!40000 ALTER TABLE `Adjustments` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Adjustments_Insert_Audit` AFTER INSERT ON `adjustments` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, NewValue, ChangedBy)
    VALUES (
        'Adjustments',
        'INSERT',
        NEW.AdjustmentID,
        CONCAT(
            'AdjustmentType: ', NEW.AdjustmentType,
            ', Amount: ', NEW.Amount
        ),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Adjustments_Update_Audit` AFTER UPDATE ON `adjustments` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, NewValue, ChangedBy)
    VALUES (
        'Adjustments',
        'UPDATE',
        OLD.AdjustmentID,
        CONCAT(
            'AdjustmentType: ', OLD.AdjustmentType,
            ', Amount: ', OLD.Amount
        ),
        CONCAT(
            'AdjustmentType: ', NEW.AdjustmentType,
            ', Amount: ', NEW.Amount
        ),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Adjustments_Delete_Audit` AFTER DELETE ON `adjustments` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, ChangedBy)
    VALUES (
        'Adjustments',
        'DELETE',
        OLD.AdjustmentID,
        CONCAT(
            'AdjustmentType: ', OLD.AdjustmentType,
            ', Amount: ', OLD.Amount
        ),
        CURRENT_USER()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `AuditTrail`
--

DROP TABLE IF EXISTS `AuditTrail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditTrail` (
  `AuditID` int NOT NULL AUTO_INCREMENT,
  `ChangeType` varchar(10) DEFAULT NULL,
  `TableName` varchar(50) DEFAULT NULL,
  `RecordID` int DEFAULT NULL,
  `OldValue` text,
  `NewValue` text,
  `ChangedBy` varchar(100) DEFAULT NULL,
  `ChangeTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AuditID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditTrail`
--

LOCK TABLES `AuditTrail` WRITE;
/*!40000 ALTER TABLE `AuditTrail` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuditTrail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branches`
--

DROP TABLE IF EXISTS `Branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branches` (
  `BranchID` int NOT NULL,
  `BranchName` varchar(25) NOT NULL,
  `Address` varchar(25) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(25) NOT NULL,
  PRIMARY KEY (`BranchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branches`
--

LOCK TABLES `Branches` WRITE;
/*!40000 ALTER TABLE `Branches` DISABLE KEYS */;
INSERT INTO `Branches` VALUES (1001,'Central Branch','101 Main St','555-1001','central@realestate.com'),(1002,'East Branch','202 East Ave','555-1002','east@realestate.com'),(1003,'West Branch','303 West Blvd','555-1003','west@realestate.com');
/*!40000 ALTER TABLE `Branches` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Branches_Insert_Audit` AFTER INSERT ON `branches` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, NewValue, ChangedBy)
    VALUES ('Branches', 'INSERT', NEW.BranchID, 
    CONCAT('BranchName: ', NEW.BranchName, ', Address: ', NEW.Address, ', Phone: ', NEW.Phone), 
    CURRENT_USER());
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Branches_Update_Audit` AFTER UPDATE ON `branches` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, NewValue, ChangedBy)
    VALUES ('Branches', 'UPDATE', OLD.BranchID, CONCAT('BranchName: ', OLD.BranchName, ', Address: ', OLD.Address, ', Phone: ', OLD.Phone),
            CONCAT('BranchName: ', NEW.BranchName, ', Address: ', NEW.Address, ', Phone: ', NEW.Phone), 
            CURRENT_USER());  
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Branches_Delete_Audit` AFTER DELETE ON `branches` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, ChangedBy)
    VALUES ('Branches', 'DELETE', OLD.BranchID, CONCAT('BranchName: ', OLD.BranchName, ', Address: ', OLD.Address, ', Phone: ', OLD.Phone),
    CURRENT_USER());  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `branchmonthlybudgetcomparisonview`
--

DROP TABLE IF EXISTS `branchmonthlybudgetcomparisonview`;
/*!50001 DROP VIEW IF EXISTS `branchmonthlybudgetcomparisonview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `branchmonthlybudgetcomparisonview` AS SELECT 
 1 AS `BranchID`,
 1 AS `BranchName`,
 1 AS `BudgetMonth`,
 1 AS `BudgetAmount`,
 1 AS `ActualExpenses`,
 1 AS `BudgetRemaining`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `branchmonthlyoverspendingview`
--

DROP TABLE IF EXISTS `branchmonthlyoverspendingview`;
/*!50001 DROP VIEW IF EXISTS `branchmonthlyoverspendingview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `branchmonthlyoverspendingview` AS SELECT 
 1 AS `BranchID`,
 1 AS `BranchName`,
 1 AS `BudgetMonth`,
 1 AS `BudgetAmount`,
 1 AS `ActualExpenses`,
 1 AS `BudgetStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgets` (
  `BudgetID` int NOT NULL,
  `BranchID` int NOT NULL,
  `BudgetMonth` int NOT NULL,
  `Amount` int NOT NULL,
  PRIMARY KEY (`BudgetID`),
  KEY `BranchID` (`BranchID`),
  CONSTRAINT `budgets_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `branches` (`BranchID`),
  CONSTRAINT `budgets_ibfk_2` FOREIGN KEY (`BranchID`) REFERENCES `branches` (`BranchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
INSERT INTO `budgets` VALUES (2001,1001,1,40000),(2002,1001,2,42000),(2003,1002,1,38000),(2004,1002,2,39000),(2005,1003,1,41000),(2006,1003,2,43000);
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `ExpenseID` int NOT NULL,
  `ExpenseType` varchar(25) NOT NULL,
  `ExpenseAmount` int NOT NULL,
  `ExpenseDate` varchar(10) NOT NULL,
  `BranchID` int DEFAULT NULL,
  `UnitID` int DEFAULT NULL,
  `PropertyID` int DEFAULT NULL,
  PRIMARY KEY (`ExpenseID`),
  KEY `BranchID` (`BranchID`),
  KEY `PropertyID` (`PropertyID`),
  KEY `UnitID` (`UnitID`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `branches` (`BranchID`),
  CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`PropertyID`),
  CONSTRAINT `expenses_ibfk_3` FOREIGN KEY (`UnitID`) REFERENCES `units` (`UnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (9001,'Property Tax',3500,'2024-01-20',NULL,NULL,3001),(9002,'Insurance',1200,'2024-02-05',NULL,NULL,3002),(9101,'Water Bill',90,'2024-01-15',NULL,4001,NULL),(9102,'Electricity Bill',120,'2024-02-15',NULL,4002,NULL),(9201,'Office Supplies',500,'2024-01-10',1001,NULL,NULL),(9202,'Maintenance Labor',800,'2024-02-12',1002,NULL,NULL);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leases`
--

DROP TABLE IF EXISTS `leases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leases` (
  `LeaseID` int NOT NULL,
  `TenantID` int NOT NULL,
  `UnitID` int NOT NULL,
  `LeaseStart` varchar(10) NOT NULL,
  `LeaseEnd` varchar(10) NOT NULL,
  `LeaseRent` int NOT NULL,
  `RentFrequency` varchar(25) NOT NULL,
  PRIMARY KEY (`LeaseID`),
  KEY `TenantID` (`TenantID`),
  KEY `UnitID` (`UnitID`),
  CONSTRAINT `leases_ibfk_1` FOREIGN KEY (`TenantID`) REFERENCES `tenants` (`TenantID`),
  CONSTRAINT `leases_ibfk_2` FOREIGN KEY (`UnitID`) REFERENCES `units` (`UnitID`),
  CONSTRAINT `leases_ibfk_3` FOREIGN KEY (`TenantID`) REFERENCES `tenants` (`TenantID`),
  CONSTRAINT `leases_ibfk_4` FOREIGN KEY (`UnitID`) REFERENCES `units` (`UnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leases`
--

LOCK TABLES `leases` WRITE;
/*!40000 ALTER TABLE `leases` DISABLE KEYS */;
INSERT INTO `leases` VALUES (6001,5001,4001,'2024-01-01','2024-12-31',1200,'Monthly'),(6002,5002,4002,'2024-01-15','2024-12-15',900,'Monthly'),(6003,5003,4004,'2024-02-01','2025-01-31',2000,'Monthly'),(6004,5004,4006,'2024-01-10','2024-12-10',950,'Monthly'),(6005,5005,4007,'2024-02-01','2025-01-31',1400,'Monthly'),(6006,5005,4009,'2024-02-15','2025-02-14',1100,'Monthly');
/*!40000 ALTER TABLE `leases` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Leases_Insert_Audit` AFTER INSERT ON `leases` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, NewValue, ChangedBy)
    VALUES ('Leases', 'INSERT', NEW.LeaseID, 
    CONCAT('TenantID: ', NEW.TenantID, ', UnitID: ', NEW.UnitID, ', LeaseStart: ', NEW.LeaseStart, ', LeaseEnd: ', NEW.LeaseEnd, ', LeaseRent: ', NEW.LeaseRent), 
    CURRENT_USER());  
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Leases_Update_Audit` AFTER UPDATE ON `leases` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, NewValue, ChangedBy)
    VALUES ('Leases', 'UPDATE', OLD.LeaseID, 
    CONCAT('TenantID: ', OLD.TenantID, ', UnitID: ', OLD.UnitID, ', LeaseStart: ', OLD.LeaseStart, ', LeaseEnd: ', OLD.LeaseEnd, ', LeaseRent: ', OLD.LeaseRent),
	CONCAT('TenantID: ', NEW.TenantID, ', UnitID: ', NEW.UnitID, ', LeaseStart: ', NEW.LeaseStart, ', LeaseEnd: ', NEW.LeaseEnd, ', LeaseRent: ', NEW.LeaseRent),
    CURRENT_USER());
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Leases_Delete_Audit` AFTER DELETE ON `leases` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, ChangedBy)
    VALUES ('Leases', 'DELETE', OLD.LeaseID, 
    CONCAT('TenantID: ', OLD.TenantID, ', UnitID: ', OLD.UnitID, ', LeaseStart: ', OLD.LeaseStart, ', LeaseEnd: ', OLD.LeaseEnd, ', LeaseRent: ', OLD.LeaseRent),
    CURRENT_USER()); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance` (
  `MaintenanceID` int NOT NULL,
  `ItemID` int NOT NULL,
  `Provider` varchar(25) NOT NULL,
  `Cost` int NOT NULL,
  `MaintenanceDate` varchar(10) NOT NULL,
  `MaintenanceFrequency` varchar(25) NOT NULL,
  `UnitID` int DEFAULT NULL,
  `BranchID` int DEFAULT NULL,
  `PropertyID` int DEFAULT NULL,
  PRIMARY KEY (`MaintenanceID`),
  KEY `UnitID` (`UnitID`),
  KEY `BranchID` (`BranchID`),
  KEY `PropertyID` (`PropertyID`),
  KEY `ItemID` (`ItemID`),
  CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`UnitID`) REFERENCES `units` (`UnitID`),
  CONSTRAINT `maintenance_ibfk_2` FOREIGN KEY (`BranchID`) REFERENCES `branches` (`BranchID`),
  CONSTRAINT `maintenance_ibfk_3` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`PropertyID`),
  CONSTRAINT `maintenance_ibfk_4` FOREIGN KEY (`ItemID`) REFERENCES `maintenancedetails` (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (11001,10001,'CoolAir Inc.',300,'2024-01-30','Quarterly',NULL,NULL,3001),(11002,10002,'PipeFixers',500,'2024-02-28','OnDemand',NULL,NULL,3002),(12001,10001,'QuickHVAC',250,'2024-01-25','Yearly',4001,NULL,NULL),(12002,10002,'HandyPlumbers',450,'2024-02-20','Emergency',4002,NULL,NULL),(13001,10001,'BuildingCare',600,'2024-01-18','Bi-Annual',NULL,1001,NULL);
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Maintenance_Insert_Audit` AFTER INSERT ON `maintenance` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, NewValue, ChangedBy)
    VALUES (
        'Maintenance',
        'INSERT',
        NEW.MaintenanceID,
        CONCAT('ItemID: ', NEW.ItemID,', Provider: ', NEW.Provider,', Cost: ', NEW.Cost,', Date: ', NEW.MaintenanceDate,', Frequency: ', NEW.MaintenanceFrequency, ', UnitID: ', NEW.UnitID,', BranchID: ', NEW.BranchID,', PropertyID: ', NEW.PropertyID),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Maintenance_Update_Audit` AFTER UPDATE ON `maintenance` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, NewValue, ChangedBy)
    VALUES (
        'Maintenance',
        'UPDATE',
        OLD.MaintenanceID,
        CONCAT('ItemID: ', OLD.ItemID,', Provider: ', OLD.Provider,', Cost: ', OLD.Cost,', Date: ', OLD.MaintenanceDate,', Frequency: ', OLD.MaintenanceFrequency,', UnitID: ', OLD.UnitID,', BranchID: ', OLD.BranchID,', PropertyID: ', OLD.PropertyID),
        CONCAT('ItemID: ', NEW.ItemID,', Provider: ', NEW.Provider,', Cost: ', NEW.Cost,', Date: ', NEW.MaintenanceDate,', Frequency: ', NEW.MaintenanceFrequency,', UnitID: ', NEW.UnitID,', BranchID: ', NEW.BranchID,', PropertyID: ', NEW.PropertyID),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Maintenance_Delete_Audit` AFTER DELETE ON `maintenance` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, ChangedBy)
    VALUES (
        'Maintenance',
        'DELETE',
        OLD.MaintenanceID,
        CONCAT('ItemID: ', OLD.ItemID,', Provider: ', OLD.Provider,', Cost: ', OLD.Cost,', Date: ', OLD.MaintenanceDate,', Frequency: ', OLD.MaintenanceFrequency,', UnitID: ', OLD.UnitID,', BranchID: ', OLD.BranchID,', PropertyID: ', OLD.PropertyID),
        CURRENT_USER()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `maintenancealertview`
--

DROP TABLE IF EXISTS `maintenancealertview`;
/*!50001 DROP VIEW IF EXISTS `maintenancealertview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `maintenancealertview` AS SELECT 
 1 AS `MaintenanceID`,
 1 AS `PropertyID`,
 1 AS `MaintenanceCategory`,
 1 AS `Provider`,
 1 AS `Cost`,
 1 AS `ScheduledDate`,
 1 AS `MaintenanceStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `MaintenanceDetails`
--

DROP TABLE IF EXISTS `MaintenanceDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MaintenanceDetails` (
  `ItemID` int NOT NULL,
  `Category` varchar(25) NOT NULL,
  `Specs` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaintenanceDetails`
--

LOCK TABLES `MaintenanceDetails` WRITE;
/*!40000 ALTER TABLE `MaintenanceDetails` DISABLE KEYS */;
INSERT INTO `MaintenanceDetails` VALUES (10001,'HVAC','Quarterly Checkup'),(10002,'Plumbing','Pipe Replacement');
/*!40000 ALTER TABLE `MaintenanceDetails` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MaintenanceDetails_Insert_Audit` AFTER INSERT ON `maintenancedetails` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, NewValue, ChangedBy)
    VALUES (
        'MaintenanceDetails',
        'INSERT',
        NEW.ItemID,
        CONCAT(
            'Category: ', NEW.Category,
            ', Specs: ', NEW.Specs
        ),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MaintenanceDetails_Update_Audit` AFTER UPDATE ON `maintenancedetails` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, NewValue, ChangedBy)
    VALUES (
        'MaintenanceDetails',
        'UPDATE',
        OLD.ItemID,
        CONCAT(
            'Category: ', OLD.Category,
            ', Specs: ', OLD.Specs
        ),
        CONCAT(
            'Category: ', NEW.Category,
            ', Specs: ', NEW.Specs
        ),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MaintenanceDetails_Delete_Audit` AFTER DELETE ON `maintenancedetails` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, ChangedBy)
    VALUES (
        'MaintenanceDetails',
        'DELETE',
        OLD.ItemID,
        CONCAT(
            'Category: ', OLD.Category,
            ', Specs: ', OLD.Specs
        ),
        CURRENT_USER()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Properties`
--

DROP TABLE IF EXISTS `Properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Properties` (
  `PropertyID` int NOT NULL,
  `Address` varchar(25) NOT NULL,
  `PropertyType` varchar(255) DEFAULT NULL,
  `NumOfUnits` int NOT NULL,
  `PurchasePrice` int NOT NULL,
  `PurchaseDate` varchar(10) NOT NULL,
  `BranchID` int NOT NULL,
  PRIMARY KEY (`PropertyID`),
  KEY `BranchID` (`BranchID`),
  CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `Branches` (`BranchID`),
  CONSTRAINT `properties_ibfk_2` FOREIGN KEY (`BranchID`) REFERENCES `Branches` (`BranchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Properties`
--

LOCK TABLES `Properties` WRITE;
/*!40000 ALTER TABLE `Properties` DISABLE KEYS */;
INSERT INTO `Properties` VALUES (3001,'500 Elm St','Residential',3,250000,'2020-05-20',1001),(3002,'700 Oak St','Commercial',2,400000,'2019-11-15',1002),(3003,'900 Pine St','Residential',4,320000,'2021-07-10',1003),(3004,'123 Sunset Blvd','Residential',10,1500000,'2025-04-01',1001);
/*!40000 ALTER TABLE `Properties` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Properties_Insert_Audit` AFTER INSERT ON `properties` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, NewValue, ChangedBy)
    VALUES ('Properties', 'INSERT', NEW.PropertyID, 
    CONCAT('Address: ', NEW.Address, ', PropertyType: ', NEW.PropertyType, ', NumOfUnits: ', NEW.NumOfUnits),
    CURRENT_USER()); 
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Properties_Update_Audit` AFTER UPDATE ON `properties` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, NewValue, ChangedBy)
    VALUES ('Properties', 'UPDATE', OLD.PropertyID, 
    CONCAT('Address: ', OLD.Address, ', PropertyType: ', OLD.PropertyType, ', NumOfUnits: ', OLD.NumOfUnits),
	CONCAT('Address: ', NEW.Address, ', PropertyType: ', NEW.PropertyType, ', NumOfUnits: ', NEW.NumOfUnits), 
    CURRENT_USER()); 
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Properties_Delete_Audit` AFTER DELETE ON `properties` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, ChangedBy)
    VALUES ('Properties', 'DELETE', OLD.PropertyID, 
    CONCAT('Address: ', OLD.Address, ', PropertyType: ', OLD.PropertyType, ', NumOfUnits: ', OLD.NumOfUnits), 
    CURRENT_USER()); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rentalpayments`
--

DROP TABLE IF EXISTS `rentalpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentalpayments` (
  `PaymentID` int NOT NULL,
  `LeaseID` int NOT NULL,
  `AdjustmentID` int DEFAULT NULL,
  `AmountDue` int NOT NULL,
  `AmountPaid` int NOT NULL,
  `PaymentDate` varchar(10) NOT NULL,
  `PaymentMethod` varchar(25) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `LeaseID` (`LeaseID`),
  KEY `AdjustmentID` (`AdjustmentID`),
  CONSTRAINT `rentalpayments_ibfk_1` FOREIGN KEY (`LeaseID`) REFERENCES `leases` (`LeaseID`),
  CONSTRAINT `rentalpayments_ibfk_2` FOREIGN KEY (`AdjustmentID`) REFERENCES `adjustments` (`AdjustmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentalpayments`
--

LOCK TABLES `rentalpayments` WRITE;
/*!40000 ALTER TABLE `rentalpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `rentalpayments` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `RentalPayments_Insert_Audit` AFTER INSERT ON `rentalpayments` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, NewValue, ChangedBy)
    VALUES (
        'RentalPayments',
        'INSERT',
        NEW.PaymentID,
        CONCAT(
            'LeaseID: ', NEW.LeaseID,
            ', AdjustmentID: ', IFNULL(NEW.AdjustmentID, 'NULL'),
            ', AmountDue: ', NEW.AmountDue,
            ', AmountPaid: ', NEW.AmountPaid,
            ', PaymentDate: ', NEW.PaymentDate,
            ', PaymentMethod: ', NEW.PaymentMethod
        ),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `RentalPayments_Update_Audit` AFTER UPDATE ON `rentalpayments` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, NewValue, ChangedBy)
    VALUES (
        'RentalPayments',
        'UPDATE',
        OLD.PaymentID,
        CONCAT(
            'LeaseID: ', OLD.LeaseID,
            ', AdjustmentID: ', IFNULL(OLD.AdjustmentID, 'NULL'),
            ', AmountDue: ', OLD.AmountDue,
            ', AmountPaid: ', OLD.AmountPaid,
            ', PaymentDate: ', OLD.PaymentDate,
            ', PaymentMethod: ', OLD.PaymentMethod
        ),
        CONCAT(
            'LeaseID: ', NEW.LeaseID,
            ', AdjustmentID: ', IFNULL(NEW.AdjustmentID, 'NULL'),
            ', AmountDue: ', NEW.AmountDue,
            ', AmountPaid: ', NEW.AmountPaid,
            ', PaymentDate: ', NEW.PaymentDate,
            ', PaymentMethod: ', NEW.PaymentMethod
        ),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `RentalPayments_Delete_Audit` AFTER DELETE ON `rentalpayments` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, ChangedBy)
    VALUES (
        'RentalPayments',
        'DELETE',
        OLD.PaymentID,
        CONCAT(
            'LeaseID: ', OLD.LeaseID,
            ', AdjustmentID: ', IFNULL(OLD.AdjustmentID, 'NULL'),
            ', AmountDue: ', OLD.AmountDue,
            ', AmountPaid: ', OLD.AmountPaid,
            ', PaymentDate: ', OLD.PaymentDate,
            ', PaymentMethod: ', OLD.PaymentMethod
        ),
        CURRENT_USER()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SharedSpaces`
--

DROP TABLE IF EXISTS `SharedSpaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SharedSpaces` (
  `SpaceID` int NOT NULL AUTO_INCREMENT,
  `PropertyID` int DEFAULT NULL,
  `SpaceType` varchar(100) DEFAULT NULL,
  `GeoLocation` point DEFAULT NULL,
  PRIMARY KEY (`SpaceID`),
  KEY `PropertyID` (`PropertyID`),
  CONSTRAINT `sharedspaces_ibfk_1` FOREIGN KEY (`PropertyID`) REFERENCES `Properties` (`PropertyID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SharedSpaces`
--

LOCK TABLES `SharedSpaces` WRITE;
/*!40000 ALTER TABLE `SharedSpaces` DISABLE KEYS */;
INSERT INTO `SharedSpaces` VALUES (1,1,'Gym',_binary '\0\0\0\0\0\0\0Õ¯t><[D@¨\Å\àa€RÀ'),(2,1,'Parking',_binary '\0\0\0\0\0\0\0¹U][D@N\íS[€RÀ'),(3,2,'Lounge',_binary '\0\0\0\0\0\0\0qZ\ð¢¯A@\Öå”€˜]À'),(4,2,'Gym',_binary '\0\0\0\0\0\0\0›r…w¹A@ÀYJ–“]À'),(5,3,'Parking',_binary '\0\0\0\0\0\0\0¢˜¼f\ðD@mw N\èUÀ');
/*!40000 ALTER TABLE `SharedSpaces` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SharedSpaces_Insert_Audit` AFTER INSERT ON `sharedspaces` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, NewValue, ChangedBy)
    VALUES (
        'SharedSpaces',
        'INSERT',
        NEW.SpaceID,
        CONCAT(
            'PropertyID: ', NEW.PropertyID,
            ', SpaceType: ', NEW.SpaceType,
            ', GeoLocation: ', ST_AsText(NEW.GeoLocation)
        ),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SharedSpaces_Update_Audit` AFTER UPDATE ON `sharedspaces` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, NewValue, ChangedBy)
    VALUES (
        'SharedSpaces',
        'UPDATE',
        OLD.SpaceID,
        CONCAT(
            'PropertyID: ', OLD.PropertyID,
            ', SpaceType: ', OLD.SpaceType,
            ', GeoLocation: ', ST_AsText(OLD.GeoLocation)
        ),
        CONCAT(
            'PropertyID: ', NEW.PropertyID,
            ', SpaceType: ', NEW.SpaceType,
            ', GeoLocation: ', ST_AsText(NEW.GeoLocation)
        ),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SharedSpaces_Delete_Audit` AFTER DELETE ON `sharedspaces` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, ChangedBy)
    VALUES (
        'SharedSpaces',
        'DELETE',
        OLD.SpaceID,
        CONCAT(
            'PropertyID: ', OLD.PropertyID,
            ', SpaceType: ', OLD.SpaceType,
            ', GeoLocation: ', ST_AsText(OLD.GeoLocation)
        ),
        CURRENT_USER()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SharedSpaceUsageLogs`
--

DROP TABLE IF EXISTS `SharedSpaceUsageLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SharedSpaceUsageLogs` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `SpaceID` int DEFAULT NULL,
  `UsageDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `DurationMinutes` int DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`LogID`),
  KEY `SpaceID` (`SpaceID`),
  CONSTRAINT `sharedspaceusagelogs_ibfk_1` FOREIGN KEY (`SpaceID`) REFERENCES `SharedSpaces` (`SpaceID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SharedSpaceUsageLogs`
--

LOCK TABLES `SharedSpaceUsageLogs` WRITE;
/*!40000 ALTER TABLE `SharedSpaceUsageLogs` DISABLE KEYS */;
INSERT INTO `SharedSpaceUsageLogs` VALUES (1,1,'2025-04-01 08:15:00',60,'Morning session.'),(2,1,'2025-04-02 19:30:00',45,'Evening workout.'),(3,1,'2025-04-03 07:00:00',75,'Heavy traffic at gym.'),(4,2,'2025-04-01 07:45:00',480,'Full day parking.'),(5,2,'2025-04-02 08:00:00',300,'Short-term parking.'),(6,3,'2025-04-01 17:00:00',90,'Tenant meeting.'),(7,3,'2025-04-05 15:00:00',120,'Private event.'),(8,4,'2025-04-02 06:30:00',60,'Regular users.'),(9,4,'2025-04-04 18:00:00',45,'Light usage evening.'),(10,5,'2025-04-01 09:00:00',420,'All-day parking.'),(11,5,'2025-04-03 10:30:00',300,'Partial day use.');
/*!40000 ALTER TABLE `SharedSpaceUsageLogs` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SharedSpaceUsageLogs_Insert_Audit` AFTER INSERT ON `sharedspaceusagelogs` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, NewValue, ChangedBy)
    VALUES (
        'SharedSpaceUsageLogs',
        'INSERT',
        NEW.LogID,
        CONCAT(
            'SpaceID: ', NEW.SpaceID,
            ', UsageDateTime: ', NEW.UsageDateTime,
            ', Duration: ', NEW.DurationMinutes,
            ', Notes: ', NEW.Notes
        ),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SharedSpaceUsageLogs_Update_Audit` AFTER UPDATE ON `sharedspaceusagelogs` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, NewValue, ChangedBy)
    VALUES (
        'SharedSpaceUsageLogs',
        'UPDATE',
        OLD.LogID,
        CONCAT(
            'SpaceID: ', OLD.SpaceID,
            ', UsageDateTime: ', OLD.UsageDateTime,
            ', Duration: ', OLD.DurationMinutes,
            ', Notes: ', OLD.Notes
        ),
        CONCAT(
            'SpaceID: ', NEW.SpaceID,
            ', UsageDateTime: ', NEW.UsageDateTime,
            ', Duration: ', NEW.DurationMinutes,
            ', Notes: ', NEW.Notes
        ),
        CURRENT_USER()
    );
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SharedSpaceUsageLogs_Delete_Audit` AFTER DELETE ON `sharedspaceusagelogs` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, ChangedBy)
    VALUES (
        'SharedSpaceUsageLogs',
        'DELETE',
        OLD.LogID,
        CONCAT(
            'SpaceID: ', OLD.SpaceID,
            ', UsageDateTime: ', OLD.UsageDateTime,
            ', Duration: ', OLD.DurationMinutes,
            ', Notes: ', OLD.Notes
        ),
        CURRENT_USER()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenants` (
  `TenantID` int NOT NULL,
  `TenantName` varchar(25) NOT NULL,
  `phone` varbinary(255) NOT NULL,
  `email` varbinary(255) NOT NULL,
  PRIMARY KEY (`TenantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
INSERT INTO `tenants` VALUES (5001,'Alice Monroe',_binary '§¾aW=›µBƒ;´¸\Ç',_binary '\à 4ýP.\îA•L0L•\\¬b86‘\ç^,\ë8ª½[\Â'),(5002,'Brian Stone',_binary '¦ù±r\í\Þý]<\ÈfDÁø',_binary ':.g\í#8g5E$ú²y¬b86‘\ç^,\ë8ª½[\Â'),(5003,'Cindy Hart',_binary 'ù­s(9A-½¶\Û\Êý\Æ\ô\Ç',_binary '¸\à\è\êþC\ónÿ!À38\n¬b86‘\ç^,\ë8ª½[\Â'),(5004,'David Kent',_binary '\ç?LeB\Ø\ß¦†\Ô5®2­K',_binary '\àN~]ýZu\Ë/\öbü\÷%¬b86‘\ç^,\ë8ª½[\Â'),(5005,'Eva Park',_binary '•Ë?ˆ\Ð\r¡\â}Ü–›ˆ\ö',_binary 'µN}Ð£”u\Õ$¥\'N=£\Çnj\àFîº—J\áKtù');
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Tenants_Insert_Audit` AFTER INSERT ON `tenants` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, NewValue, ChangedBy)
    VALUES ('Tenants', 'INSERT', NEW.TenantID, 
    CONCAT('TenantName: ', NEW.TenantName, ', Phone: ', NEW.Phone, ', Email: ', NEW.Email), 
    CURRENT_USER());  
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Tenants_Update_Audit` AFTER UPDATE ON `tenants` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, NewValue, ChangedBy)
    VALUES ('Tenants', 'UPDATE', OLD.TenantID, 
    CONCAT('TenantName: ', OLD.TenantName, ', Phone: ', OLD.Phone, ', Email: ', OLD.Email),
	CONCAT('TenantName: ', NEW.TenantName, ', Phone: ', NEW.Phone, ', Email: ', NEW.Email), 
    CURRENT_USER());
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Tenants_Delete_Audit` AFTER DELETE ON `tenants` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, ChangedBy)
    VALUES ('Tenants', 'DELETE', OLD.TenantID, 
    CONCAT('TenantName: ', OLD.TenantName, ', Phone: ', OLD.Phone, ', Email: ', OLD.Email),
    CURRENT_USER()); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `UnitID` int NOT NULL,
  `UnitType` varchar(25) NOT NULL,
  `SquareFootage` int NOT NULL,
  `UnitStatus` varchar(10) NOT NULL,
  `PropertyID` int NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UnitID`),
  KEY `PropertyID` (`PropertyID`),
  CONSTRAINT `units_ibfk_1` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`PropertyID`),
  CONSTRAINT `units_ibfk_2` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`PropertyID`),
  CONSTRAINT `units_ibfk_3` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`PropertyID`),
  CONSTRAINT `units_ibfk_4` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`PropertyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (4001,'2BR',850,'Occupied',3001,NULL),(4002,'Studio',450,'Occupied',3001,NULL),(4003,'1BR',600,'Vacant',3001,NULL),(4004,'Retail',1200,'Occupied',3002,NULL),(4005,'Office',900,'Vacant',3002,NULL),(4006,'1BR',650,'Occupied',3003,NULL),(4007,'2BR',900,'Occupied',3003,NULL),(4008,'Studio',400,'Vacant',3003,NULL),(4009,'1BR',600,'Occupied',3003,NULL),(4010,'Studio',500,'Vacant',3004,NULL),(4011,'1BR',700,'Occupied',3004,NULL),(4012,'2BR',900,'Occupied',3004,NULL),(4013,'1BR',700,'Occupied',3004,NULL),(4014,'Studio',500,'Vacant',3004,NULL),(4015,'2BR',900,'Occupied',3004,NULL),(4016,'Studio',500,'Occupied',3004,NULL),(4017,'1BR',700,'Vacant',3004,NULL),(4018,'2BR',900,'Occupied',3004,NULL),(4019,'1BR',700,'Occupied',3004,NULL);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Units_Insert_Audit` AFTER INSERT ON `units` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, NewValue, ChangedBy)
    VALUES ('Units', 'INSERT', NEW.UnitID, 
    CONCAT('UnitType: ', NEW.UnitType, ', SquareFootage: ', NEW.SquareFootage, ', UnitStatus: ', NEW.UnitStatus), 
    CURRENT_USER());
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Units_Update_Audit` AFTER UPDATE ON `units` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, NewValue, ChangedBy)
    VALUES ('Units', 'UPDATE', OLD.UnitID, 
    CONCAT('UnitType: ', OLD.UnitType, ', SquareFootage: ', OLD.SquareFootage, ', UnitStatus: ', OLD.UnitStatus),
	CONCAT('UnitType: ', NEW.UnitType, ', SquareFootage: ', NEW.SquareFootage, ', UnitStatus: ', NEW.UnitStatus),
    CURRENT_USER());
END */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Units_Delete_Audit` AFTER DELETE ON `units` FOR EACH ROW BEGIN
    INSERT INTO AuditTrail (TableName, OperationType, RecordID, OldValue, ChangedBy)
    VALUES ('Units', 'DELETE', OLD.UnitID, 
    CONCAT('UnitType: ', OLD.UnitType, ', SquareFootage: ', OLD.SquareFootage, ', UnitStatus: ', OLD.UnitStatus), 
    CURRENT_USER()); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `Role` enum('Admin','Branch Manager','Clerk') NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `BranchID` int DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`),
  KEY `fk_branch` (`BranchID`),
  CONSTRAINT `fk_branch` FOREIGN KEY (`BranchID`) REFERENCES `Branches` (`BranchID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (4,'AdminUser1','$2b$12$uNfdDOqpx87oWlm79uD8UOb6ZHh5CKoR5u/x9gEEwbB6G9ibg/VDe','Admin','2025-04-29 20:31:09',NULL),(5,'AdminUser2','$2b$12$WaETClRZI2iTN2qUiYcZPO2c2.3wf3v8mxGD5VAaATD8qhuL.N0fm','Admin','2025-04-29 20:31:10',NULL),(6,'BranchManager1','$2b$12$uVU/5LIRQeb7R8LkHao7/.OzKuWrdKRlNj7mTtdoG0txMVQgnp9AS','Branch Manager','2025-04-29 20:31:10',1001),(7,'BranchManager2','$2b$12$KlKsQ4DX/.zRAQbTTlZ.te6Cs6NiZ8dvIGNbldOCYurpQr3xEGvoC','Branch Manager','2025-04-29 20:31:10',1002),(8,'Clerk1','$2b$12$oDt776RtZJY/YRECJcG8s..m4eHSkgRgoQ5wM7s3UvhEx3SVpUPby','Clerk','2025-04-29 20:31:10',1001),(9,'Clerk2','$2b$12$ooQeVi1YHYYd86dqRqIopu.RYxTii4w7ReCmCOSmekJyaWsO/ExtK','Clerk','2025-04-29 20:31:11',1003);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `branchmonthlybudgetcomparisonview`
--

/*!50001 DROP VIEW IF EXISTS `branchmonthlybudgetcomparisonview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branchmonthlybudgetcomparisonview` AS select `b`.`BranchID` AS `BranchID`,`b`.`BranchName` AS `BranchName`,`bu`.`BudgetMonth` AS `BudgetMonth`,`bu`.`Amount` AS `BudgetAmount`,ifnull(sum(`be`.`ExpenseAmount`),0) AS `ActualExpenses`,(`bu`.`Amount` - ifnull(sum(`be`.`ExpenseAmount`),0)) AS `BudgetRemaining` from ((`branches` `b` join `budgets` `bu` on((`b`.`BranchID` = `bu`.`BranchID`))) left join `expenses` `be` on(((`b`.`BranchID` = `be`.`BranchID`) and (month(`be`.`ExpenseDate`) = `bu`.`BudgetMonth`)))) group by `b`.`BranchID`,`b`.`BranchName`,`bu`.`BudgetMonth`,`bu`.`Amount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `branchmonthlyoverspendingview`
--

/*!50001 DROP VIEW IF EXISTS `branchmonthlyoverspendingview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branchmonthlyoverspendingview` AS select `b`.`BranchID` AS `BranchID`,`b`.`BranchName` AS `BranchName`,`bu`.`BudgetMonth` AS `BudgetMonth`,`bu`.`Amount` AS `BudgetAmount`,ifnull(sum(`be`.`ExpenseAmount`),0) AS `ActualExpenses`,(case when (ifnull(sum(`be`.`ExpenseAmount`),0) > `bu`.`Amount`) then 'Over Budget' else 'Within Budget' end) AS `BudgetStatus` from ((`branches` `b` join `budgets` `bu` on((`b`.`BranchID` = `bu`.`BranchID`))) left join `expenses` `be` on(((`b`.`BranchID` = `be`.`BranchID`) and (month(`be`.`ExpenseDate`) = `bu`.`BudgetMonth`)))) group by `b`.`BranchID`,`b`.`BranchName`,`bu`.`BudgetMonth`,`bu`.`Amount` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maintenancealertview`
--

/*!50001 DROP VIEW IF EXISTS `maintenancealertview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maintenancealertview` AS select `pm`.`MaintenanceID` AS `MaintenanceID`,`pm`.`PropertyID` AS `PropertyID`,`md`.`Category` AS `MaintenanceCategory`,`pm`.`Provider` AS `Provider`,`pm`.`Cost` AS `Cost`,str_to_date(`pm`.`MaintenanceDate`,'%Y-%m-%d') AS `ScheduledDate`,(case when (str_to_date(`pm`.`MaintenanceDate`,'%Y-%m-%d') < curdate()) then 'OVERDUE' when (str_to_date(`pm`.`MaintenanceDate`,'%Y-%m-%d') between curdate() and (curdate() + interval 7 day)) then 'Upcoming Soon' else 'Scheduled Later' end) AS `MaintenanceStatus` from (`maintenance` `pm` left join `maintenancedetails` `md` on((`pm`.`ItemID` = `md`.`ItemID`))) */;
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

-- Dump completed on 2025-04-29 20:45:09
