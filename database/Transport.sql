/*
SQLyog Community Edition- MySQL GUI v5.23 RC2
Host - 5.0.27-community : Database - Transport
*********************************************************************
Server version : 5.0.27-community
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists 'Transport';

USE 'Transport';

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table 'busmaster' */

DROP TABLE IF EXISTS 'busmaster';

CREATE TABLE 'busmaster' (
  `BusID` varchar(20) NOT NULL,
  `BusNo` varchar(50) NOT NULL,
  `BusType` varchar(50) default NULL,
  `ActiveStatus` varchar(50) default '1',
  PRIMARY KEY  (`BusID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `busmaster` */

insert  into `busmaster`(`BusID`,`BusNo`,`BusType`,`ActiveStatus`) values ('B1','ABC1999','Own','1'),('B2','ABD2000','Hire','1'),('B3','Ap10z5546','Own','1'),('B4','Ap43534','Own','1'),('B5','fdf455','Own','2');

/*Table structure for table `busrequest` */

DROP TABLE IF EXISTS `busrequest`;

CREATE TABLE `busrequest` (
  `RequestID` varchar(20) NOT NULL,
  `EmpNo` varchar(50) NOT NULL,
  `RouteCode` varchar(50) default NULL,
  `CategoryCode` varchar(100) default NULL,
  `Location` varchar(50) default NULL,
  `Address` varchar(200) default NULL,
  `StartDate` date default NULL,
  `Status` varchar(20) default NULL,
  `PickupPoint` varchar(100) default NULL,
  `ActiveStatus` int(1) default '1',
  PRIMARY KEY  (`RequestID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `busrequest` */

insert  into `busrequest`(`RequestID`,`EmpNo`,`RouteCode`,`CategoryCode`,`Location`,`Address`,`StartDate`,`Status`,`PickupPoint`,`ActiveStatus`) values ('RB1','345435','B','A','fhfg','fghgfhf,dgdf','2007-10-10','Approved','bbbb',0),('RB2','2343','A',NULL,'hyderabad','dfgfdg,nbmvbnsd','2000-01-20','Approved','Mehadipatnam',0),('RB3','657657','B','A','hyderabad','fghfg,werwer','2000-01-01','Open','Patny',1),('RB4','43543','A',NULL,'hyderabad','sdjfkjdsf,hysdfsdfkj','2000-01-01','Cancel','Gachibowly',0),('RB5','455','B',NULL,'ssdfd','dfgdfg,dfgdfg','0000-00-00','Approved','bbbb',1),('RB6','324324','B','A','gdfg','dfgdfg,dfgdfg','2007-10-03','Approved','bbbb',1),('RB7','45435','A',NULL,'dfgdfg','dfgfdgfd','2000-01-01','Cancel','ksdfh',0),('RB8','2222','B','ShortDistance','www','wwww','2000-01-04','Approved','bbbb',1),('RB9','333','A','LongDistance','hyderabad','asdf','2007-10-01','Open','ksdfh',1);

/*Table structure for table `cabmaster` */

DROP TABLE IF EXISTS `cabmaster`;

CREATE TABLE `cabmaster` (
  `CabID` varchar(20) NOT NULL,
  `CabRegNo` varchar(50) default NULL,
  `DriverCode` varchar(50) default NULL,
  `TravelsName` varchar(100) default NULL,
  `ActiveStatus` varchar(50) default NULL,
  PRIMARY KEY  (`CabID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `cabmaster` */

insert  into `cabmaster`(`CabID`,`CabRegNo`,`DriverCode`,`TravelsName`,`ActiveStatus`) values ('CAB1','ewr3432','dgfdg','dfgdfg',NULL),('CAB2','sdf','fdgfd','dfgfdg',NULL),('CAB3','sf3243','dfgdf','dfgdfg',NULL),('CAB4','AXC2232','raju','raj travells',NULL),('CAB5','ABCD1981','Raju','Raj Travels',NULL);

/*Table structure for table `cabrequest` */

DROP TABLE IF EXISTS `cabrequest`;

CREATE TABLE `cabrequest` (
  `RequestID` varchar(20) NOT NULL,
  `EmpNo` varchar(50) NOT NULL,
  `EmpMailID` varchar(200) default NULL,
  `DateOfRequest` date default NULL,
  `Time` varchar(100) default NULL,
  `From` varchar(200) default NULL,
  `To` varchar(200) default NULL,
  `CabID` varchar(100) default NULL,
  `ApproversMailID` varchar(200) default NULL,
  `Status` varchar(100) default NULL,
  PRIMARY KEY  (`RequestID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `cabrequest` */

insert  into `cabrequest`(`RequestID`,`EmpNo`,`EmpMailID`,`DateOfRequest`,`Time`,`From`,`To`,`CabID`,`ApproversMailID`,`Status`) values ('RC1','55555','kals_kals@xyz.com','2000-01-11','10:20','Campus','Central Railway Station','','Ram_ram@xyz.com','Open'),('RC2','88888','dfgfd@xyz.com','2007-01-12','22:10','Campus','Mehadipatnam','CAB3','dfgfd@xyz.com','Approved'),('RC5','88989','asedf@xyz.com','2000-01-19','11:09','asdef','asddff','','asedf@xyz.com','Open'),('RC6','88989','asdf@xyz.com','2000-01-19','10:20','asdf','asdf','','asdf@xyz.com','Open'),('RC7','2222','kalyan@xyz.com','2007-10-15','22:00','Campus','Miyapur','CAB4','harish@ghi.com','Open'),('RC8','6666','kalyan@ghi.com','2000-01-27','22:30','Campus','Mehdipatnam','CAB5','harish@ghi.com','Open');

/*Table structure for table `categorymaster` */

DROP TABLE IF EXISTS `categorymaster`;

CREATE TABLE `categorymaster` (
  `CategoryID` int(20) NOT NULL auto_increment,
  `CategoryCode` varchar(20) NOT NULL,
  `Amount` float default NULL,
  `Distance` int(11) default '1',
  `MinDistance` int(11) default '1',
  PRIMARY KEY  (`CategoryID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `categorymaster` */

insert  into `categorymaster`(`CategoryID`,`CategoryCode`,`Amount`,`Distance`,`MinDistance`) values (1,'ShortDistance',800,12,1),(2,'MediumDistance',1000,25,13),(3,'LongDistance',1250,40,26);

/*Table structure for table `drivermaster` */

DROP TABLE IF EXISTS `drivermaster`;

CREATE TABLE `drivermaster` (
  `DriverID` varchar(20) NOT NULL,
  `DriverName` varchar(50) NOT NULL,
  `LicenseNo` varchar(100) default NULL,
  `PhoneNo` int(20) default NULL,
  PRIMARY KEY  (`DriverID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `drivermaster` */

/*Table structure for table `employeemaster` */

DROP TABLE IF EXISTS `employeemaster`;

CREATE TABLE `employeemaster` (
  `EmpNo` varchar(50) NOT NULL,
  `EmpName` varchar(50) default NULL,
  `EmpMailID` varchar(100) default NULL,
  `Department` varchar(100) default NULL,
  `Designation` varchar(100) default NULL,
  `PhoneNo` int(20) default NULL,
  PRIMARY KEY  (`EmpNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `employeemaster` */

insert  into `employeemaster`(`EmpNo`,`EmpName`,`EmpMailID`,`Department`,`Designation`,`PhoneNo`) values ('222','asdf','asdf@xyz.com','Delivery','ProjectLead',234234),('24324','gfdg','dfdfg@xyz.com','Transport','SoftwareEngineer',245354),('32432','harish','harish@ghi.com','Delivery','ProjectManager',35345435),('333','asdfsdf','asdf@xyz.com','Testing','TechLead',2323423),('34234','fghfgh','vrf@bd.com','HRD','HRManager',233559),('34345','sdfsdf','sdf@xyz.com','Delivery','TraineeSoftwareEngineer',324234),('43545','dfgdfg','dfgfd@xyz.com','Delivery','ProjectManager',223223);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userid` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `auth` int(5) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`userid`,`password`,`auth`) values ('admin','admin',0),('approver','approver',1),('fgdf','dfgfg',3),('guest','guest',3),('kalyan','kalyan',0),('transport','transport',2);

/*Table structure for table `routedetails` */

DROP TABLE IF EXISTS `routedetails`;

CREATE TABLE `routedetails` (
  `RouteID` varchar(100) default NULL,
  `PickupPoint` varchar(200) default NULL,
  `Distance` int(20) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `routedetails` */

insert  into `routedetails`(`RouteID`,`PickupPoint`,`Distance`) values ('R1','ffgjh',45),('R1','ksdfh',34),('R2','bbbb',10),('R1','trry',34),('R2','dfgdf',23),('R3','SRNagar',25),('R3','Patnycenter',35),('R1','kukatpally',10);

/*Table structure for table `routemaster` */

DROP TABLE IF EXISTS `routemaster`;

CREATE TABLE `routemaster` (
  `RouteID` varchar(20) NOT NULL,
  `RouteCode` varchar(50) NOT NULL,
  `Destination` varchar(100) default NULL,
  `InBoundTime` varchar(100) default NULL,
  `OutBoundtime` varchar(100) default NULL,
  `BusID` varchar(50) default NULL,
  `Location` varchar(100) default NULL,
  `ActiveStatus` int(1) default '1',
  PRIMARY KEY  (`RouteID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `routemaster` */

insert  into `routemaster`(`RouteID`,`RouteCode`,`Destination`,`InBoundTime`,`OutBoundtime`,`BusID`,`Location`,`ActiveStatus`) values ('R1','A','Mehdipatnam','08:30','17:30','B1','Hyderabad',1),('R2','B','Secundrabad','09:00','19:00','B2','Hyderabad',1),('R3','C','secundrabad','09:30','09:30','B5','hyderabad',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
