/*
	5.For each library branch, retrieve the 
	branch name and the total number of books
	loaned out from the branch.
*/

select lb.BranchName, bl.BooksOut
  from LibraryBranch as lb
    inner join (select BranchId, count(BranchId) as BooksOut
    from BookLoans group by BranchId) 
	as bl on lb.BranchId = bl.BranchId