-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Dec 07, 2016 at 05:51 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `clickjobsnew`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `Id` bigint(6) NOT NULL,
  `Sub_User_Id` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(250) NOT NULL DEFAULT '',
  `Super_User_Id` varchar(50) NOT NULL DEFAULT '',
  `SessionExpire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SessionId` varchar(50) NOT NULL DEFAULT '',
  `Client_Ip` varchar(30) NOT NULL DEFAULT '',
  `Last_Access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Name` varchar(60) NOT NULL DEFAULT '',
  `Designation` varchar(60) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `Status` tinyint(1) NOT NULL DEFAULT '2',
  `Privilege` varchar(40) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=7915 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `action_history`
--

CREATE TABLE `action_history` (
  `Pay_Per_Action` tinyint(1) NOT NULL DEFAULT '0',
  `Pay_Per_Value` float NOT NULL DEFAULT '0',
  `Date_Of_Action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Jobseeker_Id` varchar(50) NOT NULL DEFAULT '',
  `Resume_Id` tinyint(1) NOT NULL DEFAULT '0',
  `Employer_Id` varchar(50) NOT NULL DEFAULT '',
  `Subuser_Id` varchar(50) NOT NULL DEFAULT '',
  `Job_Id` bigint(20) NOT NULL DEFAULT '0',
  `Cse_Id` varchar(50) NOT NULL DEFAULT '',
  `Abuse_Comments` text NOT NULL,
  `Refund_Amount` float NOT NULL DEFAULT '0',
  `InvoiceNo` varchar(50) NOT NULL DEFAULT '',
  `IPAddress` varchar(30) DEFAULT '',
  `PlanType` varchar(30) NOT NULL DEFAULT '',
  `HostType` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `Userid` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(150) NOT NULL DEFAULT '',
  `Dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Datemodified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Privilege` varchar(50) NOT NULL DEFAULT '',
  `Active` char(1) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `automatch`
--

CREATE TABLE `automatch` (
  `Job_Id` bigint(8) NOT NULL DEFAULT '0',
  `Jobseeker_Id` varchar(50) NOT NULL DEFAULT '',
  `Resume_Id` tinyint(1) NOT NULL DEFAULT '0',
  `Employer_Id` varchar(50) NOT NULL DEFAULT '',
  `Date_Applied` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Child_Folder_Name` varchar(25) NOT NULL DEFAULT '',
  `Type` char(3) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `automatch_history`
--

CREATE TABLE `automatch_history` (
  `JobId` bigint(20) DEFAULT NULL,
  `Sent_Date` datetime DEFAULT NULL,
  `Sent_Cnt` int(2) DEFAULT NULL,
  `ActUser` varchar(20) DEFAULT NULL,
  `Date_Created` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `autosuggest_list`
--

CREATE TABLE `autosuggest_list` (
  `Id` int(10) NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  `Type` tinyint(1) NOT NULL DEFAULT '4',
  `count` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=1673 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bc_consultantgroups`
--

CREATE TABLE `bc_consultantgroups` (
  `FuncCode` tinyint(4) NOT NULL DEFAULT '0',
  `FuncDesc` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bc_consultants`
--

CREATE TABLE `bc_consultants` (
  `FuncCode` tinyint(4) NOT NULL DEFAULT '0',
  `Name` varchar(60) NOT NULL DEFAULT 'Recruiter',
  `EmailID` varchar(100) NOT NULL DEFAULT '',
  `Password` varchar(250) NOT NULL DEFAULT '',
  `Phone` varchar(25) NOT NULL DEFAULT '',
  `Subscript_Status` char(1) NOT NULL DEFAULT 'Y',
  `LastAcess` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bc_consultants_new`
--

CREATE TABLE `bc_consultants_new` (
  `FuncCode` tinyint(4) NOT NULL DEFAULT '0',
  `UserId` int(11) NOT NULL DEFAULT '0',
  `Subscript_Status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blockedinvitation`
--

CREATE TABLE `blockedinvitation` (
  `invitation_id` bigint(10) NOT NULL DEFAULT '0',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `block_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blockedreminders`
--

CREATE TABLE `blockedreminders` (
  `Email` varchar(60) NOT NULL DEFAULT '',
  `CseName` varchar(50) NOT NULL DEFAULT '',
  `Blocked_Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bouncemails`
--

CREATE TABLE `bouncemails` (
  `Email` varchar(60) NOT NULL DEFAULT '',
  `Errortype` varchar(50) NOT NULL DEFAULT '',
  `bounce_dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BranchId` bigint(7) NOT NULL,
  `BranchName` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `broadcastdetails`
--

CREATE TABLE `broadcastdetails` (
  `BroadcastId` bigint(20) NOT NULL,
  `BroadcastDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `JobseekerName` varchar(50) NOT NULL DEFAULT '',
  `ReplytoEmail` varchar(60) NOT NULL DEFAULT '',
  `Subject` varchar(200) NOT NULL DEFAULT '',
  `JobseekerId` varchar(50) NOT NULL DEFAULT '',
  `InvoiceNo` varchar(50) NOT NULL DEFAULT '',
  `BroadcastList` varchar(250) NOT NULL DEFAULT '',
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `CseName` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=1187 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cjbmmembers`
--

CREATE TABLE `cjbmmembers` (
  `Email` varchar(50) NOT NULL DEFAULT '',
  `Name` varchar(40) NOT NULL DEFAULT '',
  `BirthDay` int(2) NOT NULL DEFAULT '0',
  `BirthMonth` int(2) NOT NULL DEFAULT '0',
  `BirthYear` int(4) NOT NULL DEFAULT '0',
  `ResidingCountry` smallint(6) NOT NULL DEFAULT '0',
  `Qualification` tinyint(4) NOT NULL DEFAULT '0',
  `ResidingState` smallint(6) NOT NULL DEFAULT '0',
  `ResidingArea` varchar(100) NOT NULL DEFAULT '',
  `ResidingDistrict` smallint(6) NOT NULL DEFAULT '0',
  `ResidingCity` varchar(50) NOT NULL DEFAULT '',
  `ContactAddress` varchar(255) NOT NULL DEFAULT '',
  `AreaCode` varchar(10) NOT NULL DEFAULT '',
  `PhoneNo` varchar(20) NOT NULL DEFAULT '',
  `MobileNo` varchar(20) NOT NULL DEFAULT '',
  `DateCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Register` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_bmmembers`
--

CREATE TABLE `cj_bmmembers` (
  `Email` varchar(50) NOT NULL DEFAULT '',
  `Name` varchar(40) NOT NULL DEFAULT '',
  `BirthDay` int(2) NOT NULL DEFAULT '0',
  `BirthMonth` int(2) NOT NULL DEFAULT '0',
  `BirthYear` int(4) NOT NULL DEFAULT '0',
  `ResidingCountry` smallint(6) NOT NULL DEFAULT '0',
  `Qualification` tinyint(4) NOT NULL DEFAULT '0',
  `ResidingState` smallint(6) NOT NULL DEFAULT '0',
  `ResidingArea` varchar(100) NOT NULL DEFAULT '',
  `ResidingDistrict` smallint(6) NOT NULL DEFAULT '0',
  `ResidingCity` varchar(50) NOT NULL DEFAULT '',
  `ContactAddress` varchar(255) NOT NULL DEFAULT '',
  `AreaCode` varchar(10) NOT NULL DEFAULT '',
  `PhoneNo` varchar(20) NOT NULL DEFAULT '',
  `MobileNo` varchar(20) NOT NULL DEFAULT '',
  `DateCreated` datetime DEFAULT '0000-00-00 00:00:00',
  `Register` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_edu_spec`
--

CREATE TABLE `cj_ch_edu_spec` (
  `Spec_Code` bigint(20) NOT NULL DEFAULT '0',
  `Edu_Code` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_jobprompt`
--

CREATE TABLE `cj_ch_jobprompt` (
  `Keyword` text NOT NULL,
  `Pref_Loc` varchar(50) NOT NULL DEFAULT '',
  `Yr_Of_Exp` tinyint(4) NOT NULL DEFAULT '0',
  `Car_Level` tinyint(4) NOT NULL DEFAULT '0',
  `Indus_Code` varchar(15) NOT NULL DEFAULT '',
  `Func_Code` varchar(50) NOT NULL DEFAULT '',
  `Alert_Freq` tinyint(4) NOT NULL DEFAULT '0',
  `Prompt_Title` varchar(50) NOT NULL DEFAULT '',
  `Flag` char(2) NOT NULL DEFAULT '',
  `ReceiveType` varchar(10) NOT NULL DEFAULT '',
  `Status` char(1) DEFAULT 'A',
  `Modified` date NOT NULL DEFAULT '0000-00-00',
  `Resume_Type` varchar(25) NOT NULL DEFAULT '',
  `Search_Type` varchar(10) NOT NULL DEFAULT '',
  `Jp_Id` bigint(20) NOT NULL,
  `Salary` char(3) NOT NULL DEFAULT '',
  `Employer_Name` varchar(70) NOT NULL DEFAULT '',
  `Emp_Type` tinyint(4) NOT NULL DEFAULT '0',
  `Emp_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Jobs_Within` tinyint(4) NOT NULL DEFAULT '0',
  `Sort_Result` tinyint(4) NOT NULL DEFAULT '0',
  `Search_Condn_Word` tinyint(4) NOT NULL DEFAULT '0',
  `Job_Posted_By` tinyint(4) NOT NULL DEFAULT '0',
  `SQuery` text NOT NULL,
  `UserId` varchar(20) NOT NULL DEFAULT '',
  `Jobr_Code` varchar(50) NOT NULL DEFAULT '',
  `location` text NOT NULL,
  `url` text NOT NULL,
  `min_sal` varchar(3) DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=4176330 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_jobprompt_duplicate`
--

CREATE TABLE `cj_ch_jobprompt_duplicate` (
  `Keyword` text NOT NULL,
  `Pref_Loc` varchar(50) NOT NULL DEFAULT '',
  `Yr_Of_Exp` tinyint(4) NOT NULL DEFAULT '0',
  `Car_Level` tinyint(4) NOT NULL DEFAULT '0',
  `Indus_Code` varchar(15) NOT NULL DEFAULT '',
  `Func_Code` varchar(50) NOT NULL DEFAULT '',
  `Alert_Freq` tinyint(4) NOT NULL DEFAULT '0',
  `Prompt_Title` varchar(50) NOT NULL DEFAULT '',
  `Flag` char(2) NOT NULL DEFAULT '',
  `ReceiveType` varchar(10) NOT NULL DEFAULT '',
  `Status` char(1) DEFAULT 'A',
  `Modified` date NOT NULL DEFAULT '0000-00-00',
  `Resume_Type` varchar(25) NOT NULL DEFAULT '',
  `Search_Type` varchar(10) NOT NULL DEFAULT '',
  `Jp_Id` bigint(20) NOT NULL,
  `Salary` char(3) NOT NULL DEFAULT '',
  `Employer_Name` varchar(70) NOT NULL DEFAULT '',
  `Emp_Type` tinyint(4) NOT NULL DEFAULT '0',
  `Emp_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Jobs_Within` tinyint(4) NOT NULL DEFAULT '0',
  `Sort_Result` tinyint(4) NOT NULL DEFAULT '0',
  `Search_Condn_Word` tinyint(4) NOT NULL DEFAULT '0',
  `Job_Posted_By` tinyint(4) NOT NULL DEFAULT '0',
  `SQuery` text NOT NULL,
  `UserId` varchar(20) NOT NULL DEFAULT '',
  `Jobr_Code` varchar(50) NOT NULL DEFAULT '',
  `location` text NOT NULL,
  `url` text NOT NULL,
  `min_sal` varchar(3) DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=4166940 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_jobseekers_res_det`
--

CREATE TABLE `cj_ch_jobseekers_res_det` (
  `Res_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Res_Path` varchar(150) NOT NULL DEFAULT '',
  `New_Res_Path` varchar(150) NOT NULL DEFAULT '',
  `Res_Type` char(1) NOT NULL DEFAULT '',
  `Res_Stat` tinyint(1) NOT NULL DEFAULT '3',
  `Key_Skills` text NOT NULL,
  `Res_Headline` text NOT NULL,
  `Fs_Path` varchar(150) NOT NULL DEFAULT '',
  `Yr_Of_Exp` int(6) NOT NULL DEFAULT '0',
  `Mth_Of_Exp` int(6) NOT NULL DEFAULT '0',
  `Indus_Code` int(6) NOT NULL DEFAULT '0',
  `Func_Code` int(6) NOT NULL DEFAULT '0',
  `Jobr_Code` int(6) NOT NULL DEFAULT '0',
  `Pref_Loc_Code` varchar(100) NOT NULL DEFAULT '',
  `Res_Original_Name` varchar(50) NOT NULL DEFAULT '',
  `Edu_Code1` int(6) NOT NULL DEFAULT '0',
  `Edu_Other1` varchar(50) NOT NULL DEFAULT '',
  `Spec_Code1` int(6) NOT NULL DEFAULT '0',
  `Spec_Other1` varchar(50) NOT NULL DEFAULT '',
  `Instit_Code1` int(6) NOT NULL DEFAULT '0',
  `Instit_Other1` varchar(100) NOT NULL DEFAULT '',
  `Yr_Of_Comp1` int(6) NOT NULL DEFAULT '0',
  `Edu_Code2` int(6) NOT NULL DEFAULT '0',
  `Edu_Other2` varchar(50) NOT NULL DEFAULT '',
  `Spec_Code2` int(6) NOT NULL DEFAULT '0',
  `Spec_Other2` varchar(50) NOT NULL DEFAULT '',
  `Instit_Code2` int(6) NOT NULL DEFAULT '0',
  `Instit_Other2` varchar(100) NOT NULL DEFAULT '',
  `Yr_Of_Comp2` int(6) NOT NULL DEFAULT '0',
  `Edu_Code3` int(6) NOT NULL DEFAULT '0',
  `Edu_Other3` varchar(50) NOT NULL DEFAULT '',
  `Spec_Code3` int(6) NOT NULL DEFAULT '0',
  `Spec_Other3` varchar(50) NOT NULL DEFAULT '',
  `Instit_Code3` int(6) NOT NULL DEFAULT '0',
  `Instit_Other3` varchar(100) NOT NULL DEFAULT '',
  `Yr_Of_Comp3` int(6) NOT NULL DEFAULT '0',
  `Indus_Exp` float(5,2) NOT NULL DEFAULT '0.00',
  `Func_Exp` float(5,2) NOT NULL DEFAULT '0.00',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `FileServer_Name` varchar(20) NOT NULL DEFAULT '',
  `App_Def` tinyint(4) NOT NULL DEFAULT '0',
  `Avail_Request` varchar(5) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cj_ch_jobseekers_res_det`
--

INSERT INTO `cj_ch_jobseekers_res_det` (`Res_Id`, `Res_Path`, `New_Res_Path`, `Res_Type`, `Res_Stat`, `Key_Skills`, `Res_Headline`, `Fs_Path`, `Yr_Of_Exp`, `Mth_Of_Exp`, `Indus_Code`, `Func_Code`, `Jobr_Code`, `Pref_Loc_Code`, `Res_Original_Name`, `Edu_Code1`, `Edu_Other1`, `Spec_Code1`, `Spec_Other1`, `Instit_Code1`, `Instit_Other1`, `Yr_Of_Comp1`, `Edu_Code2`, `Edu_Other2`, `Spec_Code2`, `Spec_Other2`, `Instit_Code2`, `Instit_Other2`, `Yr_Of_Comp2`, `Edu_Code3`, `Edu_Other3`, `Spec_Code3`, `Spec_Other3`, `Instit_Code3`, `Instit_Other3`, `Yr_Of_Comp3`, `Indus_Exp`, `Func_Exp`, `UserId`, `FileServer_Name`, `App_Def`, `Avail_Request`, `DateAdded`) VALUES
(0, '', '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', '', 0, '', 0, '', 0, '', 0, 0, '', 0, '', 0, '', 0, 0, '', 0, '', 0, '', 0, 0.00, 0.00, 'nav280720_2', '', 0, '', '2016-07-28 12:48:20'),
(0, '', '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', '', 0, '', 0, '', 0, '', 0, 0, '', 0, '', 0, '', 0, 0, '', 0, '', 0, '', 0, 0.00, 0.00, 'aks081006_2', '', 0, '', '2016-10-08 14:59:06'),
(0, '', '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', '', 0, '', 0, '', 0, '', 0, 0, '', 0, '', 0, '', 0, 0, '', 0, '', 0, '', 0, 0.00, 0.00, 'aks081023_2', '', 0, '', '2016-10-08 14:59:23'),
(0, '', '', '', 0, '', '', '', 0, 0, 0, 0, 0, '', '', 0, '', 0, '', 0, '', 0, 0, '', 0, '', 0, '', 0, 0, '', 0, '', 0, '', 0, 0.00, 0.00, 'aks081007_2', '', 0, '', '2016-10-08 15:09:07');

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_jobseekers_res_det_duplicate`
--

CREATE TABLE `cj_ch_jobseekers_res_det_duplicate` (
  `Res_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Res_Path` varchar(150) NOT NULL DEFAULT '',
  `New_Res_Path` varchar(150) NOT NULL DEFAULT '',
  `Res_Type` char(1) NOT NULL DEFAULT '',
  `Res_Stat` tinyint(1) NOT NULL DEFAULT '3',
  `Key_Skills` text NOT NULL,
  `Res_Headline` text NOT NULL,
  `Fs_Path` varchar(150) NOT NULL DEFAULT '',
  `Yr_Of_Exp` int(6) NOT NULL DEFAULT '0',
  `Mth_Of_Exp` int(6) NOT NULL DEFAULT '0',
  `Indus_Code` int(6) NOT NULL DEFAULT '0',
  `Func_Code` int(6) NOT NULL DEFAULT '0',
  `Jobr_Code` int(6) NOT NULL DEFAULT '0',
  `Pref_Loc_Code` varchar(100) NOT NULL DEFAULT '',
  `Res_Original_Name` varchar(50) NOT NULL DEFAULT '',
  `Edu_Code1` int(6) NOT NULL DEFAULT '0',
  `Edu_Other1` varchar(50) NOT NULL DEFAULT '',
  `Spec_Code1` int(6) NOT NULL DEFAULT '0',
  `Spec_Other1` varchar(50) NOT NULL DEFAULT '',
  `Instit_Code1` int(6) NOT NULL DEFAULT '0',
  `Instit_Other1` varchar(100) NOT NULL DEFAULT '',
  `Yr_Of_Comp1` int(6) NOT NULL DEFAULT '0',
  `Edu_Code2` int(6) NOT NULL DEFAULT '0',
  `Edu_Other2` varchar(50) NOT NULL DEFAULT '',
  `Spec_Code2` int(6) NOT NULL DEFAULT '0',
  `Spec_Other2` varchar(50) NOT NULL DEFAULT '',
  `Instit_Code2` int(6) NOT NULL DEFAULT '0',
  `Instit_Other2` varchar(100) NOT NULL DEFAULT '',
  `Yr_Of_Comp2` int(6) NOT NULL DEFAULT '0',
  `Edu_Code3` int(6) NOT NULL DEFAULT '0',
  `Edu_Other3` varchar(50) NOT NULL DEFAULT '',
  `Spec_Code3` int(6) NOT NULL DEFAULT '0',
  `Spec_Other3` varchar(50) NOT NULL DEFAULT '',
  `Instit_Code3` int(6) NOT NULL DEFAULT '0',
  `Instit_Other3` varchar(100) NOT NULL DEFAULT '',
  `Yr_Of_Comp3` int(6) NOT NULL DEFAULT '0',
  `Indus_Exp` float(5,2) NOT NULL DEFAULT '0.00',
  `Func_Exp` float(5,2) NOT NULL DEFAULT '0.00',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `FileServer_Name` varchar(20) NOT NULL DEFAULT '',
  `App_Def` tinyint(4) NOT NULL DEFAULT '0',
  `Avail_Request` varchar(5) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_bday_rs_discount`
--

CREATE TABLE `cj_ch_js_bday_rs_discount` (
  `Id` int(11) NOT NULL,
  `UsedBy` varchar(60) NOT NULL DEFAULT '',
  `Amount` float(10,2) NOT NULL DEFAULT '0.00',
  `Discount` float(10,2) NOT NULL DEFAULT '0.00',
  `PayId` bigint(4) NOT NULL DEFAULT '0',
  `OrderId` varchar(30) NOT NULL DEFAULT '',
  `InvoiceNo` varchar(50) NOT NULL DEFAULT '',
  `Status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Active, 1 - Used, 2 - Expired',
  `PromoCode` varchar(8) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateUsed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ExpiryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=6138375 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_coverletter`
--

CREATE TABLE `cj_ch_js_coverletter` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Cl_Id` bigint(20) NOT NULL,
  `Cl_Name` varchar(40) NOT NULL DEFAULT '',
  `Cl_Desc` text NOT NULL,
  `Def_Cl` tinyint(4) NOT NULL DEFAULT '0',
  `App_Def` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=163319 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_coverletter_duplicate`
--

CREATE TABLE `cj_ch_js_coverletter_duplicate` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Cl_Id` bigint(20) NOT NULL,
  `Cl_Name` varchar(40) NOT NULL DEFAULT '',
  `Cl_Desc` text NOT NULL,
  `Def_Cl` tinyint(4) NOT NULL DEFAULT '0',
  `App_Def` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=113685 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_credentials`
--

CREATE TABLE `cj_ch_js_credentials` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Cred_Id` int(11) NOT NULL,
  `Cred_Path` varchar(250) NOT NULL DEFAULT '',
  `Cred_Org_Name` varchar(50) NOT NULL DEFAULT '',
  `Cred_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Cred_Name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=7884 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_credentials_duplicate`
--

CREATE TABLE `cj_ch_js_credentials_duplicate` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Cred_Id` int(11) NOT NULL,
  `Cred_Path` varchar(250) NOT NULL DEFAULT '',
  `Cred_Org_Name` varchar(50) NOT NULL DEFAULT '',
  `Cred_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Cred_Name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=7467 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_del_info`
--

CREATE TABLE `cj_ch_js_del_info` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `DateDeleted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Ip` varchar(30) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_itskills`
--

CREATE TABLE `cj_ch_js_itskills` (
  `Skill_Id` int(11) NOT NULL,
  `UserId` varchar(20) NOT NULL DEFAULT '',
  `Res_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Skill_Name` tinyint(4) NOT NULL DEFAULT '0',
  `Prof_Level` tinyint(4) NOT NULL DEFAULT '0',
  `Last_Used` int(5) NOT NULL DEFAULT '0',
  `Exp_Yr` tinyint(4) NOT NULL DEFAULT '0',
  `Exp_Mth` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=926127 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_itskills_duplicate`
--

CREATE TABLE `cj_ch_js_itskills_duplicate` (
  `Skill_Id` int(11) NOT NULL,
  `UserId` varchar(20) NOT NULL DEFAULT '',
  `Res_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Skill_Name` tinyint(4) NOT NULL DEFAULT '0',
  `Prof_Level` tinyint(4) NOT NULL DEFAULT '0',
  `Last_Used` int(5) NOT NULL DEFAULT '0',
  `Exp_Yr` tinyint(4) NOT NULL DEFAULT '0',
  `Exp_Mth` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=901848 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_lang`
--

CREATE TABLE `cj_ch_js_lang` (
  `Lang_Id` int(11) NOT NULL,
  `UserId` varchar(20) NOT NULL DEFAULT '',
  `Res_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Lang_Name` varchar(25) NOT NULL DEFAULT '',
  `Lang_Eff` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2104302 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_lang_duplicate`
--

CREATE TABLE `cj_ch_js_lang_duplicate` (
  `Lang_Id` int(11) NOT NULL,
  `UserId` varchar(20) NOT NULL DEFAULT '',
  `Res_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Lang_Name` varchar(25) NOT NULL DEFAULT '',
  `Lang_Eff` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2083007 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_newsletter`
--

CREATE TABLE `cj_ch_js_newsletter` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `NewsLetterOptions` varchar(10) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_newsletter_duplicate`
--

CREATE TABLE `cj_ch_js_newsletter_duplicate` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `NewsLetterOptions` varchar(10) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_js_womenday_rs_discount`
--

CREATE TABLE `cj_ch_js_womenday_rs_discount` (
  `Id` int(11) NOT NULL,
  `UsedBy` varchar(60) NOT NULL DEFAULT '',
  `Amount` float(10,2) NOT NULL DEFAULT '0.00',
  `Discount` float(10,2) NOT NULL DEFAULT '0.00',
  `PayId` bigint(4) NOT NULL DEFAULT '0',
  `OrderId` varchar(30) NOT NULL DEFAULT '',
  `InvoiceNo` varchar(50) NOT NULL DEFAULT '',
  `Status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 - Used',
  `PromoCode` varchar(8) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateUsed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ExpiryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_prof_det`
--

CREATE TABLE `cj_ch_prof_det` (
  `TargetJob` varchar(150) NOT NULL DEFAULT '',
  `Cur_Emp` varchar(150) NOT NULL DEFAULT '',
  `WorkLevel` tinyint(4) NOT NULL DEFAULT '0',
  `Cur_Desg` varchar(150) NOT NULL DEFAULT '',
  `Cur_Salary` float(5,2) NOT NULL DEFAULT '0.00',
  `Currency_Type` tinyint(4) NOT NULL DEFAULT '0',
  `Salary_Type` tinyint(4) NOT NULL DEFAULT '0',
  `Expertise` varchar(150) NOT NULL DEFAULT '',
  `Cur_Emp_Type` tinyint(4) NOT NULL DEFAULT '0',
  `Date_Avail` tinyint(4) NOT NULL DEFAULT '0',
  `Residential_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Travel` tinyint(4) NOT NULL DEFAULT '0',
  `Relocate` tinyint(4) NOT NULL DEFAULT '0',
  `UserId` varchar(20) NOT NULL DEFAULT '',
  `Resume_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Homepage_Update` tinyint(4) NOT NULL DEFAULT '0',
  `Cur_Emp_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Prev_Emp` varchar(150) NOT NULL DEFAULT '',
  `FrmMonth` tinyint(2) NOT NULL DEFAULT '0',
  `FrmYear` int(4) NOT NULL DEFAULT '0',
  `ToMonth` tinyint(2) NOT NULL DEFAULT '0',
  `ToYear` int(4) NOT NULL DEFAULT '0',
  `JobProfile` text NOT NULL,
  `tillDate` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_ch_prof_det_duplicate`
--

CREATE TABLE `cj_ch_prof_det_duplicate` (
  `TargetJob` varchar(150) NOT NULL DEFAULT '',
  `Cur_Emp` varchar(150) NOT NULL DEFAULT '',
  `WorkLevel` tinyint(4) NOT NULL DEFAULT '0',
  `Cur_Desg` varchar(150) NOT NULL DEFAULT '',
  `Cur_Salary` float(5,2) NOT NULL DEFAULT '0.00',
  `Currency_Type` tinyint(4) NOT NULL DEFAULT '0',
  `Salary_Type` tinyint(4) NOT NULL DEFAULT '0',
  `Expertise` varchar(150) NOT NULL DEFAULT '',
  `Cur_Emp_Type` tinyint(4) NOT NULL DEFAULT '0',
  `Date_Avail` tinyint(4) NOT NULL DEFAULT '0',
  `Residential_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Travel` tinyint(4) NOT NULL DEFAULT '0',
  `Relocate` tinyint(4) NOT NULL DEFAULT '0',
  `UserId` varchar(20) NOT NULL DEFAULT '',
  `Resume_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Homepage_Update` tinyint(4) NOT NULL DEFAULT '0',
  `Cur_Emp_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Prev_Emp` varchar(150) NOT NULL DEFAULT '',
  `FrmMonth` tinyint(2) NOT NULL DEFAULT '0',
  `FrmYear` int(4) NOT NULL DEFAULT '0',
  `ToMonth` tinyint(2) NOT NULL DEFAULT '0',
  `ToYear` int(4) NOT NULL DEFAULT '0',
  `JobProfile` text NOT NULL,
  `tillDate` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_cst_mailing_list`
--

CREATE TABLE `cj_cst_mailing_list` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '0',
  `jobpost_ids` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_cst_mailing_list_details`
--

CREATE TABLE `cj_cst_mailing_list_details` (
  `id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL,
  `js_id` varchar(50) NOT NULL DEFAULT '',
  `js_name` varchar(60) NOT NULL DEFAULT '',
  `js_email` varchar(60) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=5873 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_cst_sms_list`
--

CREATE TABLE `cj_cst_sms_list` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '0',
  `sms_msg` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_cst_sms_list_details`
--

CREATE TABLE `cj_cst_sms_list_details` (
  `id` int(11) NOT NULL,
  `list_id` int(11) NOT NULL DEFAULT '0',
  `js_id` varchar(50) NOT NULL DEFAULT '',
  `js_name` varchar(60) NOT NULL DEFAULT '',
  `js_email` varchar(60) NOT NULL DEFAULT '',
  `js_mobile` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_emp_dirlistings_contact_cmp`
--

CREATE TABLE `cj_emp_dirlistings_contact_cmp` (
  `Id` int(11) NOT NULL,
  `EmployerId` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(150) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `Location` varchar(10) NOT NULL DEFAULT '',
  `Mobile` varchar(15) NOT NULL DEFAULT '',
  `Landline` varchar(15) NOT NULL DEFAULT '',
  `Message` text NOT NULL,
  `Ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=4972 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_emp_dirlistings_review`
--

CREATE TABLE `cj_emp_dirlistings_review` (
  `Id` int(11) NOT NULL,
  `ConsultantId` int(11) NOT NULL DEFAULT '0',
  `JobseekerId` varchar(50) NOT NULL DEFAULT '',
  `JobseekerName` varchar(60) NOT NULL DEFAULT '',
  `ParentId` int(10) NOT NULL DEFAULT '0',
  `Rating` int(2) NOT NULL DEFAULT '0',
  `ReviewTitle` varchar(50) NOT NULL DEFAULT '',
  `Review` text NOT NULL,
  `Ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Node` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 - Review, 2 - Reply',
  `Flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_emp_jobpost_qual`
--

CREATE TABLE `cj_emp_jobpost_qual` (
  `Qual_Code` int(11) NOT NULL,
  `Qual_Desc` varchar(60) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=415 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_emp_sh_arcsvd_det`
--

CREATE TABLE `cj_emp_sh_arcsvd_det` (
  `Id` bigint(20) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `SubUserId` varchar(50) NOT NULL DEFAULT '',
  `Se_Ar_Type` char(1) NOT NULL DEFAULT '',
  `KeySkills` text NOT NULL,
  `KeySkillsAll` text NOT NULL,
  `KeySkillsAny` text NOT NULL,
  `KeySkillsNot` text NOT NULL,
  `SearchCriteria` text NOT NULL,
  `KeywordsAgainst` tinyint(1) NOT NULL DEFAULT '0',
  `Keyword` tinyint(4) NOT NULL DEFAULT '0',
  `MinYears` char(2) NOT NULL DEFAULT '',
  `MaxYears` char(2) NOT NULL DEFAULT '',
  `ResLocation` varchar(100) NOT NULL DEFAULT '',
  `PrefLocation` char(3) NOT NULL DEFAULT '',
  `Functional` varchar(50) NOT NULL DEFAULT '',
  `Industry` varchar(50) NOT NULL DEFAULT '',
  `Update_Resume` tinyint(1) NOT NULL DEFAULT '1',
  `JobRole` varchar(50) NOT NULL DEFAULT '',
  `WorkLevel` tinyint(1) NOT NULL DEFAULT '0',
  `Qualification1` text NOT NULL,
  `Specialization` text NOT NULL,
  `Certification` varchar(100) NOT NULL DEFAULT '',
  `InstituteCheck` varchar(50) NOT NULL DEFAULT '',
  `Institution` varchar(50) NOT NULL DEFAULT '',
  `InstituteTxt` text NOT NULL,
  `CurrentEmployer` varchar(100) NOT NULL DEFAULT '',
  `Designation` varchar(100) NOT NULL DEFAULT '',
  `ExcludeEmployer` varchar(100) NOT NULL DEFAULT '',
  `SearchinInc` tinyint(1) NOT NULL DEFAULT '0',
  `SearchinExc` tinyint(1) NOT NULL DEFAULT '0',
  `SalaryFrom` tinyint(4) NOT NULL DEFAULT '0',
  `SalaryTo` tinyint(4) NOT NULL DEFAULT '0',
  `CurrencyType` varchar(5) NOT NULL DEFAULT '',
  `PayBasis` tinyint(4) NOT NULL DEFAULT '0',
  `NoSalary` tinyint(4) NOT NULL DEFAULT '0',
  `Salary` int(11) NOT NULL DEFAULT '0',
  `Languages` varchar(100) NOT NULL DEFAULT '',
  `Gender` tinyint(1) NOT NULL DEFAULT '0',
  `EmpType` tinyint(1) NOT NULL DEFAULT '0',
  `EmpStatus` tinyint(1) NOT NULL DEFAULT '0',
  `SortBy` tinyint(1) NOT NULL DEFAULT '0',
  `Photo` tinyint(1) NOT NULL DEFAULT '0',
  `Title` varchar(100) NOT NULL DEFAULT '',
  `SearchType` varchar(10) NOT NULL DEFAULT '',
  `Exclude` varchar(10) NOT NULL DEFAULT '',
  `CreatedDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SearchQuery` text NOT NULL,
  `Qualification2` text NOT NULL,
  `Specialization2` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1119226 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_im_email_alert`
--

CREATE TABLE `cj_im_email_alert` (
  `id` bigint(20) NOT NULL,
  `keywords` varchar(100) NOT NULL DEFAULT '',
  `location` int(11) NOT NULL DEFAULT '0',
  `experience` int(11) NOT NULL DEFAULT '0',
  `func_code` int(11) NOT NULL DEFAULT '0',
  `indus_code` int(11) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `alert_freq` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `datemodified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ipaddr` varchar(20) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_im_employer`
--

CREATE TABLE `cj_im_employer` (
  `Id` int(11) NOT NULL,
  `EmpId` varchar(50) NOT NULL DEFAULT '',
  `IMGLUserId` bigint(20) NOT NULL DEFAULT '0',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_im_jobpost`
--

CREATE TABLE `cj_im_jobpost` (
  `Id` int(11) NOT NULL,
  `JobPostId` bigint(20) NOT NULL DEFAULT '0',
  `IMJobPostId` bigint(20) NOT NULL DEFAULT '0',
  `ClientIp` varchar(30) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_im_jobseeker`
--

CREATE TABLE `cj_im_jobseeker` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_jobs_on_phone`
--

CREATE TABLE `cj_jobs_on_phone` (
  `id` int(11) NOT NULL,
  `jop_job_id` varchar(12) NOT NULL DEFAULT '',
  `cj_job_id` bigint(20) NOT NULL DEFAULT '0',
  `jop_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `email` varchar(80) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `age` int(11) NOT NULL DEFAULT '0',
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `current_loc` varchar(80) NOT NULL DEFAULT '',
  `second_loc` varchar(80) NOT NULL DEFAULT '',
  `pref_loc` varchar(80) NOT NULL DEFAULT '',
  `edu_qual` varchar(15) NOT NULL DEFAULT '',
  `graduation` varchar(30) NOT NULL DEFAULT '',
  `post_grad` varchar(30) NOT NULL DEFAULT '',
  `other_courses` varchar(100) NOT NULL DEFAULT '',
  `ctc` varchar(20) NOT NULL DEFAULT '',
  `expected_ctc` varchar(20) NOT NULL DEFAULT '',
  `current_industry` varchar(100) NOT NULL DEFAULT '',
  `func_area` varchar(100) NOT NULL DEFAULT '',
  `role` varchar(80) NOT NULL DEFAULT '',
  `experience` varchar(6) NOT NULL DEFAULT '0',
  `curr_employer` varchar(80) NOT NULL DEFAULT '',
  `curr_designation` varchar(60) NOT NULL DEFAULT '',
  `prev_employer` varchar(80) NOT NULL DEFAULT '',
  `fldskills` varchar(100) NOT NULL DEFAULT '',
  `process_date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM AUTO_INCREMENT=872 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_job_list`
--

CREATE TABLE `cj_job_list` (
  `JobId` bigint(20) NOT NULL DEFAULT '0',
  `Title` varchar(100) NOT NULL DEFAULT '',
  `Company` varchar(150) NOT NULL DEFAULT '',
  `City` int(11) NOT NULL DEFAULT '0',
  `EdQual` varchar(50) NOT NULL DEFAULT '',
  `JobRole` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_js_ivr_track`
--

CREATE TABLE `cj_js_ivr_track` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `phone` varchar(25) NOT NULL DEFAULT '',
  `mobile` varchar(25) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `datemodified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ipaddr` varchar(20) NOT NULL DEFAULT '',
  `call_count` tinyint(4) NOT NULL DEFAULT '0',
  `Active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-OLD CONTACT NUMBER 1-CURRENT CONTACT NUMBER'
) ENGINE=MyISAM AUTO_INCREMENT=613160 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_city`
--

CREATE TABLE `cj_mast_city` (
  `City_Code` int(6) NOT NULL,
  `St_Code` char(3) NOT NULL DEFAULT '',
  `Cnt_Code` char(3) NOT NULL DEFAULT '',
  `City_Desc` varchar(100) NOT NULL DEFAULT '',
  `Reg_code` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=558 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_companies`
--

CREATE TABLE `cj_mast_companies` (
  `company_name` varchar(250) NOT NULL DEFAULT '',
  `company_index` char(1) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_country`
--

CREATE TABLE `cj_mast_country` (
  `Cnt_Code` char(3) NOT NULL DEFAULT '',
  `Cnt_Desc` varchar(100) NOT NULL DEFAULT '',
  `Disp_Order` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_currency_type`
--

CREATE TABLE `cj_mast_currency_type` (
  `Currency_Code` int(6) NOT NULL,
  `Currency_Type` char(4) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_education`
--

CREATE TABLE `cj_mast_education` (
  `Edu_Code` int(6) NOT NULL,
  `Edu_Desc` varchar(100) NOT NULL DEFAULT '',
  `Disp_Order` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_functional`
--

CREATE TABLE `cj_mast_functional` (
  `Func_Code` int(6) NOT NULL,
  `Func_Desc` varchar(100) NOT NULL DEFAULT '',
  `Disp_Order` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_industry`
--

CREATE TABLE `cj_mast_industry` (
  `Ind_Code` int(6) NOT NULL COMMENT 'Industrty Code, Unique id',
  `Ind_Desc` varchar(100) NOT NULL DEFAULT '' COMMENT 'Full name of the industry',
  `Disp_Order` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_institute`
--

CREATE TABLE `cj_mast_institute` (
  `Instit_Code` int(6) NOT NULL,
  `Instit_Desc` varchar(150) NOT NULL DEFAULT '',
  `Disp_Order` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=344 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_jobrole`
--

CREATE TABLE `cj_mast_jobrole` (
  `Jobr_Code` int(6) NOT NULL,
  `Func_Code` int(6) NOT NULL DEFAULT '0',
  `Jobr_Desc` varchar(100) NOT NULL DEFAULT '',
  `Disp_Order` smallint(6) NOT NULL DEFAULT '0',
  `Search_Banner` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=1354 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_pref_loc`
--

CREATE TABLE `cj_mast_pref_loc` (
  `Pref_Loc_Code` int(6) NOT NULL,
  `Pref_Loc_Desc` varchar(100) NOT NULL DEFAULT '',
  `Pref_Loc_Value` varchar(255) DEFAULT NULL,
  `Cnt_Code` char(3) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=520 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_specialization`
--

CREATE TABLE `cj_mast_specialization` (
  `Spec_Code` bigint(20) NOT NULL,
  `Spec_Desc` varchar(200) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=223 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_mast_state`
--

CREATE TABLE `cj_mast_state` (
  `Cnt_Code` char(3) NOT NULL DEFAULT '',
  `St_Code` char(3) NOT NULL DEFAULT '',
  `St_Desc` char(100) NOT NULL DEFAULT '',
  `Disp_Order` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_microsite_cadd`
--

CREATE TABLE `cj_microsite_cadd` (
  `cadd_id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `contact_number` varchar(25) NOT NULL DEFAULT '',
  `location` varchar(25) NOT NULL DEFAULT '',
  `location_email` varchar(80) NOT NULL DEFAULT '',
  `ip_addr` varchar(25) NOT NULL DEFAULT '0.0.0.0',
  `enroll_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=294 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_rs_sms_track`
--

CREATE TABLE `cj_rs_sms_track` (
  `id` int(11) NOT NULL,
  `mobile` varchar(200) NOT NULL DEFAULT '',
  `message` varchar(140) NOT NULL DEFAULT '',
  `sentby` varchar(50) NOT NULL DEFAULT '',
  `sentdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sentip` varchar(16) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM AUTO_INCREMENT=757 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_sms_alert_js`
--

CREATE TABLE `cj_sms_alert_js` (
  `jobseekerid` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(16) NOT NULL DEFAULT '',
  `jobpostid` varchar(20) NOT NULL DEFAULT '',
  `SmsAlertFlag` char(1) NOT NULL DEFAULT '',
  `Dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Datemodified` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_sms_apply_js`
--

CREATE TABLE `cj_sms_apply_js` (
  `Id` int(10) NOT NULL,
  `JobPostId` varchar(20) DEFAULT '',
  `JobSeekerId` varchar(20) DEFAULT '',
  `Mobile` varchar(16) NOT NULL DEFAULT '',
  `Status` char(1) DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=48597 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_sms_detail_js`
--

CREATE TABLE `cj_sms_detail_js` (
  `JobPostId` varchar(20) NOT NULL DEFAULT '',
  `KeyDetails` varchar(100) DEFAULT '',
  `Details` varchar(160) DEFAULT '',
  `DateAdded` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_sms_detail_log`
--

CREATE TABLE `cj_sms_detail_log` (
  `id` int(10) NOT NULL,
  `jobpostid` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(16) NOT NULL DEFAULT '',
  `dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_sms_forward_cv_js`
--

CREATE TABLE `cj_sms_forward_cv_js` (
  `Id` int(11) NOT NULL,
  `JobseekerId` varchar(50) NOT NULL DEFAULT '',
  `Mobile` varchar(16) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `Subject` varchar(100) NOT NULL DEFAULT '',
  `Message` varchar(255) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` char(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=746 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_sms_transfail_js`
--

CREATE TABLE `cj_sms_transfail_js` (
  `id` int(4) NOT NULL,
  `jobpostid` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(16) NOT NULL DEFAULT '',
  `status` char(1) NOT NULL DEFAULT '',
  `dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cj_widget_track`
--

CREATE TABLE `cj_widget_track` (
  `id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `userid` varchar(50) NOT NULL DEFAULT '',
  `createdon` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `registered` tinyint(1) NOT NULL DEFAULT '0',
  `invitetype` tinyint(1) NOT NULL DEFAULT '0',
  `registeredid` varchar(50) NOT NULL DEFAULT 'NULL'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clickjobs_branches`
--

CREATE TABLE `clickjobs_branches` (
  `Off_Type` varchar(100) NOT NULL DEFAULT '',
  `City` varchar(50) DEFAULT '',
  `Address` tinytext,
  `Phone` varchar(50) DEFAULT '',
  `Fax` varchar(50) DEFAULT '',
  `id` tinyint(4) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cmp_code`
--

CREATE TABLE `cmp_code` (
  `CmpName` varchar(150) NOT NULL,
  `CmpCode` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `consultants`
--

CREATE TABLE `consultants` (
  `Id` int(6) NOT NULL,
  `Xml` mediumblob NOT NULL,
  `Dateadded` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1470 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `msg_id` int(11) NOT NULL,
  `msg_from` varchar(50) NOT NULL DEFAULT '',
  `msg_from_name` varchar(60) NOT NULL,
  `msg_to` varchar(50) NOT NULL DEFAULT '',
  `msg_to_name` varchar(60) NOT NULL,
  `subject` varchar(250) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `msg_date` datetime DEFAULT NULL,
  `is_read_msg` tinyint(1) NOT NULL DEFAULT '0',
  `msg_from_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `msg_to_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `msg_sent_id` int(11) NOT NULL,
  `msg_sent_name` text NOT NULL,
  `ip` varchar(20) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4134 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CountInfo`
--

CREATE TABLE `CountInfo` (
  `ReportDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ActivatedResume` int(11) NOT NULL DEFAULT '0',
  `UserPending` int(11) NOT NULL DEFAULT '0',
  `DelRes` int(11) NOT NULL DEFAULT '0',
  `PendingRes` int(11) NOT NULL DEFAULT '0',
  `TotalResume` int(11) NOT NULL DEFAULT '0',
  `Registration` int(11) NOT NULL DEFAULT '0',
  `Activation` int(11) NOT NULL DEFAULT '0',
  `TotalMembers` int(11) NOT NULL DEFAULT '0',
  `UploadResume` int(11) NOT NULL DEFAULT '0',
  `CPResume` int(11) NOT NULL DEFAULT '0',
  `JobPromptUsers` int(11) NOT NULL DEFAULT '0',
  `CorpEmp` int(11) NOT NULL DEFAULT '0',
  `ConsEmp` int(11) NOT NULL DEFAULT '0',
  `JsLogin` int(11) NOT NULL DEFAULT '0',
  `EmpLogin` int(11) NOT NULL DEFAULT '0',
  `JobAppUnique` int(11) NOT NULL DEFAULT '0',
  `JobAppTotal` int(11) NOT NULL DEFAULT '0',
  `NonMemApp` int(11) NOT NULL DEFAULT '0',
  `PlanPurchase` int(11) NOT NULL DEFAULT '0',
  `JobPost` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cse`
--

CREATE TABLE `cse` (
  `id` int(3) NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(150) NOT NULL DEFAULT '',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cseprivilege`
--

CREATE TABLE `cseprivilege` (
  `id` int(4) NOT NULL,
  `cseid` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `cseemailid` varchar(70) DEFAULT NULL,
  `Privilege` text NOT NULL,
  `groups` varchar(100) DEFAULT NULL,
  `dateadded` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=263 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cst`
--

CREATE TABLE `cst` (
  `Id` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(150) NOT NULL DEFAULT '',
  `Email` varchar(70) NOT NULL DEFAULT '',
  `LastLogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `group_name` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_payment`
--

CREATE TABLE `custom_payment` (
  `Pay_Id` int(11) NOT NULL,
  `OrderId` varchar(30) NOT NULL DEFAULT '',
  `City_OrderId` varchar(20) NOT NULL DEFAULT '',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Cmp_Name` varchar(60) NOT NULL DEFAULT '',
  `Email` varchar(50) NOT NULL DEFAULT '',
  `Mobile` varchar(50) NOT NULL DEFAULT '',
  `Address` text NOT NULL,
  `City` varchar(100) NOT NULL DEFAULT '',
  `Payment_Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Payment_Status` char(1) NOT NULL DEFAULT '',
  `PaymentMode` char(2) NOT NULL DEFAULT '',
  `BankName` varchar(15) NOT NULL DEFAULT '',
  `Amount` float(10,2) NOT NULL DEFAULT '0.00',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `UserType` varchar(12) NOT NULL DEFAULT '',
  `Res_Pack_Id` int(4) NOT NULL DEFAULT '0',
  `HighlightExpiryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=1783 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `easycart_transaction`
--

CREATE TABLE `easycart_transaction` (
  `Id` int(11) NOT NULL,
  `Pay_Id` bigint(4) NOT NULL DEFAULT '0',
  `OrderId` varchar(30) NOT NULL DEFAULT '',
  `cse_id` varchar(50) NOT NULL DEFAULT '',
  `total_amount` float(10,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) NOT NULL DEFAULT '',
  `discount_value` float(10,2) NOT NULL DEFAULT '0.00',
  `discount_amount` float(10,2) NOT NULL DEFAULT '0.00',
  `amount` float(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM AUTO_INCREMENT=223 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(250) NOT NULL DEFAULT '',
  `Xml` mediumblob NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Validated` tinyint(1) NOT NULL DEFAULT '2',
  `Active` tinyint(1) NOT NULL DEFAULT '2',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `SessionExpire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Client_Ip` varchar(30) NOT NULL DEFAULT '',
  `Last_Access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Sms_Count` bigint(10) NOT NULL DEFAULT '0',
  `UserName` varchar(150) NOT NULL DEFAULT '',
  `Res1_Std` varchar(6) NOT NULL DEFAULT '',
  `Res1_Phone` varchar(10) NOT NULL DEFAULT '',
  `Res1_Ext` varchar(4) NOT NULL DEFAULT '',
  `Res2_Std` varchar(6) NOT NULL DEFAULT '',
  `Res2_Phone` varchar(10) NOT NULL DEFAULT '',
  `Res2_Ext` varchar(4) NOT NULL DEFAULT '',
  `Res3_Std` varchar(6) NOT NULL DEFAULT '',
  `Res3_Phone` varchar(10) NOT NULL DEFAULT '',
  `Res3_Ext` varchar(4) NOT NULL DEFAULT '',
  `Fax_Std` varchar(6) NOT NULL DEFAULT '',
  `Fax_Phone` varchar(10) NOT NULL DEFAULT '',
  `Mobile` varchar(20) NOT NULL DEFAULT '',
  `Cmp_Profile` text NOT NULL,
  `Cmp_Profile_Default` text NOT NULL,
  `Jp_Cnt` int(11) NOT NULL DEFAULT '0',
  `Designation` varchar(50) NOT NULL DEFAULT '',
  `Alternate_Email` varchar(60) NOT NULL DEFAULT '',
  `SubUser_Cnt` int(11) NOT NULL DEFAULT '0',
  `Cmp_Name` varchar(60) NOT NULL DEFAULT '',
  `Cmp_Addr` tinytext NOT NULL,
  `Cnt_Code` char(3) NOT NULL DEFAULT '',
  `St_Code` char(3) NOT NULL DEFAULT '',
  `Ct_Code` int(11) NOT NULL DEFAULT '0',
  `Ct_Other` varchar(30) NOT NULL DEFAULT '',
  `Cmp_Type` tinyint(1) NOT NULL DEFAULT '0',
  `Ind_Code` int(11) NOT NULL DEFAULT '0',
  `Cmp_Category` tinyint(4) NOT NULL DEFAULT '0',
  `Sales_TrnOvr` tinyint(4) NOT NULL DEFAULT '0',
  `Tot_Emp` tinyint(4) NOT NULL DEFAULT '0',
  `Tot_Branches` tinyint(4) NOT NULL DEFAULT '0',
  `TimeZone` tinyint(4) NOT NULL DEFAULT '0',
  `Website_Url` varchar(50) NOT NULL DEFAULT '',
  `Logo_Org_Path` varchar(100) NOT NULL DEFAULT '',
  `Logo_Act_Path` varchar(100) NOT NULL DEFAULT '',
  `cse_email` varchar(80) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=100701 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employer_count`
--

CREATE TABLE `employer_count` (
  `Super_User` varchar(50) NOT NULL DEFAULT '',
  `Sub_User` varchar(50) NOT NULL DEFAULT '',
  `Sms_Count` bigint(20) NOT NULL DEFAULT '0',
  `Email_Count` bigint(60) NOT NULL DEFAULT '0',
  `DateAdded` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employer_products`
--

CREATE TABLE `employer_products` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(150) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `UserName` varchar(150) NOT NULL DEFAULT '',
  `Cnt_Code` char(3) NOT NULL DEFAULT '',
  `St_Code` char(3) NOT NULL DEFAULT '',
  `Ct_Code` int(11) NOT NULL DEFAULT '0',
  `HQ_Cnt` char(3) NOT NULL DEFAULT '',
  `HQ_St` char(3) NOT NULL DEFAULT '',
  `HQ_Ct` int(11) NOT NULL DEFAULT '0',
  `PinCode` int(10) NOT NULL DEFAULT '0',
  `Operating_Location` text NOT NULL,
  `Res1_Std` varchar(6) NOT NULL DEFAULT '',
  `Res1_Phone` varchar(10) NOT NULL DEFAULT '',
  `Res1_Ext` varchar(4) NOT NULL DEFAULT '',
  `Mobile` varchar(20) NOT NULL DEFAULT '',
  `Cmp_Name` varchar(60) NOT NULL DEFAULT '',
  `Cmp_Type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 - Placement Consultant, 2 - Corporate',
  `Ind_Code` int(11) NOT NULL DEFAULT '0',
  `FuncCode` tinyint(4) NOT NULL DEFAULT '0',
  `Cmp_Addr` text NOT NULL,
  `Cmp_Profile` text NOT NULL,
  `Cmp_Profile_Default` text NOT NULL,
  `Consultant_Profile` text NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Validated` tinyint(1) NOT NULL DEFAULT '0',
  `Active` tinyint(1) NOT NULL DEFAULT '0',
  `Client_Ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `Last_Access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Specialized_Category` varchar(50) NOT NULL DEFAULT '',
  `Career_Level` varchar(30) NOT NULL DEFAULT '',
  `Website_Url` varchar(50) NOT NULL DEFAULT '',
  `Logo_Org_Path` varchar(100) NOT NULL DEFAULT '',
  `Logo_Act_Path` varchar(100) NOT NULL DEFAULT '',
  `Dir_isSearchable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=77039 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emppreference`
--

CREATE TABLE `emppreference` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `SubUserId` varchar(50) NOT NULL DEFAULT '',
  `PDFDownload` bigint(20) NOT NULL DEFAULT '0',
  `DOCDownload` bigint(20) NOT NULL DEFAULT '0',
  `TEXTDownload` bigint(20) NOT NULL DEFAULT '0',
  `DisplayPrefSearch` int(4) NOT NULL DEFAULT '0',
  `DisplayPrefCM` int(4) NOT NULL DEFAULT '0',
  `WNPref` varchar(80) NOT NULL DEFAULT '',
  `NotifyByMail` varchar(40) NOT NULL DEFAULT '',
  `NewsLetterSub` varchar(20) NOT NULL DEFAULT '',
  `OrgDownload` bigint(20) NOT NULL DEFAULT '0',
  `RSTextDownload` bigint(20) NOT NULL DEFAULT '0',
  `Res_View_Count` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `empsms`
--

CREATE TABLE `empsms` (
  `Id` bigint(11) NOT NULL,
  `EmpId` varchar(50) NOT NULL DEFAULT '',
  `SubUserId` varchar(50) NOT NULL DEFAULT '',
  `JSId` varchar(50) NOT NULL DEFAULT '',
  `Mobile` varchar(50) NOT NULL DEFAULT '',
  `EmpMobile` varchar(50) NOT NULL DEFAULT '',
  `Message` varchar(160) NOT NULL DEFAULT '',
  `Status` char(1) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Sender` varchar(20) NOT NULL DEFAULT '55050'
) ENGINE=MyISAM AUTO_INCREMENT=7179 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `empviewlist`
--

CREATE TABLE `empviewlist` (
  `Id` bigint(10) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `DocRef` varchar(50) NOT NULL DEFAULT '',
  `EmployerId` varchar(50) NOT NULL DEFAULT '',
  `DateViewed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` varchar(25) NOT NULL DEFAULT '',
  `Comments` mediumblob NOT NULL,
  `Type` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=6727403 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_feat`
--

CREATE TABLE `emp_feat` (
  `Feat_Id` int(4) NOT NULL,
  `Feat_Desc` varchar(255) NOT NULL DEFAULT '',
  `AddedDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Disp_Order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_logo`
--

CREATE TABLE `emp_logo` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Logo_Org_Path` varchar(100) NOT NULL DEFAULT '',
  `Logo_Act_Path` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_pack`
--

CREATE TABLE `emp_pack` (
  `Pack_Id` int(4) NOT NULL,
  `Pack_Name` varchar(100) NOT NULL DEFAULT '',
  `Pack_Desc` varchar(255) DEFAULT NULL,
  `AddedDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Active_Flag` char(1) NOT NULL DEFAULT 'Y',
  `Disp_Order` int(11) NOT NULL DEFAULT '0',
  `PlanType` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_pack_feat`
--

CREATE TABLE `emp_pack_feat` (
  `Res_Pack_Id` int(4) NOT NULL,
  `Pack_Id` int(4) NOT NULL DEFAULT '0',
  `Feat_Id` int(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_pack_price`
--

CREATE TABLE `emp_pack_price` (
  `Res_Price_Id` int(11) NOT NULL,
  `Pack_Id` int(4) NOT NULL DEFAULT '0',
  `Duration` varchar(15) NOT NULL DEFAULT '',
  `Inr_Price` float(10,2) NOT NULL DEFAULT '0.00',
  `Usd_Price` float(10,2) NOT NULL DEFAULT '0.00',
  `Tax` float(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_report_invalidno`
--

CREATE TABLE `emp_report_invalidno` (
  `id` int(10) NOT NULL,
  `date_reported` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contact_type` tinyint(2) NOT NULL DEFAULT '0',
  `mobile_no` varchar(25) NOT NULL DEFAULT '',
  `landline_no` varchar(25) NOT NULL DEFAULT '',
  `emp_reason` tinyint(3) NOT NULL DEFAULT '0',
  `location` tinyint(4) NOT NULL DEFAULT '0',
  `company_name` varchar(50) NOT NULL DEFAULT '',
  `action` tinyint(3) NOT NULL DEFAULT '0',
  `cs_reason` text NOT NULL,
  `csename` varchar(20) NOT NULL DEFAULT '',
  `jobseeker_id` varchar(25) NOT NULL DEFAULT '',
  `resume_id` tinyint(2) NOT NULL DEFAULT '0',
  `employer_id` varchar(25) NOT NULL DEFAULT '',
  `pay_per_contact_value` float NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `plan_type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_search_session`
--

CREATE TABLE `emp_search_session` (
  `id` int(11) NOT NULL,
  `userid` varchar(50) NOT NULL DEFAULT '',
  `user_type` varchar(15) NOT NULL DEFAULT '',
  `session_id` varchar(35) NOT NULL DEFAULT '',
  `dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_log` tinyint(4) NOT NULL DEFAULT '0',
  `ip_address` varchar(20) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM AUTO_INCREMENT=38720 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_sentmail`
--

CREATE TABLE `emp_sentmail` (
  `Id` bigint(11) NOT NULL,
  `EmpId` varchar(50) NOT NULL DEFAULT '',
  `SubUserId` varchar(50) NOT NULL DEFAULT '',
  `JSId` varchar(50) NOT NULL DEFAULT '',
  `DateSent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FromEmail` varchar(50) NOT NULL DEFAULT '',
  `ToEmail` text NOT NULL,
  `Message` text NOT NULL,
  `EmailType` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-CS,1-CM,2-CSPF,3-CSPM,4-CMF,5-CMPF,6-CMPM',
  `IP` varchar(16) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM AUTO_INCREMENT=27423997 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_stat`
--

CREATE TABLE `emp_stat` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Sub_User_Id` varchar(50) NOT NULL DEFAULT '',
  `PDFDownload` bigint(20) NOT NULL DEFAULT '0',
  `DOCDownload` bigint(20) NOT NULL DEFAULT '0',
  `TEXTDownload` bigint(20) NOT NULL DEFAULT '0',
  `OrgDownload` bigint(20) NOT NULL DEFAULT '0',
  `Res_View_Count` int(10) NOT NULL DEFAULT '0',
  `Search_Count` int(10) NOT NULL DEFAULT '0',
  `ProcessDate` date NOT NULL DEFAULT '0000-00-00',
  `RSTextDownload` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_templates`
--

CREATE TABLE `emp_templates` (
  `TempId` int(11) NOT NULL,
  `EmpUserId` varchar(50) NOT NULL DEFAULT '',
  `SubUserId` varchar(50) DEFAULT '',
  `TempName` varchar(50) DEFAULT '',
  `Subject` varchar(150) DEFAULT '',
  `Message` text,
  `Access` int(1) DEFAULT '0',
  `Email` varchar(60) DEFAULT '',
  `DateAdded` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=299568 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `Id` int(6) NOT NULL,
  `Title` varchar(150) NOT NULL DEFAULT '',
  `Content` mediumblob NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Place` varchar(255) NOT NULL DEFAULT '',
  `Type` varchar(10) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=latin1 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Table structure for table `featured_listings`
--

CREATE TABLE `featured_listings` (
  `UserId` varchar(60) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `format_error`
--

CREATE TABLE `format_error` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Email` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `friends_network`
--

CREATE TABLE `friends_network` (
  `network_id` bigint(10) NOT NULL,
  `referer_id` varchar(50) NOT NULL DEFAULT '',
  `friend_id` varchar(50) NOT NULL DEFAULT '',
  `join_date` datetime DEFAULT '0000-00-00 00:00:00',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `invitation_id` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=79513 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indexq`
--

CREATE TABLE `indexq` (
  `id` int(4) NOT NULL,
  `Userid` varchar(50) NOT NULL DEFAULT '',
  `Docref` varchar(50) NOT NULL DEFAULT '',
  `Dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Datemodified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Attempts` bigint(7) NOT NULL DEFAULT '0',
  `Type` varchar(50) NOT NULL DEFAULT '',
  `resume_text` longtext
) ENGINE=MyISAM AUTO_INCREMENT=2058478 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indexq_consultants`
--

CREATE TABLE `indexq_consultants` (
  `Id` int(4) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM AUTO_INCREMENT=2578 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indexq_dirlistings`
--

CREATE TABLE `indexq_dirlistings` (
  `Id` int(4) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM AUTO_INCREMENT=591267 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indexq_emailalert`
--

CREATE TABLE `indexq_emailalert` (
  `id` int(4) NOT NULL,
  `Userid` varchar(50) NOT NULL DEFAULT '',
  `Docref` varchar(50) NOT NULL DEFAULT '',
  `Dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Datemodified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Attempts` bigint(7) NOT NULL DEFAULT '0',
  `Type` varchar(5) NOT NULL DEFAULT 'EMP',
  `resume_text` longtext
) ENGINE=MyISAM AUTO_INCREMENT=1909696 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indexq_js`
--

CREATE TABLE `indexq_js` (
  `id` int(4) NOT NULL,
  `Userid` varchar(50) NOT NULL DEFAULT '',
  `Docref` varchar(50) NOT NULL DEFAULT '',
  `Dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Datemodified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Attempts` bigint(7) NOT NULL DEFAULT '0',
  `Type` varchar(50) NOT NULL DEFAULT '',
  `resume_text` longtext
) ENGINE=MyISAM AUTO_INCREMENT=954980 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interviewschedular`
--

CREATE TABLE `interviewschedular` (
  `Id` int(6) NOT NULL,
  `EmployerId` varchar(50) NOT NULL DEFAULT '',
  `JobseekerId` varchar(50) NOT NULL DEFAULT '',
  `ApplicationId` bigint(10) NOT NULL DEFAULT '0',
  `Dateadded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` varchar(20) DEFAULT NULL,
  `Xml` mediumblob NOT NULL,
  `Venue` varchar(200) NOT NULL DEFAULT '',
  `Idate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Contactperson` varchar(25) NOT NULL DEFAULT '',
  `Designation` varchar(200) NOT NULL DEFAULT '',
  `Message` varchar(200) NOT NULL DEFAULT '',
  `panelid` varchar(60) NOT NULL DEFAULT '',
  `jobposition` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=906 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invalidids`
--

CREATE TABLE `invalidids` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Email` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invitation`
--

CREATE TABLE `invitation` (
  `invitation_id` bigint(10) NOT NULL,
  `referer_id` varchar(50) NOT NULL DEFAULT '',
  `friend_id` varchar(50) NOT NULL,
  `friend_name` varchar(60) NOT NULL,
  `friend_email` varchar(60) NOT NULL DEFAULT '',
  `invite_relation` tinyint(1) NOT NULL DEFAULT '0',
  `relation_details` varchar(250) DEFAULT NULL,
  `referer_subject` varchar(250) NOT NULL DEFAULT '',
  `referer_text` text,
  `invite_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `invite_status` tinyint(1) NOT NULL DEFAULT '0',
  `referer_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `friend_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `invite_mode` tinyint(1) NOT NULL DEFAULT '0',
  `action_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_read_msg` tinyint(1) NOT NULL DEFAULT '0',
  `declined_count` tinyint(1) NOT NULL DEFAULT '0',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=5706814 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invitation_final`
--

CREATE TABLE `invitation_final` (
  `invitation_id` bigint(10) NOT NULL,
  `referer_id` varchar(50) NOT NULL DEFAULT '',
  `friend_id` varchar(50) NOT NULL,
  `friend_name` varchar(60) NOT NULL,
  `friend_email` varchar(60) NOT NULL DEFAULT '',
  `invite_relation` tinyint(1) NOT NULL DEFAULT '0',
  `relation_details` varchar(250) DEFAULT NULL,
  `referer_subject` varchar(250) NOT NULL DEFAULT '',
  `referer_text` text,
  `invite_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `invite_status` tinyint(1) NOT NULL DEFAULT '0',
  `referer_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `friend_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `invite_mode` tinyint(1) NOT NULL DEFAULT '0',
  `action_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_read_msg` tinyint(1) NOT NULL DEFAULT '0',
  `declined_count` tinyint(1) NOT NULL DEFAULT '0',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=5656302 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invitation_uniq`
--

CREATE TABLE `invitation_uniq` (
  `invitation_id` bigint(10) NOT NULL,
  `referer_id` varchar(50) NOT NULL DEFAULT '',
  `friend_id` varchar(50) NOT NULL,
  `friend_name` varchar(60) NOT NULL,
  `friend_email` varchar(60) NOT NULL DEFAULT '',
  `invite_relation` tinyint(1) NOT NULL DEFAULT '0',
  `relation_details` varchar(250) DEFAULT NULL,
  `referer_subject` varchar(250) NOT NULL DEFAULT '',
  `referer_text` text,
  `invite_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `invite_status` tinyint(1) NOT NULL DEFAULT '0',
  `referer_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `friend_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `invite_mode` tinyint(1) NOT NULL DEFAULT '0',
  `action_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_read_msg` tinyint(1) NOT NULL DEFAULT '0',
  `declined_count` tinyint(1) NOT NULL DEFAULT '0',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0',
  `Name` varchar(60) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=5656302 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invite_sendmail`
--

CREATE TABLE `invite_sendmail` (
  `inv_email` varchar(100) NOT NULL DEFAULT '',
  `mailto` varchar(100) NOT NULL DEFAULT '',
  `inv_name` varchar(100) NOT NULL DEFAULT '',
  `inv_subject` varchar(100) NOT NULL DEFAULT '',
  `inv_message` text NOT NULL,
  `inv_id` bigint(20) NOT NULL DEFAULT '0',
  `inv_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobapplications`
--

CREATE TABLE `jobapplications` (
  `Id` bigint(10) NOT NULL,
  `Job_Id` bigint(8) NOT NULL DEFAULT '0',
  `Jobseeker_Id` varchar(50) NOT NULL DEFAULT '',
  `Resume_Id` tinyint(1) NOT NULL DEFAULT '0',
  `Employer_Id` varchar(50) NOT NULL DEFAULT '',
  `Date_Applied` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Application_Status` varchar(15) NOT NULL DEFAULT '',
  `Job_Expiry_Date` date NOT NULL DEFAULT '0000-00-00',
  `Child_Folder_Name` varchar(25) NOT NULL DEFAULT '',
  `Xml` mediumblob,
  `Name` varchar(60) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `Confirm_Email` varchar(60) NOT NULL DEFAULT '',
  `Cnt_Code` char(3) NOT NULL DEFAULT '',
  `St_Code` char(3) NOT NULL DEFAULT '',
  `City_Code` char(3) NOT NULL DEFAULT '',
  `Phone` varchar(20) NOT NULL DEFAULT '',
  `Res_Path` varchar(150) NOT NULL DEFAULT '',
  `Cover_Letter` text NOT NULL,
  `CommentsXml` text,
  `Relevance` float(5,2) NOT NULL DEFAULT '0.00',
  `Modify_Flag` char(1) NOT NULL DEFAULT '',
  `Parent_Folder_Name` varchar(70) NOT NULL DEFAULT '',
  `Type` char(3) NOT NULL DEFAULT '',
  `Js_Status` char(1) NOT NULL DEFAULT 'Y',
  `Target_Job_Id` varchar(70) NOT NULL DEFAULT '',
  `Request_Status` varchar(5) NOT NULL DEFAULT '',
  `Mail_Status` char(1) NOT NULL DEFAULT 'N',
  `SMS_Flag` char(1) NOT NULL DEFAULT 'N',
  `Job_Type` int(1) NOT NULL DEFAULT '1',
  `show_status` char(1) NOT NULL DEFAULT '',
  `Flag` tinyint(4) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=209587423 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobapplications_duplicate`
--

CREATE TABLE `jobapplications_duplicate` (
  `Id` bigint(10) NOT NULL,
  `Job_Id` bigint(8) NOT NULL DEFAULT '0',
  `Jobseeker_Id` varchar(50) NOT NULL DEFAULT '',
  `Resume_Id` tinyint(1) NOT NULL DEFAULT '0',
  `Employer_Id` varchar(50) NOT NULL DEFAULT '',
  `Date_Applied` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Application_Status` varchar(15) NOT NULL DEFAULT '',
  `Job_Expiry_Date` date NOT NULL DEFAULT '0000-00-00',
  `Child_Folder_Name` varchar(25) NOT NULL DEFAULT '',
  `Xml` mediumblob,
  `Name` varchar(60) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `Confirm_Email` varchar(60) NOT NULL DEFAULT '',
  `Cnt_Code` char(3) NOT NULL DEFAULT '',
  `St_Code` char(3) NOT NULL DEFAULT '',
  `City_Code` char(3) NOT NULL DEFAULT '',
  `Phone` varchar(20) NOT NULL DEFAULT '',
  `Res_Path` varchar(150) NOT NULL DEFAULT '',
  `Cover_Letter` text NOT NULL,
  `CommentsXml` text,
  `Relevance` float(5,2) NOT NULL DEFAULT '0.00',
  `Modify_Flag` char(1) NOT NULL DEFAULT '',
  `Parent_Folder_Name` varchar(70) NOT NULL DEFAULT '',
  `Type` char(3) NOT NULL DEFAULT '',
  `Js_Status` char(1) NOT NULL DEFAULT 'Y',
  `Target_Job_Id` varchar(70) NOT NULL DEFAULT '',
  `Request_Status` varchar(5) NOT NULL DEFAULT '',
  `Mail_Status` char(1) NOT NULL DEFAULT 'N',
  `SMS_Flag` char(1) NOT NULL DEFAULT 'N',
  `Job_Type` int(1) NOT NULL DEFAULT '1',
  `show_status` char(1) NOT NULL DEFAULT '',
  `Flag` tinyint(4) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=209385681 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobpost`
--

CREATE TABLE `jobpost` (
  `JobPostId` bigint(20) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Xml` mediumblob NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateActivated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Type` varchar(10) DEFAULT '',
  `Status` tinyint(1) NOT NULL DEFAULT '2',
  `ValidDays` int(4) NOT NULL DEFAULT '0',
  `SubUserId` varchar(50) NOT NULL DEFAULT '',
  `PlanType` varchar(30) NOT NULL DEFAULT '',
  `Source` int(5) NOT NULL DEFAULT '0',
  `Views` bigint(20) NOT NULL DEFAULT '0',
  `AppliedClicks` bigint(20) NOT NULL DEFAULT '0',
  `Job_Title` varchar(70) NOT NULL DEFAULT '',
  `Job_Title_Edit` varchar(70) NOT NULL DEFAULT '',
  `Vacancies` varchar(10) NOT NULL DEFAULT '',
  `Job_Desc` text NOT NULL,
  `Key_Skills` text NOT NULL,
  `Compensation` varchar(30) NOT NULL DEFAULT '',
  `Cnt_Code` text NOT NULL,
  `St_Code` text NOT NULL,
  `Ind_Code` text NOT NULL,
  `Func_Code` int(11) NOT NULL DEFAULT '0',
  `Func_Filter` tinyint(4) NOT NULL DEFAULT '0',
  `Jobr_Code` int(4) NOT NULL DEFAULT '0',
  `Job_Level` tinyint(4) NOT NULL DEFAULT '0',
  `Gender` tinyint(1) NOT NULL DEFAULT '0',
  `GenderFilter` tinyint(1) NOT NULL DEFAULT '0',
  `WorkExp_Min` tinyint(2) NOT NULL DEFAULT '-1',
  `WorkExp_Max` tinyint(2) NOT NULL DEFAULT '-1',
  `WorkExp_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `Edu_Code` tinytext NOT NULL,
  `Qual_Others` varchar(100) NOT NULL DEFAULT '',
  `Qual_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `Ack_Id` int(11) NOT NULL DEFAULT '0',
  `Ack_Letter` tinyint(1) NOT NULL DEFAULT '0',
  `Cmp_Name` varchar(60) NOT NULL DEFAULT '',
  `Cmp_Profile` text NOT NULL,
  `Profile_Default` tinyint(1) NOT NULL DEFAULT '0',
  `Travel` tinyint(1) NOT NULL DEFAULT '0',
  `Emp_Type` tinyint(1) NOT NULL DEFAULT '0',
  `Emp_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Ref_Code` varchar(50) NOT NULL DEFAULT '',
  `Contact_Name` varchar(50) NOT NULL DEFAULT '',
  `Designation` varchar(50) NOT NULL DEFAULT '',
  `Address` tinytext NOT NULL,
  `Off1_Std` varchar(6) NOT NULL DEFAULT '',
  `Off1_Phone` varchar(18) NOT NULL DEFAULT '',
  `Off2_Std` varchar(6) NOT NULL DEFAULT '',
  `Off2_Phone` varchar(12) NOT NULL DEFAULT '',
  `Fax_Std` varchar(6) NOT NULL DEFAULT '',
  `Fax_Phone` varchar(12) NOT NULL DEFAULT '',
  `MobileNo` varchar(16) NOT NULL DEFAULT '',
  `Url` varchar(150) NOT NULL DEFAULT '',
  `Hidden` varchar(50) NOT NULL DEFAULT '',
  `DisplayLogo` tinyint(1) NOT NULL DEFAULT '1',
  `Res_Format` tinyint(1) NOT NULL DEFAULT '1',
  `Rec_Res` tinyint(1) NOT NULL DEFAULT '1',
  `Receive_Email` text NOT NULL,
  `Response_Visible` tinyint(1) NOT NULL DEFAULT '0',
  `RedirectUrl` varchar(200) NOT NULL DEFAULT '',
  `Jp_Date` int(2) NOT NULL DEFAULT '0',
  `Jp_Mth` tinyint(2) NOT NULL DEFAULT '0',
  `Jp_Yr` int(4) NOT NULL DEFAULT '0',
  `WalkinJobs` tinyint(1) NOT NULL DEFAULT '2',
  `Template_Id` tinyint(1) NOT NULL DEFAULT '0',
  `Deactivate_Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Jobprompt_Cnt` int(11) NOT NULL DEFAULT '0',
  `Auto_Match` tinyint(4) NOT NULL DEFAULT '1',
  `Auto_Match_Location` tinyint(1) NOT NULL DEFAULT '0',
  `Jobloc_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `Jobrole_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `Exp_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `delete_status` char(1) NOT NULL DEFAULT 'N',
  `keyskill_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `Posting_Type` tinyint(1) NOT NULL DEFAULT '1',
  `ip` varchar(20) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM AUTO_INCREMENT=1607779 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobpost_duplicate`
--

CREATE TABLE `jobpost_duplicate` (
  `JobPostId` bigint(20) NOT NULL DEFAULT '0',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Xml` mediumblob NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateActivated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Type` varchar(10) DEFAULT '',
  `Status` tinyint(1) NOT NULL DEFAULT '2',
  `ValidDays` int(4) NOT NULL DEFAULT '0',
  `SubUserId` varchar(50) NOT NULL DEFAULT '',
  `PlanType` varchar(30) NOT NULL DEFAULT '',
  `Source` int(5) NOT NULL DEFAULT '0',
  `Views` bigint(20) NOT NULL DEFAULT '0',
  `AppliedClicks` bigint(20) NOT NULL DEFAULT '0',
  `Job_Title` varchar(70) NOT NULL DEFAULT '',
  `Job_Title_Edit` varchar(60) NOT NULL DEFAULT '',
  `Vacancies` varchar(10) NOT NULL DEFAULT '',
  `Job_Desc` text NOT NULL,
  `Key_Skills` text NOT NULL,
  `Compensation` varchar(30) NOT NULL DEFAULT '',
  `Cnt_Code` text NOT NULL,
  `St_Code` text NOT NULL,
  `Ind_Code` text NOT NULL,
  `Func_Code` int(11) NOT NULL DEFAULT '0',
  `Func_Filter` tinyint(4) NOT NULL DEFAULT '0',
  `Jobr_Code` int(4) NOT NULL DEFAULT '0',
  `Job_Level` tinyint(4) NOT NULL DEFAULT '0',
  `Gender` tinyint(1) NOT NULL DEFAULT '0',
  `GenderFilter` tinyint(1) NOT NULL DEFAULT '0',
  `WorkExp_Min` tinyint(2) NOT NULL DEFAULT '-1',
  `WorkExp_Max` tinyint(2) NOT NULL DEFAULT '-1',
  `WorkExp_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `Edu_Code` tinytext NOT NULL,
  `Qual_Others` varchar(100) NOT NULL DEFAULT '',
  `Qual_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `Ack_Id` int(11) NOT NULL DEFAULT '0',
  `Ack_Letter` tinyint(1) NOT NULL DEFAULT '0',
  `Cmp_Name` varchar(60) NOT NULL DEFAULT '',
  `Cmp_Profile` text NOT NULL,
  `Profile_Default` tinyint(1) NOT NULL DEFAULT '0',
  `Travel` tinyint(1) NOT NULL DEFAULT '0',
  `Emp_Type` tinyint(1) NOT NULL DEFAULT '0',
  `Emp_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Ref_Code` varchar(50) NOT NULL DEFAULT '',
  `Contact_Name` varchar(50) NOT NULL DEFAULT '',
  `Designation` varchar(50) NOT NULL DEFAULT '',
  `Address` tinytext NOT NULL,
  `Off1_Std` varchar(6) NOT NULL DEFAULT '',
  `Off1_Phone` varchar(18) NOT NULL DEFAULT '',
  `Off2_Std` varchar(6) NOT NULL DEFAULT '',
  `Off2_Phone` varchar(12) NOT NULL DEFAULT '',
  `Fax_Std` varchar(6) NOT NULL DEFAULT '',
  `Fax_Phone` varchar(12) NOT NULL DEFAULT '',
  `MobileNo` varchar(16) NOT NULL DEFAULT '',
  `Url` varchar(150) NOT NULL DEFAULT '',
  `Hidden` varchar(50) NOT NULL DEFAULT '',
  `DisplayLogo` tinyint(1) NOT NULL DEFAULT '1',
  `Res_Format` tinyint(1) NOT NULL DEFAULT '1',
  `Rec_Res` tinyint(1) NOT NULL DEFAULT '1',
  `Receive_Email` text NOT NULL,
  `Response_Visible` tinyint(1) NOT NULL DEFAULT '0',
  `RedirectUrl` varchar(200) NOT NULL DEFAULT '',
  `Jp_Date` int(2) NOT NULL DEFAULT '0',
  `Jp_Mth` tinyint(2) NOT NULL DEFAULT '0',
  `Jp_Yr` int(4) NOT NULL DEFAULT '0',
  `WalkinJobs` tinyint(1) NOT NULL DEFAULT '2',
  `Template_Id` tinyint(1) NOT NULL DEFAULT '0',
  `Deactivate_Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Jobprompt_Cnt` int(11) NOT NULL DEFAULT '0',
  `Auto_Match` tinyint(4) NOT NULL DEFAULT '1',
  `Auto_Match_Location` tinyint(1) NOT NULL DEFAULT '0',
  `Jobloc_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `Jobrole_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `Exp_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `delete_status` char(1) NOT NULL DEFAULT 'N',
  `keyskill_Filter` tinyint(1) NOT NULL DEFAULT '0',
  `Posting_Type` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobpost_mis`
--

CREATE TABLE `jobpost_mis` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  `addedby` varchar(150) NOT NULL DEFAULT '',
  `cj` int(11) NOT NULL DEFAULT '0',
  `na` int(11) NOT NULL DEFAULT '0',
  `mj` int(11) NOT NULL DEFAULT '0',
  `tj` int(11) NOT NULL DEFAULT '0',
  `sh` int(11) NOT NULL DEFAULT '0',
  `addedon` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `location` varchar(150) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=4327 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jobseekers`
--

CREATE TABLE `jobseekers` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(250) NOT NULL DEFAULT '',
  `ProfileId` varchar(50) NOT NULL DEFAULT '',
  `Xml` mediumtext NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Validated` tinyint(1) NOT NULL DEFAULT '3',
  `Name` varchar(60) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `BlogUrl` varchar(100) NOT NULL DEFAULT '',
  `Website` varchar(100) NOT NULL DEFAULT '',
  `Microblog` varchar(100) NOT NULL DEFAULT '',
  `Active` tinyint(1) NOT NULL DEFAULT '2',
  `JobPrompt` tinyint(1) NOT NULL DEFAULT '3',
  `SiteId` varchar(100) NOT NULL DEFAULT '',
  `ReferredBy` bigint(11) NOT NULL DEFAULT '0',
  `LastActive` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SmsAlert` char(1) NOT NULL DEFAULT 'N',
  `Email_Auth` char(1) NOT NULL DEFAULT 'F',
  `Mobile_Auth` char(1) NOT NULL DEFAULT 'F',
  `Res_Phone_Auth` char(1) NOT NULL DEFAULT 'F',
  `KioskID` varchar(100) DEFAULT '',
  `BranchID` varchar(100) DEFAULT '',
  `Mobile` varchar(20) NOT NULL DEFAULT '',
  `Res_Cnt` varchar(5) NOT NULL DEFAULT '',
  `Mob_Cnt` varchar(5) NOT NULL DEFAULT '',
  `Res_Std` varchar(6) NOT NULL DEFAULT '',
  `Res_Phone` varchar(12) NOT NULL DEFAULT '',
  `Cnt_Code` char(3) NOT NULL DEFAULT '',
  `St_Code` char(3) NOT NULL DEFAULT '',
  `St_Other` varchar(30) NOT NULL DEFAULT '',
  `City_Code` char(3) NOT NULL DEFAULT '',
  `City_Other` varchar(50) NOT NULL DEFAULT '',
  `Dob` date NOT NULL DEFAULT '0000-00-00',
  `Gender` char(1) NOT NULL DEFAULT '',
  `Photo_Path` varchar(150) NOT NULL DEFAULT '',
  `Current_Resume` int(1) NOT NULL DEFAULT '0',
  `Block_Comp` text NOT NULL,
  `Name_Flag` char(1) NOT NULL DEFAULT '',
  `Email_Flag` char(1) NOT NULL DEFAULT '',
  `Mailing_Address` text NOT NULL,
  `Mailing_Flag` char(1) NOT NULL DEFAULT '',
  `Contact_Flag` char(1) NOT NULL DEFAULT '',
  `Shield_Type` tinyint(1) NOT NULL DEFAULT '0',
  `Res_P_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Res_UP_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Res_UM_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Res_Mod_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Res_UMod_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Sms_Code` varchar(7) NOT NULL DEFAULT '',
  `Email_Code` varchar(7) NOT NULL DEFAULT '',
  `Interested_In` varchar(30) NOT NULL DEFAULT '',
  `PhotoStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Profile_Settings` int(11) NOT NULL DEFAULT '0',
  `Profile_View` tinyint(1) NOT NULL DEFAULT '0',
  `Delete_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Delete_Res` tinyint(1) NOT NULL DEFAULT '0',
  `Delete_Oth_Res` varchar(200) NOT NULL DEFAULT '',
  `Deleted_Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Email_Verify_Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Mobile_Verify_Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `AutoApply` tinyint(1) NOT NULL DEFAULT '0',
  `EmailActive` tinyint(1) NOT NULL DEFAULT '0',
  `fb_id` varchar(25) NOT NULL DEFAULT '',
  `proStatus` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobseekers`
--

INSERT INTO `jobseekers` (`UserId`, `Password`, `ProfileId`, `Xml`, `DateAdded`, `DateModified`, `Validated`, `Name`, `Email`, `BlogUrl`, `Website`, `Microblog`, `Active`, `JobPrompt`, `SiteId`, `ReferredBy`, `LastActive`, `SmsAlert`, `Email_Auth`, `Mobile_Auth`, `Res_Phone_Auth`, `KioskID`, `BranchID`, `Mobile`, `Res_Cnt`, `Mob_Cnt`, `Res_Std`, `Res_Phone`, `Cnt_Code`, `St_Code`, `St_Other`, `City_Code`, `City_Other`, `Dob`, `Gender`, `Photo_Path`, `Current_Resume`, `Block_Comp`, `Name_Flag`, `Email_Flag`, `Mailing_Address`, `Mailing_Flag`, `Contact_Flag`, `Shield_Type`, `Res_P_Status`, `Res_UP_Status`, `Res_UM_Status`, `Res_Mod_Status`, `Res_UMod_Status`, `Sms_Code`, `Email_Code`, `Interested_In`, `PhotoStatus`, `Profile_Settings`, `Profile_View`, `Delete_Status`, `Delete_Res`, `Delete_Oth_Res`, `Deleted_Date`, `Email_Verify_Date`, `Mobile_Verify_Date`, `AutoApply`, `EmailActive`, `fb_id`, `proStatus`) VALUES
('abc200713_2', '25f9e794323b453885f5181f1b624d0b', 'abc200713_2', '', '2016-07-20 13:01:13', '0000-00-00 00:00:00', 0, '', 'abc@xyz.com', '', '', '', 0, 0, '', 0, '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', 0),
('ema200755_2', '202cb962ac59075b964b07152d234b70', 'ema200755_2', '', '2016-07-20 13:07:55', '0000-00-00 00:00:00', 0, '', 'email@email.com', '', '', '', 0, 0, '', 0, '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', 0),
('nav280720_2', '202cb962ac59075b964b07152d234b70', 'nav280720_2', '', '2016-07-28 12:48:20', '0000-00-00 00:00:00', 0, 'Naveen', 'nav@xyz.com', '', '', '', 0, 0, '', 0, '0000-00-00 00:00:00', '', '', '', '', '', '', '9990724433', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', 0),
('aks081006_2', 'fe2db07bb4632ca4fb54861d7638fc0c', 'aks081006_2', '', '2016-10-08 14:59:06', '0000-00-00 00:00:00', 0, '', 'aks@nnn.com', '', '', '', 0, 0, '', 0, '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', 0),
('aks081023_2', 'fe2db07bb4632ca4fb54861d7638fc0c', 'aks081023_2', '', '2016-10-08 14:59:23', '0000-00-00 00:00:00', 0, '', 'aks1@nnn.com', '', '', '', 0, 0, '', 0, '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', 0),
('aks081007_2', 'fe2db07bb4632ca4fb54861d7638fc0c', 'aks081007_2', '', '2016-10-08 15:09:07', '0000-00-00 00:00:00', 0, '', 'aks11@nnn.com', '', '', '', 0, 0, '', 0, '0000-00-00 00:00:00', '', '', '', '', '', '', '1234567890', '', '', '', '', '', '', '', '', '', '0000-00-00', '', '', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobseekers_duplicate`
--

CREATE TABLE `jobseekers_duplicate` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(150) NOT NULL DEFAULT '',
  `ProfileId` varchar(50) NOT NULL DEFAULT '',
  `Xml` mediumtext NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Validated` tinyint(1) NOT NULL DEFAULT '3',
  `Name` varchar(60) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `BlogUrl` varchar(100) NOT NULL DEFAULT '',
  `Website` varchar(100) NOT NULL DEFAULT '',
  `Microblog` varchar(100) NOT NULL DEFAULT '',
  `Active` tinyint(1) NOT NULL DEFAULT '2',
  `JobPrompt` tinyint(1) NOT NULL DEFAULT '3',
  `SiteId` varchar(100) NOT NULL DEFAULT '',
  `ReferredBy` bigint(11) NOT NULL DEFAULT '0',
  `LastActive` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SmsAlert` char(1) NOT NULL DEFAULT 'N',
  `Email_Auth` char(1) NOT NULL DEFAULT 'F',
  `Mobile_Auth` char(1) NOT NULL DEFAULT 'F',
  `KioskID` varchar(100) DEFAULT '',
  `BranchID` varchar(100) DEFAULT '',
  `Mobile` varchar(20) NOT NULL DEFAULT '',
  `Res_Cnt` varchar(5) NOT NULL DEFAULT '',
  `Mob_Cnt` varchar(5) NOT NULL DEFAULT '',
  `Res_Std` varchar(6) NOT NULL DEFAULT '',
  `Res_Phone` varchar(12) NOT NULL DEFAULT '',
  `Cnt_Code` char(3) NOT NULL DEFAULT '',
  `St_Code` char(3) NOT NULL DEFAULT '',
  `St_Other` varchar(30) NOT NULL DEFAULT '',
  `City_Code` char(3) NOT NULL DEFAULT '',
  `City_Other` varchar(50) NOT NULL DEFAULT '',
  `Dob` date NOT NULL DEFAULT '0000-00-00',
  `Gender` char(1) NOT NULL DEFAULT '',
  `Photo_Path` varchar(150) NOT NULL DEFAULT '',
  `Current_Resume` int(1) NOT NULL DEFAULT '0',
  `Block_Comp` text NOT NULL,
  `Name_Flag` char(1) NOT NULL DEFAULT '',
  `Email_Flag` char(1) NOT NULL DEFAULT '',
  `Mailing_Address` text NOT NULL,
  `Mailing_Flag` char(1) NOT NULL DEFAULT '',
  `Contact_Flag` char(1) NOT NULL DEFAULT '',
  `Shield_Type` tinyint(1) NOT NULL DEFAULT '0',
  `Res_P_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Res_UP_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Res_UM_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Res_Mod_Status` tinyint(4) NOT NULL DEFAULT '0',
  `Res_UMod_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Sms_Code` varchar(7) NOT NULL DEFAULT '',
  `Email_Code` varchar(7) NOT NULL DEFAULT '',
  `Interested_In` varchar(30) NOT NULL DEFAULT '',
  `PhotoStatus` tinyint(1) NOT NULL DEFAULT '0',
  `Profile_Settings` int(11) NOT NULL DEFAULT '0',
  `Profile_View` tinyint(1) NOT NULL DEFAULT '0',
  `Delete_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Delete_Res` tinyint(1) NOT NULL DEFAULT '0',
  `Delete_Oth_Res` varchar(200) NOT NULL DEFAULT '',
  `Email_Verify_Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Mobile_Verify_Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `AutoApply` tinyint(1) NOT NULL DEFAULT '0',
  `EmailActive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_list_for_bm`
--

CREATE TABLE `job_list_for_bm` (
  `JobId` bigint(20) NOT NULL DEFAULT '0',
  `JobTitle` varchar(100) NOT NULL DEFAULT '',
  `Company` varchar(100) NOT NULL DEFAULT '',
  `Qualification` text NOT NULL,
  `City` tinytext NOT NULL,
  `State` tinytext NOT NULL,
  `Country` tinytext NOT NULL,
  `JobRole` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_repost`
--

CREATE TABLE `job_repost` (
  `JobId` int(11) NOT NULL DEFAULT '0',
  `NewDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `OldDate` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_repost_userid`
--

CREATE TABLE `job_repost_userid` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `JobPostId` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jsexpdetails`
--

CREATE TABLE `jsexpdetails` (
  `Exp_Id` bigint(20) NOT NULL,
  `Emp_name` varchar(255) NOT NULL DEFAULT '',
  `Designation` varchar(255) NOT NULL DEFAULT '',
  `Startdate` varchar(50) NOT NULL DEFAULT '',
  `Enddate` varchar(50) NOT NULL DEFAULT '',
  `Responsibility` text NOT NULL,
  `jobseekerid` varchar(50) NOT NULL DEFAULT '',
  `Resumeid` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_contact_info`
--

CREATE TABLE `js_contact_info` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `MobileNo` varchar(16) DEFAULT '',
  `DateAdded` datetime DEFAULT '0000-00-00 00:00:00',
  `PushInfo` char(1) DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_contact_info_duplicate`
--

CREATE TABLE `js_contact_info_duplicate` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `MobileNo` varchar(16) DEFAULT '',
  `DateAdded` datetime DEFAULT '0000-00-00 00:00:00',
  `PushInfo` char(1) DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_duplicate`
--

CREATE TABLE `js_duplicate` (
  `userid` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(150) NOT NULL DEFAULT '',
  `clrpass` varchar(100) NOT NULL DEFAULT '',
  `newpass` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_earnings`
--

CREATE TABLE `js_earnings` (
  `Js_Earnings_Id` bigint(20) NOT NULL,
  `Jobseeker_Id` varchar(50) NOT NULL,
  `Employer_Id` varchar(50) NOT NULL,
  `SubUser_Id` varchar(50) NOT NULL,
  `DateAdded` datetime NOT NULL,
  `DateAbused` datetime DEFAULT NULL,
  `Earnings` int(11) NOT NULL,
  `Status` char(1) NOT NULL DEFAULT 'N',
  `Abuse_Comments` text,
  `Cse_Id` varchar(50) DEFAULT NULL,
  `IPAddress` varchar(30) NOT NULL,
  `Pay_Per_Action` tinyint(4) NOT NULL,
  `Level` tinyint(4) NOT NULL,
  `Earned_By` varchar(50) NOT NULL,
  `PlanType` varchar(30) NOT NULL,
  `HostType` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=25251 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_earnings_dec29_tmp`
--

CREATE TABLE `js_earnings_dec29_tmp` (
  `Js_Earnings_Id` bigint(20) NOT NULL,
  `Jobseeker_Id` varchar(50) NOT NULL,
  `Employer_Id` varchar(50) NOT NULL,
  `SubUser_Id` varchar(50) NOT NULL,
  `DateAdded` datetime NOT NULL,
  `DateAbused` datetime DEFAULT NULL,
  `Earnings` int(11) NOT NULL,
  `Status` char(1) NOT NULL DEFAULT 'N',
  `Abuse_Comments` text,
  `Cse_Id` varchar(50) DEFAULT NULL,
  `IPAddress` varchar(30) NOT NULL,
  `Pay_Per_Action` tinyint(4) NOT NULL,
  `Level` tinyint(4) NOT NULL,
  `Earned_By` varchar(50) NOT NULL,
  `PlanType` varchar(30) NOT NULL,
  `HostType` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=23778 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_earnings_nov17`
--

CREATE TABLE `js_earnings_nov17` (
  `Js_Earnings_Id` bigint(20) NOT NULL,
  `Jobseeker_Id` varchar(50) NOT NULL,
  `Employer_Id` varchar(50) NOT NULL,
  `SubUser_Id` varchar(50) NOT NULL,
  `DateAdded` datetime NOT NULL,
  `DateAbused` datetime DEFAULT NULL,
  `Earnings` int(11) NOT NULL,
  `Status` char(1) NOT NULL DEFAULT 'N',
  `Abuse_Comments` text,
  `Cse_Id` varchar(50) DEFAULT NULL,
  `IPAddress` varchar(30) NOT NULL,
  `Pay_Per_Action` tinyint(4) NOT NULL,
  `Level` tinyint(4) NOT NULL,
  `Earned_By` varchar(50) NOT NULL,
  `PlanType` varchar(30) NOT NULL,
  `HostType` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18587 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_earnings_summary`
--

CREATE TABLE `js_earnings_summary` (
  `Jobseeker_Id` varchar(50) NOT NULL,
  `Total_Points` int(11) NOT NULL DEFAULT '0',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_earnings_summary_apr5`
--

CREATE TABLE `js_earnings_summary_apr5` (
  `Jobseeker_Id` varchar(50) NOT NULL,
  `Total_Points` int(11) NOT NULL DEFAULT '0',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_earnings_summary_dec29`
--

CREATE TABLE `js_earnings_summary_dec29` (
  `Jobseeker_Id` varchar(50) NOT NULL,
  `Total_Points` int(11) NOT NULL DEFAULT '0',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_earnings_summary_tmp`
--

CREATE TABLE `js_earnings_summary_tmp` (
  `Jobseeker_Id` varchar(50) NOT NULL,
  `Total_Points` int(11) NOT NULL DEFAULT '0',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_emp_report_details`
--

CREATE TABLE `js_emp_report_details` (
  `Id` int(11) NOT NULL,
  `ReportDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `JsReg` int(11) NOT NULL DEFAULT '0',
  `JsAct` int(11) NOT NULL DEFAULT '0',
  `JsLoggedIn` int(11) NOT NULL DEFAULT '0',
  `JsMJobApp` int(11) NOT NULL DEFAULT '0',
  `JsMJobSaved` int(11) NOT NULL DEFAULT '0',
  `JsMJobPend` int(11) NOT NULL DEFAULT '0',
  `JsNmJobApp` int(11) NOT NULL DEFAULT '0',
  `EmpLoggedIn` int(11) NOT NULL DEFAULT '0',
  `EmpJobPost` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_payment_contact_details`
--

CREATE TABLE `js_payment_contact_details` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `city` varchar(60) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_recommended_jobs`
--

CREATE TABLE `js_recommended_jobs` (
  `Id` bigint(10) NOT NULL,
  `Js_User_Id` varchar(50) NOT NULL DEFAULT '',
  `Js_Name` varchar(50) NOT NULL DEFAULT '',
  `Js_Email` varchar(50) NOT NULL DEFAULT '',
  `Friend_Name` varchar(50) NOT NULL DEFAULT '',
  `Friend_Email` varchar(50) NOT NULL DEFAULT '',
  `Job_Id` int(11) NOT NULL DEFAULT '0',
  `Date_Sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `Source` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 - Candidate Search, 2 - Job Preview, 3 - Directory Listings, 4 - Indiamart'
) ENGINE=MyISAM AUTO_INCREMENT=32542 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_redeem_history`
--

CREATE TABLE `js_redeem_history` (
  `redeem_id` bigint(10) NOT NULL,
  `redeem_userid` varchar(50) NOT NULL,
  `redeem_usrname` varchar(60) NOT NULL,
  `redeem_addr` text NOT NULL,
  `redeem_amount` int(11) NOT NULL DEFAULT '0',
  `redeem_requestdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `redeem_status` tinyint(1) DEFAULT '0',
  `redeem_actiondate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `redeem_type` tinyint(1) DEFAULT '0',
  `reedem_chequenum` varchar(60) NOT NULL,
  `redeem_donate` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_relation`
--

CREATE TABLE `js_relation` (
  `earnings_id` int(11) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1',
  `ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `e_date` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2792612 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_resume_viewlist`
--

CREATE TABLE `js_resume_viewlist` (
  `Id` bigint(10) NOT NULL,
  `JobSeekerId` varchar(50) NOT NULL DEFAULT '',
  `DocRef` tinyint(1) DEFAULT '1',
  `EmployerId` varchar(50) NOT NULL DEFAULT '',
  `DateViewed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` tinyint(1) NOT NULL,
  `Type` tinyint(1) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Cmp_Name` varchar(60) NOT NULL DEFAULT '',
  `Ind_Code` int(11) NOT NULL DEFAULT '0',
  `Ip` varchar(16) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM AUTO_INCREMENT=918526 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_resume_viewlist_org`
--

CREATE TABLE `js_resume_viewlist_org` (
  `Id` bigint(10) NOT NULL,
  `JobSeekerId` varchar(50) NOT NULL DEFAULT '',
  `DocRef` tinyint(1) DEFAULT '1',
  `EmployerId` varchar(50) NOT NULL DEFAULT '',
  `DateViewed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` tinyint(1) NOT NULL,
  `Type` tinyint(1) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Cmp_Name` varchar(60) NOT NULL DEFAULT '',
  `Ind_Code` int(11) NOT NULL DEFAULT '0',
  `Ip` varchar(16) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM AUTO_INCREMENT=17945 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `js_vs_count`
--

CREATE TABLE `js_vs_count` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `DocRef` tinyint(4) NOT NULL DEFAULT '0',
  `ViewCount` int(10) NOT NULL DEFAULT '0',
  `SearchViewCount` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `linkdetails`
--

CREATE TABLE `linkdetails` (
  `invitation_id` bigint(10) NOT NULL DEFAULT '0',
  `referer_id` varchar(50) NOT NULL DEFAULT '',
  `friend_id` varchar(50) NOT NULL,
  `sent_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `used_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_val` varchar(20) NOT NULL DEFAULT '',
  `link_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mailer`
--

CREATE TABLE `mailer` (
  `MailerId` int(4) NOT NULL,
  `Cont_Location` varchar(100) NOT NULL DEFAULT '',
  `Subject` varchar(150) DEFAULT NULL,
  `Tcontent` text NOT NULL,
  `Bcontent` text NOT NULL,
  `Query` text NOT NULL,
  `TotMail` int(8) NOT NULL DEFAULT '0',
  `Criteria` text NOT NULL,
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ApproveDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ModId` varchar(20) NOT NULL DEFAULT '',
  `Category` varchar(20) NOT NULL DEFAULT '',
  `FromEmail` varchar(60) NOT NULL DEFAULT '',
  `ReplyToEmail` varchar(60) NOT NULL DEFAULT '',
  `RestrictDomain` varchar(50) NOT NULL DEFAULT '',
  `Alloweddomain` varchar(50) NOT NULL DEFAULT '',
  `ListFileName` varchar(75) NOT NULL DEFAULT '',
  `Status` char(1) DEFAULT 'P',
  `Sender` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=1136 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `microsite`
--

CREATE TABLE `microsite` (
  `UserId` bigint(20) NOT NULL,
  `EmployerId` varchar(50) NOT NULL DEFAULT '',
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Designation` varchar(100) NOT NULL DEFAULT '',
  `Dob` date NOT NULL DEFAULT '0000-00-00',
  `Gender` char(1) NOT NULL DEFAULT '',
  `Education` varchar(100) NOT NULL DEFAULT '',
  `Age` tinyint(4) NOT NULL DEFAULT '0',
  `Address` text NOT NULL,
  `Location` varchar(50) NOT NULL DEFAULT '',
  `State` varchar(50) NOT NULL DEFAULT '',
  `Pin` varchar(9) NOT NULL DEFAULT '',
  `Fax` varchar(20) NOT NULL DEFAULT '',
  `ProfExperience` varchar(250) NOT NULL DEFAULT '',
  `Phone` varchar(20) NOT NULL DEFAULT '',
  `Mobile` varchar(15) NOT NULL DEFAULT '',
  `Email` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `missing_resume`
--

CREATE TABLE `missing_resume` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Res_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Res_Path` varchar(150) NOT NULL DEFAULT '',
  `New_Res_Path` varchar(150) NOT NULL DEFAULT '',
  `Res_Type` char(1) NOT NULL DEFAULT '',
  `Res_Stat` char(1) NOT NULL DEFAULT '',
  `Status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `monthly_earnings_report`
--

CREATE TABLE `monthly_earnings_report` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Name` varchar(60) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `Keyword` text NOT NULL,
  `Yr_Of_Exp` tinyint(4) NOT NULL DEFAULT '0',
  `Func_Code` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `monthly_newsletter`
--

CREATE TABLE `monthly_newsletter` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Name` varchar(60) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `Current_Resume` int(1) NOT NULL DEFAULT '0',
  `Email_Auth` char(1) NOT NULL DEFAULT 'F',
  `Mobile_Auth` char(1) NOT NULL DEFAULT 'F',
  `Mobile` varchar(20) NOT NULL DEFAULT '',
  `Res_Cnt` varchar(5) NOT NULL,
  `Mob_Cnt` varchar(5) NOT NULL DEFAULT '',
  `Res_Std` varchar(6) NOT NULL DEFAULT '',
  `Res_Phone` varchar(12) NOT NULL DEFAULT '',
  `Keyword` text NOT NULL,
  `Yr_Of_Exp` tinyint(4) NOT NULL DEFAULT '0',
  `Func_Code` varchar(50) NOT NULL DEFAULT '',
  `Percentage` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `pageTitle` varchar(150) DEFAULT 'No Title ',
  `content` text,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `pageTitle`, `content`, `status`) VALUES
(1, 'Privacy Policy', '<div class="term post-box box-1" style="padding-top:10px;">\r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">JobstoNaukri.com is committed to protecting the privacy of our users. We want to provide a safe, secure user experience. We will use commercially reasonable efforts, as described below, to ensure that the information you submit to us remains private, and is used only for the purposes as set forth herein. The following reflects our commitment to you.</p>\r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">This privacy commitment is subject to, and governed by, the JobstoNaukri.com <a href="termsOfUse.php" target="_blank" class="slnk1">Terms and Conditions of Use</a>, which represents the entire agreement between the user and JobstoNaukri.com. In the event that any of the terms, conditions or statements contained in this privacy commitment conflict with the Terms, the Terms shall control.</p><br>\r\n			\r\n			<p style="padding-top:10px; color:#1CAED4;"><strong>Information About All Visitors to the JobstoNaukri.com Site</strong></p> \r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">In general, we gather information about all of our users collectively, such as what areas users visit most frequently and what services users access the most. We only use such data in the aggregate. This information helps us determine what is most beneficial for our users, and how we can continually create a better overall experience for our users. We may share this information with our partners, but only in the aggregate, so that they too may understand how users, collectively, use career areas and our site, and so they may create a better overall experience for you.</p><br>\r\n				 \r\n			<p style="padding-top:10px; color:#1CAED4;"><strong>Information About You Specifically</strong></p> \r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">In some instances, such as when you sign up to use a service, we may need more specific information about you, such as your name, mailing address, e-mail address, telephone number etc. We may use that information to make you aware of additional products and services, which may be of interest to you, or to contact you regarding site changes. We may also ask for other information, such as information on your interests, your likes and dislikes regarding the site, the types of jobs you are interested in, etc., in an effort to deliver to you the best possible site experience.</p><br>\r\n			\r\n			<p style="padding-top:10px; color:#1CAED4;"><strong>General Information Disclosure</strong></p> \r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">We do not disclose information about your individual visits to JobstoNaukri.com, or personal information that you provide, such as your name, address, e-mail address, telephone number, etc., to any outside parties, except when we believe disclosure is required under applicable law. But, we may record and share aggregated information with our partners. Also, if you input your information on a co-branded registration page or site, then your information becomes the property of both JobstoNaukri.com and the partner co-sponsoring the pages or site. In that instance, JobstoNaukri.com is not responsible for the information that the partner receives.</p><br>\r\n\r\n			<p style="padding-top:10px; color:#1CAED4;"><strong>Profiles</strong></p> \r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">Since JobstoNaukri.com is a career site we give you the option of putting your profile in our database. Any potential employer may review the Resume that you create as part of your employment profile. You can elect to keep some details on your Resume confidential (such as your name, mailing address, email address, telephone number(s), current employer). If a prospective employer is interested in reviewing your full profile, we will contact you via e-mail and provide you with the name of the potential employer. If you decide that you would like for the potential employer to view your full profile, you may respond directly to the potential employer through the JobstoNaukri.com site and your full profile will be forwarded to the potential employer. Although JobstoNaukri.com will take commercially reasonable efforts to ensure that no person or entity views your full profile without your permission, JobstoNaukri.com cannot guarantee that unauthorized persons will not have access to or view your profile and will not be responsible for any such unauthorized access or viewing of your profile.</p>	 \r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">You may remove your profile at any time. However, potential employers who you have permitted to view your profile may have retained a copy of your profile in their own files or databases. We are not responsible for the retention, use, or privacy of profiles in these instances.</p><br>\r\n			\r\n			<p style="padding-top:10px; color:#1CAED4;"><strong>DISCLAIMER OF WARRANTIES AND LIMITATION OF LIABILITY</strong></p> \r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">THIS SITE IS PROVIDED BY JobstoNaukri.COM ON AN "AS IS" AND "AS AVAILABLE" BASIS. JobstoNaukri.COM MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THIS SITE OR THE INFORMATION, CONTENT, MATERIALS, OR PRODUCTS INCLUDED ON THIS SITE. YOU EXPRESSLY AGREE THAT YOUR USE OF THIS SITE IS AT YOUR SOLE RISK.</p>	 \r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">TO THE FULL EXTENT PERMISSIBLE BY APPLICABLE LAW, JobstoNaukri.COM DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. JobstoNaukri.COM DOES NOT WARRANT THAT THIS SITE, ITS SERVERS, OR E-MAIL SENT FROM JobstoNaukri.COM ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS. JobstoNaukri.COM WILL NOT BE LIABLE FOR ANY DAMAGES OF ANY KIND ARISING FROM THE USE OF THIS SITE, INCLUDING, BUT NOT LIMITED TO DIRECT, INDIRECT, INCIDENTAL, PUNITIVE, AND CONSEQUENTIAL DAMAGES.</p>\r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">As to extraneous contents: JobstoNaukri.com hereby alerts and warns its members of the possibility of unauthorized posting of contents by any person including members and unauthorized users and advises discretion in access since such content, information or representation may not be suitable to you including being offensive. JobstoNaukri.com will not in any way be responsible for such content, information or representations. JobstoNaukri.com is also not responsible for alterations, modifications, deletion, reproduction, sale, transmission or any such misuse of data and content in the public domain by any user.</p><br>\r\n				 \r\n			<p style="padding-top:10px; color:#1CAED4;"><strong>Feedback</strong></p> \r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">JobstoNaukri.com has an area on the site where you can submit feedback. Any feedback that is submitted through this area becomes the property of JobstoNaukri.com. We may use this feedback, such as success stories, for marketing purposes, or to contact you for further feedback on the site.</p><br>		 \r\n\r\n			<p style="padding-top:10px; color:#1CAED4;"><strong>Privacy Commitment Changes</strong></p> \r\n			<p style="line-height:17px; padding:10px 10px 0px 0px;" align="justify">We may change this privacy commitment at any time, the changes therein will be updated here. If, at any time, you have questions or concerns about JobstoNaukri.com''s privacy commitment, please feel free to e-mail us at <a href="mailto:support@JobstoNaukri.com" class="slnk1"><img src="http://imgs.JobstoNaukri.com/jbs/images/support.gif" alt="" align="absmiddle" border="0"></a>.</p>\r\n			</div>', 1),
(2, 'Terms and Conditions', '<div style="padding-top:10px;" class="term post-box box-1">\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>INTRODUCTION</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">\r\n\r\n\r\nThis website page states the Terms of Use under which You (User, Your) may use Jobstonaukri.com (the Site, Website, Web site). Please read these terms of Use, carefully, and if you do not accept them, do not use this Website or Service.\r\nBy using the page, you are indicating your acceptance to be bound by these Terms of Use. Jobstonaukri.com may revise Terms of Use at any time by updating this document, and you should visit this page periodically to review the Terms of Use, because they are binding on you.\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>PRIVACY</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">\r\n\r\nPlease review our Privacy Notice, which also governs your visit to Jobstonaukri.com, to understand our practices. </p>\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>REFUND OF FEE</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">\r\n\r\n\r\n\r\n\r\n\r\nIf you choose to terminate your membership, the MEMBERSHIP FEES ARE NOT REFUNDABLE under any circumstances.\r\n\r\nYour membership in the Jobstonaukri.com service is for your sole, personal use. You may not authorize others to use your membership and you may not assign or transfer your account to any other person or entity. \r\nOnce the order is accomplished and the product is sent from our end to you there will be no Refund and Charge-Back. As a customer you are responsible for understanding this upon purchasing any product at Our Job Portal. No Claim of Charge-Back/ Refund shall be admissible in-case of once the service delivered. \r\nOnce the Service Enrolled from your end, the verification dept. will be in touch with you regarding the updation of profile. If you don’t respond and there will be delay in the services. So, in this situation you are responsible and you cann’t Claim of Charge-Back/ Refund. </p>\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>SITE POLICIES, MODIFICATION AND SEVERABILITY</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">\r\n\r\n\r\n\r\nPlease review our other policies, such as our pricing policy, posted on this site. These policies also govern your visit to www.Jobstonaukri.com and consortium of portals. We reserve the right to make changes to our site, policies, and these Terms and Conditions of Use at any time. If any of these conditions shall be deemed invalid, void, or for any reason unenforceable, that condition shall be deemed severable and shall not affect the validity and enforceability of any remaining condition.\r\nSuggestions, Complaints, Disputes: Suggestions and complaints are to be first addressed to Jobstonaukri.com''s Customer Support Department at support@Jobstonaukri.com\r\n\r\n</p>\r\n\r\n					<p align="justify" style="line-height:18px;padding:0px 0px 10px 0px;">By using the page, you are indicating your acceptance to be bound by these Terms of Use. Jobstonaukri.com may revise Terms of Use at any time by updating this document, and you should visit this page periodically to review the Terms of Use, because they are binding on you.</p>\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>PRIVACY</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">Please review our Privacy Notice, which also governs your visit to Jobstonaukri.com, to understand our practices.</p>\r\n\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>ELECTRONIC COMMUNICATIONS</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">When you visit Jobstonaukri.com or send e-mails to us, you are communicating with us electronically. You consent to receive communications from us electronically. We will communicate with you by e-mail or by posting notices on this site. You agree that all agreements, notices, disclosures and other communications that we provide to you electronically satisfy any legal requirement that such communications be in writing.</p>\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>COPYRIGHT</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">All content included on this site, such as text, graphics, logos, button icons, images, audio clips, digital downloads, data compilations, and software, is the property of Jobstonaukri.com or its content suppliers and protected by Indian and international copyright laws. The compilation of all content on this site is the exclusive property of Jobstonaukri.com and protected by Indian and international copyright laws. All software used on this site is the property of Jobstonaukri.com or its software suppliers and protected by Indian and international copyright laws.</p>\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>TRADEMARK</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;"><a class="slnk1" href="http://www.Jobstonaukri.com/">www.Jobstonaukri.com</a> And other marks indicated on our site are registered trademarks of Jobstonaukri.com, or its subsidiaries, in the United States and other countries. Other Jobstonaukri.com graphics, logos, page headers, button icons, scripts, and service names are trademarks or trade dress of Jobstonaukri.com, or its subsidiaries. Jobstonaukri.com''s trademarks and trade dress may not be used in connection with any product or service that is not Jobstonaukri.com''s, in any manner that is likely to cause confusion among customers or in any manner that disparages or discredits Jobstonaukri.com. All other trademarks not owned by Jobstonaukri.com or its subsidiaries that appear on this site are the property of their respective owners, who may or may not be affiliated with, connected to, or sponsored by Jobstonaukri.com or its subsidiaries.</p>\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>LICENSE AND SITE ACCESS</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">Jobstonaukri.com grants you a limited license to access and make personal use of this site and not to download (other than page caching) or modify it, or any portion of it, except with express written consent of Jobstonaukri.com. This license does not include any resale or commercial use of this site or its contents; any collection and use of any product listings, descriptions, or prices; any derivative use of this site or its contents; any downloading or copying of account information for the benefit of another merchant; or any use of data mining, robots, or similar data gathering and extraction tools. This site or any portion of this site may not be reproduced, duplicated, copied, sold, resold, visited, or otherwise exploited for any commercial purpose without express written consent of Jobstonaukri.com. You may not frame or utilize framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) of Jobstonaukri.com and our affiliates without express written consent. You may not use any Meta tags or any other "hidden text" utilizing Jobstonaukri.com''s name or trademarks without the express written consent of Jobstonaukri.com. Any unauthorized use terminates the permission or license granted by Jobstonaukri.com. You may not use any Jobstonaukri.com logo or other proprietary graphic or trademark as part of the link without express written permission.</p>\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>Jobstonaukri SITE SECURITY RULES</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">Users are prohibited from violating or attempting to violate the security of any Jobstonaukri Site, including, without limitation,</p>\r\n\r\n					<ol type="a" style="padding:0px 0px 0px 30px; line-height:18px; margin-top:0px; margin-bottom:10px; _margin-bottom:5px;" class="term">\r\n						<li> 1) Accessing data not intended for such user or logging into a server or account which the user is not authorized to access,</li>\r\n						<li> 2) Attempting to probe, scan or test the vulnerability of a system or network or to breach security or authentication measures without proper authorization,</li>\r\n						<li>3) Attempting to interfere with service to any user, host or network, including, without limitation, via means of submitting a virus to any Jobstonaukri Site, overloading, "flooding", "spamming", "mail bombing" or "crashing",</li>\r\n						<li> 4) Sending unsolicited e-mail, including promotions and/or advertising of products or services, or</li>\r\n						<li> 5) forging any TCP/IP packet header or any part of the header information in any e-mail or newsgroup posting. Violations of system or network security may result in civil or criminal liability. The Company will investigate occurrences which may involve such violations and may involve, and cooperate with, law enforcement authorities in prosecuting users who are involved in such violations.</li>\r\n					</ol>\r\n\r\n\r\n\r\n	<p style="padding-top:10px; color:#1CAED4;"><strong>POLICIES AND PRICING</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">Employers as well as Resume Owners that Register at our site, shall be deemed to be customers of Jobstonaukri.com. Accordingly, all of our Terms of Use, rules, policies, and operating procedures concerning customers, our services, and our pricing shall apply to those customers. We may change our policies and operating procedures at any time and without any notice to customers. For example, we, in our sole discretion, shall determine the prices to be charged for Resume downloads in accordance with our own pricing policies.</p>\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>PAYOUT DETERMINATION &amp; RULES</strong></p>\r\n					<p align="justify" style="line-height:18px; padding:5px 0px 10px 0px;">"A Qualified Purchase" means a complete, successful, confirmed and valid purchase of contact information by an Employer or a User paying to access the Site. Any purchase that is withdrawn, disputed or otherwise voided by the payee or any other party cannot be considered an "A Qualified Purchase". Final determination of whether each purchase is considered an "A Qualified Purchase" is at sole discretion of Jobstonaukri.</p>\r\n\r\n					<p align="justify" style="line-height:18px; padding:0px 0px 10px 0px;">There can only be one "Qualifying Download" of Contact Information for each Resume downloaded by each Employer. In other words, the same Employer repeatedly downloading the contact information of the same Resume will NOT result in additional Qualifying Downloads. However, the same Resume can be downloaded by multiple Employers, with each Employer''s download resulting in a separate Qualifying Download. Final determination of whether each Resume download is considered a "Qualifying Download" is at sole discretion of Jobstonaukri.</p>\r\n\r\n					<p align="justify" style="line-height:18px; padding:0px 0px 10px 0px;">"Qualifying Payouts" means a commission payable to Customers when their contact information from their resume is viewed. Qualifying Payouts can be of several types and amounts. "Qualifying Referral" means another User (with a complete, successful and confirmed Registration) that was invited by a Customer by e-mailing or providing them with an Invitation Code or by referring them through an Affiliate Link. Any Registrations that are not successful, that are incomplete or invalid, or any Invitations or Referrals that are not properly documented, recorded and assigned by Jobstonaukri.com, can not result in Qualifying Referrals. Final determination of whether each Registration is considered a "Qualifying Referral" is at sole discretion of Jobstonaukri.</p>\r\n\r\n					<p align="justify" style="line-height:18px; padding:0px 0px 10px 0px;">All Payments are calculated as sums of Affiliate''s Qualifying Payouts resulting from Qualifying Downloads of Contact Information.</p>\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>PAYOUTS</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">You may request an Affiliate Payment issued to you when the total fee payment(s) due to you exceeds the specified minimum payout level (currently set at Rs. 100 (Rupees One Hundred)).</p>\r\n\r\n					<p align="justify" style="line-height:18px;padding:0px 0px 10px 0px;">Please note that due to the fact that you may optionally donate your affiliate payment to charity or support a social cause, no payments will be automatically sent to you until you request a withdrawal. You must request a withdrawal from My Rewards section under the My Profile area of Jobstonaukri.com to receive any payment from Jobstonaukri.com.</p>\r\n\r\n					<p align="justify" style="line-height:18px;padding:0px 0px 10px 0px;">You may choose to receive the payment through a cheque depending on the details they submit to us and availability (subject to change). We reserve the right to offer only certain withdrawal types for certain Affiliates at our discretion. We reserve the right to change these withdrawal types at our sole discretion and at any time without any prior notification to anyone.</p>\r\n\r\n					<p align="justify" style="line-height:18px;padding:0px 0px 10px 0px;">Requested payments shall be sent approximately fifteen (15) business days after the request is received and shall be paid in Indian Rupees only. If we determine, in our sole discretion, that you have breached this Agreement, we may (without limiting any other rights or remedies available to us) withhold any Affiliate Payments otherwise payable to you under this Agreement. As a condition to Affiliate Payment issued to you, you must provide us will all information reasonably necessary for us to process payments to you in accordance with any and all applicable laws and regulations. This includes, but is not limited to your identification details such as Residence Proof or Passport number or Driving License. Without such information issuance of your Affiliate Payments may be delayed until such information is received.</p>\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>DISCLAIMER OF WARRANTIES AND LIMITATION OF LIABILITY</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">THIS SITE IS PROVIDED BY Jobstonaukri.COM ON AN "AS IS" AND "AS AVAILABLE" BASIS. Jobstonaukri.COM MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THIS SITE OR THE INFORMATION, CONTENT, MATERIALS, OR PRODUCTS INCLUDED ON THIS SITE. YOU EXPRESSLY AGREE THAT YOUR USE OF THIS SITE IS AT YOUR SOLE RISK.</p>\r\n					\r\n					<p align="justify" style="line-height:18px; padding:0px 0px 10px 0px;">TO THE FULL EXTENT PERMISSIBLE BY APPLICABLE LAW, Jobstonaukri.COM DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. Jobstonaukri.COM DOES NOT WARRANT THAT THIS SITE, ITS SERVERS, OR E-MAIL SENT FROM Jobstonaukri.COM ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS. Jobstonaukri.COM WILL NOT BE LIABLE FOR ANY DAMAGES OF ANY KIND ARISING FROM THE USE OF THIS SITE, INCLUDING, BUT NOT LIMITED TO DIRECT, INDIRECT, INCIDENTAL, PUNITIVE, AND CONSEQUENTIAL DAMAGES.</p>\r\n\r\n					<p align="justify" style="line-height:18px;padding:0px 0px 10px 0px;">As to extraneous contents: Jobstonaukri.com hereby alerts and warns its members of the possibility of unauthorized posting of contents by any person including members and unauthorized users and advises discretion in access since such content, information or representation may not be suitable to you including being offensive. Jobstonaukri.com will not in any way be responsible for such content, information or representations. Jobstonaukri.com is also not responsible for alterations, modifications, deletion, reproduction, sale, transmission or any such misuse of data and content in the public domain by any user.</p>\r\n\r\n\r\n\r\n\r\n\r\n					<p style="padding-top:10px; color:#1CAED4;"><strong>APPLICABLE LAW</strong></p>\r\n					<p align="justify" style="line-height:18px;padding:5px 0px 10px 0px;">The membership is deemed to have been entered into at Chennai, India and the laws of India will govern the membership. Disputes arising out of or in any way affecting the membership including interpretation of any of the terms are to be referred to arbitration under the Arbitration and Conciliation Act 1996 [Indian Act] at Chennai before a sole Arbitrator to be appointed by the CEO of Jobstonaukri.com.</p>\r\n				</div>', 1);
INSERT INTO `pages` (`page_id`, `pageTitle`, `content`, `status`) VALUES
(3, 'Contact Us', '<div class="inner"> \r\n    \r\n    <!-- Content Inner -->\r\n    <div class="content-inner"> \r\n      \r\n      <!-- Content Center -->\r\n      <div class="content-center">\r\n        <div id="map-container">\r\n          <div id="contact-map" class="map box-1" style="position: relative; background-color: rgb(229, 227, 223); overflow: hidden; transform: translateZ(0px);"><div class="gm-style" style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0;"><div style="position: absolute; left: 0px; top: 0px; overflow: hidden; width: 100%; height: 100%; z-index: 0; cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default;"><div style="position: absolute; left: 0px; top: 0px; z-index: 1; width: 100%; transform-origin: 0px 0px; transform: matrix(1, 0, 0, 1, 0, 0);"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 100; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 176px; top: -97px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 176px; top: 159px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -80px; top: -97px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: -80px; top: 159px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 432px; top: -97px;"></div><div style="width: 256px; height: 256px; transform: translateZ(0px); position: absolute; left: 432px; top: 159px;"></div></div></div></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 101; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 102; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 103; width: 100%;"><div style="position: absolute; left: 0px; top: 0px; z-index: -1;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 176px; top: -97px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 176px; top: 159px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: -80px; top: -97px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: -80px; top: 159px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 432px; top: -97px;"></div><div style="width: 256px; height: 256px; overflow: hidden; transform: translateZ(0px); position: absolute; left: 432px; top: 159px;"></div></div></div></div><div style="position: absolute; z-index: 0; transform: translateZ(0px); left: 0px; top: 0px;"><div style="overflow: hidden; width: 605px; height: 320px;"><img src="http://maps.googleapis.com/maps/api/js/StaticMapService.GetMapImage?1m2&amp;1i76880&amp;2i98401&amp;2e1&amp;3u10&amp;4m2&amp;1u605&amp;2u320&amp;5m5&amp;1e0&amp;5sen-US&amp;6sus&amp;10b1&amp;12b1&amp;token=59109" style="width: 605px; height: 320px;"></div></div><div style="position: absolute; left: 0px; top: 0px; z-index: 0;"><div aria-hidden="true" style="position: absolute; left: 0px; top: 0px; z-index: 1; visibility: inherit;"><div style="transform: translateZ(0px); position: absolute; left: -80px; top: -97px; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://maps.google.com/maps/vt?pb=!1m5!1m4!1i10!2i300!3i384!4i256!2m3!1e0!2sm!3i352021049!3m9!2sen-US!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=27170" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="transform: translateZ(0px); position: absolute; left: 176px; top: 159px; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://maps.google.com/maps/vt?pb=!1m5!1m4!1i10!2i301!3i385!4i256!2m3!1e0!2sm!3i352021049!3m9!2sen-US!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=111980" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="transform: translateZ(0px); position: absolute; left: 176px; top: -97px; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://maps.google.com/maps/vt?pb=!1m5!1m4!1i10!2i301!3i384!4i256!2m3!1e0!2sm!3i352021049!3m9!2sen-US!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=75959" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="transform: translateZ(0px); position: absolute; left: 432px; top: 159px; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://maps.google.com/maps/vt?pb=!1m5!1m4!1i10!2i302!3i385!4i256!2m3!1e0!2sm!3i352021049!3m9!2sen-US!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=29698" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="transform: translateZ(0px); position: absolute; left: 432px; top: -97px; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://maps.google.com/maps/vt?pb=!1m5!1m4!1i10!2i302!3i384!4i256!2m3!1e0!2sm!3i352021049!3m9!2sen-US!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=124748" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div style="transform: translateZ(0px); position: absolute; left: -80px; top: 159px; transition: opacity 200ms ease-out; -webkit-transition: opacity 200ms ease-out;"><img src="http://maps.google.com/maps/vt?pb=!1m5!1m4!1i10!2i300!3i385!4i256!2m3!1e0!2sm!3i352021049!3m9!2sen-US!3sUS!5e18!12m1!1e47!12m3!1e37!2m1!1ssmartmaps!4e0&amp;token=63191" draggable="false" alt="" style="position: absolute; left: 0px; top: 0px; width: 256px; height: 256px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div></div><div class="gm-style-pbc" style="position: absolute; left: 0px; top: 0px; z-index: 2; width: 100%; height: 100%; transition: 0.3s; -webkit-transition: 0.3s; opacity: 0; display: none;"><p class="gm-style-pbt">Use two fingers to move the map</p></div><div style="position: absolute; left: 0px; top: 0px; z-index: 3; width: 100%; height: 100%;"></div><div style="position: absolute; left: 0px; top: 0px; z-index: 4; width: 100%; transform-origin: 0px 0px; transform: matrix(1, 0, 0, 1, 0, 0);"><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 104; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 105; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 106; width: 100%;"></div><div style="transform: translateZ(0px); position: absolute; left: 0px; top: 0px; z-index: 107; width: 100%;"></div></div></div><div style="margin-left: 5px; margin-right: 5px; z-index: 1000000; position: absolute; left: 0px; bottom: 0px;"><a target="_blank" href="https://maps.google.com/maps?ll=40.712784,-74.005941&amp;z=10&amp;t=m&amp;hl=en-US&amp;gl=US&amp;mapclient=apiv3" title="Click to see this area on Google Maps" style="position: static; overflow: visible; float: none; display: inline;"><div style="width: 66px; height: 26px; cursor: pointer;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/google4.png" draggable="false" style="position: absolute; left: 0px; top: 0px; width: 66px; height: 26px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div></a></div><div style="background-color: white; padding: 15px 21px; border: 1px solid rgb(171, 171, 171); font-family: Roboto, Arial, sans-serif; color: rgb(34, 34, 34); -webkit-box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 16px; z-index: 10000002; display: none; width: 256px; height: 148px; position: absolute; left: 153px; top: 70px;"><div style="padding: 0px 0px 10px; font-size: 16px;">Map Data</div><div style="font-size: 13px;">Map data ©2016 Google</div><div style="width: 13px; height: 13px; overflow: hidden; position: absolute; opacity: 0.7; right: 12px; top: 12px; z-index: 10000; cursor: pointer;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/mapcnt6.png" draggable="false" style="position: absolute; left: -2px; top: -336px; width: 59px; height: 492px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div><div class="gmnoprint" style="z-index: 1000001; position: absolute; right: 245px; bottom: 0px; width: 122px;"><div draggable="false" class="gm-style-cc" style="-webkit-user-select: none; height: 14px; line-height: 14px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a style="color: rgb(68, 68, 68); text-decoration: none; cursor: pointer; display: none;">Map Data</a><span style="">Map data ©2016 Google</span></div></div></div><div class="gmnoscreen" style="position: absolute; right: 0px; bottom: 0px;"><div style="font-family: Roboto, Arial, sans-serif; font-size: 11px; color: rgb(68, 68, 68); direction: ltr; text-align: right; background-color: rgb(245, 245, 245);">Map data ©2016 Google</div></div><div class="gmnoprint gm-style-cc" draggable="false" style="z-index: 1000001; -webkit-user-select: none; height: 14px; line-height: 14px; position: absolute; right: 95px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a href="https://www.google.com/intl/en-US_US/help/terms_maps.html" target="_blank" style="text-decoration: none; cursor: pointer; color: rgb(68, 68, 68);">Terms of Use</a></div></div><div style="width: 25px; height: 25px; overflow: hidden; display: none; margin: 10px 14px; position: absolute; top: 0px; right: 0px;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/sv5.png" draggable="false" class="gm-fullscreen-control" style="position: absolute; left: -52px; top: -86px; width: 164px; height: 112px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px;"></div><div draggable="false" class="gm-style-cc" style="-webkit-user-select: none; height: 14px; line-height: 14px; position: absolute; right: 0px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><a target="_new" title="Report errors in the road map or imagery to Google" href="https://www.google.com/maps/@40.7127837,-74.0059413,10z/data=!10m1!1e1!12b1?source=apiv3&amp;rapsrc=apiv3" style="font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); text-decoration: none; position: relative;">Report a map error</a></div></div><div class="gmnoprint gm-bundled-control gm-bundled-control-on-bottom" draggable="false" controlwidth="28" controlheight="93" style="margin: 10px; -webkit-user-select: none; position: absolute; bottom: 107px; right: 28px;"><div class="gmnoprint" controlwidth="28" controlheight="55" style="position: absolute; left: 0px; top: 38px;"><div draggable="false" style="-webkit-user-select: none; -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-bottom-right-radius: 2px; border-bottom-left-radius: 2px; cursor: pointer; background-color: rgb(255, 255, 255); width: 28px; height: 55px;"><div title="Zoom in" style="position: relative; width: 28px; height: 27px; left: 0px; top: 0px;"><div style="overflow: hidden; position: absolute; width: 15px; height: 15px; left: 7px; top: 6px;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/tmapctrl.png" draggable="false" style="position: absolute; left: 0px; top: 0px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 120px; height: 54px;"></div></div><div style="position: relative; overflow: hidden; width: 67%; height: 1px; left: 16%; background-color: rgb(230, 230, 230); top: 0px;"></div><div title="Zoom out" style="position: relative; width: 28px; height: 27px; left: 0px; top: 0px;"><div style="overflow: hidden; position: absolute; width: 15px; height: 15px; left: 7px; top: 6px;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/tmapctrl.png" draggable="false" style="position: absolute; left: 0px; top: -15px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 120px; height: 54px;"></div></div></div></div><div class="gm-svpc" controlwidth="28" controlheight="28" style="background-color: rgb(255, 255, 255); -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-bottom-right-radius: 2px; border-bottom-left-radius: 2px; width: 28px; height: 28px; cursor: url(http://maps.gstatic.com/mapfiles/openhand_8_8.cur) 8 8, default; position: absolute; left: 0px; top: 0px;"><div style="position: absolute; left: 1px; top: 1px;"></div><div style="position: absolute; left: 1px; top: 1px;"><div aria-label="Street View Pegman Control" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -26px; width: 215px; height: 835px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div aria-label="Pegman is on top of the Map" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -52px; width: 215px; height: 835px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div aria-label="Street View Pegman Control" style="width: 26px; height: 26px; overflow: hidden; position: absolute; left: 0px; top: 0px; visibility: hidden;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/cb_scout5.png" draggable="false" style="position: absolute; left: -147px; top: -78px; width: 215px; height: 835px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div><div class="gmnoprint" controlwidth="28" controlheight="0" style="display: none; position: absolute;"><div title="Rotate map 90 degrees" style="width: 28px; height: 28px; overflow: hidden; position: absolute; border-top-left-radius: 2px; border-top-right-radius: 2px; border-bottom-right-radius: 2px; border-bottom-left-radius: 2px; -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; cursor: pointer; background-color: rgb(255, 255, 255); display: none;"><img src="http://maps.gstatic.com/mapfiles/api-3/images/tmapctrl4.png" draggable="false" style="position: absolute; left: -141px; top: 6px; width: 170px; height: 54px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div><div class="gm-tilt" style="width: 28px; height: 28px; overflow: hidden; position: absolute; border-top-left-radius: 2px; border-top-right-radius: 2px; border-bottom-right-radius: 2px; border-bottom-left-radius: 2px; -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; top: 0px; cursor: pointer; background-color: rgb(255, 255, 255);"><img src="http://maps.gstatic.com/mapfiles/api-3/images/tmapctrl4.png" draggable="false" style="position: absolute; left: -141px; top: -13px; width: 170px; height: 54px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none;"></div></div></div><div class="gmnoprint" style="margin: 10px; z-index: 0; position: absolute; cursor: pointer; left: 0px; top: 0px;"><div class="gm-style-mtc" style="float: left;"><div draggable="false" title="Show street map" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 8px; border-bottom-left-radius: 2px; border-top-left-radius: 2px; -webkit-background-clip: padding-box; background-clip: padding-box; -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; min-width: 21px; font-weight: 500;">Map</div><div style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; position: absolute; left: 0px; top: 42px; text-align: left; display: none;"><div draggable="false" title="Show street map with terrain" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap;"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; background-color: rgb(255, 255, 255); border: 1px solid rgb(198, 198, 198); border-top-left-radius: 1px; border-top-right-radius: 1px; border-bottom-right-radius: 1px; border-bottom-left-radius: 1px; width: 13px; height: 13px; vertical-align: middle;"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden; display: none;"><img src="http://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">Terrain</label></div></div></div><div class="gm-style-mtc" style="float: left;"><div draggable="false" title="Show satellite imagery" style="direction: ltr; overflow: hidden; text-align: center; position: relative; color: rgb(86, 86, 86); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 8px; border-bottom-right-radius: 2px; border-top-right-radius: 2px; -webkit-background-clip: padding-box; background-clip: padding-box; -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; border-left-width: 0px; min-width: 39px;">Satellite</div><div style="background-color: white; z-index: -1; padding: 2px; border-bottom-left-radius: 2px; border-bottom-right-radius: 2px; -webkit-box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px; position: absolute; right: 0px; top: 42px; text-align: left; display: none;"><div draggable="false" title="Show imagery with street names" style="color: rgb(0, 0, 0); font-family: Roboto, Arial, sans-serif; -webkit-user-select: none; font-size: 11px; background-color: rgb(255, 255, 255); padding: 6px 8px 6px 6px; direction: ltr; text-align: left; white-space: nowrap;"><span role="checkbox" style="box-sizing: border-box; position: relative; line-height: 0; font-size: 0px; margin: 0px 5px 0px 0px; display: inline-block; background-color: rgb(255, 255, 255); border: 1px solid rgb(198, 198, 198); border-top-left-radius: 1px; border-top-right-radius: 1px; border-bottom-right-radius: 1px; border-bottom-left-radius: 1px; width: 13px; height: 13px; vertical-align: middle;"><div style="position: absolute; left: 1px; top: -2px; width: 13px; height: 11px; overflow: hidden;"><img src="http://maps.gstatic.com/mapfiles/mv/imgs8.png" draggable="false" style="position: absolute; left: -52px; top: -44px; -webkit-user-select: none; border: 0px; padding: 0px; margin: 0px; max-width: none; width: 68px; height: 67px;"></div></span><label style="vertical-align: middle; cursor: pointer;">Labels</label></div></div></div></div><div draggable="false" class="gm-style-cc" style="position: absolute; -webkit-user-select: none; height: 14px; line-height: 14px; right: 166px; bottom: 0px;"><div style="opacity: 0.7; width: 100%; height: 100%; position: absolute;"><div style="width: 1px;"></div><div style="background-color: rgb(245, 245, 245); width: auto; height: 100%; margin-left: 1px;"></div></div><div style="position: relative; padding-right: 6px; padding-left: 6px; font-family: Roboto, Arial, sans-serif; font-size: 10px; color: rgb(68, 68, 68); white-space: nowrap; direction: ltr; text-align: right; vertical-align: middle; display: inline-block;"><span>5 km&nbsp;</span><div style="position: relative; display: inline-block; height: 8px; bottom: -1px; width: 43px;"><div style="width: 100%; height: 4px; position: absolute; left: 0px; top: 0px;"></div><div style="width: 4px; height: 8px; left: 0px; top: 0px; background-color: rgb(255, 255, 255);"></div><div style="width: 4px; height: 8px; position: absolute; background-color: rgb(255, 255, 255); left: 0px; bottom: 0px;"></div><div style="position: absolute; background-color: rgb(102, 102, 102); height: 2px; left: 1px; bottom: 1px; right: 1px;"></div><div style="position: absolute; width: 2px; height: 6px; left: 1px; top: 1px; background-color: rgb(102, 102, 102);"></div><div style="width: 2px; height: 6px; position: absolute; background-color: rgb(102, 102, 102); bottom: 1px; right: 1px;"></div></div></div></div></div></div>\r\n        </div>\r\n        <div id="contacts" class="block post-box box-1 contact-address">\r\n          <div class="block-content">\r\n            <div>\r\n              <h3 class="title-3">Headquarters</h3>\r\n              <div class="contact-field"><span class="label">Address:</span><span id="first-address" class="count">A3 Janta TV Tower Kirti Nagar Industrial Area New Delhi </span></div>\r\n              <div class="contact-field"><span class="label">Phone:</span><span class="count">+91 011-48652050</span></div>\r\n              <div class="contact-field"><span class="label">E-mail:</span><span class="count"><a href="mailto:support@jobstonaukri.com">support@jobstonaukri.com</a></span></div>\r\n              \r\n            </div>\r\n           \r\n          </div>\r\n        </div>\r\n      </div>\r\n      <!-- /Content Center --> \r\n      \r\n      <!-- Content Right -->\r\n      <div class="content-right">\r\n        <div class="block background">\r\n          <h2 class="title-1">Send Us a Message</h2>\r\n          <div class="block-content">\r\n            <form id="contact" action="">\r\n              <p>Let us know if we can help you</p>\r\n              <div id="about">\r\n                <input title="Your Name" type="text" name="name" class="textfield combosexed" placeholder="Name" style="display: none;"><span class="combosex_main textfield combosex_with_append combosex_text"><span class="combosex_input_span"><span class="combosex_ph" style="display: inline;">Name</span><input autocomplete="off" type="text" class="combosex_input combosex_input_1" value=""><a rel="1" class="combosex_append">+</a></span><input type="hidden" class="combosex_def" value=""><input type="hidden" class="combosex_value" value=""><span class="combosex_spinner"></span></span>\r\n                <input title="Your E-Mail" type="text" name="email" class="textfield combosexed" placeholder="E-mail" style="display: none;"><span class="combosex_main textfield combosex_with_append combosex_text"><span class="combosex_input_span"><span class="combosex_ph" style="display: inline;">E-mail</span><input autocomplete="off" type="text" class="combosex_input combosex_input_2" value=""><a rel="2" class="combosex_append">+</a></span><input type="hidden" class="combosex_def" value=""><input type="hidden" class="combosex_value" value=""><span class="combosex_spinner"></span></span>\r\n                <input title="Your WebSite" type="text" name="website" class="textfield combosexed" placeholder="WebSite" style="display: none;"><span class="combosex_main textfield combosex_with_append combosex_text"><span class="combosex_input_span"><span class="combosex_ph" style="display: inline;">WebSite</span><input autocomplete="off" type="text" class="combosex_input combosex_input_3" value=""><a rel="3" class="combosex_append">+</a></span><input type="hidden" class="combosex_def" value=""><input type="hidden" class="combosex_value" value=""><span class="combosex_spinner"></span></span>\r\n              </div>\r\n              <div id="mess">\r\n                <textarea title="Your Message" name="message" cols="30" rows="6" class="textarea" onclick="this.value='''';" onfocus="$(this).addClass(''active'');" onblur="$(this).removeClass(''active'');">How can I help you?</textarea>\r\n              </div>\r\n              <div id="send">\r\n                <button class="btn blue">Send Message</button>\r\n              </div>\r\n            </form>\r\n          </div>\r\n        </div>\r\n      </div>\r\n      <!-- /Content Right -->\r\n      \r\n      <div class="clear"></div>\r\n      <!-- Clear Line --> \r\n      \r\n    </div>\r\n    <!-- /Content Inner --> \r\n    \r\n  </div>', 1),
(4, 'About Us', '<div class="row post-box box-1">\r\n				<div style="padding:0px 10px 5px 0px;">\r\n					<h1 style="font-family:verdana; font-size:15px; color:#1CAED4;"><strong>Who we are</strong></h1>\r\n				</div>\r\n				<p style="line-height:18px; padding:10px 20px 15px 0px;" align="justify">Nothing can be more constant than change; hence we do our bit to instigate it. In an ever-changing global market, it is vital to evolve, move ahead and move on. Accordingly as a career and professional networking portal that strategically brings together professionals and inter-dependent professional communities, it is essential that our strategies are not based on assumptions but involves a lot of intuitiveness, comprehension and insight. Especially since we are dealing with people and their aspirations for a better life and a better future, be it as an individual jobseeker or a large conglomerate that envisions exponential expansions. And as jobstonaukri.com that is fundamentally focused on connecting people and opportunities in the best possible way in the best possible way; we don''t just care about your pursuit but ensure that we do something to bring it to fruition.</p>				\r\n			\r\n				<div style="padding:0px 10px 5px 0px;">\r\n					<h1 style="font-family:verdana; font-size:15px; color:#1CAED4;"><strong>How we do what we do</strong></h1>\r\n				</div>\r\n				<p style="padding-top:10px; color:#E09A22;"><strong>Experience. Information. Panache. Teamwork</strong></p> \r\n				<p style="line-height:18px; padding:10px 20px 5px 0px;" align="justify">Creating outstanding results is not rocket science nor does it involve years of grueling skull drudgery. All it needs is a group of talented, freethinking individuals and a motivating, challenging ambiance.</p>\r\n				<p style="line-height:16px; padding:5px 20px 5px 0px;" align="justify">At Jobstonaukri we believe that if something is worth doing, then it''s worth doing it well; without over-complicating or over-intellectualizing the work process. We just put together big ideas with a user-centric perspective and get the job done right every time.</p>\r\n				<p style="line-height:16px; padding:5px 20px 5px 0px;" align="justify">But how we get ourselves to do this is what tells us apart from the rest of the pack.</p>\r\n\r\n</div>\r\n			', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(80) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `amount` int(10) DEFAULT NULL,
  `package` varchar(50) NOT NULL,
  `gateway` varchar(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `orderId` varchar(30) NOT NULL,
  `asm` int(11) NOT NULL,
  `tlName` varchar(30) NOT NULL,
  `agentName` varchar(30) NOT NULL,
  `response` varchar(300) NOT NULL,
  `responseText` text NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentId`, `name`, `email`, `mobile`, `amount`, `package`, `gateway`, `status`, `orderId`, `asm`, `tlName`, `agentName`, `response`, `responseText`, `dateAdded`) VALUES
(1, 'naveen kumar', 'naveen.nimbal@gmail.com', '9990919500', NULL, 'j2n', 'paytm', 0, 'J2N58454aacbc071', 0, 'tlName', 'agent', '', '', '2016-12-05 11:08:29'),
(2, 'naveen kumar', 'navads2@gmail.com', '9990919500', 999, 'j2n', 'paytm', 2, 'J2N58463414370bc', 0, 'tlName', 'agent', '', '', '2016-12-06 06:34:41'),
(3, 'naveen kumar', 'naveen.nimbal@gmail.com', '9990919500', 1, 'j2n', 'paytm', 2, 'J2N58474b4d1afe9', 0, 'tlName', 'agent', 'Looks like you cancelled the payment. You can try again now by adding money in your wallet or choose another payment method. If you faced any issues in completing the payment, please contact us', '{"RESPCODE":"14113","RESPMSG":"Looks like you cancelled the payment. You can try again now by adding money in your wallet or choose another payment method. If you faced any issues in completing the payment, please contact us","STATUS":"TXN_FAILURE","MID":"FOXIES52706480784220","TXNAMOUNT":"1.00","ORDERID":"J2N58474b4d1afe9","TXNID":"6361041152","CHECKSUMHASH":"f1PDCBEgpDCphaL15CuqacUFyJWLsUgU7nI9EO+dViaIaLYYR6ETDI3LAZaPdmVk3\\/DTv3dZ7djc1MnZpdUcCHCorDqsnqw9mGttcLT90dY="}', '2016-12-06 23:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `payment_master`
--

CREATE TABLE `payment_master` (
  `Pay_Id` bigint(4) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `OrderId` varchar(30) NOT NULL DEFAULT '',
  `City_OrderId` varchar(20) NOT NULL DEFAULT '',
  `PaymentMode` char(2) NOT NULL DEFAULT '',
  `Payment_Source` char(2) NOT NULL DEFAULT '',
  `ResumePath` text NOT NULL,
  `File_Server_Name` varchar(22) NOT NULL DEFAULT '',
  `CvName` varchar(100) NOT NULL DEFAULT '',
  `Type` char(1) NOT NULL DEFAULT '',
  `PaymentDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `BillingName` varchar(100) NOT NULL DEFAULT '',
  `BillingEmail` varchar(50) NOT NULL DEFAULT '',
  `BillingAddress` text NOT NULL,
  `BillingCity` varchar(100) NOT NULL DEFAULT '',
  `BillingCountry` varchar(100) NOT NULL DEFAULT '',
  `BillingPhone` varchar(50) NOT NULL DEFAULT '',
  `BillingMobile` varchar(50) NOT NULL DEFAULT '',
  `Payment_Status` char(1) NOT NULL DEFAULT '',
  `Status_Desc` text NOT NULL,
  `ApprovedDate` datetime DEFAULT '0000-00-00 00:00:00',
  `Service_Status` char(2) NOT NULL DEFAULT '',
  `KioskId` varchar(100) NOT NULL DEFAULT '',
  `BranchId` varchar(100) NOT NULL DEFAULT '',
  `ReferredBy` varchar(100) NOT NULL DEFAULT '',
  `RAssess_Date` date NOT NULL DEFAULT '0000-00-00',
  `RAssess_Time` varchar(10) NOT NULL DEFAULT '',
  `RAssess_Yr_Of_Exp` int(6) NOT NULL DEFAULT '0',
  `RAssess_Mth_Of_Exp` int(6) NOT NULL DEFAULT '0',
  `PaymentFlag` int(1) NOT NULL DEFAULT '0',
  `IPAddress` varchar(30) NOT NULL DEFAULT '',
  `MaxMind` int(3) NOT NULL DEFAULT '0',
  `PaymentCountry` char(2) NOT NULL DEFAULT '',
  `Member_Status` tinyint(1) NOT NULL DEFAULT '1',
  `is_special_product` char(1) NOT NULL DEFAULT 'N',
  `is_easycart_product` char(1) NOT NULL DEFAULT 'N',
  `RAssess_Status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=41223 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transaction`
--

CREATE TABLE `payment_transaction` (
  `Tans_Id` bigint(20) NOT NULL,
  `Pay_Id` bigint(20) NOT NULL DEFAULT '0',
  `Res_Pack_Id` int(4) NOT NULL DEFAULT '0',
  `Price` float NOT NULL DEFAULT '0',
  `TransactionDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Amount` float(10,2) NOT NULL DEFAULT '0.00',
  `Discount` float(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM AUTO_INCREMENT=51106 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pay_citiauth`
--

CREATE TABLE `pay_citiauth` (
  `Pay_Id` bigint(4) NOT NULL DEFAULT '0',
  `Auth_TraceNo` bigint(20) NOT NULL DEFAULT '0',
  `Auth_OrderNo` varchar(12) NOT NULL DEFAULT '',
  `Amount` float(10,2) NOT NULL DEFAULT '0.00',
  `TransactionDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `101AuthDec` char(2) NOT NULL DEFAULT '',
  `MsgIndicator` varchar(4) NOT NULL DEFAULT '',
  `120DateTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `130AuthDec` char(2) NOT NULL DEFAULT '',
  `130ApprovalCode` varchar(20) NOT NULL DEFAULT '',
  `PaymentFlag` int(1) NOT NULL DEFAULT '0',
  `RedirectFlag` char(1) NOT NULL DEFAULT '',
  `CheckSumDate` varchar(14) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pay_cititrace`
--

CREATE TABLE `pay_cititrace` (
  `TraceNo` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pending_automatchid`
--

CREATE TABLE `pending_automatchid` (
  `JobPostId` bigint(20) NOT NULL DEFAULT '0',
  `SentCount` int(4) NOT NULL DEFAULT '0',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LastSent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pending_jobapplication_mail`
--

CREATE TABLE `pending_jobapplication_mail` (
  `id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `js_id` varchar(80) NOT NULL DEFAULT '',
  `createdon` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=801854 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plansowned`
--

CREATE TABLE `plansowned` (
  `Id` int(4) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `AccNo` int(5) NOT NULL DEFAULT '0',
  `PlanNumber` int(5) NOT NULL DEFAULT '0',
  `PlanType` varchar(30) NOT NULL DEFAULT '',
  `Validity` int(4) NOT NULL DEFAULT '0',
  `Description` varchar(100) NOT NULL DEFAULT '',
  `NoOfAds` int(5) NOT NULL DEFAULT '0',
  `Urdl` tinyint(1) NOT NULL DEFAULT '0',
  `Amount` float(10,2) NOT NULL DEFAULT '0.00',
  `HostType` varchar(50) NOT NULL DEFAULT '',
  `StartDate` date NOT NULL DEFAULT '0000-00-00',
  `Status` char(1) NOT NULL DEFAULT '',
  `Walkin` int(4) NOT NULL DEFAULT '1',
  `ProductId` varchar(50) NOT NULL DEFAULT '',
  `TempStaffing` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM AUTO_INCREMENT=1494 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plan_sms`
--

CREATE TABLE `plan_sms` (
  `Id` bigint(7) NOT NULL,
  `MasterPlanId` bigint(11) NOT NULL DEFAULT '0',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `SmsCount` bigint(11) NOT NULL DEFAULT '0',
  `InvoiceNo` varchar(50) NOT NULL DEFAULT '',
  `RecieptNo` bigint(7) NOT NULL DEFAULT '0',
  `InvoiceDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Amount` float(10,2) NOT NULL DEFAULT '0.00',
  `DiscountRate` float(4,2) DEFAULT '0.00',
  `SalesTax` float(4,2) NOT NULL DEFAULT '0.00',
  `Tds` float(6,2) NOT NULL DEFAULT '0.00',
  `TotalAmount` float(10,2) NOT NULL DEFAULT '0.00',
  `Branch` varchar(60) NOT NULL DEFAULT '',
  `SalesIncharge` varchar(60) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `AccNo` bigint(7) NOT NULL DEFAULT '0',
  `PlanType` varchar(30) NOT NULL DEFAULT '',
  `HostType` varchar(50) NOT NULL DEFAULT '',
  `Remarks` varchar(150) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=7446 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prev_employer`
--

CREATE TABLE `prev_employer` (
  `Id` int(10) NOT NULL,
  `CompanyName` varchar(150) NOT NULL DEFAULT '',
  `Designation` varchar(150) NOT NULL DEFAULT '',
  `FrmMonth` tinyint(2) NOT NULL,
  `FrmYear` int(4) NOT NULL,
  `ToMonth` tinyint(2) NOT NULL,
  `ToYear` int(4) NOT NULL,
  `JobProfile` text NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `ResumeId` tinyint(2) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=149578 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prev_employer_duplicate`
--

CREATE TABLE `prev_employer_duplicate` (
  `Id` int(10) NOT NULL,
  `CompanyName` varchar(150) NOT NULL DEFAULT '',
  `Designation` varchar(150) NOT NULL DEFAULT '',
  `FrmMonth` tinyint(2) NOT NULL,
  `FrmYear` int(4) NOT NULL,
  `ToMonth` tinyint(2) NOT NULL,
  `ToYear` int(4) NOT NULL,
  `JobProfile` text NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `ResumeId` tinyint(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recommendation`
--

CREATE TABLE `recommendation` (
  `JobSeekerId` varchar(50) NOT NULL DEFAULT '',
  `ResumeId` int(11) NOT NULL DEFAULT '0',
  `RecommendId` bigint(20) NOT NULL,
  `Rec_Name` varchar(50) NOT NULL DEFAULT '',
  `Rec_Email` varchar(50) NOT NULL DEFAULT '',
  `RequestDate` date NOT NULL DEFAULT '0000-00-00',
  `Subject` tinytext NOT NULL,
  `Comments` text NOT NULL,
  `ReplyDate` date NOT NULL DEFAULT '0000-00-00',
  `ShowFlag` char(1) NOT NULL DEFAULT '',
  `Re_RequestDate` date NOT NULL DEFAULT '0000-00-00',
  `Re_ReplyDate` date NOT NULL DEFAULT '0000-00-00',
  `Relationship` varchar(50) NOT NULL DEFAULT '',
  `Relationship_Period` varchar(50) NOT NULL DEFAULT '',
  `Exp_Id` bigint(20) NOT NULL DEFAULT '0',
  `Request` text NOT NULL,
  `Curr_Employer` varchar(150) NOT NULL DEFAULT '',
  `Curr_Jobtitle` varchar(150) NOT NULL DEFAULT '',
  `Contact_No` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=134802 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registration_details`
--

CREATE TABLE `registration_details` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `RefPage` varchar(300) NOT NULL DEFAULT '',
  `RegDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Ip_Addr` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `RegFrom` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `release_order`
--

CREATE TABLE `release_order` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(25) NOT NULL DEFAULT '',
  `ro_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publisher` varchar(50) NOT NULL DEFAULT '',
  `website` varchar(50) NOT NULL DEFAULT '',
  `contact_name` varchar(40) NOT NULL DEFAULT '',
  `contact_number` varchar(25) NOT NULL DEFAULT '',
  `contact_email` varchar(80) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `agency` varchar(40) NOT NULL DEFAULT '',
  `client` varchar(50) NOT NULL DEFAULT '',
  `agent_name` varchar(40) NOT NULL DEFAULT '',
  `agent_number` varchar(25) NOT NULL DEFAULT '',
  `agent_email` varchar(80) NOT NULL DEFAULT '',
  `agent_address` text NOT NULL,
  `campaign_name` varchar(40) NOT NULL DEFAULT '',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `amount` float(10,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) NOT NULL DEFAULT '',
  `discount_value` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` float(10,2) NOT NULL DEFAULT '0.00',
  `other_instruction` text NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `is_cancel` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `release_order_details`
--

CREATE TABLE `release_order_details` (
  `id` int(11) NOT NULL,
  `release_order_id` int(11) NOT NULL DEFAULT '0',
  `particulars` varchar(50) NOT NULL DEFAULT '',
  `ro_type` varchar(30) NOT NULL DEFAULT '',
  `campaign_type` varchar(30) NOT NULL DEFAULT '',
  `quantity` varchar(30) NOT NULL DEFAULT '',
  `rate` varchar(20) NOT NULL DEFAULT '',
  `gross_cost` int(11) NOT NULL DEFAULT '0',
  `invoice_number` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reminder`
--

CREATE TABLE `reminder` (
  `RemId` bigint(20) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `SubUserId` varchar(50) NOT NULL DEFAULT '',
  `Title` varchar(30) NOT NULL DEFAULT '',
  `Message` text NOT NULL,
  `RemindDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reminder_invitation_count`
--

CREATE TABLE `reminder_invitation_count` (
  `reminder_id` int(11) NOT NULL,
  `reminder_date` date NOT NULL DEFAULT '0000-00-00',
  `mail_sent_count` int(11) NOT NULL DEFAULT '0',
  `bounce_count` int(11) NOT NULL DEFAULT '0',
  `mxrecord_failed_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=355 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rep_js_master`
--

CREATE TABLE `rep_js_master` (
  `JsTotal` int(11) NOT NULL DEFAULT '0',
  `JsMale` int(11) NOT NULL DEFAULT '0',
  `JsFemale` int(11) NOT NULL DEFAULT '0',
  `Age` varchar(255) NOT NULL DEFAULT '',
  `Education` blob NOT NULL,
  `Experience` blob NOT NULL,
  `Salary` blob NOT NULL,
  `Industry` blob NOT NULL,
  `FunctionalArea` blob NOT NULL,
  `JobRole` blob NOT NULL,
  `Country` blob NOT NULL,
  `City` blob NOT NULL,
  `DateAdded` date NOT NULL DEFAULT '0000-00-00',
  `DateModified` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rep_online_stat`
--

CREATE TABLE `rep_online_stat` (
  `Id` int(11) unsigned NOT NULL,
  `SearchTime` date NOT NULL DEFAULT '0000-00-00',
  `EmpReg` int(11) unsigned NOT NULL DEFAULT '0',
  `PlanPurchased` int(11) unsigned NOT NULL DEFAULT '0',
  `JobPost` int(11) unsigned NOT NULL DEFAULT '0',
  `JsReg` int(11) unsigned NOT NULL DEFAULT '0',
  `ActiveJsReg` int(11) NOT NULL DEFAULT '0',
  `Mobile_Verify` int(11) NOT NULL DEFAULT '0',
  `NonMemberReg` int(11) unsigned NOT NULL DEFAULT '0',
  `MemberReg` int(11) unsigned NOT NULL DEFAULT '0',
  `PaidClients` int(11) unsigned NOT NULL DEFAULT '0',
  `NonPaidClients` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=4154 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rep_online_stat_old`
--

CREATE TABLE `rep_online_stat_old` (
  `Id` int(10) unsigned NOT NULL,
  `SearchTime` varchar(255) NOT NULL DEFAULT '',
  `EmpReg` int(10) unsigned NOT NULL DEFAULT '0',
  `PlanPurchased` int(10) unsigned NOT NULL DEFAULT '0',
  `JobPost` int(10) unsigned NOT NULL DEFAULT '0',
  `JsReg` int(10) unsigned NOT NULL DEFAULT '0',
  `ActiveJsReg` int(10) NOT NULL DEFAULT '0',
  `Mobile_Verify` int(10) NOT NULL DEFAULT '0',
  `NonMemberReg` int(10) unsigned NOT NULL DEFAULT '0',
  `MemberReg` int(10) unsigned NOT NULL DEFAULT '0',
  `PaidClients` int(10) unsigned NOT NULL DEFAULT '0',
  `NonPaidClients` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=1756 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resumeassessment`
--

CREATE TABLE `resumeassessment` (
  `Id` bigint(6) NOT NULL,
  `Xml` mediumblob NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Type` varchar(30) NOT NULL DEFAULT '',
  `Status` varchar(12) NOT NULL DEFAULT 'pending'
) ENGINE=MyISAM AUTO_INCREMENT=16330 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resumelock`
--

CREATE TABLE `resumelock` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `CseId` varchar(50) NOT NULL DEFAULT '',
  `TimeEntered` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resumevalidate`
--

CREATE TABLE `resumevalidate` (
  `CsIdentity` varchar(50) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` char(1) NOT NULL DEFAULT '',
  `Reasons` varchar(255) NOT NULL DEFAULT '',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `ResumeId` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resume_assessment_remark`
--

CREATE TABLE `resume_assessment_remark` (
  `remark_id` int(11) NOT NULL,
  `remark` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resume_assessment_report`
--

CREATE TABLE `resume_assessment_report` (
  `report_id` int(11) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `OrderId` varchar(30) NOT NULL DEFAULT '',
  `format_score` tinyint(4) NOT NULL DEFAULT '1',
  `format_remarks` text NOT NULL,
  `presentation_score` tinyint(4) NOT NULL DEFAULT '1',
  `presentation_remarks` text NOT NULL,
  `content_score` tinyint(4) NOT NULL DEFAULT '1',
  `content_remarks` text NOT NULL,
  `relevence_score` tinyint(4) NOT NULL DEFAULT '1',
  `relevence_remarks` text NOT NULL,
  `density_score` tinyint(4) NOT NULL DEFAULT '1',
  `density_remarks` text NOT NULL,
  `info_score` tinyint(4) NOT NULL DEFAULT '1',
  `info_remarks` text NOT NULL,
  `lang_score` tinyint(4) NOT NULL DEFAULT '1',
  `lang_remarks` text NOT NULL,
  `clarity_score` tinyint(4) NOT NULL DEFAULT '1',
  `clarity_remarks` text NOT NULL,
  `order_score` tinyint(4) NOT NULL DEFAULT '1',
  `order_remarks` text NOT NULL,
  `approach_score` tinyint(4) NOT NULL DEFAULT '1',
  `approach_remarks` text NOT NULL,
  `Status` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resume_cart`
--

CREATE TABLE `resume_cart` (
  `cartId` int(11) NOT NULL,
  `orderId` varchar(20) NOT NULL,
  `userId` varchar(40) DEFAULT '0',
  `serviceId` int(11) DEFAULT NULL,
  `serviceOptionId` int(11) DEFAULT NULL,
  `response` varchar(250) NOT NULL,
  `responseText` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resume_cart`
--

INSERT INTO `resume_cart` (`cartId`, `orderId`, `userId`, `serviceId`, `serviceOptionId`, `response`, `responseText`, `status`, `dateAdded`) VALUES
(65, 'J2N5840c7ebebc61', 'nav280720_2', 5, 14, 'Looks like you cancelled the payment. You can try again now by adding money in your wallet or choose another payment method. If you faced any issues in completing the payment, please contact us', '{"RESPCODE":"14113","RESPMSG":"Looks like you cancelled the payment. You can try again now by adding money in your wallet or choose another payment method. If you faced any issues in completing the payment, please contact us","STATUS":"TXN_FAILURE","MID":', 2, '2016-11-26 06:48:03'),
(79, 'J2N5840c7ebebc61', 'nav280720_2', 5, 11, 'Looks like you cancelled the payment. You can try again now by adding money in your wallet or choose another payment method. If you faced any issues in completing the payment, please contact us', '{"RESPCODE":"14113","RESPMSG":"Looks like you cancelled the payment. You can try again now by adding money in your wallet or choose another payment method. If you faced any issues in completing the payment, please contact us","STATUS":"TXN_FAILURE","MID":', 2, '2016-11-29 10:06:20'),
(94, '', 'nav280720_2', 4, 10, '', '', 0, '2016-12-03 12:23:07'),
(95, '', 'nav280720_2', 4, 8, '', '', 0, '2016-12-03 12:25:08'),
(96, '', 'nav280720_2', 5, 13, '', '', 0, '2016-12-03 12:25:12'),
(97, '', 'nav280720_2', 7, 16, '', '', 0, '2016-12-03 12:25:16'),
(98, '', 'nav280720_2', 10, 21, '', '', 0, '2016-12-03 12:25:20'),
(99, '', 'nav280720_2', 7, 17, '', '', 0, '2016-12-03 12:25:25');

-- --------------------------------------------------------

--
-- Table structure for table `res_feat`
--

CREATE TABLE `res_feat` (
  `Feat_Id` int(4) NOT NULL,
  `Feat_Desc` varchar(255) NOT NULL DEFAULT '',
  `Feat_Desc_Details` text NOT NULL,
  `AddedDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Disp_Order` int(4) NOT NULL DEFAULT '0',
  `Ver_Disp_Order` int(4) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT 'A'
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `res_pack`
--

CREATE TABLE `res_pack` (
  `Pack_Id` int(4) NOT NULL,
  `Pack_Name` varchar(50) NOT NULL DEFAULT '',
  `Pack_Desc` varchar(100) NOT NULL DEFAULT '',
  `AddedDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Active_Flag` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM AUTO_INCREMENT=243 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `res_pack_feat`
--

CREATE TABLE `res_pack_feat` (
  `Res_Pack_Id` int(4) NOT NULL,
  `Pack_Id` int(4) NOT NULL DEFAULT '0',
  `Feat_Id` int(4) NOT NULL DEFAULT '0',
  `Price` float(10,2) NOT NULL DEFAULT '0.00',
  `Discount` float(10,2) NOT NULL DEFAULT '0.00',
  `Disc_Price` float(10,2) NOT NULL DEFAULT '0.00',
  `process_date` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `res_pack_feat_diwali_offer`
--

CREATE TABLE `res_pack_feat_diwali_offer` (
  `Res_Pack_Id` int(4) NOT NULL,
  `Pack_Id` int(4) NOT NULL DEFAULT '0',
  `Feat_Id` int(4) NOT NULL DEFAULT '0',
  `Price` float(10,2) NOT NULL DEFAULT '0.00',
  `Discount` float(10,2) NOT NULL DEFAULT '0.00',
  `Disc_Price` float(10,2) NOT NULL DEFAULT '0.00',
  `process_date` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `res_pack_feat_yearendsale2010`
--

CREATE TABLE `res_pack_feat_yearendsale2010` (
  `Res_Pack_Id` int(4) NOT NULL,
  `Pack_Id` int(4) NOT NULL DEFAULT '0',
  `Feat_Id` int(4) NOT NULL DEFAULT '0',
  `Price` float(10,2) NOT NULL DEFAULT '0.00',
  `Discount` float(10,2) NOT NULL DEFAULT '0.00',
  `Disc_Price` float(10,2) NOT NULL DEFAULT '0.00',
  `process_date` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `res_special_pack`
--

CREATE TABLE `res_special_pack` (
  `sub_pack_id` int(4) NOT NULL,
  `pack_id` int(4) NOT NULL DEFAULT '0',
  `feat_id` int(4) NOT NULL DEFAULT '0',
  `res_pack_id` int(4) NOT NULL DEFAULT '0',
  `sub_pack_name` varchar(100) NOT NULL DEFAULT '',
  `sub_pack_desc` text NOT NULL,
  `sub_pack_price` float(10,2) NOT NULL DEFAULT '0.00',
  `sub_pack_disc_price` float(10,2) NOT NULL DEFAULT '0.00',
  `status` char(1) NOT NULL DEFAULT 'A'
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RG_MAILER`
--

CREATE TABLE `RG_MAILER` (
  `Jobseeker_Id` varchar(50) NOT NULL,
  `Employer_Id` varchar(50) NOT NULL,
  `JsCnt` bigint(21) NOT NULL DEFAULT '0',
  `EmpCnt` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary_cmp_det`
--

CREATE TABLE `salary_cmp_det` (
  `CmpId` int(11) NOT NULL,
  `CmpCode` varchar(6) NOT NULL,
  `CmpName` varchar(150) NOT NULL DEFAULT '',
  `Founded` year(4) NOT NULL DEFAULT '0000',
  `Type` varchar(20) NOT NULL DEFAULT '0',
  `Website` varchar(100) NOT NULL DEFAULT '',
  `Industry` varchar(60) NOT NULL DEFAULT '',
  `Headquarters` varchar(200) NOT NULL DEFAULT '',
  `NumEmployees` varchar(60) NOT NULL DEFAULT '',
  `Revenues` varchar(60) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=507 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary_graph`
--

CREATE TABLE `salary_graph` (
  `Id` int(10) NOT NULL,
  `CmpCode` varchar(11) NOT NULL DEFAULT '',
  `Cur_Desg` varchar(150) NOT NULL DEFAULT '',
  `Cur_Salary` float(5,2) NOT NULL DEFAULT '0.00',
  `UserId` varchar(20) NOT NULL DEFAULT '',
  `Resume_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Jobr_Code` int(6) NOT NULL DEFAULT '0',
  `Func_Code` int(6) NOT NULL DEFAULT '0',
  `CmpDate` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary_graph_old`
--

CREATE TABLE `salary_graph_old` (
  `Id` int(10) NOT NULL,
  `CmpCode` varchar(11) NOT NULL DEFAULT '',
  `Cur_Desg` varchar(150) NOT NULL DEFAULT '',
  `Cur_Salary` float(5,2) NOT NULL DEFAULT '0.00',
  `UserId` varchar(20) NOT NULL DEFAULT '',
  `Resume_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Jobr_Code` int(6) NOT NULL DEFAULT '0',
  `Func_Code` int(6) NOT NULL DEFAULT '0',
  `CmpDate` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary_graph_populate`
--

CREATE TABLE `salary_graph_populate` (
  `UserId` varchar(20) NOT NULL DEFAULT '',
  `Resume_Id` tinyint(4) NOT NULL DEFAULT '0',
  `Jobr_Code` int(6) NOT NULL DEFAULT '0',
  `Func_Code` int(6) NOT NULL DEFAULT '0',
  `CmpCode` varchar(11) NOT NULL DEFAULT '',
  `Cur_Emp` varchar(150) NOT NULL DEFAULT '',
  `Cur_Desg` varchar(150) NOT NULL DEFAULT '',
  `Cur_Salary` float(5,2) NOT NULL DEFAULT '0.00',
  `CmpDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salesincharge`
--

CREATE TABLE `salesincharge` (
  `SalesInchargeId` bigint(7) NOT NULL,
  `SalesInchargeName` varchar(50) NOT NULL DEFAULT '',
  `BranchId` bigint(7) NOT NULL DEFAULT '0',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SearchEditFields`
--

CREATE TABLE `SearchEditFields` (
  `userid` varchar(50) NOT NULL DEFAULT '',
  `subuserid` varchar(50) NOT NULL DEFAULT '',
  `keywords` tinyint(1) NOT NULL DEFAULT '1',
  `experience` tinyint(1) NOT NULL DEFAULT '1',
  `location` tinyint(1) NOT NULL DEFAULT '1',
  `industry` tinyint(1) NOT NULL DEFAULT '1',
  `functional` tinyint(1) NOT NULL DEFAULT '1',
  `jobrole` tinyint(1) NOT NULL DEFAULT '1',
  `careerlevel` tinyint(1) NOT NULL DEFAULT '1',
  `qualification` tinyint(1) NOT NULL DEFAULT '1',
  `specialization` tinyint(1) NOT NULL DEFAULT '1',
  `certification` tinyint(1) NOT NULL DEFAULT '1',
  `institution` tinyint(1) NOT NULL DEFAULT '1',
  `employer` tinyint(1) NOT NULL DEFAULT '1',
  `salary` tinyint(1) NOT NULL DEFAULT '1',
  `emptype` tinyint(1) NOT NULL DEFAULT '1',
  `empstatus` tinyint(1) NOT NULL DEFAULT '1',
  `languages` tinyint(1) NOT NULL DEFAULT '1',
  `gender` tinyint(1) NOT NULL DEFAULT '1',
  `datemodified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `secondary_email`
--

CREATE TABLE `secondary_email` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `Verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-EMAIL NOT VERIFIED,1-EMAIL VERIFIED',
  `EmailCode` varchar(7) NOT NULL DEFAULT '',
  `PrimaryEmail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-NOT PRIMARY EMAIL ,1-PRIMARY EMAIL',
  `AddedFrom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1- ADDED AS SECONDARY EMAIL WHILE ACCEPTING INVITATION ,2-ADDED AS SECONDARY EMAIL FROM MANGING SECONDARY EMAIL PAGE, 3-ADDED AS SECONDARY EMAIL FROM RESUME SERVICES',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateVerified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2920613 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `secondary_email_archive`
--

CREATE TABLE `secondary_email_archive` (
  `Id` bigint(10) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Email` varchar(60) NOT NULL DEFAULT '',
  `DateDeleted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=71067 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `serviceId` int(11) NOT NULL,
  `serviceTitle` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `price` int(11) DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`serviceId`, `serviceTitle`, `content`, `price`, `status`, `dateAdded`) VALUES
(1, 'Job Search Assistant', '				<div class="row post-box box-1">\r\n    <div class="col-md-12 min-height-400">\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">Job Search Assistant where we go extra mile for candidates) service works as your personal Relationship Manager providing <br><br>\r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">Tailored value addition at every step of your job seeking - right from Job Search, profile optimization to company research. <br><br>\r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">Job Search Management is equipped to efficiently manage your job hunt so that you reach your career goals effortlessly.<br><br>\r\n\r\n            <strong>Our team of experienced professionals who come from HR/ Recruitment background works as your Relationship Manager.</strong><br>\r\n        </p><ul style="font-size:15px; line-height:30px;">\r\n            <li style="list-style:disc;">The Relationship Manager working with you who will have interactions with you in span of 6 months to start your job search.</li>\r\n            <li style="list-style:disc;">The Relationship Manager search for the relevant and matching job vacancies using your profile details, preferences and on the basis of market availability.</li>\r\n            <li style="list-style:disc;">The Relationship Manager will submit applications on your behalf, once you approve the job which has been searched by him/her and your  Relationship Manager will also  provides the Company Profile details to you  on the basis of availability</li>\r\n        </ul><br><br>\r\n        Personal Relationship Manager will get in touch with you within 48 to 72 Business working hours of Order Activation. Relationship <br><br>\r\n        Manager will take your profile information and job preferences details in order to initiate your Job Search Assistant Services.\r\n\r\n\r\n\r\n        <br><br>\r\n        <strong>Service charges: - Rs 11000/- INR </strong><br><br>\r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>', 0, 1, '2016-06-11 11:31:13'),
(2, 'Profile Highlighter', '<div class="row post-box box-1">\r\n    <div class="col-md-12 min-height-400">\r\n       \r\n        <strong>Get Enhanced visibility for your profile among recruiters on <a href="#">Jobstonaukri.com</a></strong><br><br>\r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	"> Get more visibility in a recruiter search and stand a better chance of catching their attention amongst millions of candidate profiles on <a href="#">Jobstonaukri.com</a> with this premium service.<br><br>\r\n\r\n            <strong>Benefits</strong><br>\r\n        </p><ul style="font-size:15px; line-height:30px;">\r\n            <li style="list-style:disc;">Get your profile highlighted amongst the recruiter search results.</li>\r\n            <li style="list-style:disc;">Differentiate your profile from the rest of candidate listings.</li>\r\n        </ul>\r\n        <br><br>\r\n        <strong>Service charges: - Rs 1000/- INR for 1year.</strong><br><br>\r\n        <strong>Service charges: - Rs 1500/- INR for 2year.</strong><br><br>\r\n        <strong>Service charges: - Rs 2000/- INR for 3year.</strong><br><br>\r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n        <br>\r\n\r\n        <center>\r\n            <site bottom_banners="">\r\n            </site></center>\r\n    </div>\r\n\r\n   \r\n    <div class="clearfix"></div>\r\n</div>', 0, 1, '2016-06-12 22:50:06'),
(3, 'Resume Blast', '<div class="row post-box box-1">\r\n    <div class="col-md-8 min-height-400">\r\n        <h3 class="bottom-margin-5">Resume Blast</h3><br>\r\n        <strong>Increase Your Reach amongst Job Consultants in India or Gulf</strong><br><br>\r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	"> Resume Blast India or Gulf is a resume distribution service that helps you get noticed by job consultants and recruiters, registered on <a href="#">jobstonaukri.com</a>. Your Resume gets published across the India + Gulf. <br><br>\r\n\r\n            <strong>Key Features</strong><br>\r\n        </p><ul style="font-size:15px; line-height:30px;">\r\n            <li style="list-style:disc;">In <strong>Resume Blast</strong> your profile and Resume will be <strong>email to relevant top consultants.</strong> Once the consultant''s requirements are found relevant to your profile, your resume is emailed to these consultants within Three Business of service activation. This relevance is the based on your Functional Area, Location, and Work experience that you specify at the time of placing your order.</li>\r\n        </ul>\r\n        <br><br>\r\n        <strong>Service charges: - For India: - 1900/-INR   OR   Amount for Gulf: - 1350/- INR   </strong><br><br>\r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n        <br>\r\n\r\n        <center>\r\n            <site bottom_banners="">\r\n            </site></center>\r\n    </div>\r\n\r\n    \r\n</div>', 0, 1, '2016-06-22 07:55:06'),
(4, 'Resume Writing India', '<div class="row post-box box-1">\r\n    <div class="col-md-12 min-height-400">\r\n       \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">An experienced professional resume writer will develop your resume that will highlight your achievements, strengths, elaborate work experiences, key responsibilities, loaded with industry keywords and describe your job profile to employers/ recruiters, so that you get maximum responses for your profile.<br><br>\r\n\r\n            The professional resume writer conducts an in-depth analysis of your resume. The writer will contact you to get information on your desired job profile, target area, projects undertaken and achievements. In case you want to provide additional information to us; you can also get in touch with the writer directly or send across a mail to <a href="#">support@jobstonaukri.com</a>\r\n\r\n            <br><br>\r\n            The expert Resume writer develops a revised and professionally formatted resume according to industry standards. The first developed draft of your resume will be sent to you for your approval and feedback. In case you require any further modification, alteration in your first draft you can contact the writer or send mail to <a href="#">support@jobstonaukri.com</a>\r\n\r\n            <br><br>\r\n            Once you approve the developed resume we send you the final resume to your email id.\r\n\r\n            <br><br>\r\n            Your resume writing process starts only after we receive your payment and updated resume. Once the process starts, the time taken for us to send you the first draft is as per the services you have availed. If we receive your approval, we send you the final resume on your email id. In case of changes, the changes will be incorporated and final draft will be sent to you for approval. The changing/ development process of your resumes continues until you get a resume that you are completely satisfied with. The delivery time for various services is as below:\r\n\r\n            <br><br>\r\n        </p><ul style="font-size:15px; line-height:30	px;">\r\n            <li style="list-style:disc;">Express Resume Writing - 48 working hours (1000 /- INR)</li>\r\n            <li style="list-style:disc;">Resume Writing without any express add-on - 5 working days</li>\r\n            <li style="list-style:disc;">Service charges: - as per candidate work experience</li>\r\n        </ul>\r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n        <br>\r\n\r\n        \r\n</div>\r\n</div>\r\n    ', 0, 1, '2016-06-22 08:26:04'),
(5, 'Resume Writing International', '<div class="row post-box box-1">\r\n    <div class="col-md-12 min-height-400">\r\n        <h3 class="bottom-margin-5">Resume Writing International</h3><br>\r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">An experienced professional resume writer will develop your resume that will highlight your achievements, strengths, elaborate work experiences, key responsibilities, loaded with industry keywords and describe your job profile to employers/ recruiters, so that you get maximum responses for your profile.<br><br>\r\n\r\n            The professional resume writer conducts an in-depth analysis of your resume. The writer will contact you to get information on your desired job profile, target area, projects undertaken and achievements. In case you want to provide additional information to us; you can also get in touch with the writer directly or send across a mail to <a href="#">support@jobstonaukri.com</a>\r\n\r\n            <br><br>\r\n            The expert Resume writer develops a revised and professionally formatted resume according to industry standards. The first developed draft of your resume will be sent to you for your approval and feedback. In case you require any further modification, alteration in your first draft you can contact the writer or send mail to <a href="#">support@jobstonaukri.com</a>\r\n\r\n            <br><br>\r\n            Once you approve the developed resume we send you the final resume to your email id.\r\n\r\n            <br><br>\r\n            Your resume writing process starts only after we receive your payment and updated resume. Once the process starts, the time taken for us to send you the first draft is as per the services you have availed. If we receive your approval, we send you the final resume on your email id. In case of changes, the changes will be incorporated and final draft will be sent to you for approval. The changing/ development process of your resumes continues until you get a resume that you are completely satisfied with. The delivery time for various services is as below:\r\n\r\n            <br><br>\r\n        </p><ul style="font-size:15px; line-height:30	px;">\r\n            <li style="list-style:disc;">Express Resume Writing - 48 working hours (1000 /- INR)</li>\r\n            <li style="list-style:disc;">Resume Writing without any express add-on - 5 working days</li>\r\n            <li style="list-style:disc;">Service charges: - as pr candidate work experience</li>\r\n        </ul>\r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n     \r\n    </div>\r\n    </div>\r\n', 0, 1, '2016-06-22 08:34:22'),
(6, 'Social Profile Writing', '<div class="row post-box box-1">\r\n    <div class="col-md-12 min-height-400">\r\n        <h3 class="bottom-margin-5">Social Profile Writing </h3><br>\r\n        <strong>Get a strong professional identity - Online</strong><br><br>\r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">Social Profiler Writing is a personalized social profile writing that gets you noticed by the people who matter and help you take the next step in your career. A professionally created Social Profile allows you to have a professional and polished online presence that serves as a means to share your skills, education and career interests with potential employers.\r\n\r\n\r\n\r\n\r\n            <br><br>\r\n            <strong>Key features</strong><br>\r\n        </p><ul style="font-size:15px; line-height:30px;">\r\n            <li style="list-style:disc;">Detailed telephonic discussion with experts to understand your profile.</li>\r\n            <li style="list-style:disc;">Make a strong impact with a headline, powerful summary and keyword rich profile.</li>\r\n            <li style="list-style:disc;">Showcase your vision, core values and aspirations.</li>\r\n            <li style="list-style:disc;">Be noticed for relevant career opportunities by top recruiters..</li>\r\n        </ul>\r\n        <br><br>\r\n        <strong>Remember - It is different and at times more important than your Resume.</strong><br><br>\r\n\r\n        While resume gives an overview of your work experience and education, your LinkedIn profiles provides a much better overview of your professional identity - both an employee and as an individual. It also ''talks'' to relevant people (and recruiters) about your vision and career goal. It is therefore a more holistic overview of the ''professional'' you.<br><br>\r\n\r\n        Professional social media websites becoming a major and a critical headhunting ground, it''s important to maintain control of your own identity on the social web. The deeper and more in-depth your presence is on social media websites, the easier it is for the ''right professionals'' to find you.\r\n        A strong and accurate social media presence may result in career opportunities coming your way. In a way you are making yourself better visible to companies looking for your kind of profiles to find you, contact you and employ you!<br><br>\r\n\r\n        Social Profiler is a Professional and personalized Social media profile writing service that endeavors to provide you a strong and accurate presence on popular professional Social networking Websites such as LinkedIn.<br><br>\r\n\r\n        Herein we understand your profile, your aspirations and deliver a professional + comprehensive write-up. This is crafted as per your Resume and engaging telephonic discussions conducted by us. Our writers with the right knowledge and know-how of social media and with 10 years of profile writing experience crafts your Social Media Profile\r\n        <br><br>\r\n\r\n        <strong>LinkedIn, Twitter, Facebook, Google+</strong> and are some of the popularly used social networking websites, with <strong>LinkedIn is the largest professional networking website having 187 Million people across the globe including 17+ Million in India. Also more than 2.6 million companies have LinkedIn Company Pages.</strong><br><br>\r\n        <strong>Service charges: - 4700/- INR</strong>\r\n\r\n\r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n        <br>\r\n\r\n        <center>\r\n            <site bottom_banners="">\r\n            </site></center>\r\n    </div>\r\n\r\n  \r\n</div>', 0, 1, '2016-06-22 08:41:12'),
(7, 'Visual Resume', '<div class="row post-box box-1">\r\n    <div class="col-md-12 min-height-400">\r\n        \r\n        <strong>Upgrade to Visual Resume to Showcase the Best of You</strong><br><br>\r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	"> Attract more recruiters with your Resume by improving the way it represents you. Visual Resume Premium will deliver:<br><br>\r\n\r\n            1.	<strong>Visual Resume -</strong> A High Impact Resume with relevant images supporting your Resume that enhances the appeal of ‘You’ and help you gain a competitive edge.<br><br>\r\n\r\n            2.	<strong>Visual Resume -</strong> The most sought after Professional Resume designed by our team of Resume Experts preferred by many Recruiters.<br><br>\r\n            <strong>Key Features</strong><br>\r\n        </p><ul style="font-size:15px; line-height:30px;">\r\n            <li style="list-style:disc;">Showcase your skills and achievements with high impact visuals* supporting text details.</li>\r\n            <li style="list-style:disc;">A Professional Resume as per Indian recruitment standards</li>\r\n            <li style="list-style:disc;">Multiple detailed telephonic consultations with Resume Writer</li>\r\n            <li style="list-style:disc;">First draft in delivered in 10 working days.</li>\r\n            <li style="list-style:disc;">Free Cover Letter to highlight your accomplishments and suit your job search</li>\r\n        </ul>\r\n\r\n        <strong>Visuals may include your professional photo, images of awards, certifications, articles, or papers published.</strong><br><br>\r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n        <br>\r\n\r\n        <center>\r\n            <site bottom_banners="">\r\n            </site></center>\r\n    </div>\r\n\r\n</div>', 0, 1, '2016-06-22 08:45:54'),
(8, 'Visual Resume', '<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n        \r\n        <strong>Upgrade to Visual Resume to Showcase the Best of You</strong><br><br>\r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	"> Attract more recruiters with your Resume by improving the way it represents you. Visual Resume Premium will deliver:<br><br>\r\n\r\n            1.	<strong>Visual Resume -</strong> A High Impact Resume with relevant images supporting your Resume that enhances the appeal of ‘You’ and help you gain a competitive edge.<br><br>\r\n\r\n            2.	<strong>Visual Resume -</strong> The most sought after Professional Resume designed by our team of Resume Experts preferred by many Recruiters.<br><br>\r\n            <strong>Key Features</strong><br>\r\n        </p><ul style="font-size:15px; line-height:30px;">\r\n            <li style="list-style:disc;">Showcase your skills and achievements with high impact visuals* supporting text details.</li>\r\n            <li style="list-style:disc;">A Professional Resume as per Indian recruitment standards</li>\r\n            <li style="list-style:disc;">Multiple detailed telephonic consultations with Resume Writer</li>\r\n            <li style="list-style:disc;">First draft in delivered in 10 working days.</li>\r\n            <li style="list-style:disc;">Free Cover Letter to highlight your accomplishments and suit your job search</li>\r\n        </ul>\r\n\r\n        <strong>Visuals may include your professional photo, images of awards, certifications, articles, or papers published.</strong><br><br>\r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n        <br>\r\n\r\n        <center>\r\n            <site bottom_banners="">\r\n            </site></center>\r\n    </div>\r\n\r\n</div>', 0, 1, '2016-06-22 08:46:21'),
(9, 'Resume Broadcast India', '<div class="row post-box box-1">\r\n<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">In today''s fast paced world being instantly accesible to the recruiters indeed has its advantages.   <br><br>\r\n        \r\n        Since whenever a new vacancy arises recruiters would prefer to search through their own database of qualified jobseekers first before decide to start looking elsewhere \r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">Moreover, most often than not, being called for an interview largely depends on being accessible at the right place and time. With thousands of recruiters looking to fill a vacant position everyday, it can sometimes be just a matter of availability that can get you your ideal job. Yet individually circulating your resume amongst all the top recruiters who might be looking for candidates with your core expertise can be next to impossible since it involves too much of manual effort.\r\n <br><br>\r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">Designed to effectively meet this exacting need of jobseekers, our Resume Broadcast service strives to furnish you with multiple customizable options wherein you are given ample freedom to choose your elite set of recruiters whom you feel can assist you to land your perfect opportunity. With recruiters spanning diverse industries and locations you can now pick out the ones who match your criteria and be hired in the shortest possible time.<br><br>\r\n\r\n           \r\n\r\n\r\n\r\n        <br><br>\r\n        \r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>\r\n</div>', 2699, 1, '2016-10-06 00:14:23'),
(10, 'Resume Broadcast Gulf', '<div class="row post-box box-1">\r\n<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">In today''s fast paced world being instantly accesible to the recruiters indeed has its advantages.   <br><br>\r\n        \r\n        Since whenever a new vacancy arises recruiters would prefer to search through their own database of qualified jobseekers first before decide to start looking elsewhere \r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">Moreover, most often than not, being called for an interview largely depends on being accessible at the right place and time. With thousands of recruiters looking to fill a vacant position everyday, it can sometimes be just a matter of availability that can get you your ideal job. Yet individually circulating your resume amongst all the top recruiters who might be looking for candidates with your core expertise can be next to impossible since it involves too much of manual effort.\r\n <br><br>\r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">Designed to effectively meet this exacting need of jobseekers, our Resume Broadcast service strives to furnish you with multiple customizable options wherein you are given ample freedom to choose your elite set of recruiters whom you feel can assist you to land your perfect opportunity. With recruiters spanning diverse industries and locations you can now pick out the ones who match your criteria and be hired in the shortest possible time.<br><br>\r\n\r\n           \r\n\r\n\r\n\r\n        <br><br>\r\n        \r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>\r\n</div>', 2699, 1, '2016-10-06 00:14:23'),
(11, 'Resume Broadcast Combo', '<div class="row post-box box-1">\r\n<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">In today''s fast paced world being instantly accesible to the recruiters indeed has its advantages.   <br><br>\r\n        \r\n        Since whenever a new vacancy arises recruiters would prefer to search through their own database of qualified jobseekers first before decide to start looking elsewhere \r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">Moreover, most often than not, being called for an interview largely depends on being accessible at the right place and time. With thousands of recruiters looking to fill a vacant position everyday, it can sometimes be just a matter of availability that can get you your ideal job. Yet individually circulating your resume amongst all the top recruiters who might be looking for candidates with your core expertise can be next to impossible since it involves too much of manual effort.\r\n <br><br>\r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">Designed to effectively meet this exacting need of jobseekers, our Resume Broadcast service strives to furnish you with multiple customizable options wherein you are given ample freedom to choose your elite set of recruiters whom you feel can assist you to land your perfect opportunity. With recruiters spanning diverse industries and locations you can now pick out the ones who match your criteria and be hired in the shortest possible time.<br><br>\r\n\r\n           \r\n\r\n\r\n\r\n        <br><br>\r\n        \r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>\r\n</div>', 2699, 1, '2016-10-06 00:14:23'),
(12, 'Gold Platinum Plan', '<div class="row post-box box-1">\r\n<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">To be called for an interview it is the first important to be instantly viable in a large database of equally qualified jobseekers and drawing attention to your resume  depends not only expertise and experience  but also on being clearly noticeable   <br><br>\r\n        \r\n        Moreover, most often than not, being called for an interview largely depends on being accessible at the right place and time. With thousands of recruiters looking to fill a vacant position everyday, it can sometimes be just a matter of availability that can get you your ideal job.<br><br>\r\nWe have the assistance for you in which the resume counsellor enhance your profile and the job search advisor provide you the greater visibilty and support. Our team will support you to get the relevant jobs according to your qualification as well as your work experience .\r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n        We have the assistance for you in which the Job Search Advisor provide you the greater visibility and\r\n\r\nsupport. Our team will support you to get the relevant job References according to your qualification as well\r\n\r\nas your work experience.<br><br>\r\n        \r\n        <ol>\r\n        <li> <strong> Gold Plan (Valid from 2 months)</strong></li>\r\n        \r\n        <li> 1.) The Relationship Manager search for the relevant and matching job vacancies using your profile details.</li>\r\n        <li> 2.) Our Team will share the complete job description as well as Recruiter Contact with you through Email Id.<br> <br></li>\r\n        \r\n        \r\n        <li> <strong>Platinum Plan (Valid for 4 months)</strong> </li>\r\n\r\n		<li>1.) The Relationship Manager search for the relevant and matching job vacancies using your profile details.</li>\r\n		<li>2.) Our Team will share the complete job description as well as Recruiter Contact with you through Email Id.</li>\r\n		<li>3.) You need to apply all the References.</li>\r\n\r\n        \r\n        </ol>\r\n        \r\n        <br><br>\r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">Designed to effectively meet this exacting need of jobseekers, our Resume Broadcast service strives to furnish you with multiple customizable options wherein you are given ample freedom to choose your elite set of recruiters whom you feel can assist you to land your perfect opportunity. With recruiters spanning diverse industries and locations you can now pick out the ones who match your criteria and be hired in the shortest possible time.<br><br>\r\n\r\n           \r\n\r\n\r\n\r\n        <br><br>\r\n        \r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>\r\n</div>', 2699, 1, '2016-10-06 00:14:23'),
(13, 'Live Interview Preparation ', '<div class="row post-box box-1">\r\n<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">Most of the people get nervous with the very thought of an interview. \r\n        You might be having much better things to express, but you might be lacking the skills on how to present it in an impressive way.\r\n         Learn the tips and tricks regarding how to dress, how to prepare your documents, the way you carry your body and how to move around during an interview.\r\n\r\n        </p>\r\n         <p style="text-align:justify; font-size:15px; line-height:25px;	"> \r\n         For many organizations, certain people and communication skills are more important than expertise in the product or industry. The latter can often be taught, but the patience and empathy required to effectively help customers is much, much harder to learn on the job.\r\n\r\n         \r\n         </p>\r\n\r\n         <p style="text-align:justify; font-size:15px; line-height:25px;	"> \r\n\r\nBefore you go to your job interview, it''s a good idea to have a few practice runs so you don''t freeze like a rabbit in the headlights.\r\n\r\nYou could ask your friends to take you through a few questions, or you could take part in our Virtual Job Interview which will let you know whether your answers are on the right track.\r\n\r\nThe through of not getting past this stage weighs heavily on many candidates minds with the main reasons for apprehension being:\r\n\r\n         \r\n         </p>\r\n        \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n        \r\n        \r\n         <p style="text-align:justify; font-size:15px; line-height:25px;	"> \r\n        <ol>\r\n         \r\n        <li> 1) Not knowing what questions are likely to be asked of them. <br></li>\r\n        <li>  2) The dread of being interrogated by strangers who also happen to be professionals in their field.<br></li>\r\n              <li>     3) The uncertainty of how to answer and reply to tough questioning.<br></li>\r\n             <li>    4)	The fear of doing or saying something wrong.<br></li>\r\n\r\n               </ol>  \r\n         </p>\r\n        \r\n\r\n\r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n\r\nBenefits of Live Interview Preparation\r\n\r\n\r\n\r\n\r\n</p>\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n        \r\n        \r\n        <ol>\r\n        	\r\n        	\r\n        <li> 1.)Interactive 1 hour session with an expert.  <br></li>\r\n		\r\n		<li> 2.) Clear all your doubts and queries with the help of experts. <br></li>\r\n\r\n               <li> 3.)  Help reduce stress and anxiety <br></li>\r\n\r\n               <li> 4.) Help boost your confidence.<br></li>\r\n                   <li> 5.) Preparing for behavioral based interview questions. <br></li>\r\n                  <li> 6.)  Familiarizing with the situation <br></li>\r\n\r\n\r\n        </ol>\r\n        \r\n        <br><br>\r\n\r\n        </p>\r\n       \r\n        <br><br>\r\n        \r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>\r\n</div>', 2699, 1, '2016-10-06 00:14:23'),
(14, 'Online Domain', '<div class="row post-box box-1">\r\n<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n    <strong> Get Your Own Domain  </strong>\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">A domain on the Internet is a unique opportunity to be visibly present online. \r\n        Your own domain gives you maximum exposure on the Internet, freedom to design your own website and flexibility when using personal email addresses\r\n        </p>\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n        \r\n        \r\n        <ol>\r\n        	\r\n        	\r\n        	\r\n        	 <li>	Be visible online through a strong online presence <br> <br></li>\r\n			 <li>	Claim your online identity <br> <br></li>\r\n			 <li>  Gives a more professional image.<br> <br></li>\r\n			 <li>  You can keep the name for years to come.<br> <br></li>\r\n             <li> Easier to get your site registered with search engines.<br> <br></li>\r\n             <li> Better position in some search engine listings.<br> <br></li>\r\n 			<li>	Simplicity &#45; your email address would become yourname.in.<br> <br></li>\r\n             <li> Truly promote yourself  don''t spend time advertising word press!<br> <br></li>\r\n           <li> Portability &#45; if you decide to move domain host, you don''t lose your domain name<br> <br></li>\r\n        <li> Easier to remember &#45; people know your name, and so they''ll know where to look for your website<br> <br></li>\r\n\r\n        \r\n\r\n\r\n        </ol>\r\n        \r\n        <br><br>\r\n\r\n        </p>\r\n       \r\n        <br><br>\r\n        \r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>\r\n</div>', 2699, 1, '2016-10-06 00:14:23'),
(15, 'Education Verification', '<div class="row post-box box-1">\r\n<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n    <strong>Verification and Validation &#45; Education</strong>\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n        \r\n        Considering the importance of your crucial time and money, Jobstonaukri also offers verification services through certified agencies which not only make your resume stand apart from unverified ,fake and fraudulent resumes but also spare you and your organization the effort in getting it verified themselves. This also elevates your chances of securing a great job where you can grow and gain experience.\r\n        <br><br>\r\n        \r\n        </p>\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n        \r\n        \r\n        <ol>\r\n        	\r\n        	\r\n        	\r\n        	 <li> The commonly followed method of this verification is, just a physical inspection of the certificates. Manipulating certificates is not a big deal in the current age of technology making such method fraught with risky.<br> <br></li>\r\n        	 \r\n        	  <li>	1) Verifying over courier/post, phone, and email or via any electronic means is virtually impossible except for a handful of universities.<br> <br></li>\r\n\r\n<li> 2) Education verification provides you an edge on variety of things <br><br></li>\r\n\r\n<li> 3) Your highest education will be verified <br></li>\r\n\r\n        \r\n\r\n\r\n        </ol>\r\n        \r\n        <br><br>\r\n\r\n        </p>\r\n       \r\n        <br><br>\r\n        \r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>\r\n</div>', 2699, 1, '2016-10-06 00:14:23'),
(16, 'Employment Verification', '<div class="row post-box box-1">\r\n<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n    <strong>Verification and Validation &#45; Employment</strong>\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n        \r\n        Candidates falsify dates of employment for hiding periods of unemployment, by extending the period of employment with a specific employer. Sometimes this is done to cover up periods of imprisonment.\r\n\r\nWith verification of your employment credentials, ruminate using this service. We have expert team and professionals who check and verify all the credentials, certificates and other documents regarding your previous experience and the companies you worked previous and your last designation.\r\n\r\n\r\n\r\n\r\n        <br><br>\r\n        \r\n        </p>\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n        <ul>\r\n<li>The position, salaries, and responsibilities are exaggerated.</li>\r\n\r\n<li>The reasons for quitting are manipulated.</li>\r\n\r\n<li>The experience stated may turn out to be fictitious.</li>\r\n<li>Recruiters trust will be built on your professional achievements. </li>\r\n<li>Enhance your chances of getting more interview calls. </li>\r\n\r\n</ul>\r\n        \r\n       \r\n        \r\n        <br><br>\r\n\r\n        <strong>Benefits of Employment verification</strong><br><br>\r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n        <ul>\r\n\r\n       <li> Employment verification in India is important to validate if a candidate has been working for the tenure, role and salary indicated on the resume. The process involves contacting Human Resources / Payroll department in previous employers to accurately determine the candidates work history.<br><br></li>\r\n\r\n<li>\r\nThe Work Number for Everyone provides all information included on Employment Verification plus pay rate and total income for the current and past two years. Income is broken down by base pay, overtime, commission, bonuses, and other income. <br><br></li>\r\n\r\n</ul>\r\n\r\n        </p>\r\n       \r\n        <br><br><br><br>\r\n<br><br>\r\n        \r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>\r\n</div>', 2699, 1, '2016-10-06 00:14:23'),
(17, 'Combo Verification', '<div class="row post-box box-1">\r\n<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n    <strong>Verification and Validation &#45; Employment</strong>\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\nProfile verification Service, you can get your profile''s credentials like academic & employment verified by the company, and wins recruiters'' trust to get more interview calls. As per company need, Management verify Education for verifying your highest education, Employment verification for verifying current, previous or both employments.        \r\nThe ideal blend of key career-critical services the Executive Pack is perfect for anyone who expects to be completely prepared to accept when the right opportunity comes by.\r\n\r\n        <br><br>\r\n        \r\n        </p>\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n        \r\n        \r\n        <ol>\r\n        	\r\n        	\r\n        	\r\n        	 <li> 1) With verification of your employment credentials, ruminate using this service.<br> <br></li>\r\n<li> 2) We have expert team for verifiers and professionals who check and verify all the credentials, certificates and other documents regarding your previous experience and the companies you worked previousand your last designation. <br> <br></li>\r\n\r\n\r\n        	 <li> 2) All education verification to verify your document, you may have an edge on definite things, From lower to higher studies, every educational qualification of you will be verified. <br><br></li>\r\n\r\n\r\n<li> 3) Once verification is completed successfully, you will get an authentication certificate which states that all your certificates and documents are complete verified. With our service, you have to chance to get these benefits <br><br></li>\r\n        	 \r\n\r\n <li> 4) Verifying over courier/post, phone, and email or via any electronic means is virtually impossible except for a handful of universities.<br> <br></li>\r\n\r\n        \r\n\r\n\r\n        </ol>\r\n        \r\n        <br><br>\r\n\r\n        </p>\r\n       \r\n        <br><br>\r\n        \r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>\r\n</div>', 2699, 1, '2016-10-06 00:14:23'),
(18, 'Employment Verification', '<div class="row post-box box-1">\r\n<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n    <strong>Verification and Validation &#45; Employment</strong>\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n        \r\n        Candidates falsify dates of employment for hiding periods of unemployment, by extending the period of employment with a specific employer. Sometimes this is done to cover up periods of imprisonment.\r\n\r\n        <br><br>\r\n        \r\n        </p>\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">\r\n        <ul>\r\n<li>The position, salaries, and responsibilities are exaggerated.</li>\r\n\r\n<li>The reasons for quitting are manipulated.</li>\r\n\r\n<li>The experience stated may turn out to be fictitious.</li>\r\n\r\n</ul>\r\n        \r\n       \r\n        \r\n        <br><br>\r\n\r\n        <strong>Importance</strong><br><br>\r\n\r\n        Employment verification in India is important to validate if a candidate has been working for the tenure, role and salary indicated on the resume. The process involves contacting Human Resources / Payroll department in previous employers to accurately determine the candidates work history.\r\n\r\n\r\n        </p>\r\n       \r\n        <br><br><br><br>\r\n<br><br>\r\n        \r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>\r\n</div>', 2699, 1, '2016-10-06 00:14:23');

-- --------------------------------------------------------

--
-- Table structure for table `service_options`
--

CREATE TABLE `service_options` (
  `serviceOptionId` int(11) NOT NULL,
  `serviceId` int(11) NOT NULL,
  `optionTitle` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `additional` tinyint(4) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_options`
--

INSERT INTO `service_options` (`serviceOptionId`, `serviceId`, `optionTitle`, `price`, `additional`, `status`, `dateAdded`) VALUES
(1, 0, '', 9000, 0, 1, '2016-06-11 11:31:55'),
(2, 2, '1 Year', 1000, 0, 1, '2016-06-12 22:51:26'),
(3, 2, '2 Year', 1500, 0, 1, '2016-06-12 22:51:26'),
(4, 2, '3 Year', 2000, 0, 1, '2016-06-12 22:51:52'),
(5, 0, 'India', 1900, 0, 1, '2016-06-22 08:01:01'),
(6, 0, 'Gulf', 1350, 0, 1, '2016-06-22 08:01:01'),
(7, 4, '0 - 3 Years', 1100, 0, 1, '2016-06-22 08:28:51'),
(8, 4, '3 - 7 Years', 1700, 0, 1, '2016-06-22 08:28:51'),
(9, 4, '7-10 Years', 2500, 0, 1, '2016-06-22 08:29:44'),
(10, 4, '10+ Years', 3350, 0, 1, '2016-06-22 08:29:44'),
(11, 5, '0 - 3 Years', 1450, 0, 1, '2016-06-22 08:37:20'),
(12, 4, '3 - 7 Years', 2250, 0, 1, '2016-06-22 08:37:20'),
(13, 5, '7-10 Years', 3670, 0, 1, '2016-06-22 08:38:15'),
(14, 5, '10+ Years', 4250, 0, 1, '2016-06-22 08:38:15'),
(15, 6, '&nbsp;', 4700, 0, 1, '2016-06-22 08:42:11'),
(16, 7, '0 - 3 Years', 2450, 0, 1, '2016-06-22 08:48:10'),
(17, 7, '3 - 7 Years', 3450, 0, 1, '2016-06-22 08:48:10'),
(18, 7, '7-10 Years', 4450, 0, 1, '2016-06-22 08:48:41'),
(19, 7, '10+ Years', 5450, 0, 1, '2016-06-22 08:48:41'),
(20, 9, 'Resume Broadcast India', 2699, 0, 1, '2016-10-06 00:25:32'),
(21, 10, 'Resume Broadcast Gulf', 3299, 0, 1, '2016-10-06 00:25:32'),
(22, 11, 'Resume Broadcast Combo', 4599, 0, 1, '2016-10-06 00:25:32'),
(23, 12, 'Gold Plan India', 5199, 0, 1, '2016-10-06 00:25:32'),
(24, 12, 'Gold Plan Gulf', 6199, 0, 1, '2016-10-06 00:25:32'),
(25, 12, 'Platinum Plan India', 10999, 0, 1, '2016-10-06 00:25:32'),
(26, 13, 'Live Interview Preparation ', 10999, 0, 1, '2016-10-06 00:25:32'),
(27, 14, 'Online Domain', 8999, 0, 1, '2016-10-06 00:25:32'),
(28, 12, 'Platinum Plan Gulf', 12999, 0, 1, '2016-10-06 00:25:32'),
(29, 15, 'Verification and Validation &#45;Education', 5199, 0, 1, '2016-10-06 00:25:32'),
(30, 16, 'Verification and Validation &#45;Employment', 5199, 0, 1, '2016-10-06 00:25:32'),
(31, 17, 'Verification and Validation &#45;Combo', 9999, 0, 1, '2016-10-06 00:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `session_clust_emp`
--

CREATE TABLE `session_clust_emp` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `SubUserId` varchar(50) NOT NULL DEFAULT '',
  `CompanyName` varchar(250) NOT NULL DEFAULT '',
  `SessionId` varchar(50) NOT NULL DEFAULT '',
  `SessionExpire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Session_Data` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `session_clust_js`
--

CREATE TABLE `session_clust_js` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `SessionId` varchar(50) NOT NULL DEFAULT '',
  `SessionExpire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Session_Data` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smspayment`
--

CREATE TABLE `smspayment` (
  `SmsPayId` bigint(7) NOT NULL,
  `CseId` varchar(60) NOT NULL DEFAULT '',
  `SalesManId` varchar(60) NOT NULL DEFAULT '',
  `PaymentMode` varchar(60) NOT NULL DEFAULT '',
  `ChequeNo` varchar(60) NOT NULL DEFAULT '',
  `PaymentDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `IssueDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `BankId` varchar(60) NOT NULL DEFAULT '',
  `Amount` float(8,2) DEFAULT '0.00',
  `Status` varchar(60) NOT NULL DEFAULT '',
  `UserId` varchar(60) NOT NULL DEFAULT '',
  `InvoiceNo` varchar(60) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `Id` bigint(8) NOT NULL,
  `Date_Visited` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `User_Agent` varchar(70) NOT NULL DEFAULT '',
  `Referer` varchar(100) NOT NULL DEFAULT '',
  `Web_Client` varchar(30) NOT NULL DEFAULT '',
  `Script_Name` varchar(100) NOT NULL DEFAULT '',
  `User_Name` varchar(50) NOT NULL DEFAULT '',
  `Sub_User` varchar(50) NOT NULL DEFAULT '',
  `User_Type` tinyint(4) NOT NULL DEFAULT '0',
  `Date_Logout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=685021 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_mailer`
--

CREATE TABLE `tmp_mailer` (
  `Email` varchar(60) NOT NULL DEFAULT '',
  `Name` varchar(60) NOT NULL DEFAULT '',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(250) NOT NULL DEFAULT '',
  `LastActive` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tm_js_details`
--

CREATE TABLE `tm_js_details` (
  `id` int(11) NOT NULL,
  `userid` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `mob_cnt` varchar(5) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `res_cnt` varchar(5) NOT NULL DEFAULT '',
  `res_std` varchar(6) NOT NULL DEFAULT '',
  `res_phone` varchar(12) NOT NULL DEFAULT '',
  `cnt_code` char(3) NOT NULL DEFAULT '0',
  `st_code` char(3) NOT NULL DEFAULT '0',
  `st_other` varchar(30) NOT NULL DEFAULT '',
  `city_code` char(3) NOT NULL DEFAULT '',
  `city_other` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `call_status` tinyint(2) NOT NULL DEFAULT '0',
  `product_id` int(5) NOT NULL DEFAULT '0',
  `product_subid` int(5) NOT NULL DEFAULT '0',
  `tc_id` varchar(60) NOT NULL DEFAULT 'NULL',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `followup_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount` float(10,2) NOT NULL DEFAULT '0.00',
  `linksent` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=536224 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tm_resume_lock`
--

CREATE TABLE `tm_resume_lock` (
  `userid` varchar(50) NOT NULL DEFAULT '',
  `tc_id` varchar(60) NOT NULL DEFAULT '',
  `time_entered` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tm_tc_comments`
--

CREATE TABLE `tm_tc_comments` (
  `userid` varchar(50) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `tc_id` varchar(60) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `toolbarcount`
--

CREATE TABLE `toolbarcount` (
  `Id` bigint(10) NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Count` int(6) NOT NULL DEFAULT '0',
  `Type` char(2) NOT NULL DEFAULT 'T',
  `JP_Count` bigint(20) NOT NULL DEFAULT '0',
  `JP_USR_Count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=3022 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `Id` int(4) NOT NULL,
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `CseId` varchar(50) NOT NULL DEFAULT '',
  `AccNo` int(5) NOT NULL DEFAULT '0',
  `InvoiceNo` varchar(50) NOT NULL DEFAULT '',
  `RecieptNo` bigint(7) NOT NULL DEFAULT '0',
  `InvoiceDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `PlanNumber` bigint(6) NOT NULL DEFAULT '0',
  `PlanType` varchar(30) NOT NULL DEFAULT '',
  `Validity` int(4) NOT NULL DEFAULT '0',
  `Description` varchar(100) NOT NULL DEFAULT '',
  `NoOfAds` int(5) NOT NULL DEFAULT '0',
  `Urdl` tinyint(1) NOT NULL DEFAULT '0',
  `Amount` float(10,2) NOT NULL DEFAULT '0.00',
  `HostType` varchar(50) NOT NULL DEFAULT '',
  `StartDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Status` char(1) NOT NULL DEFAULT '',
  `DiscountRate` float(4,2) NOT NULL DEFAULT '0.00',
  `SalesTax` float(10,2) DEFAULT NULL,
  `TDS` float(6,2) NOT NULL DEFAULT '0.00',
  `TotalAmount` float(10,2) NOT NULL DEFAULT '0.00',
  `Candidate_Manager` char(1) NOT NULL DEFAULT '',
  `Job_Alert` char(1) NOT NULL DEFAULT '',
  `Remarks` varchar(150) NOT NULL DEFAULT '',
  `StartDate_Js` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `WalkIn` tinyint(1) NOT NULL DEFAULT '0',
  `Web_Notification` tinyint(1) NOT NULL DEFAULT '0',
  `Cs_Validity` int(6) NOT NULL DEFAULT '0',
  `ModeOfPayment` varchar(10) NOT NULL DEFAULT '',
  `Xml` mediumblob NOT NULL,
  `RedirectURL` char(1) NOT NULL DEFAULT 'N',
  `Branch` varchar(60) NOT NULL DEFAULT '',
  `Sales_Incharge` varchar(60) NOT NULL DEFAULT '',
  `City_OrderId` varchar(20) NOT NULL DEFAULT '',
  `JPExpiryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `CSExpiryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Emailcount` int(11) DEFAULT '500',
  `Pay_Per_Contact` tinyint(4) NOT NULL DEFAULT '1',
  `Pay_Per_Contact_Value` float NOT NULL DEFAULT '0',
  `Pay_Per_Download` tinyint(4) NOT NULL DEFAULT '1',
  `Pay_Per_Download_Value` float NOT NULL DEFAULT '0',
  `Pay_Per_Response` tinyint(4) NOT NULL DEFAULT '1',
  `Pay_Per_Response_Value` float NOT NULL DEFAULT '0',
  `Pay_Per_Search` tinyint(4) NOT NULL DEFAULT '1',
  `Pay_Per_Search_Value` float NOT NULL DEFAULT '0',
  `Pay_Per_Save` tinyint(4) NOT NULL DEFAULT '1',
  `Pay_Per_Save_Value` float NOT NULL DEFAULT '0',
  `Pay_Current_Amount` float(10,2) NOT NULL DEFAULT '0.00',
  `Previous_Balance` float(10,2) NOT NULL DEFAULT '0.00',
  `CV_Credits` int(11) NOT NULL DEFAULT '0',
  `ppc_fresher` float NOT NULL DEFAULT '20',
  `ppc_upto3` float NOT NULL DEFAULT '40',
  `ppc_upto5` float NOT NULL DEFAULT '60',
  `ppc_upto10` float NOT NULL DEFAULT '80',
  `ppc_above10` float NOT NULL DEFAULT '100',
  `Pay_Total_Amount` float(10,2) NOT NULL DEFAULT '0.00',
  `Earnings_Amount` float(10,2) NOT NULL DEFAULT '0.00',
  `Pref_Loc` text
) ENGINE=MyISAM AUTO_INCREMENT=19519 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `validsmsreport`
--

CREATE TABLE `validsmsreport` (
  `DateAdded` date NOT NULL DEFAULT '0000-00-00',
  `ValidCount` int(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `webservice_apilog`
--

CREATE TABLE `webservice_apilog` (
  `Id` int(11) NOT NULL,
  `JsId` varchar(50) NOT NULL DEFAULT '',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `ApiKey` varchar(40) NOT NULL DEFAULT '',
  `ApiUsed` varchar(50) NOT NULL DEFAULT '',
  `ErrorCode` varchar(100) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=916 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `webservice_authentication`
--

CREATE TABLE `webservice_authentication` (
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `ApiKey` varchar(40) NOT NULL DEFAULT '',
  `Token` varchar(40) NOT NULL DEFAULT '',
  `ExpiryTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LaccessIp` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `Id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `webservice_capdetails`
--

CREATE TABLE `webservice_capdetails` (
  `Id` int(11) NOT NULL,
  `ApiKey` varchar(40) NOT NULL DEFAULT '',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `ApiUsed` varchar(8) NOT NULL DEFAULT '',
  `DateUsed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Ip` varchar(16) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=MyISAM AUTO_INCREMENT=1437 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `webservice_details`
--

CREATE TABLE `webservice_details` (
  `Id` int(11) NOT NULL,
  `ApiKey` varchar(40) NOT NULL DEFAULT '',
  `ApiClient` varchar(80) NOT NULL DEFAULT '',
  `UserId` varchar(50) NOT NULL DEFAULT '',
  `CapLimit` int(11) NOT NULL DEFAULT '1000',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `webservice_jobapplications`
--

CREATE TABLE `webservice_jobapplications` (
  `Id` bigint(10) NOT NULL,
  `Job_Id` bigint(8) NOT NULL DEFAULT '0',
  `Jobseeker_Id` varchar(50) NOT NULL DEFAULT '',
  `Resume_Id` tinyint(1) NOT NULL DEFAULT '0',
  `Employer_Id` varchar(50) NOT NULL DEFAULT '',
  `Date_Applied` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Application_Status` varchar(15) NOT NULL DEFAULT '',
  `Job_Expiry_Date` date NOT NULL DEFAULT '0000-00-00',
  `Child_Folder_Name` varchar(25) NOT NULL DEFAULT '',
  `Xml` mediumblob,
  `Name` varchar(60) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `Confirm_Email` varchar(60) DEFAULT NULL,
  `Cnt_Code` char(3) DEFAULT NULL,
  `St_Code` char(3) DEFAULT NULL,
  `City_Code` char(3) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Res_Path` varchar(150) DEFAULT NULL,
  `Cover_Letter` text,
  `Flag` tinyint(4) DEFAULT '0',
  `CommentsXml` text,
  `Relevance` float(5,2) NOT NULL DEFAULT '0.00',
  `Modify_Flag` char(1) NOT NULL,
  `Parent_Folder_Name` varchar(70) NOT NULL DEFAULT '',
  `Type` char(3) NOT NULL DEFAULT '',
  `Js_Status` char(1) NOT NULL,
  `Target_Job_Id` varchar(70) NOT NULL DEFAULT '',
  `Request_Status` varchar(5) NOT NULL DEFAULT '',
  `Mail_Status` char(1) NOT NULL,
  `SMS_Flag` char(1) NOT NULL,
  `show_status` char(1) DEFAULT NULL,
  `Job_Type` int(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_notification`
--

CREATE TABLE `web_notification` (
  `Id` int(6) NOT NULL,
  `JobseekerId` varchar(50) NOT NULL DEFAULT '',
  `DocRef` varchar(50) NOT NULL DEFAULT '',
  `EmployerId` varchar(50) NOT NULL DEFAULT '',
  `DateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `AlertType` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=614952 DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Sub_User_Id` (`Sub_User_Id`),
  ADD KEY `Super_User_Id` (`Super_User_Id`),
  ADD KEY `acc_status_idx` (`Status`);

--
-- Indexes for table `action_history`
--
ALTER TABLE `action_history`
  ADD KEY `jobseeker_payperaction` (`Pay_Per_Action`,`Jobseeker_Id`),
  ADD KEY `employer_payperaction` (`Pay_Per_Action`,`Employer_Id`),
  ADD KEY `action_date` (`Date_Of_Action`),
  ADD KEY `jobid` (`Job_Id`),
  ADD KEY `index1` (`Jobseeker_Id`,`Employer_Id`,`Resume_Id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`Userid`);

--
-- Indexes for table `automatch`
--
ALTER TABLE `automatch`
  ADD KEY `jobid_am` (`Job_Id`),
  ADD KEY `empid_am` (`Employer_Id`),
  ADD KEY `dateapp_am` (`Date_Applied`);

--
-- Indexes for table `autosuggest_list`
--
ALTER TABLE `autosuggest_list`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `bc_consultantgroups`
--
ALTER TABLE `bc_consultantgroups`
  ADD PRIMARY KEY (`FuncCode`);

--
-- Indexes for table `bc_consultants`
--
ALTER TABLE `bc_consultants`
  ADD PRIMARY KEY (`FuncCode`,`EmailID`);

--
-- Indexes for table `bc_consultants_new`
--
ALTER TABLE `bc_consultants_new`
  ADD PRIMARY KEY (`FuncCode`,`UserId`);

--
-- Indexes for table `blockedinvitation`
--
ALTER TABLE `blockedinvitation`
  ADD KEY `invitation_id` (`invitation_id`);

--
-- Indexes for table `blockedreminders`
--
ALTER TABLE `blockedreminders`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `bouncemails`
--
ALTER TABLE `bouncemails`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BranchId`);

--
-- Indexes for table `broadcastdetails`
--
ALTER TABLE `broadcastdetails`
  ADD PRIMARY KEY (`BroadcastId`);

--
-- Indexes for table `cjbmmembers`
--
ALTER TABLE `cjbmmembers`
  ADD PRIMARY KEY (`Email`),
  ADD KEY `indx1` (`DateCreated`),
  ADD KEY `indx2` (`Register`);

--
-- Indexes for table `cj_bmmembers`
--
ALTER TABLE `cj_bmmembers`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `cj_ch_jobprompt`
--
ALTER TABLE `cj_ch_jobprompt`
  ADD PRIMARY KEY (`Jp_Id`),
  ADD KEY `index1` (`UserId`),
  ADD KEY `index2` (`Flag`),
  ADD KEY `index3` (`Status`),
  ADD KEY `index4` (`Alert_Freq`);

--
-- Indexes for table `cj_ch_jobprompt_duplicate`
--
ALTER TABLE `cj_ch_jobprompt_duplicate`
  ADD PRIMARY KEY (`Jp_Id`),
  ADD KEY `index1` (`UserId`),
  ADD KEY `index2` (`Flag`),
  ADD KEY `index3` (`Status`),
  ADD KEY `index4` (`Alert_Freq`);

--
-- Indexes for table `cj_ch_jobseekers_res_det`
--
ALTER TABLE `cj_ch_jobseekers_res_det`
  ADD PRIMARY KEY (`Res_Id`,`UserId`),
  ADD KEY `res_type` (`Res_Type`),
  ADD KEY `Userind` (`UserId`),
  ADD KEY `docid_db3` (`UserId`,`Res_Id`),
  ADD KEY `js_resstat_idx` (`Res_Stat`);

--
-- Indexes for table `cj_ch_jobseekers_res_det_duplicate`
--
ALTER TABLE `cj_ch_jobseekers_res_det_duplicate`
  ADD PRIMARY KEY (`Res_Id`,`UserId`),
  ADD KEY `res_type` (`Res_Type`),
  ADD KEY `Userind` (`UserId`),
  ADD KEY `docid_db3` (`UserId`,`Res_Id`),
  ADD KEY `js_resstat_idx` (`Res_Stat`);

--
-- Indexes for table `cj_ch_js_bday_rs_discount`
--
ALTER TABLE `cj_ch_js_bday_rs_discount`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `PromoCode` (`PromoCode`);

--
-- Indexes for table `cj_ch_js_coverletter`
--
ALTER TABLE `cj_ch_js_coverletter`
  ADD PRIMARY KEY (`Cl_Id`,`UserId`),
  ADD KEY `index1` (`UserId`);

--
-- Indexes for table `cj_ch_js_coverletter_duplicate`
--
ALTER TABLE `cj_ch_js_coverletter_duplicate`
  ADD PRIMARY KEY (`Cl_Id`,`UserId`),
  ADD KEY `index1` (`UserId`);

--
-- Indexes for table `cj_ch_js_credentials`
--
ALTER TABLE `cj_ch_js_credentials`
  ADD PRIMARY KEY (`Cred_Id`,`UserId`),
  ADD KEY `index1` (`UserId`);

--
-- Indexes for table `cj_ch_js_credentials_duplicate`
--
ALTER TABLE `cj_ch_js_credentials_duplicate`
  ADD PRIMARY KEY (`Cred_Id`,`UserId`),
  ADD KEY `index1` (`UserId`);

--
-- Indexes for table `cj_ch_js_del_info`
--
ALTER TABLE `cj_ch_js_del_info`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `cj_ch_js_itskills`
--
ALTER TABLE `cj_ch_js_itskills`
  ADD PRIMARY KEY (`Skill_Id`,`UserId`,`Res_Id`),
  ADD KEY `ind_index_db3` (`UserId`,`Res_Id`);

--
-- Indexes for table `cj_ch_js_itskills_duplicate`
--
ALTER TABLE `cj_ch_js_itskills_duplicate`
  ADD PRIMARY KEY (`Skill_Id`,`UserId`,`Res_Id`),
  ADD KEY `ind_index_db3` (`UserId`,`Res_Id`);

--
-- Indexes for table `cj_ch_js_lang`
--
ALTER TABLE `cj_ch_js_lang`
  ADD PRIMARY KEY (`Lang_Id`,`UserId`,`Res_Id`),
  ADD KEY `docidlang_db3` (`UserId`,`Res_Id`);

--
-- Indexes for table `cj_ch_js_lang_duplicate`
--
ALTER TABLE `cj_ch_js_lang_duplicate`
  ADD PRIMARY KEY (`Lang_Id`,`UserId`,`Res_Id`),
  ADD KEY `docidlang_db3` (`UserId`,`Res_Id`);

--
-- Indexes for table `cj_ch_js_newsletter`
--
ALTER TABLE `cj_ch_js_newsletter`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `index_UserId` (`UserId`),
  ADD KEY `index_newsletteroptions` (`NewsLetterOptions`);

--
-- Indexes for table `cj_ch_js_newsletter_duplicate`
--
ALTER TABLE `cj_ch_js_newsletter_duplicate`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `index_UserId` (`UserId`),
  ADD KEY `index_newsletteroptions` (`NewsLetterOptions`);

--
-- Indexes for table `cj_ch_js_womenday_rs_discount`
--
ALTER TABLE `cj_ch_js_womenday_rs_discount`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cj_ch_prof_det`
--
ALTER TABLE `cj_ch_prof_det`
  ADD PRIMARY KEY (`UserId`,`Resume_Id`),
  ADD KEY `docidprof_db3` (`UserId`,`Resume_Id`);

--
-- Indexes for table `cj_ch_prof_det_duplicate`
--
ALTER TABLE `cj_ch_prof_det_duplicate`
  ADD PRIMARY KEY (`UserId`,`Resume_Id`),
  ADD KEY `docidprof_db3` (`UserId`,`Resume_Id`);

--
-- Indexes for table `cj_cst_mailing_list`
--
ALTER TABLE `cj_cst_mailing_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cj_cst_mailing_list_details`
--
ALTER TABLE `cj_cst_mailing_list_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cj_cst_sms_list`
--
ALTER TABLE `cj_cst_sms_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cj_cst_sms_list_details`
--
ALTER TABLE `cj_cst_sms_list_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cj_emp_dirlistings_contact_cmp`
--
ALTER TABLE `cj_emp_dirlistings_contact_cmp`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cj_emp_dirlistings_review`
--
ALTER TABLE `cj_emp_dirlistings_review`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cj_emp_jobpost_qual`
--
ALTER TABLE `cj_emp_jobpost_qual`
  ADD PRIMARY KEY (`Qual_Code`);

--
-- Indexes for table `cj_emp_sh_arcsvd_det`
--
ALTER TABLE `cj_emp_sh_arcsvd_det`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `index1` (`UserId`),
  ADD KEY `index2` (`SubUserId`),
  ADD KEY `index3` (`Se_Ar_Type`),
  ADD FULLTEXT KEY `index4` (`SearchQuery`);

--
-- Indexes for table `cj_im_email_alert`
--
ALTER TABLE `cj_im_email_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cj_im_employer`
--
ALTER TABLE `cj_im_employer`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cj_im_jobpost`
--
ALTER TABLE `cj_im_jobpost`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cj_im_jobseeker`
--
ALTER TABLE `cj_im_jobseeker`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cj_jobs_on_phone`
--
ALTER TABLE `cj_jobs_on_phone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cj_job_list`
--
ALTER TABLE `cj_job_list`
  ADD PRIMARY KEY (`JobId`),
  ADD KEY `city_ind` (`City`),
  ADD KEY `EdQual_ind` (`EdQual`),
  ADD KEY `JobRole_ind` (`JobRole`);

--
-- Indexes for table `cj_js_ivr_track`
--
ALTER TABLE `cj_js_ivr_track`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cj_mast_city`
--
ALTER TABLE `cj_mast_city`
  ADD PRIMARY KEY (`City_Code`);

--
-- Indexes for table `cj_mast_companies`
--
ALTER TABLE `cj_mast_companies`
  ADD KEY `company_name` (`company_name`,`company_index`),
  ADD FULLTEXT KEY `company_name_2` (`company_name`,`company_index`);

--
-- Indexes for table `cj_mast_country`
--
ALTER TABLE `cj_mast_country`
  ADD PRIMARY KEY (`Cnt_Code`);

--
-- Indexes for table `cj_mast_currency_type`
--
ALTER TABLE `cj_mast_currency_type`
  ADD PRIMARY KEY (`Currency_Code`);

--
-- Indexes for table `cj_mast_education`
--
ALTER TABLE `cj_mast_education`
  ADD PRIMARY KEY (`Edu_Code`);

--
-- Indexes for table `cj_mast_functional`
--
ALTER TABLE `cj_mast_functional`
  ADD PRIMARY KEY (`Func_Code`);

--
-- Indexes for table `cj_mast_industry`
--
ALTER TABLE `cj_mast_industry`
  ADD PRIMARY KEY (`Ind_Code`);

--
-- Indexes for table `cj_mast_institute`
--
ALTER TABLE `cj_mast_institute`
  ADD PRIMARY KEY (`Instit_Code`);

--
-- Indexes for table `cj_mast_jobrole`
--
ALTER TABLE `cj_mast_jobrole`
  ADD PRIMARY KEY (`Jobr_Code`);

--
-- Indexes for table `cj_mast_pref_loc`
--
ALTER TABLE `cj_mast_pref_loc`
  ADD PRIMARY KEY (`Pref_Loc_Code`);

--
-- Indexes for table `cj_mast_specialization`
--
ALTER TABLE `cj_mast_specialization`
  ADD PRIMARY KEY (`Spec_Code`);

--
-- Indexes for table `cj_microsite_cadd`
--
ALTER TABLE `cj_microsite_cadd`
  ADD PRIMARY KEY (`cadd_id`);

--
-- Indexes for table `cj_rs_sms_track`
--
ALTER TABLE `cj_rs_sms_track`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cj_sms_alert_js`
--
ALTER TABLE `cj_sms_alert_js`
  ADD PRIMARY KEY (`jobseekerid`,`mobile`,`jobpostid`);

--
-- Indexes for table `cj_sms_apply_js`
--
ALTER TABLE `cj_sms_apply_js`
  ADD PRIMARY KEY (`Id`,`Mobile`,`DateAdded`);

--
-- Indexes for table `cj_sms_detail_js`
--
ALTER TABLE `cj_sms_detail_js`
  ADD PRIMARY KEY (`JobPostId`);

--
-- Indexes for table `cj_sms_detail_log`
--
ALTER TABLE `cj_sms_detail_log`
  ADD PRIMARY KEY (`id`,`mobile`,`dateadded`);

--
-- Indexes for table `cj_sms_forward_cv_js`
--
ALTER TABLE `cj_sms_forward_cv_js`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `cj_sms_transfail_js`
--
ALTER TABLE `cj_sms_transfail_js`
  ADD PRIMARY KEY (`id`,`mobile`,`dateadded`);

--
-- Indexes for table `cj_widget_track`
--
ALTER TABLE `cj_widget_track`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clickjobs_branches`
--
ALTER TABLE `clickjobs_branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cmp_code`
--
ALTER TABLE `cmp_code`
  ADD KEY `ccode` (`CmpCode`),
  ADD KEY `index1` (`CmpName`);

--
-- Indexes for table `consultants`
--
ALTER TABLE `consultants`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `index1` (`msg_to`,`msg_to_deleted`);

--
-- Indexes for table `cse`
--
ALTER TABLE `cse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cseprivilege`
--
ALTER TABLE `cseprivilege`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cst`
--
ALTER TABLE `cst`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `custom_payment`
--
ALTER TABLE `custom_payment`
  ADD PRIMARY KEY (`Pay_Id`);

--
-- Indexes for table `easycart_transaction`
--
ALTER TABLE `easycart_transaction`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `employer_idx1` (`UserId`),
  ADD KEY `employer_idx2` (`SessionExpire`),
  ADD KEY `dateadd_indx` (`DateAdded`),
  ADD KEY `emp_validated_idx` (`Validated`),
  ADD KEY `emp_active_idx` (`Active`),
  ADD KEY `cName_i` (`Cmp_Name`),
  ADD KEY `validated_i` (`Validated`);

--
-- Indexes for table `employer_count`
--
ALTER TABLE `employer_count`
  ADD PRIMARY KEY (`Super_User`,`Sub_User`,`DateAdded`);

--
-- Indexes for table `employer_products`
--
ALTER TABLE `employer_products`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `emppreference`
--
ALTER TABLE `emppreference`
  ADD PRIMARY KEY (`UserId`,`SubUserId`),
  ADD KEY `index1` (`PDFDownload`,`DOCDownload`,`TEXTDownload`),
  ADD KEY `index2` (`SubUserId`);

--
-- Indexes for table `empsms`
--
ALTER TABLE `empsms`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `index1` (`Status`),
  ADD KEY `ind_empsms_jid` (`JSId`,`EmpId`);

--
-- Indexes for table `empviewlist`
--
ALTER TABLE `empviewlist`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `index1` (`UserId`),
  ADD KEY `index2` (`DocRef`),
  ADD KEY `index3` (`EmployerId`),
  ADD KEY `index4` (`Status`),
  ADD KEY `index5` (`Type`);

--
-- Indexes for table `emp_feat`
--
ALTER TABLE `emp_feat`
  ADD PRIMARY KEY (`Feat_Id`);

--
-- Indexes for table `emp_pack`
--
ALTER TABLE `emp_pack`
  ADD PRIMARY KEY (`Pack_Id`);

--
-- Indexes for table `emp_pack_feat`
--
ALTER TABLE `emp_pack_feat`
  ADD PRIMARY KEY (`Res_Pack_Id`),
  ADD KEY `pack_id` (`Pack_Id`),
  ADD KEY `feat_id` (`Feat_Id`);

--
-- Indexes for table `emp_pack_price`
--
ALTER TABLE `emp_pack_price`
  ADD PRIMARY KEY (`Res_Price_Id`);

--
-- Indexes for table `emp_report_invalidno`
--
ALTER TABLE `emp_report_invalidno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index1` (`jobseeker_id`,`employer_id`);

--
-- Indexes for table `emp_search_session`
--
ALTER TABLE `emp_search_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_sentmail`
--
ALTER TABLE `emp_sentmail`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `empid` (`EmpId`,`JSId`),
  ADD KEY `jsid_i` (`JSId`);

--
-- Indexes for table `emp_stat`
--
ALTER TABLE `emp_stat`
  ADD KEY `comb_key` (`UserId`,`Sub_User_Id`,`ProcessDate`),
  ADD KEY `subUserId_i` (`Sub_User_Id`),
  ADD KEY `ProcessDate_i` (`ProcessDate`);

--
-- Indexes for table `emp_templates`
--
ALTER TABLE `emp_templates`
  ADD PRIMARY KEY (`TempId`,`EmpUserId`),
  ADD KEY `index1` (`EmpUserId`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `featured_listings`
--
ALTER TABLE `featured_listings`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `format_error`
--
ALTER TABLE `format_error`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `friends_network`
--
ALTER TABLE `friends_network`
  ADD PRIMARY KEY (`network_id`),
  ADD UNIQUE KEY `invitation_id` (`invitation_id`),
  ADD KEY `index1` (`referer_id`,`friend_id`),
  ADD KEY `index2` (`referer_id`,`friend_id`,`is_deleted`);

--
-- Indexes for table `indexq`
--
ALTER TABLE `indexq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Userid` (`Userid`),
  ADD KEY `Type` (`Type`);

--
-- Indexes for table `indexq_consultants`
--
ALTER TABLE `indexq_consultants`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `indexq_dirlistings`
--
ALTER TABLE `indexq_dirlistings`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `indexq_emailalert`
--
ALTER TABLE `indexq_emailalert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Userid` (`Userid`),
  ADD KEY `Type` (`Type`);

--
-- Indexes for table `indexq_js`
--
ALTER TABLE `indexq_js`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Userid` (`Userid`),
  ADD KEY `Type` (`Type`);

--
-- Indexes for table `interviewschedular`
--
ALTER TABLE `interviewschedular`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `applicationid_idx` (`ApplicationId`),
  ADD KEY `jobseekerid_idx` (`JobseekerId`);

--
-- Indexes for table `invalidids`
--
ALTER TABLE `invalidids`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `invitation`
--
ALTER TABLE `invitation`
  ADD PRIMARY KEY (`invitation_id`),
  ADD KEY `index1` (`referer_id`),
  ADD KEY `index2` (`friend_email`),
  ADD KEY `index3` (`friend_id`);

--
-- Indexes for table `invitation_final`
--
ALTER TABLE `invitation_final`
  ADD PRIMARY KEY (`invitation_id`),
  ADD KEY `index1` (`referer_id`),
  ADD KEY `index2` (`friend_email`),
  ADD KEY `index3` (`friend_id`);

--
-- Indexes for table `invitation_uniq`
--
ALTER TABLE `invitation_uniq`
  ADD PRIMARY KEY (`invitation_id`),
  ADD KEY `index1` (`referer_id`),
  ADD KEY `index2` (`friend_email`),
  ADD KEY `index3` (`friend_id`);

--
-- Indexes for table `jobapplications`
--
ALTER TABLE `jobapplications`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `index1` (`Job_Id`),
  ADD KEY `index2` (`Jobseeker_Id`),
  ADD KEY `index3` (`Resume_Id`),
  ADD KEY `index4` (`Application_Status`),
  ADD KEY `index5` (`Parent_Folder_Name`),
  ADD KEY `index6` (`Type`),
  ADD KEY `index7` (`Js_Status`),
  ADD KEY `index8` (`Target_Job_Id`),
  ADD KEY `index9` (`Employer_Id`,`Child_Folder_Name`),
  ADD KEY `index10` (`Date_Applied`);

--
-- Indexes for table `jobapplications_duplicate`
--
ALTER TABLE `jobapplications_duplicate`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `index1` (`Job_Id`),
  ADD KEY `index2` (`Jobseeker_Id`),
  ADD KEY `index3` (`Resume_Id`),
  ADD KEY `index4` (`Application_Status`),
  ADD KEY `index5` (`Parent_Folder_Name`),
  ADD KEY `index6` (`Type`),
  ADD KEY `index7` (`Js_Status`),
  ADD KEY `index8` (`Target_Job_Id`),
  ADD KEY `index9` (`Employer_Id`,`Child_Folder_Name`),
  ADD KEY `index10` (`Date_Applied`);

--
-- Indexes for table `jobpost`
--
ALTER TABLE `jobpost`
  ADD PRIMARY KEY (`JobPostId`),
  ADD KEY `jobpost_idx1` (`UserId`),
  ADD KEY `jobpost_idx2` (`Type`),
  ADD KEY `jobpost_idx4` (`ValidDays`),
  ADD KEY `jobpost_idx5` (`SubUserId`),
  ADD KEY `jobpost_idx6` (`PlanType`),
  ADD KEY `Views` (`Views`,`AppliedClicks`),
  ADD KEY `ind_dateadd` (`DateAdded`),
  ADD KEY `jp_status_idx` (`Status`),
  ADD KEY `jp_walkinjobs_idx` (`WalkinJobs`),
  ADD KEY `jp_gender_idx` (`Gender`);

--
-- Indexes for table `jobpost_mis`
--
ALTER TABLE `jobpost_mis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobseekers`
--
ALTER TABLE `jobseekers`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `index1` (`Email`),
  ADD UNIQUE KEY `ProfileId` (`ProfileId`),
  ADD KEY `index5` (`ReferredBy`),
  ADD KEY `index6` (`SiteId`),
  ADD KEY `index7` (`DateAdded`),
  ADD KEY `index8` (`DateModified`),
  ADD KEY `index9` (`SmsAlert`),
  ADD KEY `index10` (`Mobile_Auth`),
  ADD KEY `index11` (`Res_P_Status`),
  ADD KEY `index12` (`Res_UP_Status`),
  ADD KEY `res_mod` (`Res_Mod_Status`),
  ADD KEY `res_umod` (`Res_UMod_Status`),
  ADD KEY `res_um` (`Res_UM_Status`),
  ADD KEY `js_validated_idx` (`Validated`),
  ADD KEY `js_active_idx` (`Active`),
  ADD KEY `js_jobprompt_idx` (`JobPrompt`),
  ADD KEY `dob1` (`Dob`),
  ADD KEY `cresume1` (`Current_Resume`);

--
-- Indexes for table `jobseekers_duplicate`
--
ALTER TABLE `jobseekers_duplicate`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `index1` (`Email`),
  ADD UNIQUE KEY `ProfileId` (`ProfileId`),
  ADD KEY `index5` (`ReferredBy`),
  ADD KEY `index6` (`SiteId`),
  ADD KEY `index7` (`DateAdded`),
  ADD KEY `index8` (`DateModified`),
  ADD KEY `index9` (`SmsAlert`),
  ADD KEY `index10` (`Mobile_Auth`),
  ADD KEY `index11` (`Res_P_Status`),
  ADD KEY `index12` (`Res_UP_Status`),
  ADD KEY `res_mod` (`Res_Mod_Status`),
  ADD KEY `res_umod` (`Res_UMod_Status`),
  ADD KEY `res_um` (`Res_UM_Status`),
  ADD KEY `js_validated_idx` (`Validated`),
  ADD KEY `js_active_idx` (`Active`),
  ADD KEY `js_jobprompt_idx` (`JobPrompt`),
  ADD KEY `dob1` (`Dob`),
  ADD KEY `cresume1` (`Current_Resume`);

--
-- Indexes for table `job_list_for_bm`
--
ALTER TABLE `job_list_for_bm`
  ADD PRIMARY KEY (`JobId`),
  ADD FULLTEXT KEY `new` (`Qualification`,`City`,`State`,`Country`,`JobRole`);

--
-- Indexes for table `job_repost`
--
ALTER TABLE `job_repost`
  ADD KEY `index1` (`JobId`);

--
-- Indexes for table `jsexpdetails`
--
ALTER TABLE `jsexpdetails`
  ADD PRIMARY KEY (`Exp_Id`),
  ADD KEY `userid_resumeid` (`jobseekerid`,`Resumeid`);

--
-- Indexes for table `js_contact_info`
--
ALTER TABLE `js_contact_info`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `js_contact_info_duplicate`
--
ALTER TABLE `js_contact_info_duplicate`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `js_duplicate`
--
ALTER TABLE `js_duplicate`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `js_earnings`
--
ALTER TABLE `js_earnings`
  ADD PRIMARY KEY (`Js_Earnings_Id`),
  ADD UNIQUE KEY `index1` (`Jobseeker_Id`,`Employer_Id`);

--
-- Indexes for table `js_earnings_dec29_tmp`
--
ALTER TABLE `js_earnings_dec29_tmp`
  ADD PRIMARY KEY (`Js_Earnings_Id`);

--
-- Indexes for table `js_earnings_nov17`
--
ALTER TABLE `js_earnings_nov17`
  ADD PRIMARY KEY (`Js_Earnings_Id`);

--
-- Indexes for table `js_earnings_summary`
--
ALTER TABLE `js_earnings_summary`
  ADD PRIMARY KEY (`Jobseeker_Id`);

--
-- Indexes for table `js_earnings_summary_apr5`
--
ALTER TABLE `js_earnings_summary_apr5`
  ADD PRIMARY KEY (`Jobseeker_Id`);

--
-- Indexes for table `js_earnings_summary_dec29`
--
ALTER TABLE `js_earnings_summary_dec29`
  ADD PRIMARY KEY (`Jobseeker_Id`);

--
-- Indexes for table `js_earnings_summary_tmp`
--
ALTER TABLE `js_earnings_summary_tmp`
  ADD PRIMARY KEY (`Jobseeker_Id`);

--
-- Indexes for table `js_emp_report_details`
--
ALTER TABLE `js_emp_report_details`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `js_payment_contact_details`
--
ALTER TABLE `js_payment_contact_details`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `js_recommended_jobs`
--
ALTER TABLE `js_recommended_jobs`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `js_redeem_history`
--
ALTER TABLE `js_redeem_history`
  ADD PRIMARY KEY (`redeem_id`);

--
-- Indexes for table `js_relation`
--
ALTER TABLE `js_relation`
  ADD PRIMARY KEY (`earnings_id`),
  ADD UNIQUE KEY `UserId` (`UserId`);

--
-- Indexes for table `js_resume_viewlist`
--
ALTER TABLE `js_resume_viewlist`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `index1` (`JobSeekerId`,`EmployerId`);

--
-- Indexes for table `js_resume_viewlist_org`
--
ALTER TABLE `js_resume_viewlist_org`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `js_vs_count`
--
ALTER TABLE `js_vs_count`
  ADD PRIMARY KEY (`DocRef`,`UserId`),
  ADD KEY `index1` (`UserId`);

--
-- Indexes for table `linkdetails`
--
ALTER TABLE `linkdetails`
  ADD PRIMARY KEY (`invitation_id`),
  ADD UNIQUE KEY `Link_Val` (`link_val`),
  ADD KEY `index1` (`referer_id`);

--
-- Indexes for table `mailer`
--
ALTER TABLE `mailer`
  ADD PRIMARY KEY (`MailerId`),
  ADD UNIQUE KEY `mcategory` (`Category`);

--
-- Indexes for table `microsite`
--
ALTER TABLE `microsite`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `missing_resume`
--
ALTER TABLE `missing_resume`
  ADD KEY `index1` (`UserId`,`Res_Id`);

--
-- Indexes for table `monthly_earnings_report`
--
ALTER TABLE `monthly_earnings_report`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `emailindex` (`Email`);

--
-- Indexes for table `monthly_newsletter`
--
ALTER TABLE `monthly_newsletter`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `emailindex` (`Email`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`);

--
-- Indexes for table `payment_master`
--
ALTER TABLE `payment_master`
  ADD PRIMARY KEY (`Pay_Id`),
  ADD KEY `KioskID` (`KioskId`),
  ADD KEY `BranchID` (`BranchId`),
  ADD KEY `Referredby` (`ReferredBy`),
  ADD KEY `orderid` (`OrderId`),
  ADD KEY `city_orderid` (`City_OrderId`),
  ADD KEY `ind_payment_uts` (`UserId`,`Type`,`Payment_Status`),
  ADD KEY `index_paystatus` (`Payment_Status`),
  ADD KEY `index_type` (`Type`);

--
-- Indexes for table `payment_transaction`
--
ALTER TABLE `payment_transaction`
  ADD PRIMARY KEY (`Tans_Id`),
  ADD KEY `pay_id` (`Pay_Id`),
  ADD KEY `res_pack_id` (`Res_Pack_Id`);

--
-- Indexes for table `pay_citiauth`
--
ALTER TABLE `pay_citiauth`
  ADD PRIMARY KEY (`Auth_TraceNo`);

--
-- Indexes for table `pay_cititrace`
--
ALTER TABLE `pay_cititrace`
  ADD PRIMARY KEY (`TraceNo`);

--
-- Indexes for table `pending_automatchid`
--
ALTER TABLE `pending_automatchid`
  ADD PRIMARY KEY (`JobPostId`);

--
-- Indexes for table `pending_jobapplication_mail`
--
ALTER TABLE `pending_jobapplication_mail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plansowned`
--
ALTER TABLE `plansowned`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `plan_sms`
--
ALTER TABLE `plan_sms`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `index1` (`MasterPlanId`),
  ADD KEY `index2` (`UserId`);

--
-- Indexes for table `prev_employer`
--
ALTER TABLE `prev_employer`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `index1` (`UserId`,`ResumeId`);

--
-- Indexes for table `prev_employer_duplicate`
--
ALTER TABLE `prev_employer_duplicate`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `index1` (`UserId`,`ResumeId`);

--
-- Indexes for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD PRIMARY KEY (`RecommendId`),
  ADD KEY `ind_recomm_jobres` (`JobSeekerId`,`ResumeId`);

--
-- Indexes for table `release_order`
--
ALTER TABLE `release_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `release_order_details`
--
ALTER TABLE `release_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminder`
--
ALTER TABLE `reminder`
  ADD PRIMARY KEY (`RemId`),
  ADD KEY `index1` (`UserId`),
  ADD KEY `index2` (`SubUserId`);

--
-- Indexes for table `reminder_invitation_count`
--
ALTER TABLE `reminder_invitation_count`
  ADD PRIMARY KEY (`reminder_id`);

--
-- Indexes for table `rep_online_stat`
--
ALTER TABLE `rep_online_stat`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `SearchTime` (`SearchTime`);

--
-- Indexes for table `rep_online_stat_old`
--
ALTER TABLE `rep_online_stat_old`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `sTime_i` (`SearchTime`);

--
-- Indexes for table `resumeassessment`
--
ALTER TABLE `resumeassessment`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `resumelock`
--
ALTER TABLE `resumelock`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `index1` (`CseId`),
  ADD KEY `index2` (`TimeEntered`);

--
-- Indexes for table `resumevalidate`
--
ALTER TABLE `resumevalidate`
  ADD KEY `resumevalidate_idx1` (`CsIdentity`),
  ADD KEY `resumevalidate_idx2` (`DateAdded`),
  ADD KEY `resumevalidate_idx3` (`Status`),
  ADD KEY `index1` (`UserId`);

--
-- Indexes for table `resume_assessment_remark`
--
ALTER TABLE `resume_assessment_remark`
  ADD PRIMARY KEY (`remark_id`);

--
-- Indexes for table `resume_assessment_report`
--
ALTER TABLE `resume_assessment_report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `resume_cart`
--
ALTER TABLE `resume_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `res_feat`
--
ALTER TABLE `res_feat`
  ADD PRIMARY KEY (`Feat_Id`);

--
-- Indexes for table `res_pack`
--
ALTER TABLE `res_pack`
  ADD PRIMARY KEY (`Pack_Id`);

--
-- Indexes for table `res_pack_feat`
--
ALTER TABLE `res_pack_feat`
  ADD PRIMARY KEY (`Res_Pack_Id`),
  ADD KEY `pack_id` (`Pack_Id`),
  ADD KEY `feat_id` (`Feat_Id`);

--
-- Indexes for table `res_pack_feat_diwali_offer`
--
ALTER TABLE `res_pack_feat_diwali_offer`
  ADD PRIMARY KEY (`Res_Pack_Id`),
  ADD KEY `pack_id` (`Pack_Id`),
  ADD KEY `feat_id` (`Feat_Id`);

--
-- Indexes for table `res_pack_feat_yearendsale2010`
--
ALTER TABLE `res_pack_feat_yearendsale2010`
  ADD PRIMARY KEY (`Res_Pack_Id`),
  ADD KEY `pack_id` (`Pack_Id`),
  ADD KEY `feat_id` (`Feat_Id`);

--
-- Indexes for table `res_special_pack`
--
ALTER TABLE `res_special_pack`
  ADD PRIMARY KEY (`sub_pack_id`);

--
-- Indexes for table `RG_MAILER`
--
ALTER TABLE `RG_MAILER`
  ADD KEY `index1` (`Jobseeker_Id`);

--
-- Indexes for table `salary_cmp_det`
--
ALTER TABLE `salary_cmp_det`
  ADD PRIMARY KEY (`CmpId`),
  ADD KEY `ccode` (`CmpCode`);

--
-- Indexes for table `salary_graph`
--
ALTER TABLE `salary_graph`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ccode` (`CmpCode`);

--
-- Indexes for table `salary_graph_old`
--
ALTER TABLE `salary_graph_old`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ccode` (`CmpCode`);

--
-- Indexes for table `salary_graph_populate`
--
ALTER TABLE `salary_graph_populate`
  ADD PRIMARY KEY (`UserId`,`Resume_Id`);

--
-- Indexes for table `salesincharge`
--
ALTER TABLE `salesincharge`
  ADD PRIMARY KEY (`SalesInchargeId`);

--
-- Indexes for table `secondary_email`
--
ALTER TABLE `secondary_email`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `inx1` (`UserId`),
  ADD KEY `inx2` (`Email`);

--
-- Indexes for table `secondary_email_archive`
--
ALTER TABLE `secondary_email_archive`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`serviceId`);

--
-- Indexes for table `service_options`
--
ALTER TABLE `service_options`
  ADD PRIMARY KEY (`serviceOptionId`);

--
-- Indexes for table `session_clust_emp`
--
ALTER TABLE `session_clust_emp`
  ADD PRIMARY KEY (`UserId`,`SessionId`),
  ADD KEY `session_clus_emp_sess` (`SessionId`),
  ADD KEY `ind1` (`UserId`,`SubUserId`);

--
-- Indexes for table `session_clust_js`
--
ALTER TABLE `session_clust_js`
  ADD PRIMARY KEY (`UserId`,`SessionId`);

--
-- Indexes for table `smspayment`
--
ALTER TABLE `smspayment`
  ADD PRIMARY KEY (`SmsPayId`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `userName_i` (`User_Name`),
  ADD KEY `dateVisited_i` (`Date_Visited`);

--
-- Indexes for table `tm_js_details`
--
ALTER TABLE `tm_js_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dteadd_idx` (`date_added`),
  ADD KEY `uid_idx` (`userid`(25));

--
-- Indexes for table `toolbarcount`
--
ALTER TABLE `toolbarcount`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Invoiceno` (`InvoiceNo`),
  ADD KEY `index2` (`StartDate`),
  ADD KEY `index3` (`UserId`,`Status`),
  ADD KEY `index4` (`HostType`),
  ADD KEY `status_i` (`Status`),
  ADD KEY `index_cityid` (`City_OrderId`);

--
-- Indexes for table `validsmsreport`
--
ALTER TABLE `validsmsreport`
  ADD PRIMARY KEY (`DateAdded`);

--
-- Indexes for table `webservice_apilog`
--
ALTER TABLE `webservice_apilog`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `webservice_authentication`
--
ALTER TABLE `webservice_authentication`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Token` (`Token`);

--
-- Indexes for table `webservice_capdetails`
--
ALTER TABLE `webservice_capdetails`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `webservice_details`
--
ALTER TABLE `webservice_details`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `webservice_jobapplications`
--
ALTER TABLE `webservice_jobapplications`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `web_notification`
--
ALTER TABLE `web_notification`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `indexwe1` (`JobseekerId`),
  ADD KEY `indexwe2` (`DocRef`),
  ADD KEY `indexwe3` (`EmployerId`),
  ADD KEY `indexwe4` (`DateAdded`),
  ADD KEY `indexwe5` (`AlertType`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `Id` bigint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7915;
--
-- AUTO_INCREMENT for table `autosuggest_list`
--
ALTER TABLE `autosuggest_list`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1673;
--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `BranchId` bigint(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `broadcastdetails`
--
ALTER TABLE `broadcastdetails`
  MODIFY `BroadcastId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1187;
--
-- AUTO_INCREMENT for table `cj_ch_jobprompt`
--
ALTER TABLE `cj_ch_jobprompt`
  MODIFY `Jp_Id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4176330;
--
-- AUTO_INCREMENT for table `cj_ch_jobprompt_duplicate`
--
ALTER TABLE `cj_ch_jobprompt_duplicate`
  MODIFY `Jp_Id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4166940;
--
-- AUTO_INCREMENT for table `cj_ch_js_bday_rs_discount`
--
ALTER TABLE `cj_ch_js_bday_rs_discount`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6138375;
--
-- AUTO_INCREMENT for table `cj_ch_js_coverletter`
--
ALTER TABLE `cj_ch_js_coverletter`
  MODIFY `Cl_Id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=163319;
--
-- AUTO_INCREMENT for table `cj_ch_js_coverletter_duplicate`
--
ALTER TABLE `cj_ch_js_coverletter_duplicate`
  MODIFY `Cl_Id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=113685;
--
-- AUTO_INCREMENT for table `cj_ch_js_credentials`
--
ALTER TABLE `cj_ch_js_credentials`
  MODIFY `Cred_Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7884;
--
-- AUTO_INCREMENT for table `cj_ch_js_credentials_duplicate`
--
ALTER TABLE `cj_ch_js_credentials_duplicate`
  MODIFY `Cred_Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7467;
--
-- AUTO_INCREMENT for table `cj_ch_js_itskills`
--
ALTER TABLE `cj_ch_js_itskills`
  MODIFY `Skill_Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=926127;
--
-- AUTO_INCREMENT for table `cj_ch_js_itskills_duplicate`
--
ALTER TABLE `cj_ch_js_itskills_duplicate`
  MODIFY `Skill_Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=901848;
--
-- AUTO_INCREMENT for table `cj_ch_js_lang`
--
ALTER TABLE `cj_ch_js_lang`
  MODIFY `Lang_Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2104302;
--
-- AUTO_INCREMENT for table `cj_ch_js_lang_duplicate`
--
ALTER TABLE `cj_ch_js_lang_duplicate`
  MODIFY `Lang_Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2083007;
--
-- AUTO_INCREMENT for table `cj_ch_js_womenday_rs_discount`
--
ALTER TABLE `cj_ch_js_womenday_rs_discount`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cj_cst_mailing_list`
--
ALTER TABLE `cj_cst_mailing_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `cj_cst_mailing_list_details`
--
ALTER TABLE `cj_cst_mailing_list_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5873;
--
-- AUTO_INCREMENT for table `cj_cst_sms_list`
--
ALTER TABLE `cj_cst_sms_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cj_cst_sms_list_details`
--
ALTER TABLE `cj_cst_sms_list_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cj_emp_dirlistings_contact_cmp`
--
ALTER TABLE `cj_emp_dirlistings_contact_cmp`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4972;
--
-- AUTO_INCREMENT for table `cj_emp_dirlistings_review`
--
ALTER TABLE `cj_emp_dirlistings_review`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `cj_emp_jobpost_qual`
--
ALTER TABLE `cj_emp_jobpost_qual`
  MODIFY `Qual_Code` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=415;
--
-- AUTO_INCREMENT for table `cj_emp_sh_arcsvd_det`
--
ALTER TABLE `cj_emp_sh_arcsvd_det`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1119226;
--
-- AUTO_INCREMENT for table `cj_im_email_alert`
--
ALTER TABLE `cj_im_email_alert`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cj_im_employer`
--
ALTER TABLE `cj_im_employer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cj_im_jobpost`
--
ALTER TABLE `cj_im_jobpost`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cj_im_jobseeker`
--
ALTER TABLE `cj_im_jobseeker`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cj_jobs_on_phone`
--
ALTER TABLE `cj_jobs_on_phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=872;
--
-- AUTO_INCREMENT for table `cj_js_ivr_track`
--
ALTER TABLE `cj_js_ivr_track`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=613160;
--
-- AUTO_INCREMENT for table `cj_mast_city`
--
ALTER TABLE `cj_mast_city`
  MODIFY `City_Code` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=558;
--
-- AUTO_INCREMENT for table `cj_mast_education`
--
ALTER TABLE `cj_mast_education`
  MODIFY `Edu_Code` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `cj_mast_functional`
--
ALTER TABLE `cj_mast_functional`
  MODIFY `Func_Code` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `cj_mast_industry`
--
ALTER TABLE `cj_mast_industry`
  MODIFY `Ind_Code` int(6) NOT NULL AUTO_INCREMENT COMMENT 'Industrty Code, Unique id',AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `cj_mast_institute`
--
ALTER TABLE `cj_mast_institute`
  MODIFY `Instit_Code` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=344;
--
-- AUTO_INCREMENT for table `cj_mast_jobrole`
--
ALTER TABLE `cj_mast_jobrole`
  MODIFY `Jobr_Code` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1354;
--
-- AUTO_INCREMENT for table `cj_mast_pref_loc`
--
ALTER TABLE `cj_mast_pref_loc`
  MODIFY `Pref_Loc_Code` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=520;
--
-- AUTO_INCREMENT for table `cj_mast_specialization`
--
ALTER TABLE `cj_mast_specialization`
  MODIFY `Spec_Code` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=223;
--
-- AUTO_INCREMENT for table `cj_microsite_cadd`
--
ALTER TABLE `cj_microsite_cadd`
  MODIFY `cadd_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=294;
--
-- AUTO_INCREMENT for table `cj_rs_sms_track`
--
ALTER TABLE `cj_rs_sms_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=757;
--
-- AUTO_INCREMENT for table `cj_sms_apply_js`
--
ALTER TABLE `cj_sms_apply_js`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48597;
--
-- AUTO_INCREMENT for table `cj_sms_detail_log`
--
ALTER TABLE `cj_sms_detail_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `cj_sms_forward_cv_js`
--
ALTER TABLE `cj_sms_forward_cv_js`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=746;
--
-- AUTO_INCREMENT for table `cj_sms_transfail_js`
--
ALTER TABLE `cj_sms_transfail_js`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `clickjobs_branches`
--
ALTER TABLE `clickjobs_branches`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `consultants`
--
ALTER TABLE `consultants`
  MODIFY `Id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1470;
--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4134;
--
-- AUTO_INCREMENT for table `cse`
--
ALTER TABLE `cse`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=182;
--
-- AUTO_INCREMENT for table `cseprivilege`
--
ALTER TABLE `cseprivilege`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=263;
--
-- AUTO_INCREMENT for table `cst`
--
ALTER TABLE `cst`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `custom_payment`
--
ALTER TABLE `custom_payment`
  MODIFY `Pay_Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1783;
--
-- AUTO_INCREMENT for table `easycart_transaction`
--
ALTER TABLE `easycart_transaction`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=223;
--
-- AUTO_INCREMENT for table `employer`
--
ALTER TABLE `employer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100701;
--
-- AUTO_INCREMENT for table `employer_products`
--
ALTER TABLE `employer_products`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77039;
--
-- AUTO_INCREMENT for table `empsms`
--
ALTER TABLE `empsms`
  MODIFY `Id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7179;
--
-- AUTO_INCREMENT for table `empviewlist`
--
ALTER TABLE `empviewlist`
  MODIFY `Id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6727403;
--
-- AUTO_INCREMENT for table `emp_feat`
--
ALTER TABLE `emp_feat`
  MODIFY `Feat_Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `emp_pack`
--
ALTER TABLE `emp_pack`
  MODIFY `Pack_Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `emp_pack_feat`
--
ALTER TABLE `emp_pack_feat`
  MODIFY `Res_Pack_Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `emp_pack_price`
--
ALTER TABLE `emp_pack_price`
  MODIFY `Res_Price_Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `emp_report_invalidno`
--
ALTER TABLE `emp_report_invalidno`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=226;
--
-- AUTO_INCREMENT for table `emp_search_session`
--
ALTER TABLE `emp_search_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38720;
--
-- AUTO_INCREMENT for table `emp_sentmail`
--
ALTER TABLE `emp_sentmail`
  MODIFY `Id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27423997;
--
-- AUTO_INCREMENT for table `emp_templates`
--
ALTER TABLE `emp_templates`
  MODIFY `TempId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=299568;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `Id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `friends_network`
--
ALTER TABLE `friends_network`
  MODIFY `network_id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79513;
--
-- AUTO_INCREMENT for table `indexq`
--
ALTER TABLE `indexq`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2058478;
--
-- AUTO_INCREMENT for table `indexq_consultants`
--
ALTER TABLE `indexq_consultants`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2578;
--
-- AUTO_INCREMENT for table `indexq_dirlistings`
--
ALTER TABLE `indexq_dirlistings`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=591267;
--
-- AUTO_INCREMENT for table `indexq_emailalert`
--
ALTER TABLE `indexq_emailalert`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1909696;
--
-- AUTO_INCREMENT for table `indexq_js`
--
ALTER TABLE `indexq_js`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=954980;
--
-- AUTO_INCREMENT for table `interviewschedular`
--
ALTER TABLE `interviewschedular`
  MODIFY `Id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=906;
--
-- AUTO_INCREMENT for table `invitation`
--
ALTER TABLE `invitation`
  MODIFY `invitation_id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5706814;
--
-- AUTO_INCREMENT for table `invitation_final`
--
ALTER TABLE `invitation_final`
  MODIFY `invitation_id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5656302;
--
-- AUTO_INCREMENT for table `invitation_uniq`
--
ALTER TABLE `invitation_uniq`
  MODIFY `invitation_id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5656302;
--
-- AUTO_INCREMENT for table `jobapplications`
--
ALTER TABLE `jobapplications`
  MODIFY `Id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=209587423;
--
-- AUTO_INCREMENT for table `jobapplications_duplicate`
--
ALTER TABLE `jobapplications_duplicate`
  MODIFY `Id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=209385681;
--
-- AUTO_INCREMENT for table `jobpost`
--
ALTER TABLE `jobpost`
  MODIFY `JobPostId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1607779;
--
-- AUTO_INCREMENT for table `jobpost_mis`
--
ALTER TABLE `jobpost_mis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4327;
--
-- AUTO_INCREMENT for table `jsexpdetails`
--
ALTER TABLE `jsexpdetails`
  MODIFY `Exp_Id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `js_earnings`
--
ALTER TABLE `js_earnings`
  MODIFY `Js_Earnings_Id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25251;
--
-- AUTO_INCREMENT for table `js_earnings_dec29_tmp`
--
ALTER TABLE `js_earnings_dec29_tmp`
  MODIFY `Js_Earnings_Id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23778;
--
-- AUTO_INCREMENT for table `js_earnings_nov17`
--
ALTER TABLE `js_earnings_nov17`
  MODIFY `Js_Earnings_Id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18587;
--
-- AUTO_INCREMENT for table `js_emp_report_details`
--
ALTER TABLE `js_emp_report_details`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `js_payment_contact_details`
--
ALTER TABLE `js_payment_contact_details`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `js_recommended_jobs`
--
ALTER TABLE `js_recommended_jobs`
  MODIFY `Id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32542;
--
-- AUTO_INCREMENT for table `js_redeem_history`
--
ALTER TABLE `js_redeem_history`
  MODIFY `redeem_id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `js_relation`
--
ALTER TABLE `js_relation`
  MODIFY `earnings_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2792612;
--
-- AUTO_INCREMENT for table `js_resume_viewlist`
--
ALTER TABLE `js_resume_viewlist`
  MODIFY `Id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=918526;
--
-- AUTO_INCREMENT for table `js_resume_viewlist_org`
--
ALTER TABLE `js_resume_viewlist_org`
  MODIFY `Id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17945;
--
-- AUTO_INCREMENT for table `mailer`
--
ALTER TABLE `mailer`
  MODIFY `MailerId` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1136;
--
-- AUTO_INCREMENT for table `microsite`
--
ALTER TABLE `microsite`
  MODIFY `UserId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment_master`
--
ALTER TABLE `payment_master`
  MODIFY `Pay_Id` bigint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41223;
--
-- AUTO_INCREMENT for table `payment_transaction`
--
ALTER TABLE `payment_transaction`
  MODIFY `Tans_Id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51106;
--
-- AUTO_INCREMENT for table `pending_jobapplication_mail`
--
ALTER TABLE `pending_jobapplication_mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=801854;
--
-- AUTO_INCREMENT for table `plansowned`
--
ALTER TABLE `plansowned`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1494;
--
-- AUTO_INCREMENT for table `plan_sms`
--
ALTER TABLE `plan_sms`
  MODIFY `Id` bigint(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7446;
--
-- AUTO_INCREMENT for table `prev_employer`
--
ALTER TABLE `prev_employer`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=149578;
--
-- AUTO_INCREMENT for table `prev_employer_duplicate`
--
ALTER TABLE `prev_employer_duplicate`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recommendation`
--
ALTER TABLE `recommendation`
  MODIFY `RecommendId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=134802;
--
-- AUTO_INCREMENT for table `release_order`
--
ALTER TABLE `release_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `release_order_details`
--
ALTER TABLE `release_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reminder`
--
ALTER TABLE `reminder`
  MODIFY `RemId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=133;
--
-- AUTO_INCREMENT for table `reminder_invitation_count`
--
ALTER TABLE `reminder_invitation_count`
  MODIFY `reminder_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=355;
--
-- AUTO_INCREMENT for table `rep_online_stat`
--
ALTER TABLE `rep_online_stat`
  MODIFY `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4154;
--
-- AUTO_INCREMENT for table `rep_online_stat_old`
--
ALTER TABLE `rep_online_stat_old`
  MODIFY `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1756;
--
-- AUTO_INCREMENT for table `resumeassessment`
--
ALTER TABLE `resumeassessment`
  MODIFY `Id` bigint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16330;
--
-- AUTO_INCREMENT for table `resume_assessment_remark`
--
ALTER TABLE `resume_assessment_remark`
  MODIFY `remark_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `resume_assessment_report`
--
ALTER TABLE `resume_assessment_report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `resume_cart`
--
ALTER TABLE `resume_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `res_feat`
--
ALTER TABLE `res_feat`
  MODIFY `Feat_Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT for table `res_pack`
--
ALTER TABLE `res_pack`
  MODIFY `Pack_Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=243;
--
-- AUTO_INCREMENT for table `res_pack_feat`
--
ALTER TABLE `res_pack_feat`
  MODIFY `Res_Pack_Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT for table `res_pack_feat_diwali_offer`
--
ALTER TABLE `res_pack_feat_diwali_offer`
  MODIFY `Res_Pack_Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `res_pack_feat_yearendsale2010`
--
ALTER TABLE `res_pack_feat_yearendsale2010`
  MODIFY `Res_Pack_Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `res_special_pack`
--
ALTER TABLE `res_special_pack`
  MODIFY `sub_pack_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `salary_cmp_det`
--
ALTER TABLE `salary_cmp_det`
  MODIFY `CmpId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=507;
--
-- AUTO_INCREMENT for table `salary_graph`
--
ALTER TABLE `salary_graph`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `salary_graph_old`
--
ALTER TABLE `salary_graph_old`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `salesincharge`
--
ALTER TABLE `salesincharge`
  MODIFY `SalesInchargeId` bigint(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT for table `secondary_email`
--
ALTER TABLE `secondary_email`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2920613;
--
-- AUTO_INCREMENT for table `secondary_email_archive`
--
ALTER TABLE `secondary_email_archive`
  MODIFY `Id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=71067;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `serviceId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `service_options`
--
ALTER TABLE `service_options`
  MODIFY `serviceOptionId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `smspayment`
--
ALTER TABLE `smspayment`
  MODIFY `SmsPayId` bigint(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `Id` bigint(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=685021;
--
-- AUTO_INCREMENT for table `tm_js_details`
--
ALTER TABLE `tm_js_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=536224;
--
-- AUTO_INCREMENT for table `toolbarcount`
--
ALTER TABLE `toolbarcount`
  MODIFY `Id` bigint(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3022;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `Id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19519;
--
-- AUTO_INCREMENT for table `webservice_apilog`
--
ALTER TABLE `webservice_apilog`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=916;
--
-- AUTO_INCREMENT for table `webservice_authentication`
--
ALTER TABLE `webservice_authentication`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=354;
--
-- AUTO_INCREMENT for table `webservice_capdetails`
--
ALTER TABLE `webservice_capdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1437;
--
-- AUTO_INCREMENT for table `webservice_details`
--
ALTER TABLE `webservice_details`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `web_notification`
--
ALTER TABLE `web_notification`
  MODIFY `Id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=614952;