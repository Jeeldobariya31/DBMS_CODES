--1. Retrieve all data from table DEPOSIT.
      SELECT * FROM DEPOSIT;
--2. Retrieve all data from table BORROW. 
      SELECT * FROM BORROW;
--3. Display Account No, Customer Name & Amount from DEPOSIT. 
      SELECT ACTNO,CNAME,AMOUNT FROM DEPOSIT;
--4. Display Loan No, Amount from BORROW. 
     SELECT LOANNO,AMOUNT FROM BORROW;
--5. Display loan details of all customers who belongs to ‘ANDHERI’ branch from borrow table.
      SELECT *  FROM BORROW
      WHERE BNAME='ANDHERI';
--6. Give account no and amount of depositor, whose account no is equals to 106 from deposit table.
      SELECT ACTNO,AMOUNT FROM DEPOSIT
      WHERE ACTNO!=106;
--7. Give name of borrowers having amount greater than 5000 from borrow table.  
      SELECT CNAME  FROM BORROW
      WHERE AMOUNT>5000;
--8. Give name of customers who opened account after date '1-12-95' from deposit table.  
       SELECT CNAME FROM DEPOSIT
      WHERE ADATE >'1995-12-1';
--9. Display name of customers whose account no is less than 105 from deposit table. 
       SELECT CNAME FROM DEPOSIT
      WHERE ACTNO <105;
--10. Display name of customer who belongs to either ‘NAGPUR’ or ‘DELHI’ from customer table. (USE OR & 
--IN) 
     SELECT CNAME FROM CUSTOMER
      WHERE CITY='NAGPUR' OR CITY='DELHI';
      
--11. Display name of customers with branch whose amount is greater than 4000 and account no is less than 
--105 from deposit table.
       SELECT CNAME FROM DEPOSIT
      WHERE AMOUNT>4000 AND ACTNO<105;
--12. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow 
--table. (USE AND & BETWEEN)
      SELECT * FROM BORROW
      WHERE AMOUNT>=3000 AND AMOUNT<=8000;
--13. Find all depositors who do not belongs to ‘ANDHERI’ branch from deposit table.
        SELECT * FROM DEPOSIT
      WHERE BNAME!='ANDHERI';
--14. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ 
--Or ‘M.G. ROAD’ and Account No is less than 104 from deposit table. 
        SELECT ACTNO,CNAME,AMOUNT FROM DEPOSIT
      WHERE BNAME IN ('KAROLBAGH','AJNI','M.G.ROAD')AND ACTNO<104;
--15. Display all loan no, customer from borrow table does not belong to ‘VIRAR’ or ‘AJNI’ branch. (use NOT 
--IN) 
       SELECT LOANNO FROM BORROW
      WHERE BNAME NOT IN ('VIHAR','AJNI') ;
--16. Display all the customer’s name other than ‘MINU’ from deposit table (Use: NOT, <>, !=) 
        SELECT * FROM DEPOSIT
      WHERE CNAME!='MINU';
--17. Display customer name from deposit table whose branch name is not available. (NULL)
       SELECT * FROM DEPOSIT
      WHERE BNAME!=NULL;
--18. Retrieve all unique branches using DISTINCT. (Use Branch Table) 
      SELECT DISTINCT BNAME FROM BRANCH ;
--19. Retrieve first 50% record from borrow table.
    SELECT TOP 50 PERCENT * FROM BORROW;
      
        
--20. Retrieve first five account number from deposit table.
     SELECT TOP 5  * FROM DEPOSIT;