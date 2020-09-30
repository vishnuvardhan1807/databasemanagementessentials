-- For event requests, list the event number, event date (eventrequest.dateheld), and count of the event plans.
--   Only include event requests in the result if the event request has more than one related event plan with a work date in December 2018.

SELECT * FROM eventrequest;
SELECT * FROM eventplan;
SELECT * FROM eventplanline;


SELECT eventrequest.eventno,DateHeld,COUNT(*) AS "Number of plans"
FROM eventrequest
INNER JOIN eventplan ON eventrequest.EventNo=eventplan.EventNo
WHERE eventplan.workdate BETWEEN '2018-12-01' AND '2018-12-31'
GROUP BY eventrequest.EventNo,DateHeld
HAVING COUNT(*)>1;
