-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Aug 29, 2021 at 08:51 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sample`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `Comment_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Comment` varchar(200) NOT NULL,
  `Parent_Comment_ID` int(11) NOT NULL DEFAULT '0',
  `Post_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `TimePosted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Vote` int(11) NOT NULL,
  PRIMARY KEY (`Comment_ID`),
  KEY `Forigen` (`User_ID`),
  KEY `Forigen2` (`Post_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`Comment_ID`, `Comment`, `Parent_Comment_ID`, `Post_ID`, `User_ID`, `TimePosted`, `Vote`) VALUES
(1, 'Wow good post', 0, 1, 1, '2021-08-28 18:25:55', 0),
(2, 'Such a good one', 0, 1, 1, '2021-08-28 18:25:55', 0),
(3, 'Such a good one ', 0, 1, 2, '2021-08-28 18:25:55', 0),
(4, 'Such a good one ', 0, 1, 2, '2021-08-28 18:25:55', 0),
(5, 'Good One', 1, 1, 1, '2021-08-28 18:25:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `Post_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Post_location` varchar(100) NOT NULL,
  `Vote` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Post_ID`),
  KEY `ForigenKey` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`Post_ID`, `User_ID`, `Post_location`, `Vote`) VALUES
(1, 2, 'C:\\Users\\rishi\\Downloads\\Sample.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `UserName`, `PASSWORD`) VALUES
(1, 'Kartikey', 'ajkfhafskjhasf'),
(2, 'Rishi', 'faskhfkashf');

-- --------------------------------------------------------

--
-- Table structure for table `vote_comment`
--

DROP TABLE IF EXISTS `vote_comment`;
CREATE TABLE IF NOT EXISTS `vote_comment` (
  `Comment_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Voting` int(11) NOT NULL,
  KEY `F11` (`Comment_ID`),
  KEY `F12` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vote_post`
--

DROP TABLE IF EXISTS `vote_post`;
CREATE TABLE IF NOT EXISTS `vote_post` (
  `Post_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Voting` int(11) NOT NULL,
  KEY `F1` (`User_ID`),
  KEY `F2` (`Post_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vote_post`
--

INSERT INTO `vote_post` (`Post_ID`, `User_ID`, `Voting`) VALUES
(1, 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `Forigen` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
  ADD CONSTRAINT `Forigen2` FOREIGN KEY (`Post_ID`) REFERENCES `posts` (`Post_ID`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `ForigenKey` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `vote_comment`
--
ALTER TABLE `vote_comment`
  ADD CONSTRAINT `F11` FOREIGN KEY (`Comment_ID`) REFERENCES `comment` (`Comment_ID`),
  ADD CONSTRAINT `F12` FOREIGN KEY (`User_ID`) REFERENCES `comment` (`User_ID`);

--
-- Constraints for table `vote_post`
--
ALTER TABLE `vote_post`
  ADD CONSTRAINT `F1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
  ADD CONSTRAINT `F2` FOREIGN KEY (`Post_ID`) REFERENCES `posts` (`Post_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
