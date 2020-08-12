/*
CREATE VIEW ViewName
AS
DQL COMMAND
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
CREATE VIEW CityAndTownName 
AS 
SELECT C.C1 CityName,T.C1 TownRef FROM City C INNER JOIN Town T ON C.Id=T.RootRef
GO

SELECT * FROM CityAndTownName WHERE CityName='İstanbul'

DROP TABLE Town
DROP TABLE City
DROP VIEW CityAndTownName

