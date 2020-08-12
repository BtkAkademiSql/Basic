--Subqueryler scalar sonuç dönmeli birden fazla sonuç dönüldüğünde hata alır bu yüzden TOP 1 yada aggregate fonksiyonlarıyla kullanılır 
--JOINli şekilde GROUP BY yapılarak çok daha performanslı sonuçlar döndürülebilir eğer bu şekilde bir sonuca ulaşabiliyorsa subqueryi hiç kullanmamak daha iyi olacaktır
--SELECT Columns,(SELECT ScalarResult FROM TableName [WHERE Conditions])

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

SELECT *,(SELECT COUNT(*) FROM ##Town WHERE RootRef=C.Id)TotalTowns FROM ##City C--Şehirlerin toplam ilçe sayılarını verir
SELECT *,(SELECT TOP 1 Id FROM ##Town WHERE RootRef=C.Id ORDER BY Id DESC)LastTownId FROM ##City C--Şehirlere eklenen son ilçe idsini verir

DROP TABLE ##City
DROP TABLE ##Town