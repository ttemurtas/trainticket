USE [master]
GO
/****** Object:  Database [Tren]    Script Date: 21.12.2019 21:19:52 ******/
CREATE DATABASE [Tren]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tren', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.TAYFUN\MSSQL\DATA\Tren.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tren_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.TAYFUN\MSSQL\DATA\Tren_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Tren] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tren].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tren] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tren] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tren] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tren] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tren] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tren] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tren] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tren] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tren] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tren] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tren] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tren] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tren] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tren] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tren] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tren] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tren] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tren] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tren] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tren] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tren] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tren] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tren] SET RECOVERY FULL 
GO
ALTER DATABASE [Tren] SET  MULTI_USER 
GO
ALTER DATABASE [Tren] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tren] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tren] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tren] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tren] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tren] SET QUERY_STORE = OFF
GO
USE [Tren]
GO
/****** Object:  Table [dbo].[Bilet]    Script Date: 21.12.2019 21:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bilet](
	[BiletID] [int] IDENTITY(1,1) NOT NULL,
	[SeferID] [int] NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[durum] [bit] NOT NULL,
 CONSTRAINT [PK_Bilet] PRIMARY KEY CLUSTERED 
(
	[BiletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Koltuk]    Script Date: 21.12.2019 21:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Koltuk](
	[KoltukID] [int] IDENTITY(1,1) NOT NULL,
	[TrenID] [int] NOT NULL,
	[durum] [bit] NOT NULL,
	[adi] [nvarchar](50) NULL,
	[soyadi] [nvarchar](50) NULL,
	[tcno] [nvarchar](11) NULL,
	[telefon] [nvarchar](11) NULL,
	[adres] [nvarchar](50) NULL,
	[KullaniciID] [int] NULL,
 CONSTRAINT [PK_Koltuk] PRIMARY KEY CLUSTERED 
(
	[KoltukID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 21.12.2019 21:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[kullaniciAdi] [nvarchar](50) NOT NULL,
	[kullaniciSifre] [nvarchar](50) NOT NULL,
	[kullaniciTip] [bit] NOT NULL,
	[adi] [nvarchar](50) NOT NULL,
	[soyadi] [nvarchar](50) NOT NULL,
	[adres] [nvarchar](50) NOT NULL,
	[telefon] [nvarchar](50) NOT NULL,
	[tckimlikno] [nvarchar](50) NOT NULL,
	[cinsiyet] [bit] NOT NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sefer]    Script Date: 21.12.2019 21:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sefer](
	[SeferID] [int] IDENTITY(1,1) NOT NULL,
	[seferTarihi] [datetime] NOT NULL,
	[seferYonu] [nvarchar](50) NOT NULL,
	[varisYonu] [nvarchar](50) NOT NULL,
	[TrenID] [int] NOT NULL,
	[durum] [bit] NOT NULL,
 CONSTRAINT [PK_Guzergah] PRIMARY KEY CLUSTERED 
(
	[SeferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tren]    Script Date: 21.12.2019 21:19:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tren](
	[TrenID] [int] IDENTITY(1,1) NOT NULL,
	[trenAdi] [nvarchar](50) NOT NULL,
	[koltukSayisi] [int] NOT NULL,
 CONSTRAINT [PK_Tren] PRIMARY KEY CLUSTERED 
(
	[TrenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Koltuk] ON 

INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (1, 1, 0, N'Yiğit', N'Özdemir', N'123456789', N'123456789', N'kartal', 3)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (2, 1, 1, N'Emirhan', N'Özkan', N'123456789', N'123456789', N'küçükçekmece', 1)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (3, 1, 0, N'Yiğit', N'Özdemir', N'123456789', N'123456789', N'kartal', 3)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (4, 1, 1, N'Emirhan', N'Özkan', N'123456789', N'123456789', N'küçükçekmece', 1)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (5, 1, 1, N'nurgül', N'temurtaş', N'2142547898', N'123456789', N'esenler', 1)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (6, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (7, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (8, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (9, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (10, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (11, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (12, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (13, 1, 1, N'Emirhan', N'Özkan', N'123456789', N'123456789', N'küçükçekmece', 1)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (14, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (15, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (16, 1, 1, N'Ferdi', N'Temurtaş', N'1546541654', N'123456789', N'esenler', 1)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (17, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (18, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (19, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (20, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (21, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (22, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (23, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (24, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (25, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (26, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (27, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (28, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (29, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (30, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (31, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (32, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (33, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (34, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (35, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (36, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (37, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (38, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (39, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (40, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (41, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (42, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (43, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (44, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (45, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (46, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (47, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (48, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (49, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (50, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (51, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (52, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (53, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (54, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (55, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (56, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (57, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (58, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (59, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (60, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (61, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (62, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (63, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (64, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (65, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (66, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (67, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (68, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (69, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (70, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (71, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (72, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (73, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (74, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (75, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (76, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (77, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (78, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (79, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (80, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (81, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (82, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (83, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (84, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (85, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (86, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (87, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (88, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (89, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (90, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (91, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (92, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (93, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (94, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (95, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (96, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (97, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (98, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (99, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (100, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (101, 2, 1, N'tayfun', N'temurta', N'123456789', N'123456789', N'esenler', 1)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (102, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (103, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (104, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (105, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (106, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (107, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (108, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (109, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (110, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (111, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (112, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (113, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (114, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (115, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (116, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (117, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (118, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (119, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (120, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (121, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (122, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (123, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (124, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (125, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (126, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (127, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (128, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (129, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (130, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (131, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (132, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (133, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (134, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (135, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (136, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (137, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (138, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (139, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (140, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (141, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (142, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (143, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (144, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (145, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (146, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (147, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (148, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (149, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (150, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (151, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (152, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (153, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (154, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (155, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (156, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (157, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (158, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (159, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (160, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (161, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (162, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (163, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (164, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (165, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (166, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (167, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (168, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (169, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (170, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (171, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (172, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (173, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (174, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (175, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (176, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (177, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (178, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (179, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (180, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (181, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (182, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (183, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (184, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (185, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (186, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (187, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (188, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (189, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (190, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (191, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (192, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (193, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (194, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (195, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (196, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (197, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (198, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (199, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (200, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (201, 3, 1, N'Emirhan', N'Özkan', N'123456789', N'123456789', N'küçükçekmece', 1)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (202, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (203, 3, 1, N'Emirhan', N'Özkan', N'123456789', N'123456789', N'küçükçekmece', 1)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (204, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (205, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (206, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (207, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (208, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (209, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (210, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (211, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (212, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (213, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (214, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (215, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (216, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (217, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (218, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (219, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (220, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (221, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (222, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (223, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (224, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (225, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (226, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (227, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (228, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (229, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (230, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (231, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (232, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (233, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (234, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (235, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (236, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (237, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (238, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (239, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (240, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (241, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (242, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (243, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (244, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (245, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (246, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (247, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (248, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (249, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (250, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (251, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (252, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (253, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (254, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (255, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (256, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (257, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (258, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (259, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (260, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (261, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (262, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (263, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (264, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (265, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (266, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (267, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (268, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (269, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (270, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (271, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (272, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (273, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (274, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (275, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (276, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (277, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (278, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (279, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (280, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (281, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (282, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (283, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (284, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (285, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (286, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (287, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (288, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (289, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (290, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (291, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (292, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (293, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (294, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (295, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (296, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (297, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (298, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (299, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Koltuk] ([KoltukID], [TrenID], [durum], [adi], [soyadi], [tcno], [telefon], [adres], [KullaniciID]) VALUES (300, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Koltuk] OFF
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciID], [kullaniciAdi], [kullaniciSifre], [kullaniciTip], [adi], [soyadi], [adres], [telefon], [tckimlikno], [cinsiyet]) VALUES (1, N'emir', N'12345', 1, N'Emirhan', N'Özkan', N'küçükçekmece', N'123456789', N'123456789', 0)
INSERT [dbo].[Kullanici] ([KullaniciID], [kullaniciAdi], [kullaniciSifre], [kullaniciTip], [adi], [soyadi], [adres], [telefon], [tckimlikno], [cinsiyet]) VALUES (2, N'tyf34', N'12345', 0, N'Tayfun', N'Temurtaş', N'esenler', N'123456789', N'123456789', 0)
INSERT [dbo].[Kullanici] ([KullaniciID], [kullaniciAdi], [kullaniciSifre], [kullaniciTip], [adi], [soyadi], [adres], [telefon], [tckimlikno], [cinsiyet]) VALUES (3, N'yigit123', N'12345', 1, N'Yiğit', N'Özdemir', N'kartal', N'123456789', N'123456789', 0)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
SET IDENTITY_INSERT [dbo].[Sefer] ON 

INSERT [dbo].[Sefer] ([SeferID], [seferTarihi], [seferYonu], [varisYonu], [TrenID], [durum]) VALUES (1, CAST(N'2019-12-20T22:00:00.000' AS DateTime), N'İSTANBUL', N'ANKARA', 1, 0)
INSERT [dbo].[Sefer] ([SeferID], [seferTarihi], [seferYonu], [varisYonu], [TrenID], [durum]) VALUES (2, CAST(N'2019-12-27T22:00:00.000' AS DateTime), N'ANKARA', N'İSTANBUL', 2, 0)
INSERT [dbo].[Sefer] ([SeferID], [seferTarihi], [seferYonu], [varisYonu], [TrenID], [durum]) VALUES (3, CAST(N'2019-12-30T22:00:00.000' AS DateTime), N'İSTANBUL', N'ANKARA', 1, 1)
INSERT [dbo].[Sefer] ([SeferID], [seferTarihi], [seferYonu], [varisYonu], [TrenID], [durum]) VALUES (4, CAST(N'2019-12-25T19:23:27.000' AS DateTime), N'İSTANBUL', N'ANKARA', 2, 1)
INSERT [dbo].[Sefer] ([SeferID], [seferTarihi], [seferYonu], [varisYonu], [TrenID], [durum]) VALUES (5, CAST(N'2019-12-25T21:10:51.000' AS DateTime), N'ANKARA', N'İSTANBUL', 3, 1)
SET IDENTITY_INSERT [dbo].[Sefer] OFF
SET IDENTITY_INSERT [dbo].[Tren] ON 

INSERT [dbo].[Tren] ([TrenID], [trenAdi], [koltukSayisi]) VALUES (1, N'1 Nolu Tren', 100)
INSERT [dbo].[Tren] ([TrenID], [trenAdi], [koltukSayisi]) VALUES (2, N'2 nolu tren', 100)
INSERT [dbo].[Tren] ([TrenID], [trenAdi], [koltukSayisi]) VALUES (3, N'Express', 100)
SET IDENTITY_INSERT [dbo].[Tren] OFF
ALTER TABLE [dbo].[Koltuk]  WITH CHECK ADD  CONSTRAINT [FK_Koltuk_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[Koltuk] CHECK CONSTRAINT [FK_Koltuk_Kullanici]
GO
ALTER TABLE [dbo].[Koltuk]  WITH CHECK ADD  CONSTRAINT [FK_Koltuk_Tren] FOREIGN KEY([TrenID])
REFERENCES [dbo].[Tren] ([TrenID])
GO
ALTER TABLE [dbo].[Koltuk] CHECK CONSTRAINT [FK_Koltuk_Tren]
GO
ALTER TABLE [dbo].[Sefer]  WITH CHECK ADD  CONSTRAINT [FK_Sefer_Tren] FOREIGN KEY([TrenID])
REFERENCES [dbo].[Tren] ([TrenID])
GO
ALTER TABLE [dbo].[Sefer] CHECK CONSTRAINT [FK_Sefer_Tren]
GO
USE [master]
GO
ALTER DATABASE [Tren] SET  READ_WRITE 
GO
