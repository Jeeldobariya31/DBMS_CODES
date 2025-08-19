USE CSE_3A_232

--Part – A: 
--1. Combine information from Person and Department table using cross join or Cartesian product. 
	SELECT * FROM 
	DEPT CROSS JOIN PERSON
--2. Find all persons with their department name 
	SELECT PERSON.PERSONNAME , DEPT.DEPARTMENTNAME
	FROM PERSON PERSON JOIN DEPT
	ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID
--3. Find all persons with their department name & code. 
	SELECT Person.PersonName , DEPT.DepartmentName , DEPT.DepartmentCode
	FROM Person JOIN DEPT
	ON Person.DepartmentID = DEPT.DepartmentID
--4. Find all persons with their department code and location. 
	SELECT Person.PersonName , DEPT.DepartmentCode , DEPT.Location
	FROM Person JOIN DEPT
	ON Person.DepartmentID = DEPT.DepartmentID;
--5. Find the detail of the person who belongs to Mechanical department. 
	SELECT Person.PersonName , DEPT.DepartmentName , DEPT.DepartmentCode
	FROM Person JOIN DEPT
	ON Person.DepartmentID = DEPT.DepartmentID
	WHERE DEPT.DepartmentCode='ME';
--6. Final person’s name, department code and salary who lives in Ahmedabad city. 
	SELECT Person.PersonName , DEPT.DepartmentCode , Person.Salary, Person.City
	FROM Person JOIN DEPT
	ON Person.DepartmentID = DEPT.DepartmentID
	WHERE Person.City = 'Ahmedabad'
--7. Find the person's name whose department is in C-Block. 
	SELECT Person.PersonName , DEPT.DepartmentName , DEPT.DepartmentCode
	FROM Person JOIN DEPT
	ON Person.DepartmentID = DEPT.DepartmentID
	WHERE DEPT.Location = 'C-Block'
--8. Retrieve person name, salary & department name who belongs to Jamnagar city.
	SELECT Person.PersonName , DEPT.DepartmentCode , Person.Salary, Person.City
	FROM Person JOIN DEPT
	ON Person.DepartmentID = DEPT.DepartmentID
	WHERE Person.City = 'Jamnagar'
--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001. 
	SELECT Person.PersonName , DEPT.DepartmentName , DEPT.DepartmentCode
	FROM Person JOIN DEPT
	ON Person.DepartmentID = DEPT.DepartmentID
	WHERE DEPT.DepartmentCode='CI'	AND Person.joiningDate > '2001-08-01'
--10. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days. 
	SELECT Person.PersonName , DEPT.DepartmentCode , Person.Salary, Person.City
	FROM Person JOIN DEPT
	ON Person.DepartmentID = DEPT.DepartmentID
	WHERE DATEDIFF(DAY,Person.joiningDate,GETDATE()) > 365
--11. Find department wise person counts. 
	 SELECT DEPT.DepartmentName , COUNT(PERSON.PersonName)
	 FROM PERSON JOIN DEPT
	 ON Person.DepartmentID = DEPT.DepartmentID
	 GROUP BY DEPT.DepartmentName
--12. Give department wise maximum & minimum salary with department name. 
	SELECT DEPT.DepartmentName , MAX(Person.Salary) AS MAX_SALARY , MIN(Person.Salary) AS MIN_SALARY
	 FROM PERSON JOIN DEPT
	 ON Person.DepartmentID = DEPT.DepartmentID
	 GROUP BY DEPT.DepartmentName
--13. Find city wise total, average, maximum and minimum salary. 
	 SELECT Person.City , AVG(Person.Salary) AS AVG_SALARY , MAX(Person.Salary) AS MAX_SALARY , MIN(Person.Salary) AS MIN_SALARY
	 FROM PERSON JOIN DEPT
	 ON Person.DepartmentID = DEPT.DepartmentID
	 GROUP BY Person.City
--14. Find the average salary of a person who belongs to Ahmedabad city. 
	SELECT PersonName , AVG(Salary)
	FROM Person
	WHERE City = 'AHMEDABAD'
	GROUP BY PersonName
--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In 
--single column)
	SELECT Person.PersonName + ' Lives in ' + Person.City + ' and works in ' + DEPT.DepartmentName + ' department.' 
	FROM Person JOIN DEPT
	ON Person.DepartmentID = DEPT.DepartmentID;


--Part – B: 
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In 
--single column) 
	SELECT Person.PersonName + ' earns ' + CAST(Person.Salary AS varchar(50)) + ' from ' + DEPT.DepartmentName + ' department monthly.' 
	FROM Person JOIN DEPT
	ON Person.DepartmentID = DEPT.DepartmentID;
--2. Find city & department wise total, average & maximum salaries. 
	SELECT Person.City , DEPT.DepartmentName , MAX(Person.Salary) AS MAX_SALARY , AVG(Person.Salary) AS AVG_SALARY
	 FROM PERSON JOIN DEPT
	 ON Person.DepartmentID = DEPT.DepartmentID
	 GROUP BY Person.City , DEPT.DepartmentName
--3. Find all persons who do not belong to any department.
	SELECT * FROM Person
	WHERE DepartmentID IS NULL
--4. Find all departments whose total salary is exceeding 100000. 
	SELECT DEPT.DepartmentName , SUM(Person.Salary) 
	FROM Person JOIN DEPT
	ON Person.DepartmentID = DEPT.DepartmentID
	GROUP BY DEPT.DepartmentName
	HAVING SUM(Person.Salary) > 100000


--Part – C: 
--1. List all departments who have no person. 
	SELECT DEPT.DepartmentName
	FROM DEPT JOIN Person
	ON Person.DepartmentID = DEPT.DepartmentID
	GROUP BY DEPT.DepartmentName
	HAVING COUNT(Person.PersonName) = 0

--2. List out department names in which more than two persons are working. 
	SELECT DEPT.DepartmentName
	FROM DEPT JOIN Person
	ON Person.DepartmentID = DEPT.DepartmentID
	GROUP BY DEPT.DepartmentName
	HAVING COUNT(Person.PersonName) > 2
--3. Give a 10% increment in the computer department employee’s salary. (Use Update) 
	UPDATE Person
	SET Salary = Salary + (Salary * 0.1)
	FROM PERSON 
	JOIN DEPT 
	ON PERSON.DEPARTMENTID = DEPT.DEPARTMENTID
	WHERE DEPT.DepartmentName = 'COMPUTER'