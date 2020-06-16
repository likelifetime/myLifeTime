PRINT 'ANNA - ������� ��� �� ���������� �������'
GO

USE ANNA
GO

PRINT 'dictionry - dic - ����������, ���������� �� ���������� ������, �������� ���������� ���� ��� �����'
GO

PRINT 'dic.vDay - ����������� ����'
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
