USE CSE_3A_232;

CREATE TABLE STU_MASTER (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    Branch VARCHAR(50) DEFAULT 'General',
    SPI DECIMAL(4,2) CHECK (SPI <= 10),
    Bklog INT CHECK (Bklog >= 0)
);

INSERT INTO STU_MASTER (Rno, Name, Branch, SPI, Bklog) VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', DEFAULT, 4.50, 3);  

SELECT * FROM STU_MASTER

UPDATE STU_MASTER
SET SPI = 12
WHERE Name = 'Raju'

UPDATE STU_MASTER
SET Bklog = -1
WHERE Name = 'Neha'

--PART-B

CREATE TABLE Dept_details (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

CREATE TABLE City_details (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

CREATE TABLE Emp_details (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10,2) CHECK (Salary >= 0),
    Experience INT CHECK (Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_details(Did),
    FOREIGN KEY (Cid) REFERENCES City_details(Cid)
);

INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience)
VALUES (102, 'Sneha', 1, 1, 60000.00, -3);
-- Fails due to CHECK constraint on Experience

INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience)
VALUES (103, 'Amit', 99, 88, 45000.00, 2);
-- Fails due to FOREIGN KEY constraint (Did=99 and Cid=88 not found)
