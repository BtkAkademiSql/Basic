--SELECT GroupedColumns,AggregateColumns FROM TableName [WHERE Conditions] GROUP BY Columns [HAVING Conditions] [ORDER BY Columns]

CREATE TABLE ##T1
(
	ID int identity(1,1),
	_NAME varchar(10),
	LASTNAME varchar(10),
	AGE int,
	GENDER varchar (1)
)
INSERT INTO ##T1 
VALUES('Can','Eski',20,'E'),('Aygün','Yıldız',24,'E'),('Ahmet','Ulu',22,'E'),('Nazlı','Can',21,'K')
,('Ahmet','Ünlü',19,'E'),('Can','Kara',29,'E'),('Hakan','Bekir',29,'E'),('Ayşe','Uzun',30,'K')

SELECT * FROM ##T1

--Cinsiyete göre toplam kişi sayısı
SELECT GENDER,COUNT(ID) TOTAL
FROM ##T1
GROUP BY GENDER

--Yaşı 20 den büyük olan ve aynı ada sahip 1 den çok kullanıcıları listeleme 
SELECT _NAME,COUNT(ID)SAMENAMEUSER,AVG(AGE)AGEAVG
FROM ##T1
WHERE AGE>=20
GROUP BY _NAME
HAVING COUNT(ID)>1

DROP TABLE ##T1