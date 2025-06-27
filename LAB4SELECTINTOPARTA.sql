USE CSE_3A_232;

CREATE TABLE CRICKET (
Name VARCHAR(50),
City VARCHAR(50),
Age INT
);

INSERT INTO CRICKET 
VALUES 
('Sachin Tendulkar','Mumbai',30),
('Rahul DRavid','Bombay',35),
('M.S Dhoni','Zarkhand',31),
('Suresh Raina','Gujarat',30);

--1. Create table Worldcup from cricket with all the columns and data. 
SELECT * INTO WORLDCUP
FROM CRICKET;
SELECT * FROM WORLDCUP
--2. Create table T20 from cricket with first two columns with no data. 
     SELECT Name,City INTO T20
     FROM CRICKET
     WHERE 1=0;
     SELECT * FROM T20
    
     
--3. Create table IPL From Cricket with No Data 
 SELECT * INTO IPL
      FROM CRICKET
     WHERE 1=0;
     SELECT * FROM IPL

     --*************PART-B*************

CREATE TABLE EMPLOYEE (
Name VARCHAR(50),
City VARCHAR(50),
Age INT
);

INSERT INTO EMPLOYEE 
VALUES 
('Jay Patel','Rajkot',30),
('Rahul Dave','Baroda',35),
('Jeet Patel','Surat',31),
('vijay Raval','RAjkot',30);

--1. Create table Employee_detail from Employee with all the columns and data.
       SELECT * INTO Employee_detail
FROM EMPLOYEE;
SELECT * FROM Employee_detail

--2. Create table Employee_data from Employee with first two columns with no data. 
SELECT Name,City INTO Employee_data
FROM EMPLOYEE
WHERE 1=0;
SELECT * FROM Employee_data

--3. Create table Employee_info from Employee with no Data
SELECT * INTO Employee_info
FROM EMPLOYEE
WHERE 1=0;
SELECT * FROM Employee_info

--****************PART-C***************
--1. Insert the Data into Employee_info from Employee whose CITY is Rajkot 
  INSERT  INTO Employee_info
SELECT *
FROM EMPLOYEE
WHERE City='Rajkot';
SELECT * FROM Employee_info
--2. Insert the Data into Employee_info from Employee whose age is more than 32.
INSERT  INTO Employee_info
SELECT *
FROM EMPLOYEE
WHERE Age>32;
SELECT * FROM Employee_info
