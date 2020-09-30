CREATE SCHEMA coursera;
use coursera;

CREATE TABLE Customer(
custno CHAR(6) NOT NULL,
custname VARCHAR(30) NOT NULL,
address VARCHAR(50) NOT NULL,
Internal CHAR(2) NOT NULL,
contact VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
city VARCHAR(30) NOT NULL,
state VARCHAR(5) NOT NULL,
zip VARCHAR(30) NOT NULL,
 CONSTRAINT PK_cust PRIMARY KEY (custno)
);

INSERT INTO Customer (custNo, custName, address, internal, city, zip, state, contact, phone) VALUES
  ('C100', 'Football', 'Box 352200', 'Y', 'Boulder', '80309', 'CO', 'Mary Manager', '6857100');
  
  INSERT INTO Customer (custNo, custName, address, internal, city, zip, state, contact, phone) VALUES
  ('C101', 'Men\'s basketball', 'Box 352400','Y', 'Boulder', '80309', 'CO', 'sally supervisor', '5431700');
  
  INSERT INTO Customer (custNo, custName, address, internal, city, zip, state, contact, phone) VALUES
  ('C103', 'Basketball', 'Box 352020','Y', 'Boulder', '80309', 'CO', 'BILL basketball', '5431234');
  
  INSERT INTO Customer (custNo, custName, address, internal, city, zip, state, contact, phone) VALUES
  ('C104', 'Women\'s Softball', 'Box 351200','Y', 'Boulder', '80309', 'CO', 'Sue Softball', '5434321');
  
  INSERT INTO Customer (custNo, custName, address, internal, city, zip, state, contact, phone) VALUES
  ('C105', 'High School Football', '123 AnyStreet','N', 'Louisville', '80027', 'CO', 'Coach Bob', '4441234');

SELECT * FROM customer;

DESC Customer;

CREATE TABLE Facility(
facno CHAR(12) NOT NULL,
facname VARCHAR(50) NOT NULL,
CONSTRAINT UC_facili UNIQUE (facno),
CONSTRAINT PK_facili PRIMARY KEY (facno)
);

  
INSERT INTO Facility (facNo, facName) VALUES ('F100', 'Football stadium');
INSERT INTO Facility (facNo, facName) VALUES ('F101', 'Basketball arena');
INSERT INTO Facility (facNo, facName) VALUES ('F102', 'Baseball field');
INSERT INTO Facility (facNo, facName) VALUES ('F103', 'Recreation room');

SELECT * FROM Facility;

-- DROP TABLE Location;
-- DROP TABLE Facility;
DESC Facility;

CREATE TABLE Location(
locno CHAR(8) NOT NULL,
facno CHAR(8) NOT NULL,
locname VARCHAR(50) NOT NULL,
CONSTRAINT PK_loca PRIMARY KEY (locno),
CONSTRAINT FK_loca FOREIGN KEY (facno) REFERENCES FACILITY(facno)
);

INSERT INTO Location (locNo, facNo, locName) VALUES ('L100', 'F100', 'Locker room');
INSERT INTO Location (locNo, facNo, locName) VALUES ('L101', 'F100', 'Plaza');
INSERT INTO Location (locNo, facNo, locName) VALUES ('L102', 'F100', 'Vehicle gate');
INSERT INTO Location (locNo, facNo, locName) VALUES ('L103', 'F101', 'Locker room');
INSERT INTO Location (locNo, facNo, locName) VALUES ('L104', 'F100', 'Ticket Booth');
INSERT INTO Location (locNo, facNo, locName) VALUES ('L105', 'F101', 'Gate');
INSERT INTO Location (locNo, facNo, locName) VALUES ('L106', 'F100', 'Pedestrian gate');

SELECT * FROM Location;


DESC Location;
show tables;
