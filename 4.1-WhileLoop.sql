/*
WHILE şart
BEGIN
	çalışacak kodlar
END
*/

declare @Number int=10

while @Number>0
begin
	print @Number
	set @Number-=1
end