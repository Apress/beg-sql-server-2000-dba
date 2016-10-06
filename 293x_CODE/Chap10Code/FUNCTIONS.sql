-- using the AVG function
USE Northwind
GO

SELECT STR(AVG(OD.Quantity * OD.UnitPrice), 6, 2) FROM Orders O
  INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
WHERE DATEPART(YY, O.OrderDate) = '1997'
GO


-- Creating globally unique values
CREATE TABLE dbo.VIP(
VIPID UNIQUEIDENTIFIER NOT NULL CONSTRAINT DF_VIP_VIPID DEFAULT(NEWID()),
VIPName VARCHAR(50)
)
GO

INSERT INTO dbo.VIP(VIPName)
SELECT 'Melinda' UNION ALL
SELECT 'Letha' UNION ALL
SELECT 'Autrey' UNION ALL
SELECT 'Scott' UNION ALL
SELECT 'Craig' UNION ALL
SELECT 'Shabbir'
GO



-- a scalar UDF
USE Northwind
GO

CREATE FUNCTION dbo.fnConvertToJulianDate(
  @inDate AS DATETIME
)
RETURNS VARCHAR(7)
AS
BEGIN
  RETURN CAST(DATEPART(YY, @inDate) AS CHAR(4)) +
  RIGHT('00' + CAST(DATEPART(DY, @inDate) AS VARCHAR(3)), 3)
END
GO


-- using the scalar UDF
SELECT TOP 5 
  O.OrderID, O.CustomerID, 
  dbo.fnConvertToJulianDate(O.OrderDate) AS OrderDate,
  dbo.fnConvertToJulianDate(O.RequiredDate) AS RequiredDate,
  dbo.fnConvertToJulianDate(O.ShippedDate) AS ShippedDate, 
  STR(SUM(OD.UnitPrice * OD.Quantity), 8, 2) AS Amount
FROM Orders O
  INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY O.ORDERID, O.CustomerID, O.OrderDate, O.RequiredDate, 
         O.ShippedDate
ORDER BY Amount DESC



-- an in-line UDF
Use Northwind
GO

CREATE FUNCTION dbo.fnGetCustInfoByAmount (
  @StartDate DATETIME, 
  @EndDate DATETIME
)
RETURNS TABLE 
AS
RETURN SELECT 
  O.OrderID, O.CustomerID, CONVERT(VARCHAR(12), O.OrderDate, 
                                   101) 
AS 
  OrderDate, 
  CONVERT(VARCHAR(12), O.RequiredDate, 101) AS RequiredDate, 
  CONVERT(VARCHAR(12), O.ShippedDate, 101) AS ShippedDate, 
  STR(SUM(OD.UnitPrice * OD.Quantity), 8, 2) AS Amount
FROM Orders O
  INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
WHERE OrderDate BETWEEN @StartDate AND @EndDate
GROUP BY O.ORDERID, O.CustomerID, O.OrderDate, O.RequiredDate, 
         O.ShippedDate
GO

-- the associated SELECT query
SELECT * FROM dbo.fnGetCustInfoByAmount ('9/30/1997', 
                                         '10/02/1997')
GO



-- a table UDF
CREATE FUNCTION dbo.fnGetCustInfoByAmount2 (
  @StartDate DATETIME, 
  @EndDate DATETIME
)
RETURNS @JustForShow TABLE (
  OrderID INT NOT NULL, 
  CustomerID NCHAR(5) NULL, 
  OrderDate VARCHAR(12) NULL, 
  RequiredDate VARCHAR(12) NULL, 
  ShippedDate VARCHAR(12) NULL, 
  Amount VARCHAR(8) NULL)
AS
  BEGIN
    INSERT INTO @JustForShow (
      OrderID, CustomerID, 
      OrderDate, RequiredDate, ShippedDate, Amount)
    SELECT O.OrderID, O.CustomerID, 
           CONVERT(VARCHAR(12), O.OrderDate, 101) AS OrderDate,
           CONVERT(VARCHAR(12), O.RequiredDate, 101) 
               AS RequiredDate,
           CONVERT(VARCHAR(12), O.ShippedDate, 101) 
               AS ShippedDate, 
           STR(SUM(OD.UnitPrice * OD.Quantity), 8, 2) AS Amount
    FROM Orders O
      INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
    WHERE OrderDate BETWEEN @StartDate AND @EndDate
    GROUP BY O.ORDERID, O.CustomerID, O.OrderDate, 
             O.RequiredDate, O.ShippedDate

    RETURN
  END
GO

--the associated SELECT query
SELECT * FROM dbo.fnGetCustInfoByAmount2 ('9/30/1997', 
                                          '10/02/1997')

GO

