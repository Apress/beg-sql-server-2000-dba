use Test3

CREATE TABLE Table2
(
       IDCol int identity(1,1) PRIMARY KEY,
       Table1_IDCol int NULL,
       VarCharCol varchar(255) NOT NULL,
)
GO


CREATE DATABASE TestDB1
CREATE TABLE Table1
(
       IDCol int identity(1,1) PRIMARY KEY,
       Table1_IDCol int NULL,
       VarCharCol varchar(255) NOT NULL,
       DateCol datetime NOT NULL,
       MoneyCol money NULL
)

CREATE TABLE Table2
(
       IDCol int identity(1,1) PRIMARY KEY,
       Table1_IDCol int NULL,
       VarCharCol varchar(255) NOT NULL
)
GO