/*
IF şart
BEGIN
	çalışacak kodlar
END

ELSE 
BEGIN
	çalışacak kodlar
END

CASE WHEN şart THEN çalışacak kod ELSE çalışacak kod END
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

PRINT CASE WHEN @Number>0 THEN 'Sayı pozitif' ELSE 'Sayı 0 veya negatif' END