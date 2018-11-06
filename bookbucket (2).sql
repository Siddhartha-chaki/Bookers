-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2018 at 05:05 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookbucket`
--
CREATE DATABASE IF NOT EXISTS `bookbucket` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bookbucket`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `bookid` bigint(20) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(50) NOT NULL,
  `bookauthor` varchar(50) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `bookedition` varchar(30) DEFAULT NULL,
  `bookcode` varchar(30) DEFAULT NULL,
  `bookphoto` varchar(30) NOT NULL,
  `bookdetails` text,
  PRIMARY KEY (`bookid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `book`:
--

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookid`, `bookname`, `bookauthor`, `publisher`, `bookedition`, `bookcode`, `bookphoto`, `bookdetails`) VALUES
(1, 'Reluctant Celebrity: Affect and Privilege in Conte', 'Lorraine York', 'Palgrave Macmillan', '1st edition 2018', '', 'b1a.jpg', 'In this book, Lorraine York examines the figure of the celebrity who expresses discomfort with his o');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE IF NOT EXISTS `chats` (
  `chatid` bigint(20) NOT NULL AUTO_INCREMENT,
  `buyerid` bigint(20) NOT NULL,
  `sellerid` bigint(20) NOT NULL,
  `bookid` bigint(20) NOT NULL,
  `chatfile` varchar(500) NOT NULL,
  PRIMARY KEY (`chatid`),
  KEY `bookid` (`bookid`),
  KEY `sellerid` (`sellerid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `chats`:
--   `buyerid`
--       `user` -> `userid`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `userid` bigint(20) NOT NULL,
  `feedbackid` bigint(20) NOT NULL AUTO_INCREMENT,
  `buyerid` bigint(20) NOT NULL,
  `message` varchar(300) NOT NULL,
  `rating` bigint(15) NOT NULL,
  PRIMARY KEY (`feedbackid`),
  KEY `buyerid` (`buyerid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `feedback`:
--   `userid`
--       `user` -> `userid`
--

-- --------------------------------------------------------

--
-- Table structure for table `tempcode`
--

DROP TABLE IF EXISTS `tempcode`;
CREATE TABLE IF NOT EXISTS `tempcode` (
  `userid` bigint(20) NOT NULL,
  `codeid` bigint(20) NOT NULL,
  `code` varchar(100) NOT NULL,
  PRIMARY KEY (`codeid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `tempcode`:
--   `userid`
--       `user` -> `userid`
--

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `transid` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL,
  `buyerid` bigint(20) DEFAULT NULL,
  `bookid` bigint(20) NOT NULL,
  `buytime` datetime DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`transid`),
  KEY `userid` (`userid`),
  KEY `bookid` (`bookid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `transaction`:
--   `bookid`
--       `book` -> `bookid`
--   `userid`
--       `user` -> `userid`
--

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transid`, `userid`, `buyerid`, `bookid`, `buytime`, `location`) VALUES
(1, 1, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` bigint(10) NOT NULL,
  `collegename` varchar(100) NOT NULL,
  `course` varchar(20) NOT NULL,
  `location` varchar(30) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `user`:
--

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `password`, `username`, `email`, `phone`, `collegename`, `course`, `location`) VALUES
(1, 'daef4953b9783365cad6615223720506cc46c5167cd16ab500fa597aa08ff964eb24fb19687f34d7665f778fcb6c5358fc0a5b81e1662cf90f73a2671c53f991', 'siddhartha', 'siddharthachaki02@gmail.com', 8452960996, 'VESTIT', 'FYMCA', 'Mumbai');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
