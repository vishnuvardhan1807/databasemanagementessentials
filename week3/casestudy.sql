CREATE SCHEMA CASESTUDY;
USE CASESTUDY;

-- creating user table

CREATE TABLE user(
Userid INT PRIMARY KEY,
Username VARCHAR(40) NOT NULL
);

DESC User;

INSERT INTO user VALUES(1,"vishnu");
INSERT INTO user VALUES(2,"sreekar");
INSERT INTO user VALUES(3,"chandu");
INSERT INTO user VALUES(4,"bharath");
INSERT INTO user VALUES(5,"sweety");

SELECT * FROM user;

-- CREATING quote TABLE

CREATE TABLE quote(
Quoteid INT PRIMARY KEY,
Userid INT,
Quoteref VARCHAR(20),
Validfrom DATETIME NOT NULL,
Validto DATETIME NOT NuLL,
Premium CHAR(1),
Ipt numeric(5,2),
CONSTRAINT fk_quote FOREIGN KEY (Userid) REFERENCES user(Userid)
);

INSERT INTO quote VALUES(1,1,'present','2020-09-15','2022-09-15','Y',120.03);
INSERT INTO quote VALUES(2,1,'present','2020-10-15','2022-09-15','Y',120.03);
INSERT INTO quote VALUES(3,1,'present','2020-11-5','2022-09-15','Y',120.03);
INSERT INTO quote VALUES(4,1,'present','2020-12-15','2022-09-15','Y',120.03);
INSERT INTO quote VALUES(5,2,'present','2020-09-15','2022-09-15','Y',120.03);
INSERT INTO quote VALUES(6,2,'present','2020-10-15','2022-09-15','Y',120.03);
INSERT INTO quote VALUES(7,2,'present','2020-11-15','2022-09-15','Y',120.03);
INSERT INTO quote VALUES(8,3,'present','2020-12-15','2022-09-15','Y',120.03);
INSERT INTO quote VALUES(9,3,'present','2020-09-15','2022-09-15','Y',120.03);
INSERT INTO quote VALUES(10,4,'present','2020-08-15','2022-09-15','Y',120.03);
INSERT INTO quote VALUES(11,4,'present','2020-07-15','2022-09-15','Y',120.03);
INSERT INTO quote VALUES(12,4,'present','2020-11-15','2022-09-15','Y',120.03);

DESC quote;
SELECT * FROM quote;

-- CREATING vehicle TABLE

CREATE TABLE vehicle(
Vehicleid INT PRIMARY KEY,
Quoteid INT NOT NULL,
Regno VARCHAR(12),
Make Varchar(20),
Model Varchar(20),
Regdate DATETIME,
CONSTRAINT uc_key UNIQUE (Quoteid),
CONSTRAINT fk_key FOREIGN KEY (Quoteid) REFERENCES quote(Quoteid)
);

INSERT INTO vehicle VALUES (1,1,'Ap03-AA-6909','chennai','grand-i10','2014-01-12');
INSERT INTO vehicle VALUES (2,2,'Ap03-AA-6908','chennai','i20','2014-01-12');
INSERT INTO vehicle VALUES (3,3,'Ap03-AA-6909','chennai','elantra','2014-01-12');
INSERT INTO vehicle VALUES (4,4,'Ap03-AA-1','mumbai','wagonar','2014-01-12');
INSERT INTO vehicle VALUES (5,5,'Ap03-AA-2','delhi','innova','2014-01-12');
INSERT INTO vehicle VALUES (6,6,'Ap03-AA-3','chennai','i10','2014-01-12');
INSERT INTO vehicle VALUES (7,7,'Ap03-AA-4','chennai','verna','2014-01-12');
INSERT INTO vehicle VALUES (8,8,'Ap03-AA-5','chennai','swift','2014-01-12');
INSERT INTO vehicle VALUES (9,9,'Ap03-AA-6','chennai','dzire','2014-01-12');
INSERT INTO vehicle VALUES (10,10,'Ap03-AA-7','kolkota','polo','2014-01-12');
INSERT INTO vehicle VALUES (11,11,'Ap03-AA-8','banglore','Zetta','2014-01-12');
INSERT INTO vehicle VALUES (12,12,'Ap03-AA-9','banglore','tesla','2014-01-12');

