USE Northwind
GO

INSERT dbo.Customers(CustomerID, CompanyName, 
                     ContactName, City, Country)
VALUES('TBASB','Tony Bain & Associates', 
       'Stephanie Bain','Christchurch', 'New Zealand')

INSERT dbo.Customers(CustomerID, CompanyName, 
                     ContactName, City, Country)
VALUES('TBAWB','Tony Bain & Associates', 
       'William Bain', 'Christchurch', 'New Zealand')
GO


BACKUP LOG Northwind
TO DISK='C:\Program Files\Microsoft SQL Server\MSSQL\Backup\Northwind backup.bak'
WITH NOINIT
