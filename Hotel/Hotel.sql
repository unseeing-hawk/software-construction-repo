USE [Hotel]
GO
/****** Object:  StoredProcedure [dbo].[InsertStatus]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertStatus]
GO
/****** Object:  StoredProcedure [dbo].[InsertServ]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertServ]
GO
/****** Object:  StoredProcedure [dbo].[InsertRoom]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertRoom]
GO
/****** Object:  StoredProcedure [dbo].[insertRequest]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[insertRequest]
GO
/****** Object:  StoredProcedure [dbo].[InsertPurchases]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertPurchases]
GO
/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertOrder]
GO
/****** Object:  StoredProcedure [dbo].[InsertNewOrder]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertNewOrder]
GO
/****** Object:  StoredProcedure [dbo].[InsertEmpl]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertEmpl]
GO
/****** Object:  StoredProcedure [dbo].[InsertClient]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertClient]
GO
/****** Object:  StoredProcedure [dbo].[InsertCat]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertCat]
GO
/****** Object:  StoredProcedure [dbo].[InsertBooking]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[InsertBooking]
GO
/****** Object:  StoredProcedure [dbo].[deleteEmpl]    Script Date: 06.11.2021 0:35:35 ******/
DROP PROCEDURE IF EXISTS [dbo].[deleteEmpl]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceRequest]') AND type in (N'U'))
ALTER TABLE [dbo].[ServiceRequest] DROP CONSTRAINT IF EXISTS [FK_Заявка на услугу_Каталог услуг]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceRequest]') AND type in (N'U'))
ALTER TABLE [dbo].[ServiceRequest] DROP CONSTRAINT IF EXISTS [FK_Service request_Status]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceRequest]') AND type in (N'U'))
ALTER TABLE [dbo].[ServiceRequest] DROP CONSTRAINT IF EXISTS [FK_Service request_List of employees]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceRequest]') AND type in (N'U'))
ALTER TABLE [dbo].[ServiceRequest] DROP CONSTRAINT IF EXISTS [FK_Service request_About booking]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchasesByTheBuyer]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchasesByTheBuyer] DROP CONSTRAINT IF EXISTS [FK_Purchases by the buyer_Status]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchasesByTheBuyer]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchasesByTheBuyer] DROP CONSTRAINT IF EXISTS [FK_Purchases by the buyer_Product list]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchasesByTheBuyer]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchasesByTheBuyer] DROP CONSTRAINT IF EXISTS [FK_Purchases by the buyer_List of products from the supplier]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT IF EXISTS [FK_Order_Status]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT IF EXISTS [FK_Order_About booking]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListOfProductsFromSupplier]') AND type in (N'U'))
ALTER TABLE [dbo].[ListOfProductsFromSupplier] DROP CONSTRAINT IF EXISTS [FK_List of products from the supplier_List of suppliers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AboutRoom]') AND type in (N'U'))
ALTER TABLE [dbo].[AboutRoom] DROP CONSTRAINT IF EXISTS [FK_AboutRoom_AboutCategories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AboutOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[AboutOrder] DROP CONSTRAINT IF EXISTS [FK_AboutOrder_Order]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AboutOrder]') AND type in (N'U'))
ALTER TABLE [dbo].[AboutOrder] DROP CONSTRAINT IF EXISTS [FK_About order_Product list]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AboutBooking]') AND type in (N'U'))
ALTER TABLE [dbo].[AboutBooking] DROP CONSTRAINT IF EXISTS [FK_About booking_Client info4]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AboutBooking]') AND type in (N'U'))
ALTER TABLE [dbo].[AboutBooking] DROP CONSTRAINT IF EXISTS [FK_About booking_About room]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchasesByTheBuyer]') AND type in (N'U'))
ALTER TABLE [dbo].[PurchasesByTheBuyer] DROP CONSTRAINT IF EXISTS [DF_PurchasesByTheBuyer_TotalCost]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
ALTER TABLE [dbo].[Order] DROP CONSTRAINT IF EXISTS [DF_Order_TotalCost]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[Status]
GO
/****** Object:  Table [dbo].[ServiceRequest]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[ServiceRequest]
GO
/****** Object:  Table [dbo].[ServiceCatalog]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[ServiceCatalog]
GO
/****** Object:  Table [dbo].[PurchasesByTheBuyer]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[PurchasesByTheBuyer]
GO
/****** Object:  Table [dbo].[ProductList]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[ProductList]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[Order]
GO
/****** Object:  Table [dbo].[ListOfSuppliers]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[ListOfSuppliers]
GO
/****** Object:  Table [dbo].[ListOfProductsFromSupplier]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[ListOfProductsFromSupplier]
GO
/****** Object:  Table [dbo].[ListOfEmployees]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[ListOfEmployees]
GO
/****** Object:  Table [dbo].[ClientInfo]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[ClientInfo]
GO
/****** Object:  Table [dbo].[AboutRoom]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[AboutRoom]
GO
/****** Object:  Table [dbo].[AboutOrder]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[AboutOrder]
GO
/****** Object:  Table [dbo].[AboutCategories]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[AboutCategories]
GO
/****** Object:  Table [dbo].[AboutBooking]    Script Date: 06.11.2021 0:35:35 ******/
DROP TABLE IF EXISTS [dbo].[AboutBooking]
GO
USE [master]
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 06.11.2021 0:35:35 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
DROP LOGIN [##MS_PolicyEventProcessingLogin##]
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 06.11.2021 0:35:35 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
DROP LOGIN [##MS_PolicyTsqlExecutionLogin##]
GO
/****** Object:  Login [LAPTOP-8JAMNBRV\alena]    Script Date: 06.11.2021 0:35:35 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'LAPTOP-8JAMNBRV\alena')
DROP LOGIN [LAPTOP-8JAMNBRV\alena]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 06.11.2021 0:35:35 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY')
DROP LOGIN [NT SERVICE\SQLTELEMETRY]
GO
/****** Object:  Database [Hotel]    Script Date: 06.11.2021 0:35:35 ******/
DROP DATABASE IF EXISTS [Hotel]
GO
/****** Object:  Database [Hotel]    Script Date: 06.11.2021 0:35:35 ******/
CREATE DATABASE [Hotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hotel_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Hotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hotel] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel] SET RECOVERY FULL 
GO
ALTER DATABASE [Hotel] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hotel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hotel', N'ON'
GO
ALTER DATABASE [Hotel] SET QUERY_STORE = OFF
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 06.11.2021 0:35:35 ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [LAPTOP-8JAMNBRV\alena]    Script Date: 06.11.2021 0:35:35 ******/
CREATE LOGIN [LAPTOP-8JAMNBRV\alena] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 06.11.2021 0:35:35 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'UyR493ifiE0CPmiam8UT6hZLqsOqctewWoSOR2+h6xo=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 06.11.2021 0:35:35 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'4opV+ER0C7lTwO2wuCS0AcdKY+ZajXKmf85FEDceVWY=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [LAPTOP-8JAMNBRV\alena]
GO
USE [Hotel]
GO
/****** Object:  Table [dbo].[AboutBooking]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutBooking](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[IdRoom] [int] NOT NULL,
	[ArrivalDate] [char](15) NOT NULL,
	[DateOfDeparture] [char](15) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Данные о бронировании] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AboutCategories]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutCategories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[ThePresenceOfATV] [varchar](10) NOT NULL,
	[ThePresenceOfABathroom] [varchar](10) NOT NULL,
	[NumberOfRooms] [int] NOT NULL,
	[RoomCapacity] [int] NOT NULL,
	[CostPerNight] [nchar](20) NOT NULL,
 CONSTRAINT [PK_About categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AboutOrder]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutOrder](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Cost] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AboutRoom]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutRoom](
	[IdRoom] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Информация о номерах] PRIMARY KEY CLUSTERED 
(
	[IdRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientInfo]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientInfo](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [char](50) NOT NULL,
	[Name] [char](50) NOT NULL,
	[PhoneNumber] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Client info] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListOfEmployees]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListOfEmployees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DateOfBirth] [char](12) NOT NULL,
	[DateOfEmployment] [char](12) NOT NULL,
 CONSTRAINT [PK_Список сотрудников] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListOfProductsFromSupplier]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListOfProductsFromSupplier](
	[SupplierId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitCost] [float] NOT NULL,
 CONSTRAINT [PK_List of products from the supplier] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListOfSuppliers]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListOfSuppliers](
	[SupplierId] [int] NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Список поставщиков] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[ReservationId] [int] NOT NULL,
	[Date] [char](12) NOT NULL,
	[StatusId] [varchar](50) NULL,
	[TotalCost] [int] NULL,
 CONSTRAINT [PK_Корзина покупателя] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductList]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductList](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[UnitCost($)] [int] NOT NULL,
 CONSTRAINT [PK_Каталог товаров] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchasesByTheBuyer]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasesByTheBuyer](
	[PurchaseId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CountOfProducts] [int] NOT NULL,
	[TotalCost] [float] NULL,
	[Date] [char](12) NOT NULL,
	[StatusId] [varchar](50) NULL,
 CONSTRAINT [PK_Купленные товары закупщиком] PRIMARY KEY CLUSTERED 
(
	[PurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCatalog]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCatalog](
	[IdService] [int] IDENTITY(1,1) NOT NULL,
	[NameOfService] [varchar](50) NOT NULL,
	[Cost] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Каталог услуг] PRIMARY KEY CLUSTERED 
(
	[IdService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRequest]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRequest](
	[IdRequest] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[ReservationId] [int] NOT NULL,
	[IdService] [int] NOT NULL,
	[EmployeeId] [int] NULL,
	[StatusId] [varchar](50) NULL,
 CONSTRAINT [PK_Заявка на услугу] PRIMARY KEY CLUSTERED 
(
	[IdRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [varchar](50) NOT NULL,
	[Descryption] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AboutBooking] ON 

INSERT [dbo].[AboutBooking] ([ReservationId], [IdRoom], [ArrivalDate], [DateOfDeparture], [ClientId]) VALUES (1, 101, N'2021-10-10     ', N'2021-10-21     ', 2)
INSERT [dbo].[AboutBooking] ([ReservationId], [IdRoom], [ArrivalDate], [DateOfDeparture], [ClientId]) VALUES (2, 200, N'2021-05-03     ', N'2021-05-12     ', 1)
INSERT [dbo].[AboutBooking] ([ReservationId], [IdRoom], [ArrivalDate], [DateOfDeparture], [ClientId]) VALUES (3, 100, N'2021-09-20     ', N'2021-10-03     ', 3)
INSERT [dbo].[AboutBooking] ([ReservationId], [IdRoom], [ArrivalDate], [DateOfDeparture], [ClientId]) VALUES (4, 301, N'2021-09-20     ', N'2021-10-03     ', 4)
INSERT [dbo].[AboutBooking] ([ReservationId], [IdRoom], [ArrivalDate], [DateOfDeparture], [ClientId]) VALUES (5, 200, N'2021-05-13     ', N'2021-05-29     ', 5)
INSERT [dbo].[AboutBooking] ([ReservationId], [IdRoom], [ArrivalDate], [DateOfDeparture], [ClientId]) VALUES (6, 302, N'2021-12-05     ', N'2021-12-15     ', 7)
INSERT [dbo].[AboutBooking] ([ReservationId], [IdRoom], [ArrivalDate], [DateOfDeparture], [ClientId]) VALUES (7, 300, N'2021-10-14     ', N'2021-10-28     ', 11)
INSERT [dbo].[AboutBooking] ([ReservationId], [IdRoom], [ArrivalDate], [DateOfDeparture], [ClientId]) VALUES (8, 300, N'2021-10-6      ', N'2021-10-13     ', 11)
INSERT [dbo].[AboutBooking] ([ReservationId], [IdRoom], [ArrivalDate], [DateOfDeparture], [ClientId]) VALUES (10, 300, N'2021-11-1      ', N'2021-11-4      ', 13)
INSERT [dbo].[AboutBooking] ([ReservationId], [IdRoom], [ArrivalDate], [DateOfDeparture], [ClientId]) VALUES (11, 102, N'2021-11-15     ', N'2021-11-18     ', 14)
INSERT [dbo].[AboutBooking] ([ReservationId], [IdRoom], [ArrivalDate], [DateOfDeparture], [ClientId]) VALUES (12, 500, N'2021-12-29     ', N'2021-12-31     ', 15)
SET IDENTITY_INSERT [dbo].[AboutBooking] OFF
GO
SET IDENTITY_INSERT [dbo].[AboutCategories] ON 

INSERT [dbo].[AboutCategories] ([CategoryId], [CategoryName], [ThePresenceOfATV], [ThePresenceOfABathroom], [NumberOfRooms], [RoomCapacity], [CostPerNight]) VALUES (1, N'Standart', N'No', N'No', 1, 2, N'15$                 ')
INSERT [dbo].[AboutCategories] ([CategoryId], [CategoryName], [ThePresenceOfATV], [ThePresenceOfABathroom], [NumberOfRooms], [RoomCapacity], [CostPerNight]) VALUES (2, N'Superior standard', N'No', N'Yes', 1, 2, N'20$                 ')
INSERT [dbo].[AboutCategories] ([CategoryId], [CategoryName], [ThePresenceOfATV], [ThePresenceOfABathroom], [NumberOfRooms], [RoomCapacity], [CostPerNight]) VALUES (3, N'Suite', N'Yes', N'Yes', 2, 3, N'32$                 ')
INSERT [dbo].[AboutCategories] ([CategoryId], [CategoryName], [ThePresenceOfATV], [ThePresenceOfABathroom], [NumberOfRooms], [RoomCapacity], [CostPerNight]) VALUES (4, N'Family room', N'Yes', N'Yes', 2, 4, N'40$                 ')
INSERT [dbo].[AboutCategories] ([CategoryId], [CategoryName], [ThePresenceOfATV], [ThePresenceOfABathroom], [NumberOfRooms], [RoomCapacity], [CostPerNight]) VALUES (5, N'Deluxe', N'Yes', N'Yes', 3, 3, N'67$                 ')
INSERT [dbo].[AboutCategories] ([CategoryId], [CategoryName], [ThePresenceOfATV], [ThePresenceOfABathroom], [NumberOfRooms], [RoomCapacity], [CostPerNight]) VALUES (6, N'Apart', N'Yes', N'Yes', 5, 8, N'97$                 ')
SET IDENTITY_INSERT [dbo].[AboutCategories] OFF
GO
INSERT [dbo].[AboutOrder] ([OrderId], [ProductId], [Count], [Cost]) VALUES (19, 9, 3, 21)
INSERT [dbo].[AboutOrder] ([OrderId], [ProductId], [Count], [Cost]) VALUES (19, 10, 1, 9)
INSERT [dbo].[AboutOrder] ([OrderId], [ProductId], [Count], [Cost]) VALUES (19, 6, 2, 2)
INSERT [dbo].[AboutOrder] ([OrderId], [ProductId], [Count], [Cost]) VALUES (19, 11, 2, 26)
INSERT [dbo].[AboutOrder] ([OrderId], [ProductId], [Count], [Cost]) VALUES (19, 1, 5, 10)
INSERT [dbo].[AboutOrder] ([OrderId], [ProductId], [Count], [Cost]) VALUES (19, 8, 3, 15)
INSERT [dbo].[AboutOrder] ([OrderId], [ProductId], [Count], [Cost]) VALUES (20, 8, 20, 100)
INSERT [dbo].[AboutOrder] ([OrderId], [ProductId], [Count], [Cost]) VALUES (20, 10, 45, 405)
GO
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (100, 1)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (101, 2)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (102, 2)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (103, 1)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (200, 3)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (201, 3)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (202, 4)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (203, 3)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (204, 4)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (300, 5)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (301, 4)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (302, 5)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (401, 5)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (500, 6)
INSERT [dbo].[AboutRoom] ([IdRoom], [CategoryId]) VALUES (502, 6)
GO
SET IDENTITY_INSERT [dbo].[ClientInfo] ON 

INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (1, N'Nazarenko                                         ', N'Alena                                             ', N'89195358691    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (2, N'Kharisova                                         ', N'Anastasia                                         ', N'89195366578    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (3, N'Kharisov                                          ', N'Danil                                             ', N'89195357670    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (4, N'Pankova                                           ', N'Polina                                            ', N'89825386422    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (5, N'Fomina                                            ', N'Polina                                            ', N'89825351233    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (6, N'Kazimirov                                         ', N'Nikita                                            ', N'89195367899    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (7, N'Gilmanova                                         ', N'Alina                                             ', N'89048702030    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (8, N'Usachev                                           ', N'Anatoliy                                          ', N'89223678812    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (9, N'Nazarenko                                         ', N'Oksana                                            ', N'89048701052    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (10, N'Nazarenko                                         ', N'Vyacheslav                                        ', N'89048709099    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (11, N'Nazarenko                                         ', N'Alena                                             ', N'89195358690    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (12, N'Dudkova                                           ', N'Ariana                                            ', N'89195354678    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (13, N'Klimov                                            ', N'Klim                                              ', N'89195367488    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (14, N'Krohina                                           ', N'Alena                                             ', N'89195357688    ')
INSERT [dbo].[ClientInfo] ([ClientId], [Surname], [Name], [PhoneNumber]) VALUES (15, N'Nazarenko                                         ', N'Stasya                                            ', N'89195366579    ')
SET IDENTITY_INSERT [dbo].[ClientInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[ListOfEmployees] ON 

INSERT [dbo].[ListOfEmployees] ([EmployeeId], [Surname], [Name], [DateOfBirth], [DateOfEmployment]) VALUES (1, N'Wilson', N'Corey', N'1998-03-26  ', N'2020-10-05  ')
INSERT [dbo].[ListOfEmployees] ([EmployeeId], [Surname], [Name], [DateOfBirth], [DateOfEmployment]) VALUES (3, N'Thornton', N'Theodore', N'1990-11-10  ', N'2015-06-29  ')
INSERT [dbo].[ListOfEmployees] ([EmployeeId], [Surname], [Name], [DateOfBirth], [DateOfEmployment]) VALUES (4, N'Roberson', N'Barbara', N'2000-12-22  ', N'2020-01-15  ')
INSERT [dbo].[ListOfEmployees] ([EmployeeId], [Surname], [Name], [DateOfBirth], [DateOfEmployment]) VALUES (5, N'Hernandez', N'Elizabeth', N'1995-01-21  ', N'2019-03-27  ')
INSERT [dbo].[ListOfEmployees] ([EmployeeId], [Surname], [Name], [DateOfBirth], [DateOfEmployment]) VALUES (10, N'Usachev', N'Anatoliy', N'2001-07-23  ', N'2021-01-09  ')
SET IDENTITY_INSERT [dbo].[ListOfEmployees] OFF
GO
INSERT [dbo].[ListOfProductsFromSupplier] ([SupplierId], [ProductId], [UnitCost]) VALUES (1, 1, 1.8)
INSERT [dbo].[ListOfProductsFromSupplier] ([SupplierId], [ProductId], [UnitCost]) VALUES (1, 2, 1.5)
INSERT [dbo].[ListOfProductsFromSupplier] ([SupplierId], [ProductId], [UnitCost]) VALUES (2, 3, 3.5)
INSERT [dbo].[ListOfProductsFromSupplier] ([SupplierId], [ProductId], [UnitCost]) VALUES (3, 4, 4)
INSERT [dbo].[ListOfProductsFromSupplier] ([SupplierId], [ProductId], [UnitCost]) VALUES (2, 5, 3.85)
INSERT [dbo].[ListOfProductsFromSupplier] ([SupplierId], [ProductId], [UnitCost]) VALUES (3, 6, 0.75)
INSERT [dbo].[ListOfProductsFromSupplier] ([SupplierId], [ProductId], [UnitCost]) VALUES (4, 7, 1.5)
INSERT [dbo].[ListOfProductsFromSupplier] ([SupplierId], [ProductId], [UnitCost]) VALUES (3, 8, 4)
INSERT [dbo].[ListOfProductsFromSupplier] ([SupplierId], [ProductId], [UnitCost]) VALUES (3, 9, 5.5)
INSERT [dbo].[ListOfProductsFromSupplier] ([SupplierId], [ProductId], [UnitCost]) VALUES (4, 10, 7)
INSERT [dbo].[ListOfProductsFromSupplier] ([SupplierId], [ProductId], [UnitCost]) VALUES (4, 11, 9.5)
GO
INSERT [dbo].[ListOfSuppliers] ([SupplierId], [Surname], [Name], [Address], [PhoneNumber]) VALUES (1, N'Dmitrieva', N'Arina', N'Voskresensk, st. Glory, 54', N'89565457890')
INSERT [dbo].[ListOfSuppliers] ([SupplierId], [Surname], [Name], [Address], [PhoneNumber]) VALUES (2, N'Kuznetsov', N'Daniil', N'Egoryevsk, Domodedovskaya ave., 54', N'89195632871')
INSERT [dbo].[ListOfSuppliers] ([SupplierId], [Surname], [Name], [Address], [PhoneNumber]) VALUES (3, N'Lebedev', N'Artyom', N'Volokolamsk, Kosmonavtov passage, 59', N'89194687755')
INSERT [dbo].[ListOfSuppliers] ([SupplierId], [Surname], [Name], [Address], [PhoneNumber]) VALUES (4, N'Paramonova', N'Anna', N'Dorokhovo, passage Gagarin, 77', N'89194678893')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [ReservationId], [Date], [StatusId], [TotalCost]) VALUES (19, 11, N'2021-11-1   ', NULL, 85)
INSERT [dbo].[Order] ([OrderId], [ReservationId], [Date], [StatusId], [TotalCost]) VALUES (20, 12, N'2021-11-5   ', NULL, 505)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductList] ON 

INSERT [dbo].[ProductList] ([ProductId], [ProductName], [QuantityInStock], [UnitCost($)]) VALUES (1, N'Twix', 104, 2)
INSERT [dbo].[ProductList] ([ProductId], [ProductName], [QuantityInStock], [UnitCost($)]) VALUES (2, N'Mars', 60, 2)
INSERT [dbo].[ProductList] ([ProductId], [ProductName], [QuantityInStock], [UnitCost($)]) VALUES (3, N'Waffles', 56, 4)
INSERT [dbo].[ProductList] ([ProductId], [ProductName], [QuantityInStock], [UnitCost($)]) VALUES (4, N'Kefir 0.5', 23, 5)
INSERT [dbo].[ProductList] ([ProductId], [ProductName], [QuantityInStock], [UnitCost($)]) VALUES (5, N'Cupcakes', 41, 4)
INSERT [dbo].[ProductList] ([ProductId], [ProductName], [QuantityInStock], [UnitCost($)]) VALUES (6, N'Single coffee', 93, 1)
INSERT [dbo].[ProductList] ([ProductId], [ProductName], [QuantityInStock], [UnitCost($)]) VALUES (7, N'Doshirak', 33, 3)
INSERT [dbo].[ProductList] ([ProductId], [ProductName], [QuantityInStock], [UnitCost($)]) VALUES (8, N'Milk 0.5', 32, 5)
INSERT [dbo].[ProductList] ([ProductId], [ProductName], [QuantityInStock], [UnitCost($)]) VALUES (9, N'Fanta 0.5', 70, 7)
INSERT [dbo].[ProductList] ([ProductId], [ProductName], [QuantityInStock], [UnitCost($)]) VALUES (10, N'Nut mix', 13, 9)
INSERT [dbo].[ProductList] ([ProductId], [ProductName], [QuantityInStock], [UnitCost($)]) VALUES (11, N'Fresh fruits on a plate', 9, 13)
SET IDENTITY_INSERT [dbo].[ProductList] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchasesByTheBuyer] ON 

INSERT [dbo].[PurchasesByTheBuyer] ([PurchaseId], [ProductId], [CountOfProducts], [TotalCost], [Date], [StatusId]) VALUES (1, 4, 12, 48, N'2021-09-12  ', N'3-3')
INSERT [dbo].[PurchasesByTheBuyer] ([PurchaseId], [ProductId], [CountOfProducts], [TotalCost], [Date], [StatusId]) VALUES (2, 11, 23, 218.5, N'2021-10-29  ', N'3-2')
INSERT [dbo].[PurchasesByTheBuyer] ([PurchaseId], [ProductId], [CountOfProducts], [TotalCost], [Date], [StatusId]) VALUES (3, 1, 10, 18, N'2021-09-12  ', N'3-3')
INSERT [dbo].[PurchasesByTheBuyer] ([PurchaseId], [ProductId], [CountOfProducts], [TotalCost], [Date], [StatusId]) VALUES (4, 6, 56, 42, N'2021-07-04  ', N'3-1')
INSERT [dbo].[PurchasesByTheBuyer] ([PurchaseId], [ProductId], [CountOfProducts], [TotalCost], [Date], [StatusId]) VALUES (5, 1, 10, 18, N'2021-11-4   ', N'3-3')
INSERT [dbo].[PurchasesByTheBuyer] ([PurchaseId], [ProductId], [CountOfProducts], [TotalCost], [Date], [StatusId]) VALUES (6, 9, 1, 5.5, N'2021-11-4   ', N'3-1')
INSERT [dbo].[PurchasesByTheBuyer] ([PurchaseId], [ProductId], [CountOfProducts], [TotalCost], [Date], [StatusId]) VALUES (7, 2, 3, 4.5, N'2021-11-4   ', N'3-2')
INSERT [dbo].[PurchasesByTheBuyer] ([PurchaseId], [ProductId], [CountOfProducts], [TotalCost], [Date], [StatusId]) VALUES (8, 8, 23, 92, N'2021-11-5   ', N'3-2')
INSERT [dbo].[PurchasesByTheBuyer] ([PurchaseId], [ProductId], [CountOfProducts], [TotalCost], [Date], [StatusId]) VALUES (9, 10, 13, 91, N'2021-11-5   ', NULL)
SET IDENTITY_INSERT [dbo].[PurchasesByTheBuyer] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceCatalog] ON 

INSERT [dbo].[ServiceCatalog] ([IdService], [NameOfService], [Cost]) VALUES (1, N'Laundry', N'12$       ')
INSERT [dbo].[ServiceCatalog] ([IdService], [NameOfService], [Cost]) VALUES (2, N'Cleaning', N'5$        ')
INSERT [dbo].[ServiceCatalog] ([IdService], [NameOfService], [Cost]) VALUES (3, N'SPA', N'45$       ')
INSERT [dbo].[ServiceCatalog] ([IdService], [NameOfService], [Cost]) VALUES (4, N'Excursion to the mountains', N'27$       ')
INSERT [dbo].[ServiceCatalog] ([IdService], [NameOfService], [Cost]) VALUES (5, N'Taxi to the airport', N'17$       ')
INSERT [dbo].[ServiceCatalog] ([IdService], [NameOfService], [Cost]) VALUES (6, N'Bicycle rental for a day', N'9$        ')
INSERT [dbo].[ServiceCatalog] ([IdService], [NameOfService], [Cost]) VALUES (7, N'Taxi ', N'3$        ')
SET IDENTITY_INSERT [dbo].[ServiceCatalog] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceRequest] ON 

INSERT [dbo].[ServiceRequest] ([IdRequest], [Date], [ReservationId], [IdService], [EmployeeId], [StatusId]) VALUES (1, CAST(N'2021-05-11' AS Date), 2, 4, 3, N'1-2')
INSERT [dbo].[ServiceRequest] ([IdRequest], [Date], [ReservationId], [IdService], [EmployeeId], [StatusId]) VALUES (2, CAST(N'2021-09-29' AS Date), 4, 1, 5, N'1-1')
INSERT [dbo].[ServiceRequest] ([IdRequest], [Date], [ReservationId], [IdService], [EmployeeId], [StatusId]) VALUES (3, CAST(N'2021-10-11' AS Date), 1, 3, 4, N'1-3')
INSERT [dbo].[ServiceRequest] ([IdRequest], [Date], [ReservationId], [IdService], [EmployeeId], [StatusId]) VALUES (4, CAST(N'2021-05-16' AS Date), 5, 2, 3, N'1-1')
INSERT [dbo].[ServiceRequest] ([IdRequest], [Date], [ReservationId], [IdService], [EmployeeId], [StatusId]) VALUES (5, CAST(N'2021-11-16' AS Date), 11, 3, 3, N'1-4')
INSERT [dbo].[ServiceRequest] ([IdRequest], [Date], [ReservationId], [IdService], [EmployeeId], [StatusId]) VALUES (6, CAST(N'2021-11-16' AS Date), 2, 1, 4, N'1-2')
SET IDENTITY_INSERT [dbo].[ServiceRequest] OFF
GO
INSERT [dbo].[Status] ([StatusId], [Descryption]) VALUES (N'1-1', N'During')
INSERT [dbo].[Status] ([StatusId], [Descryption]) VALUES (N'1-2', N'Done')
INSERT [dbo].[Status] ([StatusId], [Descryption]) VALUES (N'1-3', N'Waiting for the employee to be staged')
INSERT [dbo].[Status] ([StatusId], [Descryption]) VALUES (N'1-4', N'fhfkj')
INSERT [dbo].[Status] ([StatusId], [Descryption]) VALUES (N'2-1', N'Done')
INSERT [dbo].[Status] ([StatusId], [Descryption]) VALUES (N'2-2', N'During')
INSERT [dbo].[Status] ([StatusId], [Descryption]) VALUES (N'3-1', N'Received')
INSERT [dbo].[Status] ([StatusId], [Descryption]) VALUES (N'3-2', N'On the way')
INSERT [dbo].[Status] ([StatusId], [Descryption]) VALUES (N'3-3', N'Awaiting payment')
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_TotalCost]  DEFAULT ((0)) FOR [TotalCost]
GO
ALTER TABLE [dbo].[PurchasesByTheBuyer] ADD  CONSTRAINT [DF_PurchasesByTheBuyer_TotalCost]  DEFAULT ((0)) FOR [TotalCost]
GO
ALTER TABLE [dbo].[AboutBooking]  WITH CHECK ADD  CONSTRAINT [FK_About booking_About room] FOREIGN KEY([IdRoom])
REFERENCES [dbo].[AboutRoom] ([IdRoom])
GO
ALTER TABLE [dbo].[AboutBooking] CHECK CONSTRAINT [FK_About booking_About room]
GO
ALTER TABLE [dbo].[AboutBooking]  WITH CHECK ADD  CONSTRAINT [FK_About booking_Client info4] FOREIGN KEY([ClientId])
REFERENCES [dbo].[ClientInfo] ([ClientId])
GO
ALTER TABLE [dbo].[AboutBooking] CHECK CONSTRAINT [FK_About booking_Client info4]
GO
ALTER TABLE [dbo].[AboutOrder]  WITH CHECK ADD  CONSTRAINT [FK_About order_Product list] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ProductList] ([ProductId])
GO
ALTER TABLE [dbo].[AboutOrder] CHECK CONSTRAINT [FK_About order_Product list]
GO
ALTER TABLE [dbo].[AboutOrder]  WITH CHECK ADD  CONSTRAINT [FK_AboutOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[AboutOrder] CHECK CONSTRAINT [FK_AboutOrder_Order]
GO
ALTER TABLE [dbo].[AboutRoom]  WITH CHECK ADD  CONSTRAINT [FK_AboutRoom_AboutCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[AboutCategories] ([CategoryId])
GO
ALTER TABLE [dbo].[AboutRoom] CHECK CONSTRAINT [FK_AboutRoom_AboutCategories]
GO
ALTER TABLE [dbo].[ListOfProductsFromSupplier]  WITH CHECK ADD  CONSTRAINT [FK_List of products from the supplier_List of suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[ListOfSuppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[ListOfProductsFromSupplier] CHECK CONSTRAINT [FK_List of products from the supplier_List of suppliers]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_About booking] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[AboutBooking] ([ReservationId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_About booking]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[PurchasesByTheBuyer]  WITH CHECK ADD  CONSTRAINT [FK_Purchases by the buyer_List of products from the supplier] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ListOfProductsFromSupplier] ([ProductId])
GO
ALTER TABLE [dbo].[PurchasesByTheBuyer] CHECK CONSTRAINT [FK_Purchases by the buyer_List of products from the supplier]
GO
ALTER TABLE [dbo].[PurchasesByTheBuyer]  WITH CHECK ADD  CONSTRAINT [FK_Purchases by the buyer_Product list] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ProductList] ([ProductId])
GO
ALTER TABLE [dbo].[PurchasesByTheBuyer] CHECK CONSTRAINT [FK_Purchases by the buyer_Product list]
GO
ALTER TABLE [dbo].[PurchasesByTheBuyer]  WITH CHECK ADD  CONSTRAINT [FK_Purchases by the buyer_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[PurchasesByTheBuyer] CHECK CONSTRAINT [FK_Purchases by the buyer_Status]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_Service request_About booking] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[AboutBooking] ([ReservationId])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_Service request_About booking]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_Service request_List of employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[ListOfEmployees] ([EmployeeId])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_Service request_List of employees]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_Service request_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_Service request_Status]
GO
ALTER TABLE [dbo].[ServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_Заявка на услугу_Каталог услуг] FOREIGN KEY([IdService])
REFERENCES [dbo].[ServiceCatalog] ([IdService])
GO
ALTER TABLE [dbo].[ServiceRequest] CHECK CONSTRAINT [FK_Заявка на услугу_Каталог услуг]
GO
/****** Object:  StoredProcedure [dbo].[deleteEmpl]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[deleteEmpl] 
@Surname varchar(50), 
@Name varchar(50), 
@DateOfBirth char(12)
As
Begin
DECLARE @ID int;
SELECT @ID = EmployeeId FROM ListOfEmployees WHERE Surname = @Surname AND Name = @Name AND DateOfBirth = @DateOfBirth;
Delete from ListOfEmployees  where EmployeeId = @ID;
UPDATE [ServiceRequest] SET EmployeeId = Null WHERE EmployeeId = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[InsertBooking]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertBooking]
@IdRoom int,
@ArrivalDate char(15),
@DateOfDeparture char(15),
@ClientId int
As
Begin
Insert into AboutBooking(IdRoom,ArrivalDate,DateOfDeparture, ClientId) 
			values (@IdRoom,@ArrivalDate,@DateOfDeparture, @ClientId) 
end
GO
/****** Object:  StoredProcedure [dbo].[InsertCat]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertCat]
@CategoryName varchar(50),
@ThePresenceOfATV varchar(10),
@ThePresenceOfABathroom varchar(10),
@NumberOfRooms int,
@RoomCapacity int,
@CostPerNight nchar(20)
As
Begin
Insert into AboutCategories(CategoryName,ThePresenceOfATV,ThePresenceOfABathroom, NumberOfRooms, RoomCapacity, CostPerNight) 
			values (@CategoryName,@ThePresenceOfATV,@ThePresenceOfABathroom, @NumberOfRooms, @RoomCapacity, @CostPerNight ) 
end
GO
/****** Object:  StoredProcedure [dbo].[InsertClient]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertClient]
@Surname char(50),
@Name char(50),
@PhoneNumber nchar(15)
As
Begin
Insert into ClientInfo(Surname,Name,PhoneNumber) 
			values (@Surname,@Name,@PhoneNumber) 
end
GO
/****** Object:  StoredProcedure [dbo].[InsertEmpl]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertEmpl]
@Surname varchar(50),
@Name varchar(50),
@DateOfBirth char(12),
@DateOfEmployment char(12)
As
Begin
Insert into ListOfEmployees(Surname, Name, DateOfBirth, DateOfEmployment) 
			values (@Surname, @Name, @DateOfBirth, @DateOfEmployment) 
end
GO
/****** Object:  StoredProcedure [dbo].[InsertNewOrder]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsertNewOrder]
@ReservationId int,
@Date char(12)
As
Begin 
Insert into [Order](ReservationId, Date) 
			values (@ReservationId,@Date) 
end
GO
/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertOrder]
@OrderId int,
@ProductId int,
@Count int,
@Cost int
As
Begin 
Insert into AboutOrder(OrderId,ProductId,Count, Cost) 
			values (@OrderId,@ProductId,@Count, @Cost); 
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPurchases]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertPurchases]
@ProductId int,
@CountOfProducts int,
@Date char(12),
@SupplierId int
As
Begin
DECLARE @cost float;
SELECT @cost = UnitCost FROM ListOfProductsFromSupplier WHERE ProductId = @ProductId AND SupplierId = @SupplierId;


DECLARE @Totalcost float; 
SET @Totalcost = @cost * @CountOfProducts;

Insert into PurchasesByTheBuyer(ProductId, CountOfProducts, TotalCost, Date) 
			values (@ProductId, @CountOfProducts,@Totalcost, @Date);

UPDATE [ProductList] SET QuantityInStock = QuantityInStock + @CountOfProducts  WHERE ProductId = @ProductId 
end
GO
/****** Object:  StoredProcedure [dbo].[insertRequest]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertRequest]
@Date date,
@ReservationId int,
@IdService int
As
Begin
Insert into ServiceRequest(Date,ReservationId,IdService) 
			values (@Date,@ReservationId,@IdService) 
end
GO
/****** Object:  StoredProcedure [dbo].[InsertRoom]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertRoom]
@IdRoom int,
@CategoryId int
As
Begin
Insert into AboutRoom(IdRoom,CategoryId) 
			values (@IdRoom,@CategoryId) 
end
GO
/****** Object:  StoredProcedure [dbo].[InsertServ]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertServ]
@NameOfService varchar(50),
@Cost nchar(10)
As
Begin
Insert into ServiceCatalog(NameOfService, Cost) 
			values (@NameOfService, @Cost) 
end

GO
/****** Object:  StoredProcedure [dbo].[InsertStatus]    Script Date: 06.11.2021 0:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertStatus]
@StatusId varchar(50),
@Descryption varchar(50)
As
Begin
Insert into Status(StatusId, Descryption) 
			values (@StatusId, @Descryption) 
end
GO
USE [master]
GO
ALTER DATABASE [Hotel] SET  READ_WRITE 
GO
