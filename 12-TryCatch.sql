/*
BEGIN TRY  
   Hata verebilecek kodlar
END TRY 
BEGIN CATCH  
   Hata oluştuğunda çalışacak kodlar
END CATCH  

-RAISERROR('hata mesajı',16,1) şeklinde hata vermesini sağlayabiliriz
*/
BEGIN TRY  
	RAISERROR('test',16,1)
END TRY
BEGIN CATCH
	SELECT ERROR_LINE()
	SELECT ERROR_MESSAGE()
	SELECT ERROR_PROCEDURE()
	SELECT ERROR_NUMBER()
	SELECT ERROR_SEVERITY()
	SELECT ERROR_STATE()
END CATCH
