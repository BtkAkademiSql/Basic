/*
Count=Toplam satır sayısını verir
Sum=Değerlerin toplamını verir
Min=En düşük değeri verir
Max=En yüksek değeri verir
Avg=Ortalama değeri verir
*/
CREATE TABLE ##T1
(
	Number int 
)

INSERT INTO ##T1 VALUES(1),(10),(5),(7),(8),(6),(3)

SELECT COUNT(Number) FROM ##T1
SELECT SUM(Number) FROM ##T1
SELECT MIN(Number) FROM ##T1
SELECT MAX(Number) FROM ##T1
SELECT AVG(Number) FROM ##T1
