SELECT UnitPrice, Quantity FROM [Order Details] 
  WHERE Quantity BETWEEN 10 AND 11 AND UnitPrice > 50

/*
CREATE NONCLUSTERED INDEX ix_orderdetails_productid 
  ON [Order Details](UnitPrice, Quantity)
*/


/*
SELECT UnitPrice, Quantity FROM [Order Details] 
  WHERE Quantity BETWEEN 10 AND 11 AND UnitPrice > 50
*/

/*
DROP INDEX [Order Details].ix_orderdetails_productid
*/