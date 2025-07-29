USE CSE_3A_232

--1. Display the result of 5 multiply by 30. 
SELECT ABS(5 * 30) AS MULTIPICATION
--2. Find out the absolute value of -25, 25, -50 and 50. 
SELECT ABS(-25) AS ABS_VALUES,
       ABS(25) AS ABS_VALUES,
       ABS(-50) AS ABS_VALUES,
       ABS(50) AS ABS_VALUES
--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 , -25.2. 
SELECT CEILING(25.2),CEILING(25.7),CEILING(-25.2)
--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 
SELECT FLOOR(25.2),FLOOR(25.7),FLOOR(-25.2)
--5. Find out remainder of 5 divided 2 and 5 divided by 3. 
SELECT 5%2 , 5%3
--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power. 
SELECT POWER(3,2),POWER(4,3)
--7. Find out the square root of 25, 30 and 50. 
SELECT SQRT(25),SQRT(30),SQRT(50)
--8. Find out the square of 5, 15, and 25. 
SELECT SQUARE(5),SQUARE(15),SQUARE(25)
--9. Find out the value of PI. 
SELECT PI() AS PI_VALUE
--10. Find out round value of 157.732 for 2, 0 and -2 decimal points. 
SELECT ROUND(157.732,2),ROUND(157.732,0),ROUND(157.732,-2)
--11. Find out exponential value of 2 and 3. 
SELECT POWER(2,3) AS RESULT
--12. Find out logarithm having base e of 10 and 2. 
SELECT LOG(10),LOG(2)
--13. Find out logarithm having base b having value 10 of 5 and 100.
SELECT LOG10(5),LOG10(100)
--14. Find sine, cosine and tangent of 3.1415. 
SELECT SIN(3.1415),COS(3.1415),TAN(3.1415)
--15. Find sign of -25, 0 and 25. 
SELECT SIGN(-25),SIGN(0),SIGN(25)
--16. Generate random number using function.
SELECT RAND()*1000

-----------------------------------------------PART-B--------------------------------------
CREATE TABLE EMP_MASTER (
EmpNo INT,
EmpName VARCHAR(30),
JoiningDate DATETIME,
Salary DECIMAL(7,2),
Commission INT,
City VARCHAR(30),
DeptCode VARCHAR(30)
);


INSERT INTO EMP_MASTER(EmpNo,EmpName,JoiningDate,Salary,Commission,City,DeptCode) VALUES
(101, 'Keyur' ,'2002-1-05' ,12000.00 ,4500 ,'Rajkot' ,'3@g'),
(102, 'Hardik' ,'2004-2-15' ,14000.00 ,2500 ,'Ahmedabad' ,'3@'),
(103, 'Kajal' ,'2006-3-14' ,15000.00 ,3000 ,'Baroda' ,'3GD' ),
(104, 'Bhoomi' ,'2005-6-23' ,12500.00 ,1000 ,'Ahmedabad' ,'1A3D'), 
(105, 'Harmit' ,'2004-2-15 ',14000.00 ,2000 ,'Rajkot' ,'312A') 

SELECT * FROM EMP_MASTER


--1. Display the result of Salary plus Commission.
SELECT (Salary +Commission) AS RESULT 
FROM EMP_MASTER
--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2. 
SELECT CEILING(55.2),CEILING(35.7),CEILING(-55.2)
--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2. 
SELECT FLOOR(55.2),FLOOR(35.7),FLOOR(-55.2)
--4. Find out remainder of 55 divided 2 and 55 divided by 3. 
SELECT 55%2 AS REMINDER ,55%3 AS REMINDER
--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power.
SELECT POWER(23,2) AS RESULT ,POWER(14,3) AS RESLUT


--------------------------------------------------------PART-C----------------------------------------------------
--1. Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000. 
SELECT Salary,Commission,(Salary +Commission) AS RESULT 
FROM EMP_MASTER
--WHERE (Salary +Commission) > 15000
GROUP BY Salary,Commission
HAVING (Salary +Commission) > 15000
--2. Find the details of employees whose commission is more than 25% of their salary.
SELECT EmpName,Salary,Commission 
FROM EMP_MASTER
WHERE commission > SALARY*0.25
--3. List the employees who joined before 2005 and whose total earnings (Salary + Commission) are greater 
--than 15000. 
SELECT EmpName,(Salary + Commission) AS TOTAL
FROM EMP_MASTER
WHERE JoiningDate < '2005-01-01' AND (Salary + Commission) >15000
--4. Find employees whose total earnings (Salary + Commission) are at least double their salary. 
SELECT EmpName,(Salary + Commission) AS TOTAL
FROM EMP_MASTER
WHERE (Salary + Commission) >= 2*SALARY

------------------------------------String functions---------------------------
------------------------------------PART-A------------------------------------


