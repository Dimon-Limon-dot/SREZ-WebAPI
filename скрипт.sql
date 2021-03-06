USE [master]
GO
/****** Object:  Database [AuthorizBD]    Script Date: 11.05.2022 21:00:17 ******/
CREATE DATABASE [AuthorizBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AuthorizBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\AuthorizBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AuthorizBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\AuthorizBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AuthorizBD] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AuthorizBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AuthorizBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AuthorizBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AuthorizBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AuthorizBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AuthorizBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [AuthorizBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AuthorizBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AuthorizBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AuthorizBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AuthorizBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AuthorizBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AuthorizBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AuthorizBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AuthorizBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AuthorizBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AuthorizBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AuthorizBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AuthorizBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AuthorizBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AuthorizBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AuthorizBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AuthorizBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AuthorizBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AuthorizBD] SET  MULTI_USER 
GO
ALTER DATABASE [AuthorizBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AuthorizBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AuthorizBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AuthorizBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AuthorizBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AuthorizBD] SET QUERY_STORE = OFF
GO
USE [AuthorizBD]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [AuthorizBD]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 11.05.2022 21:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[IdUser] [int] NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11.05.2022 21:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[Photo] [varbinary](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([Id], [Login], [Password], [IdUser]) VALUES (1, N'sidor@mail.ru', N'1q2w3e', 1)
INSERT [dbo].[Log] ([Id], [Login], [Password], [IdUser]) VALUES (2, N'p.Goncharova@mail.ru', N'q1w2e3', 2)
INSERT [dbo].[Log] ([Id], [Login], [Password], [IdUser]) VALUES (3, N'MaxSDR@mail.ru', N'1w2q3e', 3)
INSERT [dbo].[Log] ([Id], [Login], [Password], [IdUser]) VALUES (4, N'Safronov321@mail.ru', N'3e2w1q', 4)
INSERT [dbo].[Log] ([Id], [Login], [Password], [IdUser]) VALUES (6, N'test@mail.ru', N'test', 6)
SET IDENTITY_INSERT [dbo].[Log] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IdUser], [Surname], [Name], [MiddleName], [Photo]) VALUES (1, N'Сидоров', N'Павел', N'Егеньевич', NULL)
INSERT [dbo].[Users] ([IdUser], [Surname], [Name], [MiddleName], [Photo]) VALUES (2, N'Гончарова', N'Полина', N'Александровна', NULL)
INSERT [dbo].[Users] ([IdUser], [Surname], [Name], [MiddleName], [Photo]) VALUES (3, N'Тимохин', N'Максим', N'Викторович', NULL)
INSERT [dbo].[Users] ([IdUser], [Surname], [Name], [MiddleName], [Photo]) VALUES (4, N'Сафронов', N'Алексей', N'Михайлович', NULL)
INSERT [dbo].[Users] ([IdUser], [Surname], [Name], [MiddleName], [Photo]) VALUES (5, N'test', N'test', N'test', NULL)
INSERT [dbo].[Users] ([IdUser], [Surname], [Name], [MiddleName], [Photo]) VALUES (6, N'test', N'test', N'test', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_Users] FOREIGN KEY([IdUser])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_Users]
GO
USE [master]
GO
ALTER DATABASE [AuthorizBD] SET  READ_WRITE 
GO
