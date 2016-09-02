/*
	#1,#2
	This stored procedure will return a table with the number of 
	copies owned by a specific library or if no 
	branch name is entered it will return the number
	of copies for each library branch in the database.
*/
create proc uspBranchCopies @title varchar(50)=null, @branch varchar(50)=null
as
begin
	if (@branch is not null)
	begin
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
		where bc.BookId = @bookid and lb.BranchId = @branchid
	end
	else
	begin		
		select @bookid = BookId from Book
		where Title = @title

		select lb.BranchName, bk.Title, bc.NoOfCopies
		from BookCopies as bc inner join Book as bk 
			on bc.BookId = bk.BookId 
			inner join LibraryBranch as lb
			on bc.BranchId = lb.BranchId
		where bc.BookId = @bookid
	end
end
go

/*
	#3
	This a stored procedure that will find all
	borrowers with no loans.
*/
create proc uspGetBorrowersWithNoLoans
as
begin
	select distinct brw.Name, bl.BookId
	from Borrower as brw left outer join BookLoans as bl
	on brw.CardNo = bl.CardNo
	where bl.BookId is null
end	
go

/*
	#4
	This stored procedure will get all books that
	are due today from a specified branch. Also,
	it accepts a second parameter the if entered will
	return the books that are due not today but a specified
	number of days from today.
*/
create proc uspBookDueToday @branch varchar(50) = null, @daysfromtoday int = 0
as
begin
	declare @today date = getdate()+@daysfromtoday

	select bl.DateIn, bk.Title, brw.Name, brw.[Address]
	from Borrower as brw 
		inner join BookLoans as bl
		on brw.CardNo=bl.CardNo
		inner join LibraryBranch as lb
		on bl.BranchId=lb.BranchId
		inner join Book as bk
		on bl.BookId=bk.BookId
	where bl.DateIn = @today and lb.BranchName = @branch
end
go

/*
	#5
	This stored procedure returns a table with the
	total number of books loaned out by each branch
	in the database.
*/
create proc uspGetTotalBooksOutAllBranches
as
begin	
	select lb.BranchName, bl.BooksOut
	from LibraryBranch as lb
		inner join (select BranchId, count(BranchId) as BooksOut
		from BookLoans group by BranchId) 
		as bl on lb.BranchId = bl.BranchId
end
go

/*
	#6
	This stored procedure will get a list of information
	about the borrowers with more than a specified number
	of books loaned to them.	
*/
create proc uspGetUsersWithXAmountOfLoansOrMore @loans int = 0
as
begin
	select brw.Name, brw.[Address], bl.BooksOut
	  from Borrower as brw
		inner join (select CardNo, count(CardNo) as BooksOut
		from BookLoans group by CardNo) as bl 
		on brw.CardNo = bl.CardNo
	where BooksOut >= @loans
end
go

/*
	#7
	This stored procedure will return a table
	of books that are written by a specified 
	author and in a specified branch.
*/

create proc uspGetNoOfCopiesByAuthorAndBranch @author varchar(50) = null, @branch varchar(50) = null
as
begin
	select bk.Title, ba.AuthorName, bc.NoOfCopies, lb.BranchName
	from Book as bk 
		inner join BookCopies as bc
		on bk.BookId=bc.BookId
		inner join LibraryBranch as lb
		on bc.BranchId=lb.BranchId
		inner join BookAuthors as ba
	on bk.BookId=ba.BookId
	where ba.AuthorName = @author 
	and lb.BranchName = @branch
end
go