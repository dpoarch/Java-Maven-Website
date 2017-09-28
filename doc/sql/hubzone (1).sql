-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 05, 2012 at 11:42 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hubzone`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE IF NOT EXISTS `candidate` (
  `candidateID` varchar(30) NOT NULL,
  `message_text` longtext NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `candidateAltPhone` varchar(30) DEFAULT NULL,
  `candidateCity` varchar(50) NOT NULL,
  `candidateEmail` varchar(100) NOT NULL,
  `candidateFirstName` varchar(30) NOT NULL,
  `candidateLastName` varchar(30) NOT NULL,
  `candidatePrimaryPhone` varchar(30) NOT NULL,
  `candidateState` varchar(50) NOT NULL,
  `candidateZip` varchar(10) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `highestEducationLevel` varchar(30) NOT NULL,
  `jobCategory` varchar(10) NOT NULL,
  `residentStatus` varchar(30) NOT NULL,
  `resumeFile` varchar(30) NOT NULL,
  `salaryLevel` varchar(30) NOT NULL,
  PRIMARY KEY (`candidateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`candidateID`, `message_text`, `address1`, `address2`, `candidateAltPhone`, `candidateCity`, `candidateEmail`, `candidateFirstName`, `candidateLastName`, `candidatePrimaryPhone`, `candidateState`, `candidateZip`, `date_of_birth`, `highestEducationLevel`, `jobCategory`, `residentStatus`, `resumeFile`, `salaryLevel`) VALUES
