USE CSE_3A_232

--**************PART-A*****************

--1. Add two more columns City VARCHAR (20) and Pincode INT.
         ALTER TABLE DEPOSIT
         ADD CITY VARCHAR(20),Pincode INT
         SELECT * FROM DEPOSIT
--2. Add column state VARCHAR(20). 
          ALTER TABLE DEPOSIT
         ADD STATE VARCHAR(20)
          SELECT * FROM DEPOSIT
--3. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35). 
         ALTER TABLE DEPOSIT
         ALTER COLUMN CNAME VARCHAR(35)
          SELECT * FROM DEPOSIT
--4. Change the data type DECIMAL to INT in amount Column.
          ALTER TABLE DEPOSIT
         ALTER COLUMN AMOUNT INT
          SELECT * FROM DEPOSIT
--5. Delete Column City from the DEPOSIT table. 
         ALTER TABLE DEPOSIT
         DROP COLUMN CITY
          SELECT * FROM DEPOSIT
--6. Rename Column ActNo to ANO.
  SP_RENAME 'DEPOSIT.ACTNO','ANO'
   SELECT * FROM DEPOSIT
--7. Change name of table DEPOSIT to DEPOSIT_DETAIL.
SP_RENAME 'DEPOSIT','DEPOSIT_DETAIL'
   SELECT * FROM DEPOSIT_DETAIL

--   **********************PART-B*******************
  
--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table. 
SP_RENAME 'DEPOSIT_DETAIL.ADATE','AOPENDATE'
   SELECT * FROM DEPOSIT_DETAIL
--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table. 
         ALTER TABLE DEPOSIT_DETAIL
         DROP COLUMN AOPENDATE
          SELECT * FROM  DEPOSIT_DETAIL
--3. Rename Column CNAME to CustomerName. 
SP_RENAME 'DEPOSIT_DETAIL.CNAME','CustomerName'
   SELECT * FROM DEPOSIT_DETAIL

--4. Add Column country.
         ALTER TABLE DEPOSIT_DETAIL
         ADD Country VARCHAR(20)
         SELECT * FROM DEPOSIT_DETAIL

         --******************************PART-C***************

         CREATE TABLE STUDENT_DETAIL
         ( Enrollment_No VARCHAR(20), 
           Name VARCHAR(25) ,
          CPI DECIMAL(5,2) ,
          Birthdate DATETIME 
         );
         SELECT * FROM STUDENT_DETAIL
--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
ALTER TABLE STUDENT_DETAIL
ADD City VARCHAR (20) NOT NULL ,Backlog INT
 SELECT * FROM STUDENT_DETAIL
--2. Add column department VARCHAR (20) Not Null. 
ALTER TABLE STUDENT_DETAIL
ADD Department VARCHAR (20) NOT NULL 
 SELECT * FROM STUDENT_DETAIL
--3. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
  ALTER TABLE STUDENT_DETAIL
         ALTER COLUMN Name VARCHAR(35)
          SELECT * FROM STUDENT_DETAIL
--4. Change the data type DECIMAL to INT in CPI Column.
ALTER TABLE STUDENT_DETAIL
         ALTER COLUMN CPI INT
          SELECT * FROM STUDENT_DETAIL
--5. Delete Column City from the student_detail table.
ALTER TABLE STUDENT_DETAIL
         DROP COLUMN City
          SELECT * FROM STUDENT_DETAIL
--6. Rename Column Enrollment_No to ENO.
          SP_RENAME 'STUDENT_DETAIL.Enrollment_No','ENO'
          SELECT * FROM STUDENT_DETAIL
--7. Change name of table student_detail to STUDENT_MASTER. 
SP_RENAME 'STUDENT_DETAIL','STUDENT_MASTER'
          SELECT * FROM STUDENT_MASTER