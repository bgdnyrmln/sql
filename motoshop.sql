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


-- Dumping database structure for motoshop
CREATE DATABASE IF NOT EXISTS `motoshop` /*!40100 DEFAULT CHARACTER SET ucs2 COLLATE ucs2_latvian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `motoshop`;

-- Dumping structure for table motoshop.detalizeti
CREATE TABLE IF NOT EXISTS `detalizeti` (
  `ID` int NOT NULL,
  `Daudzums` int DEFAULT NULL,
  `FK_Prece` int DEFAULT NULL,
  `FK_Pasutijums` int DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `FK_detalizeti_preces` (`FK_Prece`),
  KEY `FK_detalizeti_pasutijumi` (`FK_Pasutijums`),
  CONSTRAINT `FK_detalizeti_pasutijumi` FOREIGN KEY (`FK_Pasutijums`) REFERENCES `pasutijumi` (`Pasutijuma_ID`),
  CONSTRAINT `FK_detalizeti_preces` FOREIGN KEY (`FK_Prece`) REFERENCES `preces` (`Preces_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table motoshop.detalizeti: ~9 rows (approximately)
INSERT INTO `detalizeti` (`ID`, `Daudzums`, `FK_Prece`, `FK_Pasutijums`) VALUES
	(1, 1, 1234567891, 1231232132),
	(2, 2, 1234567890, 1231232132),
	(3, 3, 2147483647, 1231232132),
	(4, 3, 2147483647, 1234567890),
	(5, 2, 1234567890, 1234567890),
	(6, 2, 1234567892, 1234567890),
	(7, 1, 1234567892, 2147483647),
	(8, 2, 2147483647, 2147483647),
	(9, 3, 1234567890, 2147483647);

-- Dumping structure for table motoshop.lietotaji
CREATE TABLE IF NOT EXISTS `lietotaji` (
  `Personas_kods` varchar(12) CHARACTER SET ucs2 COLLATE ucs2_latvian_ci NOT NULL,
  `Vards` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Uzvards` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Dzimsanas_diena` date DEFAULT NULL,
  PRIMARY KEY (`Personas_kods`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table motoshop.lietotaji: ~3 rows (approximately)
INSERT INTO `lietotaji` (`Personas_kods`, `Vards`, `Uzvards`, `Dzimsanas_diena`) VALUES
	('010180-67890', 'Jānis', 'Bērziņš', '1980-01-01'),
	('020290-89012', 'Anna', 'Kalniņa', '1990-02-02'),
	('030300-21098', 'Pēteris', 'Ozols', '2000-03-03');

-- Dumping structure for table motoshop.pasutijumi
CREATE TABLE IF NOT EXISTS `pasutijumi` (
  `Pasutijuma_ID` int NOT NULL,
  `Datums` date DEFAULT NULL,
  `Pasutijuma_statuss` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Summa` double DEFAULT NULL,
  `FK_Klienta_ID` varchar(12) CHARACTER SET ucs2 COLLATE ucs2_latvian_ci DEFAULT NULL,
  PRIMARY KEY (`Pasutijuma_ID`),
  KEY `FK_pasutijumi_lietotaji` (`FK_Klienta_ID`),
  CONSTRAINT `FK_pasutijumi_lietotaji` FOREIGN KEY (`FK_Klienta_ID`) REFERENCES `lietotaji` (`Personas_kods`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table motoshop.pasutijumi: ~3 rows (approximately)
INSERT INTO `pasutijumi` (`Pasutijuma_ID`, `Datums`, `Pasutijuma_statuss`, `Summa`, `FK_Klienta_ID`) VALUES
	(1231232132, '2024-04-16', 'cancelled', 70, '020290-89012'),
	(1234567890, '2023-10-24', 'pending', 129, '020290-89012'),
	(2147483647, '2024-02-01', 'shipped', 45.99, '010180-67890');

-- Dumping structure for table motoshop.preces
CREATE TABLE IF NOT EXISTS `preces` (
  `Preces_ID` int NOT NULL,
  `Preces_nosaukums` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Apraksts` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Cena` double DEFAULT NULL,
  PRIMARY KEY (`Preces_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table motoshop.preces: ~4 rows (approximately)
INSERT INTO `preces` (`Preces_ID`, `Preces_nosaukums`, `Apraksts`, `Cena`) VALUES
	(1234567890, 'T-krekls', 'Melns T-krekls ar izdruku', 15),
	(1234567891, 'Apavi', 'Sporta apavi', 50),
	(1234567892, 'Apavi', 'Sporta apavi', 70),
	(2147483647, 'Bikses', 'Džinsa bikses', 30);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
