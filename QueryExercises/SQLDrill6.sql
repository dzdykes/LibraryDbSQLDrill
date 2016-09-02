/*
	6. Retrieve the names, addresses, and number
	of books checked out for all borrowers who
	have more than five books checked out.
*/

select brw.Name, brw.[Address], bl.BooksOut
  from Borrower as brw
    inner join (select CardNo, count(CardNo) as BooksOut
    from BookLoans group by CardNo) as bl 
	on brw.CardNo = bl.CardNo
where BooksOut > 5


select brw.Name, brw.[Address], count(brw.Name) as BooksOut
from Borrower as brw inner join BookLoans as bl
on brw.CardNo = bl.CardNo
group by brw.Name, brw.[Address]
having count(brw.Name)>=5
order by booksOut

SELECT Name, [Address], COUNT(BookLoans.CardNo) AS NumberOfLoans 
FROM BookLoans
INNER JOIN BORROWER
ON BookLoans.CardNo = BORROWER.CardNo
GROUP BY Name, [Address]
HAVING COUNT(BOOKLOANS.CardNo) > 5;
