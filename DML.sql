select * from worker;

-- INSERT used to insert tupple 
-- single line input with (attributes)
INSERT INTO worker ( worker_id, first_name, last_name, 
salary, joining_date, department, worker_age)
VALUE ( 12, 'ram','leela',1500000, '24-07-02', 'HR', 34);

-- multiple line inputs (with attributes)
INSERT INTO worker ( worker_id, first_name, last_name, 
salary, joining_date, department, worker_age)
VALUE ( 11, 'ram2','leela2',1500200, '24-07-02', 'SAP', 34),
( 13, 'ram3','leela3',1504200, '28-07-02', 'SAP', 36);

-- single line or multiple line input without attributes 
-- remember to follow the order of column as specified while creating the table 
INSERT INTO worker 
VALUE ( 16, 'ram4','leela4',500200, '24-07-02', 'SAP', 34),
( 17, 'ram5','leela5',504200, '28-07-02', 'SAP', 36);

-- UPDATE 
-- used to update column's value 
-- single row update
UPDATE worker SET first_name = 'bharat', last_name = 'singh', 
	salary = 450000, department = 'dev', worker_age = '25'
    WHERE worker_id = 17;
    
-- multi row update
SET SQL_SAFE_UPDATES = 0; -- to remove SQL from safe update mode
UPDATE worker SET worker_age = worker_age + 1; 

-- DELETE used to delete rows 
-- single row
DELETE FROM worker WHERE worker_id = 16;

-- delete multiple rows
DELETE FROM worker WHERE worker_id IN (14, 12);

-- delete all rows
SET SQL_SAFE_UPDATE = 0;
DELETE FROM worker;

DELETE FROM worker WHERE worker_id = 1; -- this will throw error as foreign key constraint is failing
-- on delete cascade
-- implemented while creating the table
-- add ON DELETE CASCADE or 
-- ON DELETE SET NULL on foreign key of child table

DELETE FROM worker WHERE worker_id = 1; -- now this will work 	
 
/* ON DELETE NULL - if we delete a parent tuple that has 
corosponding value in child table, it will make the foregin 
key in the child NULL */
 
/* ON DELETE SET CASCADE - if we delete a parent tuple that has 
corosponding value in child table, it will Delete the corrospoding 
uple from child too*/
 
--- REPLACE 
-- note - if data is not present then it will add the data
-- providing PK is very imp 
REPLACE INTO worker (worker_id, last_name, first_name)
VALUES (10 , 'kumar', 'ashish');
 