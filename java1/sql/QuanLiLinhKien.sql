USE [master]
GO
/****** Object:  Database [QLLinhKien]    Script Date: 12/6/2020 12:04:38 PM ******/
CREATE DATABASE [QLLinhKien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLLinhKien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLLinhKien.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLLinhKien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLLinhKien_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLLinhKien] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLLinhKien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLLinhKien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLLinhKien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLLinhKien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLLinhKien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLLinhKien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLLinhKien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLLinhKien] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLLinhKien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLLinhKien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLLinhKien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLLinhKien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLLinhKien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLLinhKien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLLinhKien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLLinhKien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLLinhKien] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLLinhKien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLLinhKien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLLinhKien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLLinhKien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLLinhKien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLLinhKien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLLinhKien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLLinhKien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLLinhKien] SET  MULTI_USER 
GO
ALTER DATABASE [QLLinhKien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLLinhKien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLLinhKien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLLinhKien] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [QLLinhKien]
GO
/****** Object:  UserDefinedFunction [dbo].[func_nextDVT]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_nextDVT](@lastmadvt varchar(6),@prefix varchar(3),@size int)
returns varchar(6)
as
	begin
		if(@lastmadvt='')
			set @lastmadvt=@prefix + REPLICATE(0,@size - LEN(@prefix))
			declare @num_nextmadvt int, @nextmadvt varchar(6)
			set @lastmadvt=LTRIM(RTRIM(@lastmadvt))
			set @num_nextmadvt= REPLACE(@lastmadvt,@prefix,'')+1
			set @size=@size - LEN(@prefix)
			set @nextmadvt=@prefix + REPLICATE(0,@size - LEN(@prefix))
			set @nextmadvt=@prefix + RIGHT(REPLICATE(0,@size)+CONVERT(varchar(max),@num_nextmadvt),@size)
			return @nextmadvt
	end

GO
/****** Object:  UserDefinedFunction [dbo].[func_nextID]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_nextID](@lastmakh varchar(6),@prefix varchar(3),@size int)
returns varchar(6)
as
	begin
		if(@lastmakh='')
			set @lastmakh=@prefix + REPLICATE(0,@size - LEN(@prefix))
			declare @num_nextmakh int, @nextmakh varchar(6)
			set @lastmakh=LTRIM(RTRIM(@lastmakh))
			set @num_nextmakh= REPLACE(@lastmakh,@prefix,'')+1
			set @size=@size - LEN(@prefix)
			set @nextmakh=@prefix + REPLICATE(0,@size - LEN(@prefix))
			set @nextmakh=@prefix + RIGHT(REPLICATE(0,@size)+CONVERT(varchar(max),@num_nextmakh),@size)
			return @nextmakh
	end

GO
/****** Object:  UserDefinedFunction [dbo].[func_nextIDCC]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_nextIDCC](@lastmacc varchar(6),@prefix varchar(3),@size int)
returns varchar(6)
as
	begin
		if(@lastmacc='')
			set @lastmacc=@prefix + REPLICATE(0,@size - LEN(@prefix))
			declare @num_nextmacc int, @nextmacc varchar(6)
			set @lastmacc=LTRIM(RTRIM(@lastmacc))
			set @num_nextmacc= REPLACE(@lastmacc,@prefix,'')+1
			set @size=@size - LEN(@prefix)
			set @nextmacc=@prefix + REPLICATE(0,@size - LEN(@prefix))
			set @nextmacc=@prefix + RIGHT(REPLICATE(0,@size)+CONVERT(varchar(max),@num_nextmacc),@size)
			return @nextmacc
	end

GO
/****** Object:  UserDefinedFunction [dbo].[func_nextIDHD]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_nextIDHD](@lastmahd varchar(6),@prefix varchar(3),@size int)
returns varchar(6)
as
	begin
		if(@lastmahd='')
			set @lastmahd=@prefix + REPLICATE(0,@size - LEN(@prefix))
			declare @num_nextmahd int, @nextmahd varchar(6)
			set @lastmahd=LTRIM(RTRIM(@lastmahd))
			set @num_nextmahd= REPLACE(@lastmahd,@prefix,'')+1
			set @size=@size - LEN(@prefix)
			set @nextmahd=@prefix + REPLICATE(0,@size - LEN(@prefix))
			set @nextmahd=@prefix + RIGHT(REPLICATE(0,@size)+CONVERT(varchar(max),@num_nextmahd),@size)
			return @nextmahd
	end

GO
/****** Object:  UserDefinedFunction [dbo].[func_nextIDNV]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_nextIDNV](@lastmanv varchar(6),@prefix varchar(3),@size int)
returns varchar(6)
as
	begin
		if(@lastmanv='')
			set @lastmanv=@prefix + REPLICATE(0,@size - LEN(@prefix))
			declare @num_nextmanv int, @nextmanv varchar(6)
			set @lastmanv=LTRIM(RTRIM(@lastmanv))
			set @num_nextmanv= REPLACE(@lastmanv,@prefix,'')+1
			set @size=@size - LEN(@prefix)
			set @nextmanv=@prefix + REPLICATE(0,@size - LEN(@prefix))
			set @nextmanv=@prefix + RIGHT(REPLICATE(0,@size)+CONVERT(varchar(max),@num_nextmanv),@size)
			return @nextmanv
	end

GO
/****** Object:  UserDefinedFunction [dbo].[func_nextIDSP]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_nextIDSP](@lastmasp varchar(6),@prefix varchar(3),@size int)
returns varchar(6)
as
	begin
		if(@lastmasp='')
			set @lastmasp=@prefix + REPLICATE(0,@size - LEN(@prefix))
			declare @num_nextmasp int, @nextmasp varchar(6)
			set @lastmasp=LTRIM(RTRIM(@lastmasp))
			set @num_nextmasp= REPLACE(@lastmasp,@prefix,'')+1
			set @size=@size - LEN(@prefix)
			set @nextmasp=@prefix + REPLICATE(0,@size - LEN(@prefix))
			set @nextmasp=@prefix + RIGHT(REPLICATE(0,@size)+CONVERT(varchar(max),@num_nextmasp),@size)
			return @nextmasp
	end

GO
/****** Object:  UserDefinedFunction [dbo].[func_nextQG]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_nextQG](@lastmaqg varchar(6),@prefix varchar(3),@size int)
returns varchar(6)
as
	begin
		if(@lastmaqg='')
			set @lastmaqg=@prefix + REPLICATE(0,@size - LEN(@prefix))
			declare @num_nextmaqg int, @nextmaqg varchar(6)
			set @lastmaqg=LTRIM(RTRIM(@lastmaqg))
			set @num_nextmaqg= REPLACE(@lastmaqg,@prefix,'')+1
			set @size=@size - LEN(@prefix)
			set @nextmaqg=@prefix + REPLICATE(0,@size - LEN(@prefix))
			set @nextmaqg=@prefix + RIGHT(REPLICATE(0,@size)+CONVERT(varchar(max),@num_nextmaqg),@size)
			return @nextmaqg
	end

GO
/****** Object:  UserDefinedFunction [dbo].[ThongKeLinhKienDaBan]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ThongKeLinhKienDaBan](@ngay int, @thang int, @nam int)
returns @ThongKeLinhKienDaBan table(MaSP varchar(6), TenSP varchar(6), Soluongban nvarchar(50), NgayLapHD datetime)
as
	begin
		insert into @ThongKeLinhKienDaBan
		select ct.MaSP,sp.TenSP,sum(ct.Soluong) as "Soluong",
		h.NgayLapHD as NgayLap
		from CT_HoaDon ct left join SanPham sp on ct.MaSP=sp.MaSP
		left join HoaDon h on ct.MaHD=h.MaHD
		where DAY(h.NgayLapHD) = @ngay and MONTH(h.NgayLapHD) =@thang and 
				YEAR(h.NgayLapHD)=@nam
		group by ct.MaSP,sp.TenSP,h.NgayLapHD
		return
	end

GO
/****** Object:  UserDefinedFunction [dbo].[ThongKeSanPhamNhanVienDaBanTheoNgay]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ThongKeSanPhamNhanVienDaBanTheoNgay](@maNV varchar(6), @ngay int, @thang int, @nam int)
returns @ThongKeSanPhamNhanVienDaBanTheoNgay table(MaNhanVien varchar(6), TenSanPham nvarchar(50), NgayLapHD datetime, SoLuong int, TongTien real)
as
	begin
		if(@maNV is null)
		begin
			insert into @ThongKeSanPhamNhanVienDaBanTheoNgay
			select nv.MaNV, TenSP, NgayLapHD,Soluong,cthd.Soluong*cthd.Dongia
			from CT_HoaDon cthd inner join HoaDon hd
				 on cthd.MaHD = hd.MaHD inner join NhanVien nv
				 on hd.MaNV = nv.MaNV inner join SanPham sp
				 on sp.MaSP = cthd.MaSP
			where day(NgayLapHD) = @ngay and month(NgayLapHD) = @thang and year(NgayLapHD) = @nam
		end
		else
			begin
				insert into @ThongKeSanPhamNhanVienDaBanTheoNgay
				select nv.MaNV, TenSP, NgayLapHD,Soluong,cthd.Soluong*cthd.Dongia
				from CT_HoaDon cthd inner join HoaDon hd
					 on cthd.MaHD = hd.MaHD inner join NhanVien nv
					 on hd.MaNV = nv.MaNV inner join SanPham sp
					 on sp.MaSP = cthd.MaSP
				where nv.MaNV like @maNV and 
					  day(NgayLapHD) = @ngay and month(NgayLapHD) = @thang and year(NgayLapHD) = @nam
			end
	return
	end


GO
/****** Object:  UserDefinedFunction [dbo].[TimKiemHoaDon]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[TimKiemHoaDon](@tenKH nvarchar(50), @tenNV nvarchar(50), @ngay int, @thang int, @nam int)
returns @TimKiemHoaDon table(MaHoaDon varchar(6), NgayLapHoaDon datetime, TongTien real, TenKhachHang nvarchar(50), TenNhanVien nvarchar(50))
as
	begin
		if(@tenKH is null)
			begin
			insert into @TimKiemHoaDon
				select MaHD, NgayLapHD, TongTien, TenKH, TenNV
					from HoaDon hd inner join KhachHang kh
						on hd.MaKH = kh.MaKH inner join NhanVien nv
						on hd.MaNV = nv.MaNV
				where TenNV like @tenNV
		 and (day(NgayLapHD) = @ngay and month(NgayLapHD) = @thang and year(NgayLapHD) = @nam)
			end
			else 
				begin
					insert into @TimKiemHoaDon
				select MaHD, NgayLapHD, TongTien, TenKH, TenNV
					from HoaDon hd inner join KhachHang kh
						on hd.MaKH = kh.MaKH inner join NhanVien nv
						on hd.MaNV = nv.MaNV
				where TenKH like @tenKH and TenNV like @tenNV
		 and (day(NgayLapHD) = @ngay and month(NgayLapHD) = @thang and year(NgayLapHD) = @nam)
				end	
	return
	end

GO
/****** Object:  UserDefinedFunction [dbo].[TimKiemKhachHang]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[TimKiemKhachHang](@tenKH nvarchar(50), @phone nvarchar(24))
returns @TimKiemKhachHang table(tenKH nvarchar(50), diaChi nvarchar(100), Phone nvarchar(24), Email nvarchar (50)
				,Thoigiankhoitao datetime)
as
	begin 
		if (@tenKH is null)
			begin 
				insert into @TimKiemKhachHang
				select TenKH,DiaChi, Phone, Email, Thoigiankhoitao
				from KhachHang
				where Phone like @phone
			end
		else if (@phone is null)
			begin
				insert into @TimKiemKhachHang
				select TenKH,DiaChi, Phone, Email, Thoigiankhoitao
				from KhachHang
				where TenKH like @tenKH
			end
		else
			begin
				insert into @TimKiemKhachHang
				select TenKH,DiaChi, Phone, Email, Thoigiankhoitao
				from KhachHang
				where TenKH like @tenKH and Phone like @phone
			end
	return
	end

GO
/****** Object:  UserDefinedFunction [dbo].[TimKiemLinhKien]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[TimKiemLinhKien](@tenSP nvarchar(50), @maNCC varchar(6), @donGia1 real, @donGia2 real)
returns @TimKiemLinhKien table(TenSanPham nvarchar(50), GiaGoc real, DonGia real, SoLuongTon int, TenDonViTinh nvarchar(50))
as
	begin
		if(@tenSP is null)
			begin
				insert into @TimKiemLinhKien
				select TenSP, GiaGoc, DonGia, SLTon, dvt.TenDVT	
				from SanPham sp inner join Nhacungcap ncc 
					 on sp.MaNCC = ncc.MaNCC inner join DonViTinh dvt
					 on sp.MaDVT = dvt.MaDVT
				where ncc.MaNCC like @maNCC and (DonGia between @donGia1 and @donGia2)
			end
		else
			begin
				insert into @TimKiemLinhKien
				select TenSP, GiaGoc, DonGia, SLTon, dvt.TenDVT 
				from SanPham sp inner join Nhacungcap ncc 
					 on sp.MaNCC = ncc.MaNCC inner join DonViTinh dvt
					 on sp.MaDVT = dvt.MaDVT
				where TenSP like @tenSP and ncc.MaNCC like @maNCC 
					  and (DonGia between @donGia1 and @donGia2)				
			end
	return
	end

GO
/****** Object:  Table [dbo].[CT_HoaDon]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_HoaDon](
	[MaHD] [varchar](6) NOT NULL,
	[MaSP] [varchar](6) NOT NULL,
	[Soluong] [smallint] NULL,
	[Dongia] [real] NULL,
 CONSTRAINT [PK_CT_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonViTinh]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonViTinh](
	[MaDVT] [varchar](6) NOT NULL,
	[TenDVT] [varchar](50) NULL,
 CONSTRAINT [PK_DonViTinh] PRIMARY KEY CLUSTERED 
(
	[MaDVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [varchar](6) NOT NULL,
	[NgayLapHD] [datetime] NULL,
	[NgayGiaoHang] [datetime] NULL,
	[NoiNhanHang] [nvarchar](100) NULL,
	[MaNV] [varchar](6) NULL,
	[MaKH] [varchar](6) NULL,
	[TongTien] [real] NOT NULL,
 CONSTRAINT [PK_MaHD] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [varchar](6) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Phone] [nvarchar](24) NULL,
	[Email] [nvarchar](50) NULL,
	[Thoigiankhoitao] [datetime] NULL,
 CONSTRAINT [PK_MaKH] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nhacungcap]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nhacungcap](
	[MaNCC] [varchar](6) NOT NULL,
	[TenNCC] [nvarchar](40) NULL,
	[Diachi] [nvarchar](60) NULL,
	[Phone] [varchar](50) NULL,
	[SoFax] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Thoigiankhoitao] [datetime] NULL,
 CONSTRAINT [PK_MaNCC] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](6) NOT NULL,
	[Role] [varchar](50) NULL,
	[HoNV] [varchar](50) NULL,
	[TenNV] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[GioiTinh] [varchar](50) NULL,
	[Thoigiankhoitao] [datetime] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuocGia]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuocGia](
	[MaQG] [varchar](6) NOT NULL,
	[TenQG] [varchar](20) NOT NULL,
 CONSTRAINT [PK_QuocGia] PRIMARY KEY CLUSTERED 
(
	[MaQG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [varchar](6) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[MaNCC] [varchar](6) NOT NULL,
	[MaDVT] [varchar](6) NOT NULL,
	[GiaGoc] [real] NULL,
	[DonGia] [real] NULL,
	[MaQG] [varchar](6) NOT NULL,
	[MoTa] [nvarchar](50) NULL,
	[SLTon] [int] NULL,
	[Thoigiankhoitao] [datetime] NULL,
 CONSTRAINT [PK_MaSP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/6/2020 12:04:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaNV] [varchar](6) NOT NULL,
	[TenTK] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSP], [Soluong], [Dongia]) VALUES (N'MHD013', N'MSP015', 1, 2400000)
INSERT [dbo].[CT_HoaDon] ([MaHD], [MaSP], [Soluong], [Dongia]) VALUES (N'MHD013', N'MSP017', 1, 1260000)
INSERT [dbo].[DonViTinh] ([MaDVT], [TenDVT]) VALUES (N'MDV001', N'O cung')
INSERT [dbo].[DonViTinh] ([MaDVT], [TenDVT]) VALUES (N'MDV002', N'Chíp ')
INSERT [dbo].[DonViTinh] ([MaDVT], [TenDVT]) VALUES (N'MDV003', N'Thanh')
INSERT [dbo].[DonViTinh] ([MaDVT], [TenDVT]) VALUES (N'MDV004', N'Ram')
INSERT [dbo].[HoaDon] ([MaHD], [NgayLapHD], [NgayGiaoHang], [NoiNhanHang], [MaNV], [MaKH], [TongTien]) VALUES (N'MHD013', CAST(N'2020-12-03 18:41:58.447' AS DateTime), CAST(N'2020-12-09 18:41:48.160' AS DateTime), N'Ha Noi', N'MNV001', N'MKH002', 3843000)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH001', N'Nguyen Hung PhatTai', N'Tay Ninh', N'0572099751', N'nguyenhungpha@gmail.com', CAST(N'2020-11-12 12:31:35.907' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH002', N'Nguyen Van Trung', N'Khanh Hoa', N'0911982090', N'nguyenvantrung@gmail.com', CAST(N'2020-11-12 12:32:07.263' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH003', N'Nguyen Van Vi', N'Ha Noi', N'0935714251', N'vanvi@gmail.com', CAST(N'2020-11-14 00:41:05.220' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH004', N'Nguyen Hung Phat', N'Phu Yen', N'0911983090', N'hungphat@gmail.com', CAST(N'2020-11-14 00:47:54.977' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH005', N'Hieu Nguyen', N'Ho Chi Minh', N'0911982347', N'hieunguyen@gmail.com', CAST(N'2020-11-14 00:51:01.317' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH006', N'Le Thi Diem', N'Quan 9 - Ho Chi Minh', N'0354654657', N'diem@gmail.com', CAST(N'2020-11-14 00:57:51.227' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH008', N'Hoa Hau', N'USA', N'0156854181', N'hoahau@gmail.com', CAST(N'2020-11-14 01:01:46.333' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH010', N'Tran Thi Tien', N'Hue', N'0157183568', N'tien@gmail.com', CAST(N'2020-11-14 01:19:11.773' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH011', N'Nguyen Hue', N'Binh Dinh', N'0125894567', N'huenguyen@gmail.com', CAST(N'2020-11-14 01:25:13.367' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH012', N'Nguyen Ngoc Ngan', N'Ho Chi Minh', N'0978214645', N'ngannguyen@gmail.com', CAST(N'2020-11-14 02:27:06.813' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH014', N'Nguyen Thu Thuy', N'Go Vap - Ho Chi Minh', N'0935146541', N'thunguyen@gmail.com', CAST(N'2020-11-16 17:02:13.537' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH015', N'Hung Nguyen', N'Tan Phu - Ho Chi Minh', N'0922828282', N'hungnguyen@gmail.com', CAST(N'2020-11-17 09:16:45.023' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH016', N'Nguyen Thi Hue', N'Thu Duc - HCM', N'0911986689', N'hue@gmail.com', CAST(N'2020-11-20 13:06:39.013' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH017', N'Nguyen Van Dau', N'Ho Chi Minh', N'0324569874', N'daunguyen@gmail.com', CAST(N'2020-11-25 19:02:11.407' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH018', N'Nguyen Thi Lieu', N'Khanh Hoa', N'0987754684', N'lieu@gmail.com', CAST(N'2020-11-25 19:02:43.733' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH019', N'Hieu Huynh', N'Hai Ba Trung, Ha Noi', N'0965814567', N'hieutran@gmail.com', CAST(N'2020-11-26 22:35:55.097' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH020', N'NguyenThiB', N'ưq', N'098745645', N'b@gmail.com', CAST(N'2020-11-30 14:52:50.470' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Phone], [Email], [Thoigiankhoitao]) VALUES (N'MKH021', N'Nguyen Thi Banh', N'dsm', N'0985648575', N'trung@gmail.com', CAST(N'2020-11-30 15:01:07.980' AS DateTime))
INSERT [dbo].[Nhacungcap] ([MaNCC], [TenNCC], [Diachi], [Phone], [SoFax], [Email], [Thoigiankhoitao]) VALUES (N'NCC001', N'Gear VN', N'samgaslgblg', N'0987654321', N'12345678999', N'gearvn@gmail.com', CAST(N'2020-11-12 11:57:09.107' AS DateTime))
INSERT [dbo].[Nhacungcap] ([MaNCC], [TenNCC], [Diachi], [Phone], [SoFax], [Email], [Thoigiankhoitao]) VALUES (N'NCC002', N'Samsung', N'Ho Chi Minh', N'0987654321', N'12345678999', N'minhhieu@gmail.com', CAST(N'2020-12-01 11:57:36.090' AS DateTime))
INSERT [dbo].[Nhacungcap] ([MaNCC], [TenNCC], [Diachi], [Phone], [SoFax], [Email], [Thoigiankhoitao]) VALUES (N'NCC003', N'Van Minh', N'Sai Gon', N'0987654321', N'12345678987', N'vanminh@gamil.com', CAST(N'2020-11-12 12:27:49.970' AS DateTime))
INSERT [dbo].[Nhacungcap] ([MaNCC], [TenNCC], [Diachi], [Phone], [SoFax], [Email], [Thoigiankhoitao]) VALUES (N'NCC004', N'Apple', N'Hoa Ky', N'0147258362', N'14725836915', N'phongvu@gmail.com', CAST(N'2020-12-01 11:57:45.353' AS DateTime))
INSERT [dbo].[Nhacungcap] ([MaNCC], [TenNCC], [Diachi], [Phone], [SoFax], [Email], [Thoigiankhoitao]) VALUES (N'NCC005', N'NhaCC3', N'djl', N'0123456789', N'12345678974', N'tiiu@gmail.com', CAST(N'2020-11-29 15:49:23.333' AS DateTime))
INSERT [dbo].[Nhacungcap] ([MaNCC], [TenNCC], [Diachi], [Phone], [SoFax], [Email], [Thoigiankhoitao]) VALUES (N'NCC006', N'NhaCC2', N's', N'0285465878', N'11111111111', N'nhacc1@gmail.com', CAST(N'2020-11-26 21:47:56.347' AS DateTime))
INSERT [dbo].[Nhacungcap] ([MaNCC], [TenNCC], [Diachi], [Phone], [SoFax], [Email], [Thoigiankhoitao]) VALUES (N'NCC007', N'Amazon', N'11', N'0906624069', N'12345690011', N'amaz@gmail.com', CAST(N'2020-12-02 12:29:41.613' AS DateTime))
INSERT [dbo].[NhanVien] ([MaNV], [Role], [HoNV], [TenNV], [DiaChi], [Phone], [Email], [GioiTinh], [Thoigiankhoitao]) VALUES (N'MNV001', N'admin', N'admin', N'admin', N'admin', N'123457896', N'admin@gmail.com', N'Nam', CAST(N'2020-11-26 00:00:00.000' AS DateTime))
INSERT [dbo].[NhanVien] ([MaNV], [Role], [HoNV], [TenNV], [DiaChi], [Phone], [Email], [GioiTinh], [Thoigiankhoitao]) VALUES (N'MNV002', N'ban hang', N'nhanvien', N'nhanvien', N'nhanvien', N'1234567892', N'nhanvien@gmail.com', N'1', CAST(N'2020-11-26 00:00:00.000' AS DateTime))
INSERT [dbo].[NhanVien] ([MaNV], [Role], [HoNV], [TenNV], [DiaChi], [Phone], [Email], [GioiTinh], [Thoigiankhoitao]) VALUES (N'MNV003', N'ban hang', N'Ly', N'HongCam', N'Dong Da, Ha Noi', N'0985647854', N'hongcam@gmail.com', N'1', CAST(N'2020-11-26 22:38:45.003' AS DateTime))
INSERT [dbo].[NhanVien] ([MaNV], [Role], [HoNV], [TenNV], [DiaChi], [Phone], [Email], [GioiTinh], [Thoigiankhoitao]) VALUES (N'MNV004', N'ban hang', N'Nguyen', N'Hieu', N'tphcm', N'0906624069', N'hieu@gmail.com', N'0', CAST(N'2020-12-02 13:20:29.557' AS DateTime))
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG001', N'USA')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG002', N'China')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG003', N'Korean')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG004', N'VietNam')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG005', N'Lao')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG006', N'Campodia')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG007', N'Taiwan')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG008', N'UK')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG009', N'Idian')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG010', N'Thailand')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG011', N'Singapore')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG012', N'Russian')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG013', N'Philippin')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG014', N'Australia')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG015', N'Germany')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG016', N'Baland')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG017', N'Mexican')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG018', N'Argentina')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG019', N'Brazil')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG020', N'Italian')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG021', N'Japan')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG022', N' Myanmar')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (N'MQG023', N'test')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaNCC], [MaDVT], [GiaGoc], [DonGia], [MaQG], [MoTa], [SLTon], [Thoigiankhoitao]) VALUES (N'MSP012', N'test0', N'NCC003', N'MDV002', 1400000, 1680000, N'MQG007', N'aa', 48, CAST(N'2020-12-01 11:40:01.673' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaNCC], [MaDVT], [GiaGoc], [DonGia], [MaQG], [MoTa], [SLTon], [Thoigiankhoitao]) VALUES (N'MSP013', N'test4', N'NCC003', N'MDV002', 1000000, 1200000, N'MQG005', N'nbbd', 35, CAST(N'2020-12-01 11:54:51.230' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaNCC], [MaDVT], [GiaGoc], [DonGia], [MaQG], [MoTa], [SLTon], [Thoigiankhoitao]) VALUES (N'MSP014', N'test2', N'NCC004', N'MDV003', 1000000, 1200000, N'MQG005', N'dđ', 44, CAST(N'2020-12-01 11:40:20.447' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaNCC], [MaDVT], [GiaGoc], [DonGia], [MaQG], [MoTa], [SLTon], [Thoigiankhoitao]) VALUES (N'MSP015', N'test3', N'NCC003', N'MDV002', 2000000, 2400000, N'MQG004', N'nnn', 43, CAST(N'2020-11-27 21:34:06.453' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaNCC], [MaDVT], [GiaGoc], [DonGia], [MaQG], [MoTa], [SLTon], [Thoigiankhoitao]) VALUES (N'MSP016', N'test5', N'NCC004', N'MDV001', 1750000, 2100000, N'MQG005', N'dd', 46, CAST(N'2020-11-27 21:34:12.690' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaNCC], [MaDVT], [GiaGoc], [DonGia], [MaQG], [MoTa], [SLTon], [Thoigiankhoitao]) VALUES (N'MSP017', N'test6', N'NCC005', N'MDV001', 1050000, 1260000, N'MQG002', N's', 47, CAST(N'2020-11-27 21:34:18.703' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaNCC], [MaDVT], [GiaGoc], [DonGia], [MaQG], [MoTa], [SLTon], [Thoigiankhoitao]) VALUES (N'MSP018', N'test7', N'NCC002', N'MDV002', 1000000, 1200000, N'MQG003', N'aa', 55, CAST(N'2020-12-02 12:24:23.193' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaNCC], [MaDVT], [GiaGoc], [DonGia], [MaQG], [MoTa], [SLTon], [Thoigiankhoitao]) VALUES (N'MSP019', N'test8', N'NCC004', N'MDV002', 1000000, 1200000, N'MQG003', N'sk', 33, CAST(N'2020-12-02 12:26:53.877' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaNCC], [MaDVT], [GiaGoc], [DonGia], [MaQG], [MoTa], [SLTon], [Thoigiankhoitao]) VALUES (N'MSP020', N'test10', N'NCC001', N'MDV001', 1000000, 1200000, N'MQG023', N'test', 10, CAST(N'2020-12-02 16:10:21.553' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaNV], [TenTK], [MatKhau]) VALUES (N'MNV001', N'admin', N'123456')
INSERT [dbo].[TaiKhoan] ([MaNV], [TenTK], [MatKhau]) VALUES (N'MNV002', N'nhanvien', N'12345')
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CT_HoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK_CT_HoaDon_HoaDon]
GO
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_MaSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK_MaSP]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_MaKH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_MaKH]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_MaNCC] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[Nhacungcap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_MaNCC]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DonViTinh] FOREIGN KEY([MaDVT])
REFERENCES [dbo].[DonViTinh] ([MaDVT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DonViTinh]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_QuocGia] FOREIGN KEY([MaQG])
REFERENCES [dbo].[QuocGia] ([MaQG])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_QuocGia]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhanVien]
GO
USE [master]
GO
ALTER DATABASE [QLLinhKien] SET  READ_WRITE 
GO
