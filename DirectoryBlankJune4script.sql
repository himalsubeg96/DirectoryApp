USE [master]
GO
/****** Object:  Database [DirectoryBlankDB]    Script Date: 6/4/2020 3:49:37 PM ******/
CREATE DATABASE [DirectoryBlankDB] ON  PRIMARY 
( NAME = N'DirectoryBlankDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DirectoryBlankDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DirectoryBlankDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DirectoryBlankDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DirectoryBlankDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DirectoryBlankDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DirectoryBlankDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DirectoryBlankDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DirectoryBlankDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DirectoryBlankDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DirectoryBlankDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DirectoryBlankDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DirectoryBlankDB] SET  MULTI_USER 
GO
ALTER DATABASE [DirectoryBlankDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DirectoryBlankDB] SET DB_CHAINING OFF 
GO
USE [DirectoryBlankDB]
GO
/****** Object:  Table [dbo].[tblDirectoryCategory]    Script Date: 6/4/2020 3:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDirectoryCategory](
	[DirectoryCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[DirectoryCategoryName] [nvarchar](50) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDirectoryCategory] PRIMARY KEY CLUSTERED 
(
	[DirectoryCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDirectoryDetails]    Script Date: 6/4/2020 3:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDirectoryDetails](
	[DirectoryDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[DirectoryItemId] [int] NULL,
	[AddressState] [int] NULL,
	[AddressDistrict] [int] NULL,
	[AddressPalika] [int] NULL,
	[AddressWard] [int] NULL,
	[DirectoryPhone] [nvarchar](50) NULL,
	[PAN] [nvarchar](50) NULL,
	[VAT] [nvarchar](50) NULL,
	[ContactPersonName] [nvarchar](50) NULL,
	[ContactPersonPhone] [nvarchar](50) NULL,
	[Details] [nvarchar](max) NULL,
	[Email] [nvarchar](150) NULL,
	[PhotoLogo] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDirectoryDetails] PRIMARY KEY CLUSTERED 
(
	[DirectoryDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDirectoryItem]    Script Date: 6/4/2020 3:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDirectoryItem](
	[DirectoryItemId] [int] IDENTITY(1,1) NOT NULL,
	[DirectoryItemName] [nvarchar](150) NOT NULL,
	[DirectoryCategoryId] [int] NULL,
	[DirectorySubCategoryId] [int] NULL,
	[IssueDate] [date] NULL,
	[Status] [bit] NOT NULL,
	[Specification] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblDirectoryItem] PRIMARY KEY CLUSTERED 
(
	[DirectoryItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDirectorySubCategory]    Script Date: 6/4/2020 3:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDirectorySubCategory](
	[DirectorySubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[DirectorySubCategoryName] [nvarchar](50) NOT NULL,
	[DirectoryCategoryId] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDirectorySubCategory] PRIMARY KEY CLUSTERED 
(
	[DirectorySubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDistrict]    Script Date: 6/4/2020 3:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDistrict](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictId_val] [int] NULL,
	[DistrictName] [nvarchar](50) NULL,
	[StateId_val] [int] NULL,
	[DistrictName_Nep] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDistrict] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPalika]    Script Date: 6/4/2020 3:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPalika](
	[PalikaId] [int] IDENTITY(1,1) NOT NULL,
	[PalikaId_val] [int] NOT NULL,
	[DistrictId] [int] NULL,
	[PalikaName] [nvarchar](50) NULL,
	[PalikaName-Nep] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblPalika] PRIMARY KEY CLUSTERED 
(
	[PalikaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblState]    Script Date: 6/4/2020 3:49:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblState](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateId_val] [int] NULL,
	[StateName] [nvarchar](50) NULL,
	[StateName_Nep] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblState] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblDistrict] ON 

INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (1, 1, N'Bhojpur', 1, N'भोजपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (2, 2, N'Dhankuta', 1, N'	धनकुटा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (3, 3, N'Ilam', 1, N'	इलाम')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (4, 4, N'Jhapa', 1, N'	झापा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (5, 5, N'Khotang', 1, N'	खोटाँग')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (6, 6, N'Morang', 1, N'मोरंग ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (7, 7, N'Okhaldhunga', 1, N'ओखलढुंगा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (8, 8, N'Panchthar', 1, N'	पांचथर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (9, 9, N'Sankhuwasabha', 1, N'	संखुवासभा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (10, 10, N'Solukhumbu', 1, N'	सोलुखुम्बू')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (11, 11, N'Sunsari', 1, N'	सुनसरी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (12, 12, N'Taplejung', 1, N'	ताप्लेजुंग')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (13, 13, N'Terhathum', 1, N'	तेह्रथुम')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (14, 14, N'Udayapur', 1, N'उदयपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (15, 15, N'Parsa', 2, N'	पर्सा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (16, 16, N'Bara', 2, N'बारा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (17, 17, N'Rautahat', 2, N'	रौतहट')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (18, 18, N'Sarlahi', 2, N'सर्लाही')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (19, 19, N'Dhanusa', 2, N'धनुषा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (20, 20, N'Siraha', 2, N'सिराहा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (21, 21, N'Mahottari', 2, N'महोत्तरी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (22, 22, N'Saptari', 2, N'सप्तरी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (23, 23, N'Sindhuli', 3, N'सिन्धुली')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (24, 24, N'Ramechhap', 3, N'रामेछाप')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (25, 25, N'Dolakha', 3, N'दोलखा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (26, 26, N'Bhaktapur', 3, N'भक्तपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (27, 27, N'Dhading', 3, N'धादिङ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (28, 28, N'Kathmandu', 3, N'काठमाडौँ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (29, 29, N'Kavrepalanchok', 3, N'काभ्रेपलान्चोक ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (30, 30, N'Lalitpur', 3, N'ललितपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (31, 31, N'Nuwakot', 3, N'नुवाकोट')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (32, 32, N'Rasuwa', 3, N'रसुवा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (33, 33, N'Sindhupalchok', 3, N'सिन्धुपाल्चोक')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (34, 34, N'Chitwan', 3, N'चितवन')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (35, 35, N'Makwanpur', 3, N'मकवानपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (36, 36, N'Baglung', 4, N'बागलुङ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (37, 37, N'Gorkha', 4, N'गोरखा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (38, 38, N'Kaski', 4, N'कास्की')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (39, 39, N'Lamjung', 4, N'लमजुङ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (40, 40, N'Manang', 4, N'मनाङ ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (41, 41, N'Mustang', 4, N'मुस्ताङ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (42, 42, N'Myagdi', 4, N'म्याग्दी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (43, 43, N'Nawalpur', 4, N'नवलपुर')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (44, 44, N'Parbat', 4, N'पर्वत')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (45, 45, N'Syangja', 4, N'स्याङग्जा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (46, 46, N'Tanahun', 4, N'तनहुँ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (47, 47, N'Kapilvastu', 5, N'कपिलवस्तु')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (48, 48, N'Parasi', 5, N'परासी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (49, 49, N'Rupandehi', 5, N'रुपन्देही ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (50, 50, N'Arghakhanchi', 5, N'अर्घाखाँची')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (51, 51, N'Gulmi', 5, N'गुल्मी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (52, 52, N'Palpa', 5, N'पाल्पा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (53, 53, N'Dang Deukhuri', 5, N'दाङ देउखुरी ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (54, 54, N'Pyuthan', 5, N'प्युठान')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (55, 55, N'Rolpa', 5, N'रोल्पा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (56, 56, N'Eastern Rukum', 5, N'पूर्वी रूकुम')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (57, 57, N'Banke', 5, N'बाँके')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (58, 58, N'Bardiya', 5, N'बर्दिया')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (59, 59, N'Western Rukum', 6, N'पश्चिमी रूकुम')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (60, 60, N'Salyan', 6, N'सल्यान')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (61, 61, N'Dolpa', 6, N'डोल्पा')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (62, 62, N'Humla', 6, N'हुम्ला')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (63, 63, N'Jumla', 6, N'जुम्ला')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (64, 64, N'Kalikot', 6, N'कालिकोट ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (65, 65, N'Mugu', 6, N'मुगु')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (66, 66, N'Surkhet', 6, N'सुर्खेत')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (67, 67, N'Dailekh', 6, N'दैलेख')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (68, 68, N'Jajarkot', 6, N'जाजरकोट')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (69, 69, N'Kailali', 7, N'कैलाली ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (70, 70, N'Achham', 7, N'अछाम')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (71, 71, N'Doti', 7, N'डोटी')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (72, 72, N'Bajhang', 7, N'बझाङ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (73, 73, N'Bajura', 7, N'बाजुरा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (74, 74, N'Kanchanpur', 7, N'कंचनपुर ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (75, 75, N'Dadeldhura', 7, N'डडेलधुरा ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (76, 76, N'Baitadi', 7, N'बैतडी ')
INSERT [dbo].[tblDistrict] ([DistrictId], [DistrictId_val], [DistrictName], [StateId_val], [DistrictName_Nep]) VALUES (77, 77, N'Darchula', 7, N'दार्चुला ')
SET IDENTITY_INSERT [dbo].[tblDistrict] OFF
SET IDENTITY_INSERT [dbo].[tblPalika] ON 

INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (1, 1, 1, N'Bhojpur', N'भोजपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (2, 2, 1, N'Shadanand', N'षडानन्द')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (3, 3, 1, N'	Aamchok', N'	आमचोक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (5, 4, 1, N'Tyamke Maiyum', N'ट्याम्केमैयुम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (6, 5, 1, N'	Arun', N'	अरुण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (7, 6, 1, N'Pauwadungma', N'पौवादुङमा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (8, 7, 1, N'	Salpasilichho', N'साल्पासिलिछो')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (9, 8, 1, N'Hatuwagadhi	', N'हतुवागढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (10, 9, 1, N'Ramprasad Rai', N'रामप्रसाद राई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (11, 10, 2, N'Paakhribas', N'पाख्रिबास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (12, 11, 2, N'Dhankuta', N'धनकुटा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (13, 12, 2, N'Mahalaxmi', N'महालक्ष्मी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (14, 13, 2, N'Sangurigadhi', N'सागुरीगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (15, 14, 2, N'	Sahidbhumi', N'	सहीदभूमि')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (16, 15, 2, N'Chhathar Jorpati', N'छथर जोरपाटी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (17, 16, 2, N'	Chaubise', N'चौविसे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (18, 17, 3, N'Iilam', N'ईलाम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (19, 18, 3, N'Deumaai', N'देउमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (20, 19, 3, N'Maai', N'माई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (21, 20, 3, N'Suryodaya', N'सूर्योदय')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (22, 21, 3, N'Phakphokthum', N'फाकफोकथुम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (23, 22, 3, N'Mai Jogmai', N'माईजोगमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (24, 23, 3, N'Chulachuli', N'चुलाचुली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (25, 24, 3, N'Rong', N'रोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (26, 25, 3, N'Mangsebung', N'माङसेबुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (27, 26, 3, N'Sandakpur', N'सन्दकपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (28, 27, 4, N'Mechinagar', N'मेचीनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (29, 28, 4, N'Damak', N'दमक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (30, 29, 4, N'Kankai', N'कन्काई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (31, 30, 4, N'Bhadrapur', N'भद्रपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (32, 31, 4, N'Arjundhara', N'अर्जुनधारा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (33, 32, 4, N'Shivasatakshi', N'शिवसताक्षी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (34, 33, 4, N'Gauraadaha', N'गौरादह')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (35, 34, 4, N'Birtamod', N'विर्तामोड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (36, 35, 4, N'Kamal', N'कमल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (37, 36, 4, N'	Buddha Shanti', N'बुद्धशान्ति')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (38, 37, 4, N'Kachankawal', N'	कचनकवल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (39, 38, 4, N'Jhapa', N'झापा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (40, 39, 4, N'Barhadashi', N'बाह्रदशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (41, 40, 4, N'	Gaurigunj', N'गौरीगंज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (42, 41, 4, N'	Haldibari', N'	हल्दीवारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (43, 42, 5, N'Halesituwanchung', N'हलेसीतुवांचुंग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (44, 43, 5, N'Rupakot Majhuwagadhi', N'रुपाकोट मझुवागढ़ी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (45, 44, 5, N'Khotehang', N'खोटेहाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (46, 45, 5, N'	Diprung', N'दिप्रुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (47, 46, 5, N'	Aiselukharka', N'	ऐसेलुखर्क')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (48, 47, 5, N'Jantedhunga', N'	जन्तेढुंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (49, 48, 5, N'	Kepilasgadhi', N'	केपिलासगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (50, 49, 5, N'	Barahpokhari', N'	बराहपोखरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (51, 50, 5, N'	Lamidanda', N'	लामीडाँडा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (52, 51, 5, N'	Sakela', N'	साकेला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (53, 52, 6, N'Biratnagar', N'विराटनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (54, 53, 6, N'Belbari', N'बेलबारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (55, 54, 6, N'Letang', N'लेटांग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (56, 55, 6, N'Pathari Sanischari', N'पथरी शनिश्चरे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (57, 56, 6, N'Rangeli', N'रंगेली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (58, 57, 6, N'Ratuwamaai', N'रतुवामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (59, 58, 6, N'Sunwarsi', N'सुनवर्षी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (60, 59, 6, N'Urlabari', N'उर्लाबारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (61, 60, 6, N'Sundarharaicha', N'सुन्दरहरैचा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (62, 61, 6, N'Jahada', N'जहदा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (63, 62, 6, N'	Budi Ganga', N'बुढीगंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (64, 63, 6, N'Katahari', N'	कटहरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (65, 64, 6, N'Dhanpalthan', N'धनपालथान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (66, 65, 6, N'Kanepokhari', N'	कानेपोखरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (67, 66, 6, N'	Gramthan', N'	ग्रामथान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (68, 67, 6, N'	Kerabari', N'	केरावारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (69, 68, 6, N'	Miklajung', N'	मिक्लाजुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (70, 69, 7, N'Siddhicharan', N'सिद्दिचरण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (71, 70, 7, N'Manebhanjyang', N'मानेभञ्ज्याङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (72, 71, 7, N'Champadevi', N'चम्पादेवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (73, 72, 7, N'Sunkoshi', N'सुनकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (74, 73, 7, N'Molung', N'मोलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (75, 74, 7, N'Chisankhugadhi', N'चिसंखुगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (76, 75, 7, N'Khiji Demba', N'	खिजिदेम्बा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (77, 76, 7, N'Likhu', N'लिखु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (78, 77, 8, N'Fidim', N'फिदिम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (79, 78, 8, N'Miklajung', N'मिक्लाजुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (80, 79, 8, N'	Phalgunanda', N'फाल्गुनन्द')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (81, 80, 8, N'	Hilihang', N'	हिलिहाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (82, 81, 8, N'Phalelung', N'फालेलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (83, 82, 8, N'Yangwarak', N'याङवरक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (84, 83, 8, N'	Kummayak', N'कुम्मायक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (85, 84, 8, N'Tumbewa', N'तुम्बेवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (86, 85, 9, N'Chainpur', N'चैनपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (87, 86, 9, N'Dharmadevi', N'धर्मदेवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (88, 87, 9, N'Khandwari', N'खांदवारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (89, 88, 9, N'Maadi', N'मादी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (90, 89, 9, N'Panchkhapan', N'पाँचखपन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (91, 90, 9, N'	Makalu', N'मकालु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (92, 91, 9, N'	Silichong', N'सिलीचोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (93, 92, 9, N'Sabhapokhari', N'सभापोखरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (94, 93, 9, N'Chichila', N'चिचिला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (95, 94, 9, N'Bhot Khola', N'भोटखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (96, 95, 10, N'Solududhkunda', N'सोलुदुधकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (97, 96, 10, N'Dudhakaushika', N'	दुधकौशिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (98, 97, 10, N'Necha Salyan', N'नेचासल्यान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (99, 98, 10, N'Dudhkoshi', N'	दुधकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (100, 99, 10, N'Maha Kulung', N'महाकुलुङ')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (101, 100, 10, N'	Sotang', N'	सोताङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (102, 101, 10, N'	Khumbu Pasang Lhamu', N'खुम्बु पासाङल्हमु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (103, 102, 10, N'	Likhu Pike', N'	लिखुपिके')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (104, 103, 11, N'Iitahari', N'ईटहरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (105, 104, 11, N'Dharan', N'धरान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (106, 105, 11, N'Inaruwa', N'इनरुवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (107, 106, 11, N'Duhabi', N'दुहवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (108, 107, 11, N'Ramdhuni', N'रामधुनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (109, 108, 11, N'Baraha', N'बराह')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (110, 109, 11, N'Koshi', N'	कोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (111, 110, 11, N'	Harinagara', N'	हरिनगरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (112, 111, 11, N'	Bhokraha', N'	भोक्राहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (113, 112, 11, N'	Dewanganj', N'	देवानगन्ज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (114, 113, 11, N'	Gadhi', N'गढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (115, 114, 11, N'	Barju', N'	बर्जु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (116, 115, 12, N'Fungling', N'फुंलिंग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (117, 116, 12, N'Sirijangha', N'	सिरीजङ्घा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (118, 117, 12, N'	Aathrai Triveni', N'आठराई त्रिवेणी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (119, 118, 12, N'	Pathibhara Yangwarak', N'	पाथीभरा याङवरक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (120, 119, 12, N'	Meringden', N'	मेरिङदेन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (121, 120, 12, N'	Sidingwa', N'सिदिङ्वा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (122, 121, 12, N'	Phaktanglung', N'	फक्ताङलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (123, 122, 12, N'Maiwa Khola', N'	मैवाखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (124, 123, 12, N'Mikwa Khola', N'	मिक्वाखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (125, 124, 13, N'Myanglung', N'म्यांगलुंग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (126, 125, 13, N'Laligurans', N'लालीगुराँस')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (127, 126, 13, N'Aathrai', N'आठराई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (128, 127, 13, N'	Phedap', N'फेदाप')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (129, 128, 13, N'	Chhathar', N'	छथर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (130, 129, 13, N'	Menchayayem', N'	मेन्छयायेम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (131, 130, 14, N'Katari', N'कटारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (132, 131, 14, N'Chaudandigadhi', N'चौदण्डीगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (133, 132, 14, N'Triyuga', N'त्रियुगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (134, 133, 14, N'Belakaa', N'वेलका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (135, 134, 14, N'Udayapurgadhi', N'उदयपुरगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (136, 135, 14, N'Rautamai', N'रौतामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (137, 136, 14, N'Tapli', N'ताप्ली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (138, 137, 14, N'	Limchungbung', N'लिम्चुङबुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (139, 138, 15, N'Birganj', N'बिरगंज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (140, 139, 15, N'Pokhariya', N'पोखरिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (141, 140, 15, N'Sakhuwa Prasauni', N'	सखुवा प्रसौनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (142, 141, 15, N'	Jagarnathpur', N'	जगरनाथपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (143, 142, 15, N'	Chhipaharmai', N'	छिपहरमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (144, 143, 15, N'Bindabasini', N'बिन्दबासिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (145, 144, 15, N'	Paterwa Sugauli', N'	पटेर्वा सुगौली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (146, 145, 15, N'	Jira Bhavani', N'	जिरा भवानी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (147, 146, 15, N'Kalikamai', N'कालिकामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (148, 147, 15, N'	Pakaha Mainpur', N'पकाहा मैनपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (149, 148, 15, N'Thori', N'ठोरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (150, 149, 15, N'	Dhobini', N'धोबीनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (151, 150, 16, N'Kalaiya', N'कलैया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (152, 151, 16, N'Jitpursimara', N'जितपुरसिमरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (153, 152, 16, N'Kolhavi', N'कोल्हवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (154, 153, 16, N'Nijgadh', N'निजगढ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (155, 154, 16, N'Mahagadhimaai', N'महागढ़ीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (156, 155, 16, N'Simraungadh', N'सिम्रौनगढ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (157, 156, 16, N'Subarna', N'सुवर्ण ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (158, 157, 16, N'	Adarsha Kotwal', N'आदर्श कोतवाल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (159, 158, 16, N'Baragadhi', N'बारागढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (160, 159, 16, N'	Pheta', N'फेटा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (161, 160, 16, N'Karaiyamai', N'करैयामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (162, 161, 16, N'Prasauni', N'प्रसौनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (163, 162, 16, N'Bishrampur', N'विश्रामपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (164, 163, 16, N'Devtal', N'देवताल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (165, 164, 16, N'	Parawanipur', N'परवानीपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (166, 165, 17, N'Chandrapur', N'चंद्रपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (167, 166, 17, N'Garuda', N'गरुडा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (168, 167, 17, N'Gaur', N'गौर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (169, 168, 17, N'Rajpur', N'राजपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (170, 169, 17, N'Paroha', N'परोहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (171, 170, 17, N'Iishnaath', N'ईशनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (172, 171, 17, N'Fatuwabijayapur', N'फतुवाबिजयपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (173, 172, 17, N'Maulapur', N'मौलापुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (174, 173, 17, N'Madhav Narayan', N'माधव नारायण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (175, 174, 17, N'Katahariya', N'कटहरिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (176, 175, 17, N'Gujara', N'गुजरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (177, 176, 17, N'Gadhimaai', N'गढीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (178, 177, 17, N'Durga Bhagwati', N'दुर्गा भगवती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (179, 178, 17, N'Devahi Gonahi', N'देवाही गोनाही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (180, 179, 17, N'Brindavan', N'वृन्दावन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (181, 180, 17, N'Baudhimaai', N'बौधिमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (182, 181, 18, N'Iishworpur', N'ईश्वोरपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (183, 182, 18, N'Malangawa', N'मलंगवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (184, 183, 18, N'Lalbandi', N'लालबन्दी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (185, 184, 18, N'Haripur', N'हरिपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (186, 185, 18, N'Haripurwa', N'हरिपुर्वा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (187, 186, 18, N'Harivan', N'हरिवन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (188, 187, 18, N'Barhathawa', N'बरहथवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (189, 188, 18, N'Balaraa', N'बलरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (190, 189, 18, N'Godaita', N'गोडेटा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (191, 190, 18, N'Bagmati', N'बागमती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (192, 191, 18, N'Bishnu', N'विष्णु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (193, 192, 18, N'	Ramnagar', N'रामनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (194, 193, 18, N'Bramhapuri', N'ब्रह्मपुरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (195, 194, 18, N'Dhankaul', N'धनकौल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (196, 195, 18, N'Chandranagar', N'चन्द्रनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (197, 196, 18, N'Chakraghatta', N'चक्रघट्टा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (198, 197, 18, N'Kabilasi', N'कविलासी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (199, 198, 18, N'Kaudena', N'कौडेना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (200, 199, 18, N'Basbariya', N'बसबरिया')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (201, 200, 19, N'Janakpur', N'जनकपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (202, 201, 19, N'Kshireshwornath', N'क्षिरेश्वरनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (203, 202, 19, N'Ganeshman Chaarnath', N'गणेशमान चारनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (204, 203, 19, N'Dhanushadham', N'धनुषाधाम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (205, 204, 19, N'Nagarain', N'नगराइन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (206, 205, 19, N'Vedeha', N'विदेह')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (207, 206, 19, N'Mithila', N'मिथिला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (208, 207, 19, N'Shahidnagar', N'शहिदनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (209, 208, 19, N'Sabailaa', N'सबैला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (210, 209, 19, N'	Aaurahi', N'औरही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (211, 210, 19, N'Hansapur', N'हंसपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (212, 211, 19, N'Laksminiya', N'लक्ष्मीनिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (213, 212, 19, N'Mukhiyapatti Musaharmiya', N'	मुखियापट्टी मुसहरमिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (214, 213, 19, N'Mithila Bihari', N'मिथिला बिहारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (215, 214, 19, N'	Bateshwar', N'बटेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (216, 215, 19, N'Janak Nandini', N'	जनकनन्दिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (217, 216, 19, N'Kamala Siddhidaatri', N'कमला सिद्धिदत्री')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (218, 217, 19, N'	Dhanauji', N'	धनौजी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (219, 218, 20, N'Lahaan', N'लहान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (220, 219, 20, N'Dhangadhimaai', N'धनगढीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (221, 220, 20, N'Siraha', N'सिरहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (222, 221, 20, N'Golbajar', N'गोलबजार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (223, 222, 20, N'Michaiyan', N'मिचैयाँ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (224, 223, 20, N'Kalyanpur', N'कल्याणपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (225, 224, 20, N'	Bhagawanpur', N'भगवानपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (226, 225, 20, N'Aaurahi', N'	औरही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (227, 226, 20, N'Bishnupur', N'विष्णुपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (228, 227, 20, N'Bariyarpatti', N'बरियारपट्टी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (229, 228, 20, N'Laksmipur Patari', N'लक्ष्मीपुर पतारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (230, 229, 20, N'	Naraha', N'नरहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (231, 230, 20, N'Sakhuwanankarkatti', N'	सखुवानान्कारकट्टी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (232, 231, 20, N'Arnama', N'	अर्नमा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (233, 232, 20, N'Nawarajpur', N'नवराजपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (234, 233, 20, N'Sukhipur', N'सुखीपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (235, 234, 20, N'Karjanha', N'कर्जन्हा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (236, 235, 21, N'Jaleshwor', N'जलेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (237, 236, 21, N'Bardibas', N'बर्दिबास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (238, 237, 21, N'Gaushala', N'गौशाला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (239, 238, 21, N'	Ekdara', N'एकडारा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (240, 239, 21, N'	Sonama', N'सोनमा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (241, 240, 21, N'Samsi', N'साम्सी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (242, 241, 21, N'Loharpatti', N'लोहारपट्टी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (243, 242, 21, N'Ramgopalpur', N'रामगोपालपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (244, 243, 21, N'Mahottari', N'महोत्तरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (245, 244, 21, N'Manara', N'मनरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (246, 245, 21, N'Matihani', N'मटिहानी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (247, 246, 21, N'Bhangaha', N'भंगाहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (248, 247, 21, N'Balawa', N'बलवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (249, 248, 21, N'Pipara', N'पिपरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (250, 249, 21, N'Aaurahi', N'औरही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (251, 250, 22, N'Rajbiraj', N'राजविराज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (252, 251, 22, N'Kanchanrup', N'कन्चंरूप')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (253, 252, 22, N'Daakneshwori', N'डाक्नेश्वरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (254, 253, 22, N'Bodebarsain', N'बोदेबरसाईन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (255, 254, 22, N'Khadak', N'खडक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (256, 255, 22, N'Shambhunath', N'शम्भुनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (257, 256, 22, N'Surunga', N'सुरुङ्गा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (258, 257, 22, N'Hanumannagar kankalini', N'हनुमाननगर कन्कालिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (259, 258, 22, N'Krishnasawaran', N'कृष्णासवरन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (260, 259, 22, N'Chhinnamasta', N'छिन्नमस्ता')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (261, 260, 22, N'Mahadeva', N'महादेवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (262, 261, 22, N'Saptakoshi', N'सप्तकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (263, 262, 22, N'Tirhut', N'	तिरहुत')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (264, 263, 22, N'Tilathi Koiladi', N'तिलाठी कोईलाडी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (265, 264, 22, N'	Rupani', N'रुपनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (266, 265, 22, N'Belhi Chapena', N'बेल्ही चपेना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (267, 266, 22, N'	Bishnupur', N'	बिष्णुपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (268, 267, 22, N'	Aagnisaira Krishnasawaran', N'अग्निसाइर कृष्णासवरन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (269, 268, 22, N'Balan-Bihul', N'	बलान-बिहुल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (270, 269, 23, N'Kamalamaai', N'कमलामाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (271, 270, 23, N'Dudhauli', N'दुधौली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (272, 271, 23, N'	Golanjor', N'गोलन्जोर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (273, 272, 23, N'Ghyanglekh', N'घ्याङलेख')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (274, 273, 23, N'Tinpatan', N'तिनपाटन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (275, 274, 23, N'Phikkal', N'फिक्कल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (276, 275, 23, N'Marin', N'मरिण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (277, 276, 23, N'	Sunkoshi', N'सुनकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (278, 277, 23, N'Hariharpurgadhi', N'हरिहरपुरगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (279, 278, 24, N'Manthali', N'मन्थली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (280, 279, 24, N'Ramechhap', N'रामेछाप')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (281, 280, 24, N'Umakunda', N'उमाकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (282, 281, 24, N'Khandadevi', N'खाँडादेवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (283, 282, 24, N'Gokulganga', N'गोकुलगङ्गा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (284, 283, 24, N'Doramba', N'दोरम्बा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (285, 284, 24, N'Likhu Tamakoshi', N'लिखु तामाकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (286, 285, 24, N'Sunapati', N'सुनापती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (287, 286, 25, N'Jiri', N'जिरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (288, 287, 25, N'Bhimeshwor', N'भीमेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (289, 288, 25, N'Kalinchok', N'कालिन्चोक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (290, 289, 25, N'Gaurishankar', N'गौरिशंकर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (291, 290, 25, N'Tamakoshi', N'तामाकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (292, 291, 25, N'Melung', N'मेलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (293, 292, 25, N'Bigu', N'विगु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (294, 293, 25, N'Baiteshwar', N'वैतेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (295, 294, 25, N'Shailung', N'शैलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (296, 295, 26, N'Changunarayan', N'चाँगुनारायण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (297, 296, 26, N'Bhaktapur', N'भक्तपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (298, 297, 26, N'Madhyapur Thimi', N'मध्यपुर थिमी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (299, 298, 26, N'Suryavinayak', N'सूर्यविनायक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (300, 299, 27, N'Dhunibensi', N'धुनीबेंशी')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (301, 300, 27, N'Nilkantha', N'नीलकण्ठ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (302, 301, 27, N'Khaniyabas', N'खनियाबास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (303, 302, 27, N'Gajuri', N'गजुरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (304, 303, 27, N'Galchhi', N'गल्छी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (305, 304, 27, N'Gangajamuna', N'गङ्गाजमुना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (306, 305, 27, N'Jwalamukhi', N'ज्वालामूखी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (307, 306, 27, N'Thakre', N'थाक्रे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (308, 307, 27, N'Netrawati Dabjong', N'नेत्रावती डबजोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (309, 308, 27, N'Benighat Rorang', N'बेनीघाट रोराङ्ग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (310, 309, 27, N'Ruby Valley', N'रुवी भ्याली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (311, 310, 27, N'Siddhalekh', N'सिद्धलेक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (312, 311, 27, N'Tripura Sundari', N'त्रिपुरासुन्दरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (313, 312, 28, N'Kathmandu', N'काठमाडौँ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (314, 313, 28, N'Kageshwori Manohara', N'कागेश्वरी मनोहरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (315, 314, 28, N'Kirtipur', N'कीर्तिपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (316, 315, 28, N'Gokarneshwor', N'गोकर्णेश्वोर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (317, 316, 28, N'Chandragiri', N'चन्द्रागिरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (318, 317, 28, N'Tokha', N'टोखा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (319, 318, 28, N'Tarkeshwor', N'तार्केश्वोर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (320, 319, 28, N'Dakshinkali', N'दक्षिणकाली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (321, 320, 28, N'Nagarjun', N'नागार्जुन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (322, 321, 28, N'Budhanilkantha', N'बुढानिलकण्ठ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (323, 322, 28, N'Sankharapur', N'शंखारापुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (324, 323, 29, N'Dhulikhel', N'धुलिखेल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (325, 324, 29, N'Banepa', N'बनेपा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (326, 325, 29, N'Panauti', N'पनौती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (327, 326, 29, N'Panchkhal', N'पाँचखाल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (328, 327, 29, N'Namobudha', N'नमोबुद्ध')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (329, 328, 29, N'Khanikhola', N'खानीखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (330, 329, 29, N'Chaunri Deurali', N'चौंरी देउराली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (331, 330, 29, N'Temal', N'तेमाल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (332, 331, 29, N'Bethanchok', N'बेथानचोक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (333, 332, 29, N'Bhumlu', N'भुम्लु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (334, 333, 29, N'Mandandeupur', N'मण्डनदेउपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (335, 334, 29, N'Mahabharat', N'महाभारत')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (336, 335, 29, N'Roshi', N'रोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (337, 336, 30, N'Lalitpur', N'ललितपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (338, 337, 30, N'Godawari', N'गोदावरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (339, 338, 30, N'Mahalaksmi', N'महालक्ष्मी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (340, 339, 30, N'Konjyosom', N'कोन्ज्योसोम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (341, 340, 30, N'Bagmati', N'बाग्मती	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (342, 341, 30, N'Mahankal', N'महाङ्काल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (343, 342, 31, N'Bidur', N'विदुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (344, 343, 31, N'Belkotgadhi', N'बेलकोटगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (345, 344, 31, N'	Kakani', N'ककनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (346, 345, 31, N'Kispang', N'किस्पाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (347, 346, 31, N'Tadi', N'तादी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (348, 347, 31, N'Tarkeshwar', N'तारकेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (349, 348, 31, N'Dupcheshwar', N'दुप्चेश्वर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (350, 349, 31, N'Panchakanya', N'पञ्चकन्या')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (351, 350, 31, N'Likhu', N'लिखु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (352, 351, 31, N'Myagang', N'मेघांग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (353, 352, 31, N'Shivapuri', N'शिवपुरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (354, 353, 31, N'Suryagadhi', N'सुर्यगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (355, 354, 32, N'Uttargaya', N'उत्तरगया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (356, 355, 32, N'Kalika', N'कालिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (357, 356, 32, N'Gosaikund', N'गोसाईकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (358, 357, 32, N'Naukunda', N'नौकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (359, 358, 32, N'Parbatikunda', N'पार्वतीकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (360, 359, 32, N'Aamachodingmo', N'आमाछोदिङमो')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (361, 360, 33, N'Chautara Sangachowkgadhi', N'चौतारा साँगाचोकगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (362, 361, 33, N'Barhabise', N'वाह्रबिसे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (363, 362, 33, N'Melamchi', N'मेलम्ची')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (364, 363, 33, N'Indrawati', N'र्इन्द्रावती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (365, 364, 33, N'Jugal', N'जुगल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (366, 365, 33, N'Panchpokhari Thangpal', N'पाँचपोखरी थाङपाल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (367, 366, 33, N'Balephi', N'बलेफी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (368, 367, 33, N'Bhotekoshi', N'भोटेकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (369, 368, 33, N'	Lisankhu Pakhar', N'लिसंखु पाखर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (370, 369, 33, N'Sunkoshi', N'सुनकोशी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (371, 370, 33, N'	Helambu', N'हेलम्बु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (372, 371, 33, N'Tripura Sundari	', N'	त्रिपुरासुन्दरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (373, 372, 34, N'Bharatpur', N'भरतपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (374, 373, 34, N'Kalika', N'कालिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (375, 374, 34, N'Khairhani', N'खैरहनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (376, 375, 34, N'Madi', N'माडी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (377, 376, 34, N'Ratnnagar', N'रत्ननगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (378, 377, 34, N'Rapti', N'राप्ती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (379, 378, 34, N'	Ichchhakamana', N'इच्छाकामना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (380, 379, 35, N'Hetaunda', N'हेटौंडा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (381, 380, 35, N'Thaha', N'थाहा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (382, 381, 35, N'Indrasarowar', N'ईन्द्र सरोवर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (383, 382, 35, N'Kailash', N'कैलाश')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (384, 383, 35, N'Bakaiya', N'बकैया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (385, 384, 35, N'Bagmati', N'बाग्मती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (386, 385, 35, N'	Bhimphedi', N'भीमफेदी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (387, 386, 35, N'Makawanpurgadhi', N'मकवानपुरगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (388, 387, 35, N'	Manhari', N'मनहरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (389, 388, 35, N'	Raksirang', N'राक्सिराङ्ग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (390, 389, 36, N'Baglung', N'बागलुङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (391, 390, 36, N'Galkot', N'गल्कोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (392, 391, 36, N'Jaimini', N'जैमिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (393, 392, 36, N'Dhorpatan', N'ढोरपाटन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (394, 393, 36, N'Bareng	', N'	वरेङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (395, 394, 36, N'	Kathekhola', N'काठेखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (396, 395, 36, N'Tamankhola', N'तमानखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (397, 396, 36, N'Tarakhola', N'ताराखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (398, 397, 36, N'Nisikhola', N'निसीखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (399, 398, 36, N'Badigad', N'वडिगाड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (400, 399, 37, N'Gorkha', N'गोरखा')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (401, 400, 37, N'Palungtar', N'पालुंगटार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (402, 401, 37, N'	Barpak Sulikot', N'बारपाक सुलीकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (403, 402, 37, N'Siranchok', N'सिरानचोक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (404, 403, 37, N'Ajirkot', N'	अजिरकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (405, 404, 37, N'Aarughat', N'आरूघाट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (406, 405, 37, N'Gandaki', N'गण्डकी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (407, 406, 37, N'	Chum Nubri', N'चुम नुव्री')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (408, 407, 37, N'Dharche', N'धार्चे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (409, 408, 37, N'Bhimsen Thapa', N'भिमसेनथापा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (410, 409, 37, N'Shahid Lakhan', N'शहिद लखन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (411, 410, 38, N'Pokhara Lekhnath', N'पोखरा लेखनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (412, 411, 38, N'Annapurna', N'अन्नपुर्ण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (413, 412, 38, N'Machhapuchhre', N'माछापुछ्रे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (414, 413, 38, N'Madi', N'मादी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (415, 414, 38, N'	Rupa', N'रूपा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (416, 415, 39, N'Besishahar', N'बेसीशहर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (417, 416, 39, N'Madhyanepal', N'मध्यनेपाल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (418, 417, 39, N'Rainas', N'राईनास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (419, 418, 39, N'Sundarbazar', N'सुन्दरबजार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (420, 419, 39, N'Kwaholasothar	', N'	क्व्होलासोथार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (421, 420, 39, N'Dudhpokhari', N'दूधपोखरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (422, 421, 39, N'Dordi', N'दोर्दी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (423, 422, 39, N'Marsyangdi', N'मर्स्याङदी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (424, 423, 40, N'Chame', N'चामे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (425, 424, 40, N'Narpa Bhumi', N'नार्पा भूमी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (426, 425, 40, N'	Nason', N'नासोँ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (427, 426, 40, N'Manang Disyang', N'मनाङ डिस्याङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (428, 427, 41, N'Gharapjhong', N'घरपझोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (429, 428, 41, N'Thasang', N'थासाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (430, 429, 41, N'Lomanthang', N'लोमन्थाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (431, 430, 41, N'Baragung Muktichhetra', N'बारागुङ मुक्तिक्षेत्र')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (432, 431, 41, N'Lo-Ghekar Damodarkunda', N'	लो-घेकर दामोदरकुण्ड')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (433, 432, 42, N'Beni', N'बेनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (434, 433, 42, N'Annapurna', N'अन्नपुर्ण')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (435, 434, 42, N'Dhaulagiri', N'धवलागिरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (436, 435, 42, N'Mangala', N'मंगला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (437, 436, 42, N'Malika', N'मालिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (438, 437, 42, N'Raghuganga', N'रघुगंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (439, 438, 43, N'Kawasoti', N'कावासोती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (440, 439, 43, N'Gaindakot', N'गैंडाकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (441, 440, 43, N'Devchuli', N'देवचुली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (442, 441, 43, N'Bardghat', N'बर्दघाट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (443, 442, 43, N'Madhyabindu', N'मध्यविन्दु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (444, 443, 43, N'Ramgram', N'रामग्राम')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (445, 444, 43, N'Sunbal', N'सुनवल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (446, 445, 43, N'Hupsekot', N'हुप्सेकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (447, 446, 43, N'Sarabal', N'सरावल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (448, 447, 43, N'Binayi Triveni', N'विनयी त्रिवेणी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (449, 448, 43, N'Bulingtar', N'बुलिङटार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (450, 449, 43, N'	Baudikali', N'बौदीकाली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (451, 450, 43, N'Pratappur', N'प्रतापपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (453, 451, 43, N'Palhinandan', N'पाल्हीनन्दन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (454, 452, 43, N'Trivenisusta', N'त्रिवेणीसुस्ता')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (455, 453, 44, N'Kusma', N'कुश्मा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (456, 454, 44, N'Phlaebas', N'फलेवास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (457, 455, 44, N'Jaljala', N'जलजला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (458, 456, 44, N'Painyu', N'	पैयूं')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (459, 457, 44, N'	Mahashila', N'महाशिला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (460, 458, 44, N'Modi', N'मोदी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (461, 459, 44, N'Bihadi', N'विहादी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (462, 460, 45, N'Galyang', N'गलयांग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (463, 461, 45, N'Chapakot', N'चापाकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (464, 462, 45, N'Putalibazar', N'पुतलीबजार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (465, 463, 45, N'Bhirkot', N'भीरकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (466, 464, 45, N'Waling', N'वालिंग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (467, 465, 45, N'Arjun Chaupari', N'अर्जुन चौपारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (468, 466, 45, N'Aandhikhola', N'आँधीखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (469, 467, 45, N'Kaligandaki', N'कालीगण्डकी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (470, 468, 45, N'	Phedikhola', N'फेदीखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (471, 469, 45, N'Biruwa', N'विरुवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (472, 470, 45, N'	Harinas', N'हरीनास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (473, 471, 46, N'Bhanu', N'भानु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (474, 472, 46, N'Bhimad', N'भिमाद')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (475, 473, 46, N'Vyas', N'व्यास')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (476, 474, 46, N'ShuklaGandaki', N'शुक्लागण्डकी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (477, 475, 46, N'Aanbu Khaireni', N'आँबुखैरेनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (478, 476, 46, N'Rishing', N'ऋषिङ्ग')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (479, 477, 46, N'Ghiring', N'घिरिङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (480, 478, 46, N'Devghat', N'देवघाट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (481, 479, 46, N'Myagde', N'म्याग्दे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (482, 480, 46, N'Bandipur', N'बन्दिपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (483, 481, 47, N'Kapilvastu', N'कपिलवस्तु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (484, 482, 47, N'Buddhabhumi', N'बुद्धभुमि')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (485, 483, 47, N'Shivaraj', N'शिवराज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (486, 484, 47, N'Maharajgunj', N'महाराजगंज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (487, 485, 47, N'Krishnanagar', N'कृष्णनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (488, 486, 47, N'Baanganga', N'बाणगंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (489, 487, 47, N'Mayadevi', N'मायादेवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (490, 488, 47, N'Yasodhara', N'यसोधरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (491, 489, 47, N'Shuddhodhan', N'शुद्धोधन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (492, 490, 47, N'Bijaynagar', N'विजयनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (493, 491, 48, N'Triveni Susta', N'त्रिवेणी सुस्ता')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (494, 492, 48, N'Pratappur', N'प्रतापपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (495, 493, 48, N'Sarawal', N'सरावल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (496, 494, 48, N'Palhi Nandan', N'पाल्हीनन्दन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (497, 495, 49, N'Butwal', N'बुटवल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (498, 496, 49, N'Devdaha', N'देवदह')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (499, 497, 49, N'Lumbini sanskritik', N'लुम्बिनी सांस्कृतिक')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (500, 498, 49, N'SainaMaina', N'सैनामैना')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (501, 499, 49, N'Siddarthanagar', N'सिद्दार्थनगर')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (502, 500, 49, N'Tilottama', N'तिलोत्तमा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (503, 501, 49, N'Gaidhawa', N'गैडहवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (504, 502, 49, N'Kanchan', N'कञ्चन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (505, 503, 49, N'Kotahimai', N'कोटहीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (506, 504, 49, N'Marchawarimai', N'	मर्चवारीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (507, 505, 49, N'	Mayadevi', N'	मायादेवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (508, 506, 49, N'Om Satiya', N'	ओमसतीया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (509, 507, 49, N'	Rohini', N'	रोहिणी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (510, 508, 49, N'Sammarimai', N'सम्मरीमाई')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (511, 509, 49, N'	Siyari', N'	सियारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (512, 510, 49, N'Shuddhodhan', N'	शुद्धोधन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (513, 511, 50, N'Sandhikharka', N'सन्धिखर्क')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (514, 512, 50, N'Shitganga', N'शितगंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (515, 513, 50, N'Bhumikasthan', N'भूमिकास्थान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (516, 514, 50, N'	Chhatradev', N'	छत्रदेव')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (517, 515, 50, N'	Pandini', N'पाणिनी	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (518, 516, 50, N'	Malarani', N'	मालारानी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (519, 517, 51, N'Musikot', N'मुसिकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (520, 518, 51, N'Resunga', N'रेसुंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (521, 519, 51, N'	Isma	', N'ईस्मा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (522, 520, 51, N'	Kaligandaki', N'कालीगण्डकी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (523, 521, 51, N'	Gulmi Durbar', N'	गुल्मीदरवार')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (524, 522, 51, N'	Satyawati', N'	सत्यवती	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (525, 523, 51, N'	Chandrakot', N'	चन्द्रकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (526, 524, 51, N'	Ruru', N'	रुरु')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (527, 525, 51, N'	Chhatrakot', N'	छत्रकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (528, 526, 51, N'	Dhurkot', N'	धुर्कोट	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (529, 527, 51, N'Madane	', N'मदाने')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (530, 528, 51, N'	Malika	', N'	मालिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (531, 529, 52, N'Rampur', N'रामपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (532, 530, 52, N'Tansen', N'तानसेन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (533, 531, 52, N'	Nisdi	', N'	निस्दी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (534, 532, 52, N'Purbakhola', N'	पूर्वखोला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (535, 533, 52, N'	Rambha	', N'	रम्भा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (536, 534, 52, N'	Mathagadhi', N'	माथागढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (537, 535, 52, N'	Tinau	', N'	तिनाउ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (538, 536, 52, N'Bagnaskali	', N'	वगनासकाली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (539, 537, 52, N'Ribdikot	', N'रिब्दीकोट	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (540, 538, 52, N'	Rainadevi Chhahara', N'रैनादेवी छहरा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (541, 539, 53, N'Tulsipur', N'तुलसीपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (542, 540, 53, N'Ghorahi', N'घोराही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (543, 541, 53, N'Lamahi', N'लमही')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (544, 542, 53, N'Banglachuli', N'वंगलाचुली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (545, 543, 53, N'	Dangisharan', N'दंगीशरण	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (546, 544, 53, N'	Gadhawa', N'गढवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (547, 545, 53, N'	Rajpur', N'राजपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (548, 546, 53, N'Rapti', N'	राप्ती	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (549, 547, 53, N'Shantinagar', N'	शान्तिनगर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (550, 548, 53, N'Babai', N'बबई	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (551, 549, 54, N'Pyuthan', N'प्युठान')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (552, 550, 54, N'Swargadwari', N'स्वर्गद्वारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (553, 551, 54, N'	Gaumukhi', N'	गौमुखी	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (554, 552, 54, N'Mandavi', N'माण्डवी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (555, 553, 54, N'Sarumarani', N'सरुमारानी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (556, 554, 54, N'Mallarani', N'मल्लरानी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (557, 555, 54, N'Naubahini', N'नौबहिनी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (558, 556, 54, N'Jhimaruk	', N'झिमरुक	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (559, 557, 54, N'Airawati', N'ऐरावती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (560, 558, 55, N'Rolpa', N'रोल्पा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (561, 559, 55, N'Triveni	', N'त्रिवेणी	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (562, 560, 55, N'Duikholi', N'दुइखोली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (563, 561, 55, N'Madi', N'माडी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (564, 562, 55, N'Runtigadhi', N'रुन्टीगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (565, 563, 55, N'Lungri	', N'लुङ्ग्री')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (566, 564, 55, N'Sukidaha', N'सुकिदह')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (567, 565, 55, N'Sunchhahari	', N'सुनछहरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (568, 566, 55, N'Suwarnawati', N'सुबर्णवती')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (569, 567, 55, N'Thawang	', N'थवाङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (570, 568, 56, N'Musikot', N'मुसिकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (571, 569, 56, N'Chaurjahari', N'चौरजहारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (572, 570, 56, N'Aathbiskot', N'आठबिसकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (573, 571, 56, N'Putha Uttarganga', N'पुठा उत्तरगंगा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (574, 572, 56, N'Bhume', N'भूमे')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (575, 573, 56, N'	Sisne', N'सिस्ने')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (576, 574, 57, N'Nepalgunj', N'नेपालगंज')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (577, 575, 57, N'Kohalpur', N'कोहलपुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (578, 576, 57, N'Narainapur	', N'नरैनापुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (579, 577, 57, N'Raptisonari', N'	राप्ती सोनारी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (580, 578, 57, N'Baijnath	', N'वैजनाथ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (581, 579, 57, N'Khajura', N'	खजुरा	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (582, 580, 57, N'Duduwa', N'डुडुवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (583, 581, 57, N'Janaki', N'जानकी	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (584, 582, 58, N'Gulariya', N'गुलरिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (585, 583, 58, N'Madhuvan', N'मधुवन')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (586, 584, 58, N'Rajapur', N'राजापुर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (587, 585, 58, N'Thakurbaba', N'ठाकुरबाबा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (588, 586, 58, N'Bansgadhi', N'बाँसगढी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (589, 587, 58, N'Barbardiya', N'बारबर्दिया')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (590, 588, 58, N'Badhaiyatal', N'बढैयाताल')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (591, 589, 58, N'Geruwa', N'गेरुवा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (592, 590, 59, N'Sani Bheri', N'सानीभेरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (593, 591, 59, N'Tribeni', N'त्रिवेणी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (594, 592, 59, N'Banphikot', N'बाँफिकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (595, 593, 60, N'Sharda', N'शारदा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (596, 594, 60, N'Bagchaur', N'बागचौर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (597, 595, 60, N'Bangad Kupinde', N'बनगाड कुपिन्ड़े')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (598, 596, 60, N'Kalimati', N'कालीमाटी	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (599, 597, 60, N'	Tribeni', N'त्रिवेणी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (600, 598, 60, N'Kapurkot', N'कपुरकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (601, 599, 60, N'	Chhatreshwari', N'छत्रेश्वरी')
GO
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (602, 600, 60, N'Dhorchaur', N'ढोरचौर')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (603, 601, 60, N'Kumakhmalika', N'कुमाखमालिका')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (604, 602, 60, N'Darma', N'दार्मा	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (605, 603, 61, N'Thuli Bheri', N'ठुली भेरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (606, 604, 61, N'Tripurasundari', N'त्रिपुरासुन्दरी')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (607, 605, 61, N'Dolpo Buddha', N'डोल्पो बुद्ध')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (608, 606, 61, N'	She Phoksundo', N'	शे फोक्सुन्डो	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (609, 607, 61, N'Jagadulla', N'जगदुल्ला	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (610, 608, 61, N'Mudkechula	', N'मुड्केचुला')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (611, 609, 61, N'	Kaike', N'काईके')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (612, 610, 61, N'	Chharka Tangsong', N'छार्का ताङसोङ')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (613, 611, NULL, N'Simkot', N'सिमकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (614, 612, 62, N'Namkha', N'नाम्खा')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (615, 613, 62, N'Kharpunath', N'खार्पुनाथ	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (616, 614, 62, N'Sarkegad', N'सर्केगाड	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (617, 615, 62, N'Chankheli	', N'चंखेली')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (618, 616, 62, N'	Adanchuli', N'अदानचुली	')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (619, 617, 62, N'Tanjakot', N'ताँजाकोट')
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (620, 618, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (621, 619, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (622, 620, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (623, 621, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (624, 622, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (625, 623, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (626, 624, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (627, 625, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (628, 626, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (629, 627, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (630, 628, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (631, 629, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (632, 630, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (633, 631, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (634, 632, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (635, 633, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (636, 634, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (637, 635, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (638, 636, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (639, 637, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (640, 638, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (641, 639, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (642, 640, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (643, 641, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (644, 642, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (645, 643, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (646, 644, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (647, 645, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (648, 646, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (649, 647, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (650, 648, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (651, 649, NULL, NULL, NULL)
INSERT [dbo].[tblPalika] ([PalikaId], [PalikaId_val], [DistrictId], [PalikaName], [PalikaName-Nep]) VALUES (652, 650, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblPalika] OFF
SET IDENTITY_INSERT [dbo].[tblState] ON 

INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (1, 1, N'Province 1', N'प्रदेश १')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (2, 2, N'Province 2', N'प्रदेश २')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (3, 3, N'Bagmati', N'बागमती')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (4, 4, N'Gandaki', N'गण्डकी')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (5, 5, N'Province 5', N'प्रदेश ५')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (6, 6, N'Karnali', N'कर्णाली')
INSERT [dbo].[tblState] ([StateId], [StateId_val], [StateName], [StateName_Nep]) VALUES (7, 7, N'Sudurpaschim', N'सुदुरपश्चिम')
SET IDENTITY_INSERT [dbo].[tblState] OFF
ALTER TABLE [dbo].[tblDirectoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblDirectoryDetails_tblDirectoryItem] FOREIGN KEY([DirectoryItemId])
REFERENCES [dbo].[tblDirectoryItem] ([DirectoryItemId])
GO
ALTER TABLE [dbo].[tblDirectoryDetails] CHECK CONSTRAINT [FK_tblDirectoryDetails_tblDirectoryItem]
GO
ALTER TABLE [dbo].[tblDirectoryItem]  WITH CHECK ADD  CONSTRAINT [FK_tblDirectoryItem_tblDirectoryCategory] FOREIGN KEY([DirectoryCategoryId])
REFERENCES [dbo].[tblDirectoryCategory] ([DirectoryCategoryId])
GO
ALTER TABLE [dbo].[tblDirectoryItem] CHECK CONSTRAINT [FK_tblDirectoryItem_tblDirectoryCategory]
GO
ALTER TABLE [dbo].[tblDirectoryItem]  WITH CHECK ADD  CONSTRAINT [FK_tblDirectoryItem_tblDirectorySubCategory] FOREIGN KEY([DirectorySubCategoryId])
REFERENCES [dbo].[tblDirectorySubCategory] ([DirectorySubCategoryId])
GO
ALTER TABLE [dbo].[tblDirectoryItem] CHECK CONSTRAINT [FK_tblDirectoryItem_tblDirectorySubCategory]
GO
ALTER TABLE [dbo].[tblDirectorySubCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblDirectorySubCategory_tblDirectoryCategory] FOREIGN KEY([DirectoryCategoryId])
REFERENCES [dbo].[tblDirectoryCategory] ([DirectoryCategoryId])
GO
ALTER TABLE [dbo].[tblDirectorySubCategory] CHECK CONSTRAINT [FK_tblDirectorySubCategory_tblDirectoryCategory]
GO
ALTER TABLE [dbo].[tblDistrict]  WITH CHECK ADD  CONSTRAINT [FK_tblDistrict_tblDistrict] FOREIGN KEY([StateId_val])
REFERENCES [dbo].[tblState] ([StateId])
GO
ALTER TABLE [dbo].[tblDistrict] CHECK CONSTRAINT [FK_tblDistrict_tblDistrict]
GO
ALTER TABLE [dbo].[tblState]  WITH CHECK ADD  CONSTRAINT [FK_tblState_tblState] FOREIGN KEY([StateId])
REFERENCES [dbo].[tblState] ([StateId])
GO
ALTER TABLE [dbo].[tblState] CHECK CONSTRAINT [FK_tblState_tblState]
GO
USE [master]
GO
ALTER DATABASE [DirectoryBlankDB] SET  READ_WRITE 
GO
