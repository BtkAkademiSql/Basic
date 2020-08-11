/*
while şart
begin
	çalışacak kodlar
end
*/

declare @Number int=10

while @Number>0
begin
	print @Number
	set @Number-=1
end