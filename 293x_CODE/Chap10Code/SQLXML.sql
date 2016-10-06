--Using the FOR AUTO XML mode:
SELECT TOP 2 * FROM customers FOR XML AUTO, ELEMENTS


--AUTO and a multi-table query:
SELECT TOP 2 
  Orders.OrderDate, 
  Orders.ShipCity, 
  Customers.CompanyName, 
  Customers.Country 
FROM orders INNER JOIN customers ON
  orders.customerid = customers.customerid
FOR XML AUTO



--Changing the nesting in a multi-table query:
SELECT TOP 2 
  Customers.CompanyName, 
  Customers.Country, 
  Orders.OrderDate, 
  Orders.ShipCity
FROM Orders INNER JOIN Customers ON
  orders.customerid = customers.customerid
FOR XML AUTO




--Using FOR XML RAW:
SELECT TOP 2 
  Customers.CompanyName, 
  Customers.Country, 
  Orders.OrderDate, 
  Orders.ShipCity
FROM Orders INNER JOIN Customers ON
  orders.customerid = customers.customerid
FOR XML RAW



--Using FOR XML EXPLICIT:
USE pubs

SELECT 1 AS TAG, NULL AS PARENT, 
authors.au_fname       	AS   [author!1!au_fname], 
authors.au_lname       	AS   [author!1!au_lname],
NULL             	AS   [titleauthor!2!royaltyper], 
NULL             	AS   [titles!3!title]
FROM 
authors WHERE au_lname = 'green'

UNION ALL 

SELECT 2 AS TAG, 1 AS PARENT, 
au_fname, 
au_lname,
royaltyper,
NULL
FROM authors INNER JOIN titleauthor ON 
authors.au_id= titleauthor.au_id
WHERE au_lname ='green'

UNION ALL

SELECT 3 AS TAG, 2 AS PARENT, 
au_fname, 
au_lname,
royaltyper, 
title
FROM authors INNER JOIN titleauthor ON authors.au_id = 
                                       titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
WHERE au_lname ='green'
ORDER BY [author!1!au_fname], [author!1!au_lname], 
         [titleauthor!2!royaltyper]
FOR XML EXPLICIT




--Using OPENXML:
USE PUBS
DECLARE @xml_text VARCHAR(4000), @i INT

SELECT @xml_text = '
<root>
<authors    au_id="172-32-1176" 
        au_lname="White" 
        au_fname="Johnson" 
        phone="408 496-7223" 
        address="10932 Bigge Rd." 
        city="Menlo Park" 
        state="CA" 
        zip="94025" 
        contract="1"/>
<authors    au_id="213-46-8915" 
        au_lname="Green" 
        au_fname="Marjorie" 
        phone="415 986-7020" 
        address="309 63rd St. #411" 
        city="Oakland" 
        state="CA" 
        zip="94618" 
        contract="1"/>
</root>'

EXEC sp_xml_preparedocument @i OUTPUT, @xml_text

SELECT * FROM 
    OPENXML(@i, '/root/authors') 
WITH (
           au_id     VARCHAR(11), 
           au_lname    VARCHAR(20), 
           au_fname    VARCHAR(30), 
           phone     VARCHAR(12), 
           address    VARCHAR(50), 
           city      VARCHAR(20), 
           state     CHAR(2), 
           zip      CHAR(5), 
           contract    BIT)

EXEC sp_xml_removedocument @i

