USE [master]
GO
/****** Object:  Database [Assesment]    Script Date: 30-12-2022 12:34:40 ******/
CREATE DATABASE [Assesment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assesment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assesment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assesment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assesment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assesment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assesment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assesment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assesment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assesment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assesment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assesment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assesment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assesment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assesment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assesment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assesment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assesment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assesment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assesment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assesment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assesment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assesment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assesment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assesment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assesment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assesment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assesment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assesment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assesment] SET RECOVERY FULL 
GO
ALTER DATABASE [Assesment] SET  MULTI_USER 
GO
ALTER DATABASE [Assesment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assesment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assesment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assesment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assesment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assesment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assesment', N'ON'
GO
ALTER DATABASE [Assesment] SET QUERY_STORE = OFF
GO
USE [Assesment]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 30-12-2022 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Publisher] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[AuthorLastName] [nvarchar](50) NULL,
	[AuthorFirstName] [nvarchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
	[TitleOfTheSource] [nvarchar](100) NULL,
	[TitleOfTheContainer] [nvarchar](100) NULL,
	[PublicationDate] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Volume] [varchar](50) NULL,
	[Issue] [varchar](50) NULL,
	[DOI] [varchar](100) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetBooks_OrderOnAuthor]    Script Date: 30-12-2022 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Amresh kumar>
-- Create date: <23dec2022>
-- Description:	<Get listy of book with order Author (last, first), then title.>
-- =============================================
CREATE PROCEDURE [dbo].[GetBooks_OrderOnAuthor]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		Select Publisher,Title,AuthorLastName,AuthorFirstName,Price from Book order by AuthorLastName,AuthorFirstName,Title
END
GO
/****** Object:  StoredProcedure [dbo].[GetBooks_OrderOnPublisher]    Script Date: 30-12-2022 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Amresh kumar>
-- Create date: <23dec2022>
-- Description:	<Get listy of book with order Publisher, Author (last, first), then title.>
-- =============================================
CREATE PROCEDURE [dbo].[GetBooks_OrderOnPublisher]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		Select Publisher,Title,AuthorLastName,AuthorFirstName,Price from Book order by Publisher,AuthorLastName,AuthorFirstName,Title

END
GO
/****** Object:  StoredProcedure [dbo].[GetChicagoFormat]    Script Date: 30-12-2022 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetChicagoFormat]
AS
BEGIN
SELECT ID,Publisher,Title,AuthorLastName,AuthorFirstName,TitleOfTheSource,TitleOfTheContainer,PublicationDate,Location,Price,volume,Issue,DOI from Book
END
GO
/****** Object:  StoredProcedure [dbo].[GetMLAFormat]    Script Date: 30-12-2022 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from Book
CREATE PROC [dbo].[GetMLAFormat]
AS
BEGIN
SELECT ID,Publisher,Title,AuthorLastName,AuthorFirstName,TitleOfTheSource,TitleOfTheContainer,PublicationDate,Location,Price from Book
END
GO
USE [master]
GO
ALTER DATABASE [Assesment] SET  READ_WRITE 
GO
