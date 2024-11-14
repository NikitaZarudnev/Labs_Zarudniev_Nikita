-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `Articles`;
CREATE TABLE `Articles` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `published_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Autor` int(11) NOT NULL,
  PRIMARY KEY (`article_id`),
  KEY `category_id` (`category_id`),
  KEY `Autor` (`Autor`),
  CONSTRAINT `Articles_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `Articles_ibfk_2` FOREIGN KEY (`Autor`) REFERENCES `Autors` (`Autor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `Articles` (`article_id`, `title`, `content`, `category_id`, `published_date`, `Autor`) VALUES
(1,	'Tech News 1',	'Content of tech news 1',	1,	'2024-11-01 10:00:00',	1),
(2,	'Health Tips',	'Content of health tips',	2,	'2024-11-02 11:30:00',	2),
(3,	'Political Update',	'Content of political update',	3,	'2024-11-03 15:45:00',	3),
(4,	'Science Discovery',	'Content of science discovery',	4,	'2024-11-04 13:20:00',	4),
(5,	'Sports Highlights',	'Content of sports highlights',	5,	'2024-11-05 17:05:00',	5);

DROP TABLE IF EXISTS `Autors`;
CREATE TABLE `Autors` (
  `Autor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`Autor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `Autors` (`Autor_id`, `name`, `email`, `password`) VALUES
(1,	'Michael',	'michael228@gmail.com',	'password123'),
(2,	'Sarah',	'sarah.smith@gmail.com',	'password456'),
(3,	'John',	'john.doe@gmail.com',	'password789'),
(4,	'Alice',	'alice.wonder@gmail.com',	'password101'),
(5,	'Bob',	'bob.marley@gmail.com',	'password202');

DROP TABLE IF EXISTS `Categories`;
CREATE TABLE `Categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `Categories` (`category_id`, `name`) VALUES
(1,	'Technology'),
(2,	'Health'),
(3,	'Politics'),
(4,	'Science'),
(5,	'Sports');

DROP TABLE IF EXISTS `Comments`;
CREATE TABLE `Comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`comment_id`),
  KEY `article_id` (`article_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Comments_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `Articles` (`article_id`) ON DELETE CASCADE,
  CONSTRAINT `Comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `Comments` (`comment_id`, `article_id`, `user_id`, `content`, `timestamp`) VALUES
(21,	1,	1,	'Great article on tech!',	'2024-11-01 11:00:00'),
(22,	2,	2,	'Very informative health tips.',	'2024-11-02 12:00:00'),
(23,	3,	3,	'Interesting political insights.',	'2024-11-03 16:00:00'),
(24,	4,	4,	'Amazing science discovery!',	'2024-11-04 14:00:00'),
(25,	5,	5,	'Loved the sports highlights.',	'2024-11-05 18:00:00');

DROP TABLE IF EXISTS `Ratings`;
CREATE TABLE `Ratings` (
  `user_ip` varchar(45) NOT NULL,
  `article_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_ip`,`article_id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `Ratings_ibfk_1` FOREIGN KEY (`user_ip`) REFERENCES `Users` (`ip_address`) ON DELETE CASCADE,
  CONSTRAINT `Ratings_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `Articles` (`article_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `Ratings` (`user_ip`, `article_id`, `rating`, `timestamp`) VALUES
('192.168.1.1',	1,	5,	'2024-11-01 11:30:00'),
('192.168.1.2',	2,	4,	'2024-11-02 12:30:00'),
('192.168.1.3',	3,	3,	'2024-11-03 16:30:00'),
('192.168.1.4',	4,	5,	'2024-11-04 14:30:00'),
('192.168.1.5',	5,	4,	'2024-11-05 18:30:00');

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `email` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ip_address` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `Users` (`user_id`, `ip_address`, `username`, `email`, `password`) VALUES
(1,	'192.168.1.1',	'Michael',	'michael228@gmail.com',	'123456ABC'),
(2,	'192.168.1.2',	'Andrey',	'andrey228@gmail.com',	'robot777'),
(3,	'192.168.1.3',	'Nikita',	'nikita@gmail.com',	'nikita1404'),
(4,	'192.168.1.4',	'Ilya',	'MrYnit@gmail.com',	'Ilya567'),
(5,	'192.168.1.5',	'Artem',	'artem0608@gmail.com',	'artemkryt');

-- 2024-11-14 21:13:09