--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 
SELECT LEN(NULL) ,LEN('HELLO'),LEN('BLANK')
--2. Display your name in lower & upper case. 
SELECT LOWER('KRUNAL'),UPPER('bhavik')
--3. Display first three characters of your name. 
SELECT SUBSTRING('YASH',1,3)
--4. Display 3rd to 10th character of your name. 
SELECT SUBSTRING('YASHPATELDASHADIYA',3,10)
--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 
SELECT REPLACE('abc123efg','abc123efg','abcXYZefg'),REPLACE('abcabcabc','abcabcabc','ab5ab5ab5')
--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 
SELECT ASCII('a'),ASCII('A'),ASCII('z'),ASCII('Z'),ASCII('0'),ASCII('9')
--7. Write a query to display character based on number 97, 65,122,90,48,57. 
SELECT CHAR(97) ,CHAR(65) ,CHAR(122) ,CHAR(90) ,CHAR(48) ,CHAR(57)
--8. Write a query to remove spaces from left of a given string ‘ hello world  ‘. 
SELECT LTRIM('    HELLO WORLD  ')
--9. Write a query to remove spaces from right of a given string ‘ hello world  ‘.
SELECT RTRIM('    HELLO WORLD  ')
--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’. 
SELECT SUBSTRING('SQL Server' ,1,4),SUBSTRING('SQL Server' ,6,5)
--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function). 
SELECT CAST('1234.56' AS DECIMAL),CONVERT(DECIMAL,'1234.56')
--12. Write a query to convert a float 10.58 to integer (Use cast and convert function). 
SELECT CAST(10.58 AS INT),CONVERT(INT,10.58)
--13. Put 10 space before your name using function. 
SELECT SPACE(10) + 'YASH'
--14. Combine two strings using + sign as well as CONCAT (). 
SELECT CONCAT('YASH' , 'KRUNAL' ),'YASH'+'KRUNAL' AS MUCH
--15. Find reverse of “Darshan”. 
SELECT REVERSE('DARSHAN')
--16. Repeat your name 3 times.
SELECT REPLICATE('YASH',3)

--------------------------PART-B-----------------------------------------------
--1. Find the length of EMP Name and City columns. 
SELECT  LEN(EmpName),LEN(City)
FROM EMP_MASTER
--2. Display EMP Name and City columns in lower & upper case.
SELECT UPPER(EmpName),LOWER(EmpName),UPPER(City),LOWER(City)
FROM EMP_MASTER
--3. Display first three characters of EMP Name column. 
SELECT SUBSTRING(EmpName,1,4) 
FROM EMP_MASTER
--4. Display 3rd to 10th character of city column. 
SELECT SUBSTRING(CITY,3,10) 
FROM EMP_MASTER
--5. Write a query to display first 4 & Last 5 characters of EMP Name column.
SELECT LEFT(EmpName,4),RIGHT(EmpName,5)
FROM EMP_MASTER
-----------------------------PART-C----------------------------------
--1. Put 10 space before EMP Name using function. 
SELECT SPACE(10) + EmpName 
FROM EMP_MASTER
--2. Combine EMP Name and city columns using + sign as well as CONCAT (). 
SELECT CONCAT(EmpName,CITY),EmpName + CITY
FROM EMP_MASTER
--3. Combine all columns using + sign as well as CONCAT (). 
SELECT CONCAT(EmpNo,EmpName,JoiningDate,Salary,Commission,City,DeptCode),
(CAST(EmpNo AS VARCHAR) +EmpName+CAST(JoiningDate AS VARCHAR)+CAST(SALARY AS VARCHAR)+CAST(Commission AS VARCHAR)+City+DeptCode)
FROM EMP_MASTER
--4. Combine the result as < EMP Name > Lives in <City>. 
SELECT EmpName +'LIVES IN' + CITY 
FROM EMP_MASTER
--5. Combine the result as ‘EMP no of < EMP Name> is <EmpNo> .
SELECT 'EMP NO OF'+ EmpName + 'IS' + CAST(EmpNo AS VARCHAR)
FROM EMP_MASTER
--6. Retrieve the names of all employee where the third character of the Name is a vowel. 
SELECT  EmpName
FROM EMP_MASTER
WHERE EmpName LIKE '[A,E,I,O,U]%'
--7. Concatenate the name and city of students who have a name that ends with the letter 'r' and a city that 
--starts with 'R'.
SELECT EmpName + CITY
FROM EMP_MASTER
WHERE EmpName LIKE '%r' AND CITY LIKE 'R%'
---------------------Date function----------------------
---------------------Part – A:----------------------------
--1. Display the current date & time labeled as Today_Date
SELECT GETDATE() AS Today_Date;

--2. Find new date after 365 days from today
SELECT DATEADD(DAY, 365, GETDATE()) AS AddedDate;

