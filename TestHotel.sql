
CREATE PROC TestHotel.Test_InsertPurchases
AS
BEGIN
	-- Подготовка окружения
	EXEC tSQLt.FakeTable 'PurchasesByTheBuyer'

	-- Запуск процедуры

	DECLARE @ProductIdP int = 5,
	@CountOfProducts int = 12,
	@DateP char(12) = '2021-09-22',
	@SupplierId int = 2;
	EXEC InsertPurchases @ProductIdP, @CountOfProducts, @DateP, @SupplierId;

	-- Проверка результата

	-- таблица с ожидаемыми результатами
	CREATE TABLE expected
	( 
		TotalCost float
	)

	INSERT expected (TotalCost)
	VALUES (46.2)

	-- Сравниваем ожидаемые аргументы и фактические
	EXEC tSQLt.AssertEqualsTable 
		'expected', 
		'PurchasesByTheBuyer', 
		'Процедура InsertPurchases неверно вычисляет total cost'

END

GO

CREATE PROC TestHotel.Test_deleteEmpl
AS
BEGIN

	-- Подготовка окружения

	EXEC tSQLt.FakeTable 'ListOfEmployees'
	EXEC tSQLt.FakeTable 'ServiceRequest'

	INSERT ListOfEmployees (Surname, Name, DateOfBirth, DateOfEmployment) 
	VALUES 
	('Roberson', 'Barbara', '2000-12-22', '2021-12-22')

	INSERT ServiceRequest (Date,ReservationId,IdService, EmployeeId) 
	VALUES 
	('2000-12-22', 10, 3, 1)
	-- Запуск процедуры


	DECLARE @Surname varchar(50) = 'Roberson', 
	@Name varchar(50) = 'Barbara',
	@DateOfBirth char(12) =  '2000-12-22';
	EXEC deleteEmpl @Surname, @Name, @DateOfBirth;

	-- Проверка результата

	-- таблица с ожидаемыми результатами
	CREATE TABLE expected
	( 
		ReservationId int,
		IdService int, 
		EmployeeId int
	)

	INSERT expected (ReservationId,IdService, EmployeeId)
	VALUES ( 10, 3, 1)

	-- Сравниваем ожидаемые аргументы и фактические
	EXEC tSQLt.AssertEqualsTable 
		'expected', 
		'ServiceRequest', 
		'Процедура deleteEmpl неверно удаляет сотрудника'

END

GO

CREATE PROC TestHotel.Test_InsertBooking
AS
BEGIN
	-- Подготовка окружения
	EXEC tSQLt.FakeTable 'AboutBooking'
	-- Запуск процедуры
	DECLARE @IdRoom int = 101,
	@ArrivalDate char(15) = '2021-12-22',
	@DateOfDeparture char(15) = '2021-12-28',
	@ClientId int = 6;
	EXEC InsertBooking @IdRoom, @ArrivalDate, @DateOfDeparture, @ClientId;
	-- Проверка результата
	-- таблица с ожидаемыми результатами
	CREATE TABLE expected
	( 
		IdRoom int,
		ArrivalDate char(15)
	)
	INSERT expected (IdRoom, ArrivalDate )
	VALUES (101, '2021-12-22')

	-- Сравниваем ожидаемые аргументы и фактические
	EXEC tSQLt.AssertEqualsTable 
		'expected', 
		'AboutBooking', 
		'Процедура InsertBooking неверно вставляет бронирования'

END

GO

CREATE PROC TestHotel.Test_InsertCat
AS
BEGIN
	-- Подготовка окружения
	EXEC tSQLt.FakeTable 'AboutCategories'
	-- Запуск процедуры
	DECLARE @CategoryName varchar(50) = 'hjk',
	@ThePresenceOfATV varchar(10) = 'Yes',
	@ThePresenceOfABathroom varchar(10) = 'No',
	@NumberOfRooms int = 1,
	@RoomCapacity int = 3,
	@CostPerNight char(20) = '16$';
	EXEC InsertCat @CategoryName, @ThePresenceOfATV, @ThePresenceOfABathroom, @NumberOfRooms, @RoomCapacity, @CostPerNight;
	-- Проверка результата
	-- таблица с ожидаемыми результатами
	CREATE TABLE expected
	( 
		CategoryName varchar(50),
		ThePresenceOfATV varchar(10),
		NumberOfRooms int
	)
	INSERT expected (CategoryName,ThePresenceOfATV, NumberOfRooms)
	VALUES ('hjk', 'Yes', 1)

	-- Сравниваем ожидаемые аргументы и фактические
	EXEC tSQLt.AssertEqualsTable 
		'expected', 
		'AboutCategories', 
		'Процедура InsertCat неверно вставляет категорию'

END

GO

