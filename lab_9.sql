-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `File`;
CREATE TABLE `File` (
  `file_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_url` varchar(255) NOT NULL,
  `file_type` enum('project','task') NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `File` (`file_id`, `file_name`, `file_url`, `file_type`) VALUES
(1,	'ProjectPlan.pdf',	'https://example.com/project_plan.pdf',	'project'),
(2,	'TaskDetails.docx',	'https://example.com/task_details.docx',	'task'),
(3,	'Budget.xlsx',	'https://example.com/budget.xlsx',	'project'),
(4,	'MeetingNotes.txt',	'https://example.com/meeting_notes.txt',	'task'),
(5,	'Requirements.docx',	'https://example.com/requirements.docx',	'project');

DROP TABLE IF EXISTS `Project`;
CREATE TABLE `Project` (
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Project` (`project_id`, `name`, `description`, `start_date`, `end_date`) VALUES
(1,	'Website Redesign',	'Redesign the corporate website for better UX.',	'2024-01-01',	'2024-06-01'),
(2,	'Mobile App Development',	'Develop a mobile application for e-commerce.',	'2024-03-01',	'2024-09-01'),
(3,	'Marketing Campaign',	'Launch a digital marketing campaign.',	'2024-04-15',	'2024-08-15'),
(4,	'Product Launch',	'Organize a new product launch event.',	'2024-02-01',	'2024-05-01'),
(5,	'Data Migration',	'Migrate data to the new cloud platform.',	'2024-05-01',	'2024-12-01');

DROP TABLE IF EXISTS `Project_Files`;
CREATE TABLE `Project_Files` (
  `project_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`file_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `project_files_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `Project` (`project_id`),
  CONSTRAINT `project_files_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `File` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Project_Files` (`project_id`, `file_id`) VALUES
(1,	1),
(1,	3),
(2,	3),
(3,	1),
(4,	5);

DROP TABLE IF EXISTS `Task`;
CREATE TABLE `Task` (
  `task_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `project_id` (`project_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `Project` (`project_id`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Task` (`task_id`, `name`, `description`, `created_at`, `due_date`, `project_id`, `author_id`) VALUES
(1,	'Design Mockups',	'Create mockups for the new website.',	'2024-01-10 09:00:00',	'2024-01-20 00:00:00',	1,	1),
(2,	'API Development',	'Develop APIs for the mobile app.',	'2024-03-10 10:00:00',	'2024-04-10 00:00:00',	2,	2),
(3,	'Ad Creatives',	'Design banners and creatives for the campaign.',	'2024-04-20 15:00:00',	'2024-05-20 00:00:00',	3,	3),
(4,	'Venue Booking',	'Book a venue for the product launch.',	'2024-02-10 14:00:00',	'2024-03-01 00:00:00',	4,	4),
(5,	'Database Backup',	'Backup all data before migration.',	'2024-05-05 12:00:00',	'2024-05-10 00:00:00',	5,	5);

DROP TABLE IF EXISTS `Task_Assignees`;
CREATE TABLE `Task_Assignees` (
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `task_assignees_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `Task` (`task_id`),
  CONSTRAINT `task_assignees_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Task_Assignees` (`task_id`, `user_id`) VALUES
(1,	3),
(2,	4),
(3,	2),
(4,	1),
(5,	5);

DROP TABLE IF EXISTS `Task_Files`;
CREATE TABLE `Task_Files` (
  `task_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`,`file_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `task_files_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `Task` (`task_id`),
  CONSTRAINT `task_files_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `File` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Task_Files` (`task_id`, `file_id`) VALUES
(1,	2),
(2,	4),
(3,	2),
(4,	4),
(5,	5);

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('author','assignee') NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `User` (`user_id`, `name`, `email`, `role`) VALUES
(1,	'Alice',	'alice@example.com',	'author'),
(2,	'Bob',	'bob@example.com',	'author'),
(3,	'Charlie',	'charlie@example.com',	'assignee'),
(4,	'Diana',	'diana@example.com',	'assignee'),
(5,	'Eve',	'eve@example.com',	'assignee');

-- 2024-11-27 20:42:00