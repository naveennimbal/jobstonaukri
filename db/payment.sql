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


CREATE TABLE `salesUser` (
  salesUserId int AUTO_INCREMENT PRIMARY KEY ,
  username VARCHAR(25) NOT NULL ,
  password VARCHAR(30) NOT NULL ,
  parentId INT DEFAULT "1" NOT NULL ,
  roleId INT DEFAULT "1" NOT NULL ,
  agencyId INT DEFAULT "1" NOT NULL ,
  mobile VARCHAR(15) NOT NULL ,
  email VARCHAR(60) NOT NULL ,
  status TINYINT DEFAULT 1 ,
  dateAdded DATE DEFAULT current_date ON UPDATE CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE payment add column salesUserId int  , ADD COLUMN verified TINYINT DEFAULT 0 AFTER tlName;

CREATE TABLE role (
  roleId int AUTO_INCREMENT PRIMARY KEY ,
  roleName VARCHAR(10) NOT NULL ,
  status TINYINT DEFAULT 1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE payment add column capture int default 0 after orderId ;
