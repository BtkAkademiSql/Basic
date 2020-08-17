/*
DECLARE CursorName CURSOR FOR (TableQuery)
OPEN CursorName

FETCH NEXT FROM CursorName INTO [Parameters]
WHILE @@FETCH_STATUS=0
BEGIN
	çalışacak kodlar

FETCH NEXT FROM CursorName INTO [Parameters]
END

CLOSE CursorName
DEALLOCATE CursorName
*/
CREATE TABLE ##T(NOTES varchar(255),EMAIL varchar(50)) INSERT INTO ##T VALUES('Hatırlatma notu1','ahmetfarukulu@gmail.com'),('Not 2','afulu@hotmail.com')
DECLARE @Note varchar(255),@Email varchar(50)

DECLARE Crs CURSOR FOR SELECT * FROM ##T
OPEN Crs

FETCH NEXT FROM Crs INTO @Note,@Email
WHILE @@FETCH_STATUS=0
BEGIN
	EXEC msdb.dbo.sp_send_dbmail @profile_name='SQLMail',@recipients=@Email,@SUBJECT='Hatırlatma',@BODY=@Note	
FETCH NEXT FROM Crs INTO @Note,@Email
END
CLOSE Crs
DEALLOCATE Crs

DROP TABLE ##T

