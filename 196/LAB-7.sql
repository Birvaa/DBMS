--Part – A

CREATE TABLE EMP(
	EID INT,
	EName VARCHAR(50),
	Department VARCHAR(50),
	Salary INT,
	JoiningDate DATETIME,
	City VARCHAR(50)
);

INSERT INTO EMP VALUES(101 ,'Rahul', 'Admin', 56000 ,'1990-1-1','Rajkot');
INSERT INTO EMP VALUES(102 ,'Hardik', 'IT', 18000 ,'1990-9-25','Ahmedbad');
INSERT INTO EMP VALUES(103 ,'Bhavin', 'HR', 25000 ,'1991-5-14','Baroda');
INSERT INTO EMP VALUES(104 ,'Bhoomi', 'Admin', 39000 ,'1991-2-8','Rajkot');
INSERT INTO EMP VALUES(105 ,'Rohit', 'IT', 17000 ,'1990-7-23','Jamnagr');
INSERT INTO EMP VALUES(106 ,'Priya', 'IT', 9000 ,'1990-10-18','Ahmedbad');
INSERT INTO EMP VALUES(107 ,'Bhoomi', 'HR', 34000 ,'1991-12-25','Rajkot');

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
SELECT MAX(Salary) AS 'Maximum', MIN(Salary)AS 'Minimum' FROM EMP;

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,
--respectively.
SELECT AVG(Salary) AS 'Avagrage_sal', SUM(Salary)AS 'Total_sal' FROM EMP;

--3. Find total number of employees of EMPLOYEE table.
--4. Find highest salary from Rajkot city.
SELECT MAX(Salary) FROM EMP;

--5. Give maximum salary from IT department.
SELECT MIN(Salary) FROM EMP;

--6. Count employee whose joining date is after 8-feb-91.
SELECT count(EID) FROM EMP
where JoiningDate>'1991-12-8';

--7. Display average salary of Admin department.
SELECT AVG(Salary) FROM EMP
WHERE Department='Admin';

--8. Display total salary of HR department.
SELECT SUM(Salary) FROM EMP
WHERE Department='HR';

--9. Count total number of cities of employee without duplication.
SELECT COUNT(DISTINCT City) FROM EMP;

--10. Count unique departments.
SELECT COUNT(DISTINCT Department) FROM EMP;

--11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(Salary) FROM EMP
WHERE City='Ahmedbad';

--12. Find city wise highest salary.
SELECT MAX(Salary),city FROM EMP
GROUP BY City;

--13. Find department wise lowest salary.
SELECT MIN(Salary),Department FROM EMP
GROUP BY Department;

--14. Display city with the total number of employees belonging to each city.
SELECT COUNT(EID),city FROM EMP
GROUP BY City;

--15. Give total salary of each department of EMP table.
SELECT SUM(Salary),Department FROM EMP
GROUP BY Department;

--16. Give average salary of each department of EMP table without displaying the respective department
--name
SELECT AVG(Salary) FROM EMP
GROUP BY Department;



--Part – B:
--1. Count the number of employees living in Rajkot.
SELECT COUNT(Salary) FROM EMP
WHERE City='Rajkot';

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(Salary) - MIN(Salary) AS 'DIFFERENCE' FROM EMP;

--3. Display the total number of employees hired before 1st January, 1991.
SELECT count(EID) FROM EMP
where JoiningDate<'1991-1-1';


--Part – C:
--1. Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(Salary) FROM EMP
WHERE City='Rajkot' OR City='Baroda';

--2. Display the total number of employees hired before 1st January, 1991 in IT department.
SELECT count(EID) FROM EMP
where JoiningDate<'1991-1-1' AND Department='IT';

--3. Find the Joining Date wise Total Salaries.
SELECT SUM(SALARY),JoiningDate FROM EMP
GROUP BY JoiningDate;

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT MAX(EID),Department FROM EMP
WHERE City LIKE 'R%'
GROUP BY Department;


--SQL Extra Queries For Aggregate Functions With Group By (Without Having)

--1.	Find the employee with the highest salary in each department.
 SELECT MAX(Salary),Department FROM EMP
GROUP BY Department;

--2.	Calculate the average salary for each city.
SELECT AVG(Salary),city FROM EMP
GROUP BY City;

--3.	Find the second highest salary in the entire Table.
SELECT MAX(Salary) AS 'SECOND_HIGHEST' FROM EMP
WHERE Salary < (SELECT MAX(Salary) FROM EMP);

--4.	Find employees who joined in the first half of any year.
SELECT EName FROM EMP
WHERE MONTH(JoiningDate)<6;

--5.	Display the name and salary of the employee who joined last.
SELECT top 1 EName, Salary FROM EMP            
ORDER BY JoiningDate desc;
