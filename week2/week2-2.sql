CREATE SCHEMA coursera2;
use coursera2;

CREATE TABLE Customer(
custno CHAR(10),
custfirstname VARCHAR(30) NOT NULL,
custlastname VARCHAR(30) NOT NULL,
custcity VARCHAR(30),
custstate CHAR(2),
custzip VARCHAR(15),
custbal INT,
CONSTRAINT PK_cust PRIMARY KEY (custno)
);

INSERT INTO customer VALUES('C0954327','sheri','Gordon','littleton','co','80129-5543',230);
INSERT INTO customer VALUES('C1010398','Jim','Glussman','Denver','co','80111-0033',200);
INSERT INTO customer VALUES('C2388597','Beth','Taylor','Seattle','WA','98103-1121',500);
INSERT INTO customer VALUES('C3340959','Betty','Wise','Seattle','WA','98178-3311',200);
INSERT INTO customer VALUES('C3499503','Bob','Mann','Monroe','WA','98013-1095',0);
INSERT INTO customer VALUES('C8543321','Ron','Thompson','Renton','WA','98666-1289',85);

SELECT * FROM customer;

DESC customer;

CREATE TABLE employee(
empno CHAR(8),
empfirstname VARCHAR(20) NOT NULL,
emplastname VARCHAR(20) NOT NULL,
empphone VARCHAR(25),
empemail VARCHAR(25) NOT NULL,
CONSTRAINT PK_emp PRIMARY KEY (empno)
);

INSERT INTO employee VALUES('E1329594','Landi','Santos','(303) 789-1234','LSantos@bigco.com');
INSERT INTO employee VALUES('E8544399','Joe','Jenkins','(303) 221-9875','Jjenkins@bigco.com');
INSERT INTO employee VALUES('E8843211','Amy','Tang','(303) 556-4321','ATang@bigco.com');
INSERT INTO employee VALUES('E9345771','Colin','White','(303) 221-4453','CWhite@bigco.com');
INSERT INTO employee VALUES('E9884325','Thomas','Johnson','(303) 556-9987','TJohnson@bigco.com');
INSERT INTO employee VALUES('E9954302','Mary','Hill','(303) 556-9871','MHill@bigco.com');

SELECT * FROM employee;

DESC employee;

CREATE TABLE ordertbl(
ordno CHAR(8),
orddate datetime NOT NULL,
custno CHAR(8),
empno CHAR(8),
CONSTRAINT PK_order PRIMARY KEY (ordno),
CONSTRAINT FK_order FOREIGN KEY (custno) REFERENCES customer(custno),
CONSTRAINT FK_order1 FOREIGN KEY (empno) REFERENCES employee(empno)
);

INSERT INTO ordertbl VALUES ('O1116324','2017-7-13','C0954327','E8544399');
INSERT INTO ordertbl VALUES ('O1116325','2017-07-13','C0954327','E8544399');
DESC ordertbl;

SELECT * FROM customer;