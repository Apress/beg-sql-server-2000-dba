--restores initial DB
RESTORE DATABASE Northwind FROM 
DISK='C:\Program Files\Microsoft SQL Server\MSSQL\Backup\Northwind backup.bak'
WITH NORECOVERY, REPLACE, FILE=1
GO

--restores differential
RESTORE DATABASE Northwind FROM 
DISK='C:\Program Files\Microsoft SQL Server\MSSQL\Backup\Northwind backup.bak'
WITH RECOVERY, FILE=4
GO

--checks the data
USE Northwind
GO
SELECT CustomerID, CompanyName, ContactName
FROM Customers
WHERE CustomerID LIKE 'TBA%'
