SELECT * FROM location;
SELECT * FROM facility;
SET SQL_SAFE_UPDATES = 0;
UPDATE location SET locname='Gate'
WHERE locno='L107';
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM location;