--3. Display current date in the format: May 5 1994 12:00AM (simulate format)
SELECT CONVERT(VARCHAR, GETDATE(), 109) AS FormattedDate;

--4. Display current date in the format: 03 Jan 1995
SELECT CONVERT(VARCHAR, GETDATE(), 106) AS FormattedDate;

--5. Display current date in the format: Jan 04, 96
SELECT CONVERT(VARCHAR, GETDATE(), 6) AS FormattedDate;

--6. Total number of months between 31-Dec-08 and 31-Mar-09
SELECT DATEDIFF(MONTH, '2008-12-31', '2009-03-31') AS TotalMonths;

--7. Total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30
SELECT DATEDIFF(HOUR, '2012-01-25 07:00', '2012-01-26 10:30') AS TotalHours;

--8. Extract Day, Month, Year from given date 12-May-16
SELECT 
  DAY('2016-05-12') AS Day,
  MONTH('2016-05-12') AS Month,
  YEAR('2016-05-12') AS Year;

--9. Add 5 years to current date
SELECT DATEADD(YEAR, 5, GETDATE()) AS DateAfter5Years;

--10. Subtract 2 months from current date
SELECT DATEADD(MONTH, -2, GETDATE()) AS DateMinus2Months;

--11. Extract month from current date using datename() and datepart()
SELECT 
  DATENAME(MONTH, GETDATE()) AS MonthName,
  DATEPART(MONTH, GETDATE()) AS MonthNumber;

--12. Find last date of current month
SELECT EOMONTH(GETDATE()) AS LastDateOfMonth;

--13. Calculate age in years and months (example DOB used: 2003-08-15)

----------------------------------PART-B--------------------
CREATE TABLE EMP_MASTER (
EmpNo INT, EmpName VARCHAR(100) ,JoiningDate DATETIME,Salary DECIMAL(8,2), Commission INT, City VARCHAR(50),DeptCode VARCHAR(30)
);
SELECT * FROM EMP_MASTER;
INSERT INTO EMP_MASTER VALUES 
(101, 'Keyur' ,'2002-1-05' ,12000.00 ,4500 ,'Rajkot','3@g' ),
(102 ,'Hardik', '2004-2-15' ,14000.00 ,2500, 'Ahmedabad' ,'3@ '),
(103 ,'Kajal' ,'2006-3-14',15000.00 ,3000, 'Baroda' ,'3-GD' ),
(104 ,'Bhoomi', '2005-6-23' ,12500.00, 1000 ,'Ahmedabad' ,'1A3D' ),
(105, 'Harmit' ,'2004-2-15', 14000.00, 2000, 'Rajkot' ,'312A')
--1. New date after 365 days from JoiningDate
SELECT EmpName, JoiningDate, DATEADD(DAY, 365, JoiningDate) AS DateAfter365Days
FROM EMP_MASTER;

--2. Total number of months between JoiningDate and 31-Mar-09
SELECT EmpName, JoiningDate, DATEDIFF(MONTH, JoiningDate, '2009-03-31') AS TotalMonths
FROM EMP_MASTER;

--3. Total number of years between JoiningDate and 14-Sep-10
SELECT EmpName, JoiningDate, DATEDIFF(YEAR, JoiningDate, '2010-09-14') AS TotalYears
FROM EMP_MASTER;

--------------------------PART-C----------------------
--1. Extract Day, Month, Year from JoiningDate
SELECT EmpName, 
  DAY(JoiningDate) AS Day, 
  MONTH(JoiningDate) AS Month, 
  YEAR(JoiningDate) AS Year
FROM EMP_MASTER;

--2. Add 5 years to JoiningDate
SELECT  EmpName, JoiningDate, DATEADD(YEAR, 5, JoiningDate) AS NewDate
FROM EMP_MASTER;

--3. Subtract 2 months from JoiningDate
SELECT  EmpName, JoiningDate, DATEADD(MONTH, -2, JoiningDate) AS NewDate
FROM EMP_MASTER;

--4. Extract month using DATENAME and DATEPART
SELECT  EmpName, 
  DATENAME(MONTH, JoiningDate) AS MonthName, 
  DATEPART(MONTH, JoiningDate) AS MonthNumber
FROM EMP_MASTER;

--5. Employees who joined between 1st and 15th of any month
SELECT * FROM EMP_MASTER
WHERE DAY(JoiningDate) BETWEEN 1 AND 15;

--6. Employees who joined on the last day of any month
SELECT * FROM EMP_MASTER
WHERE DAY(JoiningDate) = DAY(EOMONTH(JoiningDate));

--7. Employees who joined in a leap year
SELECT * FROM EMP_MASTER
WHERE (YEAR(JoiningDate) % 4 = 0 AND YEAR(JoiningDate) % 100 != 0) 
   OR (YEAR(JoiningDate) % 400 = 0);


    