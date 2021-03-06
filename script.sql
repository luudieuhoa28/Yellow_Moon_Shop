USE [master]
GO
/****** Object:  Database [YellowMoonShop]    Script Date: 10/14/2020 2:31:07 PM ******/
CREATE DATABASE [YellowMoonShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YellowMoonShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEPRESS\MSSQL\DATA\YellowMoonShop.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'YellowMoonShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEPRESS\MSSQL\DATA\YellowMoonShop_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [YellowMoonShop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YellowMoonShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YellowMoonShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YellowMoonShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YellowMoonShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YellowMoonShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YellowMoonShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YellowMoonShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YellowMoonShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YellowMoonShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YellowMoonShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YellowMoonShop] SET RECOVERY FULL 
GO
ALTER DATABASE [YellowMoonShop] SET  MULTI_USER 
GO
ALTER DATABASE [YellowMoonShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YellowMoonShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YellowMoonShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YellowMoonShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [YellowMoonShop]
GO
/****** Object:  Table [dbo].[Cake]    Script Date: 10/14/2020 2:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cake](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[imagePath] [nvarchar](50) NULL,
	[description] [nvarchar](300) NULL,
	[price] [decimal](18, 2) NULL,
	[createDate] [datetime] NULL,
	[exprirationDate] [datetime] NULL,
	[categoryId] [int] NULL,
	[quantity] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Cake] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/14/2020 2:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/14/2020 2:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderId] [int] NOT NULL,
	[cakeId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC,
	[cakeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/14/2020 2:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [nvarchar](50) NOT NULL,
	[time] [datetime] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[customerName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/14/2020 2:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UpdateDetail]    Script Date: 10/14/2020 2:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdateDetail](
	[userId] [nvarchar](50) NOT NULL,
	[cakeId] [int] NOT NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_UpdateDetail] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[cakeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/14/2020 2:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[roleId] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cake] ON 

INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (14, N'Dainty Black Forest Cake', N'choco-black-forest-cake-cake888blac-A.jpg', N'Are you cakeoholic? The chocolate shavings of this dainty black forest cake make it forgiving for those who...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (15, N'Extravagant Truffle Cake', N'choco-truffle-cake-2-cake896choc-A.jpg', N'If you are a chocoholic then you must try this extravagant truffle cake. Our signature truffle cake is the...', CAST(529.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (16, N'Fuse Fiesta', N'snicker-chocolate-cake-A.jpg', N'Award yourself with this rich chocolate cake wonderfully crammed with Cadbury Fuse and white chocolate chunks...', CAST(599.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (17, N'Ebony And Ivory', N'chocolate-vanilla-cake-A.jpg', N'A toothsome treat for the sugar lovers who are just passionate about chocolate and relish the mushiness of...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (18, N'Chocoholick Delight', N'belgium-chocolate-cake-cake818mang-D.jpg', N'A swirl for chocoholics! This hypnotizing delight is dense, soft, and can trigger the taste buds like never...', CAST(649.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (19, N'The Original B.F.', N'black-forest-cake-A.jpg', N'We kept this Classic cake untouched and unblemished because we feel it''s perfect as it is. Baked with the...', CAST(429.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (20, N'Choco-Thrill', N'chocolate-mud-cake-A.jpg', N'A true classic and dominant cake that is sure to gratiate your taste buds! Made with three layers of mushy...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (21, N'The Chocolateria', N'couverture-chocolate-cake-cake816mang-C.jpg', N'Nine out of ten people love the ecstasy spread and felt by a single piece of a chocolate cake. To make the...', CAST(749.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (22, N'Delectable Truffle', N'chocolate-truffle-cake-A.jpg', N'The heavenly taste of this Choco Truffle Cake will even leave the hardest-to-please chocolate addicts tranquil...', CAST(449.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (23, N'Chocolate Orange Delight', N'chocolate-cake-2-cake0749flav-A.jpg', N'This incredible baked chocolate-orange cake is sure to be the star of your dessert table this Christmas....', CAST(749.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (24, N'Choco Tranquiizer', N'round-shaped-chocolate-cake-4-cake0656choc-A.jpg', N'Love is the most beautiful feeling of all. The decadent taste of this sumptuous cake easily read the...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (26, N'German Gateau', N'german-black-forest-cake-A.jpg', N'Relish the rich taste of the Original German Chocolate Fantasy! Made from the finest cocoa, delectable...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (27, N'Sweetest Appeal', N'round-shaped-choco-walnut-cake-cake0648choc-A.jpg', N'Indulge your dessert loving soul in this finger-licking, moist and crunchy overload of walnuts chocolate round...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (28, N'Amore Mio', N'double-heart-choco-truffle-cake-A.jpg', N'The irresistible taste of this rich delicacy will leave you feeling overwhelmed. With ganache glaze and a...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (30, N'Toothsome Choco Vanilla Cake', N'choco-vanilla-cake-2-cake893chva-A.jpg', N'Your dessert of the day exquisite choco vanilla cake. Yes, you can have both at the same time. You won''t know...', CAST(529.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (32, N'Chocolacious Bliss', N'round-shaped-chocolate-cake-1-cake0653choc-A.jpg', N'A true chocolate lover knows how indomitable the cravings can be when it comes to enjoying a decadent...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (33, N'Choco-Scotch Sensation', N'chocolate-butterscotch-cake-A.jpg', N'This lovely crunch cake is one enticing sweet course! Prepared with three cream-filled layers of mushy cake...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (34, N'Magical Moments', N'red-velvet-choco-coffee-cake-for-A.jpg', N'This deliciously creamy temptation has a perfect blend of everything to beat both Chocolate and Coffee...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (35, N'Heart-licious Pleasure', N'heart-shaped-choco-vanilla-cake-A.jpg', N'This lusciously rich, moist, and decadent three layer cake is a FANTASY COME TRUE. Each slice will serve/bring...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (36, N'Luscious Chocoberry', N'chocolate-strawberry-cake-A.jpg', N'Every piece of this delicious delight is like tasting a serving from heaven. The two layers of strawberry rich...', CAST(525.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (37, N'Twisted B.F.Tale', N'5-star-cake-A.jpg', N'The classic Black Forest has reached another level of indulgence with sweet chunks of 5-Star loaded on the top...', CAST(550.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (38, N'Oh Chocoholix', N'couverture-chocolate-square-cake-cake819mang-A.jpg', N'Absolutely luscious and pipped with palatable chocolate roses, this decadence spreads a sweet and crunchy...', CAST(749.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (39, N'Choco Drizzle', N'chocolate-chip-cake-A.jpg', N'Bow down to the lusciously creamy overdose of chocolate! Made of three layers of mushy chocolate cake and...', CAST(500.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (40, N'Choco-Nutty-Licious', N'chocolate-nut-cake-A.jpg', N'We simply call it the Most-Wanted Cake because it tastes that good! This three-layered soft and moist cake is...', CAST(600.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (41, N'Dark Magic', N'choco-truffle-heart-shape-cake-A.jpg', N'Each bite of this three-layered Chocolate Truffle Cake will take you further into its velvety abyss of...', CAST(799.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (42, N' Exquisite Chocolate Gateau ', N'chocolate-light-cake-A.jpg', N'Ever thought of a cake being so good that you would not be able to get enough of it? Well, this cake is all...', CAST(550.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (43, N'Classic One', N'classic-one-cake0364chtr-310118-A.jpg', N'If you feel that your heart simply belongs to no one else but them, this cake is sure to explicitly convey to...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 0, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (44, N'Delish Brown Vegan', N'black-forest-vegan-cake-cake920blac-A.jpg', N'Try our range of vegan cakes this time on any event and occasion and you are sure to experience the sweetest...', CAST(749.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (45, N'Personalised Anniversary Cake', N'anniversary-photo-cake-phot1050flav-A.jpg', N'This classic moist and delicious cake has layers beneath the whipped cream filled with buttercream. Aston your...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (46, N'Swirling Vegan Coffee', N'coffee-vegan-cake-cake921coff-A.jpg', N'This one particular flavor is for those who prefer coffee over tea and coffee-flavored cake over chocolate...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (47, N'Hues Of Love', N'Hues Of Love-2018-02-11-A.jpg', N'The deliciousness of red velvet has been baked into the shape of a heart that resembles your sheer love and...', CAST(749.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (48, N'Celestial Beauty', N'celestial-beauty-phot0271flav-301217-A.jpg', N'', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (49, N'Fruitful Velvety Vegan', N'red-velvet-vegan-cake-cake925redv-A.jpg', N'The zest of a red velvet fruit cake is unbeatable. Enriched with red velvet shavings, this cake is topped with...', CAST(749.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (50, N'Eternal Berry Love', N'eternal-berry-love-cake0368stra-310118-A.jpg', N'Treat them so good this Valentine''s that they forget all fights and fall in love in every bite! Dipped in the...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (51, N'Square Photo Cake', N'square-photo-cake-A.jpg', N'Get this luscious cake customized according to your celebration needs. This yummy cake is not any occasioned...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (52, N'Butterscotch Delight', N'butterscotch-cake-A.jpg', N'Always and Forever Delight! This three layered moist and smooth cake filled with butterscotch chips and...', CAST(429.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (53, N'Vegan Vanilla', N'vanilla-vegan-cake-cake923vani-A.jpg', N'Covered in lovely light vanilla buttercream and finished with chocolate waffles, this vegan vanilla cake is...', CAST(599.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (54, N'Imperfectly Perfect', N'imperfectly-perfect-phot0276flav-301217-A.jpg', N'Present this delightful cake to your significant other and show your love to them and also let them know how...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (55, N'Succulent Vegan Pineapple', N'pineapple-vegan-cake-cake924pine-A.jpg', N'The all-time favorite succulent pineapple cake is a rational choice when it comes to buying a cake for any and...', CAST(599.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (56, N'Cuteness Overload', N'cuteness-overload-phot0273flav-301217-A.jpg', N'Wish a happy birthday to pati, patni, mummy, papa, bhai, behan with this delicious photo cake. Get the best...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (57, N'Birthday Exuberance', N'birthday-exuberance-phot0275flav-301217-A.jpg', N'Birthday comes only once in a year and is celebrated with loads of gifts, lovely people, but is incomplete...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (58, N'Red Infatuation', N'red-velvet-cake-A.jpg', N'This one is a southern classic! With a mild white chocolate flavour and extremely mushy layers, you just...', CAST(599.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (59, N'Pineapple Classique', N'pineapple-cake-A.jpg', N'This cake is meant for all celebratory occasions! This three layered delicious pineapple flavoured cake filled...', CAST(399.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (60, N'Luscious Blueberry Cake', N'blueberry-cake-1-cake889blue-A.jpg', N'The all-new luscious blueberry cake has made its mark as an all-time favorite across the households. This cake...', CAST(629.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (64, N'What Was, Still Is', N'what-was-still-is-phot0281flav-301217-A.jpg', N'Do something unexpectedly sweet for your better half. Wondering how? Well, surprise them with this deliciously...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (65, N'Perfect Photo Cake', N'perfect-photo-cake-phot0272flav-301217-A.jpg', N'Surprise the perfectionist in your life with this perfect photo cake on their birthday and a little more...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (66, N'Picture Perfect', N'picture-perfect-phot0267flav-301217-A.jpg', N'Let your near and dear ones feel special on their birthday by gifting this customizable photo cake with...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (68, N'Pink Heaven', N'strawberry-rose-cake-A.jpg', N'This toothsome strawberry rose is a divine three-layered dessert filled with rich strawberry cream and crushed...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (70, N'Imploding Beauty', N'imploding-beauty-cake0371redv-310118-A.jpg', N'Gift your Valentine with a cupid-approved red velvet heart cake. A cake of sweet indulgence, it is sure to...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (71, N'Love Birds', N'love-birds-phot0285flav-301217-A.jpg', N'So, it''s your wedding day! The day when you two vowed to be "one." That special day has arrived and to make...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (72, N'Sweetest Hug', N'sweetest-hug-phot0279flav-301217-A.jpg', N'Relive the immemorable memories of love and laughter, this anniversary! Delight their taste buds by sending...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (73, N'Avenger Hero', N'Avengers Poster Cake 1-B.jpg', N'Through this poster cake, tell your friend who presides over the Marvel fandom that when all is said and done,...', CAST(649.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (77, N'Luxurious Fantasy', N'red-velvet-fruit-cake-A.jpg', N'An exceptionally creamy Open-layered Red Velvet cake with a topping that tastes like a MASH UP between the...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (78, N'Butterscotch Obsession', N'round-shaped-butterscotch-cake-4-cake892butt-A.jpg', N'Your next obsession the scrumptious butterscotch cake. The universal cake which is present in almost a...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (80, N'Vanilla Retreat', N'round-shaped-vanilla-cake-4-cake904vani-D.jpg', N'If you are spoiled with so many choices then the vanilla cake is the way to go. Perfect for any occasion be it...', CAST(379.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (82, N'Torrid Affair', N'heart-shaped-black-forest-vanilla-cake-A.jpg', N'The chocolate and vanilla blend beautifully in texture, yet pleasantly contrast in color and flavor. Watch...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (83, N'Two In One Cake', N'strawberry-vanilla-cake-cake895stva-A.jpg', N'No worries if you like strawberry or vanilla we have got both in one. This two in one cake is specially baked...', CAST(529.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (84, N'Scrumptious Blueberry Cake', N'blueberry-cake-2-cake890blue-A.jpg', N'Who doesn''t love the sheer beauty of an extravagant blueberry cake? We all do. If you are on the lookout for a...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (85, N'GOT Insanity', N'game-of-thrones-cake-2-phot761flav-D (2).jpg', N'Know someone who is living for the upcoming episode of Game OF Thrones? Make their evening eventful by gifting...', CAST(649.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (88, N'Sketch of My Queen', N'sketch-of-my-queen-phot0360flav-310118-A.jpg', N'She makes you happy in a way no one else can. Right? Now, it''s time to make her feel the happiest by gifting...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (89, N'Delectable Blueberry Cake', N'blueberry-cake-3-cake891blue-B.jpg', N'Dive in the ocean of scrumptious blueberry sauce and whipped cream. Layer by layer of whipped cream, blueberry...', CAST(599.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (93, N'Swirling In The Air', N'swirling-in-the-air-phot0290flav-301217-A.jpg', N'Every one of us has a box full of memories, which has kept our naughtiness and our childhood, safe. Yes, you...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (95, N'Star Of The Universe', N'star-of-the-universe-phot0292flav-301217-A.jpg', N'There are not many moments in life when everyone deserves a PAT on his/her shoulders. But, whatsoever occasion...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (96, N'Fruit Fully Yours', N'heart-shaped-fruit-cake-2-cake0741frui-A_0.jpg', N'This succulently sweet heart-shaped fruit cake offers you three layers of luscious seasonal fruits on the top....', CAST(1099.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (97, N'Trip To Paradise', N'round-shaped-choco-chip-cake-cake0647choc-A.jpg', N'Can you name a person who doesn’t love the finger licking taste of a chocolate cake? Well, it’s almost...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (98, N'Soulmate Love', N'soulmate-love-phot0282flav-301217-A.jpg', N'Soulmates are the best person available on this Earth. They are exclusively ours and can never be replaced by...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (99, N'The Greatest Joy Photo Cake', N'2018-06-06.jpg', N'Nothing can ever replace birthdays with any other occasion, in this world. So, how about getting this photo...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (100, N'Ambrosial Pineapple', N'pineapple-round-shaped-cake-5-cake905pine-D.jpg', N'If any important occasion or event is coming up why not consider taking a mouth-watering vanilla cake with...', CAST(449.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (101, N'Celebratory Swirls', N'white-polka-cream-cake-cake0752flav-A.jpg', N'Stir sweetness on their special day with swirls of happiness and deliciousness. Embossed with intricate swirls...', CAST(599.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (113, N'Love Blossomed ', N'heart-shape-photo-cake-phot0727flav-A.jpg', N'Deliciously rich in flavors, this heart-shaped photo cake has been baked with utmost love by our skilled...', CAST(799.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (114, N'Coconut Craziness', N'coconut-cake-cake0693coco-A.jpg', N'This sumptuous cake has been baked with fresh shredded coconuts and rich vanilla cream. With three mushy...', CAST(599.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (115, N'Shades Of Love', N'strawberry-heart-shaped-cake-2-cake0644hstr-A.jpg', N'Here is presenting you this scrumptious heart-shaped cake enriched with luscious strawberry. Decorated...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (116, N'Ecstatically Delicious', N'pineapple-round-shaped-cake-4-cake0634pine-B.jpg', N'A perfect delicacy to make your special occasions brighter. Enriched with luscious pineapple fillings, this...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (122, N'One And Only', N'one-and-only-phot0287flav-301217-A.jpg', N'Change the way to say congratulations; say it with more sweetness now. Surprise your loved ones with this...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (124, N'Floral Beauty Cake', N'floral-beauty-cake-phot0288flav-301217-A.jpg', N'Celebrate all the special moments in life with something as awesome and as delicious as this Floral Beauty...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (125, N'Bandeau Love', N'bandeau-love-phot0289flav-301217-A.jpg', N'Say Congratulations to your loved ones with this personalised photo cake on achieving something. Make them...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (126, N'Colorful Confetti Love', N'colorful-confetti-love-phot0291flav-301217-A.jpg', N'Congratulate the special ones in the best and sweetest way you can. Surprise them with a delicious cake. To...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (127, N'Wrapped In Love', N'wrapped-in-love-phot0293flav-301217-A.jpg', N'Your colleague/friend got promoted at work? Or your dear ones got married? Well, whatever the occasion is,...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (129, N'Tiramisu Cheese Cake', N'tiramisu-cheese-cake-A.jpg', N'Have you ever wondered what ''Delicious'' looks like in real? Take a look at this cheesecake and we bet, you...', CAST(899.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (130, N'Kiwi-Licious', N'kiwi-fruit-cake-A.jpg', N'Coming up with one of the finest tastes, this is going to make your taste buds climb up to an unforgettable...', CAST(600.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (131, N'Blue Berry Bonanza "3B"', N'blueberry-cake-A.jpg', N'The cake to calm your flavour spectrum cravings! This sinfully delicious three-layered cake with whipped rich...', CAST(500.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (132, N'PUBG Battelfield', N'pubg-poster-cake-phot766flav-B (1).jpg', N'Prepare the battle field and get ready to delve into the deliciousness right away. The scrumptious taste with...', CAST(649.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (133, N'Headfull of Cream', N'round-shaped-vanilla-cake-1-cake0614vani-A.jpg', N'Simpler things always garner more love and appreciation not just because they are simple rather because they...', CAST(399.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (134, N'Pistachio-licious Addiction', N'pistachio-licious-addiction-cake0398exot-A.jpg', N'Drizzling with benefits from the heartiest pistachio, this decadency is sure to line up every one from all the...', CAST(579.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (135, N'Gulkand Cake', N'forbidden-gulkand-cake0394exot-A.jpg', N'Baking knows no boundaries and when all you deserve nothing but the best, here''s a cake with the layers of...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (136, N'Together Forever', N'together-forever-phot0278flav-301217-A.jpg', N'Anniversary is an extraordinary occasion, and to make it more special, and we present this amazingly designed,...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (137, N'Irish Delight', N'irish-cream-cake-A.jpg', N'The heavenly flavoured Irish delight with triple layered rich cream cake is a heavenly dessert that no one...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (138, N'Cherry-Indulgence', N'royal-cherry-cake-A.jpg', N'Savour the taste of bliss as you bite into this cake that enrobes the delightful flavours of juicy cherries...', CAST(650.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (139, N'Caffeine Blitz', N'coffee-cake-A.jpg', N'This is a perfect blend of love and addiction in the name of coffee. This three layered smooth and moist cake,...', CAST(525.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (140, N'GOT Madness', N'game-of-thrones-1-phot760flav-A.jpg', N'If you know a loved one who forgot tp breathe during the last Game Of Thrones episode, then we have something...', CAST(649.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (141, N'Luscious Gooey Bliss', N'heart-shaped-fruit-cake-1-cake0740frui-A_0.jpg', N'This sinfully delicious heart-shaped fruitcake has been baked with fresh vanilla cream. Garnished with freshly...', CAST(1099.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (143, N'Irrevocably Yours', N'irrevocably-yours-phot0280flav-301217-A.jpg', N'When words fall short, let pictures do the trick. Sweetly expressing your feelings of love to your sweetheart...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (145, N'New Hope', N'new-hope-phot0286flav-301217-A.jpg', N'There are many ways to say congratulations. However, the sweetest way is to say with a cake. And for adding a...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (146, N'Classique Pina Caramelo', N'hawaiian-pineapple-cake-A.jpg', N'Taste this and you will, without a doubt, want more. This is made of delicious butterscotch chips and...', CAST(500.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (149, N'Fruit Frenzy', N'Fresh-Fruit-Cake.jpg', N'Freshly baked Vanilla cake, Whipped cream and bountiful tropical fruits come together to create a treat that...', CAST(600.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (150, N'Soulful Goodness', N'soulful-goodness-phot0270flav-301217-A.jpg', N'Birthdays are incomplete without photo cakes. Yes, photo cakes present to you a profound way to wish people...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (151, N'Hues Of Happiness', N'pineapple-round-shaped-cake-3-cake0633pine-A.jpg', N'This is a three-layered Pineapple cake filled with luscious pineapple slices and rich vanilla cream. Perfect...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (153, N'Oh So Orange Licious', N'orange-bubble-rectangle-cake-cake0730oran-A.jpg', N'Prepared with two mushy layers of orange cake and two layers of whipped cream, this delicacy is a perfect...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (154, N'Cherry Bomb', N'cherry-bomb-cake0370blac-310118-A.jpg', N'Want to send something as unique as your Valentine? Well, here''s one for you. Decorated with lashings of...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
GO
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (155, N'Love For GOT', N'game-of-thrones-cake-3-phot762flav-C.jpg', N'With all the love in your heart and all the craziness for Game Of Thrones in theirs, this cake will do the...', CAST(649.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (156, N'Tropilicious Treat', N'orange-hollow-cake-cake0731oran-A.jpg', N'Infused with the flavor of luscious oranges, this delicacy is prepared of three mushy and creamy layers of...', CAST(649.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (157, N'Velvetilicious Bliss', N'velvetilicious-bliss-cake0366redv-310118-A.jpg', N'Love red velvet? Let them delve into the mysterious flavors of the most popular cake in town. Crowned with...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (158, N'Coffee Mocha Felicity', N'coffee-mocha-cake-A.jpg', N'The tender Coffee mocha cake with dreamy chocolate fillings inside is not only meant to celebrate the special...', CAST(550.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (159, N'Kiwi Ecstasy ', N'simple-kiwi-cake-A.jpg', N'Undoubtedly, a scrumptious delight, with glazing layer of exotic Kiwi Crush laden over freshly baked Vanilla...', CAST(525.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (161, N'Choco Orange Obssession', N'New-Cake-10-A.jpg', N'To tickle your taste buds with a new flavor, we brought you this delicious cake flavored with luscious oranges...', CAST(599.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (162, N'Funfetti Rainbow Tower', N'funfetti-rainbow-tower-cake0397exot-B.jpg', N'Any celebration is incomplete without this funfetti cake. Pipped with beautiful creamy decorations, this...', CAST(999.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (164, N'White Paradesia', N'white-forest-cake-A.jpg', N'You are on the way to a sweet and wholesome satisfaction with this Creamy delight! It is all set to create a...', CAST(479.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (165, N'Heartilicious Love', N'heartilicious-love-cake0362blac-310118-A.jpg', N'A grand occasion calls for a grand gift. Celebrate love baked in the finest flavors of chocolate love and...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (166, N'Strawberry Seduction', N'strawberry-seduction-cake-A.jpg', N'Cherish your love for strawberry with this three-layered rich cream Cake. Filled with mushy rich cream and...', CAST(449.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (167, N'Pineapple Sensation', N'pineapple-round-shaped-cake-2-cake0632pine-A.jpg', N'A three-layered mushy, creamy, and fluffy cake infused with the luscious flavor of pineapples and enriched...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (168, N'Caffe-Elixir', N'opera-cake-A.jpg', N'Add refreshment to your routine anytime during the day with perfect coffee flavours of this scrumptious cake...', CAST(550.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (169, N'Oreoholic''S Delight', N'oreo-chocolate-cake-A.jpg', N'Well, this one comes with a warning! This delectable treat is no less than a delight to the O-RE-O-HO-LICs....', CAST(525.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (170, N'Paan Cake', N'paan-cake-cake0697paan-A.jpg', N'People who love paan are sure to love this scrumptious paan cake too. Made of three mushy and fluffy layers of...', CAST(599.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (171, N'Tea Cake', N'tea-cake-cake0696chte-A.jpg', N'Ever imagined you can have the flavors of tea in a cake? Well, our skilled bakers have come up with this three...', CAST(599.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (172, N'Floral Fun', N'heart-shaped-vanilla-cake-3-cake0613hvan-A.jpg', N'Google is brimming with million ways to steal hearts of your loved ones and this one is topping the charts...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (173, N'Pool Of Happiness', N'heart-shaped-vanilla-cake-2-cake0612hvan-A.jpg', N'Whether it''s an anniversary or their birthday, you can always shower the season of Valentine anytime with this...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (175, N'Kit Kat "Bake"', N'kit-kat-cake-A.jpg', N'Your beloved kit-kat break just evolved to a whole new level with wafer chocolate frosting and a two-layered...', CAST(550.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (177, N'Being Coffee-holic', N'being-coffee-holic-cake0395chco-A.jpg', N'Covered from all equal sides, this coffee-chocolate decadency is sure to leave all coffee-cocoa lovers...', CAST(649.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (178, N'Merry Go Round', N'round-shaped-vanilla-cake-3-cake0616vani-A.jpg', N'Curled with whipped cream and fluffy vanilla sponge cake, this cake is ready to add some creamy dreamy layers...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (179, N'Pineapple Pleasure', N'pineapple-heart-shaped-cake-1-cake0635pine-A_0.jpg', N'Enriched with rich Vanilla cream, this scrumptious Pineapple cake look no less than a white paradise. Baked in...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (181, N'Mountainous Pistachio Greenery', N'mountainous-pistachio-greenery-cake0399exot-A.jpg', N'Transport them to the beautiful green valleys surrounded by lofty peaks with this resilient delicious cake....', CAST(649.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (182, N'Love Happiness', N'love-happiness-cake0369vani-310118-A.jpg', N'Send vanilla cake cloaked under the layers of fun. A simple cake like this is sure to sweep them off their...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (183, N'Sun-kissed Joys', N'pineaple-upside-down-cake-A.jpg', N'Don''t feel surprised by this sheer beauty seared fantastically to add a uniquely delicious taste to the cake....', CAST(950.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (184, N'Secret Confession', N'vanilla-strawberry-cake-A.jpg', N'Make way for the Heavens Exclusive Delicacy infused with luscious strawberry flavor and a dash of infatuation....', CAST(950.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (185, N'Rocher-Aholic''S Fantasy', N'ferrero-rocher-cake-A.jpg', N'Wondering what form of temptation would it take if it was to materialize? The answer is simple- a magically...', CAST(700.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (187, N'Hearty Sweetness', N'hearty-sweetness-cake0367vani-310118-A.jpg', N'Your Valentine is going to fall in love with its very first bite when you surprise them with a delicious...', CAST(499.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (188, N'Exotic Affair', N'heart-shape-chocolate-cake-A.jpg', N'A single bite of this cake is going to bind you with its captivating taste. Perfect for all occasions like...', CAST(950.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (189, N'Snow Kissed', N'heart-shaped-fondant-vanilla-cake-A.jpg', N'When emotions become hard to resist, delve into this gorgeously rich delicacy and experience ''LOVE''....', CAST(799.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (190, N'The Avengers', N'avengers-poster-cake-2-phot768flav-B.jpg', N'If you happen to know someone who is an Avenger fan at heart, then this Avenger poster cake for his birthday...', CAST(649.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (191, N'Fruity By Nature ', N'heart-shaped-fruit-cake-3-cake0742frui-A_0.jpg', N'This lusciously rich heart-shaped fruitcake is sure to be the center of attraction of your every special...', CAST(1099.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (192, N'Vanilla Rush', N'heart-shaped-vanilla-cake-1-cake0611hvan-A.jpg', N'Love is a beautiful thing you''d ever come across in your life. And once you do, you would need an equivalent...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 1, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (194, N'Cherry Pool', N'cherry-pool-cake0361blac-310118-A.jpg', N'Get ahead and pre-plan a Valentine''s sweetest toothsome gift they can relish till the very last bite. Drown...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 2, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (195, N'Super Duper Motherly Love', N'strawberry-cake-for-mom-1-cake763stra-A.jpg', N'When your heart wants to say something more, express your love for your mother with this mouth-watering...', CAST(549.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 4, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (196, N'Mummas Love', N'strawberry-cake-for-mom-2-cake764stra-A.jpg', N'When it comes to express your love for your mother then you can’t go wrong with this mouth-watering vanilla...', CAST(699.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 4, 10, 1)
INSERT [dbo].[Cake] ([id], [name], [imagePath], [description], [price], [createDate], [exprirationDate], [categoryId], [quantity], [status]) VALUES (197, N'Eternal Sweetness', N'strawberry-sensation-cake-A.jpg', N'Let''s call this cake a ''Perfect Mood Uplifter''. The richly whipped cream polished off with strawberry pulp is...', CAST(1450.00 AS Decimal(18, 2)), CAST(0x0000AC4F00000000 AS DateTime), CAST(0x0000AD7B00000000 AS DateTime), 4, 10, 1)
SET IDENTITY_INSERT [dbo].[Cake] OFF
INSERT [dbo].[Category] ([id], [name]) VALUES (0, N'Chocolate Cakes')
INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Eggless Cakes')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Black Forest Cakes')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Butterscotch Cakes')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Strawberry Cakes')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Red Velvet Cakes')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Vanilla Cakes')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Pineapple Cakes')
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Fruit Cakes')
INSERT [dbo].[Category] ([id], [name]) VALUES (9, N'Blueberry Cakes')
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'member')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'guest')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602529040723', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602529104055', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602529355352', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602529441429', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602529524241', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602529630710', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602563184048', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602571472917', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602574594213', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602575808446', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602576215671', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602592576950', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602649477042', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602649548040', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602649638993', N'Hoa Luu', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'09641602650297566', N'aq', N'', 3, 1, N'0964', N'hehehe')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'1602574449713', N'', N'', 3, 1, N'', N'')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'hoa', N'hoa', N'hoa', 1, 1, N'0980900909', N'jdhf')
INSERT [dbo].[Users] ([id], [fullName], [password], [roleId], [status], [phone], [address]) VALUES (N'hoa1', N'hoa1', N'hoa1', 2, 1, N'2310909009', N'fddsf')
ALTER TABLE [dbo].[Cake] ADD  CONSTRAINT [DF_Cake_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_users_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Cake]  WITH CHECK ADD  CONSTRAINT [FK_Cake_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Cake] CHECK CONSTRAINT [FK_Cake_Category]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Cake] FOREIGN KEY([cakeId])
REFERENCES [dbo].[Cake] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Cake]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_users]
GO
ALTER TABLE [dbo].[UpdateDetail]  WITH CHECK ADD  CONSTRAINT [FK_UpdateDetail_Cake] FOREIGN KEY([cakeId])
REFERENCES [dbo].[Cake] ([id])
GO
ALTER TABLE [dbo].[UpdateDetail] CHECK CONSTRAINT [FK_UpdateDetail_Cake]
GO
ALTER TABLE [dbo].[UpdateDetail]  WITH CHECK ADD  CONSTRAINT [FK_UpdateDetail_users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[UpdateDetail] CHECK CONSTRAINT [FK_UpdateDetail_users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_users_role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_users_role]
GO
USE [master]
GO
ALTER DATABASE [YellowMoonShop] SET  READ_WRITE 
GO