CREATE PROC TestHotel.Test_InsertClient
AS
BEGIN
	-- Подготовка окружения
	EXEC tSQLt.FakeTable 'ClientInfo'
	-- Запуск процедуры
	DECLARE @Surn char(50) = 'Fomin',
	@N char(50) = 'Maksim',
	@PhoneNumber char(15) = '89195352365';
	EXEC InsertClient @Surn, @N, @PhoneNumber;	
	-- Проверка результата
	-- таблица с ожидаемыми результатами
	CREATE TABLE expected
	( 
		Surname char(50),
		Name char(50),
		PhoneNumber nchar(15)
	)
	INSERT expected (Surname, Name, PhoneNumber )
	VALUES ('Fomin', 'Maksim', '89195352365')

	-- Сравниваем ожидаемые аргументы и фактические
	EXEC tSQLt.AssertEqualsTable 
		'expected', 
		'ClientInfo', 
		'Процедура InsertClient неверно вставляет клиентов'

END

GO

CREATE PROC TestHotel.Test_ChangeCostServ
AS
BEGIN
	-- Подготовка окружения
	EXEC tSQLt.FakeTable 'ServiceCatalog'
	-- Запуск процедуры
	DECLARE @Name varchar(50) = 'taxi',
	@Cost nchar(10) = 15;
	EXEC ChangeCostServ @Name, @Cost;	
	-- Проверка результата
	-- таблица с ожидаемыми результатами
	CREATE TABLE expected
	( 
		NameOfService varchar(50),
		Cost nchar(10)
	)
	INSERT expected (NameOfService, Cost)
	VALUES ('taxi', 15)

	-- Сравниваем ожидаемые аргументы и фактические
	EXEC tSQLt.AssertEqualsTable 
		'expected', 
		'ServiceCatalog', 
		'Процедура ChangeCostServ неверно меняет стоимость услуги'

END

GO

CREATE PROC TestHotel.Test_ChangeCostMedic
AS
BEGIN
	-- Подготовка окружения
	EXEC tSQLt.FakeTable 'Medicaments'
	-- Запуск процедуры
	DECLARE @Name varchar(50) = 'Aspirin',
	@Cost int = 13;
	EXEC ChangeCostMedic @Name, @Cost;	
	-- Проверка результата
	-- таблица с ожидаемыми результатами
	CREATE TABLE expected
	( 
		Name varchar(50),
		Cost int
	)
	INSERT expected (Name, Cost)
	VALUES ('Aspirin', 13)

	-- Сравниваем ожидаемые аргументы и фактические
	EXEC tSQLt.AssertEqualsTable 
		'expected', 
		'Medicaments', 
		'Процедура ChangeCostMedic неверно меняет стоимость лекарств'

END

GO

CREATE PROC TestHotel.Test_ChangeCountIngredients
AS
BEGIN
	-- Подготовка окружения
	EXEC tSQLt.FakeTable 'Ingredients'
	-- Запуск процедуры
	DECLARE @Name varchar(50) = 'Potatoes',
	@Quantity int = 58;
	EXEC ChangeCountIngredients @Name, @Quantity;	
	-- Проверка результата
	-- таблица с ожидаемыми результатами
	CREATE TABLE expected
	( 
		Name varchar(50),
		Quantity int
	)
	INSERT expected (Name, Quantity)
	VALUES ('Potatoes', 58)

	-- Сравниваем ожидаемые аргументы и фактические
	EXEC tSQLt.AssertEqualsTable 
		'expected', 
		'Ingredients', 
		'Процедура ChangeCountIngredients неверно меняет количество ингредиентов на складе'

END


GO

CREATE PROC TestHotel.Test_CalcTotalOrderAmount
AS
BEGIN
	-- Подготовка окружения
	EXEC tSQLt.FakeTable 'OrderMed'
	-- Запуск процедуры
	DECLARE @Name varchar(50) = 'Aspirin',
	@Quantity int = 3;
	EXEC CalcTotalOrderAmount @Name, @Quantity;	
	-- Проверка результата
	-- таблица с ожидаемыми результатами
	CREATE TABLE expected
	( 
		TotalCost int
	)
	INSERT expected (TotalCost)
	VALUES (96)

	-- Сравниваем ожидаемые аргументы и фактические
	EXEC tSQLt.AssertEqualsTable 
		'expected', 
		'OrderMed', 
		'Процедура CalcTotalOrderAmount неверно вычисляет общую сумму заказа медикаментов'

END


GO

CREATE PROC TestHotel.Test_AddAnswer
AS
BEGIN
	-- Подготовка окружения
	EXEC tSQLt.FakeTable 'Reviews'
	-- Запуск процедуры
	DECLARE @Answer varchar(50) = 'Thank you for your feedback!',
	@IdReviews int = 2;
	EXEC AddAnswer @IdReviews, @Answer;	
	-- Проверка результата
	-- таблица с ожидаемыми результатами
	CREATE TABLE expected
	( 
		Answer varchar(50)
	)
	INSERT expected (Answer)
	VALUES ('Thank you for your feedback!')

	-- Сравниваем ожидаемые аргументы и фактические
	EXEC tSQLt.AssertEqualsTable 
		'expected', 
		'Reviews', 
		'Процедура AddAnswer неверно добавляет ответ на отзыв'

END


GO

EXEC tSqlt.Run 'TestHotel'