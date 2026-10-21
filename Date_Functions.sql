-- 1. Calculate Employee Experience in Years

SELECT empno,
       ename,
       deptno,
       TIMESTAMPDIFF(YEAR, hiredate, CURDATE()) AS Experience_Years
FROM emp;


-- 2. Find Employees Hired on 3rd Day of Any Month

SELECT empno,
       ename,
       deptno
FROM emp
WHERE DAY(hiredate) = 3;


-- 3. Display Employees Joined Between 1981 and 1983

SELECT *
FROM emp
WHERE YEAR(hiredate) BETWEEN 1981 AND 1983;


-- 4. Display Clerk Employees Having Commission

SELECT ename,
       hiredate,
       CURDATE()
FROM emp
WHERE job = 'CLERK'
  AND comm IS NOT NULL
  AND comm > 0;


-- 5. Format Hire Date as DD/MM/YY

SELECT ename,
       DATE_FORMAT(hiredate, '%d/%m/%y') AS HireDate
FROM emp
WHERE job = 'CLERK'
  AND comm IS NOT NULL
  AND comm > 0;


-- 6. Date Three Months Before Today

SELECT DATE_SUB(CURDATE(), INTERVAL 3 MONTH);


-- 7. First Day of Month Three Months Ago

SELECT DATE_FORMAT(
       DATE_SUB(CURDATE(), INTERVAL 3 MONTH),
       '%Y-%m-01'
);


-- 8. Last Day of Month Three Months Ago

SELECT LAST_DAY(
       DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
);


-- 9. Find Employees Hired on Monday

SELECT hiredate,
       DATE_FORMAT(hiredate, '%W') AS Day_Name
FROM emp
WHERE DAYNAME(hiredate) = 'Monday';


-- 10. Display Current Date in Month Day, Year Format

SELECT DATE_FORMAT(NOW(), '%M %d, %Y');


-- 11. Display Current Date with Day Name and Time

SELECT DATE_FORMAT(NOW(), '%W %D %M %Y %r');


-- 12. Display Current Date in DD/MM/YYYY Format

SELECT DATE_FORMAT(NOW(), '%d/%m/%Y');


-- 13. Display Current Date and Time in Custom Format

SELECT DATE_FORMAT(NOW(), '%h:%i %p %b%d, %Y');


-- 14. Find Employees Joined in June

SELECT *
FROM emp
WHERE MONTHNAME(hiredate) = 'June';


-- 15. Display Hire Date and Day Name for June Joiners

SELECT hiredate,
       DATE_FORMAT(hiredate, '%W') AS Day_Name
FROM emp
WHERE MONTHNAME(hiredate) = 'June';


-- 16. Count Employees Joined Each Year

SELECT YEAR(hiredate) AS Joining_Year,
       COUNT(*) AS Total_Employees
FROM emp
GROUP BY YEAR(hiredate);


-- 17. Display Years Having More Than 10 Employees

SELECT YEAR(hiredate) AS Joining_Year,
       COUNT(*) AS Total_Employees
FROM emp
GROUP BY YEAR(hiredate)
HAVING COUNT(*) > 10;


-- 18. Find Employees Joined in 1981

SELECT ename
FROM emp
WHERE YEAR(hiredate) = 1981;


-- 19. Find Employees With More Than 5 Years Experience

SELECT ename
FROM emp
WHERE TIMESTAMPDIFF(YEAR, hiredate, CURDATE()) > 5;


-- 20. Display Hire Date and Experience

SELECT ename,
       hiredate,
       TIMESTAMPDIFF(YEAR, hiredate, CURDATE()) AS Experience
FROM emp;


-- 21. Department-wise Year-wise Employee Count

SELECT deptno,
       YEAR(hiredate) AS Joining_Year,
       COUNT(*) AS Employee_Count
FROM emp
GROUP BY deptno,
         YEAR(hiredate);
