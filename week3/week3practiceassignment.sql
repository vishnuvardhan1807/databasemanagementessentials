Create SCHEMA project;
use project;

CREATE TABLE EVENTREQUEST(
EventNo INT PRIMARY KEY,
DateHeld datetime,
Datereq datetime,
Status Varchar(30),
estcost INT,
estaudience INT
);

ALTER TABLE EVENTREQUEST ADD COLUMN custno INT; 
ALTER TABLE EVENTREQUEST ADD FOREIGN KEY (custno) REFERENCES Customer(custno);
ALTER TABLE EVENTREQUEST ADD COLUMN facno CHAR(4); 
ALTER TABLE EVENTREQUEST ADD FOREIGN KEY (facno) REFERENCES Facility(facno);
DESC EVENTREQUEST;

Insert into EVENTREQUEST (EventNo,DateHeld,Datereq,custno,facno,Status,estcost,estaudience) values (0,str_to_date('25,OCT,18','%d,%b,%y'),str_to_date('06,JUN,18','%d,%b,%y'),0,'F100','Approved',5000,80000);
Insert into EVENTREQUEST (EventNo,DateHeld,Datereq,custno,facno,Status,estcost,estaudience) values (1,str_to_date('26,OCT,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),0,'F100','Pending',5000,80000);
Insert into EVENTREQUEST (EventNo,DateHeld,Datereq,custno,facno,Status,estcost,estaudience) values (2,str_to_date('21,SEP,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),0,'F100','Approved',5000,80000);
Insert into EVENTREQUEST (EventNo,DateHeld,Datereq,custno,facno,Status,estcost,estaudience) values (3,str_to_date('14,SEP,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),0,'F100','Approved',5000,80000);
Insert into EVENTREQUEST (EventNo,DateHeld,Datereq,custno,facno,Status,estcost,estaudience) values (4,str_to_date('03,DEC,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),1,'F101','Approved',2000,12000);
Insert into EVENTREQUEST (EventNo,DateHeld,Datereq,custno,facno,Status,estcost,estaudience) values (5,str_to_date('05,DEC,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),1,'F101','Approved',2000,10000);
Insert into EVENTREQUEST (EventNo,DateHeld,Datereq,custno,facno,Status,estcost,estaudience) values (6,str_to_date('12,DEC,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),1,'F101','Approved',2000,10000);
Insert into EVENTREQUEST (EventNo,DateHeld,Datereq,custno,facno,Status,estcost,estaudience) values (7,str_to_date('23,NOV,18','%d,%b,%y'),str_to_date('28,JUL,18','%d,%b,%y'),4,'F100','Denied',10000,5000);

SELECT * FROM EVENTREQUEST;

DESC EVENTREQUEST;

CREATE TABLE Customer(
custno INT PRIMARY KEY,
custname VARCHAR(40),
address VARCHAR(40),
INTERNAL CHAR(3),
contact VARCHAR(30),
phone bigint,
city VARCHAR(30),
state CHAR(2),
Zip INT
);


Insert into CUSTOMER (custno,custname,address,INTERNAL,contact,phone,city,state,Zip) values (0,'Football','Box 352200','Y','Mary Manager','6857100','Boulder','CO','80309');
Insert into CUSTOMER (custno,custname,address,INTERNAL,contact,phone,city,state,Zip) values (1,'Men''s Basketball','Box 352400','Y','Sally Supervisor','5431700','Boulder','CO','80309');
Insert into CUSTOMER (custno,custname,address,INTERNAL,contact,phone,city,state,Zip) values (2,'Baseball','Box 352020','Y','Bill Baseball','5431234','Boulder','CO','80309');
Insert into CUSTOMER (custno,custname,address,INTERNAL,contact,phone,city,state,Zip) values (3,'Women''s Softball','Box 351200','Y','Sue Softball','5434321','Boulder','CO','80309');
Insert into CUSTOMER (custno,custname,address,INTERNAL,contact,phone,city,state,Zip) values (4,'High School Football','123 AnyStreet','N','Coach Bob','4441234','Louisville','CO','80027');

DESC Customer;

SELECT * FROM Customer;

CREATE TABLE EMPLOYEE(
empno INT PRIMARY KEY,
empname VARCHAR(30),
department VARCHAR(30),
email VARCHAR(40),
phone VARCHAR(30)
);

Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values (0,'Chuck Coordinator','Administration','chuck@colorado.edu','3-1111');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values (1,'Mary Manager','Football','mary@colorado.edu','5-1111');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values (2,'Sally Supervisor','Planning','sally@colorado.edu','3-2222');
Insert into EMPLOYEE (EMPNO,EMPNAME,DEPARTMENT,EMAIL,PHONE) values (3,'Alan Administrator','Administration','alan@colorado.edu','3-3333');

SELECT * FROM EMPLOYEE;
DESC Employee;

CREATE TABLE Facility(
facno CHAR(4) PRIMARY KEY,
facname VARCHAR(40)
);

Insert into FACILITY (FACNO,FACNAME) values ('F100','Football stadium');
Insert into FACILITY (FACNO,FACNAME) values ('F101','Basketball arena');
Insert into FACILITY (FACNO,FACNAME) values ('F102','Baseball field');
Insert into FACILITY (FACNO,FACNAME) values ('F103','Recreation room');

SELECT * FROM Facility;

DESC Facility;

CREATE TABLE Location(
locno CHAR(4) PRIMARY KEY,
facno CHAR(4),
locname VARCHAR(40)
);

Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L100','F100','Locker room');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L101','F100','Plaza');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L102','F100','Vehicle gate');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L103','F101','Locker room');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L104','F100','Ticket Booth');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L105','F101','Gate');
Insert into LOCATION (LOCNO,FACNO,LOCNAME) values ('L106','F100','Pedestrian gate');

SELECT * FROM LOCATION;

ALTER TABLE Location ADD FOREIGN KEY (facno) REFERENCES Facility(facno);
DESC Location; 

CREATE TABLE ResourceTbl(
resno CHAR(4) PRIMARY KEY,
resname VARCHAR(40),
rate int
);

Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R100','attendant',10);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R101','police',15);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R102','usher',10);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R103','nurse',20);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R104','janitor',15);
Insert into RESOURCETBL (RESNO,RESNAME,RATE) values ('R105','food service',10);

SELECT * FROM RESOURCETBL;

DESC ResourceTbl;

CREATE TABLE EventPlan(
planno CHAR(4) PRIMARY KEY,
event CHAR(4),
workdate datetime,
notes VARCHAR(40),
activity VARCHAR(40),
empno CHAR(4)
);


Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P100',0,str_to_date('25,OCT,18','%d,%b,%y'),'Standard operation','Operation',2);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P101',4,str_to_date('03,DEC,18','%d,%b,%y'),'Watch for gate crashers','Operation',0);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P102',5,str_to_date('05,DEC,18','%d,%b,%y'),'Standard operation','Operation',2);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P103',6,str_to_date('12,DEC,18','%d,%b,%y'),'Watch for seat switching','Operation',null);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P104',1,str_to_date('26,OCT,18','%d,%b,%y'),'Standard cleanup','Cleanup',1);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P105',0,str_to_date('25,OCT,18','%d,%b,%y'),'Light cleanup','Cleanup',1);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P199',2,str_to_date('10,DEC,18','%d,%b,%y'),'ABC','Operation',1);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P299',1,str_to_date('26,OCT,18','%d,%b,%y'),null,'Operation',1);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P349',6,str_to_date('12,DEC,18','%d,%b,%y'),null,'Setup',1);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P85',0,str_to_date('25,OCT,18','%d,%b,%y'),'Standard operation','Cleanup',2);
Insert into EVENTPLAN (PLANNO,EVENTNO,WORKDATE,NOTES,ACTIVITY,EMPNO) values ('P95',1,str_to_date('26,OCT,18','%d,%b,%y'),'Extra security','Cleanup',2);

SELECT * FROM EVENTPLAN;

ALTER TABLE EventPlan DROP COLUMN event;
ALTER TABLE EventPlan DROP COLUMN empno;
ALTER TABLE EventPlan ADD COLUMN empno INT;
ALTER TABLE EventPlan ADD COLUMN EventNo INT;
ALTER TABLE EventPlan ADD FOREIGN KEY (EventNo) REFERENCES EVENTREQUEST(EventNo);
ALTER TABLE EventPlan ADD FOREIGN KEY (empno) REFERENCES EMPLOYEE(empno);
DESC EventPlan;

CREATE TABLE EventPlanLine(
planno CHAR(4),
LineNo INT,
TimeStart time,
TimeEnd time,
NumberFld INT,
Locno CHAR(4),
resno CHAR(4),
CONSTRAINT PRIMARY KEY (planno,LineNo),
CONSTRAINT FOREIGN KEY (planNo) REFERENCES EventPlan(planno)
);

Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',1, str_to_date('25,OCT,18 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',2, str_to_date('25,OCT,18 12:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'), 2,'L101','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',3, str_to_date('25,OCT,18 7:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 16:30:00','%d,%b,%y %H:%i:%s'), 1,'L102','R102');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P100',4, str_to_date('25,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R102');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',1, str_to_date('3,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,18 20:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',2, str_to_date('3,DEC,18 18:30:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P101',3, str_to_date('3,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('3,DEC,18 20:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',1, str_to_date('5,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',2, str_to_date('5,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,18 21:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P102',3, str_to_date('5,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('5,DEC,18 22:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',1, str_to_date('12,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 21:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',2, str_to_date('12,DEC,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 21:00:00','%d,%b,%y %H:%i:%s'),4,'L105','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P103',3, str_to_date('12,DEC,18 19:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 22:00:00','%d,%b,%y %H:%i:%s'),2,'L103','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P104',1, str_to_date('26,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('26,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L101','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P104',2, str_to_date('26,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('26,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P105',1, str_to_date('25,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L101','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P105',2, str_to_date('25,OCT,18 18:00:00','%d,%b,%y %H:%i:%s'),str_to_date('25,OCT,18 22:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R104');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P199',1, str_to_date('10,DEC,18 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('10,DEC,18 12:00:00','%d,%b,%y %H:%i:%s'),1,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P349',1, str_to_date('12,DEC,18 12:00:00','%d,%b,%y %H:%i:%s'),str_to_date('12,DEC,18 15:30:00','%d,%b,%y %H:%i:%s'),1,'L103','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',1,  str_to_date('25,OCT,18 9:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),5,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',2,  str_to_date('25,OCT,18 8:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L102','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P85',3, str_to_date('25,OCT,18 10:00:00','%d,%b,%y %H:%i:%s'), str_to_date('25,OCT,18 15:00:00','%d,%b,%y %H:%i:%s'),3,'L104','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',1, str_to_date('26,OCT,18 8:00:00','%d,%b,%y %H:%i:%s'),  str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),4,'L100','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',2, str_to_date('26,OCT,18 9:00:00','%d,%b,%y %H:%i:%s'),  str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),4,'L102','R101');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',3, str_to_date('26,OCT,18 10:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,18 15:00:00','%d,%b,%y %H:%i:%s'),4,'L106','R100');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',4, str_to_date('26,OCT,18 13:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L100','R103');
Insert into EVENTPLANLINE (PLANNO,LINENO,TIMESTART,TIMEEND,NUMBERFLD,LOCNO,RESNO) values ('P95',5, str_to_date('26,OCT,18 13:00:00','%d,%b,%y %H:%i:%s'), str_to_date('26,OCT,18 17:00:00','%d,%b,%y %H:%i:%s'),2,'L101','R104');

SELECT * FROM EVENTPLANLINE;

DESC EventPlanLine;
DROP TABLE EventPlanLine;
SHOW TABLES;


