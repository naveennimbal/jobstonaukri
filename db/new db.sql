-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Aug 22, 2016 at 08:30 AM
-- Server version: 5.5.42
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE jobstonaukri;

--
-- Database: `jobstonaukri`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobseekers`
--

CREATE TABLE `jobseekers` (
  `jobseekerId` int(11) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT 'No Name',
  `email` varchar(40) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `std_code` varchar(5) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `state_code` int(3) DEFAULT NULL,
  `country_code` int(3) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT 'Male',
  `detailStatus` tinyint(1) DEFAULT '1',
  `dateAdded` datetime DEFAULT NULL,
  `dateUpdated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobseekers`
--

INSERT INTO `jobseekers` (`jobseekerId`, `name`, `email`, `password`, `mobile`, `std_code`, `phone`, `state_code`, `country_code`, `dob`, `gender`, `detailStatus`, `dateAdded`, `dateUpdated`, `status`) VALUES
(2, 'No Name', 'dfgdfg', 'xcvxcv', 'dsfdsf', 'dsf', 'dsf', 12, 1, '2016-08-17', 'Male', 1, NULL, NULL, 1),
(3, 'No Name', 'dfgdfg', 'xcvxcv', 'dsfdsf', 'dsf', 'dsf', 12, 1, '2016-08-17', 'Male', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mast_industry`
--

CREATE TABLE `mast_industry` (
  `Ind_Code` int(6) NOT NULL COMMENT 'Industrty Code, Unique id',
  `Ind_Desc` varchar(100) NOT NULL DEFAULT '' COMMENT 'Full name of the industry',
  `Disp_Order` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mast_jobrole`
--

CREATE TABLE `mast_jobrole` (
  `Jobr_Code` int(6) NOT NULL,
  `Func_Code` int(6) NOT NULL DEFAULT '0',
  `Jobr_Desc` varchar(100) NOT NULL DEFAULT '',
  `Disp_Order` smallint(6) NOT NULL DEFAULT '0',
  `Search_Banner` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=1354 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `pageTitle` varchar(150) DEFAULT 'No Title ',
  `content` text,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobseekers`
--
ALTER TABLE `jobseekers`
  ADD PRIMARY KEY (`jobseekerId`);

--
-- Indexes for table `mast_industry`
--
ALTER TABLE `mast_industry`
  ADD PRIMARY KEY (`Ind_Code`);

--
-- Indexes for table `mast_jobrole`
--
ALTER TABLE `mast_jobrole`
  ADD PRIMARY KEY (`Jobr_Code`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobseekers`
--
ALTER TABLE `jobseekers`
  MODIFY `jobseekerId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mast_industry`
--
ALTER TABLE `mast_industry`
  MODIFY `Ind_Code` int(6) NOT NULL AUTO_INCREMENT COMMENT 'Industrty Code, Unique id',AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `mast_jobrole`
--
ALTER TABLE `mast_jobrole`
  MODIFY `Jobr_Code` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1354;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;