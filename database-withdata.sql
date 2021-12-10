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

-- Dumping data for table project_370.admins: ~0 rows (approximately)
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

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

-- Dumping data for table project_370.customers: ~2 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`uid`, `picture`, `location`, `rating`) VALUES
	(45, 'https://www.pngarts.com/files/11/Avatar-PNG-Picture.png', 3, 5),
	(47, 'https://www.pngarts.com/files/11/Avatar-PNG-Picture.png', 3, 4),
	(48, 'https://www.pngarts.com/files/11/Avatar-PNG-Picture.png', 4, 1),
	(52, 'https://www.pngarts.com/files/11/Avatar-PNG-Picture.png', 4, 1),
	(56, 'https://www.pngarts.com/files/11/Avatar-PNG-Picture.png', 4, 1),
	(63, 'https://www.pngarts.com/files/11/Avatar-PNG-Picture.png', 4, 1),
	(65, 'https://www.pngarts.com/files/11/Avatar-PNG-Picture.png', 5, 1),
	(66, 'https://www.pngarts.com/files/11/Avatar-PNG-Picture.png', 1, 1),
	(75, 'https://www.pngarts.com/files/11/Avatar-PNG-Picture.png', 4, 5);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for table project_370.interested_users
CREATE TABLE IF NOT EXISTS `interested_users` (
  `post_id` int(11) DEFAULT NULL,
  `i_uid` int(11) DEFAULT NULL,
  KEY `post_id` (`post_id`),
  KEY `i_uid` (`i_uid`),
  CONSTRAINT `i_uid` FOREIGN KEY (`i_uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table project_370.interested_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `interested_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `interested_users` ENABLE KEYS */;

-- Dumping structure for table project_370.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`lid`),
  UNIQUE KEY `lid` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- Dumping data for table project_370.locations: ~3 rows (approximately)
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`lid`, `name`) VALUES
	(1, 'Gulshan'),
	(2, 'Dhanmondi'),
	(3, 'Uttara'),
	(4, 'Khilgaon'),
	(5, 'Mirpur'),
	(6, 'Mohammadpur'),
	(7, 'Puran Dhaka'),
	(8, 'Shyamoli'),
	(9, 'Banani'),
	(10, 'Baily Road'),
	(11, 'Bashundhara');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;

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

-- Dumping data for table project_370.messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

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

-- Dumping data for table project_370.posts: ~10 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`pid`, `create_date`, `event_date`, `restaurant_name`, `offer_name`, `price`, `person`, `c_uid`, `location`) VALUES
	(4, '2021-02-02', '2021-05-02', 'Chillox', 'BOGO', 200, 2, 45, 2),
	(6, '2021-02-02', '2021-05-20', 'Midas', 'BTGT', 100, 2, 63, 2),
	(9, '2021-02-02', '2021-05-05', 'Farm House', 'B1G1', 100, 5, 45, 1),
	(10, '2021-02-02', '2021-05-25', 'Chef Table', 'Get Two', 1500, 2, 45, 1),
	(11, '2020-02-02', '2020-05-10', 'Hakka Dhaka', 'BTGT', 5000, 3, 47, 1),
	(13, '2020-05-01', '2020-05-11', 'Mr. Manik', 'BTGT', 500, 2, 47, 3),
	(14, '2021-05-18', '2021-05-04', 'Forest Lounge', 'New Menu', 500, 1, 45, 2),
	(15, '2021-05-18', '2021-02-02', 'Preetom Burger', 'BOGO', 500, 6, 45, 2),
	(25, '2021-04-18', '2021-05-18', 'Amari Dhaka ', 'BOTO ', 50, 2, 45, 1),
	(27, '2021-05-18', '2021-05-19', 'Takeout ', 'BOGO ', 500, 4, 45, 2),
	(29, '2021-05-18', '2021-08-22', 'Ancholik Khanas', 'BOGO', 500, 3, 47, 2),
	(70, '2021-05-18', '2021-07-19', 'Chillox', 'BOGO', 1200, 2, 66, 2),
	(71, '2021-05-18', '2021-06-14', 'Chef Table', 'Get Two', 850, 3, 75, 1),
	(72, '2021-05-17', '2021-05-21', 'Farm House', 'Friendship', 250, 2, 52, 1),
	(73, '2021-05-14', '2021-05-10', 'Takeout', 'Couple', 1000, 2, 56, 5),
	(74, '2021-04-11', '2022-05-10', 'Mezbaan', 'Buffet', 1299, 2, 56, 2),
	(75, '2021-01-10', '2022-05-18', 'Chef Table', 'Get Two', 150, 2, 52, 1),
	(76, '2021-01-11', '2022-01-11', 'Preetom Burger', 'New Menu', 350, 3, 63, 8),
	(77, '2021-04-18', '2021-08-16', 'Mr. Manik', 'B1G1', 150, 4, 48, 6),
	(78, '2021-04-18', '2021-08-19', 'Amari Dhaka', 'Credit Card', 15000, 4, 66, 1),
	(90, '2021-05-16', '2021-05-26', 'Chillox', 'BTGT', 145, 2, 48, 4),
	(91, '2021-05-13', '2021-05-19', 'Midas', 'BOGO', 150, 2, 63, 4),
	(92, '2021-05-11', '2021-05-21', 'Chillox', 'BTGT', 145, 2, 65, 5),
	(93, '2021-04-16', '2021-07-15', 'Hakka Dhaka ', 'New Item', 1500, 6, 52, 9),
	(94, '2021-05-18', '2021-05-21', 'Madchef', 'BTGT', 150, 4, 75, 11);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table project_370.preferences
