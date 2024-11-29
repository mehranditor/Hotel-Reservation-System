-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: mydatabase
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Temporary view structure for view `active_bookings`
--

DROP TABLE IF EXISTS `active_bookings`;
/*!50001 DROP VIEW IF EXISTS `active_bookings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `active_bookings` AS SELECT 
 1 AS `Booking_id`,
 1 AS `Customer_id`,
 1 AS `Room_id`,
 1 AS `checkin_date`,
 1 AS `checkout_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `adminnotifications`
--

DROP TABLE IF EXISTS `adminnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminnotifications` (
  `Notification_id` int NOT NULL AUTO_INCREMENT,
  `Admin_id` int DEFAULT NULL,
  `title` varchar(260) DEFAULT NULL,
  `message` text,
  `IsRead` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminnotifications`
--

LOCK TABLES `adminnotifications` WRITE;
/*!40000 ALTER TABLE `adminnotifications` DISABLE KEYS */;
INSERT INTO `adminnotifications` VALUES (1,1,'New Booking Alert','A new booking has been made for Room 101 on 2024-12-01.',1,'2024-11-20 18:53:33'),(2,1,'Booking Status Update','Booking for room 2 has been updated. New status: Cancelled',0,'2024-11-22 16:08:33'),(3,1,'Booking Status Update','Booking for room 2 has been updated. New status: Confirmed',0,'2024-11-23 10:04:59'),(4,1,'Booking Status Update','Booking for room 2 has been updated. New status: Confirmed',1,'2024-11-23 10:08:36'),(5,1,'Booking Status Update','Booking for room 2 has been updated. New status: Confirmed',1,'2024-11-23 10:11:23'),(6,1,'Booking Status Update','Booking for room 3 has been updated. New status: Cancelled',1,'2024-11-24 07:36:08'),(7,1,'New Service Request','A new service request (ID: 2) has been made for booking ID 106 with service ID 1.',0,'2024-11-24 16:05:45'),(8,1,'New Special Offer','A new special offer (ID: 1) has been created: Summer Sale.',0,'2024-11-26 19:39:41');
/*!40000 ALTER TABLE `adminnotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `booking_summary`
--

DROP TABLE IF EXISTS `booking_summary`;
/*!50001 DROP VIEW IF EXISTS `booking_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `booking_summary` AS SELECT 
 1 AS `Booking_id`,
 1 AS `Room_id`,
 1 AS `Customer_id`,
 1 AS `Customer_FirstName`,
 1 AS `Customer_LastName`,
 1 AS `checkin_date`,
 1 AS `checkout_date`,
 1 AS `Booking_Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `Booking_id` int NOT NULL AUTO_INCREMENT,
  `Customer_id` int DEFAULT NULL,
  `Room_id` int DEFAULT NULL,
  `checkin_date` date DEFAULT NULL,
  `checkout_date` date DEFAULT NULL,
  `status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (`Booking_id`),
  KEY `Customer_id_idx` (`Customer_id`),
  KEY `Room_id_idx` (`Room_id`),
  CONSTRAINT `Customer_id` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`),
  CONSTRAINT `Room_id` FOREIGN KEY (`Room_id`) REFERENCES `rooms` (`Room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (101,1,2,'2024-10-29','2024-12-05','Confirmed'),(106,2,2,'2024-11-05','2024-11-20','Confirmed'),(107,3,3,'2024-11-06','2024-11-21','Cancelled'),(110,1,3,'2024-12-05','2024-12-05','Confirmed');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingservices`
--

DROP TABLE IF EXISTS `bookingservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookingservices` (
  `Booking_id` int NOT NULL,
  `Service_id` int NOT NULL,
  PRIMARY KEY (`Booking_id`,`Service_id`),
  KEY `Service_id` (`Service_id`),
  CONSTRAINT `bookingservices_ibfk_1` FOREIGN KEY (`Booking_id`) REFERENCES `bookings` (`Booking_id`),
  CONSTRAINT `bookingservices_ibfk_2` FOREIGN KEY (`Service_id`) REFERENCES `services` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingservices`
--

LOCK TABLES `bookingservices` WRITE;
/*!40000 ALTER TABLE `bookingservices` DISABLE KEYS */;
INSERT INTO `bookingservices` VALUES (107,1),(107,3),(110,4);
/*!40000 ALTER TABLE `bookingservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_reviews`
--

DROP TABLE IF EXISTS `customer_reviews`;
/*!50001 DROP VIEW IF EXISTS `customer_reviews`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_reviews` AS SELECT 
 1 AS `Review_id`,
 1 AS `Customer_id`,
 1 AS `Customer_FirstName`,
 1 AS `Customer_LastName`,
 1 AS `Room_id`,
 1 AS `Rating`,
 1 AS `Comment`,
 1 AS `Review_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customerdetails`
--

DROP TABLE IF EXISTS `customerdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerdetails` (
  `Customer_id` int NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`),
  CONSTRAINT `customerdetails_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerdetails`
--

LOCK TABLES `customerdetails` WRITE;
/*!40000 ALTER TABLE `customerdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Customer_id` int NOT NULL AUTO_INCREMENT,
  `First_name` varchar(45) DEFAULT NULL,
  `Last_name` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'MEHRAN','DANESHVAR','mehran@gmail.com','5311234'),(2,'farhad','fardin','farhad@gmail.com','5345132201'),(3,'christiano','ronaldo','chris@gmail.com','65734320753');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'mark','Smith','Receptionist','2021-06-23','mark.smith@gmail.com','098-234-4321');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenancerequests`
--

DROP TABLE IF EXISTS `maintenancerequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenancerequests` (
  `RequestID` int NOT NULL AUTO_INCREMENT,
  `Room_id` int DEFAULT NULL,
  `RequestDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` varchar(100) DEFAULT 'Pending',
  `Description` text,
  PRIMARY KEY (`RequestID`),
  KEY `Room_id` (`Room_id`),
  CONSTRAINT `maintenancerequests_ibfk_1` FOREIGN KEY (`Room_id`) REFERENCES `rooms` (`Room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenancerequests`
--

LOCK TABLES `maintenancerequests` WRITE;
/*!40000 ALTER TABLE `maintenancerequests` DISABLE KEYS */;
INSERT INTO `maintenancerequests` VALUES (1,3,'2024-11-26 19:12:19','Pending','Air conditioner not working');
/*!40000 ALTER TABLE `maintenancerequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `maintenancerequestsummary`
--

DROP TABLE IF EXISTS `maintenancerequestsummary`;
/*!50001 DROP VIEW IF EXISTS `maintenancerequestsummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `maintenancerequestsummary` AS SELECT 
 1 AS `RequestID`,
 1 AS `Room_number`,
 1 AS `RequestDate`,
 1 AS `Status`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `overdue_bookings`
--

DROP TABLE IF EXISTS `overdue_bookings`;
/*!50001 DROP VIEW IF EXISTS `overdue_bookings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `overdue_bookings` AS SELECT 
 1 AS `Booking_id`,
 1 AS `Customer_id`,
 1 AS `Room_id`,
 1 AS `checkin_date`,
 1 AS `checkout_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `Payment_id` int NOT NULL AUTO_INCREMENT,
  `Booking_id` int DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Payment_date` date DEFAULT NULL,
  `Payment_method` enum('Credit Card','Debit Card','Cash','Online') DEFAULT NULL,
  `Payment_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Payment_id`),
  UNIQUE KEY `Booking_id_UNIQUE` (`Booking_id`),
  KEY `Booking_id_idx` (`Booking_id`),
  CONSTRAINT `Booking_id` FOREIGN KEY (`Booking_id`) REFERENCES `bookings` (`Booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,101,250.00,'2024-10-28','Credit Card','Completed'),(2,106,150.00,'2024-11-03','Credit Card','Not Completed');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `paymentsummary`
--

DROP TABLE IF EXISTS `paymentsummary`;
/*!50001 DROP VIEW IF EXISTS `paymentsummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `paymentsummary` AS SELECT 
 1 AS `Payment_id`,
 1 AS `Booking_id`,
 1 AS `First_name`,
 1 AS `Last_name`,
 1 AS `Payment_date`,
 1 AS `Amount`,
 1 AS `Payment_method`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `Promotion_id` int NOT NULL AUTO_INCREMENT,
  `Promocode` varchar(45) DEFAULT NULL,
  `Discount_percentage` decimal(10,2) DEFAULT NULL,
  `Start_date` date DEFAULT NULL,
  `End_date` date DEFAULT NULL,
  PRIMARY KEY (`Promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `Review_id` int NOT NULL AUTO_INCREMENT,
  `Customer_id` int DEFAULT NULL,
  `Booking_id` int DEFAULT NULL,
  `Room_id` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `Comment` text,
  `Review_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Response` text,
  `Response_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Review_id`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Room_id` (`Room_id`),
  KEY `Booking_id_idx` (`Booking_id`),
  CONSTRAINT `fk_booking_id` FOREIGN KEY (`Booking_id`) REFERENCES `bookings` (`Booking_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`Room_id`) REFERENCES `rooms` (`Room_id`),
  CONSTRAINT `reviews_chk_1` CHECK ((`Rating` between 1 and 5)),
  CONSTRAINT `reviews_chk_2` CHECK ((`Rating` between 1 and 5)),
  CONSTRAINT `reviews_chk_3` CHECK ((`Rating` between 1 and 5)),
  CONSTRAINT `reviews_chk_4` CHECK ((`Rating` between 1 and 5)),
  CONSTRAINT `reviews_chk_5` CHECK ((`Rating` between 1 and 5)),
  CONSTRAINT `reviews_chk_6` CHECK ((`Rating` between 1 and 5)),
  CONSTRAINT `reviews_chk_7` CHECK ((`Rating` between 1 and 5)),
  CONSTRAINT `reviews_chk_8` CHECK ((`Rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,101,2,5,'Excellent stay, very comfortable and clean.','2024-11-17 16:29:20','Thank you for your feedback ! ','2024-11-20 17:06:48'),(5,3,107,3,2,'The room was noisy and uncomfortable.','2024-11-23 21:00:00','Thank you for your feedback!','2024-11-24 07:54:05');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_types`
--

DROP TABLE IF EXISTS `room_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_types` (
  `Room_type_id` int NOT NULL AUTO_INCREMENT,
  `Room_type_name` varchar(45) DEFAULT NULL,
  `Description` text,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Room_type_id`),
  UNIQUE KEY `Room_type_name_UNIQUE` (`Room_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_types`
--

LOCK TABLES `room_types` WRITE;
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;
INSERT INTO `room_types` VALUES (1,'Single','Single bed room',100.00),(2,'Double','Double bed room',150.00),(3,'Suite','Suite with luxury amenities',300.00);
/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `Room_id` int NOT NULL AUTO_INCREMENT,
  `Room_number` varchar(45) DEFAULT NULL,
  `Room_type_id` int DEFAULT NULL,
  `availablity_status` enum('AVAILABLE','BOOKED','MAINTANCE') DEFAULT 'AVAILABLE',
  PRIMARY KEY (`Room_id`),
  KEY `Room_type_id_idx` (`Room_type_id`),
  CONSTRAINT `Room_type_id` FOREIGN KEY (`Room_type_id`) REFERENCES `room_types` (`Room_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (2,'102',1,'AVAILABLE'),(3,'104',2,'AVAILABLE');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicerequests`
--

DROP TABLE IF EXISTS `servicerequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicerequests` (
  `ServiceRequestID` int NOT NULL AUTO_INCREMENT,
  `Booking_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `RequestDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(100) DEFAULT 'Pending',
  `Comments` text,
  PRIMARY KEY (`ServiceRequestID`),
  KEY `Booking_id` (`Booking_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `servicerequests_ibfk_1` FOREIGN KEY (`Booking_id`) REFERENCES `bookings` (`Booking_id`),
  CONSTRAINT `servicerequests_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicerequests`
--

LOCK TABLES `servicerequests` WRITE;
/*!40000 ALTER TABLE `servicerequests` DISABLE KEYS */;
INSERT INTO `servicerequests` VALUES (2,106,1,'2024-11-24 16:05:45','Pending','Need extra towels and room cleaning please.');
/*!40000 ALTER TABLE `servicerequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) NOT NULL,
  `Description` text,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Room Cleaning','room cleaning service',20.00),(3,'Room Service','24/7 food and drink service',12.00),(4,'Spa','Relaxing spa treatments',17.00);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialoffers`
--

DROP TABLE IF EXISTS `specialoffers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialoffers` (
  `OfferID` int NOT NULL AUTO_INCREMENT,
  `OfferName` varchar(100) DEFAULT NULL,
  `Description` text,
  `DiscountPercentage` decimal(5,2) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`OfferID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialoffers`
--

LOCK TABLES `specialoffers` WRITE;
/*!40000 ALTER TABLE `specialoffers` DISABLE KEYS */;
INSERT INTO `specialoffers` VALUES (1,'Summer Sale','Get 20% off on all bookings during summer',20.00,'2024-06-01','2024-08-31');
/*!40000 ALTER TABLE `specialoffers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `active_bookings`
--

/*!50001 DROP VIEW IF EXISTS `active_bookings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `active_bookings` AS select `b`.`Booking_id` AS `Booking_id`,`b`.`Customer_id` AS `Customer_id`,`b`.`Room_id` AS `Room_id`,`b`.`checkin_date` AS `checkin_date`,`b`.`checkout_date` AS `checkout_date` from `bookings` `b` where ((`b`.`status` = 'confirmed') and (`b`.`checkout_date` >= curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `booking_summary`
--

/*!50001 DROP VIEW IF EXISTS `booking_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `booking_summary` AS select `b`.`Booking_id` AS `Booking_id`,`b`.`Room_id` AS `Room_id`,`b`.`Customer_id` AS `Customer_id`,`c`.`First_name` AS `Customer_FirstName`,`c`.`Last_name` AS `Customer_LastName`,`b`.`checkin_date` AS `checkin_date`,`b`.`checkout_date` AS `checkout_date`,`b`.`status` AS `Booking_Status` from (`bookings` `b` join `customers` `c` on((`b`.`Customer_id` = `c`.`Customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_reviews`
--

/*!50001 DROP VIEW IF EXISTS `customer_reviews`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_reviews` AS select `r`.`Review_id` AS `Review_id`,`r`.`Customer_id` AS `Customer_id`,`c`.`First_name` AS `Customer_FirstName`,`c`.`Last_name` AS `Customer_LastName`,`r`.`Room_id` AS `Room_id`,`r`.`Rating` AS `Rating`,`r`.`Comment` AS `Comment`,`r`.`Review_date` AS `Review_date` from (`reviews` `r` join `customers` `c` on((`r`.`Customer_id` = `c`.`Customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maintenancerequestsummary`
--

/*!50001 DROP VIEW IF EXISTS `maintenancerequestsummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maintenancerequestsummary` AS select `mr`.`RequestID` AS `RequestID`,`r`.`Room_number` AS `Room_number`,`mr`.`RequestDate` AS `RequestDate`,`mr`.`Status` AS `Status`,`mr`.`Description` AS `Description` from (`maintenancerequests` `mr` join `rooms` `r` on((`mr`.`Room_id` = `r`.`Room_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `overdue_bookings`
--

/*!50001 DROP VIEW IF EXISTS `overdue_bookings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `overdue_bookings` AS select `b`.`Booking_id` AS `Booking_id`,`b`.`Customer_id` AS `Customer_id`,`b`.`Room_id` AS `Room_id`,`b`.`checkin_date` AS `checkin_date`,`b`.`checkout_date` AS `checkout_date` from `bookings` `b` where ((`b`.`status` = 'confirmed') and (`b`.`checkout_date` < curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `paymentsummary`
--

/*!50001 DROP VIEW IF EXISTS `paymentsummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `paymentsummary` AS select `p`.`Payment_id` AS `Payment_id`,`b`.`Booking_id` AS `Booking_id`,`c`.`First_name` AS `First_name`,`c`.`Last_name` AS `Last_name`,`p`.`Payment_date` AS `Payment_date`,`p`.`Amount` AS `Amount`,`p`.`Payment_method` AS `Payment_method` from ((`payments` `p` join `bookings` `b` on((`p`.`Booking_id` = `b`.`Booking_id`))) join `customers` `c` on((`b`.`Customer_id` = `c`.`Customer_id`))) */;
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

-- Dump completed on 2024-11-29 11:23:15
