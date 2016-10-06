/* turn off messages of how many rows are returned */
SET NOCOUNT ON 

-- declare local variables for further processing: 
DECLARE @last_name VARCHAR(40), 
        @first_name VARCHAR(40)

--declare the cursor with a SELECT statement
DECLARE author_cursor CURSOR FOR
  SELECT au_lname, au_fname FROM authors

-- open cursor
OPEN author_cursor
-- attempt to fetch a row from a cursor
FETCH NEXT FROM author_cursor INTO @last_name, @first_name

/* initialize a WHILE loop for successful fetches*/
WHILE @@FETCH_STATUS = 0
BEGIN
  -- do some processing:
  SELECT 'Current author is ' + @first_name + ' ' + @last_name

  -- go to the next row: 
  FETCH NEXT FROM author_cursor INTO @last_name, @first_name
END

-- close and deallocate the cursor
CLOSE author_cursor
DEALLOCATE author_cursor
