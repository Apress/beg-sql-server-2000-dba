-- declare local variable 
-- to determine weekday number:
DECLARE @day INT

SELECT @day = DATEPART(DAY, GETDATE())

IF @day = 1
  BEGIN
    SELECT * FROM authors WHERE state = 'ca'
  END
ELSE
  BEGIN
    -- nested IF logic:
    IF @day = 2
      BEGIN
        SELECT * FROM authors WHERE state = 'tn'
      END
    ELSE
      BEGIN
        SELECT * FROM authors WHERE state = 'or'
      END
  END


-- As above, but using CASE:
-- delcare local variable 
-- to determine weekday number:
DECLARE @day INT

SELECT @day = DATEPART(DAY, GETDATE())

SELECT * FROM authors
WHERE 
  state = CASE 
    WHEN @day = 1 THEN 'ca'
    WHEN @day = 2 THEN 'tn'
    ELSE 'or'
  END



-- checking for authors from Texas:
IF NOT ((SELECT COUNT(*) FROM authors WHERE state = 'tx') > 0)
  BEGIN
    PRINT 'There are no authors from Texas'
  END

-- similar to above, using EXISTS:
IF EXISTS (SELECT * FROM authors WHERE state = 'tx')
  BEGIN
    PRINT 'There ARE authors from Texas'
  END


-- Using CASE to replace results with custom data:
SELECT DISTINCT state = CASE 
           WHEN state = 'ca' THEN 'California'
           WHEN state = 'tn' THEN 'Tennessee'
           WHEN state = 'or' THEN 'Oregon'
           ELSE state
         END
FROM authors




-- Using CASE to customize return result based on day of the week:
SELECT greeting = 
  CASE WHEN DATEPART(HOUR, GETDATE()) < 12
         THEN 'Good ' + DATENAME(WEEKDAY, GETDATE()) + 
' Morning!'
       WHEN DATEPART(HOUR, GETDATE()) BETWEEN 12 AND 17
         THEN 'Good ' + DATENAME(WEEKDAY, GETDATE()) + 
' Afternoon!'
       WHEN DATEPART(HOUR, GETDATE()) BETWEEN 18 AND 22
         THEN 'Good ' + DATENAME(WEEKDAY, GETDATE())  + 
' Evening!'
       ELSE
         'Good ' + DATENAME(WEEKDAY, GETDATE()) + ' Night!'
  END




