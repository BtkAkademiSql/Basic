SELECT ASCII('A'),CHAR(65),NCHAR(1000)

SELECT CHARINDEX('a','İstanbul')

SELECT CONCAT('1.metin','2.metin')--,CONCAT_WS(',', '1.metin', '2.metin')

SELECT FORMAT (GETDATE(), 'd', 'en-US') AS 'USA',FORMAT (GETDATE(), 'd', 'tr-TR') AS 'TR'

SELECT LEFT('Metinin soldan başlayan kısmını alır',5),RIGHT('Metinin soldan başlayan kısmını alır',4)

SELECT LEN('Karakter sayısı')

SELECT LOWER('HARFLERİ KÜÇÜLTÜR'),UPPER('harfleri büyütür')

SELECT LTRIM('  SQL Tutorial') AS LT, LTRIM('SQL Tutorial  ') AS RT

SELECT PATINDEX('%faruk%', 'ahmetfarukulu')

SELECT REPLACE('Verilen metni değiştirir', 'metni', 'metini')

SELECT REPLICATE('Tekrala', 2)

SELECT REVERSE('metini terse çevirir')

SELECT SPACE(10)--10 tane [ ](boşluk) atar

SELECT SUBSTRING('Metinin bir kısmını alır',13,7),STUFF('Substring ve replace birleşmiş hali', 14, 6, 'güzel fonksiyonun')