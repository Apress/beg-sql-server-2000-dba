--using JOIN
SELECT authors.au_lname, authors.au_fname, titles.title, 
titles.price
FROM dbo.authors
  INNER JOIN dbo.titleauthor ON authors.au_id = 
titleauthor.au_id
  INNER JOIN dbo.titles ON titleauthor.title_id = 
titles.title_id
ORDER BY authors.au_lname, authors.au_fname



--as above but using aliases
SELECT a.au_lname, a.au_fname, t.title, t.price
FROM dbo.authors a
  INNER JOIN dbo.titleauthor ta on a.au_id = ta.au_id
  INNER JOIN dbo.titles t on ta.title_id = t.title_id
ORDER BY a.au_lname, a.au_fname



--GROUP BY
SELECT a.au_lname, a.au_fname, SUM(t.price) AS TotalPrice
FROM dbo.authors a
  INNER JOIN dbo.titleauthor ta on a.au_id = ta.au_id
  INNER JOIN dbo.titles t on ta.title_id = t.title_id
GROUP BY a.au_lname, a.au_fname
ORDER BY a.au_lname, a.au_fname



--Ordering authors by title price
SELECT a.au_lname, a.au_fname, t.title, t.price
FROM dbo.authors a
  INNER JOIN dbo.titleauthor ta on a.au_id = ta.au_id
  INNER JOIN dbo.titles t on ta.title_id = t.title_id
ORDER BY t.price DESC


--As above but using TOP statement
SELECT TOP 10 a.au_lname, a.au_fname, t.title, t.price
FROM dbo.authors a
  INNER JOIN dbo.titleauthor ta on a.au_id = ta.au_id
  INNER JOIN dbo.titles t on ta.title_id = t.title_id
ORDER BY t.price DESC


