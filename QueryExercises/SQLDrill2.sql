/*
	2. How many copies of the Lost Tribe are owned 
	by each libary?
*/

declare @title varchar(50) = 'The Lost Tribe'
declare @branchid int = null
declare @bookid int = null

select @bookid = BookId from Book
where Title = @title

select lb.BranchName, bk.Title, bc.NoOfCopies
from BookCopies as bc inner join Book as bk 
	on bc.BookId = bk.BookId 
	inner join LibraryBranch as lb
	on bc.BranchId = lb.BranchId
where bc.BookId = @bookid