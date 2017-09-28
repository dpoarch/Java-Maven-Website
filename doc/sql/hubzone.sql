/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50529
 Source Host           : localhost
 Source Database       : hubzone

 Target Server Type    : MySQL
 Target Server Version : 50529
 File Encoding         : utf-8

 Date: 02/01/2013 11:34:13 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `Employer`
-- ----------------------------
DROP TABLE IF EXISTS `Employer`;
CREATE TABLE `Employer` (
  `employerID` varchar(255) NOT NULL,
  `CompanyCity` varchar(50) DEFAULT NULL,
  `CompanyState` varchar(50) DEFAULT NULL,
  `CompanyStreetAddress1` varchar(255) DEFAULT NULL,
  `CompanyStreetAddress2` varchar(255) DEFAULT NULL,
  `CompanyZip` varchar(50) DEFAULT NULL,
  `JobsEmail` varchar(255) DEFAULT NULL,
  `POCEmail` varchar(255) DEFAULT NULL,
  `POCFirstName` varchar(255) DEFAULT NULL,
  `POCLastName` varchar(255) DEFAULT NULL,
  `POCPrimaryPhone` varchar(255) DEFAULT NULL,
  `POCSecondaryPhone` varchar(255) DEFAULT NULL,
  `CompanyName` varchar(255) DEFAULT NULL,
  `subscriptionLevel` varchar(50) DEFAULT NULL,
  `jobCountLimit` int(11) DEFAULT NULL,
  PRIMARY KEY (`employerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `Employer`
-- ----------------------------
BEGIN;
INSERT INTO `Employer` VALUES ('bill', 'Alston', 'Georgia', 'W Broad Street', '', '30412', null, 'gates@yahoo.com', 'Bill', 'Gates', '+932450984', '', 'Bill Gates', 'Weekly', '5'), ('dtn', 'Atlanta', null, 'Atlanta', 'Atlanta', '300303', 'jobs@trustedforce.com', 'apple@apple.com', 'Apple', 'Apple', '332323233', '23232323', 'Apple', null, '12'), ('employ', 'employ', null, 'employ', 'employ', '12121', null, 'employ@gmail.com', 'employ', 'employ', '23232321', '312121e', 'employ', 'Daily', '5'), ('ibcs', '  asas', 'Alabama', ' asas', '  sadasd', ' 12312', 'jobs@ibcs.com', ' asds@yahoo.com', ' asd', ' asdas', ' asdas', ' asda', 'ibcs primax', 'Daily', '5'), ('ibcs1', 'as', 'Colorado', 'asa', 'as', '123', 'as@yahoo.com', 'as', 'asa', 'asas', 'as', 'as', 'asas', 'Monthly', '5'), ('new', null, null, null, null, null, null, null, null, null, null, null, null, null, '6'), ('seef', 'seef', null, 'seef', 'seef', '12134434', null, 'seef@gmail.com', 'seef', 'seef', '323254654', '424434341', 'seef', 'Daily', '5'), ('test1', 'Lilburn', 'Georgia', 'test1', 'test1', '303303', null, 'test1@example.com', 'test1', 'test1', '323232', '232323232', 'test1', 'Daily', '5');
COMMIT;

-- ----------------------------
--  Table structure for `Jobs`
-- ----------------------------
DROP TABLE IF EXISTS `Jobs`;
CREATE TABLE `Jobs` (
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
  `jobEmployer` varchar(255) NOT NULL,
  `salaryLevel` varchar(30) NOT NULL,
  PRIMARY KEY (`jobID`),
  KEY `FK235076B92CD7F2` (`jobEmployer`),
  CONSTRAINT `FK235076B92CD7F2` FOREIGN KEY (`jobEmployer`) REFERENCES `employer` (`employerID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `Jobs`
-- ----------------------------
BEGIN;
INSERT INTO `Jobs` VALUES ('1', 'IT', 'Arlington', 'Full Time', 'Java, JSP, Struts ', 'Negotiable', 'Georgia', 'We are seeking bright and creative Developers to join our ranks. The Sr Java Developer position requires the candidate to maintain existing applications, as well as participate in product design, development and implementation of new applications. The ideal candidate is a team player who seeks to enhance his or her knowledge base, and work in a truly outstanding environment with small, highly skilled teams.\r\nThis role will support O&M and development activities for applications within the portfolio for fixes, and enhancements. Contributes to the development of new applications and utilities. Implement all developmental activities based on a structured SDLC approach and methodology. Drives SOA compliance in accordance with the EA strategy and end state architecture. Conduct performance tuning of applications and assist team members by reviewing code and provide suggestions to developers to ensure code productivity.\r\nThe ideal candidate will possess the following qualifications:\r\n3 â€“ 5 years strong programming expertise in Java, J2EE (EJBs, servlets, JSP, struts ) and XML technologies.\r\nJQuery, JSF, CSS, HTML, Java, Ajax, and Spring.\r\nXBRL, XML, ETL tools ( such as Ab initio, Data Stage)\r\nStrong understanding of Data integration between Legacy repositories and systems.\r\nHands-on Oracle SOA Suite (such as BPEL, Oracle Service Bus (OSB))\r\nHands on experience publishing and consuming WebServices.\r\nInfrastructure (ESB) implementation and/or BPEL would be preferred.\r\nStrong understanding and Hands-on Data persistence and Service Oriented Architectures (SOA)\r\nArchitecture and Design patterns and Hands-on (Hibernate, iBATIS ORM tools and framework). Solid Hands-on user interface skills\r\nWill be able to performance tune applications and assist team members by reviewing code and provide suggestions to developers.\r\n\r\n**This is not a telework position\r\n \r\n**Ability to obtain a Public Trust Clearance required\r\n** Must be a US Citizen or authorized to work in the US without sponsorship', 'Senior Java/J2EE Developer', '22214', '2013-12-31', 'dtn', ''), ('2', 'IT', 'Richmond', 'Full Time', 'Java Servlets, JSP, EJB 3.0, JDBC, XML, HTML/JavaS', 'Negotiable', 'Virginia', 'We are accepting direct applications only.  NO THIRD PARTY AGENCIES/STAFFING COMPANIES.\r\n\r\nDESCRIPTION\r\n\r\nEntivia Solutions is looking for an experienced Java developer to work on client engagements. \r\n\r\nEntivia does not currently sponsor H1B visas. \r\n\r\nPlease submit your resume along with the desired hourly rate/salary information.\r\n\r\nEntivia Solutions is a management and technology consultancy headquartered in Richmond, VA. Our clients rely on Entivia\'s services and expertise in the areas of Enterprise \r\nArchitecture and Strategy, Portfolio/Program/Project Management, Full Lifecycle System Development, System Integration and Service-Oriented Architecture Implementation.\r\n\r\n\r\n\r\nJob Description:\r\n\r\n\r\nTranslates complex business requirements into technical requirements and solutions.\r\nDevelops, tests, and implements application solutions which may involve diverse development platforms, software, hardware, technologies and tools. \r\nPerforms full life cycle development of information systems; analysis, design, development, testing, and implementation of large automated systems\r\nResearches and evaluates alternative solutions and creates proposals to meet business needs. \r\nAnalyzes existing systems against IT and business strategies and makes well-defined recommendations and execution plans for efficiency and architecture/design improvements within and outside the execution of current projects. \r\nDesigns and architects new subsystems or major enhancements to existing systems \r\nCreates software artifacts from which the system will be created for developers. \r\nReviews physical and technical designs of systems, ensuring sound decisions are being made. \r\n\r\nQualifications: \r\n\r\n\r\nBachelor\'s Degree in Computer Science or a related discipline or an equivalent combination of education and work experience. \r\n7 years experience in the IT industry\r\n5 years experience in a role of Java develop\r\n1+ years experience in an architecture/design role\r\nStrong working knowledge with at least one major Java EE based application server - preferably Weblogic 10.x  or JBOSS\r\nAdvanced proficiency with Java EE technologies; including Java Servlets, JSP, EJB 3.0, JDBC, XML, HTML/JavaScript\r\nStrong working knowledge of messaging APIs (JMS). \r\nWorking knowledge of any major RDBMS (preferably Oracle & SQL Server)\r\nStrong SQL capabilities\r\nExperience working with Hibernate, Struts, Spring Framework, Spring MVC\r\nExperience working with Linux, Tomcat, Apache\r\nExperience with Agile development practices\r\nExperienced in developing and documenting use case scenarios\r\nExperience developing domain and data models\r\nExperience developing prototypes for application design\r\nExperienced in conducting development activities using stringent source code control procedures \r\nExperience with package solutions a plus:  Oracle SOA Suite, ATG, Tibco ESB, etc \r\nExperience utilizing open source/third party library functionality\r\nExperience using the Rational toolset\r\nMobile device development experience a plus. ', 'Java Developer', '23269', '2013-02-28', 'dtn', ''), ('3', 'IT', 'Richmond', 'Full Time', 'Java Servlets, JSP', 'Negotiable', 'Virginia', 'We are accepting direct applications only.  NO THIRD PARTY AGENCIES/STAFFING COMPANIES.\r\n\r\nDESCRIPTION\r\n\r\nEntivia Solutions is looking for an experienced Java developer to work on client engagements. \r\n\r\nEntivia does not currently sponsor H1B visas. \r\n\r\nPlease submit your resume along with the desired hourly rate/salary information.\r\n\r\nEntivia Solutions is a management and technology consultancy headquartered in Richmond, VA. Our clients rely on Entivia\'s services and expertise in the areas of Enterprise \r\nArchitecture and Strategy, Portfolio/Program/Project Management, Full Lifecycle System Development, System Integration and Service-Oriented Architecture Implementation.\r\n\r\n\r\n\r\nJob Description:\r\n\r\n\r\nTranslates complex business requirements into technical requirements and solutions.\r\nDevelops, tests, and implements application solutions which may involve diverse development platforms, software, hardware, technologies and tools. \r\nPerforms full life cycle development of information systems; analysis, design, development, testing, and implementation of large automated systems\r\nResearches and evaluates alternative solutions and creates proposals to meet business needs. \r\nAnalyzes existing systems against IT and business strategies and makes well-defined recommendations and execution plans for efficiency and architecture/design improvements within and outside the execution of current projects. \r\nDesigns and architects new subsystems or major enhancements to existing systems \r\nCreates software artifacts from which the system will be created for developers. \r\nReviews physical and technical designs of systems, ensuring sound decisions are being made. \r\n\r\nQualifications: \r\n\r\n\r\nBachelor\'s Degree in Computer Science or a related discipline or an equivalent combination of education and work experience. \r\n7 years experience in the IT industry\r\n5 years experience in a role of Java develop\r\n1+ years experience in an architecture/design role\r\nStrong working knowledge with at least one major Java EE based application server - preferably Weblogic 10.x  or JBOSS\r\nAdvanced proficiency with Java EE technologies; including Java Servlets, JSP, EJB 3.0, JDBC, XML, HTML/JavaScript\r\nStrong working knowledge of messaging APIs (JMS). \r\nWorking knowledge of any major RDBMS (preferably Oracle & SQL Server)\r\nStrong SQL capabilities\r\nExperience working with Hibernate, Struts, Spring Framework, Spring MVC\r\nExperience working with Linux, Tomcat, Apache\r\nExperience with Agile development practices\r\nExperienced in developing and documenting use case scenarios\r\nExperience developing domain and data models\r\nExperience developing prototypes for application design\r\nExperienced in conducting development activities using stringent source code control procedures \r\nExperience with package solutions a plus:  Oracle SOA Suite, ATG, Tibco ESB, etc \r\nExperience utilizing open source/third party library functionality\r\nExperience using the Rational toolset\r\nMobile device development experience a plus. ', 'Java Developer', '23229', '2013-02-28', 'dtn', ''), ('5', 'Others', 'Albany', 'Full Time', 'Java, Spring, Hibernate', 'Negotiable', 'Georgia', 'this is a software engineer job at Albany', 'Software Developer', '31704', '2013-02-13', 'ibcs', ''), ('6', 'Finance', 'Albany', 'Full Time', 'Cicso, networking, protocol', 'Negotiable', 'Georgia', 'this is a system engineer job at albany', 'System Engineer', '31708', '2013-02-19', 'ibcs', ''), ('7', 'Finance', 'Lilburn', 'Full Time', 'management', 'Negotiable', 'Georgia', 'asdas', 'Human Resource Management', '30047', '2013-02-13', 'ibcs', ''), ('8', 'Finance', 'Lilburn', 'Full Time', 'Java', 'Negotiable', 'Georgia', 'asdas', 'Java', '30047', '2013-02-22', 'ibcs', ''), ('10', 'Finance', 'Atlanta', 'Full Time', 'BBA', 'Negotiable', 'Georgia', 'This is a job in atlanta with zip 30301', 'Accounting', '30301', '2013-02-27', 'dtn', ''), ('12', 'Finance', 'Atlanta', 'Full Time', 'Marketing', 'Negotiable', 'Georgia', 'This is a job in Atlanta of zip 30311', 'Marketing', '30311', '2013-01-31', 'dtn', ''), ('17', 'Others', 'Atlanta', 'Full Time', 'Banking', 'Negotiable', 'Georgia', 'this is a job in atlanta in zip 30330', 'Banking', '30340', '2013-02-28', 'dtn', ''), ('18', 'Others', 'Atlanta', 'Full Time', 'Art', 'Negotiable', 'Georgia', 'This is an art job at atlanta of zip 30359', 'Design', '30359', '2013-02-06', 'dtn', ''), ('19', 'Finance', 'Augusta', 'Full Time', 'Accounting', 'Negotiable', 'Georgia', 'This is an accounting Job at Augusta of zip 30912', 'Accounting', '30912', '2013-02-15', 'dtn', '');
COMMIT;

-- ----------------------------
--  Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminID` varchar(30) NOT NULL,
  `adminFirstName` varchar(30) NOT NULL,
  `adminLastName` varchar(30) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `admin`
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES ('habib', 'Mohammad', 'Habib');
COMMIT;

-- ----------------------------
--  Table structure for `candidate`
-- ----------------------------
DROP TABLE IF EXISTS `candidate`;
CREATE TABLE `candidate` (
  `candidateID` varchar(30) NOT NULL,
  `message_text` longtext,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `candidateAltPhone` varchar(30) DEFAULT NULL,
  `candidateCity` varchar(50) DEFAULT NULL,
  `candidateEmail` varchar(100) DEFAULT NULL,
  `candidateFirstName` varchar(30) DEFAULT NULL,
  `candidateLastName` varchar(30) DEFAULT NULL,
  `candidatePrimaryPhone` varchar(30) DEFAULT NULL,
  `candidateState` varchar(50) DEFAULT NULL,
  `candidateZip` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `highestEducationLevel` varchar(30) DEFAULT NULL,
  `jobCategory` varchar(100) DEFAULT NULL,
  `residentStatus` varchar(30) DEFAULT NULL,
  `resumeFile` varchar(400) DEFAULT NULL,
  `salaryLevel` varchar(30) DEFAULT NULL,
  `candidateDescription` longtext,
  `desiredPosition` varchar(100) DEFAULT NULL,
  `candidateSkill` varchar(100) DEFAULT NULL,
  `lastUpdateDate` date DEFAULT NULL,
  `jobStatus` varchar(100) DEFAULT NULL,
  `recentEmployer` varchar(100) DEFAULT NULL,
  `recentJobDescription` varchar(100) DEFAULT NULL,
  `recentJobTitle` varchar(100) DEFAULT NULL,
  `lastSchoolAttended` varchar(100) DEFAULT NULL,
  `resumeContenttype` varchar(50) DEFAULT NULL,
  `resumeFileDesc` varchar(50) DEFAULT NULL,
  `salaryLevelText` varchar(30) NOT NULL,
  PRIMARY KEY (`candidateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `candidate`
-- ----------------------------
BEGIN;
INSERT INTO `candidate` VALUES ('dhaka', null, 'Alston', 'Alston', '4469341', 'Alston', null, 'dhaka', 'dhaka', '332323', 'Georgia', '30412', null, 'No Degree', 'Finance', 'US Citizen', '/Users/tauseefalnoor/Documents/workspace-sts-2.9.2.RELEASE1/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/hubzone/WEB-INF/cv/Resume_Sunny_Abdullah.pdf', 'Negotiable', 'Accountant. ', 'Senior Accountant ', 'java,c,python,php,html,etc', '2012-12-11', 'Contractual', 'Walmart', 'Work on Accounting.', 'Accountant', null, null, null, ''), ('moin', null, 'Grant Park', 'Grant Park', '7483434834', 'Atlanta', null, 'Moin', 'Uddin', '+8801914626937', 'Georgia', '30303', null, 'Bachelors Degree', 'IT', 'H1B or Other Work Visa', 'moin_cv.pdf', '50k-75k', 'Mobile Application Development.', 'Software Engineer', 'C, Java, Objective-C', '2012-12-11', 'Fulltime', 'Apple', 'Worked on Objective C, Java, J2EE, Java Script. \r\n\r\nWebsite Design.', 'Senior Software Engineer', 'BUET', 'application/pdf', 'moin', ''), ('sohel', null, 'West view', 'Atlanta', '7001041041', 'Atlanta', null, 'Hanif', 'Sohel', '+73592258927895', 'Georgia', '30303', null, 'Bachelors Degree', 'IT', 'US Citizen', null, '50k-75k', ' Testing.\r\nDesing.\r\n', 'SQA', 'Testing, Java, PHP', '2012-12-01', 'Fulltime', '3D Security Inc.', 'White box testing.\r\nBlack box testing.\r\nReport .\r\nDesign.\r\nTesting.', 'QA', null, null, null, ''), ('sujan', null, 'Atlanta', 'Atlanta', '0762489978 ', 'Atlanta', 'sujanctg2005@gmail.com', 'Sujan', 'Nath', '0762489978 ', 'Georgia', '30303', null, 'No Degree', null, 'US Citizen', null, 'Negotiable', 'Skill: Java, j2ee.\r\nWebsite Development.\r\n', 'Senior Software Engineer', 'java, Spring, Hibernate', null, 'Parttime', 'Google', null, null, null, null, null, ''), ('tauseef', null, 'Lilburn', 'Lilburn', '32323232', 'Lilburn', null, 'Tauseef', 'Al Noor', '02943759235', 'Georgia', '30048', null, 'No Degree', 'Finance', 'US Citizen', null, 'Negotiable', 'Name:\r\nInstitution name; ', 'Senior Software Engineer', 'Java J2EE, Struts', '2012-12-11', 'Fulltime', 'Microsoft', '.net , C, C++, etc.\r\nProject:\r\nNavigation Software.\r\nWebsite. \r\nMobile application.etc.', 'Software Engineer', 'SUST', null, null, ''), ('test2', null, 'test2', 'test2', null, 'Atlanta', null, 'test2', 'test2', '3232323', 'Georgia', '30330', null, 'Bachelors Degree', 'Clerical/Administrative', 'US Citizen', null, 'Negotiable', 'describe', 'Senior Engineer', 'c,java', '2012-12-27', 'Fulltime', 'Apple', 'new job', 'Engineer', null, null, null, ''), ('threed', null, 'Grant Park', '', null, 'LIlburn', null, 'Threed', 'Threed', '+875934582', 'Georgia', '30048', null, 'Bachelors Degree', 'IT', 'US Citizen', null, '125k-150k', 'this is the candidate description', 'Program Manager', 'UML', '2012-12-13', 'Fulltime', 'Google', 'this is a job description', 'Program Manager', 'MIT', null, null, '');
COMMIT;

-- ----------------------------
--  Table structure for `jobcategories`
-- ----------------------------
DROP TABLE IF EXISTS `jobcategories`;
CREATE TABLE `jobcategories` (
  `JobCategoryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `JobCategoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`JobCategoryID`),
  UNIQUE KEY `JobCategoryName` (`JobCategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `jobcategories`
-- ----------------------------
BEGIN;
INSERT INTO `jobcategories` VALUES ('27', 'Clerical/Administrative'), ('32', 'Customer Service'), ('20', 'Finance'), ('26', 'Human Resources'), ('30', 'IT'), ('22', 'Manual Laborer'), ('29', 'Others'), ('21', 'Sales'), ('23', 'Training');
COMMIT;

-- ----------------------------
--  Table structure for `jobsapplied`
-- ----------------------------
DROP TABLE IF EXISTS `jobsapplied`;
CREATE TABLE `jobsapplied` (
  `jobsApplied` bigint(20) NOT NULL AUTO_INCREMENT,
  `ApplyDate` datetime DEFAULT NULL,
  `candidateID` varchar(30) NOT NULL,
  `jobID` bigint(20) NOT NULL,
  PRIMARY KEY (`jobsApplied`),
  KEY `FK963E2727DDB8DF82` (`candidateID`),
  KEY `FK963E2727AC3FBD2D` (`jobID`),
  CONSTRAINT `FK963E2727AC3FBD2D` FOREIGN KEY (`jobID`) REFERENCES `jobs` (`jobID`),
  CONSTRAINT `FK963E2727DDB8DF82` FOREIGN KEY (`candidateID`) REFERENCES `candidate` (`candidateID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `jobsapplied`
-- ----------------------------
BEGIN;
INSERT INTO `jobsapplied` VALUES ('1', '2012-11-29 00:00:00', 'sujan', '1'), ('2', '2012-11-22 00:00:00', 'sujan', '2');
COMMIT;

-- ----------------------------
--  Table structure for `states`
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `StateID` bigint(20) NOT NULL AUTO_INCREMENT,
  `StateName` varchar(20) NOT NULL,
  PRIMARY KEY (`StateID`),
  UNIQUE KEY `StateName` (`StateName`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `states`
-- ----------------------------
BEGIN;
INSERT INTO `states` VALUES ('1', 'Alabama'), ('2', 'Alaska'), ('3', 'Arizona'), ('4', 'Arkansas'), ('5', 'California'), ('6', 'Colorado'), ('7', 'Connecticut'), ('8', 'Delaware'), ('51', 'District of Columbia'), ('9', 'Florida'), ('10', 'Georgia'), ('11', 'Hawaii'), ('12', 'Idaho'), ('13', 'Illinois'), ('14', 'Indiana'), ('15', 'Iowa'), ('16', 'Kansas'), ('17', 'Kentucky'), ('18', 'Louisiana'), ('19', 'Maine'), ('20', 'Maryland'), ('21', 'Massachusetts'), ('22', 'Michigan'), ('23', 'Minnesota'), ('24', 'Mississippi'), ('25', 'Missouri'), ('26', 'Montana'), ('27', 'Nebraska'), ('28', 'Nevada'), ('29', 'New Hampshire'), ('30', 'New Jersey'), ('31', 'New Mexico'), ('32', 'New York'), ('33', 'North Carolina'), ('34', 'North Dakota'), ('35', 'Ohio'), ('36', 'Oklahoma'), ('37', 'Oregon'), ('38', 'Pennsylvania'), ('39', 'Rhode Island'), ('40', 'South Carolina'), ('41', 'South Dakota'), ('42', 'Tennessee'), ('43', 'Texas'), ('44', 'Utah'), ('45', 'Vermont'), ('46', 'Virginia'), ('47', 'Washington'), ('48', 'West Virginia'), ('49', 'Wisconsin'), ('50', 'Wyoming');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_name` varchar(30) NOT NULL,
  `enabled` int(11) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `role` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `verificationCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('bill', '1', 'bill', 'ROLE_EMP', 'gates@yahoo.com', null), ('dhaka', '1', 'dhaka', 'ROLE_CAN', 'dhaka@yahoo.com', null), ('dtn', '1', 'passs', 'ROLE_EMP', 'dtn@gmail.com', null), ('employ', '1', '123', 'ROLE_EMP', 'employ@gmail.com', null), ('habib', '1', 'habib', 'ROLE_ADM', 'admin@threed.com', null), ('ibcs', '1', '123', 'ROLE_EMP', '', ''), ('ibcs1', '1', '123', 'ROLE_EMP', '', ''), ('moin', '1', 'moin', 'ROLE_CAN', 'moinsam@yahoo.com', null), ('new', '1', 'new', 'ROLE_EMP', 'new@gmail.com', null), ('seef', '1', 'seef', 'ROLE_EMP', 'seef@gmail.com', null), ('sohel', '1', 'sohel', 'ROLE_CAN', 'hanifsohel@gmail.com', null), ('sujan', '1', '1234', 'ROLE_CAN', 'sujanctg2005@gmail.com', null), ('tauseef', '1', '123', 'ROLE_CAN', 'tauseef_cse100@yahoo.com', null), ('test1', '1', 'test1', 'ROLE_EMP', 'test1@example.com', null), ('test2', '1', 'test2', 'ROLE_CAN', 'test2@example.com', null), ('threed', '1', 'threed', 'ROLE_CAN', 'threed@threed.com', null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
