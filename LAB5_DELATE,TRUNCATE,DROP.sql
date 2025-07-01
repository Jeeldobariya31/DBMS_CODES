USE CSE_3A_232
SELECT * FROM DEPOSIT_DETAIL
--*************PART-A*************
--1. Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000.  
        DELETE FROM DEPOSIT_DETAIL
        WHERE AMOUNT<=4000
        SELECT * FROM DEPOSIT_DETAIL

--2. Delete all the accounts CHANDI BRANCH.
        DELETE FROM DEPOSIT_DETAIL
        WHERE BNAME='CHANDI'
        SELECT * FROM DEPOSIT_DETAIL
--3. Delete all the accounts having account number (ANO) is greater than 102 and less than 105.
        
        DELETE FROM DEPOSIT_DETAIL
        WHERE ANO>102 AND ANO <105
        SELECT * FROM DEPOSIT_DETAIL
  --4. Delete all the accounts whose branch is ‘AJNI’ or ‘POWAI’ 
  DELETE FROM DEPOSIT_DETAIL
        WHERE BNAME='POWAI' or BNAME='AJNI'
        SELECT * FROM DEPOSIT_DETAIL

--5. Delete all the accounts whose account number is NULL. 
DELETE FROM DEPOSIT_DETAIL
        WHERE ANO IS NULL
        SELECT * FROM DEPOSIT_DETAIL

--6. Delete all the remaining records using Delete command. 
DELETE FROM DEPOSIT_DETAIL
        WHERE 1=1
        SELECT * FROM DEPOSIT_DETAIL
--7. Delete all the records of Deposit_Detail table. (Use Truncate) 
TRUNCATE TABLE DEPOSIT_DETAIL
SELECT * FROM DEPOSIT_DETAIL
--8. Remove Deposit_Detail table. (Use Drop) 
DROP TABLE DEPOSIT_DETAIL

***************PART-B************

CREATE TABLE EMPLOYEE_MASTER 
(
EmpNo INT ,
EmpName VARCHAR(25), 
JoiningDate DATETIME ,
Salary DECIMAL (8,2), 
City VARCHAR(20)
);
INSERT INTO EMPLOYEE_MASTER VALUES 
(101, 'Keyur', '2005-01-02', 12000.00 ,'Rajkot' ),
(102,'Hardik' ,'2015-02-04' ,14000.00, 'Ahmedabad' ),
(103, 'Kajal' ,'2014-03-06' ,15000.00 ,'Baroda' ),
(104, 'Bhoomi', '2023-06-05', 12500.00, 'Ahmedabad'),
(105 ,'Harmit', '2015-02-04' ,14000.00, 'Rajkot' ),
(106, 'Mitesh', '2025-09-01', 5000.00 ,'Jamnagar' ),
(107 ,'Meera', Null ,7000.00 ,'Morbi' ),
(108 ,'Kishan','2006-02-03' ,10000.00 ,NULL );


SELECT * FROM EMPLOYEE_MASTER



--1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.
DELETE FROM EMPLOYEE_MASTER
        WHERE Salary>=14000
        SELECT * FROM EMPLOYEE_MASTER
--2. Delete all the Employees who belongs to ‘RAJKOT’ city. 
DELETE FROM EMPLOYEE_MASTER
        WHERE City='Rajkot'
        SELECT * FROM EMPLOYEE_MASTER
--3. Delete all the Employees who joined after 1-1-2007. 
DELETE FROM EMPLOYEE_MASTER
        WHERE JoiningDate>'2007-01-01'
        SELECT * FROM EMPLOYEE_MASTER
--4. Delete the records of Employees whose joining date is null and Name is not null.
DELETE FROM EMPLOYEE_MASTER
        WHERE JoiningDate IS NULL AND EmpName IS NOT NULL
        SELECT * FROM EMPLOYEE_MASTER
--5. Delete the records of Employees whose salary is 50% of 20000. 
DELETE FROM EMPLOYEE_MASTER
        WHERE Salary=20000/2
        SELECT * FROM EMPLOYEE_MASTER
--6. Delete the records of Employees whose City Name is not empty. 
DELETE FROM EMPLOYEE_MASTER
        WHERE City IS NOT NULL
        SELECT * FROM EMPLOYEE_MASTER
--7. Delete all the records of Employee_MASTER table. (Use Truncate) 
TRUNCATE TABLE EMPLOYEE_MASTER
--8. Remove Employee_MASTER table. (Use Drop)
DROP TABLE EMPLOYEE_MASTER