/*
	7. For each book authored (or co-authored)
	by "Stephen King", retrieve the title and 
	the number of copies owned by the library
	branch whose name is 'Central'.
*/

select bk.Title, ba.AuthorName, bc.NoOfCopies, lb.BranchName
from Book as bk 
	inner join BookCopies as bc
	on bk.BookId=bc.BookId
	inner join LibraryBranch as lb
	on bc.BranchId=lb.BranchId
	inner join BookAuthors as ba
on bk.BookId=ba.BookId
where ba.AuthorName='Stephen King' 
and lb.BranchName='Central'