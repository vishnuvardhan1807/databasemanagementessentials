use project;
SHOW TABLES;
SELECT * FROM eventrequest;
SELECT * FROM eventplan;
SELECT * FROM eventplanline;

SELECT Eventno,Datereq AS 'authorizatondate',
Status FROM eventrequest
WHERE (Status='Approved' OR Status='Denied') AND
Datereq BETWEEN '2018-07-1' AND '2018-07-31';