('sujan', '', 'Ulleråkersvägen 46 B, Lgh 1222', NULL, '0762489978 ', 'Uppsala', 'sujanctg2005@gmail.com', 'Sujan', 'Nath', '0762489978 ', 'Uppsala', '75643', '1985-11-28', '', 'IT', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE IF NOT EXISTS `employer` (
  `employerID` varchar(30) NOT NULL,
  `CompanyCity` varchar(50) NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `CompanyState` varchar(50) NOT NULL,
  `CompanyStreetAddress1` varchar(255) NOT NULL,
  `CompanyStreetAddress2` varchar(255) NOT NULL,
  `CompanyZip` varchar(50) NOT NULL,
  `JobsEmail` varchar(255) NOT NULL,
  `POCEmail` varchar(255) NOT NULL,
  `POCFirstName` varchar(255) NOT NULL,
  `POCLastName` varchar(255) NOT NULL,
  `POCPrimaryPhone` varchar(255) NOT NULL,
  `POCSecondaryPhone` varchar(255) NOT NULL,
  `subscriptionLevel` varchar(50) NOT NULL,
  PRIMARY KEY (`employerID`),
  UNIQUE KEY `employerID` (`employerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`employerID`, `CompanyCity`, `CompanyName`, `CompanyState`, `CompanyStreetAddress1`, `CompanyStreetAddress2`, `CompanyZip`, `JobsEmail`, `POCEmail`, `POCFirstName`, `POCLastName`, `POCPrimaryPhone`, `POCSecondaryPhone`, `subscriptionLevel`) VALUES
('dtn', 'Washington', 'Dice Talent Network', 'Washington', 'Bill Hoffman ,Trusted Force ,1050 Connecticut Ave. NW ,Suite 1000', '', '20036', 'jobs@trustedforce.com', 'jobs@trustedforce.com', 'Bill ', 'Hoffman', '(202) 223-1000', '', 'Monthly');

-- --------------------------------------------------------

--
-- Table structure for table `jobcategories`
--

CREATE TABLE IF NOT EXISTS `jobcategories` (
  `JobCategoryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `JobCategoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`JobCategoryID`),
  UNIQUE KEY `JobCategoryName` (`JobCategoryName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `jobcategories`
--

INSERT INTO `jobcategories` (`JobCategoryID`, `JobCategoryName`) VALUES
(20, 'Accounting/Finance'),
(33, 'Advertisement/Event Mgt'),
(21, 'Bank/Insurance/Leasing'),
(22, 'Commercial/Supply Chain'),
(32, 'Customer Support/Call Centre'),
(38, 'Data Entry/Operator/BPO'),
(28, 'Design/Creative'),
(23, 'Education/Training'),
(24, 'Engineer/Architects'),
(25, 'Garments/Textile'),
(27, 'Gen Mgt/Admin'),
(26, 'HR/Org. Development'),
(30, 'IT & Telecommunication'),
(31, 'Marketing/Sales'),
(34, 'Medical/Pharmaceuticals'),
(35, 'NGO/Development'),
(29, 'Others'),
(36, 'Research/Consultancy'),
(37, 'Secretary/Receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `jobID` bigint(20) NOT NULL AUTO_INCREMENT,
  `JobCategoryName` varchar(50) NOT NULL,
  `jobCity` varchar(50) NOT NULL,
  `jobDuration` varchar(15) NOT NULL,
  `JobKeyWord` varchar(50) NOT NULL,
  `jobRate` varchar(10) NOT NULL,
  `jobState` varchar(100) NOT NULL,
  `jobSummary` longtext NOT NULL,
  `jobTitle` varchar(100) NOT NULL,
  `JobZip` varchar(10) NOT NULL,
  `lastDate` date DEFAULT NULL,
  `jobEmployer` varchar(30) NOT NULL,
  PRIMARY KEY (`jobID`),
  KEY `FK235076B92CD7F2` (`jobEmployer`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`jobID`, `JobCategoryName`, `jobCity`, `jobDuration`, `JobKeyWord`, `jobRate`, `jobState`, `jobSummary`, `jobTitle`, `JobZip`, `lastDate`, `jobEmployer`) VALUES
(1, 'IT & Telecommunication', 'Arlington, VA', 'FullTime', 'Java J2EE, JSP, Struts ', '88k-108k', 'Alabama', 'We are seeking bright and creative Developers to join our ranks. The Sr Java Developer position requires the candidate to maintain existing applications, as well as participate in product design, development and implementation of new applications. The ideal candidate is a team player who seeks to enhance his or her knowledge base, and work in a truly outstanding environment with small, highly skilled teams.\r\nThis role will support O&M and development activities for applications within the portfolio for fixes, and enhancements. Contributes to the development of new applications and utilities. Implement all developmental activities based on a structured SDLC approach and methodology. Drives SOA compliance in accordance with the EA strategy and end state architecture. Conduct performance tuning of applications and assist team members by reviewing code and provide suggestions to developers to ensure code productivity.\r\nThe ideal candidate will possess the following qualifications:\r\n3 – 5 years strong programming expertise in Java, J2EE (EJBs, servlets, JSP, struts ) and XML technologies.\r\nJQuery, JSF, CSS, HTML, Java, Ajax, and Spring.\r\nXBRL, XML, ETL tools ( such as Ab initio, Data Stage)\r\nStrong understanding of Data integration between Legacy repositories and systems.\r\nHands-on Oracle SOA Suite (such as BPEL, Oracle Service Bus (OSB))\r\nHands on experience publishing and consuming WebServices.\r\nInfrastructure (ESB) implementation and/or BPEL would be preferred.\r\nStrong understanding and Hands-on Data persistence and Service Oriented Architectures (SOA)\r\nArchitecture and Design patterns and Hands-on (Hibernate, iBATIS ORM tools and framework). Solid Hands-on user interface skills\r\nWill be able to performance tune applications and assist team members by reviewing code and provide suggestions to developers.\r\n\r\n**This is not a telework position\r\n \r\n**Ability to obtain a Public Trust Clearance required\r\n** Must be a US Citizen or authorized to work in the US without sponsorship', 'Senior Java/J2EE Developer', '20036', '2012-10-31', 'dtn'),
(2, 'IT & Telecommunication', ' Richmond, VA  ', 'FullTime', 'Java Servlets, JSP, EJB 3.0, JDBC, XML, HTML/JavaS', 'Negotiable', 'Alabama', 'We are accepting direct applications only.  NO THIRD PARTY AGENCIES/STAFFING COMPANIES.\r\n\r\nDESCRIPTION\r\n\r\nEntivia Solutions is looking for an experienced Java developer to work on client engagements. \r\n\r\nEntivia does not currently sponsor H1B visas. \r\n\r\nPlease submit your resume along with the desired hourly rate/salary information.\r\n\r\nEntivia Solutions is a management and technology consultancy headquartered in Richmond, VA. Our clients rely on Entivia''s services and expertise in the areas of Enterprise \r\nArchitecture and Strategy, Portfolio/Program/Project Management, Full Lifecycle System Development, System Integration and Service-Oriented Architecture Implementation.\r\n\r\n\r\n\r\nJob Description:\r\n\r\n\r\nTranslates complex business requirements into technical requirements and solutions.\r\nDevelops, tests, and implements application solutions which may involve diverse development platforms, software, hardware, technologies and tools. \r\nPerforms full life cycle development of information systems; analysis, design, development, testing, and implementation of large automated systems\r\nResearches and evaluates alternative solutions and creates proposals to meet business needs. \r\nAnalyzes existing systems against IT and business strategies and makes well-defined recommendations and execution plans for efficiency and architecture/design improvements within and outside the execution of current projects. \r\nDesigns and architects new subsystems or major enhancements to existing systems \r\nCreates software artifacts from which the system will be created for developers. \r\nReviews physical and technical designs of systems, ensuring sound decisions are being made. \r\n\r\nQualifications: \r\n\r\n\r\nBachelor''s Degree in Computer Science or a related discipline or an equivalent combination of education and work experience. \r\n7 years experience in the IT industry\r\n5 years experience in a role of Java develop\r\n1+ years experience in an architecture/design role\r\nStrong working knowledge with at least one major Java EE based application server - preferably Weblogic 10.x  or JBOSS\r\nAdvanced proficiency with Java EE technologies; including Java Servlets, JSP, EJB 3.0, JDBC, XML, HTML/JavaScript\r\nStrong working knowledge of messaging APIs (JMS). \r\nWorking knowledge of any major RDBMS (preferably Oracle & SQL Server)\r\nStrong SQL capabilities\r\nExperience working with Hibernate, Struts, Spring Framework, Spring MVC\r\nExperience working with Linux, Tomcat, Apache\r\nExperience with Agile development practices\r\nExperienced in developing and documenting use case scenarios\r\nExperience developing domain and data models\r\nExperience developing prototypes for application design\r\nExperienced in conducting development activities using stringent source code control procedures \r\nExperience with package solutions a plus:  Oracle SOA Suite, ATG, Tibco ESB, etc \r\nExperience utilizing open source/third party library functionality\r\nExperience using the Rational toolset\r\nMobile device development experience a plus. ', 'Java Developer', '23229', '2012-10-31', 'dtn'),
(3, 'IT & Telecommunication', ' Richmond, VA  ', 'FullTime', 'Java Servlets, JSP', 'Negotiable', 'Alabama', 'We are accepting direct applications only.  NO THIRD PARTY AGENCIES/STAFFING COMPANIES.\r\n\r\nDESCRIPTION\r\n\r\nEntivia Solutions is looking for an experienced Java developer to work on client engagements. \r\n\r\nEntivia does not currently sponsor H1B visas. \r\n\r\nPlease submit your resume along with the desired hourly rate/salary information.\r\n\r\nEntivia Solutions is a management and technology consultancy headquartered in Richmond, VA. Our clients rely on Entivia''s services and expertise in the areas of Enterprise \r\nArchitecture and Strategy, Portfolio/Program/Project Management, Full Lifecycle System Development, System Integration and Service-Oriented Architecture Implementation.\r\n\r\n\r\n\r\nJob Description:\r\n\r\n\r\nTranslates complex business requirements into technical requirements and solutions.\r\nDevelops, tests, and implements application solutions which may involve diverse development platforms, software, hardware, technologies and tools. \r\nPerforms full life cycle development of information systems; analysis, design, development, testing, and implementation of large automated systems\r\nResearches and evaluates alternative solutions and creates proposals to meet business needs. \r\nAnalyzes existing systems against IT and business strategies and makes well-defined recommendations and execution plans for efficiency and architecture/design improvements within and outside the execution of current projects. \r\nDesigns and architects new subsystems or major enhancements to existing systems \r\nCreates software artifacts from which the system will be created for developers. \r\nReviews physical and technical designs of systems, ensuring sound decisions are being made. \r\n\r\nQualifications: \r\n\r\n\r\nBachelor''s Degree in Computer Science or a related discipline or an equivalent combination of education and work experience. \r\n7 years experience in the IT industry\r\n5 years experience in a role of Java develop\r\n1+ years experience in an architecture/design role\r\nStrong working knowledge with at least one major Java EE based application server - preferably Weblogic 10.x  or JBOSS\r\nAdvanced proficiency with Java EE technologies; including Java Servlets, JSP, EJB 3.0, JDBC, XML, HTML/JavaScript\r\nStrong working knowledge of messaging APIs (JMS). \r\nWorking knowledge of any major RDBMS (preferably Oracle & SQL Server)\r\nStrong SQL capabilities\r\nExperience working with Hibernate, Struts, Spring Framework, Spring MVC\r\nExperience working with Linux, Tomcat, Apache\r\nExperience with Agile development practices\r\nExperienced in developing and documenting use case scenarios\r\nExperience developing domain and data models\r\nExperience developing prototypes for application design\r\nExperienced in conducting development activities using stringent source code control procedures \r\nExperience with package solutions a plus:  Oracle SOA Suite, ATG, Tibco ESB, etc \r\nExperience utilizing open source/third party library functionality\r\nExperience using the Rational toolset\r\nMobile device development experience a plus. ', 'Java Developer', '23229', '2012-10-31', 'dtn');

-- --------------------------------------------------------

--
-- Table structure for table `jobsapplied`
--

CREATE TABLE IF NOT EXISTS `jobsapplied` (
  `jobsApplied` bigint(20) NOT NULL AUTO_INCREMENT,
  `candidateID` varchar(30) NOT NULL,
  `jobID` bigint(20) NOT NULL,
  `ApplyDate` datetime DEFAULT NULL,
  PRIMARY KEY (`jobsApplied`),
  KEY `FK963E2727DDB8DF82` (`candidateID`),
  KEY `FK963E2727AC3FBD2D` (`jobID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jobsapplied`
--

INSERT INTO `jobsapplied` (`jobsApplied`, `candidateID`, `jobID`, `ApplyDate`) VALUES
(1, 'sujan', 1, '2012-11-29 00:00:00'),
(2, 'sujan', 2, '2012-11-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `StateID` bigint(20) NOT NULL AUTO_INCREMENT,
  `StateName` varchar(20) NOT NULL,
  PRIMARY KEY (`StateID`),
  UNIQUE KEY `StateName` (`StateName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`StateID`, `StateName`) VALUES
(1, 'Alabama'),
(2, 'Alaska'),
(3, 'Arizona'),
(4, 'Arkansas'),
(5, 'California'),
(6, 'Colorado'),
(7, 'Connecticut'),
(8, 'Delaware'),
(9, 'Florida'),
(10, 'Georgia'),
(11, 'Hawaii'),
(12, 'Idaho'),
(13, 'Illinois'),
(14, 'Indiana'),
(15, 'Iowa'),
(16, 'Kansas'),
(17, 'Kentucky'),
(18, 'Louisiana'),
(19, 'Maine'),
(20, 'Maryland'),
(21, 'Massachusetts'),
(22, 'Michigan'),
(23, 'Minnesota'),
(24, 'Mississippi'),
(25, 'Missouri'),
(26, 'Montana'),
(27, 'Nebraska'),
(28, 'Nevada'),
(29, 'New Hampshire'),
(30, 'New Jersey'),
(31, 'New Mexico'),
(32, 'New York'),
(33, 'North Carolina'),
(34, 'North Dakota'),
(35, 'Ohio'),
(36, 'Oklahoma'),
(37, 'Oregon'),
(38, 'Pennsylvania'),
(39, 'Rhode Island'),
(40, 'South Carolina'),
(41, 'South Dakota'),
(42, 'Tennessee'),
(43, 'Texas'),
(44, 'Utah'),
(45, 'Vermont'),
(46, 'Virginia'),
(47, 'Washington'),
(48, 'West Virginia'),
(49, 'Wisconsin'),
(50, 'Wyoming');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_name` varchar(30) NOT NULL,
  `enabled` int(11) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_name`, `enabled`, `password`, `role`) VALUES
('moin', 1, '123', 'ROLE_CAN'),
('sujan', 1, '123', 'ROLE_EMP');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `FK235076B92CD7F2` FOREIGN KEY (`jobEmployer`) REFERENCES `employer` (`employerID`);

--
-- Constraints for table `jobsapplied`
--
ALTER TABLE `jobsapplied`
  ADD CONSTRAINT `FK963E2727AC3FBD2D` FOREIGN KEY (`jobID`) REFERENCES `jobs` (`jobID`),
  ADD CONSTRAINT `FK963E2727DDB8DF82` FOREIGN KEY (`candidateID`) REFERENCES `candidate` (`candidateID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
