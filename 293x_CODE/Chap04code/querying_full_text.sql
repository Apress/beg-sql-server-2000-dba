--full-text query
SELECT * FROM Products
  WHERE CONTAINS(ProductName, '"Syrup" OR "Cran*"')

--full-text query returned in a table
SELECT * FROM Products
  WHERE CONTAINSTABLE(ProductName, '"Syrup" OR "Cran*"')

--freetext
SELECT * FROM Products
  WHERE FREETEXT(ProductName,'Syrup Sauce')

--freetext table
SELECT * FROM Products
  WHERE FREETEXTTABLE(ProductName,'Syrup Sauce')