DESC vehicle;
SELECT * FROM vehicle;

-- CREATING driver TABLE

CREATE TABLE driver(
Driverid INT PRIMARY KEY,
Quoteid INT,
Licenseno VARCHAR(15),
Firstname VARCHAR(15),
Lastname VARCHAR(15),
Dob DATE,
CONSTRAINT fk_key1 FOREIGN KEY (Quoteid) REFERENCES quote(Quoteid)
);

ALTER TABLE driver MODIFY COLUMN Quoteid INT NOT NULL;

DESC driver;

INSERT INTO driver VALUES (1,1,'a239183','vishnu','vardhan','2000-07-18');
INSERT INTO driver VALUES (2,1,'a239184','vishnu','varaprasad','2000-07-18');
INSERT INTO driver VALUES (3,2,'a239185','bala','sreekar','2000-07-18');
INSERT INTO driver VALUES (4,2,'a239186','sri','chandana','2000-07-18');
INSERT INTO driver VALUES (5,2,'a239187','bharath','kumar','2000-07-18');
INSERT INTO driver VALUES (6,3,'a239188','mohan','kumar','2000-07-18');
INSERT INTO driver VALUES (7,3,'a239189','sree','ramya','2000-07-18');
INSERT INTO driver VALUES (8,3,'a239110','sree','nithisma','2000-07-18');
INSERT INTO driver VALUES (9,4,'a239111','kasturi','akka','2000-07-18');
INSERT INTO driver VALUES (10,4,'a239112','sai','akhila','2000-07-18');
INSERT INTO driver VALUES (11,5,'a239113','sri','charan','2000-07-18');
INSERT INTO driver VALUES (12,7,'a239114','hari','babu','2000-07-18');
INSERT INTO driver VALUES (13,8,'a239115','ashok','ashu','2000-07-18');

SELECT * FROM driver;

CREATE TABLE claim(
Claimid INT PRIMARY KEY,
Driverid INT,
Quoteid INT NOT NULL,
Claimdate DATE,
Claimamount INT,
Settled CHAR(1),
CONSTRAINT fk_key4 FOREIGN KEY (Quoteid) REFERENCES quote(Quoteid),
CONSTRAINT fk_key5 FOREIGN KEY (Driverid) REFERENCES driver(Driverid) 
);

-- CREATING claim TABLE

INSERT INTO claim VALUES (1,1,1,'2020-10-21',400,'Y');
INSERT INTO claim VALUES (2,1,1,'2020-10-21',400,'Y');
INSERT INTO claim VALUES (3,2,1,'2020-10-21',400,'Y');
INSERT INTO claim VALUES (4,2,1,'2020-10-21',400,'Y');
INSERT INTO claim VALUES (5,3,2,'2020-10-21',400,'Y');
INSERT INTO claim VALUES (6,3,2,'2020-10-21',400,'Y');
INSERT INTO claim VALUES (7,3,2,'2020-10-21',400,'Y');
INSERT INTO claim VALUES (8,3,2,'2020-10-21',400,'Y');
INSERT INTO claim VALUES (9,3,2,'2020-10-21',400,'Y');

DESC claim;
SELECT * FROM claim;

-- CREATING conviction TABLE

CREATE TABLE conviction(
Convictionid INT PRIMARY KEY,
Driverid INT,
Quoteid INT NOT NULL,
Convictiondate DATE,
Convictioncode VARCHAR(10),
Penaltypoints INt NOT NULL,
Penaltyamount INT,
CONSTRAINT fk_key6 FOREIGN KEY (Quoteid) REFERENCES quote(Quoteid),
CONSTRAINT fk_key7 FOREIGN KEY (Driverid) REFERENCES driver(Driverid) 
);

