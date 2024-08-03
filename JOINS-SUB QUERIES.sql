CREATE DATABASE join_study;

USE join_study;

CREATE TABLE emp (
	id INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(30),
    Lname VARCHAR(30),
    age INT DEFAULT 18,
    email VARCHAR(30) UNIQUE,
    phoneNo VARCHAR(15) UNIQUE,
	city VARCHAR(15),
    CONSTRAINT check_phone_length CHECK (CHAR_LENGTH(phoneNo) = 10)
    );
    
INSERT INTO emp (fname, Lname, age, email, phoneNo, city)
VALUES ('aman', 'singh', 25, 'aman@gmail.com', 9420023310, 'allahabad'),
('ashish', 'kumar', 25, 'asish@gmail.com', 9420023330, 'delhi'),
('ankita', 'singh', 29, 'ankita@gmail.com', 9420023320, 'bangalore'),
('cn', 'singh', 56, 'cn@gmail.com', 9420023340, 'prayaraj'),
('kiran', 'singh', 54, 'kiran@gmail.com', 9420023350, 'udaipur');
    
CREATE TABLE client (
	id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    age INT,
    email VARCHAR(30),
    phoneNo VARCHAR(15) UNIQUE,
    city VARCHAR(20),
    empID INT,
    CONSTRAINT check_phone_len CHECK (CHAR_LENGTH(phoneNo) = 10),
    FOREIGN KEY (empID)
    REFERENCES emp(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );
    
INSERT INTO client (id, first_name, last_name, age, email, phoneNo, city, empID) 
VALUES
(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', '3331234560', 'Kolkata', 3),
(2, 'Max', 'Poirier', 27, 'max@gmail.com', '2221234560', 'Kolkata', 3),
(3, 'Peter', 'Jain', 24, 'peter@abc.com', '1111234560', 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', '4545412345', 'Hyderabad', 5),
(5, 'Pratap', 'Singh', 36, 'p@xyz.com', '7776712345', 'Mumbai', 2);
    
CREATE TABLE projects (
	id INT PRIMARY KEY NOT NULL,
    empID INT UNIQUE,
    name VARCHAR(5),
    startdate DATE,
    clientID INT,
    FOREIGN KEY (empID) REFERENCES emp(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (clientID) REFERENCES client(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );
    
INSERT INTO projects (id, empID, name, startdate, clientID)
VALUES
(1,1,'A','21-04-21',3),
(2,2,'B','21-03-12',1),
(3,3,'C','21-01-12',5),
(4,4,'D','21-01-16',2),
(5,5,'E','21-05-01',4);

-- INNER JOIN
-- enlist all the emp name along with the project allocated to them
SELECT e.fname, e.lname, p.name
FROM emp AS e 
INNER JOIN projects AS p
ON e.id = p.empID;

-- inner join without INNER JOIN keyword 
SELECT * 
FROM emp , projects 
WHERE emp.id = projects.empID; 

-- fetch out each project allocated to each employee
-- LEFT JOIN
SELECT * FROM emp AS e
LEFT JOIN projects AS p
ON e.id = p.empID;

-- RIGHT JOIN 
-- find all the projects and details about about each employee assocated to them
SELECT p.name, e.fname 
FROM emp AS e
RIGHT JOIN projects AS p
ON e.id = p.empID;

-- FULL JOIN 
SELECT p.name, e.fname 
FROM emp as e 
LEFT JOIN projects as p 
ON e.id = p.empID
UNION 
SELECT p.name , e.fname
FROM emp as e 
RIGHT JOIN projects as p
ON e.id = p.empID;

-- CROSS JOIN 
SELECT e.*, p.* 
FROM emp AS e
CROSS JOIN projects AS p;

-- SELF JOIN 
SELECT e1.*, e2.* 
FROM emp AS e1 
INNER JOIN emp AS e2
ON e1.id = e2.id;


select * from emp;
-- SUB QUERIES 

-- sub query after WHERE Clause
-- WHERE CLAUSE same table 
-- employee with age more than 30
SELECT * FROM emp WHERE age IN  (SELECT age FROM emp WHERE age > 30);

-- WHERE clause Different table
-- emp details working in more than 1 projects 
SELECT * FROM emp WHERE id IN (
	select empID FROM projects GROUP BY empID HAVING COUNT(empID) > 1);
    
-- subquery returning single value
-- emp details having age more than average age
SELECT * FROM emp WHERE age > ( SELECT avg(age) FROM emp); 

-- sub query after FROM clause - returns a derived table 
-- select max age whose first name has 'a';
SELECT max(age) FROM (SELECT * FROM emp WHERE fname LIKE '%a%') AS e;

-- correated query
-- inner query depend on outer and outer query on inner

-- find 3rd oldeste employee
SELECT * FROM emp AS e1
WHERE 3 = (
	SELECT COUNT(e2.age) 
    FROM emp AS e2
    WHERE e2.age >= e1.age
    );
