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


-- Dumping database structure for macibas
CREATE DATABASE IF NOT EXISTS `macibas` /*!40100 DEFAULT CHARACTER SET ucs2 COLLATE ucs2_latvian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `macibas`;

-- Dumping structure for table macibas.audzekni
CREATE TABLE IF NOT EXISTS `audzekni` (
  `Personas_kods` varchar(12) COLLATE ucs2_latvian_ci NOT NULL,
  `Vards` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Uzvards` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Talruna_numurs` int DEFAULT NULL,
  `Adrese` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Dzimsanas_diena` date DEFAULT NULL,
  `Grupa_FK` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  PRIMARY KEY (`Personas_kods`),
  KEY `FK_audzekni_grupas` (`Grupa_FK`),
  CONSTRAINT `FK_audzekni_grupas` FOREIGN KEY (`Grupa_FK`) REFERENCES `grupas` (`Nosaukums`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table macibas.audzekni: ~0 rows (approximately)

-- Dumping structure for table macibas.diploma_vertejumi
CREATE TABLE IF NOT EXISTS `diploma_vertejumi` (
  `ID` int NOT NULL,
  `Vertejums` varchar(3) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  `Skolens_FK` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Prieksmets_FK` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_diploma_vertejumi_audzekni` (`Skolens_FK`),
  KEY `FK_diploma_vertejumi_prieksmeti` (`Prieksmets_FK`),
  CONSTRAINT `FK_diploma_vertejumi_audzekni` FOREIGN KEY (`Skolens_FK`) REFERENCES `audzekni` (`Personas_kods`),
  CONSTRAINT `FK_diploma_vertejumi_prieksmeti` FOREIGN KEY (`Prieksmets_FK`) REFERENCES `prieksmeti` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table macibas.diploma_vertejumi: ~0 rows (approximately)

-- Dumping structure for table macibas.grupas
CREATE TABLE IF NOT EXISTS `grupas` (
  `Nosaukums` varchar(50) COLLATE ucs2_latvian_ci NOT NULL,
  `Izglitibas_programma_FK` int DEFAULT NULL,
  `Audzinatajs_FK` int DEFAULT NULL,
  PRIMARY KEY (`Nosaukums`),
  KEY `FK_grupas_izglitibas_programmas` (`Izglitibas_programma_FK`),
  KEY `FK_grupas_skolotaji` (`Audzinatajs_FK`),
  CONSTRAINT `FK_grupas_izglitibas_programmas` FOREIGN KEY (`Izglitibas_programma_FK`) REFERENCES `izglitibas_programmas` (`Kods`),
  CONSTRAINT `FK_grupas_skolotaji` FOREIGN KEY (`Audzinatajs_FK`) REFERENCES `skolotaji` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table macibas.grupas: ~0 rows (approximately)

-- Dumping structure for table macibas.izglitibas_programmas
CREATE TABLE IF NOT EXISTS `izglitibas_programmas` (
  `Kods` int NOT NULL,
  `Nosaukums` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Kods`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table macibas.izglitibas_programmas: ~0 rows (approximately)

-- Dumping structure for table macibas.macibu_process
CREATE TABLE IF NOT EXISTS `macibu_process` (
  `ID` int NOT NULL,
  `Semestris` int DEFAULT NULL,
  `Teorijas_stundas` int DEFAULT NULL,
  `Praktiskas_stundas` int DEFAULT NULL,
  `Grupa_FK` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Prieksmets_FK` int DEFAULT NULL,
  `Skolotajs_FK` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK2` (`Skolotajs_FK`),
  KEY `FK_macibu_process_prieksmeti` (`Prieksmets_FK`),
  KEY `FK1` (`Grupa_FK`),
  CONSTRAINT `FK1` FOREIGN KEY (`Grupa_FK`) REFERENCES `grupas` (`Nosaukums`),
  CONSTRAINT `FK2` FOREIGN KEY (`Skolotajs_FK`) REFERENCES `skolotaji` (`ID`),
  CONSTRAINT `FK_macibu_process_prieksmeti` FOREIGN KEY (`Prieksmets_FK`) REFERENCES `prieksmeti` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table macibas.macibu_process: ~0 rows (approximately)

-- Dumping structure for table macibas.nozare
CREATE TABLE IF NOT EXISTS `nozare` (
  `nozare` varchar(50) COLLATE ucs2_latvian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`nozare`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table macibas.nozare: ~0 rows (approximately)

-- Dumping structure for table macibas.prieksmeti
CREATE TABLE IF NOT EXISTS `prieksmeti` (
  `ID` int NOT NULL,
  `Nosaukums` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Teorijas_stundas` int DEFAULT NULL,
  `Praktiskas_stundas` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table macibas.prieksmeti: ~0 rows (approximately)

-- Dumping structure for table macibas.skolotaji
CREATE TABLE IF NOT EXISTS `skolotaji` (
  `ID` int NOT NULL,
  `Vards` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Uzvards` varchar(50) COLLATE ucs2_latvian_ci DEFAULT NULL,
  `Talruna_numurs` int DEFAULT NULL,
  `Darba_stazs` int DEFAULT NULL,
  `Komisija_FK` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_latvian_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_skolotaji_nozare` (`Komisija_FK`) USING BTREE,
  CONSTRAINT `FK_skolotaji_nozare` FOREIGN KEY (`Komisija_FK`) REFERENCES `nozare` (`nozare`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_latvian_ci;

-- Dumping data for table macibas.skolotaji: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
