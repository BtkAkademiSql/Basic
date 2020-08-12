/*
-CTE tabloları bir kere SELECT yaptıktan sonra tekrar SELECT yapamazsın tek seferlik çalışırlar

WITH CteName (ColumnNames)
AS
( CteQuery )
SELECT * FROM CteName [Join]

WITH CteName (ColumnNames) AS(CteQuery)
,Cte2Name (ColumnNames) AS (CteQuery2)
,... şeklinde birden çok cte oluşturulabilir
SELECT * FROM CteName [Join] CteQuery2 [Join..]

*/

CREATE TABLE City
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[C1] [varchar](50) NULL,
	CONSTRAINT PK_RootTable PRIMARY KEY CLUSTERED (Id ASC) 
)
CREATE TABLE Town
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[C1] [varchar](50) NULL,
	[RootRef] [int] NULL,
	CONSTRAINT [PK_ChildTable] PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT [FK_ChildTable_RootTable] FOREIGN KEY (RootRef) REFERENCES City(Id)
)
DECLARE @CityRef int
INSERT INTO City VALUES('İstanbul')
SET @CityRef=SCOPE_IDENTITY()
INSERT INTO Town VALUES('Kağıthane',@CityRef),('Mecidiyeköy',@CityRef)
INSERT INTO City VALUES('İlçesiz')
INSERT INTO City VALUES('Ankara')
SET @CityRef=SCOPE_IDENTITY()
INSERT INTO Town VALUES('Beypazarı',@CityRef),('Çamlıdere',@CityRef),('Polatlı',@CityRef),('İlsiz',NULL)

GO
WITH CityAndTownName(CityName,TownName)
AS
(
	SELECT C.C1 ,T.C1  FROM City C INNER JOIN Town T ON C.Id=T.RootRef
	UNION ALL
	SELECT 'Olmayan il','Olmayan ilçe'
)
SELECT * FROM CityAndTownName

GO
WITH CityAndTownName(CityName,TownName)
AS
(
	SELECT C.C1 ,T.C1  FROM City C INNER JOIN Town T ON C.Id=T.RootRef
	UNION ALL
	SELECT 'Olmayan il','Olmayan ilçe'
),Cte2 (CName,TName)
AS
(SELECT 'Olmayan il2','Olmayan ilçe2')
SELECT * FROM CityAndTownName
UNION ALL
SELECT * FROM Cte2

DROP TABLE Town
DROP TABLE City

