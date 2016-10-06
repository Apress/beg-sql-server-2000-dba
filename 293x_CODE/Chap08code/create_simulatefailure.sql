CREATE DATABASE SimulateDataFailure

ALTER DATABASE SimulateDataFailure SET RECOVERY FULL
GO


USE SimulateDataFailure
GO
CREATE TABLE SimulateDataFailure
(
   IdCol   INT   PRIMARY KEY,
   DateCol DATETIME DEFAULT(GETDATE())
)
GO

INSERT SimulateDataFailure(IdCol) VALUES(1)
INSERT SimulateDataFailure(IdCol) VALUES(2)
INSERT SimulateDataFailure(IdCol) VALUES(3)
GO


BACKUP DATABASE SimulateDataFailure 
TO DISK='C:\SimulateDataFailure.BAK'
WITH INIT
GO


INSERT SimulateDataFailure(IdCol) VALUES(4)
INSERT SimulateDataFailure(IdCol) VALUES(5)
INSERT SimulateDataFailure(IdCol) VALUES(6)
GO

BACKUP LOG SimulateDataFailure 
TO DISK='C:\SimulateDataFailure.BAK'
WITH NOINIT
GO


INSERT SimulateDataFailure(IdCol) VALUES(7)
INSERT SimulateDataFailure(IdCol) VALUES(8)
INSERT SimulateDataFailure(IdCol) VALUES(9)
GO

BACKUP LOG SimulateDataFailure 
TO DISK='C:\SimulateDataFailure.BAK' 
WITH NOINIT, NO_TRUNCATE
GO

DROP DATABASE SimulateDataFailure
GO