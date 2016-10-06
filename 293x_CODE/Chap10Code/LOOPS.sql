--Running a WHILE loop
SET NOCOUNT ON 
DECLARE @counter TINYINT

SET @counter = 0

WHILE @counter < 10
  BEGIN
    SELECT TOP 1 au_lname FROM authors
    WHERE au_id LIKE '%' + CAST(@counter AS VARCHAR) + '%'
    SET @counter = @counter + 1
  END


-- same as above, but with a BREAK
SET NOCOUNT ON 
DECLARE @counter TINYINT

SET @counter = 0

WHILE @counter < 10
  BEGIN
    SELECT TOP 1 au_lname FROM authors
    WHERE au_id LIKE '%' + CAST(@counter AS VARCHAR) + '%'

    SET @counter = @counter + 1

    IF @counter > 2 
      BEGIN
        BREAK
      END
  END



--Nested WHILE loop
SET NOCOUNT ON
DECLARE @counter TINYINT

SET @counter = 0

WHILE @counter < 10
  BEGIN
    SELECT TOP 1 au_lname FROM authors
    WHERE au_id LIKE '%' + CAST(@counter AS VARCHAR) + '%'
    SET @counter = @counter + 1

    WHILE @counter = 2 
      BEGIN
        PRINT 'now breaking!'
        BREAK
      END

    IF @counter = 2
      BEGIN
        PRINT 'now continuing!'
        CONTINUE
      END
  END



-- Using a GOTO
DECLARE @counter TINYINT

SET @counter = 0

WHILE @counter < 10
  BEGIN
    SELECT TOP 1 au_lname FROM authors
       WHERE au_id LIKE '%' + CAST(@counter AS VARCHAR) + '%'
    SET @counter = @counter + 1
    WHILE @counter > 2 
      BEGIN
        BREAK
      END

    IF @counter > 1
      BEGIN
        GOTO my_label
      END
  END

my_label: 

SELECT 'The processing continues here!'




-- Using GOTO to centralize error handling:
BEGIN TRANSACTION 

UPDATE authors SET au_lname = 'Ringer' 
WHERE au_lname = 'Whiter'

IF @@ERROR <> 0
  BEGIN
    GOTO error_handler
  END

UPDATE titles SET title = 'new title' 
WHERE title = 'old title'

IF @@ERROR <> 0
  BEGIN
    GOTO error_handler
  END

COMMIT TRANSACTION

error_handler: 
IF @@ERROR <>0
  BEGIN
    RAISERROR('An error occurred, rolling back', 16, 1)
    ROLLBACK TRANSACTION
  END

