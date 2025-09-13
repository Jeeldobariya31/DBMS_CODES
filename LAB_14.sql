USE CSE_3A_232;


-- STUDENT_DATA 
CREATE TABLE STUDENTS_DATA (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT
);

INSERT INTO STUDENTS_DATA VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);


-- DEPARTMENT 
CREATE TABLE DEPARTMENT (
    DID INT PRIMARY KEY,
    DName VARCHAR(50)
);

INSERT INTO DEPARTMENT VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');


-- ACADEMIC 
CREATE TABLE ACADEMIC (
    Rno INT PRIMARY KEY,
    SPI DECIMAL(3,1),
    BKLOG INT
);

INSERT INTO ACADEMIC VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);


-- COMPUTER
CREATE TABLE COMPUTER (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO COMPUTER VALUES
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');


-- ELECTRICAL 
CREATE TABLE ELECTRICAL (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO ELECTRICAL VALUES
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');


-- EMP_DATA table
CREATE TABLE EMP_DATA (
    EID INT ,
    Name VARCHAR(50)
);

INSERT INTO EMP_DATA VALUES
(1, 'Ajay'),
(9, 'Haresh'),
(5, 'Manish');


-- CUSTOMER table
CREATE TABLE CUSTOMERS (
    CID INT,
    Name VARCHAR(50)
);
 


INSERT INTO CUSTOMERS VALUES
(5, 'Ajay'),
(7, 'Mahesh'),
(5, 'Manish');   

-- =============================
-- SUBQUERY QUERIES
-- =============================

-- Part – A
-- 1. Display details of students who are from computer department.
SELECT * 
FROM STUDENTS_DATA 
WHERE DID = (SELECT DID FROM DEPARTMENT WHERE DName = 'Computer');

-- 2. Displays name of students whose SPI is more than 8.
SELECT Name 
FROM STUDENTS_DATA 
WHERE Rno IN (SELECT Rno FROM ACADEMIC WHERE SPI > 8);

-- 3. Display details of students of computer department who belongs to Rajkot city.
SELECT * 
FROM STUDENTS_DATA 
WHERE City = 'Rajkot' 
  AND DID = (SELECT DID FROM DEPARTMENT WHERE DName = 'Computer');

-- 4. Find total number of students of electrical department.
SELECT COUNT(*) AS Total_Electrical_Students
FROM STUDENTS_DATA
WHERE DID = (SELECT DID FROM DEPARTMENT WHERE DName = 'Electrical');

-- 5. Display name of student who is having maximum SPI.
SELECT *
FROM STUDENTS_DATA 
WHERE Rno = (SELECT Rno FROM ACADEMIC WHERE SPI=(SELECT MAX(SPI) FROM ACADEMIC));

-- 6. Display details of students having more than 1 backlog.
SELECT * 
FROM STUDENTS_DATA 
WHERE Rno IN (SELECT Rno FROM ACADEMIC WHERE BKLOG > 1);


-- Part – B
-- 1. Display name of students who are either from computer department or from mechanical department.
SELECT Name 
FROM STUDENTS_DATA 
WHERE DID IN (SELECT DID FROM DEPARTMENT WHERE DName IN ('Computer','Mechanical'));

-- 2. Display name of students who are in same department as 102 studying in.
SELECT Name 
FROM STUDENTS_DATA 
WHERE DID = (SELECT DID FROM STUDENT_DATA WHERE Rno = 102);


-- Part – C
-- 1. Display name of students whose SPI is more than 9 and who is from electrical department.
SELECT Name 
FROM STUDENTS_DATA 
WHERE DID = (SELECT DID FROM DEPARTMENT WHERE DName = 'Electrical')
  AND Rno IN (SELECT Rno FROM ACADEMIC WHERE SPI > 9);

-- 2. Display name of student who is having second highest SPI.
SELECT Rno,Name 
FROM STUDENTS_DATA 
WHERE Rno = (
  SELECT TOP 1 Rno FROM ACADEMIC 
  WHERE SPI <(SELECT  MAX(SPI) FROM ACADEMIC ) ORDER BY SPI DESC);
 
-- 3. Display city names whose students SPI is 9.2
SELECT Name , City 
FROM STUDENTS_DATA 
WHERE Rno IN (SELECT Rno FROM ACADEMIC WHERE SPI = 9.2);

-- 4. Find the names of students who have more than the average number of backlogs across all students.
SELECT Name 
FROM STUDENTS_DATA 
WHERE Rno IN (
  SELECT Rno FROM ACADEMIC 
  WHERE BKLOG > (SELECT AVG(BKLOG) FROM ACADEMIC)
);

-- 5. Display the names of students who are in the same department as the student with the highest SPI.
SELECT Name 
FROM STUDENTS_DATA 
WHERE DID = (
  SELECT DID FROM STUDENT_DATA 
  WHERE Rno = (SELECT TOP 1 Rno FROM ACADEMIC ORDER BY SPI DESC)
);

-- SET OPERATOR QUERIES

-- Part – A (COMPUTER & ELECTRICAL)
SELECT Name FROM COMPUTER
UNION
SELECT Name FROM ELECTRICAL;

SELECT Name FROM COMPUTER
UNION ALL
SELECT Name FROM ELECTRICAL;

SELECT Name FROM COMPUTER
INTERSECT
SELECT Name FROM ELECTRICAL;

SELECT Name FROM COMPUTER
EXCEPT
SELECT Name FROM ELECTRICAL;

SELECT Name FROM ELECTRICAL
EXCEPT
SELECT Name FROM COMPUTER;

SELECT * FROM COMPUTER
UNION
SELECT * FROM ELECTRICAL;

SELECT * FROM COMPUTER
INTERSECT
SELECT * FROM ELECTRICAL;


-- Part – B (EMP_DATA & CUSTOMER)
SELECT Name FROM EMP_DATA
UNION
SELECT Name FROM CUSTOMERS;

SELECT Name FROM EMP_DATA
UNION ALL
SELECT Name FROM CUSTOMERS;

SELECT Name FROM EMP_DATA
INTERSECT
SELECT Name FROM CUSTOMERS;

SELECT Name FROM EMP_DATA
EXCEPT
SELECT Name FROM CUSTOMERS;

SELECT Name FROM CUSTOMERS
EXCEPT
SELECT Name FROM EMP_DATA;


-- Part – C (ID + Name instead of Name only)
SELECT EID AS ID, Name FROM EMP_DATA
UNION
SELECT CID AS ID, Name FROM CUSTOMERS;

SELECT EID AS ID, Name FROM EMP_DATA
UNION ALL
SELECT CID AS ID, Name FROM CUSTOMERS;

SELECT EID AS ID, Name FROM EMP_DATA
INTERSECT
SELECT CID AS ID, Name FROM CUSTOMERS;

SELECT EID AS ID, Name FROM EMP_DATA
EXCEPT
SELECT CID AS ID, Name FROM CUSTOMERS;

SELECT CID AS ID, Name FROM CUSTOMERS
EXCEPT
SELECT EID AS ID, Name FROM EMP_DATA;
