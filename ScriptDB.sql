USE [master]
GO
/****** Object:  Database [test]    Script Date: 21.12.2022 18:19:19 ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
USE [test]
GO
/****** Object:  Table [dbo].[Dishs]    Script Date: 21.12.2022 18:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dishs](
	[IdDish] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](25) NULL,
	[Price] [money] NULL,
	[IdGroup] [int] NULL,
 CONSTRAINT [PK_Dishs] PRIMARY KEY CLUSTERED 
(
	[IdDish] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 21.12.2022 18:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[IdGroup] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](15) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[IdGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfoOrders]    Script Date: 21.12.2022 18:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoOrders](
	[IdOrder] [int] NOT NULL,
	[IdDish] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Amount] [money] NULL,
	[IdInfoOrder] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_InfoOrders_1] PRIMARY KEY CLUSTERED 
(
	[IdInfoOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 21.12.2022 18:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[IdStaff] [int] NULL,
	[IdTable] [int] NULL,
	[Price] [money] NULL,
	[Status] [nvarchar](25) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 21.12.2022 18:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[IdStaff] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [nvarchar](15) NULL,
	[FirstName] [nvarchar](15) NULL,
	[MiddleName] [nvarchar](15) NULL,
	[LastName] [nvarchar](15) NULL,
	[Password] [nvarchar](25) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[IdStaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tables]    Script Date: 21.12.2022 18:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables](
	[IdTable] [int] IDENTITY(1,1) NOT NULL,
	[IdOrder] [int] NULL,
	[Status] [nvarchar](25) NULL,
 CONSTRAINT [PK_Tables] PRIMARY KEY CLUSTERED 
(
	[IdTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dishs] ON 

INSERT [dbo].[Dishs] ([IdDish], [Title], [Price], [IdGroup]) VALUES (1, N'Борщ', 50.0000, 1)
INSERT [dbo].[Dishs] ([IdDish], [Title], [Price], [IdGroup]) VALUES (2, N'Карбонара', 250.0000, 1)
INSERT [dbo].[Dishs] ([IdDish], [Title], [Price], [IdGroup]) VALUES (3, N'Стейк', 400.0000, 1)
INSERT [dbo].[Dishs] ([IdDish], [Title], [Price], [IdGroup]) VALUES (4, N'Жареная Картошка', 150.0000, 1)
INSERT [dbo].[Dishs] ([IdDish], [Title], [Price], [IdGroup]) VALUES (5, N'Черный чай', 25.0000, 2)
INSERT [dbo].[Dishs] ([IdDish], [Title], [Price], [IdGroup]) VALUES (6, N'Кофе 3в1', 25.0000, 2)
INSERT [dbo].[Dishs] ([IdDish], [Title], [Price], [IdGroup]) VALUES (7, N'Компот', 25.0000, 2)
SET IDENTITY_INSERT [dbo].[Dishs] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([IdGroup], [Title]) VALUES (1, N'Блюдо')
INSERT [dbo].[Groups] ([IdGroup], [Title]) VALUES (2, N'Напитки')
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[InfoOrders] ON 

INSERT [dbo].[InfoOrders] ([IdOrder], [IdDish], [Quantity], [Amount], [IdInfoOrder]) VALUES (1, 1, 2, 100.0000, 1)
INSERT [dbo].[InfoOrders] ([IdOrder], [IdDish], [Quantity], [Amount], [IdInfoOrder]) VALUES (1, 6, 1, 25.0000, 2)
INSERT [dbo].[InfoOrders] ([IdOrder], [IdDish], [Quantity], [Amount], [IdInfoOrder]) VALUES (2, 2, 3, 750.0000, 3)
INSERT [dbo].[InfoOrders] ([IdOrder], [IdDish], [Quantity], [Amount], [IdInfoOrder]) VALUES (2, 3, 3, 1200.0000, 4)
INSERT [dbo].[InfoOrders] ([IdOrder], [IdDish], [Quantity], [Amount], [IdInfoOrder]) VALUES (3, 7, 4, 100.0000, 5)
INSERT [dbo].[InfoOrders] ([IdOrder], [IdDish], [Quantity], [Amount], [IdInfoOrder]) VALUES (3, 4, 2, 300.0000, 6)
INSERT [dbo].[InfoOrders] ([IdOrder], [IdDish], [Quantity], [Amount], [IdInfoOrder]) VALUES (4, 7, 2, 50.0000, 7)
SET IDENTITY_INSERT [dbo].[InfoOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([IdOrder], [IdStaff], [IdTable], [Price], [Status]) VALUES (1, 1, 1, 125.0000, N'Активный')
INSERT [dbo].[Orders] ([IdOrder], [IdStaff], [IdTable], [Price], [Status]) VALUES (2, 1, 2, 1950.0000, N'Активный')
INSERT [dbo].[Orders] ([IdOrder], [IdStaff], [IdTable], [Price], [Status]) VALUES (3, 2, 3, 400.0000, N'Активный')
INSERT [dbo].[Orders] ([IdOrder], [IdStaff], [IdTable], [Price], [Status]) VALUES (4, 2, 4, 50.0000, N'Активный')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([IdStaff], [Grade], [FirstName], [MiddleName], [LastName], [Password]) VALUES (1, N'Стажёр', N'Рассадин', N'Алексей', N'Владимирович', N'0000')
INSERT [dbo].[Staff] ([IdStaff], [Grade], [FirstName], [MiddleName], [LastName], [Password]) VALUES (2, N'Официант', N'Майдиков', N'Денис', N'Игоревич', N'1111')
INSERT [dbo].[Staff] ([IdStaff], [Grade], [FirstName], [MiddleName], [LastName], [Password]) VALUES (3, N'Менеджер', N'Сажин', N'Иван', N'Евгеньевич', N'2222')
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[Tables] ON 

INSERT [dbo].[Tables] ([IdTable], [IdOrder], [Status]) VALUES (1, 1, N'Занят')
INSERT [dbo].[Tables] ([IdTable], [IdOrder], [Status]) VALUES (2, 2, N'Занят')
INSERT [dbo].[Tables] ([IdTable], [IdOrder], [Status]) VALUES (3, 3, N'Занят')
INSERT [dbo].[Tables] ([IdTable], [IdOrder], [Status]) VALUES (4, 4, N'Занят')
INSERT [dbo].[Tables] ([IdTable], [IdOrder], [Status]) VALUES (5, NULL, N'Свободен')
SET IDENTITY_INSERT [dbo].[Tables] OFF
GO
ALTER TABLE [dbo].[Dishs]  WITH CHECK ADD  CONSTRAINT [FK_Dishs_Groups] FOREIGN KEY([IdGroup])
REFERENCES [dbo].[Groups] ([IdGroup])
GO
ALTER TABLE [dbo].[Dishs] CHECK CONSTRAINT [FK_Dishs_Groups]
GO
ALTER TABLE [dbo].[InfoOrders]  WITH CHECK ADD  CONSTRAINT [FK_InfoOrders_Dishs] FOREIGN KEY([IdDish])
REFERENCES [dbo].[Dishs] ([IdDish])
GO
ALTER TABLE [dbo].[InfoOrders] CHECK CONSTRAINT [FK_InfoOrders_Dishs]
GO
ALTER TABLE [dbo].[InfoOrders]  WITH CHECK ADD  CONSTRAINT [FK_InfoOrders_Orders] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[Orders] ([IdOrder])
GO
ALTER TABLE [dbo].[InfoOrders] CHECK CONSTRAINT [FK_InfoOrders_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Staff] FOREIGN KEY([IdStaff])
REFERENCES [dbo].[Staff] ([IdStaff])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Staff]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Tables] FOREIGN KEY([IdTable])
REFERENCES [dbo].[Tables] ([IdTable])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Tables]
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
