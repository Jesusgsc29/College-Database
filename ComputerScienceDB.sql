/*
 create table COMPUTER_SCIENCE.INSTRUCTOR
 (InsFname 			VARCHAR(15)			NOT NULL,
 Inslname			VARCHAR(15)			NOT NULL,
 InsEmplid			CHAR(8)				NOT NULL,
 InsPhone			CHAR(10),
 Email				VARCHAR(50)			NOT NULL,
 InsAddress			VARCHAR(30),
 InsOfficeLoc		VARCHAR(20)			NOT NULL,
 DateHired			DATE				NOT NULL,
 AreaResearch		VARCHAR(20),
 AreaTeaching		VARCHAR(20),
 PRIMARY KEY(InsEmplid) );
 
 create table COMPUTER_SCIENCE.COURSES_TAUGHT
 (CoursesTaughtID 	CHAR(10)		NOT NULL,
  InsEmplid			CHAR(8)			NOT NULL,
  PRIMARY KEY(CoursesTaughtID,InsEmplid),
  foreign key(InsEmplid) REFERENCES INSTRUCTOR(InsEmplid) );
  
  create table COMPUTER_SCIENCE.DEPARTMENT
(DepartamentID		CHAR(10)			NOT NULL,
Dname				VARCHAR(10)			NOT NULL,
Dphone				CHAR(10),
DofficeLoc			VARCHAR(20)			NOT NULL,
PRIMARY KEY(DepartamentID) );
  
  create table COMPUTER_SCIENCE.COURSE
(CourseID			CHAR(10)			NOT NULL,
CourseName			VARCHAR(30)			NOT NULL,
CourseCode			VARCHAR(10)			NOT NULL,
Hours				INT					NOT NULL,
Credits				INT					NOT NULL,
COUSE_Description	VARCHAR(100),
DepartamentID		CHAR(10)			NOT NULL,
PRIMARY KEY(CourseID),
foreign key(DepartamentID) REFERENCES DEPARTMENT(DepartamentID) );
  
 create table COMPUTER_SCIENCE.COURSE_SECTION
 (SectionID			CHAR(10)			NOT NULL,
 SemesterYear 		INT					NOT NULL,
 RmNumber 			VARCHAR(10),
 COURSE_Schedule 	VARCHAR(20),
 InsEmplid 			CHAR(8)				NOT NULL,
 CourseID			CHAR(10)			NOT NULL,
 PRIMARY KEY(SectionID),
foreign key(InsEmplid) REFERENCES INSTRUCTOR(InsEmplid),
foreign key(CourseID) REFERENCES COURSE(CourseID) );

create table COMPUTER_SCIENCE.STUDENT
(StuEmplid			CHAR(8)				NOT NULL,
StuFname 				VARCHAR(15)			NOT NULL,
StuMinit				CHAR,
Stulname				VARCHAR(15)			NOT NULL,
DOB					DATE,
StuPhone			CHAR(10),
StuEmail			VARCHAR(50)			NOT NULL,
StuAddress			VARCHAR(30),
PRIMARY KEY(StuEmplid) );

create table COMPUTER_SCIENCE.MAJOR
(MajorName			VARCHAR(20)			NOT NULL,
StuEmplid			CHAR(8)				NOT NULL,
PRIMARY KEY(StuEmplid,MajorName),
foreign key(StuEmplid) REFERENCES STUDENT(StuEmplid) );

create table COMPUTER_SCIENCE.EMPLOYMENT_RECORDS
(EmploymentRecordsID	CHAR(10)			NOT NULL,
StuEmplid				CHAR(8)				NOT NULL,
StartDate				DATE,
EndDate					DATE,
JobTitle				VARCHAR(20),
PRIMARY KEY(StuEmplid,EmploymentRecordsID),
foreign key(StuEmplid) REFERENCES STUDENT(StuEmplid) );

create table COMPUTER_SCIENCE.ENROLLS
(StuEmplid				CHAR(8)				NOT NULL,
SectionID				CHAR(10)			NOT NULL,
GradeEarned				CHAR(2)				NOT NULL,
PRIMARY KEY(StuEmplid,SectionID),
foreign key(SectionID) REFERENCES COURSE_SECTION(SectionID),
foreign key(StuEmplid) REFERENCES STUDENT(StuEmplid) );

create table COMPUTER_SCIENCE.CHEATING_INCIDENT
(IncidentID				CHAR(8)				NOT NULL,
IncidentDate			DATE				NOT NULL,
INC_Description			VARCHAR(100),
InsEmplid				CHAR(8)				NOT NULL,
PRIMARY KEY(IncidentID),
foreign key(InsEmplid) REFERENCES INSTRUCTOR(InsEmplid) );

create table COMPUTER_SCIENCE.STU_COMMITTED  
(IncidentID				CHAR(8)				NOT NULL,
StuEmplid				CHAR(8)				NOT NULL,
PRIMARY KEY(StuEmplid,IncidentID),
foreign key(IncidentID) REFERENCES CHEATING_INCIDENT(IncidentID),
foreign key(StuEmplid) REFERENCES STUDENT(StuEmplid) );

create table COMPUTER_SCIENCE.EMPLOYER
(EmployerID				CHAR(8)				NOT NULL,
EmpName 				VARCHAR(30)			NOT NULL,
Industry				VARCHAR(20)			NOT NULL,
EmpAddress				VARCHAR(30),
PRIMARY KEY(EmployerID) );

create table COMPUTER_SCIENCE.GRADUATES
(StuEmplid				CHAR(8)				NOT NULL,
GraduationYear 			INT					NOT NULL,
EmployerID				CHAR(8)				NOT NULL,
PRIMARY KEY(StuEmplid),
foreign key(EmployerID) REFERENCES EMPLOYER(EmployerID),
foreign key(StuEmplid) REFERENCES STUDENT(StuEmplid) );

Create table COMPUTER_SCIENCE.DEGREE_EARNED
(DegreeName			VARCHAR(20)			NOT NULL,	
StuEmplid			CHAR(8)				NOT NULL,
PRIMARY KEY(StuEmplid,DegreeName),
foreign key(StuEmplid) REFERENCES GRADUATES(StuEmplid) );

*/
/*
INSERT INTO COMPUTER_SCIENCE.INSTRUCTOR
VALUES ('Richard','Gomez','12345678','9177521978','richard.gomes@lc.cuny.edu','255 Hamilton Ave, Bronx, NY','Gillet 310','2014-5-12','Cybersecurity','Networking'),
('Samantha','Ramirez','87654321','9174563678','samantha.ramirez@lc.cuny.edu','342 Walton Ave, Bronx, NY','Gillet 226','2008-6-23','Data Science','Analytics'),
('Steve','Sanchez','92435695','9177686455','steve.sanchez@lc.cuny.edu','435 Baldwin Ave,Bronx,NY','Gillet 333','2011-9-25','Computer Science','JAVA Programming'),
('Elizabeth','Goodson','45637389','9174598399','elizabeth.goodson@lc.cuny.edu','534 Mosholu Pkwy S,Bronx,NY','Gillet 327','2015-3-15','Computer Science','Database Systems'),
('Gabriel','Thompson','23456275','9173425564','gabriel.thompson@lc.cuny.edu','34 Washington Ave,Bronx,NY','Gillet 127','2017-1-20','Cybersecurity','Networking'),
('Yaritza','Alba','54673856','9175674577','yaritza.alba@lc.cuny.edu','433 Melody Drive,Bronx,NY','Gillet 225','2017-4-27','Computer Science','IOS Programming'),
('Cynthia','Soriano','56894674','9174536775','cynthia.soriano@lc.cuny.edu','768 Gentry Ave,Bronx,NY','Gillet 113','2016-7-7','Cybersecurity','Networking'),
('John','Smith','34577868','9174533456','john.smith@lc.cuny.edu','212 Kramer Ave,Bronx,NY','Gillet 109','2021-10-24','Data Science','Analytics'),
('William','Rodriguez','45647845','9172556478','william.rodriguez@lc.cuny.edu','132 Higgins Ave,Bronx,NY','Gillet 133','2013-8-29','Cybersecurity','Networking');

INSERT INTO COMPUTER_SCIENCE.COURSES_TAUGHT
VALUES ('0123456789','12345678');
*/
INSERT INTO COMPUTER_SCIENCE.DEPARTMENT
VALUES ('0123456789','DataSci','9173354587','Gillet 223');


