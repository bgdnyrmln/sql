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

-- Dumping structure for table saules_starini.galdini
CREATE TABLE IF NOT EXISTS `galdini` (
  `Galdina_ID` int NOT NULL,
  `Vietu_skaits` int DEFAULT NULL,
  `bilde` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  PRIMARY KEY (`Galdina_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table saules_starini.galdini: ~5 rows (approximately)
INSERT INTO `galdini` (`Galdina_ID`, `Vietu_skaits`, `bilde`) VALUES
	(1, 2, NULL),
	(2, 5, NULL),
	(3, 4, NULL),
	(4, 2, NULL),
	(5, 8, NULL);

-- Dumping structure for table saules_starini.klienti
CREATE TABLE IF NOT EXISTS `klienti` (
  `Klienta_ID` int NOT NULL,
  `Vards` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  `Uzvards` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  `Numurs` int NOT NULL,
  PRIMARY KEY (`Klienta_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table saules_starini.klienti: ~3 rows (approximately)
INSERT INTO `klienti` (`Klienta_ID`, `Vards`, `Uzvards`, `Numurs`) VALUES
	(1, 'Jānis', 'Bērziņš', 22432222),
	(2, 'Anna', 'Kalniņa', 22344332),
	(3, 'Pēteris', 'Ozoliņš', 29517961);

-- Dumping structure for table saules_starini.pasutijumi
CREATE TABLE IF NOT EXISTS `pasutijumi` (
  `Pasutijuma_identifikators` int NOT NULL,
  `Datums` date DEFAULT NULL,
  `Kopeja_summa` int DEFAULT NULL,
  `Klienta_ID` int DEFAULT NULL,
  PRIMARY KEY (`Pasutijuma_identifikators`),
  KEY `FK_pasutijumi_klienti` (`Klienta_ID`),
  CONSTRAINT `FK_pasutijumi_klienti` FOREIGN KEY (`Klienta_ID`) REFERENCES `klienti` (`Klienta_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table saules_starini.pasutijumi: ~8 rows (approximately)
INSERT INTO `pasutijumi` (`Pasutijuma_identifikators`, `Datums`, `Kopeja_summa`, `Klienta_ID`) VALUES
	(1, '2024-04-10', 100, 1),
	(2, '2024-04-11', 200, 2),
	(3, '2024-04-12', 300, 3),
	(4, '2024-04-12', 100, 2),
	(5, '2024-04-13', 300, 3),
	(6, '2024-04-14', 100, 3),
	(7, '2024-04-14', 300, 2),
	(8, '2024-04-15', 100, 1);

-- Dumping structure for table saules_starini.rezervacija
CREATE TABLE IF NOT EXISTS `rezervacija` (
  `Rezervacijas_ID` int NOT NULL,
  `Datums` date DEFAULT NULL,
  `Laiks` time DEFAULT NULL,
  `Stundu_skaits` int DEFAULT NULL,
  `Galdina_ID` int DEFAULT NULL,
  `Klienta_ID` int DEFAULT NULL,
  PRIMARY KEY (`Rezervacijas_ID`),
  KEY `FK_rezervacija_galdini` (`Galdina_ID`),
  KEY `FK_rezervacija_klienti` (`Klienta_ID`),
  CONSTRAINT `FK_rezervacija_galdini` FOREIGN KEY (`Galdina_ID`) REFERENCES `galdini` (`Galdina_ID`),
  CONSTRAINT `FK_rezervacija_klienti` FOREIGN KEY (`Klienta_ID`) REFERENCES `klienti` (`Klienta_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table saules_starini.rezervacija: ~10 rows (approximately)
INSERT INTO `rezervacija` (`Rezervacijas_ID`, `Datums`, `Laiks`, `Stundu_skaits`, `Galdina_ID`, `Klienta_ID`) VALUES
	(1, '2024-04-20', '10:00:00', 2, 3, 1),
	(2, '2024-04-21', '12:00:00', 1, 1, 2),
	(3, '2024-04-22', '18:00:00', 3, 5, 3),
	(4, '2024-04-23', '15:00:00', 2, 2, 3),
	(5, '2024-04-24', '11:00:00', 3, 4, 2),
	(6, '2024-04-25', '17:00:00', 4, 1, 3),
	(7, '2024-04-26', '09:00:00', 1, 3, 1),
	(8, '2024-04-27', '13:00:00', 2, 5, 2),
	(9, '2024-04-28', '19:00:00', 2, 2, 3),
	(10, '2024-04-29', '10:00:00', 4, 4, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
