USE [master]
GO
/****** Object:  Database [MaterialAgent]    Script Date: 20.06.2022 10:08:09 ******/
CREATE DATABASE [MaterialAgent]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MaterialAgent', FILENAME = N'C:\asd\MSSQL13.SQLEXPRESS01\MSSQL\DATA\MaterialAgent.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MaterialAgent_log', FILENAME = N'C:\asd\MSSQL13.SQLEXPRESS01\MSSQL\DATA\MaterialAgent_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MaterialAgent] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MaterialAgent].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MaterialAgent] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MaterialAgent] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MaterialAgent] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MaterialAgent] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MaterialAgent] SET ARITHABORT OFF 
GO
ALTER DATABASE [MaterialAgent] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MaterialAgent] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MaterialAgent] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MaterialAgent] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MaterialAgent] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MaterialAgent] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MaterialAgent] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MaterialAgent] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MaterialAgent] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MaterialAgent] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MaterialAgent] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MaterialAgent] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MaterialAgent] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MaterialAgent] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MaterialAgent] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MaterialAgent] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MaterialAgent] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MaterialAgent] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MaterialAgent] SET  MULTI_USER 
GO
ALTER DATABASE [MaterialAgent] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MaterialAgent] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MaterialAgent] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MaterialAgent] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MaterialAgent] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MaterialAgent] SET QUERY_STORE = OFF
GO
USE [MaterialAgent]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [MaterialAgent]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[UnitID] [int] NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 20.06.2022 10:08:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (1, N'Резина 1x3', 3, 1, 77, 44, N'', CAST(8334.00 AS Decimal(10, 2)), N'\materials\material_15.jpeg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (2, N'Краска 2x3', 8, 2, 414, 33, N'', CAST(24447.00 AS Decimal(10, 2)), N'\materials\material_16.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (3, N'Резина 3x3', 8, 3, 727, 46, N'', CAST(42751.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (4, N'Краска 1x4', 9, 3, 576, 7, N'', CAST(52716.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (5, N'Резина 1x37', 8, 3, 110, 47, N'', CAST(1053.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (6, N'Резина 2x0', 3, 1, 129, 11, N'', CAST(46084.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (7, N'Резина 1x14', 5, 1, 7, 9, N'', CAST(17063.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (8, N'Силикон 3x33', 7, 1, 687, 45, N'', CAST(54740.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (9, N'Резина 3x22', 6, 3, 672, 14, N'', CAST(27626.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (10, N'Резина 2x1', 10, 1, 886, 7, N'', CAST(36226.00 AS Decimal(10, 2)), N'\materials\material_13.jpeg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (11, N'Краска 1x2', 9, 2, 801, 28, N'', CAST(48813.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (12, N'Резина 2x3', 9, 1, 50, 11, N'', CAST(52328.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (13, N'Силикон 1x27', 8, 3, 950, 14, N'', CAST(6286.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (14, N'Краска 3x14', 5, 2, 34, 13, N'', CAST(38060.00 AS Decimal(10, 2)), N'\materials\material_8.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (15, N'Краска 2x5', 9, 3, 542, 32, N'', CAST(29855.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (16, N'Силикон 3x15', 7, 3, 856, 17, N'', CAST(40057.00 AS Decimal(10, 2)), N'\materials\material_14.jpeg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (17, N'Силикон 3x39', 9, 1, 858, 8, N'', CAST(31438.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (18, N'Силикон 1x2', 7, 3, 469, 50, N'', CAST(24120.00 AS Decimal(10, 2)), N'\materials\material_19.jpeg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (19, N'Силикон 3x28', 7, 1, 92, 47, N'', CAST(37171.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (20, N'Силикон 0x18', 2, 3, 631, 8, N'', CAST(15243.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (21, N'Силикон 0x0', 5, 3, 929, 37, N'', CAST(17974.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (22, N'Краска 3x31', 3, 2, 365, 32, N'', CAST(30698.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (23, N'Резина 1x5', 2, 1, 481, 11, N'', CAST(42602.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (24, N'Силикон 0x12', 6, 3, 610, 12, N'', CAST(5588.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (25, N'Силикон 3x2', 8, 3, 863, 32, N'', CAST(55673.00 AS Decimal(10, 2)), N'\materials\material_20.jpeg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (26, N'Резина 1x9', 10, 1, 587, 48, N'', CAST(10774.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (27, N'Краска 3x35', 4, 3, 479, 31, N'', CAST(6825.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (28, N'Краска 2x31', 1, 3, 771, 14, N'', CAST(32610.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (29, N'Резина 3x25', 6, 1, 199, 5, N'', CAST(9652.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (30, N'Краска 4x0', 9, 2, 713, 22, N'', CAST(55038.00 AS Decimal(10, 2)), N'\materials\material_9.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (31, N'Краска 2x4', 10, 2, 761, 49, N'', CAST(35636.00 AS Decimal(10, 2)), N'\materials\material_6.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (32, N'Резина 1x0', 10, 1, 459, 22, N'', CAST(469.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (33, N'Краска 3x2', 10, 2, 922, 35, N'', CAST(44456.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (34, N'Краска 3x0', 7, 2, 921, 20, N'', CAST(41707.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (35, N'Краска 2x29', 7, 3, 465, 30, N'', CAST(37812.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (36, N'Силикон 3x14', 7, 1, 324, 19, N'', CAST(38935.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (37, N'Силикон 3x3', 10, 1, 870, 6, N'', CAST(2870.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (38, N'Силикон 3x18', 5, 1, 978, 24, N'', CAST(40196.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (39, N'Резина 3x37', 10, 1, 870, 43, N'', CAST(18158.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (40, N'Краска 0x4', 10, 3, 3, 45, N'', CAST(31475.00 AS Decimal(10, 2)), N'\materials\material_7.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (41, N'Краска 2x1', 4, 2, 2, 5, N'', CAST(48799.00 AS Decimal(10, 2)), N'\materials\material_2.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (42, N'Резина 0x0', 8, 3, 897, 20, N'', CAST(18283.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (43, N'Краска 4x3', 2, 2, 218, 27, N'', CAST(42215.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (44, N'Резина 11x0', 5, 1, 402, 17, N'', CAST(39297.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (45, N'Резина 0x2', 9, 3, 577, 38, N'', CAST(46929.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (46, N'Краска 0x5', 7, 2, 559, 50, N'', CAST(36762.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (47, N'Резина 3x2', 4, 1, 131, 31, N'', CAST(12723.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (48, N'Силикон 1x22', 7, 1, 649, 48, N'', CAST(31182.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (49, N'Краска 2x0', 3, 2, 595, 27, N'', CAST(28464.00 AS Decimal(10, 2)), N'\materials\material_1.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (50, N'Краска 0x2', 9, 2, 235, 15, N'', CAST(20629.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (51, N'Силикон 2x2', 8, 1, 46, 42, N'', CAST(42856.00 AS Decimal(10, 2)), N'\materials\material_3.jpeg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (52, N'Резина 0x13', 6, 3, 376, 48, N'', CAST(54301.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (53, N'Резина 0x78', 3, 3, 593, 48, N'', CAST(38768.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (54, N'Краска 2x2', 2, 2, 787, 16, N'', CAST(45084.00 AS Decimal(10, 2)), N'\materials\material_21.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (55, N'Силикон 0x2', 2, 1, 669, 43, N'', CAST(9098.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (56, N'Резина 0x10', 3, 3, 354, 22, N'', CAST(47481.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (57, N'Резина 3x23', 7, 3, 167, 45, N'', CAST(23578.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (58, N'Резина 2x35', 7, 1, 271, 13, N'', CAST(30798.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (59, N'Силикон 0x3', 1, 1, 117, 21, N'', CAST(4589.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (60, N'Резина 2x2', 3, 1, 851, 7, N'', CAST(44820.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (61, N'Краска 0x3', 2, 3, 646, 5, N'', CAST(8487.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (62, N'Резина 0x12', 1, 3, 380, 13, N'', CAST(14110.00 AS Decimal(10, 2)), N'\materials\material_4.jpeg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (63, N'Краска 3x27', 3, 3, 568, 37, N'', CAST(14606.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (64, N'Резина 2x27', 6, 1, 434, 32, N'', CAST(47429.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (65, N'Силикон 0x28', 8, 1, 144, 34, N'', CAST(43526.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (66, N'Резина 1x1', 2, 1, 244, 43, N'', CAST(8906.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (67, N'Резина 0x30', 1, 1, 143, 48, N'', CAST(21180.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (68, N'Силикон 0x23', 9, 1, 753, 10, N'', CAST(9412.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (69, N'Силикон 2x13', 3, 1, 423, 5, N'', CAST(19429.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (70, N'Резина 0x3', 6, 1, 340, 16, N'', CAST(11310.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (71, N'Краска 4x04', 9, 3, 657, 25, N'', CAST(54177.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (72, N'Резина 1x32', 9, 1, 709, 45, N'', CAST(36799.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (73, N'Силикон 1x1', 1, 3, 110, 10, N'', CAST(10649.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (74, N'Резина 3x1', 6, 1, 713, 27, N'', CAST(24002.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (75, N'Резина 0x65', 1, 1, 133, 34, N'', CAST(9263.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (76, N'Силикон 0x11', 9, 1, 465, 11, N'', CAST(34946.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (77, N'Краска 0x0', 8, 2, 318, 28, N'', CAST(35754.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (78, N'Краска 2x24', 2, 3, 797, 23, N'', CAST(26008.00 AS Decimal(10, 2)), N'\materials\material_22.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (79, N'Краска 0x1', 7, 2, 228, 14, N'', CAST(13666.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (80, N'Резина 3x38', 10, 1, 892, 9, N'', CAST(11039.00 AS Decimal(10, 2)), N'\materials\material_17.jpeg', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (81, N'Резина 3x28', 8, 3, 395, 43, N'', CAST(54007.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (82, N'Краска 3x18', 10, 2, 128, 5, N'', CAST(20504.00 AS Decimal(10, 2)), N'\materials\material_10.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (83, N'Силикон 0x1', 3, 3, 401, 9, N'', CAST(29767.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (84, N'Краска 1x0', 5, 3, 12, 49, N'', CAST(51511.00 AS Decimal(10, 2)), N'\materials\material_18.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (85, N'Краска 3x1', 3, 3, 729, 21, N'', CAST(10299.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (86, N'Силикон 3x0', 9, 3, 901, 48, N'', CAST(23681.00 AS Decimal(10, 2)), N'\materials\material_5.jpeg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (87, N'Силикон 3x35', 2, 1, 610, 32, N'', CAST(3326.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (88, N'Краска 1x1', 2, 2, 281, 20, N'', CAST(19485.00 AS Decimal(10, 2)), N'\materials\material_11.jpeg', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (89, N'Силикон 2x17', 1, 3, 409, 16, N'', CAST(12158.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (90, N'Резина 0x1', 3, 1, 986, 18, N'', CAST(24135.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (91, N'Силикон 3x1', 9, 1, 16, 17, N'', CAST(33602.00 AS Decimal(10, 2)), N'\materials\material_12.jpeg', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (92, N'Силикон 2x1', 6, 1, 461, 13, N'', CAST(19352.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (93, N'Резина 0x37', 9, 1, 764, 26, N'', CAST(33541.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (94, N'Силикон 3x37', 9, 3, 680, 41, N'', CAST(489.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (95, N'Краска 5x0', 10, 2, 844, 24, N'', CAST(43028.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (96, N'Резина 3x34', 4, 1, 218, 47, N'', CAST(42162.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (97, N'Краска 3x13', 3, 2, 851, 6, N'', CAST(41211.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (98, N'Краска 3x4', 5, 2, 83, 41, N'', CAST(21211.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (99, N'Краска 1x3', 6, 2, 91, 50, N'', CAST(46354.00 AS Decimal(10, 2)), NULL, 2)
GO
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (100, N'Краска 2x28', 4, 2, 916, 42, N'', CAST(9273.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (105, N'xas', 123, 3, NULL, 123, NULL, CAST(123.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [UnitID], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (106, N'gfd', 123, 1, NULL, 123, NULL, CAST(13.00 AS Decimal(10, 2)), NULL, 3)
SET IDENTITY_INSERT [dbo].[Material] OFF
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (1, 11)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (2, 7)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (2, 22)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (2, 26)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (3, 29)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (5, 33)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (5, 49)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (7, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (7, 20)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (7, 50)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (10, 1)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (10, 6)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (10, 19)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (10, 28)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (11, 5)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (11, 10)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (11, 14)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (14, 20)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (14, 36)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (14, 47)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (16, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (18, 2)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (18, 7)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (18, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (18, 19)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (24, 45)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (25, 12)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (25, 19)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (25, 39)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (28, 47)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (30, 37)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (30, 48)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (30, 49)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (31, 17)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (31, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (32, 11)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (32, 35)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (33, 34)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (36, 14)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (36, 32)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (36, 37)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (37, 46)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (38, 27)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (41, 21)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (41, 25)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (41, 33)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (41, 43)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (44, 2)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (44, 6)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (44, 17)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (44, 47)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (44, 48)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (47, 5)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (47, 42)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (49, 31)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (49, 39)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (54, 41)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (54, 44)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (55, 38)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (57, 33)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (57, 47)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (66, 23)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (66, 26)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (66, 31)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (70, 4)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (71, 50)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (72, 50)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (73, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (73, 29)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (73, 31)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (74, 1)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (78, 45)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (78, 50)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (80, 49)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (82, 7)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (82, 42)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (82, 45)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (83, 38)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (84, 5)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (84, 8)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (84, 26)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (84, 27)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (84, 40)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (86, 6)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (86, 11)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (86, 25)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (86, 27)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (86, 37)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (86, 40)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (88, 30)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (90, 1)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (91, 4)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (91, 31)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (92, 16)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (92, 26)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (92, 35)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (92, 47)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (92, 48)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (100, 14)
INSERT [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES (100, 49)
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'Резина', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Краска', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Силикон', NULL)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (1, N'ГаражТелекомГор', N'1718185951', CAST(N'2018-11-26' AS Date), 18, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (2, N'Компания Омск', N'1878504395', CAST(N'2012-05-10' AS Date), 49, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (3, N'ГорМонтаж', N'1564667734', CAST(N'2013-07-10' AS Date), 39, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (4, N'Микро', N'2293562756', CAST(N'2014-07-15' AS Date), 25, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (5, N'Электро', N'1755853973', CAST(N'2012-05-14' AS Date), 43, N' ЗАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (6, N'Компания Мотор', N'1429908355', CAST(N'2010-09-16' AS Date), 85, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (7, N'Асбоцем', N'1944834477', CAST(N'2012-09-07' AS Date), 23, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (8, N'ВостокМети', N'1488487851', CAST(N'2019-04-08' AS Date), 51, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (9, N'МясКрепТеле', N'2152486844', CAST(N'2013-03-17' AS Date), 78, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (10, N'Софт', N'1036521658', CAST(N'2017-10-13' AS Date), 84, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (11, N'Компания СервисМикроО', N'1178826599', CAST(N'2013-04-14' AS Date), 27, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (12, N'ИнфоГазМотор', N'1954050214', CAST(N'2011-02-10' AS Date), 92, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (13, N'Монтаж', N'1163880101', CAST(N'2019-06-01' AS Date), 66, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (14, N'ЭлектроХром', N'1654184411', CAST(N'2014-08-17' AS Date), 13, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (15, N'Компания НефтьITИнф', N'1685247455', CAST(N'2014-09-26' AS Date), 56, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (16, N'ТомскНефть', N'1002996016', CAST(N'2010-01-13' AS Date), 44, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (17, N'ТомскТяжРеч', N'1102143492', CAST(N'2010-09-11' AS Date), 59, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (18, N'УралХме', N'2291253256', CAST(N'2010-06-15' AS Date), 40, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (19, N'ВодРыб', N'1113468466', CAST(N'2016-09-20' AS Date), 38, N' ЗАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (20, N'УралСервисМон', N'1892306757', CAST(N'2015-04-22' AS Date), 77, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (21, N'Казань', N'1965011544', CAST(N'2017-04-21' AS Date), 77, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (22, N'Cиб', N'1949139718', CAST(N'2010-10-26' AS Date), 89, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (23, N'ГаражГазМ', N'1740623312', CAST(N'2017-10-07' AS Date), 99, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (24, N'МобайлДизайнОмск', N'1014490629', CAST(N'2011-05-10' AS Date), 99, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (25, N'ЖелДорГаз', N'1255275062', CAST(N'2017-09-07' AS Date), 25, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (26, N'ТверьБухГаз', N'2167673760', CAST(N'2014-03-26' AS Date), 54, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (27, N'ТелекомТранс', N'2200735978', CAST(N'2019-02-17' AS Date), 87, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (28, N'ГаражГлав', N'1404774111', CAST(N'2014-11-20' AS Date), 1, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (29, N'Компания К', N'1468114280', CAST(N'2014-08-09' AS Date), 54, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (30, N'ТяжЛифтВостокС', N'1032089879', CAST(N'2018-03-01' AS Date), 70, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (31, N'Компания Во', N'2027005945', CAST(N'2014-04-08' AS Date), 23, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (32, N'МоторКаз', N'1076279398', CAST(N'2015-08-27' AS Date), 37, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (33, N'Сервис', N'2031832854', CAST(N'2014-03-11' AS Date), 5, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (34, N'ЮпитерТомс', N'1551173338', CAST(N'2010-06-05' AS Date), 11, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (35, N'Мор', N'1906157177', CAST(N'2010-10-14' AS Date), 38, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (36, N'СеверТехВостокЛизинг', N'1846812080', CAST(N'2010-12-26' AS Date), 34, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (37, N'ЦементОбл', N'2021607106', CAST(N'2012-11-14' AS Date), 46, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (38, N'Компания КазаньАвтоCиб', N'1371692583', CAST(N'2010-04-16' AS Date), 72, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (39, N'ГаражХозФлот', N'2164720385', CAST(N'2019-01-03' AS Date), 19, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (40, N'Компания МорМетал', N'1947163072', CAST(N'2010-02-25' AS Date), 93, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (41, N'ГлавРыб', N'1426268088', CAST(N'2013-12-07' AS Date), 59, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (42, N'CибCибОрио', N'1988313615', CAST(N'2019-02-22' AS Date), 1, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (43, N'ТелеРыбХм', N'2299034130', CAST(N'2019-02-21' AS Date), 51, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (44, N'ГлавАвтоГазТрест', N'2059691335', CAST(N'2013-07-17' AS Date), 28, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (45, N'ТяжКазаньБашкир', N'1794419510', CAST(N'2016-06-01' AS Date), 55, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (46, N'Асбоцемент', N'1650212184', CAST(N'2018-12-08' AS Date), 32, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (47, N'Мотор', N'1019917089', CAST(N'2017-09-09' AS Date), 59, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (48, N'МорФинансФинансМаш', N'1549496316', CAST(N'2016-04-15' AS Date), 50, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (49, N'РыбВектор', N'2275526397', CAST(N'2010-11-25' AS Date), 72, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (50, N'Теле', N'2170198203', CAST(N'2010-04-13' AS Date), 96, N' ПАО')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([ID], [Title]) VALUES (1, N'м')
INSERT [dbo].[Unit] ([ID], [Title]) VALUES (2, N'л')
INSERT [dbo].[Unit] ([ID], [Title]) VALUES (3, N'кг')
SET IDENTITY_INSERT [dbo].[Unit] OFF
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Unit]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [MaterialAgent] SET  READ_WRITE 
GO
