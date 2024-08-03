-- SET OPERATIONS
-- combines vertically (rows)
-- always gives distinct values ( duplicate value provided once)
-- coloumn name and datatype on each table should be same 

CREATE DATABASE set_study;

USE set_study;

CREATE TABLE dept1 (
empid INT PRIMARY KEY,
name VARCHAR(5),
role  VARCHAR(20)
);

INSERT INTO dept1 (empid, name, role)
VALUES 
(1,'A','engineer'),
(2,'B','saleman'),
(3,'C','manager'),
(4,'D','salesman'),
(5,'E','engineer');

CREATE TABLE dept2 (
empid INT PRIMARY KEY,
name VARCHAR(5),
role  VARCHAR(20)
);

INSERT INTO dept2 (empid, name, role)
VALUES 
(3,'C','manager'),
(6,'F','marketing'),
(7,'G','salesman');

-- List out all the employees in the company 
-- UNION 
SELECT name, role 
FROM dept1
UNION
SELECT name, role
FROM dept2;

-- list out all the employee in all the dept who work as salesman 
SELECT * FROM dept1 WHERE role = 'salesman'
UNION 
SELECT * FROM dept2 WHERE role = 'salesman';

-- list out all the emp who work for both the dept
-- intersection
SELECT dept1.* FROM dept1
INNER JOIN dept2 
USING (empid);

-- list out all the emp working in dept1 but not in dept2
-- use MINUS
SELECT dept1.* FROM dept1
LEFT JOIN dept2
USING (empid)
WHERE dept2.empid IS NULL;
