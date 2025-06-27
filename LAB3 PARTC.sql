USE CSE_3A_232;

-- 1. Display all the detail of customer who deposited more than 5000 without using * from deposit table.
SELECT ACTNO, CNAME, BNAME, AMOUNT, ADATE FROM DEPOSIT WHERE AMOUNT > 5000;

-- 2. Retrieve all unique customer names with city. (Use Customer table)
SELECT DISTINCT CNAME, CITY FROM CUSTOMER;

-- 3. Retrieve records from the BORROW table where the loan amount is greater than 3000 and the loan number is not a multiple of 3.
SELECT * FROM BORROW WHERE AMOUNT > 3000 AND LOANNO % 3 <> 0;

-- 4. Retrieve records from the DEPOSIT table where amount is greater than 2000 also account number is between 100 and 110 and date is after '1-MAR-1995' or before '27-MAR-1996'.
SELECT * FROM DEPOSIT 
WHERE AMOUNT > 2000 
AND ACTNO BETWEEN 100 AND 110 
AND (ADATE > '1995-03-01' OR ADATE < '1996-03-27');

-- 5. Retrieve all odd/even value loan number from Borrow table.
-- Odd loan numbers:
SELECT * FROM BORROW WHERE LOANNO % 2 = 1;

-- Even loan numbers (optional):
-- SELECT * FROM BORROW WHERE LOANNO % 2 = 0;
