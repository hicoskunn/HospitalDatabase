USE [master]
GO
/****** Object:  Database [HastaneDB]    Script Date: 22.05.2022 15:21:11 ******/
CREATE DATABASE [HastaneDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HastaneDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HastaneDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HastaneDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HastaneDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HastaneDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HastaneDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HastaneDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HastaneDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HastaneDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HastaneDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HastaneDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HastaneDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HastaneDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HastaneDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HastaneDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HastaneDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HastaneDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HastaneDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HastaneDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HastaneDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HastaneDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HastaneDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HastaneDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HastaneDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HastaneDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HastaneDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HastaneDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HastaneDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HastaneDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HastaneDB] SET  MULTI_USER 
GO
ALTER DATABASE [HastaneDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HastaneDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HastaneDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HastaneDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HastaneDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HastaneDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HastaneDB] SET QUERY_STORE = OFF
GO
USE [HastaneDB]
GO
/****** Object:  Table [dbo].[HastaKabul]    Script Date: 22.05.2022 15:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HastaKabul](
	[HastaKabulID] [int] NOT NULL,
	[Hastaisim] [nvarchar](50) NULL,
	[HastaSoyisim] [nvarchar](50) NULL,
	[HastaCinsiyet] [nvarchar](50) NULL,
	[HastaYas] [int] NULL,
	[Sikayet] [nvarchar](50) NULL,
	[HastaID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HastaKabul_1] PRIMARY KEY CLUSTERED 
(
	[HastaKabulID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuayeneID]    Script Date: 22.05.2022 15:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuayeneID](
	[MuayeneID] [int] IDENTITY(1,1) NOT NULL,
	[HastaID] [int] NULL,
	[HastaSikayeti] [nvarchar](50) NULL,
	[istenilenTahlil] [nvarchar](50) NULL,
	[MuayeneSonuc] [nvarchar](50) NULL,
	[PersonelID] [int] NULL,
 CONSTRAINT [PK_MuayeneID] PRIMARY KEY CLUSTERED 
(
	[MuayeneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelID]    Script Date: 22.05.2022 15:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelID](
	[PersonelID] [int] IDENTITY(1,1) NOT NULL,
	[SicilNo] [int] NULL,
	[PersonelAdi] [nvarchar](50) NULL,
	[PersonelSoyisim] [nvarchar](50) NULL,
	[PersonelUnvani] [nvarchar](50) NULL,
 CONSTRAINT [PK_PersonelID] PRIMARY KEY CLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receteler]    Script Date: 22.05.2022 15:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receteler](
	[ReceteID] [int] IDENTITY(1,1) NOT NULL,
	[HastaID] [int] NULL,
	[PersonelID] [int] NULL,
	[İlacAdi] [nvarchar](50) NULL,
	[Kullanimi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Receteler] PRIMARY KEY CLUSTERED 
(
	[ReceteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HastaKabul] ON 

INSERT [dbo].[HastaKabul] ([HastaKabulID], [Hastaisim], [HastaSoyisim], [HastaCinsiyet], [HastaYas], [Sikayet], [HastaID]) VALUES (1, N'Selim', N'Kuzu', N'Erkek', 38, N'Böbrek Agrısı', 1)
INSERT [dbo].[HastaKabul] ([HastaKabulID], [Hastaisim], [HastaSoyisim], [HastaCinsiyet], [HastaYas], [Sikayet], [HastaID]) VALUES (2, N'Mülayim', N'Sarı', N'Erkek', 67, N'RitimBozuklugu', 2)
INSERT [dbo].[HastaKabul] ([HastaKabulID], [Hastaisim], [HastaSoyisim], [HastaCinsiyet], [HastaYas], [Sikayet], [HastaID]) VALUES (3, N'Şeyma', N'Kiraz', N'Kadın', 27, N'BasAgrısı', 3)
INSERT [dbo].[HastaKabul] ([HastaKabulID], [Hastaisim], [HastaSoyisim], [HastaCinsiyet], [HastaYas], [Sikayet], [HastaID]) VALUES (4, N'Akın', N'Tepe', N'Erkek', 3, N'Grip', 4)
INSERT [dbo].[HastaKabul] ([HastaKabulID], [Hastaisim], [HastaSoyisim], [HastaCinsiyet], [HastaYas], [Sikayet], [HastaID]) VALUES (5, N'mehmetcan', NULL, NULL, NULL, NULL, 8)
SET IDENTITY_INSERT [dbo].[HastaKabul] OFF
GO
SET IDENTITY_INSERT [dbo].[MuayeneID] ON 

INSERT [dbo].[MuayeneID] ([MuayeneID], [HastaID], [HastaSikayeti], [istenilenTahlil], [MuayeneSonuc], [PersonelID]) VALUES (1, 2, N'Ritim Bozuklugu', N'1', N'EKG sonucu temizdir.', 2)
INSERT [dbo].[MuayeneID] ([MuayeneID], [HastaID], [HastaSikayeti], [istenilenTahlil], [MuayeneSonuc], [PersonelID]) VALUES (2, 4, N'Grip', N'3', N'Soguk algınlıgına baglı grip', 3)
INSERT [dbo].[MuayeneID] ([MuayeneID], [HastaID], [HastaSikayeti], [istenilenTahlil], [MuayeneSonuc], [PersonelID]) VALUES (3, 1, N'Böbrek Agrısı', N'2', N'Diyaliz Merkezine Sevk Edilecek', 3)
INSERT [dbo].[MuayeneID] ([MuayeneID], [HastaID], [HastaSikayeti], [istenilenTahlil], [MuayeneSonuc], [PersonelID]) VALUES (4, 3, N'Bas Agrısı', N'1', N'Psikiyatriye devredilecek', 1)
SET IDENTITY_INSERT [dbo].[MuayeneID] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonelID] ON 

INSERT [dbo].[PersonelID] ([PersonelID], [SicilNo], [PersonelAdi], [PersonelSoyisim], [PersonelUnvani]) VALUES (1, 1234, N'Hasan', N'Alar', N'Nörolog')
INSERT [dbo].[PersonelID] ([PersonelID], [SicilNo], [PersonelAdi], [PersonelSoyisim], [PersonelUnvani]) VALUES (2, 2134, N'Emel', N'Seren', N'Kardiyolog')
INSERT [dbo].[PersonelID] ([PersonelID], [SicilNo], [PersonelAdi], [PersonelSoyisim], [PersonelUnvani]) VALUES (3, 3421, N'Hasan', N'Sever', N'Bashekim')
INSERT [dbo].[PersonelID] ([PersonelID], [SicilNo], [PersonelAdi], [PersonelSoyisim], [PersonelUnvani]) VALUES (4, 4756, N'Şule', N'Kara', N'Bashemsire')
SET IDENTITY_INSERT [dbo].[PersonelID] OFF
GO
SET IDENTITY_INSERT [dbo].[Receteler] ON 

INSERT [dbo].[Receteler] ([ReceteID], [HastaID], [PersonelID], [İlacAdi], [Kullanimi]) VALUES (1, 1, 1, N'Augmentin Surup', N'Sabah Aksam Bir Sefer')
INSERT [dbo].[Receteler] ([ReceteID], [HastaID], [PersonelID], [İlacAdi], [Kullanimi]) VALUES (2, 2, 2, N'Cardio', N'Günde Bir Kere')
INSERT [dbo].[Receteler] ([ReceteID], [HastaID], [PersonelID], [İlacAdi], [Kullanimi]) VALUES (4, 4, 3, N'Diyaliz', N'Merkeze Gidecek')
INSERT [dbo].[Receteler] ([ReceteID], [HastaID], [PersonelID], [İlacAdi], [Kullanimi]) VALUES (5, 4, 4, N'Diyaliz', N'Günde Bir Kere')
SET IDENTITY_INSERT [dbo].[Receteler] OFF
GO
ALTER TABLE [dbo].[MuayeneID]  WITH CHECK ADD  CONSTRAINT [FK_MuayeneID_HastaKabul1] FOREIGN KEY([MuayeneID])
REFERENCES [dbo].[HastaKabul] ([HastaKabulID])
GO
ALTER TABLE [dbo].[MuayeneID] CHECK CONSTRAINT [FK_MuayeneID_HastaKabul1]
GO
ALTER TABLE [dbo].[MuayeneID]  WITH CHECK ADD  CONSTRAINT [FK_MuayeneID_PersonelID] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[PersonelID] ([PersonelID])
GO
ALTER TABLE [dbo].[MuayeneID] CHECK CONSTRAINT [FK_MuayeneID_PersonelID]
GO
ALTER TABLE [dbo].[Receteler]  WITH CHECK ADD  CONSTRAINT [FK_Receteler_PersonelID] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[PersonelID] ([PersonelID])
GO
ALTER TABLE [dbo].[Receteler] CHECK CONSTRAINT [FK_Receteler_PersonelID]
GO
USE [master]
GO
ALTER DATABASE [HastaneDB] SET  READ_WRITE 
GO
