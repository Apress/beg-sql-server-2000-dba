RESTORE DATABASE Northwind2
FROM DISK = 'C:\Program Files\Microsoft SQL Server
             \MSSQL\BACKUP\Northwind.bak'
WITH
  MOVE 'Northwind_log' TO 'C:\Program Files\
        Microsoft SQL Server\MSSQL\data\Northwind2_log.ldf',
  MOVE 'Northwind' TO 'C:\Program Files\
        Microsoft SQL Server\MSSQL\data\Northwind2.mdf'
