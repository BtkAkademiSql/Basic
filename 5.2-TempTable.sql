/*
CREATE TABLE #TabloAdı
(
	SütunAdı veritipi
)
CREATE TABLE ##TabloAdı
(
	SütunAdı veritipi
)
Diyez(#) işareti bir tane ile oluşturulursa sadece oluşturulan bağlantıda kullanılır iki tane ile oluşturulursa diğer bağlantılarda kullanabilir geçici tabloyu oluşturan bağlantı kapatıldığı an otomatik silinir
*/

CREATE TABLE #TempTable
(
	Column1 int identity(1,1),
	Column2 varchar(10)
)

CREATE TABLE ##GlobalTempTable
(
	Column1 int identity(1,1),
	Column2 varchar(10)
)

