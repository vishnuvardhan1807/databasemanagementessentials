-- List the event number, event date, status, and estimated cost of events 
-- where there is an event plan managed by Mary Manager and the event is held in the basketball arena in the period October 1 to December 31, 2018.
-- Your query must not use the facility number (“F101”) of the basketball arena or the employee number (“E101”) of “Mary Manager” in the WHERE clause.
-- Thus, the WHERE clause should not have conditions involving the facility number or employee number compared to constant values.

SELECT * FROM eventplan;
SELECT * FROM eventplanline;
SELECT * FROM eventrequest;
SELECT * FROM employee;
SELECT * FROM facility;

SELECT r.EventNo,r.DateHeld,r.Status,r.estcost
FROM eventrequest r INNER JOIN facility f 
ON r.facno=f.facno
INNER JOIN eventplan p ON
p.EventNo=r.EventNo INNER JOIN
employee e ON p.empno=e.empno
 WHERE (f.facname='Basketball arena' AND e.empname='Mary Manager')
 AND DateHeld BETWEEN '2018-10-01' AND '2018-12-31';
 