--drop sproc
USE Southwind
GO

DROP PROCEDURE dbo.GetEmployees



--Multiple objects of same type can be dropped using the following syntax:
DROP PROCEDURE sp1, sp2, sp3


--drop view, table, & database
--dropping does not have to be done in reverse order of creation,
--but it is recommended as this helps avoid orphaned objects.
DROP VIEW dbo.vEmployee

DROP TABLE dbo.Employee

--note - we must leave the context of the Southwind DB before we can drop it.
USE master
GO

DROP DATABASE Southwind
GO
