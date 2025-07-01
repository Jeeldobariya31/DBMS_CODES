USE CSE_3A_232
create table StudentInfo(
Name varchar(50),
City varchar(50),
Age int,
Grade VARCHAR(4)
)
insert into StudentInfo values
('Ravi', 'Ahmedabad', 22, 'A'),
('Priya', 'Surat', 21, 'B'),
('Kiran', 'Rajkot', 23, 'A'),
('Neha' ,'Vadodara', 20 ,'C'),
('Amit', 'Ahmedabad', 24 ,'B')


--Part A: 
-- 1. Create table Student_detail from Student with all the columns and data.
SELECT * INTO Student_detail
FROM StudentInfo ;
SELECT * FROM Student_detail
-- 2. Create table Student_data from Student with first three columns with no data.
SELECT Name,City,Age INTO Student_data
FROM StudentInfo 
WHERE 1=0;
SELECT * FROM Student_data
-- 3. Create table Student_info1 from Student_info with no Data
SELECT * INTO Student_info1
FROM StudentInfo 
WHERE 1=0;
SELECT * FROM Student_info1
-- 4. Insert the Data into Student_info from Student whose CITY is Ahmedabad,
INSERT  INTO Student_info1
SELECT * FROM  Studentinfo
WHERE City='Ahmedabad';
SELECT * FROM Student_info1
-- 5. Insert the Data into Student_info from Student whose age is less than 22.
INSERT  INTO Student_info1
SELECT * FROM  Studentinfo
WHERE Age <22;
SELECT * FROM Student_info1
-- 6. Insert the Data into Student_info from Student whose Grade is 'A'. 
INSERT  INTO Student_info1
SELECT * FROM  Studentinfo
WHERE Grade='A';
SELECT * FROM Student_info1
--From the above given tables perform the following queries (UPDATE
--Operation):
-- 1. Update grade of all students from B to A+. (Use Student Table)
UPDATE StudentInfo
SET Grade='A+'
WHERE Grade='B'
SELECT * FROM StudentInfo
-- 2. Change city of RAVI from Ahmedabad to Gandhinagar. (Use Student Table)
UPDATE StudentInfo
SET City='Gandhinagar'
WHERE Name='Ravi'
SELECT * FROM StudentInfo
-- 3. Update Age of PRIYA to 22 & Grade to A. (Use Student Table)
UPDATE StudentInfo
SET Age=22 , Grade='A'
WHERE Name='Priya'
SELECT * FROM StudentInfo
-- 4. Update grade of KIRAN to A+. (Use Student Table)
UPDATE StudentInfo
SET Grade='A+'
WHERE Name='Kiran'
SELECT * FROM StudentInfo
-- 5. Update city from Surat to Surat City. (Use Student Table)
UPDATE StudentInfo
SET City='Surat City'
WHERE City='Surat'
SELECT * FROM StudentInfo
-- 6. Update age of NEHA to 21. (Use Student Table)
UPDATE StudentInfo
SET Age=21 
WHERE Name='Neha'
SELECT * FROM StudentInfo
-- 7. Update grade of all students to B+ whose age between 21 & 23. (Use Student Table)
UPDATE StudentInfo
SET  Grade='B+'
WHERE Age>=21 AND Age<=23
SELECT * FROM StudentInfo
-- 8. Update city of AMIT to Rajkot. (Use Student Table)
UPDATE StudentInfo
SET City='Rajkot'
WHERE Name='Amit'
SELECT * FROM StudentInfo
-- 9. Update the grade of PRIYA to A+. (Use Student Table)
UPDATE StudentInfo
SET Grade='A+'
WHERE Name='Priya'
SELECT * FROM StudentInfo
-- 10. Update age of KIRAN to 25 and Grade to A+ (Use Student Table)
UPDATE StudentInfo
SET Grade='A+',Age=25
WHERE Name='Kiran'
SELECT * FROM StudentInfo
-- ============================================================
-- LIBRARY TABLE
-- ============================================================

