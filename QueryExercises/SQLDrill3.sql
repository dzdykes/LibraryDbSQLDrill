/*
	3. Retrieve the names of borrowers who do 
	not have any books checked out.
*/
select distinct brw.Name, bl.BookId
from Borrower as brw left outer join BookLoans as bl
on brw.CardNo = bl.CardNo
where bl.BookId is null