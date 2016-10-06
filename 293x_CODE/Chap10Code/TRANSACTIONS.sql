
-- Example showing a transaction in action:
Use Northwind

BEGIN TRANSACTION

SELECT UnitPrice, * FROM Products WHERE ProductID = 3

UPDATE Products SET UnitPrice = UnitPrice * 1.05 WHERE ProductID = 3

SELECT UnitPrice, * FROM Products WHERE ProductID = 3

ROLLBACK TRANSACTION

SELECT UnitPrice, * FROM Products WHERE ProductID = 3







