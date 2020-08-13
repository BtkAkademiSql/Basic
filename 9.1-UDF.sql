/*
Scalar-valued=Geriye tek sonuç dönen metotlar
Table-valued=Geriye tablo sonucu dönen metotlar
Aggregate=Liste halindeki verilen parametreye toplu dönüþ yapan metotlar normal metot oluþturma gibi oluþturulamazlar assembly ile çalýþýrlar

CREATE FUNCTION dbo.FuncName([Parameters])
RETURNS DataType
AS
BEGIN
	RETURN DataType
END

-SELECT dbo.FuncName

CREATE FUNCTION dbo.FuncName([Parameters])
RETURNS TABLE
AS
RETURN
(TableResult)

-SELECT * FROM dbo.FuncName
*/

--Scalar fonksiyon
CREATE FUNCTION dbo.Addition(@Number1 int,@Number2 int)
RETURNS INT
AS
BEGIN
	RETURN @Number1+@Number2
END
GO
SELECT dbo.Addition(5,16)Toplam

--Table function deðiþken tanýmlayarak
GO
CREATE FUNCTION dbo.Split(@Separator as varchar(10),@Str as varchar(MAX))
RETURNS @RESULTTABLE TABLE(Idx int,Item varchar(MAX))
AS
BEGIN
	DECLARE @Idx as int=1
	DECLARE @LastCharIndex as int=1

	WHILE @LastCharIndex>=1
	BEGIN
		SET @LastCharIndex=CHARINDEX(@Separator,@Str)
		DECLARE @Item as varchar(MAX)

		SET @Item=SUBSTRING(@Str,0,@LastCharIndex)
		SET @Str=SUBSTRING(@Str,@LastCharIndex+1,LEN(@Str)-@LastCharIndex)

		IF @LastCharIndex=0
			SET @Item=@Str

		INSERT INTO @RESULTTABLE VALUES(@Idx,@Item)
		SET @Idx=@Idx+1
	END
	RETURN
END
GO
SELECT * FROM dbo.Split(',','a,b,c,d')

--Table function gerçek tabloyu kullanarak
CREATE TABLE T(Grp int,Amount int) INSERT INTO T VALUES(1,10),(1,20),(2,30),(2,40),(2,50)
GO
CREATE FUNCTION dbo.GetStatics(@Grp varchar(10))
RETURNS TABLE
AS
RETURN(SELECT SUM(Amount)TotalAmount,AVG(Amount)AvgAmount FROM T WHERE Grp=CAST(@Grp as int))
GO

SELECT * FROM dbo.Split(',','1,2')STable CROSS APPLY(SELECT * FROM dbo.GetStatics(STable.Item))StaticsTable

DROP FUNCTION dbo.Addition
DROP FUNCTION dbo.Split
DROP FUNCTION dbo.GetStatics
DROP TABLE T