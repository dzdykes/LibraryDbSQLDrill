-- #1
exec uspBranchCopies @title='The Lost Tribe', @branch='Sharpstown'

-- #2
exec uspBranchCopies @title='The Lost Tribe'

-- #3
exec uspGetBorrowersWithNoLoans

--#4
exec uspBookDueToday @branch = 'Sharpstown'

--#5
exec uspGetTotalBooksOutAllBranches

--#6
exec uspGetUsersWithXAmountOfLoansOrMore @loans = 5

--#7
exec uspGetNoOfCopiesByAuthorAndBranch @author = 'Stephen King', @branch = 'Central'