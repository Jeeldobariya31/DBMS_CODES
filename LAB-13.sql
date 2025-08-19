USE CSE_3A_232

SELECT * FROM Author
SELECT * FROM Publisher
SELECT * FROM Book


--Part – A: 
--1. List all books with their authors.
    SELECT Title , AuthorName 
    FROM Book JOIN Author
    ON Book.AuthorID = Author.AuthorID
--2. List all books with their publishers.
SELECT Title , PublisherName  
    FROM Book JOIN Publisher
    ON Book.PublisherID = Publisher.PublisherID
--3. List all books with their authors and publishers. 
SELECT Title , AuthorName ,PublisherName
    FROM Book JOIN Author
    ON Book.AuthorID = Author.AuthorID
    JOIN Publisher
    ON Book.PublisherID = Publisher.PublisherID

--4. List all books published after 2010 with their authors and publisher and price.
    SELECT Title , AuthorName ,PublisherName,Price
    FROM Book JOIN Author
    ON Book.AuthorID = Author.AuthorID
    JOIN Publisher
    ON Book.PublisherID = Publisher.PublisherID
    WHERE PublicationYear > 2010

--5. List all authors and the number of books they have written.
    SELECT  AuthorName, COUNT(Title) AS TOTAL_BOOK 
    FROM Book RIGHT JOIN Author
    ON Book.AuthorID = Author.AuthorID 
    GROUP BY AuthorName
--6. List all publishers and the total price of books they have published.
      SELECT  PublisherName  , SUM(Price) AS TOTAL
    FROM Book JOIN Publisher
    ON Book.PublisherID = Publisher.PublisherID
    GROUP BY PublisherName
--7. List authors who have not written any books.
SELECT  AuthorName 
    FROM Book RIGHT JOIN Author
    ON Book.AuthorID = Author.AuthorID 
    GROUP BY AuthorName
    HAVING COUNT(Title)=0
--8. Display total number of Books and Average Price of every Author. 
     SELECT  AuthorName ,COUNT(Title) AS TOTAL_BOOK,AVG(Price) AS AVERAGE_PRICE
    FROM Book RIGHT JOIN Author
    ON Book.AuthorID = Author.AuthorID
    JOIN Publisher
    ON Book.PublisherID = Publisher.PublisherID
    GROUP BY AuthorName
--9. lists each publisher along with the total number of books they have published, sorted from highest to 
--lowest. 
SELECT PublisherName , COUNT(Title)  
    FROM Book JOIN Publisher
    ON Book.PublisherID = Publisher.PublisherID
    GROUP BY PublisherName
    ORDER BY  COUNT(Title)  DESC
--10. Display number of books published each year. 
       SELECT PublicationYear , COUNT(Title)  
    FROM Book JOIN Publisher
    ON Book.PublisherID = Publisher.PublisherID
    GROUP BY PublicationYear
   
--Part – B: 
--1. List the publishers whose total book prices exceed 500, ordered by the total price.
      SELECT PublisherName  , SUM(Price)  
    FROM Book JOIN Publisher
    ON Book.PublisherID = Publisher.PublisherID
    GROUP BY PublisherName 
    HAVING SUM(Price)>500
    ORDER BY SUM(Price)
--2. List most expensive book for each author, sort it with the highest price. 
     SELECT Author.AuthorName, MAX(Book.Price) AS MAX_PRICE
FROM Book JOIN Author
ON Book.AuthorID = Author.AuthorID
GROUP BY Author.AuthorName
ORDER BY MAX(Book.Price) DESC
 
 --Part – C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_info(Did, Dname) 
--City_info(Cid, Cname, Did)) 
--District(Did, Dname, Sid) 
--State(Sid, Sname, Cid) 
--Country(Cid, Cname) 

CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50),
    Did INT,
    Cid INT,
    Salary DECIMAL(10,2),
    Experience INT
);

CREATE TABLE Dept_info (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50)
);

CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50),
    Did INT
);

CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50),
    Sid INT
);

CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50),
    Cid INT
);

CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50)
);

--2. Insert 5 records in each table. 

INSERT INTO Dept_info VALUES
(1, 'HR'), (2, 'Finance'), (3, 'IT'), (4, 'Marketing'), (5, 'Sales');

-- Country
INSERT INTO Country VALUES
(1, 'India'), (2, 'USA'), (3, 'Germany'), (4, 'Japan'), (5, 'Canada');

-- City_info
INSERT INTO City_info VALUES
(1, 'Mumbai', 1), (2, 'New York', 2), (3, 'Berlin', 3), (4, 'Tokyo', 4), (5, 'Toronto', 5);

-- State
INSERT INTO State VALUES
(1, 'Maharashtra', 1), (2, 'New York State', 2), (3, 'Berlin State', 3), (4, 'Tokyo Prefecture', 4), (5, 'Ontario', 5);

-- District
INSERT INTO District VALUES
(1, 'Mumbai District', 1), (2, 'Manhattan', 2), (3, 'Mitte', 3), (4, 'Shinjuku', 4), (5, 'Toronto District', 5);

-- Emp_info
INSERT INTO Emp_info VALUES
(101, 'Alice', 1, 1, 50000, 5),
(102, 'Bob', 2, 2, 60000, 7),
(103, 'Charlie', 3, 3, 70000, 4),
(104, 'David', 4, 4, 55000, 6),
(105, 'Eva', 5, 5, 65000, 3);

--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees.

SELECT 
    E.Ename AS EmployeeName,
    D.Dname AS DepartmentName,
    E.Salary,
    E.Experience,
    CI.Cname AS City,
    DI.Dname AS District,
    S.Sname AS State,
    CO.Cname AS Country
FROM Emp_info E
JOIN Dept_info D ON E.Did = D.Did
JOIN City_info CI ON E.Cid = CI.Cid
JOIN District DI ON CI.Did = DI.Did
JOIN State S ON DI.Sid = S.Sid
JOIN Country CO ON S.Cid = CO.Cid;