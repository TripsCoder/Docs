-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ctask_errorlog`
--

DROP TABLE IF EXISTS `ctask_errorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_errorlog` (
  `Id` bigint(20) NOT NULL,
  `Server` varchar(50) NOT NULL,
  `Job` varchar(50) DEFAULT NULL,
  `Trigger` varchar(50) DEFAULT NULL,
  `Message` text,
  `Description` longtext,
  `Type` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_eventlog`
--

DROP TABLE IF EXISTS `ctask_eventlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_eventlog` (
  `Id` bigint(20) NOT NULL,
  `Job` varchar(50) DEFAULT NULL,
  `Trigger` varchar(50) DEFAULT NULL,
  `Server` varchar(50) DEFAULT NULL,
  `Message` varchar(200) NOT NULL,
  `Description` longtext,
  `CreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LogType` int(11) NOT NULL DEFAULT '0',
  `Level` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_executelog`
--

DROP TABLE IF EXISTS `ctask_executelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_executelog` (
  `Id` bigint(20) NOT NULL,
  `Job` varchar(50) NOT NULL,
  `Trigger` varchar(50) NOT NULL,
  `Server` varchar(10) NOT NULL,
  `BeginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EndTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RecordTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` int(11) NOT NULL,
  `Message` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_job`
--

DROP TABLE IF EXISTS `ctask_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_job` (
  `Id` varchar(50) NOT NULL,
  `Group` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Type` int(11) NOT NULL,
  `RunType` int(11) NOT NULL DEFAULT '0',
  `Status` int(11) NOT NULL DEFAULT '0',
  `Description` varchar(100) DEFAULT NULL,
  `UpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `JobPath` text,
  `JobFileName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_jobfile`
--

DROP TABLE IF EXISTS `ctask_jobfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_jobfile` (
  `Id` bigint(20) NOT NULL,
  `Job` varchar(50) NOT NULL,
  `Title` text NOT NULL,
  `Path` text NOT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_jobgroup`
--

DROP TABLE IF EXISTS `ctask_jobgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_jobgroup` (
  `Code` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Parent` varchar(50) NOT NULL,
  `Root` varchar(50) NOT NULL,
  `Level` int(11) NOT NULL,
  `Remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_jobserverhost`
--

DROP TABLE IF EXISTS `ctask_jobserverhost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_jobserverhost` (
  `Server` varchar(50) NOT NULL,
  `Job` varchar(50) NOT NULL,
  `RunStatus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Job`,`Server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_servernode`
--

DROP TABLE IF EXISTS `ctask_servernode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_servernode` (
  `Id` varchar(50) NOT NULL,
  `InstanceName` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Status` int(11) NOT NULL,
  `Host` varchar(200) DEFAULT NULL,
  `ThreadCount` int(11) NOT NULL,
  `ThreadPriority` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_trigger`
--

DROP TABLE IF EXISTS `ctask_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_trigger` (
  `Id` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text,
  `Job` varchar(50) NOT NULL,
  `ApplyTo` int(11) NOT NULL DEFAULT '0',
  `PrevFireTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NextFireTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Priority` int(11) NOT NULL DEFAULT '0',
  `Status` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '0',
  `ConditionType` int(11) NOT NULL DEFAULT '0',
  `StartTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EndTime` datetime DEFAULT NULL,
  `MisFireType` int(11) NOT NULL DEFAULT '0',
  `FireTotalCount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_triggerannualcondition`
--

DROP TABLE IF EXISTS `ctask_triggerannualcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_triggerannualcondition` (
  `TriggerId` varchar(50) NOT NULL,
  `Month` int(11) NOT NULL,
  `Day` int(11) NOT NULL,
  `Include` bit(1) NOT NULL,
  PRIMARY KEY (`Day`,`Month`,`TriggerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_triggerdailycondition`
--

DROP TABLE IF EXISTS `ctask_triggerdailycondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_triggerdailycondition` (
  `TriggerId` varchar(50) NOT NULL,
  `BeginTime` varchar(50) NOT NULL,
  `EndTime` varchar(50) NOT NULL,
  `Inversion` bit(1) NOT NULL,
  PRIMARY KEY (`TriggerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_triggerexpression`
--

DROP TABLE IF EXISTS `ctask_triggerexpression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_triggerexpression` (
  `TriggerId` varchar(50) NOT NULL,
  `Option` int(11) NOT NULL,
  `ValueType` int(11) NOT NULL,
  `BeginValue` int(11) DEFAULT NULL,
  `EndValue` int(11) DEFAULT NULL,
  `ArrayValue` text,
  PRIMARY KEY (`Option`,`TriggerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_triggerexpressioncondition`
--

DROP TABLE IF EXISTS `ctask_triggerexpressioncondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_triggerexpressioncondition` (
  `TriggerId` varchar(50) NOT NULL,
  `ConditionOption` int(11) NOT NULL,
  `ValueType` int(11) NOT NULL,
  `BeginValue` int(11) DEFAULT NULL,
  `EndValue` int(11) DEFAULT NULL,
  `ArrayValue` text,
  PRIMARY KEY (`ConditionOption`,`TriggerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_triggerfulldatecondition`
--

DROP TABLE IF EXISTS `ctask_triggerfulldatecondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_triggerfulldatecondition` (
  `TriggerId` varchar(50) NOT NULL,
  `Date` datetime NOT NULL,
  `Include` bit(1) NOT NULL,
  PRIMARY KEY (`Date`,`TriggerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_triggermonthlycondition`
--

DROP TABLE IF EXISTS `ctask_triggermonthlycondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_triggermonthlycondition` (
  `TriggerId` varchar(50) NOT NULL,
  `Day` int(11) NOT NULL,
  `Include` bit(1) NOT NULL,
  PRIMARY KEY (`Day`,`TriggerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_triggerserver`
--

DROP TABLE IF EXISTS `ctask_triggerserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_triggerserver` (
  `Trigger` varchar(50) NOT NULL,
  `Server` varchar(50) NOT NULL,
  `RunStatus` int(11) NOT NULL DEFAULT '0',
  `LastFireDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NextFireDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Server`,`Trigger`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_triggersimple`
--

DROP TABLE IF EXISTS `ctask_triggersimple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_triggersimple` (
  `TriggerId` varchar(50) NOT NULL,
  `RepeatCount` int(11) NOT NULL DEFAULT '0',
  `RepeatInterval` bigint(20) NOT NULL,
  `RepeatForever` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`TriggerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctask_triggerweeklycondition`
--

DROP TABLE IF EXISTS `ctask_triggerweeklycondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctask_triggerweeklycondition` (
  `TriggerId` varchar(50) NOT NULL,
  `Day` int(11) NOT NULL,
  `Include` bit(1) NOT NULL,
  PRIMARY KEY (`Day`,`TriggerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_authority`
--

DROP TABLE IF EXISTS `sys_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_authority` (
  `Code` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `AuthType` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Sort` int(11) NOT NULL,
  `AuthGroup` bigint(20) NOT NULL,
  `Remark` varchar(50) DEFAULT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_authoritybindoperation`
--

DROP TABLE IF EXISTS `sys_authoritybindoperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_authoritybindoperation` (
  `AuthorithOperation` bigint(20) NOT NULL,
  `AuthorityCode` varchar(50) NOT NULL,
  PRIMARY KEY (`AuthorithOperation`,`AuthorityCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_authoritygroup`
--

DROP TABLE IF EXISTS `sys_authoritygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_authoritygroup` (
  `SysNo` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `SortIndex` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Parent` bigint(20) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT '0',
  `Remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SysNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_authorityoperation`
--

DROP TABLE IF EXISTS `sys_authorityoperation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_authorityoperation` (
  `SysNo` bigint(20) NOT NULL,
  `ControllerCode` varchar(100) NOT NULL,
  `ActionCode` varchar(100) NOT NULL,
  `Method` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `Group` bigint(20) NOT NULL,
  `AuthorizeType` int(11) NOT NULL DEFAULT '0',
  `Remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SysNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_authorityoperationgroup`
--

DROP TABLE IF EXISTS `sys_authorityoperationgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_authorityoperationgroup` (
  `SysNo` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `Parent` bigint(20) NOT NULL,
  `Root` bigint(20) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT '0',
  `Status` int(11) NOT NULL DEFAULT '0',
  `Remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SysNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `SysNo` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Level` int(11) NOT NULL,
  `Parent` bigint(20) NOT NULL,
  `SortIndex` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `Remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SysNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_roleauthorize`
--

DROP TABLE IF EXISTS `sys_roleauthorize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_roleauthorize` (
  `Role` bigint(20) NOT NULL,
  `Authority` varchar(50) NOT NULL,
  PRIMARY KEY (`Authority`,`Role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `SysNo` bigint(20) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `RealName` varchar(50) NOT NULL,
  `Pwd` varchar(50) NOT NULL,
  `UserType` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Mobile` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `QQ` varchar(15) DEFAULT NULL,
  `SuperUser` bit(1) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `LastLoginDate` datetime NOT NULL,
  PRIMARY KEY (`SysNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_userauthorize`
--

DROP TABLE IF EXISTS `sys_userauthorize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_userauthorize` (
  `User` bigint(20) NOT NULL,
  `Authority` varchar(50) NOT NULL,
  `Disable` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Authority`,`User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_userrole`
--

DROP TABLE IF EXISTS `sys_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_userrole` (
  `UserSysNo` bigint(20) NOT NULL,
  `RoleSysNo` bigint(20) NOT NULL,
  PRIMARY KEY (`RoleSysNo`,`UserSysNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

