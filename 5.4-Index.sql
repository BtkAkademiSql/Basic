/*
Clustered		=>Her tabloda en fazla 1 adet bulunur tablo sırası indexe göre ayarlanır.Her primary key varsayılan olarak clustered indexdir
NonClustered	=>Clustered olmayan indexdir.Tablo sırasını sanal olarak indexe göre sıralar
Unique			=>Belirtilen indexin sütunlarına göre o tabloda en fazla 1 kayıt bulunabilir kıstası
Include			=>Indexe dahil olacak sütunlar
Fragmentation 	=>Index oluşturulduktan sonra eklenen kayıtlar index sırasını bozar bu duruma fragmantasyon denir
Fill Factor		=>Indexlerde bozulmanın daha yavaş olması için her page belli bir doluluk oranı verilir bu sayede verilen orana göre 1 page 8kb verinin ilk 5kb gerçek veriyken 3kb sonradan gelebilecek veri için boş bırakılır

Statics			
	-Sorguda hangi indexin kullanılacağına karar vermede büyük rol oynar indexler oluşturulurken istatistikleride otomatik olarak güncellenir 
	-SP_UPDATESTATS ile geçerli olan veritabanındaki tüm tabloların istatistik bilgileri güncellenir
	-UPDATE STATISTICS TableName ile sadece bir tablonun istatistik bilgileri güncellenebilir

ExecutionPlan
	-(Ctrl+M) ile açılabilir yada (Ctrl+L) ile sadece bir sorgu için çalıştırılabilir
	-Table Scan=Tüm satırları tek tek kontrol ederek arama yapar en verimsiz arama türüdür
	-Index Seek=Binary search algoritmasına göre arama yapılıyor demektir
	-Key Lookup=Index seek yapıldıktan sonra bulunan Clustered index alanı ile nonclustered indexde olmayan sütunları listelemek için arama yapar

CREATE [UNIQUE] [CLUSTERED| NONCLUSTERED] INDEX IndexName ON TableName (Columns [ASC|DESC])  INCLUDE(Columns)
*/

CREATE TABLE TempTable
(
	_NAME varchar(10),
	LASTNAME varchar(10),
	AGE int,
	GENDER varchar (1)
)
DECLARE @ROW INT=1
WHILE @ROW<=400000
BEGIN
	INSERT INTO TempTable 
	VALUES('Can','Eski',20,'E'),('Aygün','Yıldız',24,'E'),('Ahmet','Ulu',22,'E'),('Nazlı','Can',21,'K')
	,('Atilla','Ünlü',19,'E'),('Yusuf','Kara',15,'E'),('Hakan','Bekir',29,'E'),('Ayşe','Uzun',30,'K')
	SET @ROW+=1
END
INSERT INTO TempTable VALUES('Olmayan','Kayıt',1,'K')

SET STATISTICS IO ON
--ExecutionPlanı(Ctrl+M) ile açın

SELECT * FROM TempTable WHERE _NAME='Olmayan'							--Messages tabına bakıldığında mantıksal okuma: 18182 olacaktır bu kadar page okunduğu anlamına geliyor
SELECT AGE,_NAME,LASTNAME FROM TempTable WHERE LASTNAME='Kayıt'			--Messages tabına bakıldığında mantıksal okuma: 18182 olacaktır bu kadar page okunduğu anlamına geliyor

GO
SP_SPACEUSED 'TempTable'												--Tablodaki data boyutu 145456 KB alan tutacaktır table scan yaptığı için 18182page*8KB=145456KB okuma yapmış olacaktır.Index boyutu=8KB

CREATE CLUSTERED INDEX IX1 ON TempTable (_NAME)
CREATE NONCLUSTERED INDEX IX2 ON TempTable (LASTNAME) INCLUDE(_NAME,AGE)

SELECT * FROM TempTable WHERE _NAME='Olmayan'							--Execution plana bakıldığında IX1'e göre arama yapıldığı görülecektir ve mantıksal okuma: 3 olacaktır 3page*8KB=24KB okuma yapmış olacak
SELECT AGE,_NAME,LASTNAME FROM TempTable WHERE LASTNAME='Kayıt'			--Execution plana bakıldığında IX2'e göre arama yapıldığı görülecektir ve mantıksal okuma: 3 olacaktır 3page*8KB=24KB okuma yapmış olacak
SELECT * FROM TempTable WHERE LASTNAME='Kayıt'							--Execution plana bakıldığında IX2'e göre ve IX1 ile keylookup yapıldığı görülecektir ve mantıksal okuma: 6 olacaktır 

SELECT TOP 10 * FROM TempTable											--Clustered Index _NAME alanında olduğu için kayıt sırasından farklı olarak tabloyu sıraladı
SELECT TOP 10 _NAME,LASTNAME,AGE FROM TempTable							--IX2 indexine göre arama yapacağı için listeleme sırası tablonun var olduğu sıradan farklı olacaktır

SP_SPACEUSED 'TempTable'												--Index boyutu 98600KB olduğu görülecektir oluşturulan her index dahil edildiği sütunlara göre veriyi kopyaladığı için maliyet olarak tablonun boyutunu artırmış oluyor

DROP TABLE TempTable