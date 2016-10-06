CREATE DATABASE Southwind
GO

RESTORE FILELISTONLY
FROM DISK='C:\Program Files\Microsoft SQL Server\MSSQL\BACKUP\Northwind backup.bak'
GO

RESTORE DATABASE Southwind 
FROM DISK='C:\Program Files\Microsoft SQL Server\MSSQL\BACKUP\Northwind backup.bak'
WITH MOVE 'Northwind' 
   TO 'C:\Program Files\Microsoft SQL Server\MSSQL\data\Southwind.mdf',
MOVE 'Northwind_log' 
   TO 'C:\Program Files\Microsoft SQL Server\MSSQL\data\Southwind.ldf',
REPLACE
GO