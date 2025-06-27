USE CSE_3A_232
--1. Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table) 
UPDATE DEPOSIT
SET AMOUNT=5000
WHERE AMOUNT=3000
SELECT * FROM DEPOSIT
--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)  
UPDATE BORROW
SET BNAME='C.G. ROAD.'
WHERE CNAME='ANIL'
SELECT * FROM BORROW
--3. Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table) 
UPDATE DEPOSIT
SET AMOUNT=5000 , ACTNO=111
WHERE CNAME='ANIL'
SELECT * FROM DEPOSIT
--4. Update amount of KRANTI to 7000. (Use Deposit Table)
UPDATE DEPOSIT
SET AMOUNT=7000
WHERE CNAME='KRANTI'
SELECT * FROM DEPOSIT
--5. Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table) 
UPDATE BRANCH
SET BNAME='ANDHERI WEST' 
WHERE BNAME='ANDHERI'
SELECT * FROM BRANCH
--6. Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table) 
UPDATE DEPOSIT
SET BNAME='NEHRU PALACE'
WHERE CNAME='MEHUL'
SELECT * FROM DEPOSIT
--7. Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit 
--Table) 
UPDATE DEPOSIT
SET AMOUNT=5000
WHERE ACTNO>103 AND ACTNO<107
SELECT * FROM DEPOSIT
--8. Update ADATE of ANIL to 1-4-95. (Use Deposit Table) 
UPDATE DEPOSIT
SET ADATE='1995-04-01'
WHERE CNAME='ANIL'
SELECT * FROM DEPOSIT
--9. Update the amount of MINU to 10000. (Use Deposit Table)
UPDATE DEPOSIT
SET AMOUNT=10000
WHERE CNAME='MINU'
SELECT * FROM DEPOSIT
--10. Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table) 
UPDATE DEPOSIT
SET AMOUNT=5000,ADATE='1996-04-01'
WHERE CNAME='PRAMOD'
SELECT * FROM DEPOSIT

--*********PART-B**********
--1. Give 10% Increment in Loan Amount. (Use Borrow Table) 
UPDATE BORROW
SET AMOUNT=AMOUNT+(AMOUNT/10)

SELECT * FROM BORROW

--2. Customer deposits additional 20% amount to their account, update the same. (Use Deposit Table)
UPDATE DEPOSIT
SET AMOUNT=AMOUNT+(AMOUNT/5)

SELECT * FROM DEPOSIT
--3. Increase Amount by 1000 in all the account.  (Use Deposit Table) 
UPDATE DEPOSIT
SET AMOUNT=AMOUNT+1000

SELECT * FROM DEPOSIT
--4. Update the BORROW table to set the amount to 7000 and the branch name to 'CENTRAL' where the 
--customer name is ‘MEHUL’ and the loan number is even. 
UPDATE BORROW
SET AMOUNT=7000,BNAME='CENTRAL'
WHERE CNAME=' MEHUL'

SELECT * FROM BORROW
--5. Update the DEPOSIT table to set the date to '2022-05-15' and the amount to 2500 for all accounts in 
--‘VRCE’ and with an account number less than 105.
UPDATE DEPOSIT
SET AMOUNT=2500,ADATE='2022-05-15'
WHERE BNAME='VRCE'

SELECT * FROM DEPOSIT
--**********PART-C********
--1. Update amount of loan no 321 to NULL. (Use Borrow Table)
UPDATE BORROW
SET AMOUNT=NULL
WHERE LOANNO=321

SELECT * FROM BORROW
--2. Update branch name of KRANTI to NULL (Use Borrow Table) 
UPDATE BORROW
SET AMOUNT=NULL
WHERE CNAME='KRANTI'

SELECT * FROM BORROW
--3. Display the name of borrowers whose Loan number is NULL. (Use Borrow Table) 
SELECT * FROM BORROW
WHERE LOANNO IS NULL
--4. Display the Borrowers whose having branch. (Use Borrow Table)
SELECT * FROM BORROW
WHERE LOANNO IS NOT NULL
--5. Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481. 
--(Use Borrow Table) 
UPDATE BORROW
SET AMOUNT=5000,BNAME='VRCE',CNAME='DARSHAN'
WHERE LOANNO=481
SELECT * FROM BORROW

--6. Update the Deposit table and set the date to 01-01-2021 for all the depositor whose amount is less 
--than 2000. 
UPDATE DEPOSIT
SET ADATE='2021-01-01'
WHERE AMOUNT<2000

SELECT * FROM DEPOSIT
--7. Update the Deposit table and set the date to NULL & Branch name to ‘ANDHERI whose Account No is 
--110. 
UPDATE DEPOSIT
SET ADATE=NULL,BNAME='ANDHERI'
WHERE ACTNO=110

SELECT * FROM DEPOSIT