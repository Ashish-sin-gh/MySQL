USE org;
select * from worker;

-- ADD used to add column to a table 
ALTER TABLE worker ADD age INT DEFAULT 0;

-- MODIFY used to change DataType of a column
ALTER TABLE worker MODIFY age INT; -- assume age is not in INT initially 


-- DESC table_name - it describe all the property in a the table 
-- not an alter operation   
DESC worker;

-- CHANGE COLUMN - rename the column
ALTER TABLE worker CHANGE COLUMN age user_age INT;

-- DROP COLUMN - delete a column form a table 
ALTER TABLE worker DROP COLUMN user_age;
SELECT * FROM worker;

-- RENAME use to chnage the name of a table
ALTER TABLE worker RENAME TO worker_tab;

ALTER TABLE worker_tab RENAME TO worker;
SELECT * FROM worker;  
SELECT * FROM worker_tab; -- error as it is no more the table name

-- question

-- add a new column age with NOT NULL and condition  being greater than 18
ALTER TABLE worker ADD age INT NOT NULL  DEFAULT 19;
ALTER TABLE worker ADD CONSTRAINT age_check_constraint CHECK (age > 18);

-- now rename the column age to worker_age
ALTER TABLE worker DROP CONSTRAINT age_check_constraint;
DESC worker;
ALTER TABLE worker CHANGE COLUMN age worker_age INT NOT NULL DEFAULT 19;
ALTER TABLE worker ADD CONSTRAINT check_age CHECK (worker_age > 18);

ALTER TABLE worker DROP COLUMN age;  



