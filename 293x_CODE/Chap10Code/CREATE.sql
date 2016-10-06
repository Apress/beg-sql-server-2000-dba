USE master
GO
CREATE DATABASE Southwind
GO

--create table
USE Southwind
GO

CREATE TABLE dbo.Employee (
    EmployeeID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    [Group] VARCHAR(50) NULL,
    EmployeeName VARCHAR(50) NULL
)
GO


--create view
USE Southwind
GO

CREATE VIEW dbo.vEmployee AS
  SELECT EmployeeID, EmployeeName FROM dbo.Employee
GO



--create sproc
USE Southwind
GO


CREATE PROCEDURE dbo.GetEmployees (@EName CHAR(1)) AS
BEGIN
  SELECT EmployeeID, [Group], EmployeeName FROM dbo.Employee
  WHERE EmployeeName LIKE @EName + '%'
END
GO

EXECUTE dbo.GetEmployees 'D'
GO
--We can still get all employees with a clever tactic
EXECUTE dbo.GetEmployees '%'



--create scalar UDF
USE Southwind
GO

CREATE FUNCTION dbo.fnConvertDateToISOStd(@DateToUse DATETIME)
RETURNS CHAR(8)
AS
BEGIN
  RETURN CONVERT(CHAR(8), @DateToUse, 112)
END
GO



--create table UDF
USE Southwind
GO

CREATE FUNCTION dbo.fnTest2()
RETURNS TABLE
AS
  RETURN SELECT EmployeeID, [Group], EmployeeName FROM dbo.Employee
GO








