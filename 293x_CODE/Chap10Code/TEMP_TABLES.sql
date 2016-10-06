CREATE TABLE #temp_table (
last_name VARCHAR(40), 
first_name VARCHAR(40)
)

DECLARE @table_variable TABLE (
last_name VARCHAR(40), 
first_name VARCHAR(40)
)

INSERT #temp_table 
  SELECT TOP 3 au_lname, au_fname FROM authors
  ORDER BY au_lname

INSERT @table_variable
  SELECT TOP 3 au_lname, au_fname FROM authors
  ORDER BY au_lname

SELECT * FROM #temp_table
SELECT * FROM @table_variable

--must explicitly drop the temp table:
DROP TABLE #temp_table
