USE Northwind

SELECT Food_ID, Food_Name FROM Food_Table
  WHERE Food_ID>1 AND (Food_Name='Steak' OR Food_Name='Milk')

/*
SELECT CustomerID, ContactName, City, PostalCode, Country
  FROM Customers 
    WHERE City='London' OR (Country='Germany' AND PostalCode='80805')
*/