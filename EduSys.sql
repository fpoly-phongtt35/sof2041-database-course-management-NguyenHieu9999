create database EduSys
GO
USE EduSys
go
CREATE TABLE NhanVien(
	MaNV nvarchar(50) not null,
	MatKhau nvarchar(50) not null,
	HoTen nvarchar(50) not null,
	VaiTro bit not null,
	Primary key(MaNV)
)
go 
CREATE TABLE ChuyenDe(
	MaCD nchar(5) not null,
	TenCD nvarchar(50) not null,
	HocPhi float not null,
	ThoiLuong int not null ,
	Hinh nvarchar(50) not null,
	Mota nvarchar(255) not null,
	primary key(MaCD)

)
go
CREATE TABLE KhoaHoc(
	MaKH int identity(1,1) not null,
	MaCD nchar(5) not null,
	HocPhi float not null,
	ThoiLuong int not null,
	NgayKG date not null,
	GhiChu nvarchar(50) null,
	MaNV nvarchar(50) not null,
	NgayTao date not null,
	primary key(MaKH),
	Foreign key(MaCD) references ChuyenDe(MaCD) on delete no action on update cascade,
	Foreign key(MaNV) references NhanVien(MaNV) on delete no action on update cascade
	)
go
CREATE TABLE NguoiHoc(
	MaNH nchar(7) not null,
	HoTen nvarchar(50) not null,
	NgaySinh date not null,
	GioiTinh bit not null,
	DienThoai nvarchar(50) not null,
	Email nvarchar(50) not null,
	GhiChu nvarchar(max) null,
	MaNV nvarchar(50) not null,
	NgayDK date not null,
	primary key(MaNH),
	Foreign key(MaNV) references NhanVien(MaNV) on delete no action on update cascade
)
go
CREATE TABLE HocVien (
    MaHV int identity(1,1) not null,
    MaKH int not null,
    MaNH nchar(7) not null,
    Diem float not null,
    Primary key (MaHV),
    Foreign key (MaNH) references NguoiHoc (MaNH) on delete no action on update cascade,
    Foreign key (MaKH) references KhoaHoc (MaKH) on delete cascade on update no action
)
go

