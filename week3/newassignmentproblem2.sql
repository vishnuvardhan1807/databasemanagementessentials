-- List the plan number, event number, work date, and activity of event plans meeting the following two conditions: 
-- (1) the work date is in December 2018 and (2) the event is held in the “Basketball arena”.
-- Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. 
-- Instead, you should use a condition on the FacName column for the value of “Basketball arena”.

SELECT * FROM eventplan;
SELECT * FROM eventrequest;
SELECT * FROM facility;
SELECT * FROM location;

SELECT e.planno,e.EventNo,e.Workdate,e.activity
FROM eventplan e INNER JOIN eventrequest r
ON e.EventNo=r.EventNo
INNER JOIN facility f
ON r.facno=f.facno
WHERE facname='Basketball arena';
