/* חישוב איזה קיצוץ ירוויח לנו הכי הרבה*/
SELECT *
FROM ((SELECT EROLE AS NAME, SUM(SALARY) - SUM(SALARY * 0.8) AS SAVING
     FROM EMPLOYEE
     GROUP BY EROLE)
     UNION
     (SELECT C.CNAME AS NAME, SUM(F.AMOUNT) - SUM(AMOUNT * 0.99) AS SAVING
     FROM COMMITTEE C, FINANCE F
     WHERE F.NAME = C.CNAME
     GROUP BY C.CNAME)) T
ORDER BY SAVING DESC;

/* בדיקה על תושבים בעייתיים, כאלו שלא שילמו מס כלל או ששילמו יותר קנסות ממסים*/
SELECT ID, PHONE, EMAIL
FROM RESIDENT R
WHERE R.ID NOT IN (SELECT ID
                  FROM COLLECTION C, TAXES T
                  WHERE C.SID = T.SID)
     OR ((SELECT SUM(AMOUNT) FROM COLLECTION CL NATURAL JOIN SOURCE NATURAL JOIN FINES WHERE CL.ID = R.ID)
        - 
        (SELECT SUM(AMOUNT) FROM COLLECTION CL NATURAL JOIN SOURCE NATURAL JOIN TAXES WHERE CL.ID = R.ID))
        > 0
ORDER BY R.ADDRESS
FETCH FIRST 400 ROWS ONLY;
                                                                
/* האזרחים ששלחו פנייה לוועדה שאליה שלחו הכי הרבה פניות */
SELECT NAME, EMAIL, MAIL
FROM RESIDENT R
WHERE ID in (SELECT I.ID
             FROM COMMITTEE C, INQUIRIES I
             WHERE C.CNAME = I.COMMITNAME
                   AND C.CNAME IN (SELECT CNAME
                                  FROM COMMITTEE C, INQUIRIES I
                                  WHERE C.CNAME = I.COMMITNAME
                                  GROUP BY CNAME
                                  HAVING COUNT(*) = (SELECT MAX(A)
                                                     FROM (SELECT COUNT(*) AS A
                                                         FROM COMMITTEE C, INQUIRIES I
                                                         WHERE C.CNAME = I.COMMITNAME
                                                         GROUP BY CNAME) T)));

/* כל התושבים שקיבלו גם קנסות וגם שילמו מסים, אך לא שניהם*/ 
SELECT ID, NAME, ADDRESS
FROM RESIDENT
WHERE ID IN (((SELECT R.ID FROM RESIDENT R, COLLECTION C, SOURCE S, FINES F
             WHERE C.ID = R.ID AND C.SID = S.SID AND F.SID = C.SID)
             UNION
             (SELECT R.ID FROM RESIDENT R, COLLECTION C, SOURCE S, TAXES T
             WHERE C.ID = R.ID AND C.SID = S.SID AND T.SID = C.SID))
             EXCEPT
             (SELECT ID FROM RESIDENT R
             WHERE ID IN ((SELECT ID 
                         FROM COLLECTION C, TAXES T
                         WHERE C.SID = T.SID)
                         INTERSECT
                         (SELECT ID 
                         FROM COLLECTION C, FINES F
                         WHERE C.SID = F.SID))));

/* כל סוגי המוסדות לפי תקציביהם, כל עוד הוועדה שאחראית עליהם קיבלה יותר מעשר פניות */                         
SELECT I.TYPE, SUM(F.AMOUNT)
FROM INSTITUTION I, COMMITTEE C, FINANCE F, INQUIRIES INQ
WHERE I.COMMITNAME = C.CNAME AND F.NAME = C.CNAME AND INQ.COMMITNAME = C.CNAME
GROUP BY I.TYPE
HAVING COUNT(INQ.IID) > 10
ORDER BY SUM(F.AMOUNT) DESC;

/* בדיקה אילו אנשים הכניסו הכי הרבה כסף לעירייה, כל עוד ממוצע התשלומים שלהם גדול מאלף*/
SELECT ID, SUM(AMOUNT)
FROM ((SELECT F.SID, S.AMOUNT, F.REASON AS TYPE, C.ID AS ID
      FROM FINES F, COLLECTION C, SOURCE S
      WHERE F.SID = C.SID AND C.SID = S.SID)
      UNION ALL
      (SELECT T.SID, S.AMOUNT, T.TYPE AS TYPE, C.ID AS ID
      FROM TAXES T, COLLECTION C, SOURCE S
      WHERE T.SID = C.SID AND C.SID = S.SID)
      UNION ALL
      (SELECT D.SID, S.AMOUNT, 'Donation' AS TYPE, D.DID AS ID
      FROM DONATION D, SOURCE S
      WHERE D.SID = S.SID)) T
GROUP BY ID
HAVING AVG(AMOUNT) > 1000;

/* חישוב אחוז של מוסד מתקציב לפי שנה */
SELECT INS.INSTNAME, F.YEAR, SUM(F.AMOUNT)/(SELECT SUM(AMOUNT) FROM FINANCE WHERE YEAR = F.YEAR) AS PERCENT_OF_BUDGET
FROM INSTITUTION INS, FINANCE F, COMMITTEE C
WHERE INS.COMMITNAME = C.CNAME AND F.NAME = C.CNAME
GROUP BY INS.INSTNAME, F.YEAR
ORDER BY INSTNAME, YEAR;
     

/* גמד וענק בין כל תושבי העירייה 
SELECT R1.NAME AS NAME1, R1.ADDRESS AS ADDRESS1, R2.NAME AS NAME2, R2.ADDRESS AS ADDRESS2
FROM (SELECT ID, NAME, ADDRESS, ROW_NUMBER() OVER (ORDER BY id) RN FROM (SELECT *
                                                                         FROM RESIDENT
                                                                         ORDER BY ID
                                                                         FETCH FIRST 2500 ROWS ONLY) T) R1,
     (SELECT ID, NAME, ADDRESS, ROW_NUMBER() OVER (ORDER BY id) RN FROM (SELECT *
                                                                         FROM RESIDENT
                                                                         ORDER BY ID DESC
                                                                         FETCH FIRST 2500 ROWS ONLY) T) R2
WHERE MOD(R1.RN + 2, (SELECT COUNT(*) FROM RESIDENT)) = R2.RN
ORDER BY R1.NAME; */
      
