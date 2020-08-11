/*
IF şart
BEGIN
	çalışacak kodlar
END

ELSE 
BEGIN
	çalışacak kodlar
END
*/

DECLARE @Number int=10
IF @Number>0
BEGIN
	PRINT 'Sayı pozitif'
END
ELSE 
BEGIN
	PRINT 'Sayı 0 veya negatif'
END