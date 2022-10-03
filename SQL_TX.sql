USE [master]
GO
CREATE DATABASE [SalesProduct]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalesProduct', FILENAME = N'D:\WORK 2019\MVC\MarsStore\SalesProduct.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SalesProduct_log', FILENAME = N'D:\WORK 2019\MVC\MarsStore\SalesProduct_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SalesProduct] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalesProduct].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalesProduct] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalesProduct] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalesProduct] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalesProduct] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalesProduct] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalesProduct] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SalesProduct] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SalesProduct] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalesProduct] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalesProduct] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalesProduct] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalesProduct] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalesProduct] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalesProduct] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalesProduct] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalesProduct] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SalesProduct] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalesProduct] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalesProduct] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalesProduct] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalesProduct] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalesProduct] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SalesProduct] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalesProduct] SET RECOVERY FULL 
GO
ALTER DATABASE [SalesProduct] SET  MULTI_USER 
GO
ALTER DATABASE [SalesProduct] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalesProduct] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalesProduct] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalesProduct] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SalesProduct', N'ON'
GO
USE [SalesProduct]
GO
/****** Object:  Table [dbo].[BINHLUAN]    Script Date: 6/19/2016 10:52:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BINHLUAN](
	[ID_BL] [int] IDENTITY(1,1) NOT NULL,
	[ID_SP] [int] NOT NULL,
	[ID_TK] [int] NOT NULL,
	[ngaybinhluan] [date] NOT NULL,
	[noidung] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BINHLUAN] PRIMARY KEY CLUSTERED 
(
	[ID_BL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTDONHANG]    Script Date: 6/19/2016 10:52:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDONHANG](
	[ID_CTDH] [int] IDENTITY(1,1) NOT NULL,
	[ID_DH] [int] NOT NULL,
	[ID_SP] [int] NOT NULL,
	[soluong] [int] NOT NULL,
	[dongia] [int] NOT NULL,
 CONSTRAINT [PK_CTDONHANG] PRIMARY KEY CLUSTERED 
(
	[ID_CTDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUC](
	[ID_DM] [int] IDENTITY(1,1) NOT NULL,
	[tendanhmuc] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_DANHMUC] PRIMARY KEY CLUSTERED 
(
	[ID_DM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DONHANG](
	[ID_DH] [int] IDENTITY(1,1) NOT NULL,
	[ID_TK] [int] NULL,
	[ID_TIN] [int] NULL,
	[ngaylap] [date] NOT NULL,
	[ngaynhanhang] [date] NOT NULL,
	[diachigiaohang] [nvarchar](200) NULL,
	[phone] [char](16) NULL,
	[trangthai] [bit] NULL,
	[hotenkh] [nvarchar](250) NULL,
 CONSTRAINT [PK_DONHANG] PRIMARY KEY CLUSTERED 
(
	[ID_DH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOANGGIA](
	[IDKG] [int] IDENTITY(1,1) NOT NULL,
	[cantren] [int] NOT NULL,
	[canduoi] [int] NOT NULL,
 CONSTRAINT [PK_KHOANGGIA] PRIMARY KEY CLUSTERED 
(
	[IDKG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHOMTIN](
	[ID_NHOM] [int] IDENTITY(1,1) NOT NULL,
	[tennhomtin] [nvarchar](250) NULL,
 CONSTRAINT [PK_NHOMTIN] PRIMARY KEY CLUSTERED 
(
	[ID_NHOM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHANQUYEN](
	[TENQUYEN] [varchar](50) NOT NULL,
	[ID_TK] [int] NOT NULL,
 CONSTRAINT [PK_PHANQUYEN] PRIMARY KEY CLUSTERED 
(
	[TENQUYEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUYEN](
	[ID_QUYEN] [int] IDENTITY(1,1) NOT NULL,
	[TENQUYEN] [varchar](50) NOT NULL,
 CONSTRAINT [PK_QUYEN] PRIMARY KEY CLUSTERED 
(
	[ID_QUYEN] ASC,
	[TENQUYEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[ID_SP] [int] IDENTITY(1,1) NOT NULL,
	[ID_DM] [int] NOT NULL,
	[tensanpham] [nvarchar](max) NOT NULL,
	[giabd] [int] NOT NULL,
	[trongluong] [varchar](250) NOT NULL,
	[mausac] [nvarchar](30) NOT NULL,
	[ImgLink] [nvarchar](250) NOT NULL,
	[memory] [varchar](250) NOT NULL,
	[hedieuhanh] [varchar](250) NOT NULL,
	[vga] [nvarchar](100) NOT NULL,
	[cpuz] [varchar](250) NOT NULL,
	[battery] [varchar](250) NOT NULL,
	[phukiendikem] [nvarchar](100) NULL,
	[chedobaohanh] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[ID_SP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPGIAMGIA](
	[ID_KM] [int] IDENTITY(1,1) NOT NULL,
	[ID_SP] [int] NOT NULL,
	[soluong] [int] NOT NULL,
	[giaht] [int] NOT NULL,
	[ngayban] [date] NOT NULL,
 CONSTRAINT [PK_SPGIAMGIA] PRIMARY KEY CLUSTERED 
(
	[ID_KM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[ID_TK] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[tentk] [nvarchar](50) NOT NULL,
	[phone] [char](16) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[diachi] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[ID_TK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINTUC](
	[ID_TIN] [int] IDENTITY(1,1) NOT NULL,
	[ID_NHOM] [int] NULL,
	[tentin] [nvarchar](250) NOT NULL,
	[ImgTin] [nvarchar](250) NOT NULL,
	[mota] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TINTUC] PRIMARY KEY CLUSTERED 
(
	[ID_TIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BINHLUAN] ON 

INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (23, 70, 3, CAST(0xFE3A0B00 AS Date), N'Xe tốt')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (24, 1, 3, CAST(0x553B0B00 AS Date), N'Máy Mạnh')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (30, 3, 2, CAST(0x573B0B00 AS Date), N'Chạy êm')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (41, 3, 3, CAST(0x573B0B00 AS Date), N'Màu đẹp')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (42, 70, 2, CAST(0x653B0B00 AS Date), N'Tăng tốc nhanh')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (1042, 1, 4, CAST(0x663B0B00 AS Date), N'Chạy bền')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (1043, 18, 4, CAST(0x663B0B00 AS Date), N'mẫu mã đẹp')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (1044, 111, 4, CAST(0x663B0B00 AS Date), N'Chất ')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (1045, 19, 6, CAST(0x673B0B00 AS Date), N'Giá cả hợp lý')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (1046, 16, 10, CAST(0x713B0B00 AS Date), N'Đánh giá 5 sao ')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (1047, 16, 10, CAST(0x713B0B00 AS Date), N'Còn Xe không ạ')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (1048, 16, 10, CAST(0x713B0B00 AS Date), N'Ai cho nhận xét review đi ạ')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (1049, 27, 3, CAST(0x713B0B00 AS Date), N'Very good')
INSERT [dbo].[BINHLUAN] ([ID_BL], [ID_SP], [ID_TK], [ngaybinhluan], [noidung]) VALUES (1050, 70, 6, CAST(0x843B0B00 AS Date), N'Cực phê')
SET IDENTITY_INSERT [dbo].[BINHLUAN] OFF
SET IDENTITY_INSERT [dbo].[CTDONHANG] ON 

INSERT [dbo].[CTDONHANG] ([ID_CTDH], [ID_DH], [ID_SP], [soluong], [dongia]) VALUES (2106, 2088, 21, 1, 47000000)
INSERT [dbo].[CTDONHANG] ([ID_CTDH], [ID_DH], [ID_SP], [soluong], [dongia]) VALUES (2112, 2092, 1, 1, 40000000)
INSERT [dbo].[CTDONHANG] ([ID_CTDH], [ID_DH], [ID_SP], [soluong], [dongia]) VALUES (2113, 2092, 3, 1, 47000000)
INSERT [dbo].[CTDONHANG] ([ID_CTDH], [ID_DH], [ID_SP], [soluong], [dongia]) VALUES (2114, 2093, 1, 2, 80000000)
SET IDENTITY_INSERT [dbo].[CTDONHANG] OFF
SET IDENTITY_INSERT [dbo].[DANHMUC] ON 

INSERT [dbo].[DANHMUC] ([ID_DM], [tendanhmuc]) VALUES (1, N'FERRARI')
INSERT [dbo].[DANHMUC] ([ID_DM], [tendanhmuc]) VALUES (2, N'LAMBORGHINI')
INSERT [dbo].[DANHMUC] ([ID_DM], [tendanhmuc]) VALUES (3, N'BUGATTI')
INSERT [dbo].[DANHMUC] ([ID_DM], [tendanhmuc]) VALUES (4, N'AUDI')
INSERT [dbo].[DANHMUC] ([ID_DM], [tendanhmuc]) VALUES (5, N'ROLLS ROYCE')
INSERT [dbo].[DANHMUC] ([ID_DM], [tendanhmuc]) VALUES (6, N'TOYOTA')
INSERT [dbo].[DANHMUC] ([ID_DM], [tendanhmuc]) VALUES (7, N'Mercedes Benz')
SET IDENTITY_INSERT [dbo].[DANHMUC] OFF
SET IDENTITY_INSERT [dbo].[DONHANG] ON 

INSERT [dbo].[DONHANG] ([ID_DH], [ID_TK], [ID_TIN], [ngaylap], [ngaynhanhang], [diachigiaohang], [phone], [trangthai], [hotenkh]) VALUES (2088, NULL, NULL, CAST(0x853B0B00 AS Date), CAST(0x853B0B00 AS Date), N'250 Trần Cung, Cổ Nhuế, Hà Nội', N'q43543545       ', NULL, N'Nguyễn Văn Nam')
INSERT [dbo].[DONHANG] ([ID_DH], [ID_TK], [ID_TIN], [ngaylap], [ngaynhanhang], [diachigiaohang], [phone], [trangthai], [hotenkh]) VALUES (2092, NULL, NULL, CAST(0x853B0B00 AS Date), CAST(0x853B0B00 AS Date), N'Số 6, Ngõ 56 Phố Pháo Đài Láng, Đống Đa, Hà Nội', N'0943103168      ', 1, N'Trần Văn Quyết')
INSERT [dbo].[DONHANG] ([ID_DH], [ID_TK], [ID_TIN], [ngaylap], [ngaynhanhang], [diachigiaohang], [phone], [trangthai], [hotenkh]) VALUES (2093, NULL, NULL, CAST(0x853B0B00 AS Date), CAST(0x903B0B00 AS Date), N'Số 6, Ngõ 56 Phố Pháo Đài Láng, Đống Đa, Hà Nội', N'0943103168      ', NULL, N'Trần Văn Quyết')
SET IDENTITY_INSERT [dbo].[DONHANG] OFF
SET IDENTITY_INSERT [dbo].[KHOANGGIA] ON 

INSERT [dbo].[KHOANGGIA] ([IDKG], [cantren], [canduoi]) VALUES (1, 10000000, 5000000)
INSERT [dbo].[KHOANGGIA] ([IDKG], [cantren], [canduoi]) VALUES (2, 15000000, 10000000)
INSERT [dbo].[KHOANGGIA] ([IDKG], [cantren], [canduoi]) VALUES (3, 20000000, 15000000)
INSERT [dbo].[KHOANGGIA] ([IDKG], [cantren], [canduoi]) VALUES (4, 25000000, 20000000)
INSERT [dbo].[KHOANGGIA] ([IDKG], [cantren], [canduoi]) VALUES (5, 30000000, 25000000)
INSERT [dbo].[KHOANGGIA] ([IDKG], [cantren], [canduoi]) VALUES (6, 40000000, 30000000)
INSERT [dbo].[KHOANGGIA] ([IDKG], [cantren], [canduoi]) VALUES (7, 50000000, 40000000)
INSERT [dbo].[KHOANGGIA] ([IDKG], [cantren], [canduoi]) VALUES (8, 70000000, 50000000)
INSERT [dbo].[KHOANGGIA] ([IDKG], [cantren], [canduoi]) VALUES (9, 1000000000, 70000000)
SET IDENTITY_INSERT [dbo].[KHOANGGIA] OFF
SET IDENTITY_INSERT [dbo].[NHOMTIN] ON 

INSERT [dbo].[NHOMTIN] ([ID_NHOM], [tennhomtin]) VALUES (1, N'TIN KHUYẾN MẠI')
INSERT [dbo].[NHOMTIN] ([ID_NHOM], [tennhomtin]) VALUES (2, N'TIN XE')
INSERT [dbo].[NHOMTIN] ([ID_NHOM], [tennhomtin]) VALUES (3, N'HƯỚNG DẪN KHÁCH HÀNG')
INSERT [dbo].[NHOMTIN] ([ID_NHOM], [tennhomtin]) VALUES (4, N'TƯ VẤN')
INSERT [dbo].[NHOMTIN] ([ID_NHOM], [tennhomtin]) VALUES (5, N'XE')
INSERT [dbo].[NHOMTIN] ([ID_NHOM], [tennhomtin]) VALUES (6, N'BẢO HÀNH')
INSERT [dbo].[NHOMTIN] ([ID_NHOM], [tennhomtin]) VALUES (7, N'TIN CÔNG TY')
INSERT [dbo].[NHOMTIN] ([ID_NHOM], [tennhomtin]) VALUES (8, N'DỊCH VỤ')
INSERT [dbo].[NHOMTIN] ([ID_NHOM], [tennhomtin]) VALUES (9, N'TIN TỨC')
SET IDENTITY_INSERT [dbo].[NHOMTIN] OFF
INSERT [dbo].[PHANQUYEN] ([TENQUYEN], [ID_TK]) VALUES (N'Admin', 2)
INSERT [dbo].[PHANQUYEN] ([TENQUYEN], [ID_TK]) VALUES (N'NguoiDung', 3)
SET IDENTITY_INSERT [dbo].[QUYEN] ON 

INSERT [dbo].[QUYEN] ([ID_QUYEN], [TENQUYEN]) VALUES (4, N'Admin')
INSERT [dbo].[QUYEN] ([ID_QUYEN], [TENQUYEN]) VALUES (5, N'NguoiDung')
SET IDENTITY_INSERT [dbo].[QUYEN] OFF
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 
DELETE FROM SANPHAM 
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (1, 1, N'Ferrari LaFerrari', 40000000, N'3.495 lb (1.585 kg)', N'Đỏ', N'f1.png', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (3, 1, N'Ferrari F12 Berlinetta', 47000000, N'3.495 lb (1.585 kg)', N'Vàng đen', N'f2.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (8, 1, N'Ferrari 812 Superfast', 36000000, N'3.495 lb (1.585 kg)', N'Đỏ đậm', N'f3.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (10, 1, N'Ferrari 488GTB', 29000000, N'3.495 lb (1.585 kg)', N'Trắng', N'f4.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (12, 1, N'Ferrari 488 Pista', 31000000, N'3.495 lb (1.585 kg)', N'Xám', N'f5.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (16, 1, N'Ferrari F8 Tributo', 33000000, N'3.495 lb (1.585 kg)', N'Xanh', N'f6.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (17, 1, N'Ferrari California T', 32500000, N'3.495 lb (1.585 kg)', N'Đỏ đô', N'f7.png', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (18, 1, N'Ferrari Portofino', 47300000, N'3.495 lb (1.585 kg)', N'Xám bóng', N'f8.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (19, 1, N'Ferrari GTC4Lusso', 31500000, N'3.495 lb (1.585 kg)', N'Trắng', N'f9.png', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (20, 2, N'Lamborghini Aventador SVJ', 80000000, N'3.495 lb (1.585 kg)', N'Xanh lam', N'l1.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (21, 2, N'Lamborghini Aventador LP700-4', 47000000, N'3.495 lb (1.585 kg)', N'Xám', N'l2.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (23, 2, N'Lamborghini Aventador LP750-SV', 55000000, N'3.495 lb (1.585 kg)', N'Vàng', N'l3.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (26, 2, N'Lamborghini Aventador S', 17000000, N'3.495 lb (1.585 kg)', N'Xanh dương', N'l4.png', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (27, 2, N'Lamborghini Huracan LP610-4', 12600000, N'3.495 lb (1.585 kg)', N'Trắng xám', N'l5.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (29, 2, N'Lamborghini Huracan LP580-2', 22350000, N'3.495 lb (1.585 kg)', N'Đỏ', N'l6.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (31, 2, N'Lamborghini Huracan Performante', 8200000, N'3.495 lb (1.585 kg)', N'Xanh dương', N'l7.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (32, 2, N'Lamborghini Sian SKP 37', 21000000, N'3.495 lb (1.585 kg)', N'Vàng bạch kim', N'l8.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (33, 2, N'Lamborghini Urus', 8200000, N'3.495 lb (1.585 kg)', N'Vàng / Đen', N'l9.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (34, 3, N'Bugatti Chiron', 12000000, N'3.495 lb (1.585 kg)', N'Trắng đen', N'b1.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (35, 3, N'Bugatti Chiron Divo', 22000000, N'3.495 lb (1.585 kg)', N'Đen xanh', N'b2.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (36, 3, N'Bugatti Centodieci', 27000000, N'3.495 lb (1.585 kg)', N'Trắng', N'b3.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (38, 3, N'Bugatti La Voiture Noire', 42000000, N'3.495 lb (1.585 kg)', N'Đen', N'b4.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (39, 4, N'Audi A3', 37000000, N'3.495 lb (1.585 kg)', N'Trắng', N'a1.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (41, 4, N'Audi A4', 32000000, N'3.495 lb (1.585 kg)', N'Trắng', N'a2.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (42, 4, N'Audi A5', 34000000, N'3.495 lb (1.585 kg)', N'Đỏ', N'a3.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (44, 4, N'Audi A6', 23400000, N'3.495 lb (1.585 kg)', N'Đen', N'a4.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (45, 4, N'Audi A7', 19500000, N'3.495 lb (1.585 kg)', N'Xám', N'a5.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (46, 4, N'Audi A8L', 17000000, N'3.495 lb (1.585 kg)', N'Đen', N'a6.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (47, 4, N'Audi Q2', 16500000, N'3.495 lb (1.585 kg)', N'Trắng', N'a7.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (48, 4, N'Audi Q3', 12000000, N'3.495 lb (1.585 kg)', N'Trắng', N'a8.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (49, 4, N'Audi Q5', 21000000, N'3.495 lb (1.585 kg)', N'Trắng', N'a9.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (50, 4, N'Audi Q7', 23000000, N'3.495 lb (1.585 kg)', N'Xám khói', N'a10.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (51, 4, N'Audi Q8', 27000000, N'3.495 lb (1.585 kg)', N'Vàng đất', N'a11.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (52, 4, N'Audi R8', 25000000, N'3.495 lb (1.585 kg)', N'Đỏ đô', N'a12.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (53, 4, N'Audi RS7', 19590000, N'3.495 lb (1.585 kg)', N'Xám', N'a13.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (54, 4, N'Audi S8', 22000000, N'3.495 lb (1.585 kg)', N'Đen', N'a14.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (55, 4, N'Audi TT S', 17500000, N'3.495 lb (1.585 kg)', N'Xanh dương', N'a15.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (56, 5, N'ROLLS ROYCE PHANTOM', 21540000, N'3.495 lb (1.585 kg)', N'Xám', N'r1.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (57, 5, N'ROLLS ROYCE PHANTOM DROPHEAD COUPE', 23000000, N'3.495 lb (1.585 kg)', N'Đen', N'r2.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (58, 5, N'ROLLS ROYCE WRAITH', 28000000, N'3.495 lb (1.585 kg)', N'Nâu đỏ', N'r3.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (59, 5, N'ROLLS ROYCE GHOST SERIES II', 26540000, N'3.495 lb (1.585 kg)', N'Trắng', N'r4.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (60, 5, N'ROLLS ROYCE DAWN', 27000000, N'3.495 lb (1.585 kg)', N'Xám đen', N'r5.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (61, 5, N'ROLLS ROYCE CULLINAN', 36000000, N'3.495 lb (1.585 kg)', N'Đỏ', N'r6.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (62, 6, N'Toyota Wigo', 21450000, N'3.495 lb (1.585 kg)', N'Trắng', N't1.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (63, 6, N'Toyota Vios', 23640000, N'3.495 lb (1.585 kg)', N'Đỏ', N't2.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (64, 6, N'Toyota Altis', 48980000, N'3.495 lb (1.585 kg)', N'Đen', N't3.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (67, 6, N'Toyota Yaris', 21000000, N'3.495 lb (1.585 kg)', N'Xanh dương', N't4.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (68, 6, N'Toyota Camry', 21450000, N'3.495 lb (1.585 kg)', N'Đen', N't5.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (69, 6, N'Toyota Avanza', 18000000, N'3.495 lb (1.585 kg)', N'Xám', N't6.png', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (70, 6, N'Toyota Rush', 24000000, N'3.495 lb (1.585 kg)', N'Nâu đỏ', N't7.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (71, 6, N'Toyota Innova', 27000000, N'3.495 lb (1.585 kg)', N'Trắng', N't8.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (72, 6, N'Toyota Fortuner', 26400000, N'3.495 lb (1.585 kg)', N'Xám', N't9.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (73, 6, N'Toyota Alphard', 31500000, N'3.495 lb (1.585 kg)', N'Trắng', N't10.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (74, 6, N'Toyota Prado', 25000000, N'3.495 lb (1.585 kg)', N'Đen', N't11.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (75, 6, N'Toyota Land Cruiser', 31250000, N'3.495 lb (1.585 kg)', N'Đen', N't12.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (76, 6, N'Toyota Hilux', 37000000, N'3.495 lb (1.585 kg)', N'Trắng', N't13.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (77, 6, N'Toyota Hiace 16 chỗ', 51000000, N'3.495 lb (1.585 kg)', N'Trắng', N't14.png', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (78, 7, N'Mercedes Benz C-Class', 32000000, N'3.495 lb (1.585 kg)', N'Đen', N'm1.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (79, 7, N'Mercedes Benz E-Class', 21890000, N'3.495 lb (1.585 kg)', N'Trắng', N'm2.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (93, 7, N'Mercedes Benz S-Class', 17000000, N'3.495 lb (1.585 kg)', N'Xám', N'm3.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (105, 7, N'Mercedes Benz A-Class', 9000000, N'3.495 lb (1.585 kg)', N'Xám', N'm4.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (106, 7, N'Mercedes Benz CLA Class', 21000000, N'3.495 lb (1.585 kg)', N'Trắng', N'm5.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (108, 7, N'Mercedes Benz GLA Class', 31000000, N'3.495 lb (1.585 kg)', N'Trắng', N'm6.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
INSERT [dbo].[SANPHAM] ([ID_SP], [ID_DM], [tensanpham], [giabd], [trongluong], [mausac], [ImgLink], [memory], [hedieuhanh], [vga], [cpuz], [battery], [phukiendikem], [chedobaohanh]) VALUES (111, 7, N'Mercedes Benz GLB Class', 175800000, N'3.495 lb (1.585 kg)', N'Trắng', N'm7.jpg', N'6.3 L F140FE V12,KERS', N'4.702 mm (185,1 in)', N'1.116 mm (43,9 in)', N'	Rear mid-engine, rear-wheel drive', N'Siêu xe', N'', N'Vĩnh Viễn')
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
SET IDENTITY_INSERT [dbo].[SPGIAMGIA] ON 

INSERT [dbo].[SPGIAMGIA] ([ID_KM], [ID_SP], [soluong], [giaht], [ngayban]) VALUES (1, 23, 12, 50000000, CAST(0x363B0B00 AS Date))
INSERT [dbo].[SPGIAMGIA] ([ID_KM], [ID_SP], [soluong], [giaht], [ngayban]) VALUES (2, 26, 1, 15000000, CAST(0x363B0B00 AS Date))
INSERT [dbo].[SPGIAMGIA] ([ID_KM], [ID_SP], [soluong], [giaht], [ngayban]) VALUES (3, 27, 13, 12000000, CAST(0x363B0B00 AS Date))
INSERT [dbo].[SPGIAMGIA] ([ID_KM], [ID_SP], [soluong], [giaht], [ngayban]) VALUES (4, 29, 2, 22000000, CAST(0x363B0B00 AS Date))
INSERT [dbo].[SPGIAMGIA] ([ID_KM], [ID_SP], [soluong], [giaht], [ngayban]) VALUES (5, 31, 5, 8000000, CAST(0x363B0B00 AS Date))
SET IDENTITY_INSERT [dbo].[SPGIAMGIA] OFF
SET IDENTITY_INSERT [dbo].[TAIKHOAN] ON 

INSERT [dbo].[TAIKHOAN] ([ID_TK], [username], [password], [tentk], [phone], [mail], [diachi]) VALUES (2, N'admin', N'admin', N'Nguyễn Thành Tựa', N'0934032182', N'nguyenthanhtua1999@gmail.com', N'TP.HCM')
INSERT [dbo].[TAIKHOAN] ([ID_TK], [username], [password], [tentk], [phone], [mail], [diachi]) VALUES (3, N'khach', N'khach', N'Nguyễn Thanh an', N'0783875923', N'khachhang@gmail.com', N'Hà Nội')
SET IDENTITY_INSERT [dbo].[TAIKHOAN] OFF
SET IDENTITY_INSERT [dbo].[TINTUC] ON 

INSERT [dbo].[TINTUC] ([ID_TIN], [ID_NHOM], [tentin], [ImgTin], [mota]) VALUES (19, 1, N'Khuyến Mại 1', N'imgtin1.jpg', N'Khuyến mại 1')
INSERT [dbo].[TINTUC] ([ID_TIN], [ID_NHOM], [tentin], [ImgTin], [mota]) VALUES (20, 2, N'Khuyến Mại 1', N'imgtin1.jpg', N'Khuyến mại 1')
INSERT [dbo].[TINTUC] ([ID_TIN], [ID_NHOM], [tentin], [ImgTin], [mota]) VALUES (21, 3, N'Khuyến Mại 1', N'imgtin1.jpg', N'Khuyến mại 1')
INSERT [dbo].[TINTUC] ([ID_TIN], [ID_NHOM], [tentin], [ImgTin], [mota]) VALUES (22, 4, N'Khuyến Mại 1', N'imgtin1.jpg', N'Khuyến mại 1')
INSERT [dbo].[TINTUC] ([ID_TIN], [ID_NHOM], [tentin], [ImgTin], [mota]) VALUES (23, 5, N'Khuyến Mại 1', N'imgtin1.jpg', N'Khuyến mại 1')
INSERT [dbo].[TINTUC] ([ID_TIN], [ID_NHOM], [tentin], [ImgTin], [mota]) VALUES (24, 6, N'Khuyến Mại 1', N'imgtin1.jpg', N'Khuyến mại 1')
INSERT [dbo].[TINTUC] ([ID_TIN], [ID_NHOM], [tentin], [ImgTin], [mota]) VALUES (25, 7, N'Khuyến Mại 1', N'imgtin1.jpg', N'Khuyến mại 1')
INSERT [dbo].[TINTUC] ([ID_TIN], [ID_NHOM], [tentin], [ImgTin], [mota]) VALUES (26, 8, N'Khuyến Mại 1', N'imgtin1.jpg', N'Khuyến mại 1')
INSERT [dbo].[TINTUC] ([ID_TIN], [ID_NHOM], [tentin], [ImgTin], [mota]) VALUES (27, 9, N'Khuyến Mại 1', N'imgtin1.jpg', N'Khuyến mại 1')
SET IDENTITY_INSERT [dbo].[TINTUC] OFF
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUAN_SANPHAM] FOREIGN KEY([ID_SP])
REFERENCES [dbo].[SANPHAM] ([ID_SP])
GO
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK_BINHLUAN_SANPHAM]
GO
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUAN_TAIKHOAN] FOREIGN KEY([ID_TK])
REFERENCES [dbo].[TAIKHOAN] ([ID_TK])
GO
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK_BINHLUAN_TAIKHOAN]
GO
ALTER TABLE [dbo].[CTDONHANG]  WITH CHECK ADD  CONSTRAINT [FK_CTDONHANG_DONHANG] FOREIGN KEY([ID_DH])
REFERENCES [dbo].[DONHANG] ([ID_DH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTDONHANG] CHECK CONSTRAINT [FK_CTDONHANG_DONHANG]
GO
ALTER TABLE [dbo].[CTDONHANG]  WITH CHECK ADD  CONSTRAINT [FK_CTDONHANG_SANPHAM] FOREIGN KEY([ID_SP])
REFERENCES [dbo].[SANPHAM] ([ID_SP])
GO
ALTER TABLE [dbo].[CTDONHANG] CHECK CONSTRAINT [FK_CTDONHANG_SANPHAM]
GO
ALTER TABLE [dbo].[DONHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONHANG_TINTUC] FOREIGN KEY([ID_TIN])
REFERENCES [dbo].[TINTUC] ([ID_TIN])
GO
ALTER TABLE [dbo].[DONHANG] CHECK CONSTRAINT [FK_DONHANG_TINTUC]
GO
ALTER TABLE [dbo].[PHANQUYEN]  WITH CHECK ADD  CONSTRAINT [FK_PHANQUYEN_TAIKHOAN] FOREIGN KEY([ID_TK])
REFERENCES [dbo].[TAIKHOAN] ([ID_TK])
GO
ALTER TABLE [dbo].[PHANQUYEN] CHECK CONSTRAINT [FK_PHANQUYEN_TAIKHOAN]
GO
ALTER TABLE [dbo].[QUYEN]  WITH CHECK ADD  CONSTRAINT [FK_QUYEN_PHANQUYEN] FOREIGN KEY([TENQUYEN])
REFERENCES [dbo].[PHANQUYEN] ([TENQUYEN])
GO
ALTER TABLE [dbo].[QUYEN] CHECK CONSTRAINT [FK_QUYEN_PHANQUYEN]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_DANHMUC] FOREIGN KEY([ID_DM])
REFERENCES [dbo].[DANHMUC] ([ID_DM])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_DANHMUC]
GO
ALTER TABLE [dbo].[SPGIAMGIA]  WITH CHECK ADD  CONSTRAINT [FK_SPGIAMGIA_SANPHAM] FOREIGN KEY([ID_SP])
REFERENCES [dbo].[SANPHAM] ([ID_SP])
GO
ALTER TABLE [dbo].[SPGIAMGIA] CHECK CONSTRAINT [FK_SPGIAMGIA_SANPHAM]
GO
ALTER TABLE [dbo].[TINTUC]  WITH CHECK ADD  CONSTRAINT [FK_TINTUC_NHOMTIN] FOREIGN KEY([ID_NHOM])
REFERENCES [dbo].[NHOMTIN] ([ID_NHOM])
GO
ALTER TABLE [dbo].[TINTUC] CHECK CONSTRAINT [FK_TINTUC_NHOMTIN]
GO

