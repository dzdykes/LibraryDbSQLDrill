/*
	1. How many copies of the titled The Lost Tribe
	are owned by the library branch whose name is
	"Sharpstown"
*/

declare @title varchar(50) = 'The Lost Tribe'
declare @branch varchar(50) = 'Sharpstown'
declare @branchid int = null
declare @bookid int = null

select @bookid = BookId from Book
where Title = @title

select @branchid = BranchId from LibraryBranch
where BranchName = @branch

select lb.BranchName, bk.Title, bc.NoOfCopies
from BookCopies as bc inner join Book as bk 
	on bc.BookId = bk.BookId 
	inner join LibraryBranch as lb
	on bc.BranchId = lb.BranchId
where bc.BookId = @bookid and 
		lb.BranchId = @branchid

