USE Northwind

SELECT CustomerID, ContactName, City, PostalCode, Country
  FROM Customers WHERE City LIKE 'L%'

/*
SELECT CustomerID, ContactName, City, PostalCode, Country
  FROM Customers WHERE City LIKE '[ABC]%'
*/


/*
SELECT CustomerID, ContactName, City, PostalCode, Country
  FROM Customers WHERE City LIKE '[A-C]%'

*/


/*
SELECT CustomerID, ContactName, City, PostalCode, Country
  FROM Customers WHERE City LIKE '[^ABC]%'

*/


/*
SELECT CustomerID, ContactName, City, PostalCode, Country
  FROM Customers WHERE City LIKE '_[a]%'

*/