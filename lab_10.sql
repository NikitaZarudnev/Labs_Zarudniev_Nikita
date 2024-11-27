-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `Connections`;
CREATE TABLE `Connections` (
  `ConnectionID` int(11) NOT NULL AUTO_INCREMENT,
  `StationID1` int(11) DEFAULT NULL,
  `StationID2` int(11) DEFAULT NULL,
  `ConnectionType` enum('Direct','Transfer','Triple') COLLATE utf8mb4_unicode_ci DEFAULT 'Direct',
  PRIMARY KEY (`ConnectionID`),
  KEY `StationID1` (`StationID1`),
  KEY `StationID2` (`StationID2`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`StationID1`) REFERENCES `Stations` (`StationID`) ON DELETE CASCADE,
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`StationID2`) REFERENCES `Stations` (`StationID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `Lines`;
CREATE TABLE `Lines` (
  `LineID` int(11) NOT NULL AUTO_INCREMENT,
  `LineName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LineColor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Lines` (`LineID`, `LineName`, `LineColor`) VALUES
(1,	'Блакитна лінія',	'Blue'),
(2,	'Зелена лінія',	'Green'),
(3,	'Червона лінія',	'Red');

DROP TABLE IF EXISTS `MultiConnections`;
CREATE TABLE `MultiConnections` (
  `GroupID` int(11) NOT NULL AUTO_INCREMENT,
  `ConnectionID` int(11) NOT NULL,
  `StationID` int(11) NOT NULL,
  PRIMARY KEY (`GroupID`),
  KEY `StationID` (`StationID`),
  KEY `ConnectionID` (`ConnectionID`),
  CONSTRAINT `MultiConnections_ibfk_1` FOREIGN KEY (`StationID`) REFERENCES `Stations` (`StationID`) ON DELETE CASCADE,
  CONSTRAINT `MultiConnections_ibfk_2` FOREIGN KEY (`ConnectionID`) REFERENCES `Connections` (`ConnectionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `Stations`;
CREATE TABLE `Stations` (
  `StationID` int(11) NOT NULL AUTO_INCREMENT,
  `StationName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LineID` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`StationID`),
  KEY `LineID` (`LineID`),
  CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`LineID`) REFERENCES `Lines` (`LineID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Stations` (`StationID`, `StationName`, `LineID`, `IsActive`) VALUES
(33,	'Академмістечко',	1,	1),
(34,	'Житомирська',	1,	1),
(35,	'Хрещатик',	2,	1),
(36,	'Майдан Незалежності',	2,	1),
(37,	'Сирець',	3,	1),
(38,	'Дорогожичі',	3,	1);

-- 2024-11-27 23:12:33
