-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for project_370
CREATE DATABASE IF NOT EXISTS `project_370` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `project_370`;

-- Dumping structure for table project_370.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `level` int(11) NOT NULL,
  `assigned_by` varchar(50) DEFAULT '',
  `uid` int(11) NOT NULL,
  KEY `a_id` (`uid`),
  CONSTRAINT `a_id` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table project_370.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `uid` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `location` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 5,
  KEY `c_id` (`uid`),
  KEY `location_id` (`location`),
  CONSTRAINT `c_id` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `location_id` FOREIGN KEY (`location`) REFERENCES `locations` (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table project_370.interested_users
CREATE TABLE IF NOT EXISTS `interested_users` (
  `post_id` int(11) DEFAULT NULL,
  `i_uid` int(11) DEFAULT NULL,
  KEY `post_id` (`post_id`),
  KEY `i_uid` (`i_uid`),
  CONSTRAINT `i_uid` FOREIGN KEY (`i_uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table project_370.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`lid`),
  UNIQUE KEY `lid` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table project_370.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `from_uid` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL,
  `date` date NOT NULL,
  `body` varchar(255) NOT NULL,
  PRIMARY KEY (`mid`),
  UNIQUE KEY `mid` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table project_370.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` date NOT NULL,
  `event_date` date NOT NULL,
  `restaurant_name` varchar(50) NOT NULL,
  `offer_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `person` int(11) NOT NULL DEFAULT 0,
  `c_uid` int(11) NOT NULL DEFAULT 0,
  `location` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pid` (`pid`),
  KEY `c_uid` (`c_uid`),
  KEY `event_location_id` (`location`),
  CONSTRAINT `c_uid` FOREIGN KEY (`c_uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `event_location_id` FOREIGN KEY (`location`) REFERENCES `locations` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table project_370.preferences
CREATE TABLE IF NOT EXISTS `preferences` (
  `pref_id` int(11) NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(50) NOT NULL,
  PRIMARY KEY (`pref_id`),
  UNIQUE KEY `pref_id` (`pref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table project_370.preferences_relation
CREATE TABLE IF NOT EXISTS `preferences_relation` (
  `pref_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  KEY `pref_id` (`pref_id`),
  KEY `preferredBy` (`c_id`),
  CONSTRAINT `pref_id` FOREIGN KEY (`pref_id`) REFERENCES `preferences` (`pref_id`),
  CONSTRAINT `preferredBy` FOREIGN KEY (`c_id`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table project_370.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table project_370.tags_relation
CREATE TABLE IF NOT EXISTS `tags_relation` (
  `tag_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_id`),
  KEY `tagged_customer` (`c_id`),
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`),
  CONSTRAINT `tagged_customer` FOREIGN KEY (`c_id`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table project_370.users
CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `joining_date` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
