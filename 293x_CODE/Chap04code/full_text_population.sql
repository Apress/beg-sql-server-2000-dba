--full population
EXEC sp_fulltext_catalog 'NorthFTCatalog', 'start_full'

EXEC sp_fulltext_table 'dbo.Products', 'start_full'


/*
--incremental population
USE Northwind

ALTER TABLE Products
ADD TimeStampCol timestamp

EXEC sp_fulltext_table 'dbo.Products', 'start_full'

UPDATE Products
SET ProductName='Marmite Spread' WHERE ProductID=63

UPDATE Products
SET ProductName='Canterbury Beer' WHERE ProductID=60

EXEC sp_fulltext_table 'dbo.Products','start_incremental'
*/