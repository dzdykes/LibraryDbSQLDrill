/*
	Creates the Library Database with the 
	following tables:
		Book
		BookAuthors
		BookCopies
		BookLoans
		Borrower
		Library Branch
		Publisher
	
	##########Warning###########
	All current data will be deleted
	from Library Database
*/

use master
go

--Drop the Library dB is it exists
if exists(select name from master.dbo.sysdatabases
where name = 'Library')
drop database Library
go

create database Library
go

use Library
go

create table Publisher (
	PublisherName varchar(50) primary key,
	[Address] varchar(100),
	Phone varchar(20)
)

create table Book (
	BookId int primary key,
	Title varchar(50) not null,
	PublisherName varchar(50) foreign key references Publisher(PublisherName)
)

create table BookAuthors (
	BookId int foreign key references Book(BookId),
	AuthorName varchar(50) primary key
)

create table LibraryBranch (
	BranchId int primary key,
	BranchName varchar(50) not null,
	[Address] varchar(100)
)

create table BookCopies (
	BookId int foreign key references Book(BookId),
	BranchId int foreign key references LibraryBranch(BranchId),
	NoOfCopies int
)

create table Borrower (
	CardNo int primary key,
	Name varchar(50),
	[Address] varchar(100),
	Phone varchar(20)
	)

create table BookLoans (
	BookId int foreign key references Book(BookId),
	BranchId int foreign key references LibraryBranch(BranchId),
	CardNo int foreign key references Borrower(CardNo),
	DateOut Date,
	DateIn Date
)

