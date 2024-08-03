USE org;

select * from worker;

-- create a view table from emp table 
CREATE VIEW worker_view 
AS SELECT first_name, salary FROM worker; 

-- diplay a view 
SELECT * FROM  worker_view;