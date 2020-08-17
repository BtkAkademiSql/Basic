/*
CREATE TRIGGER TriggerName --Server Objects->Triggers altına oluşturulur
ON { ALL SERVER | DATABASE }  --ALL SERVER tüm veritabanlarında geçerli olur yada veritabanı adı yazarak sadece o veritabanında geçerli olur
{ FOR | AFTER } { event_type | event_group }
AS
BEGIN
	--çalışacak kodlar
END
*/

CREATE TRIGGER LogonControl
ON ALL SERVER
FOR LOGON
AS
BEGIN
	IF (SELECT CONNECTIONPROPERTY('client_net_address'))='<local machine>'--giriş yapılan server name localhost olduğunda girişi engelleme yapıldı
		ROLLBACK
END

--Giriş yapıldığında alınan hata loglarını bu şekilde görebiliriz
CREATE TABLE #T(L DATETIME,P varchar(50),T varchar(500))
INSERT INTO #T EXEC XP_READERRORLOG
SELECT * FROM #T WHERE P='Logon'
DROP TABLE #T