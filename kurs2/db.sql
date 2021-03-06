USE [master]
GO
/****** Object:  Database [KursForum]    Script Date: 07.06.2022 6:23:26 ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 07.06.2022 6:23:26 ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 07.06.2022 6:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorID] [int] NOT NULL,
	[CreatedAt] [date] NOT NULL,
	[Title] [nvarchar](40) NOT NULL,
	[Info] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts_And_Categories]    Script Date: 07.06.2022 6:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts_And_Categories](
	[PostID] [int] NULL,
	[CatID] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Posts_And_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts_Categories]    Script Date: 07.06.2022 6:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts_Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Posts_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07.06.2022 6:23:26 ******/
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
/****** Object:  Table [dbo].[Users_Categories]    Script Date: 07.06.2022 6:23:26 ******/
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
INSERT [dbo].[Comments] ([id], [PostID], [AuthorID], [Solution], [CreatedAt], [Text]) VALUES (4, 1, 1, 0, CAST(N'2022-09-01T00:00:00.000' AS DateTime), N'Возможно, у вас консоль закрывается после выполнения кода. Попробуйте добавить Console.ReadKey() в конце метода Main.')
INSERT [dbo].[Comments] ([id], [PostID], [AuthorID], [Solution], [CreatedAt], [Text]) VALUES (6, 4, 1, 0, CAST(N'2022-02-22T13:24:09.000' AS DateTime), N'Если вы говорите, что ошибка возникает при вызове метода, то проверьте, точно ли все аргументы метода содержат в себе какие-то значения')
INSERT [dbo].[Comments] ([id], [PostID], [AuthorID], [Solution], [CreatedAt], [Text]) VALUES (7, 4, 4, 0, CAST(N'2022-02-22T13:26:15.000' AS DateTime), N'Такая ошибка обычно возникает, когда программа пытается работать с пустыми переменными. Попробуйте расставить точки останова и убедиться, что все переменные имеют значения')
INSERT [dbo].[Comments] ([id], [PostID], [AuthorID], [Solution], [CreatedAt], [Text]) VALUES (11, 6, 1, 0, CAST(N'2022-02-24T02:21:24.000' AS DateTime), N'В среде . NET Framework поддерживаются пять типов коллекций: необобщенные, специальные, с поразрядной организацией, обобщенные и параллельные. Реализуют ряд основных структур данных, включая динамический массив, стек, очередь, а также словари, в которых можно хранить пары "ключ-значение".')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([id], [AuthorID], [CreatedAt], [Title], [Info]) VALUES (1, 1, CAST(N'2022-02-05' AS Date), N'Не могу вывести текст в консоль', N'У меня проблема - я не могу вывести текст в консоль')
INSERT [dbo].[Posts] ([id], [AuthorID], [CreatedAt], [Title], [Info]) VALUES (4, 1, CAST(N'2022-02-21' AS Date), N'NullReferenceException', N'Когда вызываю метод для редактирования текста, программа останавливается и возникает эта ошибка. Что делать и почему она возникает?')
INSERT [dbo].[Posts] ([id], [AuthorID], [CreatedAt], [Title], [Info]) VALUES (6, 1, CAST(N'2022-02-24' AS Date), N'Сколько типов коллекций в языке C#', N'И какие они бывают')
INSERT [dbo].[Posts] ([id], [AuthorID], [CreatedAt], [Title], [Info]) VALUES (1009, 2, CAST(N'2022-05-28' AS Date), N'Что тут делать?', N'я не понимаю/')
INSERT [dbo].[Posts] ([id], [AuthorID], [CreatedAt], [Title], [Info]) VALUES (1013, 2, CAST(N'0001-01-01' AS Date), N'Проверка', N'Vibe check






*Bonk!*')
INSERT [dbo].[Posts] ([id], [AuthorID], [CreatedAt], [Title], [Info]) VALUES (1014, 2, CAST(N'0001-01-01' AS Date), N'Проверка проверки', N'Да-да')
INSERT [dbo].[Posts] ([id], [AuthorID], [CreatedAt], [Title], [Info]) VALUES (1015, 2, CAST(N'0001-01-01' AS Date), N'Проверка проверки', N'Да-да')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts_And_Categories] ON 

INSERT [dbo].[Posts_And_Categories] ([PostID], [CatID], [id]) VALUES (1, 5, 1)
INSERT [dbo].[Posts_And_Categories] ([PostID], [CatID], [id]) VALUES (1, 3, 2)
INSERT [dbo].[Posts_And_Categories] ([PostID], [CatID], [id]) VALUES (1, 2, 3)
INSERT [dbo].[Posts_And_Categories] ([PostID], [CatID], [id]) VALUES (6, 3, 4)
INSERT [dbo].[Posts_And_Categories] ([PostID], [CatID], [id]) VALUES (6, 4, 5)
INSERT [dbo].[Posts_And_Categories] ([PostID], [CatID], [id]) VALUES (6, 1, 6)
INSERT [dbo].[Posts_And_Categories] ([PostID], [CatID], [id]) VALUES (1015, 2, 7)
SET IDENTITY_INSERT [dbo].[Posts_And_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts_Categories] ON 

INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (1, N'Вопрос')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (2, N'Обсуждение')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (3, N'C#')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (4, N'Общее')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (5, N'Консоль')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (6, N'Web')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (7, N'Desktop')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (8, N'HTML')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (9, N'CSS')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (10, N'JS')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (11, N'React')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (12, N'ASP.NET')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (13, N'MVC')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (14, N'EntityFramework')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (15, N'Node.JS')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (16, N'Переменные')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (17, N'Массивы')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (18, N'Go')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (19, N'Python')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (20, N'Django')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (21, N'Java')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (22, N'Spring')
INSERT [dbo].[Posts_Categories] ([id], [Name]) VALUES (23, N'Работа с данными')
SET IDENTITY_INSERT [dbo].[Posts_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [Name], [RegDate], [BirthDate], [Bio], [Photo], [Password], [Email], [CatID]) VALUES (1, N'Danila', CAST(N'2022-02-06' AS Date), CAST(N'2001-10-13' AS Date), N'Просто данила', NULL, N'1234', N'mine@mail.ru', 1)
INSERT [dbo].[Users] ([id], [Name], [RegDate], [BirthDate], [Bio], [Photo], [Password], [Email], [CatID]) VALUES (2, N'Sanya', CAST(N'2022-01-29' AS Date), CAST(N'2002-09-19' AS Date), N'Ну саня и саня', NULL, N'1243', N's@mail.ru', 2)
INSERT [dbo].[Users] ([id], [Name], [RegDate], [BirthDate], [Bio], [Photo], [Password], [Email], [CatID]) VALUES (4, N'Danila2', CAST(N'2022-02-21' AS Date), CAST(N'2001-10-13' AS Date), N'Е', N'https://cdnn21.img.ria.ru/images/148839/96/1488399659_0:0:960:960_600x0_80_0_1_e38b72053fffa5d3d7e82d2fe116f0b3.jpg', N'12345', N'm@mail.ru', 1)
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
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
ALTER TABLE [dbo].[Posts_And_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Posts_And_Categories_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([id])
GO
ALTER TABLE [dbo].[Posts_And_Categories] CHECK CONSTRAINT [FK_Posts_And_Categories_Posts]
GO
ALTER TABLE [dbo].[Posts_And_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Posts_And_Categories_Posts_Categories] FOREIGN KEY([CatID])
REFERENCES [dbo].[Posts_Categories] ([id])
GO
ALTER TABLE [dbo].[Posts_And_Categories] CHECK CONSTRAINT [FK_Posts_And_Categories_Posts_Categories]
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
