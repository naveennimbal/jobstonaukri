-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2016 at 05:51 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `clickjobsnew`
--

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `serviceId` int(11) NOT NULL,
  `serviceTitle` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`serviceId`, `serviceTitle`, `content`, `status`, `dateAdded`) VALUES
(1, 'Job Search Assistant', '				<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n        \r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	">Job Search Assistant where we go extra mile for candidates) service works as your personal Relationship Manager providing <br><br>\r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">Tailored value addition at every step of your job seeking - right from Job Search, profile optimization to company research. <br><br>\r\n\r\n        </p><p style="text-align:justify; font-size:15px; line-height:25px;	">Job Search Management is equipped to efficiently manage your job hunt so that you reach your career goals effortlessly.<br><br>\r\n\r\n            <strong>Our team of experienced professionals who come from HR/ Recruitment background works as your Relationship Manager.</strong><br>\r\n        </p><ul style="font-size:15px; line-height:30px;">\r\n            <li style="list-style:disc;">The Relationship Manager working with you who will have interactions with you in span of 6 months to start your job search.</li>\r\n            <li style="list-style:disc;">The Relationship Manager search for the relevant and matching job vacancies using your profile details, preferences and on the basis of market availability.</li>\r\n            <li style="list-style:disc;">The Relationship Manager will submit applications on your behalf, once you approve the job which has been searched by him/her and your  Relationship Manager will also  provides the Company Profile details to you  on the basis of availability</li>\r\n        </ul><br><br>\r\n        Personal Relationship Manager will get in touch with you within 48 to 72 Business working hours of Order Activation. Relationship <br><br>\r\n        Manager will take your profile information and job preferences details in order to initiate your Job Search Assistant Services.\r\n\r\n\r\n\r\n        <br><br>\r\n        <strong>Service charges: - Rs 11000/- INR </strong><br><br>\r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n            </div>\r\n</div>', 1, '2016-06-11 11:31:13'),
(2, 'Profile Highlighter', '<div class="row">\r\n    <div class="col-md-12 min-height-400">\r\n       \r\n        <strong>Get Enhanced visibility for your profile among recruiters on <a href="#">Jobstonaukri.com</a></strong><br><br>\r\n        <p style="text-align:justify; font-size:15px; line-height:25px;	"> Get more visibility in a recruiter search and stand a better chance of catching their attention amongst millions of candidate profiles on <a href="#">Jobstonaukri.com</a> with this premium service.<br><br>\r\n\r\n            <strong>Benefits</strong><br>\r\n        </p><ul style="font-size:15px; line-height:30px;">\r\n            <li style="list-style:disc;">Get your profile highlighted amongst the recruiter search results.</li>\r\n            <li style="list-style:disc;">Differentiate your profile from the rest of candidate listings.</li>\r\n        </ul>\r\n        <br><br>\r\n        <strong>Service charges: - Rs 1000/- INR for 1year.</strong><br><br>\r\n        <strong>Service charges: - Rs 1500/- INR for 2year.</strong><br><br>\r\n        <strong>Service charges: - Rs 2000/- INR for 3year.</strong><br><br>\r\n        <p></p>\r\n\r\n        <div class="clearfix"></div>\r\n        <br>\r\n\r\n        <center>\r\n            <site bottom_banners="">\r\n            </site></center>\r\n    </div>\r\n\r\n   \r\n    <div class="clearfix"></div>\r\n</div>', 1, '2016-06-12 22:50:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`serviceId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `serviceId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
  
  
  
  
  -- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2016 at 05:53 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `clickjobsnew`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_options`
--

INSERT INTO `service_options` (`serviceOptionId`, `serviceId`, `optionTitle`, `price`, `additional`, `status`, `dateAdded`) VALUES
(1, 1, '', 9000, 0, 1, '2016-06-11 11:31:55'),
(2, 2, '1 Year', 1000, 0, 1, '2016-06-12 22:51:26'),
(3, 2, '2 Year', 1500, 0, 1, '2016-06-12 22:51:26'),
(4, 2, '3 Year', 2000, 0, 1, '2016-06-12 22:51:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `service_options`
--
ALTER TABLE `service_options`
  ADD PRIMARY KEY (`serviceOptionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `service_options`
--
ALTER TABLE `service_options`
  MODIFY `serviceOptionId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
  
  
  
  
  
  -- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2016 at 10:23 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `clickjobsnew`
--

-- --------------------------------------------------------

--
-- Table structure for table `resume_cart`
--

CREATE TABLE `resume_cart` (
  `cartId` int(11) NOT NULL,
  `userId` varchar(40) NOT NULL,
  `serviceId` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `resume_cart`
--
ALTER TABLE `resume_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `resume_cart`
--
ALTER TABLE `resume_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT;
  
  
  ALTER TABLE resume_cart MODIFY userId VARCHAR(50) NOT NULL DEFAULT 0;