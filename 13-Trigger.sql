/*
CREATE TRIGGER TriggerName
ON TableName
AFTER {[INSERT],[UPDATE],[DELETE]}
AS
BEGIN
	--çalışacak kodlar
	--INSERTED,DELETED
END

-Tetiklenecek trigger AFTER dedikten sonra birden çok durumda tetiklenmesini sağlayabiliriz
-Güncelleme triggerında eski kayıt deleted iken yeni kayıt inserted olarak tutulur
-AFTER ile tetiklenme durumuna göre işlem gerçekleştikten sonra çalışırken INSTEAD OF ile tetiklenme durumuna göre çalışırken işlemi tetikleyen kod çalışmaz
*/
CREATE TABLE T(Number int not null,Grp int not null) 
CREATE TABLE S(NumberSum int,Grp int)

GO
CREATE TRIGGER TGetS
ON T
AFTER INSERT,DELETE
AS
BEGIN
	DECLARE @Number int,@Number2 int,@Grp int,@Grp2 int
	SELECT @Number=Number,@Grp=Grp FROM inserted
	SELECT @Number2=Number,@Grp2=Grp FROM deleted

	UPDATE S SET NumberSum+=CASE WHEN @Number IS NOT NULL THEN @Number ELSE @Number2*-1 END WHERE Grp=ISNULL(@Grp,@Grp2)
	IF @@ROWCOUNT=0--eğer S tablosunda hiç kayıt yoksa güncelleme sonucu etkilenen satır sayısı 0 gelir bu durumda kayıt at diyoruz
		INSERT INTO S VALUES(CASE WHEN @Number IS NOT NULL THEN @Number ELSE @Number2*-1 END,ISNULL(@Grp,@Grp2))
END
GO

INSERT INTO T VALUES(10,1)
INSERT INTO T VALUES(20,1)
INSERT INTO T VALUES(30,1)
DELETE FROM T WHERE Grp=1 AND Number=20
SELECT * FROM T
SELECT * FROM S

DROP TABLE T
DROP TABLE S