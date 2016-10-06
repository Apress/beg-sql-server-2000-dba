--RUN this query:
SELECT sales.* 
FROM sales INNER JOIN titles ON sales.title_id = 
                                titles.title_id
WHERE titles.type = 'business'



--Then run this update, and try the query above again:
UPDATE sales SET payterms = 'COD'
FROM sales INNER JOIN titles ON sales.title_id = 
                                titles.title_id
WHERE titles.type = 'business'




--Next, update payterms column using the CASE statement:
UPDATE sales
SET 
payterms = CASE WHEN titles.type = 'business' THEN 'cod'
                WHEN titles.type = 'mod_cook' THEN 'net 30'
                WHEN titles.type = 'popular_comp' THEN 'net 40'
                WHEN titles.type = 'trad_cook' THEN 'net 35'
                WHEN titles.type = 'psychology' THEN 'net 0'
                ELSE 'CASH'
           END
FROM sales 
  INNER JOIN titles ON sales.title_id = titles.title_id


--This UPDATE adds a running total of titles sold so far column
ALTER TABLE sales ADD sold_so_far INT NULL
GO

UPDATE sales 
SET sold_so_far = (
  SELECT COUNT(*) FROM sales s2 WHERE s2.title_id = 
                                      sales.title_id)
