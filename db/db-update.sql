CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `pageTitle` varchar(150) DEFAULT 'No Title ',
  `content` text,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 