RESTORE LOG Northwind FROM 
DISK='C:\Program Files\Microsoft SQL Server\MSSQL\Backup\Northwind backup.bak'
WITH RECOVERY, FILE=3
GO


USE Northwind
GO
SELECT CustomerID, CompanyName, ContactName
FROM Customers
WHERE CustomerID LIKE 'TBA%'
