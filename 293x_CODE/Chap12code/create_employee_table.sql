CREATE TABLE [employee] (
[emp_id] char (9) NOT NULL
PRIMARY KEY, 
[FullName] varchar (60) NOT NULL, 
[job_id] smallint NOT NULL, 
[job_lvl] tinyint NULL, 
[pub_id] char (4) NOT NULL, 
[hire_date] datetime NOT NULL )