INSERT INTO COMPUTER_SCIENCE.COURSE
VALUES ('0123456789','Programming methods I','CMP 167','4','4',null,'0123456789');


INSERT INTO COMPUTER_SCIENCE.COURSE_SECTION
VALUES ('0123456789','2023','Carman 115','Mon/Wed 9:00-10:15','12345678','0123456789');


INSERT INTO COMPUTER_SCIENCE.STUDENT
VALUES ('12345678','Jesus','G','Sanchez','2002-3-29','9175558745','jesus.sanchezcaceres@lc.cuny.edu','1006 Jerome Ave, Bronx,NY'),
('12345670','Albert','F','Saquino','2001-6-29','9176758394','albert.saquino@lc.cuny.edu','243 Grand Concourse, Bronx,NY'),
('12345671','Michelle','T','Guzman','2000-3-24','9171275849','michelle.guzman@lc.cuny.edu','456 Walton Ave, Bronx,NY'),
('12345672','Teresa','L','Padilla','2001-4-15','9178794596','teresa.padilla@lc.cuny.edu','754 Washington Place, Bronx,NY'),
('12345673','Joyce','S','Ruiz','2003-8-16','9178392054','joyce.ruiz@lc.cuny.edu','2435 Sommer Drive, Bronx,NY'),
('12345674','Luis','M','Henderson','2004-7-2','9172983012','luis.henderson@lc.cuny.edu','5463 Kingsbridge Rd, Bronx,NY'),
('12345675','Harry','O','Fowler','2002-9-23','9171029485','harry.fowler@lc.cuny.edu','2364 Valentine Ave, Bronx,NY'),
('12345676','Oscar','R','Johnson','2002-2-23','9176375896','oscar.johnson@lc.cuny.edu','7848 Morris Ave, Bronx,NY'),
('12345677','Gabriella','A','Camby','2004-10-11','9172984755','gabriella.camby@lc.cuny.edu','2634 Webster Ave, Bronx,NY');

