-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for saules_starini
CREATE DATABASE IF NOT EXISTS `saules_starini` /*!40100 DEFAULT CHARACTER SET ucs2 COLLATE ucs2_latvian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `saules_starini`;

-- Dumping structure for table saules_starini.pasutijumi
CREATE TABLE IF NOT EXISTS `pasutijumi` (
  `Pasutijuma_identifikators` int NOT NULL,
  `Datums` int DEFAULT NULL,
  `Kopeja_summa` int DEFAULT NULL,
  `Klienta_ID` int DEFAULT NULL,
  PRIMARY KEY (`Pasutijuma_identifikators`),
  KEY `FK_pasutijumi_klienti` (`Klienta_ID`),
  CONSTRAINT `FK_pasutijumi_klienti` FOREIGN KEY (`Klienta_ID`) REFERENCES `klienti` (`Klienta_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table saules_starini.pasutijumi: ~3 rows (approximately)
INSERT INTO `pasutijumi` (`Pasutijuma_identifikators`, `Datums`, `Kopeja_summa`, `Klienta_ID`) VALUES
	(1, 2024, 100, 1),
	(2, 2024, 200, 2),
	(3, 2024, 300, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
