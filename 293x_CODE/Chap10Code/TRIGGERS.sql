--create an audit table to track when some territories are inserted or deleted:
CREATE TABLE triggertest(
TestID INT NOT NULL IDENTITY(1, 1) Primary Key, 
TestDate DATETIME NOT NULL DEFAULT(GETDATE()), 
TestData VARCHAR(256) NOT NULL
)
GO

--then create the INSERT trigger:
CREATE TRIGGER trInsTerritories ON dbo.Territories
FOR INSERT
AS
INSERT INTO dbo.triggertest(TestData)
SELECT 'New Territory added: ' + TerritoryDescription
FROM INSERTED
GO

--and then the DELETE trigger:
CREATE TRIGGER trDelTerritories ON dbo.Territories
FOR DELETE
AS
INSERT INTO dbo.triggertest(TestData)
SELECT 'New Territory removed: ' + TerritoryDescription
FROM DELETED
GO

--now, we'll INSERT a few territories:
INSERT INTO Territories(TerritoryID, TerritoryDescription, 
                        RegionID)
VALUES(11111, 'TestTerritory1', 4)
INSERT INTO Territories(TerritoryID, TerritoryDescription, 
                        RegionID)
VALUES(22222, 'TestTerritory2', 4)
GO

--and then DELETE them:
DELETE FROM Territories
WHERE TerritoryDescription LIKE 'TestTerritory%'
GO

--now, let's look at our triggertest table: 
SELECT * FROM triggertest
GO