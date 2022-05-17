SELECT *
FROM year_budget
WHERE amount >= (SELECT AVG(AMOUNT)
                    FROM year_budget)
ORDER BY amount DESC;
                    
SELECT name, email
FROM chairman_name_role_email
WHERE commitee_name LIKE 'Sport%'
