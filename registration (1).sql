-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 30, 2021 at 09:35 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registration`
--

-- --------------------------------------------------------

--
-- Table structure for table `article-docs`
--

DROP TABLE IF EXISTS `article-docs`;
CREATE TABLE IF NOT EXISTS `article-docs` (
  `ID` int(50) NOT NULL,
  `ARTICLEID` int(50) NOT NULL,
  `PHOTO` blob NOT NULL,
  KEY `ARTICLEID` (`ARTICLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8;

-- --------------------------------------------------------

--
-- Table structure for table `article-types`
--

DROP TABLE IF EXISTS `article-types`;
CREATE TABLE IF NOT EXISTS `article-types` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LABEL` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `ID` int(50) NOT NULL AUTO_INCREMENT,
  `TYPEID` int(50) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `PRICE` double NOT NULL,
  `PUBLISHDATE` datetime NOT NULL,
  `STATUS` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TYPEID` (`TYPEID`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
CREATE TABLE IF NOT EXISTS `favourites` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ARTICLEID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USERID` (`USERID`),
  KEY `ARTICLEID` (`ARTICLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FNAME` varchar(50) NOT NULL,
  `LNAME` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `ID` int(50) NOT NULL AUTO_INCREMENT,
  `LABEL` varchar(50) NOT NULL,
  `VALID` int(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `TYPEID` int(11) NOT NULL,
  `VALID` int(11) NOT NULL,
  `PROFILEID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TYPEID` (`TYPEID`),
  KEY `PROFILEID` (`PROFILEID`)
) ENGINE=InnoDB DEFAULT CHARSET=hp8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article-docs`
--
ALTER TABLE `article-docs`
  ADD CONSTRAINT `article-docs_ibfk_1` FOREIGN KEY (`ARTICLEID`) REFERENCES `articles` (`ID`);

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`TYPEID`) REFERENCES `article-types` (`ID`);

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`ARTICLEID`) REFERENCES `articles` (`ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`TYPEID`) REFERENCES `types` (`ID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`PROFILEID`) REFERENCES `profile` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
