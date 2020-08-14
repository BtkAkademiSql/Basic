/*
CREATE PROCEDURE ProcedureName [Parameters]
AS
BEGIN
	çalışacak kodlar
END

EXEC ProcedureName [Parameters]


*/
CREATE PROCEDURE SP_Divide @Number1 int=20 ,@Number2 int,@Result int output
AS
BEGIN
	IF @Number1=0 OR @Number2=0
	BEGIN
		RAISERROR('Sıfıra bölme hatası',16,1)
		RETURN
	END
	PRINT 'Sonuç='+CAST(@Number1/@Number2 AS VARCHAR)
	SET @Result=@Number1/@Number2
END
GO

DECLARE @Result int

EXEC SP_Divide 10,2,@Result output
PRINT 'Result değişkeni değeri='+CAST(@Result as varchar)

EXEC SP_Divide @Number2=2,@Result=@Result output
PRINT 'Result değişkeni değeri='+CAST(@Result as varchar)

SELECT OBJECT_NAME(object_id),* FROM sys.dm_exec_procedure_stats
DROP PROCEDURE SP_Divide

