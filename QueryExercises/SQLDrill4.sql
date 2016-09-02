/*
	4. For each book that is loaned out from
	Sharpstown branch and whose DueDate is today,
	retrieve the book title, the borrower's name,
	and the borrower's address.
*/

declare @branchname varchar(50) = 'Sharpstown'
declare @today date = getdate()-1

select bk.Title, brw.Name, brw.[Address], bl.DateIn
from Borrower as brw 
	inner join BookLoans as bl
	on brw.CardNo=bl.CardNo
	inner join LibraryBranch as lb
	on bl.BranchId=lb.BranchId
	inner join Book as bk
	on bl.BookId=bk.BookId
where bl.DateIn = '2016/10/04' and lb.BranchName = @branchname