INSERT INTO conviction VALUES (1,1,1,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (2,1,1,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (3,1,1,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (4,2,1,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (5,2,1,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (6,2,1,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (7,3,2,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (8,3,2,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (9,4,2,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (10,4,2,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (11,5,2,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (12,5,2,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (13,6,3,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (14,7,3,'2020-10-12','abc',10,500);
INSERT INTO conviction VALUES (15,8,3,'2020-10-12','abc',10,500);

DESC conviction;
SELECT * FROM conviction;

-- CREATING policy TABLE

CREATE TABLE policy(
Policyid INT PRIMARY KEY,
Quoteid INT UNIQUE,
Policynumber VARCHAR(10),
Effectivefrom DATE,
Effectiveto DATE,
Premium CHAR(1),
CONSTRAINT fk_key8 FOREIGN KEY (Quoteid) REFERENCES quote(Quoteid)
);

INSERT INTO policy VALUES(1,1,'1234ad','2020-10-7','2022-10-7','Y');
INSERT INTO policy VALUES(2,2,'1234ae','2020-10-7','2022-10-7','Y');
INSERT INTO policy VALUES(3,3,'1234af','2020-10-7','2022-10-7','Y');
INSERT INTO policy VALUES(4,4,'1234ag','2020-10-7','2022-10-7','N');
INSERT INTO policy VALUES(5,5,'1234ah','2020-10-7','2022-10-7','Y');
INSERT INTO policy VALUES(6,6,'1234ai','2020-10-7','2022-10-7','Y');
INSERT INTO policy VALUES(7,7,'1234aj','2020-10-7','2022-10-7','N');
INSERT INTO policy VALUES(8,8,'1234ak','2020-10-7','2022-10-7','Y');
INSERT INTO policy VALUES(9,10,'1234al','2020-10-7','2022-10-7','Y');
INSERT INTO policy VALUES(10,11,'1234am','2020-10-7','2022-10-7','N');
INSERT INTO policy VALUES(11,9,'1234an','2020-10-7','2022-10-7','Y');
INSERT INTO policy VALUES(12,12,'1234a0','2020-10-7','2022-10-7','N');

DESC policy;
SELECT * FROM policy;

-- CREATING endorsement TABLE

CREATE TABLE endorsement(
Endorsementid INT PRIMARY KEY,
Quoteid INT,
Policyid INT,
ref VARCHAR(10),
CONSTRAINT fk_key9 FOREIGN KEY (Quoteid) REFERENCES quote(Quoteid),
CONSTRAINT fk_key10 FOREIGN KEY (Policyid) REFERENCES policy(Policyid)
);

INSERT INTO endorsement VALUES(1,1,1,'qwerr');
INSERT INTO endorsement VALUES(2,1,1,'q3err');
INSERT INTO endorsement VALUES(3,2,2,'qwerr');
INSERT INTO endorsement VALUES(4,2,2,'qwerr');
INSERT INTO endorsement VALUES(5,1,1,'qddwerr');

DESC endorsement;
SELECT * FROM endorsement;

-- CREATING mta TABLE

CREATE TABLE mta(
Mtaid INT PRIMARY KEY,
Quoteid INT,
Policyid INT,
Effectivefrom DATE,
Effectiveto DATE,
CONSTRAINT fk_key11 FOREIGN KEY (Quoteid) REFERENCES quote(Quoteid),
CONSTRAINT fk_key12 FOREIGN KEY (Policyid) REFERENCES policy(Policyid)
);

INSERT INTO mta VALUES(1,1,1,'2020-10-7','2022-10-7');
INSERT INTO mta VALUES(2,1,1,'2020-10-7','2022-10-7');
INSERT INTO mta VALUES(3,2,2,'2020-10-7','2022-10-7');
INSERT INTO mta VALUES(4,2,2,'2020-10-7','2022-10-7');
INSERT INTO mta VALUES(5,3,3,'2020-10-7','2022-10-7');
INSERT INTO mta VALUES(6,3,3,'2020-10-7','2022-10-7');
INSERT INTO mta VALUES(7,4,4,'2020-10-7','2022-10-7');
INSERT INTO mta VALUES(8,4,4,'2020-10-7','2022-10-7');
INSERT INTO mta VALUES(9,4,4,'2020-10-7','2022-10-7');

DESC mta;
SELECT * FROM mta;





