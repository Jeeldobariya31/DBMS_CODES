USE CSE_3A_232;

CREATE TABLE EMP(
EID INT,
EName VARCHAR(20),
Department VARCHAR(20),
Salary DECIMAL(8,2),
joiningDate DATETIME,
City VARCHAR(10),
Gender VARCHAR(10)
);

SELECT * FROM EMP;

INSERT INTO EMP(EID,EName,Department,Salary,joiningDate,City,Gender)
VALUES
(101 ,'Rahul' ,'Admin', 56000 ,'1990-Jan-01' ,'Rajkot' ,'Male' ),
(102 ,'Hardik' ,'IT', 18000 ,'1990-Sep-25', 'Ahmedabad', 'Male' ),
(103 ,'Bhavin' ,'HR' ,25000 ,'1991-May-14', 'Baroda' ,'Male' ),
(104 ,'Bhoomi', 'Admin', 39000 ,'1991-Feb-08', 'Rajkot', 'Female' ),
(105 ,'Rohit' ,'IT', 17000 ,'1990-Jul-23 ','Jamnagar', 'Male' ),
(106 ,'Priya' ,'IT' ,9000 ,'1990-Oct-18', 'Ahmedabad', 'Female' ),
(107, 'Bhoomi' ,'HR' ,34000 ,'1991-Dec-25' ,'Rajkot', 'Female' )

SELECT * FROM EMP;


--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively. 
SELECT  
     MAX(Salary) AS MAXIMUM,
     MIN(SALARY) AS MINIMUM
FROM EMP
--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, 
--respectively. 
SELECT 
    SUM(SALARY) AS TOTAL_SALARY,
    AVG(SALARY) AS AVG_SALARY
FROM EMP
--3. Find total number of employees of EMPLOYEE table. 
SELECT COUNT(ENAME) AS TOTAL_EMPLOYEE
FROM EMP
--4. Find highest salary from Rajkot city.
SELECT   
     MAX(Salary) AS MAXIMUM
FROM EMP
WHERE CITY='RAJKOT'
--5. Give maximum salary from IT department. 
SELECT   
     MAX(Salary) AS MAXIMUM
FROM EMP
WHERE Department='IT'
--6. Count employee whose joining date is after 8-feb-91. 
SELECT COUNT(ENAME) AS TOTAL_EMPLOYEE
FROM EMP
WHERE joiningDate >'1991-feb-08'
--7. Display average salary of Admin department. 
SELECT   
     AVG(Salary) AS AVG_SALARY
FROM EMP
WHERE Department='ADMIN'
--8. Display total salary of HR department.
SELECT   
     SUM(Salary) AS TOTAL_SALARY
FROM EMP
WHERE Department='HR'
--9. Count total number of cities of employee without duplication.
SELECT ENAME ,COUNT(CITY) AS CITYCOUNT
FROM EMP
GROUP BY ENAME
--10. Count unique departments. 
SELECT COUNT(DISTINCT Department) AS UniqueDept
FROM EMP
--11. Give minimum salary of employee who belongs to Ahmedabad. 
SELECT   
     MIN(Salary) AS MINIMUM
FROM EMP
WHERE CITY='Ahmedabad'
--12. Find city wise highest salary.
SELECT CITY , MAX(SALARY) AS MAXIMUM_SALARY
FROM EMP
GROUP BY CITY
--13. Find department wise lowest salary. 
SELECT DEPARTMENT ,MIN(SALARY) AS MINIMUM_SALARY
FROM EMP
GROUP BY DEPARTMENT
--14. Display city with the total number of employees belonging to each city. 
SELECT CITY ,COUNT(ENAME) AS TOTAL_EMPOLYEE
FROM EMP
GROUP BY CITY
--15. Give total salary of each department of EMP table. 
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SALARY
FROM EMP
GROUP BY DEPARTMENT
--16. Give average salary of each department of EMP table without displaying the respective department 
--name. 
SELECT AVG(SALARY) AS AVG_SALARY
FROM EMP
GROUP BY DEPARTMENT
--17. Count the number of employees for each department in every city. 
SELECT DEPARTMENT,CITY, COUNT(ENAME) AS TOTAL_EMPLOYEE
FROM EMP
GROUP BY DEPARTMENT,CITY
--18. Calculate the total salary distributed to male and female employees. 
SELECT GENDER , SUM(SALARY) AS TOTAL_SALARY
FROM EMP
GROUP  BY GENDER
--19. Give city wise maximum and minimum salary of female employees. 
SELECT CITY , 
     MAX(Salary) AS MAXIMUM,
     MIN(SALARY) AS MINIMUM
FROM EMP

WHERE GENDER='FEMALE'
GROUP BY CITY
--20. Calculate department, city, and gender wise average salary. 
SELECT department, city, gender, AVG(SALARY) AS AVG_SALARY
FROM EMP
GROUP BY department, city, gender


----------------------------------PART-B------------------------------------------

--1. Count the number of employees living in Rajkot. 
SELECT COUNT(ENAME) AS COUNT_EMPLOYEE
FROM EMP
WHERE CITY='RAJKOT'
--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 
SELECT MAX(SALARY)-MIN(SALARY) AS DIFFERENCE
FROM EMP
--3. Display the total number of employees hired before 1st January, 1991. 
SELECT COUNT(ENAME)  AS COUNT_EMPLOYEE
FROM EMP
WHERE joiningDate < '1991-JAN-01'
-------------------------------PART-C----------------------------------------
--1. Count the number of employees living in Rajkot or Baroda. 
SELECT COUNT(ENAME) AS COUNTEMPLOYEE
FROM EMP
WHERE CITY IN ('RAJKOT','BARODA')
--2. Display the total number of employees hired before 1st January, 1991 in IT department.
SELECT COUNT(ENAME) AS COUNTEMPLOYEE
FROM EMP
WHERE joiningDate < '1991-JAN-01' AND department='IT'
--3. Find the Joining Date wise Total Salaries. 
SELECT joiningDate,SUM(SALARY) AS TOTALSALARY
FROM EMP
GROUP BY joiningDate
--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT department,city, MAX(SALARY) AS MAXSALARY
FROM EMP
WHERE ENAME LIKE 'R%'
GROUP BY department,city