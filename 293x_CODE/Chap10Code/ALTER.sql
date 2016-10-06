--alter Employee table
USE Southwind
GO

ALTER TABLE dbo.Employee
  ADD StartDate DATETIME NULL
GO



--alter view
ALTER VIEW dbo.vEmployee
AS
SELECT EmployeeID, EmployeeName, StartDate FROM dbo.Employee
GO




--alter sproc
ALTER PROCEDURE dbo.GetEmployees
AS
BEGIN
  SELECT EmployeeID, [Group], EmployeeName, StartDate FROM dbo.Employee
END
GO
