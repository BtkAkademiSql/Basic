--break
--continue
--goto

declare @Number int=1
while @Number<=10
begin
	if @Number=5
		break
	print @Number
	set @Number+=1
end

declare @Number2 int=11
while @Number2>0
begin
	set @Number2-=1
	if @Number2=5
		continue
	print @Number2
end

declare @Number3 int=10
LoopPoint:
print @Number3
set @Number3-=1
if @Number3>0
	goto LoopPoint