use project;
SHOW TABLES;

SELECT * FROM location;
SELECT * FROM facility;

SELECT locno,locname FROM
location l INNER JOIN facility f
ON l.facno=f.facno WHERE facname='Basketball arena';