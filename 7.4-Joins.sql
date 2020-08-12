/*
A ve B kümesinin; 
JOIN
	-INNER kesişimini getirir
OUTER
	-LEFT A kümesini ve kesişimini
	-RIGHT B kümesini ve kesişimini
	-FULL A,B,kesişimlerini getirir

SELECT Columns FROM Table1 [JoinType] Table2 ON Conditions

CROSS JOIN A ve B kümelerinin tüm kombinasyonlarını getirir

CROSS APPLY inner join gibi çalışır
OUTER APPLY left join gibi çalışır
*/
CREATE TABLE ##City
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[C1] [varchar](50) NULL,
	CONSTRAINT PK_RootTable PRIMARY KEY CLUSTERED (Id ASC) 
)
CREATE TABLE ##Town
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[C1] [varchar](50) NULL,
	[RootRef] [int] NULL,
	CONSTRAINT [PK_ChildTable] PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT [FK_ChildTable_RootTable] FOREIGN KEY (RootRef) REFERENCES ##City(Id)
)
DECLARE @CityRef int
INSERT INTO ##City VALUES('İstanbul')
SET @CityRef=SCOPE_IDENTITY()
INSERT INTO ##Town VALUES('Kağıthane',@CityRef),('Mecidiyeköy',@CityRef)
INSERT INTO ##City VALUES('İlçesiz')
INSERT INTO ##City VALUES('Ankara')
SET @CityRef=SCOPE_IDENTITY()
INSERT INTO ##Town VALUES('Beypazarı',@CityRef),('Çamlıdere',@CityRef),('Polatlı',@CityRef),('İlsiz',NULL)

SELECT * FROM ##City
SELECT * FROM ##Town

SELECT C.C1 City,T.C1 Town FROM ##City C INNER JOIN ##Town T ON C.Id=T.RootRef
SELECT C.C1 City,T.C1 Town FROM ##City C JOIN ##Town T ON C.Id=T.RootRef

SELECT C.C1 City,T.C1 Town FROM ##City C LEFT OUTER JOIN ##Town T ON C.Id=T.RootRef
SELECT C.C1 City,T.C1 Town FROM ##City C LEFT JOIN ##Town T ON C.Id=T.RootRef

SELECT C.C1 City,T.C1 Town FROM ##City C RIGHT OUTER JOIN ##Town T ON C.Id=T.RootRef
SELECT C.C1 City,T.C1 Town FROM ##City C RIGHT JOIN ##Town T ON C.Id=T.RootRef

SELECT C.C1 City,T.C1 Town FROM ##City C FULL OUTER JOIN ##Town T ON C.Id=T.RootRef
SELECT C.C1 City,T.C1 Town FROM ##City C FULL JOIN ##Town T ON C.Id=T.RootRef

SELECT C.C1 City,T.C1 Town FROM ##City C CROSS JOIN ##Town T 
SELECT C.C1 City,T.C1 Town FROM ##City C , ##Town T 

SELECT * FROM ##City C OUTER APPLY(SELECT * FROM ##Town WHERE RootRef=C.Id)SubTable
SELECT * FROM ##City C CROSS APPLY(SELECT * FROM ##Town WHERE RootRef=C.Id)SubTable
SELECT * FROM ##City C OUTER APPLY(SELECT COUNT(*)TotalTown FROM ##Town WHERE RootRef=C.Id)SubTable

DROP TABLE ##City
DROP TABLE ##Town