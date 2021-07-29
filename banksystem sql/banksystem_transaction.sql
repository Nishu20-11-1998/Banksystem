-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banksystem
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `TRANS_ID` int NOT NULL AUTO_INCREMENT,
  `ACC_NO1` varchar(45) NOT NULL,
  `ACC_NO2` varchar(45) NOT NULL,
  `AMOUNT` decimal(10,2) NOT NULL,
  `REMARK` varchar(120) NOT NULL,
  `DATE` date NOT NULL,
  PRIMARY KEY (`TRANS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'3900001','3900001',1000.00,'Account Opening','2020-09-29'),(2,'3900002','3900002',1000.00,'Account Opening','2020-09-29'),(3,'3900003','3900003',1000.00,'Account Opening','2020-09-30'),(4,'3900004','3900004',1000.00,'Account Opening','2020-09-30'),(26,'3900001','3900001',2000.00,'Deposit','2020-10-02'),(27,'3900001','3900001',1500.00,'Deposit','2020-10-02'),(28,'3900001','3900001',500.00,'Deposit','2020-10-02'),(29,'3900001','3900001',1000.00,'Withdraw','2020-10-02'),(32,'3900001','3900003',1000.00,'test','2020-10-02'),(33,'3900001','3900001',12000.00,'Deposit','2020-10-04'),(34,'3900001','3900001',10000.00,'FD Created','2020-10-04'),(35,'3900001','3900001',5000.00,'Deposit','2020-10-04'),(36,'3900001','3900001',5000.00,'FD Created','2020-10-04'),(37,'3900001','3900001',5000.00,'FD Completed','2020-10-04'),(38,'3900001','3900001',10000.00,'FD Completed','2020-10-04');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `transaction_AFTER_INSERT` AFTER INSERT ON `transaction` FOR EACH ROW BEGIN
	IF  (NEW.ACC_NO1=NEW.ACC_NO1 AND NEW.REMARK="Account Opening") THEN
		UPDATE `banksystem`.`accounts`
		SET `AMOUNT` = NEW.AMOUNT WHERE `ACC_NO`=NEW.ACC_NO1;
    END IF; 
    
    IF  (NEW.ACC_NO1=NEW.ACC_NO1 AND NEW.REMARK="FD Completed") THEN
		UPDATE `banksystem`.`accounts`
		SET `AMOUNT` =AMOUNT+NEW.AMOUNT WHERE `ACC_NO`=NEW.ACC_NO1;
    END IF;
    
    IF  (NEW.ACC_NO1=NEW.ACC_NO1 AND NEW.REMARK="FD Created") THEN
		UPDATE `banksystem`.`accounts` SET `AMOUNT` =AMOUNT-NEW.AMOUNT
		WHERE `ACC_NO`=NEW.ACC_NO1;
	END IF; 
    
    IF  (NEW.ACC_NO1=NEW.ACC_NO1 AND NEW.REMARK="Deposit") THEN
		UPDATE `banksystem`.`accounts`
		SET `AMOUNT` =AMOUNT+NEW.AMOUNT WHERE `ACC_NO`=NEW.ACC_NO1;
    END IF;
    
    IF  (NEW.ACC_NO1=NEW.ACC_NO1 AND NEW.REMARK="Withdraw") THEN
		UPDATE `banksystem`.`accounts` SET `AMOUNT` =AMOUNT-NEW.AMOUNT
		WHERE `ACC_NO`=NEW.ACC_NO1;
	END IF; 
    
    IF (NEW.ACC_NO1 <> NEW.ACC_NO2) then
		UPDATE `banksystem`.`accounts`
		SET `AMOUNT` =AMOUNT-NEW.AMOUNT WHERE `ACC_NO`=NEW.ACC_NO1;
        
		UPDATE `banksystem`.`accounts` 
		SET `AMOUNT` =AMOUNT+NEW.AMOUNT WHERE `ACC_NO`=NEW.ACC_NO2;
    END IF;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-29 22:38:23
