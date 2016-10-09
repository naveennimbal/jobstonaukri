CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL PRIMARY KEY auto_increment,
  `name` varchar(30) NOT NULL,
  `email` varchar(80) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `amount` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
