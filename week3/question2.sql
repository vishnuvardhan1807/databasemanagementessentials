use project;
SHOW TABLES;
DESC employee;

SELECT * FROM employee;

SELECT empname AS name,
department,email AS 'email address',
phone FROM employee
WHERE phone LIKE '3-%';