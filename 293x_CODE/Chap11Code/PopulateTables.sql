SET NOCOUNT ON 

INSERT customer (customer_name)
SELECT 'john doe'

INSERT customer (customer_name)
SELECT 'jane doe'

INSERT customer (customer_name)
SELECT 'bubba smith'

INSERT customer (customer_name)
SELECT 'john smith'

INSERT customer (customer_name)
SELECT 'tabiry karesi'

INSERT store (store_name_and_address)
SELECT 'store 1 on Wilson street'

INSERT store (store_name_and_address)
SELECT 'store 2 on Market street'

INSERT store (store_name_and_address)
SELECT 'store 3 on East Main street'

INSERT store (store_name_and_address)
SELECT 'store 4 on Belmont Avenue'

INSERT zip_code
SELECT '37013'

INSERT zip_code
SELECT '42101'

INSERT zip_code
SELECT '53516'

INSERT zip_code
SELECT '25135'

INSERT product 
SELECT 'chocolate'

INSERT product 
SELECT 'cranberry sause'

INSERT product 
SELECT 'turkey'

INSERT product 
SELECT 'pumkin pie'

INSERT age_range 
SELECT '20 - 25'

INSERT age_range 
SELECT '26 - 35'

INSERT age_range 
SELECT '36 - 45'

INSERT age_range 
SELECT '46 - 55'


DECLARE @time SMALLDATETIME

SELECT @time = '1/1/2002'

WHILE @time < = '1/1/2003'
BEGIN

INSERT time (date_and_time)
SELECT @time

SELECT @time = DATEADD(DAY, 1, @time)

END

DECLARE
 	@customer_key INT, 
	@age_range_key INT, 
	@product_key INT, 
	@zip_code_key INT, 
	@store_key INT, 
	@time_key	INT, 
	@sales_amount	INT

 SELECT @customer_key= 1, 
 	@age_range_key = 1, 
 	@zip_code_key = 1, 
 	@sales_amount = 2


	DECLARE store_cursor CURSOR FOR
	SELECT TOP 2 store_key FROM store
	
	
	OPEN store_cursor 
	FETCH NEXT FROM store_cursor INTO @store_key
	
	WHILE @@FETCH_STATUS = 0
	
	BEGIN

		DECLARE product_cursor CURSOR 
		FOR SELECT product_key FROM product
	
		OPEN product_cursor 
		FETCH NEXT FROM product_cursor INTO @product_key
	
		WHILE @@FETCH_STATUS = 0
		BEGIN


			DECLARE time_cursor CURSOR FOR 
			SELECT TOP 50 time_key FROM time ORDER BY time_key DESC
			OPEN time_cursor 
	
			FETCH NEXT FROM time_cursor INTO @time_key
	
			WHILE @@FETCH_STATUS = 0
	
			BEGIN

				INSERT sales_fact (
					customer_key, 
					age_range_key, 
					product_key, 
					zip_code_key, 
					store_key, 
					time_key, 
					sales_amount)
			
				SELECT 
					@customer_key, 
					@age_range_key, 
					@product_key, 
					@zip_code_key, 
					@store_key, 
					@time_key, 
					@sales_amount
SELECT @sales_amount = @sales_amount + 1
			FETCH NEXT FROM time_cursor INTO @time_key
			END
			CLOSE time_cursor 
			DEALLOCATE time_cursor

		FETCH NEXT FROM product_cursor INTO @product_key
		END
		CLOSE product_cursor
		DEALLOCATE product_cursor

	FETCH NEXT FROM store_cursor INTO @store_key
	END
	CLOSE store_cursor
	DEALLOCATE store_cursor


 SELECT @customer_key= 2, 
 	@age_range_key = 2, 
 	@zip_code_key = 2, 
 	@sales_amount = 25


	DECLARE store_cursor CURSOR FOR
	SELECT TOP 2 store_key FROM store ORDER BY store_key DESC
	
	
	OPEN store_cursor 
	FETCH NEXT FROM store_cursor INTO @store_key
	
	WHILE @@FETCH_STATUS = 0
	
	BEGIN

		DECLARE product_cursor CURSOR 
		FOR SELECT product_key FROM product
	
		OPEN product_cursor 
		FETCH NEXT FROM product_cursor INTO @product_key
	
		WHILE @@FETCH_STATUS = 0
		BEGIN


			DECLARE time_cursor CURSOR FOR 
			SELECT TOP 50 time_key FROM time ORDER BY time_key DESC
			OPEN time_cursor 
	
			FETCH NEXT FROM time_cursor INTO @time_key
	
			WHILE @@FETCH_STATUS = 0
	
			BEGIN

				INSERT sales_fact (
					customer_key, 
					age_range_key, 
					product_key, 
					zip_code_key, 
					store_key, 
					time_key, 
					sales_amount)
			
				SELECT 
					@customer_key, 
					@age_range_key, 
					@product_key, 
					@zip_code_key, 
					@store_key, 
					@time_key, 
					@sales_amount