INSERT INTO COMPUTER_SCIENCE.MAJOR
VALUES ('Computer Science','12345678');


INSERT INTO COMPUTER_SCIENCE.EMPLOYMENT_RECORDS
VALUES ('0123456789','12345678',NULL,NULL,NULL);

INSERT INTO COMPUTER_SCIENCE.ENROLLS
VALUES ('12345678','0123456789','B+');

INSERT INTO COMPUTER_SCIENCE.CHEATING_INCIDENT
VALUES ('11111111','2021-04-03',NULL,'12345678');


INSERT INTO COMPUTER_SCIENCE.STU_COMMITTED
VALUES ('11111111','12345678');

INSERT INTO COMPUTER_SCIENCE.EMPLOYER
VALUES ('22222222','Google','Technology','1500 Dakota Ave,Houston,TX,');

INSERT INTO COMPUTER_SCIENCE.GRADUATES
VALUES ('12345670','2024','22222222');

INSERT INTO COMPUTER_SCIENCE.DEGREE_EARNED
VALUES ('Computer Science','12345670');



/* SELECT statements without conditions */
SELECT *
FROM COMPUTER_SCIENCE.INSTRUCTOR;

SELECT *
FROM COMPUTER_SCIENCE.COURSES_TAUGHT;

SELECT *
FROM COMPUTER_SCIENCE.DEPARTMENT;

SELECT *
FROM COMPUTER_SCIENCE.COURSE;

