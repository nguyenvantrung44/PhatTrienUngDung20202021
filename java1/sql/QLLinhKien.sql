USE [QLLinhKien]
GO
/****** Object:  Table [dbo].[CT_HoaDon]    Script Date: 11/12/2020 10:50:44 AM ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 11/12/2020 10:50:44 AM ******/
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
 CONSTRAINT [PK_MaHD] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/12/2020 10:50:44 AM ******/
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
/****** Object:  Table [dbo].[Nhacungcap]    Script Date: 11/12/2020 10:50:44 AM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/12/2020 10:50:44 AM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/12/2020 10:50:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [varchar](6) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[MaNCC] [varchar](6) NULL,
	[Donvitinh] [nvarchar](20) NULL,
	[GiaGoc] [real] NULL,
	[DonGia] [real] NULL,
	[QuocGia] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/12/2020 10:50:44 AM ******/
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
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TaiKhoan] FOREIGN KEY([MaNV])
REFERENCES [dbo].[TaiKhoan] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TaiKhoan]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_MaNCC] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[Nhacungcap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_MaNCC]
GO
---------------------------------------------------------------------------
--Create Function and Trigger
--Function MaHD
go
create function func_nextIDHD(@lastmahd varchar(6),@prefix varchar(3),@size int)
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
Go
create trigger tr_nextIDHD on HoaDon
for insert
as
	begin
		declare @lastmahd varchar(6)
		set @lastmahd=(select top 1 MaHD from HoaDon order by MaHD desc)
		update HoaDon set MaHD= dbo.func_nextIDHD(@lastmahd,'MHD',6) where MaHD=''
	end
go
--Function MaKH
go
create function func_nextID(@lastmakh varchar(6),@prefix varchar(3),@size int)
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
Go
create trigger tr_nextID on [dbo].[KhachHang]
for insert
as
	begin
		declare @lastmakh varchar(6)
		set @lastmakh=(select top 1 [MaKH] from [dbo].[KhachHang] order by [MaKH] desc)
		update [dbo].[KhachHang] set MaKH= dbo.func_nextID(@lastmakh,'MKH',6) where MaKH=''
	end
go
--Function MaNCC
go
create function func_nextIDCC(@lastmacc varchar(6),@prefix varchar(3),@size int)
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
Go
create trigger tr_nextIDCC on Nhacungcap
for insert
as
	begin
		declare @lastmacc varchar(6)
		set @lastmacc=(select top 1  MaNCC from Nhacungcap order by MaNCC desc)
		update Nhacungcap set MaNCC= dbo.func_nextIDCC(@lastmacc,'NCC',6) where MaNCC=''
	end
go
--Function MaNV
go
create function func_nextIDNV(@lastmanv varchar(6),@prefix varchar(3),@size int)
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
Go
create trigger tr_nextIDNV on NhanVien
for insert
as
	begin
		declare @lastmanv varchar(6)
		set @lastmanv=(select top 1 MaNV from NhanVien order by MaNV desc)
		update NhanVien set MaNV= dbo.func_nextIDNV(@lastmanv,'MNV',6) where MaNV=''
	end
go
--Function MaSP
go
create function func_nextIDSP(@lastmasp varchar(6),@prefix varchar(3),@size int)
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
Go
create trigger tr_nextIDSP on SanPham
for insert
as
	begin
		declare @lastmasp varchar(6)
		set @lastmasp=(select top 1 MaSP from SanPham order by MaSP desc)
		update SanPham set MaSP= dbo.func_nextIDSP(@lastmasp,'MSP',6) where MaSP=''
	end
go

-------------------------------------------------------------------------------


