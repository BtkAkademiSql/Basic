/*
Where
	-AND ve OR ile birden çok şart verilir
	-"=,<,>,<>,!=,LIKE,BETWEEN" ile eşitlik kontrolleri yapılır
	-DISTINCT ile istenilen sütunlar tekilleştirilir
	-TOP ile tablodaki liste sonucu kısıtlanır
	-ORDER BY ile ASC,DESC sıralama işlemi yapılır
	-Alias ile sütun adını tablodakinden farklı birşey yapabiliriz
	-UNION ALL ile aynı sütunlara sahip farklı tabloları tek tablo gibi listeleyebiliriz

SELECT ColumnName Alias
SELECT Columns FROM TableName [WHERE Conditions]
SELECT * FROM (TableResult)TableName
*/
SELECT 'Veriler' DataAlias 
UNION ALL
SELECT 'Farklı verilere sahip tablo'
UNION ALL
SELECT * FROM (SELECT 'Başa sona parantez atarak yeni bir tabloymuş gibi sorgulanabilir' C)T1

CREATE TABLE ##T1
(
	C1 int identity(1,1),
	C2 varchar(5),
	C3 int
)
INSERT INTO ##T1 VALUES('A',1),('B',2),('C',3),('D',4),('E',5 ),('A',6 )

SELECT * FROM ##T1 
SELECT C2,C3 FROM ##T1

SELECT * FROM ##T1 WHERE C2='B' AND C3=2
SELECT * FROM ##T1 WHERE C3 BETWEEN 4 AND 6
SELECT * FROM ##T1 WHERE C2='A' OR C3=2

SELECT TOP 2 * FROM ##T1 ORDER BY C1 DESC

SELECT DISTINCT C2 FROM ##T1

DROP TABLE ##T1