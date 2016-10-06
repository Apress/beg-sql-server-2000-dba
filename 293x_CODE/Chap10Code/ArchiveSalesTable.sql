/* create the history table */
CREATE TABLE sales_history (
stor_id INT, 
ord_num VARCHAR(15), 
ord_date SMALLDATETIME, 
qty INT, 
payterms VARCHAR(20), 
title_id VARCHAR(10)
)

GO

/* enclose all data modification statements in a transaction
** just in case we encounter errors 
*/

BEGIN TRANSACTION 

/* populate history table first: */

  INSERT sales_history (
  stor_id, 
  ord_num, 
  ord_date, 
  qty, 
  payterms, 
  title_id
  )

  SELECT 
    stor_id, 
    ord_num, 
    ord_date, 
    qty, 
    payterms, 
    title_id
  FROM sales
  WHERE
    DATEDIFF(YEAR, ord_date, GETDATE()) > = 2

/* handle any errors: */
IF @@ERROR <> 0
  BEGIN
    RAISERROR('error while populating history table', 16, 1)
    ROLLBACK TRANSACTION
    RETURN
  END

/* now that we have a copy
** get rid of the old records: 
*/

DELETE sales
  WHERE DATEDIFF(YEAR, ord_date, GETDATE()) > = 2

IF @@ERROR <> 0
  BEGIN
    RAISERROR('error while deleting old records', 16, 1)
    ROLLBACK TRANSACTION
    RETURN
  END

/* commit transaction if no errors: */
COMMIT TRANSACTION
