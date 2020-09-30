use assignment;
show tables;

SELECT * FROM employee;
DROP Table employee;

CREATE TABLE employee(
empname VARCHAR(20) NOT NULL,
department VARCHAR(20),
email VARCHAR(50) NOT NULL,
phone CHAR(10),
empno INT PRIMARY KEY AUTO_INCREMENT
);
DESC employee;
INSERT INTO employee (empname,department,email,phone) VALUES('vishnu','It','kjvvnat@gmail.com','7893118163');
INSERT INTO employee (empname,department,email,phone) VALUES('vardhan','It','kjvvnat@gmail1.com','7893118163');
INSERT INTO employee (empname,department,email,phone) VALUES('naidu','It','kjvvnat@gmail2.com','7893118163');

ALTER TABLE employee auto_increment=100;
SELECT * FROM employee;