CREATE TABLE IF NOT EXISTS `preferences` (
  `pref_id` int(11) NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(50) NOT NULL,
  PRIMARY KEY (`pref_id`),
  UNIQUE KEY `pref_id` (`pref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table project_370.preferences: ~0 rows (approximately)
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;

-- Dumping structure for table project_370.preferences_relation
CREATE TABLE IF NOT EXISTS `preferences_relation` (
  `pref_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  KEY `pref_id` (`pref_id`),
  KEY `preferredBy` (`c_id`),
  CONSTRAINT `pref_id` FOREIGN KEY (`pref_id`) REFERENCES `preferences` (`pref_id`),
  CONSTRAINT `preferredBy` FOREIGN KEY (`c_id`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table project_370.preferences_relation: ~0 rows (approximately)
/*!40000 ALTER TABLE `preferences_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferences_relation` ENABLE KEYS */;

-- Dumping structure for table project_370.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table project_370.tags: ~0 rows (approximately)
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Dumping structure for table project_370.tags_relation
CREATE TABLE IF NOT EXISTS `tags_relation` (
  `tag_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_id`),
  KEY `tagged_customer` (`c_id`),
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`),
  CONSTRAINT `tagged_customer` FOREIGN KEY (`c_id`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table project_370.tags_relation: ~0 rows (approximately)
/*!40000 ALTER TABLE `tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_relation` ENABLE KEYS */;

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

-- Dumping data for table project_370.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`uid`, `name`, `type`, `joining_date`, `gender`, `date_of_birth`, `username`, `password`, `session_id`) VALUES
	(45, 'Tanvir', 2, '2020-12-10', 'Male', '1998-02-02', 'tanvir', '1234', NULL),
	(47, 'Tanjid', 2, '2021-03-10', 'Male', '1998-12-02', 'tanjid', '1234', NULL),
	(48, 'Arfa', 2, '2021-05-04', 'Male', '1999-10-02', 'arfa', '1234', NULL),
	(52, 'Jim', 2, '2021-05-04', 'Male', '2000-02-02', 'jim', '1234', NULL),
	(56, 'Uschschas', 2, '2021-04-08', 'Male', '1999-05-06', 'uschash', '1234', NULL),
	(63, 'Sakib', 2, '2021-04-05', 'Male', '1998-08-08', 'sakib', '1234', NULL),
	(65, 'Alok', 2, '2021-05-16', 'Male', '1222-02-08', 'alok', '1234', NULL),
	(66, 'Tahia', 2, '2021-05-18', 'Female', '1998-02-25', 'tahia', '1234', NULL),
	(75, 'Shifa', 2, '2021-05-18', 'Female', '1999-02-25', 'shifa', '1234', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
