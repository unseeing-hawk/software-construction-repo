USE master
GO

CREATE DATABASE Kursach ON
( NAME = Kursovaya_Polina,
  FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ Kursach.mdf',
  SIZE = 3072KB, 
  MAXSIZE = UNLIMITED,
  FILEGROWTH = 1024KB )

LOG ON
( NAME= Kursach_log,
  FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ Kursach.ldf',
  SIZE = 1024KB,
  MAXSIZE = 2048GB, 
  FILEGROWTH = 10% )

GO

USE Kursach
GO

CREATE TABLE Employees( 
	IdEmployee int IDENTITY (1,1) PRIMARY KEY,
    Name varchar(30) NOT NULL,
	Surname varchar(50) NOT NULL, 
	Post varchar(30) NOT NULL,
	Salary int NOT NULL, 
	PhoneNumber char(11) NOT NULL,
	Date date NOT NULL
)
GO

CREATE TABLE Visitors( 
	IdVisitor int IDENTITY (1,1) PRIMARY KEY,
    Name varchar(30) NOT NULL,
	Surname varchar(50) NOT NULL, 
	PhoneNumber char(11) NOT NULL,
)
GO

CREATE TABLE Tables( 
	IdTable int IDENTITY (1,1) PRIMARY KEY,
	NumberOfTable int NOT NULL,
	Description varchar(100) NOT NULL
)
GO

CREATE TABLE BookedTables( 
	IdBokkedTable int IDENTITY (1,1) PRIMARY KEY,
	IdTable int NOT NULL FOREIGN KEY REFERENCES Tables(IdTable) ON DELETE CASCADE,
    IdVisitor int NOT NULL FOREIGN KEY REFERENCES Visitors(IdVisitor) ON DELETE CASCADE,
	PhoneNumber char(11) NOT NULL,
	BookingDate dateTime NOT NULL
)
GO

CREATE TABLE Orders( 
	IdOrder int IDENTITY (1,1) PRIMARY KEY,
    IdVisitor int NOT NULL FOREIGN KEY REFERENCES Visitors(IdVisitor) ON DELETE CASCADE,
	IdEmployee int NOT NULL FOREIGN KEY REFERENCES Employees(IdEmployee) ON DELETE CASCADE,
	IdTable int NOT NULL FOREIGN KEY REFERENCES Tables(IdTable) ON DELETE CASCADE,
)
GO

CREATE TABLE StatusOrders( 
	IdStatus int IDENTITY (1,1) PRIMARY KEY,
	IdOrder int NOT NULL FOREIGN KEY REFERENCES Orders(IdOrder) ON DELETE CASCADE,
	Status varchar(100) NOT NULL,
)
GO

CREATE TABLE Bill( 
	IdBill int IDENTITY (1,1) PRIMARY KEY,
	IdOrder int NOT NULL FOREIGN KEY REFERENCES Orders(IdOrder) ON DELETE CASCADE,
	Bill int NOT NULL,
)
GO


CREATE TABLE Menu( 
	IdDish int IDENTITY (1,1) PRIMARY KEY,
	Name varchar(50) NOT NULL,
	CostPrice int NOT NULL,
	Price int NOT NULL, 
	Description varchar(100) NOT NULL
)
GO

CREATE TABLE OrderList( 
	IdOrderList int IDENTITY (1,1) PRIMARY KEY,
	IdOrder int NOT NULL FOREIGN KEY REFERENCES Orders(IdOrder) ON DELETE CASCADE,
	IdDish int NOT NULL FOREIGN KEY REFERENCES Menu(IdDish) ON DELETE CASCADE,
	Quantity int NOT NULL,
	Price int NOT NULL, 
)
GO

CREATE TABLE Ingredients( 
	IdIngredient int IDENTITY (1,1) PRIMARY KEY,
	Name varchar(30) NOT NULL,
	Quantity int NOT NULL,
	CostPrice int NOT NULL,
	Units varchar(15) NOT NULL,
)
GO

CREATE TABLE ÑompositionÎfDishes( 
	IdCompOfDish  int IDENTITY (1,1) PRIMARY KEY,
	IdDish int NOT NULL FOREIGN KEY REFERENCES Menu(IdDish) ON DELETE CASCADE,
	IdIngredient int NOT NULL FOREIGN KEY REFERENCES Ingredients(IdIngredient) ON DELETE CASCADE,
	Quantity int NOT NULL,
)
GO

CREATE TABLE Storage( 
	IdStorage int IDENTITY (1,1) PRIMARY KEY,
	IdIngredient int NOT NULL FOREIGN KEY REFERENCES Ingredients(IdIngredient) ON DELETE CASCADE,
	Name varchar(30) NOT NULL,
	Quantity int NOT NULL,
	Units varchar(15) NOT NULL,
)
GO

CREATE TABLE Suppliers(
	IdSupplier int  IDENTITY (1,1) PRIMARY KEY,
	OrganizationName varchar(50) NOT NULL,
	PhoneNumber char(12) NOT NULL,
	DelegateName varchar(30) NOT NULL
)
GO

CREATE TABLE PurchasesIngredients(
	IdPriceList int IDENTITY (1,1) PRIMARY KEY,
	IdSupplier int NOT NULL REFERENCES Suppliers(IdSupplier),
	IdIngredients int NOT NULL REFERENCES Ingredients(IdIngredient),
	IdStorage int NOT NULL REFERENCES Storage(IdStorage),
	Name varchar(30) NOT NULL,
	Quantity int NOT NULL,
	Price int NOT NULL,
)
GO

CREATE TABLE Reviews( 
	IdReviews int IDENTITY (1,1) PRIMARY KEY,
	Idvisitor int NOT NULL FOREIGN KEY REFERENCES Visitors(IdVisitor) ON DELETE CASCADE,
	Rating int NOT NULL,
	Comment varchar(100) NOT NULL,
	IdEmployee int NOT NULL FOREIGN KEY REFERENCES Employees(IdEmployee) ON DELETE CASCADE,
	Answer varchar(100) NOT NULL,
)
GO

CREATE TABLE Users( 
	IdUser int IDENTITY (1,1) PRIMARY KEY,
	Login varchar(30) NOT NULL,
	Password varchar(15) NOT NULL,
	Surname varchar(50) NOT NULL
)
GO

CREATE TABLE VisitorUsers( 
	IdEmplUsers int IDENTITY (1,1) PRIMARY KEY,
	Idvisitor int NOT NULL FOREIGN KEY REFERENCES Visitors(IdVisitor) ON DELETE CASCADE,
	IdUser int NOT NULL FOREIGN KEY REFERENCES Users(IdUser) ON DELETE CASCADE,
)
GO

CREATE TABLE EmployeeUsers( 
	IdEmplUsers int IDENTITY (1,1) PRIMARY KEY,
	IdEmployee int NOT NULL FOREIGN KEY REFERENCES Employees(IdEmployee) ON DELETE CASCADE,
	IdUser int NOT NULL FOREIGN KEY REFERENCES Users(IdUser) ON DELETE CASCADE,
)
GO
