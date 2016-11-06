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
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