SELECT @sales_amount = @sales_amount + 1
			FETCH NEXT FROM time_cursor INTO @time_key
			END
			CLOSE time_cursor 
			DEALLOCATE time_cursor

		FETCH NEXT FROM product_cursor INTO @product_key
		END
		CLOSE product_cursor
		DEALLOCATE product_cursor

	FETCH NEXT FROM store_cursor INTO @store_key
	END
	CLOSE store_cursor
	DEALLOCATE store_cursor


 SELECT @customer_key= 3, 
 	@age_range_key = 3, 
 	@zip_code_key = 3, 
 	@sales_amount = 15


	DECLARE store_cursor CURSOR FOR
	SELECT TOP 1 store_key FROM store
	
	
	OPEN store_cursor 
	FETCH NEXT FROM store_cursor INTO @store_key
	
	WHILE @@FETCH_STATUS = 0
	
	BEGIN

		DECLARE product_cursor CURSOR 
		FOR SELECT product_key FROM product
	
		OPEN product_cursor 
		FETCH NEXT FROM product_cursor INTO @product_key
	
		WHILE @@FETCH_STATUS = 0
		BEGIN


			DECLARE time_cursor CURSOR FOR 
			SELECT TOP 50 time_key FROM time ORDER BY time_key DESC
			OPEN time_cursor 
	
			FETCH NEXT FROM time_cursor INTO @time_key
	
			WHILE @@FETCH_STATUS = 0
	
			BEGIN

				INSERT sales_fact (
					customer_key, 
					age_range_key, 
					product_key, 
					zip_code_key, 
					store_key, 
					time_key, 
					sales_amount)
			
				SELECT 
					@customer_key, 
					@age_range_key, 
					@product_key, 
					@zip_code_key, 
					@store_key, 
					@time_key, 
					@sales_amount
SELECT @sales_amount = @sales_amount + 1
			FETCH NEXT FROM time_cursor INTO @time_key
			END
			CLOSE time_cursor 
			DEALLOCATE time_cursor

		FETCH NEXT FROM product_cursor INTO @product_key
		END
		CLOSE product_cursor
		DEALLOCATE product_cursor

	FETCH NEXT FROM store_cursor INTO @store_key
	END
	CLOSE store_cursor
	DEALLOCATE store_cursor


 SELECT @customer_key= 4, 
 	@age_range_key = 4, 
 	@zip_code_key = 4, 
 	@sales_amount = 5


	DECLARE store_cursor CURSOR FOR
	SELECT store_key FROM store
	
	
	OPEN store_cursor 
	FETCH NEXT FROM store_cursor INTO @store_key
	
	WHILE @@FETCH_STATUS = 0
	
	BEGIN

		DECLARE product_cursor CURSOR 
		FOR SELECT product_key FROM product
	
		OPEN product_cursor 
		FETCH NEXT FROM product_cursor INTO @product_key
	
		WHILE @@FETCH_STATUS = 0
		BEGIN


			DECLARE time_cursor CURSOR FOR 
			SELECT TOP 50 time_key FROM time ORDER BY time_key DESC
			OPEN time_cursor 
	
			FETCH NEXT FROM time_cursor INTO @time_key
	
			WHILE @@FETCH_STATUS = 0
	
			BEGIN

				INSERT sales_fact (
					customer_key, 
					age_range_key, 
					product_key, 
					zip_code_key, 
					store_key, 
					time_key, 
					sales_amount)
			
				SELECT 
					@customer_key, 
					@age_range_key, 
					@product_key, 
					@zip_code_key, 
					@store_key, 
					@time_key, 
					@sales_amount
SELECT @sales_amount = @sales_amount + 1
			FETCH NEXT FROM time_cursor INTO @time_key
			END
			CLOSE time_cursor 
			DEALLOCATE time_cursor

		FETCH NEXT FROM product_cursor INTO @product_key
		END
		CLOSE product_cursor
		DEALLOCATE product_cursor

	FETCH NEXT FROM store_cursor INTO @store_key
	END
	CLOSE store_cursor
	DEALLOCATE store_cursor
