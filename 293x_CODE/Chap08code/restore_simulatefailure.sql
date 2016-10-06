RESTORE DATABASE SimulateDataFailure
FROM DISK='C:\SimulateDataFailure.BAK'
WITH FILE=1, NORECOVERY
GO

RESTORE LOG SimulateDataFailure
FROM DISK='C:\SimulateDataFailure.BAK'
WITH FILE=2, NORECOVERY
GO

RESTORE LOG SimulateDataFailure
FROM DISK='C:\SimulateDataFailure.BAK'
WITH FILE=3, RECOVERY
GO

USE SimulateDataFailure
GO
SELECT * FROM SimulateDataFailure
GO