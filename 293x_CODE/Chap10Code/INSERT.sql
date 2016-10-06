--insert data from other tables
INSERT sales (
stor_id, 
ord_num, 
ord_date, 
qty, 
payterms, 
title_id)

SELECT stores.stor_id, 
       'neworder', 
       GETDATE(),
       55, 
       'net 439',
       titles.title_id
FROM stores, titles
  WHERE stores.stor_name = 'news & brews' 
    AND
        titles.title = 'you can combat computer stress!'






--insert using a sproc: here is the sproc
CREATE PROCEDURE dbo.author_name_city(@state CHAR(2))

AS

SELECT au_lname, au_fname, city FROM authors 
WHERE state = @state


--and here is the INSERT statement
CREATE TABLE #author (
au_lname VARCHAR(50), 
au_fname VARCHAR(50), 
city VARCHAR(50)
)

GO

INSERT #author EXEC author_name_city @state = 'ca'


--inserting dynamic SQL
DECLARE @sql VARCHAR(600)
SELECT @sql = 'DECLARE @state CHAR(2)'
SELECT @sql = @sql + 'SET @state = ''ca'''
SELECT @sql = @sql  + 'SELECT au_lname, au_fname FROM authors 
WHERE state = @state '

INSERT #author (au_lname, au_fname)

EXEC (@sql)

