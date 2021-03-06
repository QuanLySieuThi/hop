USE [master]
GO
/****** Object:  Database [Quanlybanhang]    Script Date: 30/04/2018 11:53:36 SA ******/
CREATE DATABASE [Quanlybanhang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quản lý bán hàng', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Quản lý bán hàng.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Quản lý bán hàng_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Quản lý bán hàng_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Quanlybanhang] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quanlybanhang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quanlybanhang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quanlybanhang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quanlybanhang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quanlybanhang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quanlybanhang] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quanlybanhang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Quanlybanhang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quanlybanhang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quanlybanhang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quanlybanhang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quanlybanhang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quanlybanhang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quanlybanhang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quanlybanhang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quanlybanhang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Quanlybanhang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quanlybanhang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quanlybanhang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quanlybanhang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quanlybanhang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quanlybanhang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quanlybanhang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quanlybanhang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Quanlybanhang] SET  MULTI_USER 
GO
ALTER DATABASE [Quanlybanhang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quanlybanhang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quanlybanhang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quanlybanhang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Quanlybanhang] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Quanlybanhang]
GO
/****** Object:  Table [dbo].[tblDangNhap]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDangNhap](
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHoaDonBan]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoaDonBan](
	[MaHDB] [nvarchar](20) NOT NULL,
	[MaNV] [nvarchar](20) NOT NULL,
	[MaKH] [nvarchar](20) NULL,
	[MaMH] [nvarchar](20) NOT NULL,
	[NgayBan] [date] NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [int] NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_tblHoaDonBan_1] PRIMARY KEY CLUSTERED 
(
	[MaHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHoaDonNhap]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoaDonNhap](
	[MaHDN] [nvarchar](20) NOT NULL,
	[MaNV] [nvarchar](20) NOT NULL,
	[MaNCC] [nvarchar](20) NOT NULL,
	[MaMH] [nvarchar](20) NULL,
	[Ngaynhap] [date] NULL,
	[SoLuong] [int] NULL,
	[GiaNhap] [int] NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_tblHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKhachHang]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhachHang](
	[MaKH] [nvarchar](20) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[SDT] [int] NULL,
 CONSTRAINT [PK_tblKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMatHang]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMatHang](
	[MaMH] [nvarchar](20) NOT NULL,
	[TenMH] [nvarchar](50) NULL,
	[MaNCC] [nvarchar](20) NULL,
	[NSX] [nvarchar](100) NULL,
	[Soluong] [int] NULL,
	[Giaban] [int] NULL,
 CONSTRAINT [PK_dbo.tblMatHang] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNhaCungCap]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhaCungCap](
	[MaNCC] [nvarchar](20) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [int] NULL,
	[Diachi] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblNhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNhanVien]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhanVien](
	[MaNV] [nvarchar](20) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[SDT] [int] NULL,
	[Diachi] [nvarchar](50) NULL,
	[Luong] [int] NULL,
 CONSTRAINT [PK_tblNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwDoanhthu]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwDoanhthu]
as
select tblHoaDonBan.MaHDB as[Mã hóa đơn], tblMatHang.TenMH as[Tên mặt hàng],tblHoaDonBan.NgayBan, tblHoaDonBan.SoLuong as[Số lượng], tblHoaDonBan.GiaBan as[Đơn giá], tblHoaDonBan.TongTien as[Tổng tiền]
from tblHoaDonBan, tblMatHang
where tblHoaDonBan.MaMH = tblMatHang.MaMH



GO
/****** Object:  View [dbo].[vwDoanhThu1]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwDoanhThu1]
as
select tblHoaDonBan.MaHDB as[Mã hóa đơn], tblMatHang.TenMH as[Tên mặt hàng], tblHoaDonBan.SoLuong as[Số lượng], tblHoaDonBan.GiaBan as[Đơn giá],sum(tblHoaDonBan.TongTien)as [Tổng tiền]
from tblHoaDonBan, tblMatHang
where tblHoaDonBan.MaMH = tblMatHang.MaMH
group by tblHoaDonBan.MaHDB, tblMatHang.TenMH, tblHoaDonBan.SoLuong, tblHoaDonBan.GiaBan, tblHoaDonBan.TongTien


GO
/****** Object:  View [dbo].[vwDoanhThu2]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwDoanhThu2]
as
select tblHoaDonBan.MaHDB as[Mã hóa đơn], tblMatHang.TenMH as[Tên mặt hàng], tblHoaDonBan.SoLuong as[Số lượng], tblHoaDonBan.GiaBan as[Đơn giá], tblHoaDonBan.TongTien as[Tổng tiền]
from tblHoaDonBan, tblMatHang
where tblHoaDonBan.MaMH = tblMatHang.MaMH



GO
/****** Object:  View [dbo].[vwDoanhThuCH]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwDoanhThuCH]
as
select tblHoaDonBan.MaHDB as[Mã hóa đơn], tblMatHang.TenMH as[Tên mặt hàng],tblHoaDonBan.NgayBan as [Ngày bán], tblHoaDonBan.SoLuong as[Số lượng], tblHoaDonBan.GiaBan as[Đơn giá], tblHoaDonBan.TongTien as[Tổng tiền]
from tblHoaDonBan, tblMatHang
where tblHoaDonBan.MaMH = tblMatHang.MaMH



GO
/****** Object:  View [dbo].[vwDT]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwDT]
as
select tblHoaDonBan.MaHDB as[Mã hóa đơn], tblMatHang.TenMH as[Tên mặt hàng],tblHoaDonBan.NgayBan, tblHoaDonBan.SoLuong as[Số lượnng], tblHoaDonBan.GiaBan as[Đơn giá], tblHoaDonBan.TongTien as[Tổng tiền]
from tblHoaDonBan, tblMatHang
where tblHoaDonBan.MaMH = tblMatHang.MaMH



GO
/****** Object:  View [dbo].[vwHangTon1]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwHangTon1]
as
select tblMatHang.MaMH as [Mã mặt hàng], tblMatHang.TenMH as [Tên mặt hàng], sum(tblMatHang.Soluong) as [Tổng mặt hàng], sum(tblHoaDonNhap.SoLuong)as [Tổng nhập], sum(tblHoaDonBan.SoLuong)as [Tổng bán], sum(tblMatHang.Soluong+ tblHoaDonNhap.SoLuong - tblHoaDonBan.SoLuong) as [Số tồn]
from  tblHoaDonNhap   left join tblMatHang on tblHoaDonNhap.MaMH= tblMatHang.MaMH  left  join tblHoaDonBan on tblHoaDonBan.MaMH= tblMatHang.MaMH
group by tblMatHang.MaMH, tblMatHang.TenMH 

GO
/****** Object:  View [dbo].[vwHangTonCH]    Script Date: 30/04/2018 11:53:37 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwHangTonCH]
as
select tblMatHang.MaMH as [Mã mặt hàng], tblMatHang.TenMH as [Tên mặt hàng], sum(tblMatHang.Soluong) as [Tổng mặt hàng], sum(tblHoaDonNhap.SoLuong)as [Tổng nhập], sum(tblHoaDonBan.SoLuong)as [Tổng bán], sum(tblMatHang.Soluong+ tblHoaDonNhap.SoLuong - tblHoaDonBan.SoLuong) as [Số tồn]
from  tblHoaDonNhap   left join tblMatHang on tblHoaDonNhap.MaMH= tblMatHang.MaMH  left  join tblHoaDonBan on tblHoaDonBan.MaMH= tblMatHang.MaMH
group by tblMatHang.MaMH, tblMatHang.TenMH 


GO
ALTER TABLE [dbo].[tblHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDonBan_tblKhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[tblKhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[tblHoaDonBan] CHECK CONSTRAINT [FK_tblHoaDonBan_tblKhachHang]
GO
ALTER TABLE [dbo].[tblHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDonBan_tblNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tblNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tblHoaDonBan] CHECK CONSTRAINT [FK_tblHoaDonBan_tblNhanVien]
GO
ALTER TABLE [dbo].[tblHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDonNhap_tblNhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tblNhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[tblHoaDonNhap] CHECK CONSTRAINT [FK_tblHoaDonNhap_tblNhaCungCap]
GO
ALTER TABLE [dbo].[tblHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDonNhap_tblNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tblNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tblHoaDonNhap] CHECK CONSTRAINT [FK_tblHoaDonNhap_tblNhanVien]
GO
ALTER TABLE [dbo].[tblMatHang]  WITH CHECK ADD  CONSTRAINT [FK_tblMatHang_tblNhaCungCap1] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tblNhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[tblMatHang] CHECK CONSTRAINT [FK_tblMatHang_tblNhaCungCap1]
GO
USE [master]
GO
ALTER DATABASE [Quanlybanhang] SET  READ_WRITE 
GO