SELECT *
FROM COMPUTER_SCIENCE.COURSE_SECTION;

SELECT *
FROM COMPUTER_SCIENCE.STUDENT;

SELECT *
FROM COMPUTER_SCIENCE.MAJOR;

SELECT *
FROM COMPUTER_SCIENCE.EMPLOYMENT_RECORDS;

SELECT *
FROM COMPUTER_SCIENCE.ENROLLS;

SELECT *
FROM COMPUTER_SCIENCE.CHEATING_INCIDENT;

SELECT *
FROM COMPUTER_SCIENCE.STU_COMMITED;

SELECT *
FROM COMPUTER_SCIENCE.EMPLOYER;

SELECT *
FROM COMPUTER_SCIENCE.GRADUATES;

SELECT *
FROM COMPUTER_SCIENCE.DEGREE_EARNED;


/* SELECT statements with conditions */
SELECT *
FROM COMPUTER_SCIENCE.INSTRUCTOR
WHERE InsFname;

SELECT *
FROM COMPUTER_SCIENCE.COURSES_TAUGHT
WHERE CoursesTaughtID;

SELECT *
FROM COMPUTER_SCIENCE.DEPARTMENT
WHERE  Dphone;

SELECT *
FROM COMPUTER_SCIENCE.COURSE
WHERE CourseCode;

SELECT *
FROM COMPUTER_SCIENCE.COURSE_SECTION
WHERE RmNumber;

SELECT *
FROM COMPUTER_SCIENCE.STUDENT
WHERE DOB;

SELECT *
FROM COMPUTER_SCIENCE.MAJOR
WHERE MajorName;

SELECT *
FROM COMPUTER_SCIENCE.EMPLOYMENT_RECORDS
WHERE JobTitle;

SELECT *
FROM COMPUTER_SCIENCE.ENROLLS
WHERE GradeEarned;

SELECT *
FROM COMPUTER_SCIENCE.CHEATING_INCIDENT
WHERE IncidentDate;

SELECT *
FROM COMPUTER_SCIENCE.STU_COMMITED
WHERE IncidentID;

SELECT *
FROM COMPUTER_SCIENCE.EMPLOYER
WHERE EmpName;

SELECT *
FROM COMPUTER_SCIENCE.GRADUATES
WHERE GraduationYear;

SELECT *
FROM COMPUTER_SCIENCE.DEGREE_EARNED
WHERE DegreeName;

/* Two Advanced SELECT statements */
SELECT InsEmplid, InsFname, Inslname
FROM (COMPUTER_SCIENCE.INSTRUCTOR JOIN COMPUTER_SCIENCE.DEPARTMENT ON Doffloc = DofficeLoc)
WHERE Dname = 'Cybersecurity';

SELECT StuEmplid, StuFname, Stulname
FROM (COMPUTER_SCIENCE.STUDENT JOIN COMPUTER_SCIENCE.COURSE ON CourName = CourseName)
WHERE CourseCode = 'CMP 167'; 

/* Students who have all A letter grades*/

SELECT StuEmplid, GradeEarned
FROM COMPUTER_SCIENCE.STUDENT, COMPUTER_SCIENCE.ENROLLS
WHERE GradeEarned = 'A'
GROUP BY StuEmplid, GradeEarned;

/* Three DELETE Statements on some condition */

DELETE FROM COMPUTER_SCIENCE.INSTRUCTOR
WHERE Inslname = 'Gomez';

DELETE FROM COMPUTER_SCIENCE.STUDENT
WHERE Email = 'jesus.sanchez@lc.cuny.edu';

DELETE FROM COMPUTER_SCIENCE.COURSE_SECTION
WHERE RmNumber = 'Carmen 115';

SELECT 	InsFname,Inslname
FROM 	COMPUTER_SCIENCE.INSTRUCTOR
WHERE	DateHired > ALL ( SELECT DateHired
							FROM COMPUTER_SCIENCE.INSTRUCTOR)



















