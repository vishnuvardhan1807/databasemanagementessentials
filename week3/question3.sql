use project;
show tables;
DESC resourcetbl;

SELECT * FROM resourcetbl;

SELECT * FROM resourcetbl 
WHERE rate BETWEEN 10 AND 20
ORDER BY rate;
