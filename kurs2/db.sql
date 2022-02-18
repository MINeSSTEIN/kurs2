USE [master]
GO
/****** Object:  Database [KursForum]    Script Date: 18.02.2022 11:21:03 ******/
CREATE DATABASE [KursForum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KursForum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KursForum.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KursForum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KursForum_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KursForum] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KursForum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KursForum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KursForum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KursForum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KursForum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KursForum] SET ARITHABORT OFF 
GO
ALTER DATABASE [KursForum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KursForum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KursForum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KursForum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KursForum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KursForum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KursForum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KursForum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KursForum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KursForum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KursForum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KursForum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KursForum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KursForum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KursForum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KursForum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KursForum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KursForum] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KursForum] SET  MULTI_USER 
GO
ALTER DATABASE [KursForum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KursForum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KursForum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KursForum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KursForum] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KursForum] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KursForum] SET QUERY_STORE = OFF
GO
USE [KursForum]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 18.02.2022 11:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL,
	[Solution] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Text] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 18.02.2022 11:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Title] [nvarchar](40) NOT NULL,
	[Info] [nvarchar](1000) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts_Categiries]    Script Date: 18.02.2022 11:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts_Categiries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Posts_Categiries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18.02.2022 11:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RegDate] [date] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Bio] [nvarchar](max) NULL,
	[Photo] [nvarchar](max) NULL,
	[Password] [nvarchar](18) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[CatID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_Categories]    Script Date: 18.02.2022 11:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([id], [PostID], [AuthorID], [Solution], [CreatedAt], [Text]) VALUES (1, 1, 2, 0, CAST(N'2022-09-01T00:00:00.000' AS DateTime), N'Попробуй написать Console.Writeline("Текст")')
INSERT [dbo].[Comments] ([id], [PostID], [AuthorID], [Solution], [CreatedAt], [Text]) VALUES (4, 1, 1, 0, CAST(N'2022-09-01T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([id], [AuthorID], [CreatedAt], [Title], [Info], [CategoryID]) VALUES (1, 1, CAST(N'2022-02-05T00:00:00.000' AS DateTime), N'Не могу вывести текст в консоль', N'У меня проблема -- я не могу вывести текст в консоль', 4)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts_Categiries] ON 

INSERT [dbo].[Posts_Categiries] ([id], [Name]) VALUES (1, N'Ошибки в коде')
INSERT [dbo].[Posts_Categiries] ([id], [Name]) VALUES (2, N'Общие вопросы')
INSERT [dbo].[Posts_Categiries] ([id], [Name]) VALUES (3, N'Обсуждения')
INSERT [dbo].[Posts_Categiries] ([id], [Name]) VALUES (4, N'Проблемы')
SET IDENTITY_INSERT [dbo].[Posts_Categiries] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [Name], [RegDate], [BirthDate], [Bio], [Photo], [Password], [Email], [CatID]) VALUES (1, N'Danila', CAST(N'2022-02-06' AS Date), CAST(N'2001-10-13' AS Date), N'Просто данила', NULL, N'1234', N'mine@mail.ru', 1)
INSERT [dbo].[Users] ([id], [Name], [RegDate], [BirthDate], [Bio], [Photo], [Password], [Email], [CatID]) VALUES (2, N'Sanya', CAST(N'2022-01-29' AS Date), CAST(N'2002-09-19' AS Date), N'Ну саня и саня', NULL, N'1243', N's@mail.ru', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Users_Categories] ON 

INSERT [dbo].[Users_Categories] ([id], [Name]) VALUES (1, N'User')
INSERT [dbo].[Users_Categories] ([id], [Name]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[Users_Categories] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Posts_Categiries] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Posts_Categiries] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Posts_Categiries]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users_Categories] FOREIGN KEY([CatID])
REFERENCES [dbo].[Users_Categories] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users_Categories]
GO
USE [master]
GO
ALTER DATABASE [KursForum] SET  READ_WRITE 
GO
