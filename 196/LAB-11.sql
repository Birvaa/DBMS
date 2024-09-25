SELECT *FROM RESULT
SELECT *FROM STU_INFO

--Part – A:
--1. Combine information from student and result table using cross join or Cartesian product.
SELECT *FROM STU_INFO CROSS JOIN RESULT;

--2. Perform inner join on Student and Result tables.
SELECT *FROM STU_INFO INNER JOIN RESULT
ON STU_INFO.RNo = RESULT.Rno;

--3. Perform the left outer join on Student and Result tables.
SELECT *FROM STU_INFO LEFT OUTER JOIN RESULT
ON STU_INFO.RNo = RESULT.Rno;

--4. Perform the right outer join on Student and Result tables.
SELECT *FROM STU_INFO RIGHT OUTER JOIN RESULT
ON STU_INFO.RNo = RESULT.Rno;


--5. Perform the full outer join on Student and Result tables.
SELECT *FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNo = RESULT.Rno;

--6. Display Rno, Name, Branch and SPI of all students.
SELECT RESULT.RNo , Name , Branch , RESULT.SPI FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNo = RESULT.Rno;

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
SELECT RESULT.RNo , Name , Branch , RESULT.SPI FROM STU_INFO LEFT OUTER JOIN RESULT
ON STU_INFO.RNo = RESULT.Rno
WHERE Branch = 'CE';

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
SELECT RESULT.RNo , Name , Branch , RESULT.SPI FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNo = RESULT.Rno
WHERE Branch <> 'EC';

--9. Display average result of each branch.
SELECT  Branch , AVG(RESULT.SPI) FROM STU_INFO LEFT OUTER JOIN RESULT
ON STU_INFO.RNo = RESULT.Rno
GROUP BY Branch


--10. Display average result of CE and ME branch.
SELECT  Branch , AVG(RESULT.SPI) FROM STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNo = RESULT.Rno
GROUP BY Branch
HAVING Branch = 'CE'OR Branch = 'ME';


--Part – B:
--1. Display average result of each branch and sort them in ascending order by SPI.
SELECT  Branch , AVG(RESULT.SPI) FROM STU_INFO LEFT OUTER JOIN RESULT
ON STU_INFO.RNo = RESULT.Rno
GROUP BY Branch
ORDER BY AVG(RESULT.SPI)

--2. Display highest SPI from each branch and sort them in descending order.
SELECT  Branch , MAX(RESULT.SPI) FROM STU_INFO LEFT OUTER JOIN RESULT
ON STU_INFO.RNo = RESULT.Rno
GROUP BY Branch
ORDER BY MAX(RESULT.SPI) DESC;



--Part – C:

SELECT *FROM EMPLOYEE_MASTER;

--1. Retrieve the names of employee along with their manager’s name from the Employee table
SELECT A.Name AS 'EMP_NAME' , B.Name AS 'MANAGER_NAME'
FROM EMPLOYEE_MASTER A INNER JOIN EMPLOYEE_MASTER B
ON B.EmployeeNo = A.ManagerNo;
