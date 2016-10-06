-- an example of error handling in action:
SELECT CAST('23/34/20' AS SMALLDATETIME)

IF @@ERROR <> 0
  BEGIN
    RAISERROR('An error occurred', 16, 1)
  END


-- Logging an entry in the error log using xp_logevent:
RAISERROR('ouch', 16, 1) WITH  SETERROR

IF @@ERROR <> 0
  BEGIN
    EXEC master..xp_logevent 50002, 
         'An error of type warning has been encountered', 
         WARNING
  END
