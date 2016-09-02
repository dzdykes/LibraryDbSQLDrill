/*  Populates the Library Branch and
	BookCopies Table */
use Library
go

insert into LibraryBranch
values (
	1,
	'Sharpstown',
	'800 Birdview Rd Sharpstown, MD 21121'
	)

insert into LibraryBranch
values (
	2,
	'Central',
	'22 Main St Central, MD 23232'
	)

insert into LibraryBranch
values (
	3,
	'Delmar',
	'123 Abc Ln Delmar, MD 24343'
	)

insert into LibraryBranch
values (
	4,
	'Shipley',
	'3455 Hilltop St Shipley, MD 22345'
	)

/*	The block of code below is a nested while
	loop that populates the BookCopies table 
	with a random number of copies of each book
	for each library branch.
*/

declare @i int = 1

while @i < 5
begin
	declare @j int = 1
	while @j < 21
	begin
		insert into BookCopies
		values (
			@j,
			@i,
			cast(rand()*10+2 as int)
		)

		set @j = @j + 1
	end

	set @i = @i + 1
end

