CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `pageTitle` varchar(150) DEFAULT 'No Title ',
  `content` text,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1



ALTER TABLE `jobseekers`
DROP `Xml`,
DROP `BlogUrl`,
DROP `JobPrompt`,
DROP `SiteId`,
DROP `Res_Phone_Auth`,
DROP `KioskID`,
DROP `BranchID`,
DROP `Res_Cnt`,
DROP `Mob_Cnt`,
DROP `Current_Resume`,
DROP `Block_Comp`,
DROP `Name_Flag`,
DROP `Email_Flag`,
DROP `Mailing_Flag`,
DROP `Contact_Flag`,
DROP `Shield_Type`,
DROP `Res_P_Status`,
DROP `Res_UP_Status`,
DROP `Res_UM_Status`,
DROP `Res_Mod_Status`,
DROP `Res_UMod_Status`,
DROP `Delete_Oth_Res`,
DROP `AutoApply`,
DROP `EmailActive`;



ALTER TABLE jobseekers modify UserId varchar(50);
ALTER TABLE jobseekers DROP primary key;

ALTER TABLE jobseekers add column jsId int auto_increment primary key first;


CREATE TABLE js_profile (
profileId int not null auto_increment primary key ,
jsId int not null ,
headline varchar(200) null default "No Headline",
curDesignation varchar(30) default "Not Mentioned",
curCompanyId int null,
curLocation int default "0",
prefLocation int default "0",
functionalArea int ,
curRole char(30) default "Not Available",
industryId int ,
totExp varchar(10) default "0",
salary float(2.2) default "0.0",
highestEducation int default "0",
keySkils varchar(500) default "Not Available",
dateAdded datetime ,
dateModified timestamp default current_timestamp on update current_timestamp);

ALTER TABLE cj_ch_jobseekers_res_det ADD COLUMN jsId int NOT NULL AFTER Res_Id;


