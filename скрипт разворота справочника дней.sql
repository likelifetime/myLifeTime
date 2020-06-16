PRINT 'ANNA - система для не серьезного анализа'
GO

USE ANNA
GO

PRINT 'dictionry - dic - подсистема, отвечающая за справочные данные, например справочник дней или стран'
GO

PRINT 'dic.vDay - справчосник дней'
GO

DROP VIEW IF EXISTS dic.vDay
GO

DROP TABLE IF EXISTS zod.tDay
GO

CREATE TABLE zod.tDay
(
     id DATE NOT NULL
	 ,yearNum INTEGER NOT NULL
	 ,monthNum INTEGER NOT NULL
)
GO


CREATE OR ALTER VIEW zod.vProfession
WITH SCHEMABINDING
AS
SELECT
    prof.id
   ,prof.name
FROM zod.tProfession AS prof
GO




SELECT 
SELECT GETDATE()