create TABLE LIBRARY (
BookId INT,
BookName VARCHAR(50),
Author VARCHAR(50),
Price DECIMAL(5,2)
)
INSERT INTO LIBRARY VALUES
(101 ,'Java Basics', 'James Smith', 450.00),
(102,'Python Guide', 'Mary Johnson', 650.00),
(103, 'C++ Concepts', 'Robert Davis', 550.00),
(104,'HTML Basics','Lisa Brown', 350.00),
(105 ,'CSS Guide', 'David Wilson', 400.00)

 --Part A:
-- 1. Create table Library_backup from Library with all the columns and data.
SELECT * INTO Library_backup
FROM LIBRARY ;
SELECT * FROM Library_backup
-- 2. Create table Library_books from Library with BookName and Author columns with no data.
SELECT BookName,Author INTO Library_books
FROM LIBRARY 
WHERE 1=0
SELECT * FROM Library_books
-- 3. Create table Library_info from Library with no Data
SELECT * INTO Library_info
FROM LIBRARY 
WHERE 1=0
SELECT * FROM Library_info
-- 4. Display all the details of first three books from Library table.
SELECT TOP(3) * 
FROM LIBRARY 

-- 5. Display all the details of books from Library table whose price is greater than 500.
SELECT * 
FROM LIBRARY 
WHERE Price>500

-- 6. Display BookId, BookName of books whose Author does not belong to 'James Smith'.
SELECT BookId, BookName 
FROM LIBRARY 
WHERE NOT Author='James Smith'
-- 7. Select all details with BookId not in the range 102 to 104 in Library table.
SELECT * 
FROM LIBRARY 
WHERE BookId NOT BETWEEN 102 AND 104
-- 8. Select all records from Library where the price is greater than 400 and less than or equal to 600.
SELECT * 
FROM LIBRARY 
WHERE Price>=400 
 --Use Library table for ALTER operations:

 -- 1. Add two more columns Publisher VARCHAR(30) and Year INT.
 ALTER TABLE LIBRARY
 ADD Publisher VARCHAR(30),Year INT
 SELECT * FROM LIBRARY
-- 2. Add column Category VARCHAR(25).
ALTER TABLE LIBRARY
 ADD Category VARCHAR(25)
 SELECT * FROM LIBRARY
 -- 3. Change the size of BookName column from VARCHAR(50) to VARCHAR(40).
ALTER TABLE LIBRARY
ALTER COLUMN BookName VARCHAR(40)
SELECT * FROM LIBRARY
-- 4. Change the data type DECIMAL to INT in Price Column.
ALTER TABLE LIBRARY
ALTER COLUMN Price INT
SELECT * FROM LIBRARY
-- 5. Delete Column Publisher from the Library table.
ALTER TABLE LIBRARY
DROP COLUMN Publisher
SELECT * FROM LIBRARY
-- 6. Rename Column BookId to Book_ID.
SP_RENAME 'LIBRARY.BookId','Book_ID'
   SELECT * FROM LIBRARY
-- 7. Change name of table Library to Book_Details.\
SP_RENAME 'LIBRARY','Book_Details'
   SELECT * FROM Book_Details
-- 8. Rename Column Author to Book_Author OF Book_Details table.
SP_RENAME 'Book_Details.Author','Book_Author'
   SELECT * FROM Book_Details
-- 9. Delete Column Year from the Book_Details table.
ALTER TABLE Book_Details
DROP COLUMN Year
SELECT * FROM Book_Details
-- 10. Rename Column BookName to Title.
SP_RENAME 'Book_Details.BookName','Title'
   SELECT * FROM Book_Details
-- 11. Add Column Location VARCHAR(20)
ALTER TABLE Book_Details
 ADD Location VARCHAR(20)
 SELECT * FROM Book_Details