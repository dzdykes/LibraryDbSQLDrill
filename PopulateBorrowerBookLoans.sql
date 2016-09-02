/*
	Used two while loops to populate the tables
	Borrower and BookLoans with 9 and 1000 records
	respectively.
*/
use Library
go

declare @i int = 1

while @i < 10
begin
	declare @rn int = cast(rand()*power(10,8) as int)
	insert into Borrower
	values (
		@rn,
		'TestPerson' + cast(@i as varchar),
		'Test Address' + cast(@i as varchar),
		cast(@i as varchar)+cast(@i as varchar)+cast(@i as varchar)+'-'
		+cast(@i as varchar)+cast(@i as varchar)+cast(@i as varchar)+'-'
		+cast(@i as varchar)+cast(@i as varchar)+cast(@i as varchar)+cast(@i as varchar)
	)
	set @i = @i + 1
end

set @i = 1

while @i<100
begin
	declare @bookid int = cast(rand()*20 + 1 as int)
	declare @branchid int = cast(rand()*4 + 1 as int)
	declare @cardno int = cast(rand()*9+1 as int)
	declare @cn varchar(30) = null
		select @cn = b.CardNo from Borrower as b where b.Phone like '%'+cast(@cardno as varchar)+'%'
	declare @day int = cast(rand()*28+1 as int)
	declare @month int = cast(rand()*12+1 as int)
	insert into BookLoans
	values (
		@bookid,
		@branchid,
		@cn,
		cast(@month as varchar(2)) + '-' + cast(@day as varchar(2)) + '-15',
		cast(@month as varchar(2)) + '-' + cast(@day as varchar(2)) + '-16'
	)
	set @i = @i+1
end

insert into Borrower 
values (
	123456,
	'Johnny Nobooks',
	'123 CantRead Ln Boring, MD 24521',
	'123-456-9999'
	)