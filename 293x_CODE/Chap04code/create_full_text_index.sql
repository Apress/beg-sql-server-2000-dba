USE Northwind

EXEC sp_fulltext_database 'enable'
GO


USE Northwind
EXEC sp_fulltext_catalog 'NorthFTCatalog', 'create'
GO


USE Northwind
EXEC sp_fulltext_table 'dbo.Products', 
    'Create', 'NorthFTCatalog', 'PK_Products'
GO


USE Northwind
EXEC sp_fulltext_column 'dbo.Products', 'ProductName', 'add'
GO