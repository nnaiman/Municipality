CREATE VIEW year_budget as
SELECT B.year as YEAR, sum(amount) AS amount
FROM BUDGET B, SOURCE S
WHERE B.YEAR = S.YEAR
GROUP BY B.YEAR;


CREATE VIEW chairman_name_role_email AS
SELECT name, cname AS commitee_name, email
FROM RESIDENT NATURAL JOIN COMMITTEE;
