USE CSE_3A_232;

-- 1. Display all the details of first five customers from deposit table.
SELECT TOP 5 * FROM DEPOSIT;

-- 2. Display all the details of first three depositors from deposit table whose amount is greater than 1000.
SELECT TOP 3 * FROM DEPOSIT WHERE AMOUNT > 1000;

-- 3. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to ‘ANDHERI’ from borrow table.
SELECT TOP 5 LOANNO, CNAME FROM BORROW WHERE BNAME <> 'ANDHERI';

-- 4. Select all details with account numbers not in the range 105 to 109 in deposit table.
SELECT * FROM DEPOSIT WHERE ACTNO NOT BETWEEN 105 AND 109;

-- 5. Select all records from BORROW where the amount is greater than 1000 and less than or equal to 7000, and the loan number is between 250 and 600
SELECT * FROM BORROW 
WHERE AMOUNT > 1000 AND AMOUNT <= 7000 
AND LOANNO BETWEEN 250 AND 600;
