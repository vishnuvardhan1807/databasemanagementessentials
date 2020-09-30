-- List the plan number, line number, resource name, number of resources (eventplanline.number),
 -- location name, time start, and time end where the event is held at the basketball arena, the event plan has activity of activity of “Operation”,
--  and the event plan has a work date in the period October 1 to December 31, 2018. 
-- Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause.
 -- Instead, you should use a condition on the FacName column for the value of “Basketball arena”.
 
 
SELECT * FROM eventplan;
SELECT * FROM eventplanline;
SELECT * FROM eventrequest;
SELECT * FROM employee;
SELECT * FROM facility;
SELECT * FROM resourcetbl;
SELECT * FROM location;

SELECT epl.planno,epl.lineno,epl.resno,epl.NumberFld,
epl.TimeStart,epl.Timeend,l.locname
FROM eventplanline epl 
INNER JOIN location l
ON epl.Locno=l.Locno 
INNER JOIN resourcetbl r
ON epl.resno=r.resno
INNER JOIN facility f
ON l.facno=f.facno
INNER JOIN eventplan ep
ON epl.planno=ep.planno
WHERE f.facname='Basketball arena'
AND ep.activity='Operation'
AND workdate BETWEEN '2018-10-01' AND '2018-12-31';