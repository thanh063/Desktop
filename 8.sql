CREATE DATABASE QLThuVienCaNhan12;
GO
USE QLThuVienCaNhan12;
GO
CREATE TABLE NGUOIMUON (
    MaNguoiMuon INT IDENTITY(1,1) PRIMARY KEY, -- Mã tự động tăng
    TenNguoiMuon NVARCHAR(100) NOT NULL,       -- Tên người mượn
    SDT NVARCHAR(20) NOT NULL,                -- Số điện thoại
    DiaChi NVARCHAR(200),                     -- Địa chỉ
    TenSach NVARCHAR(200),                    -- Sách mượn
    NgayMuon DATE,                            -- Ngày mượn
    NgayTra DATE                              -- Ngày trả dự kiến
);
INSERT INTO NGUOIMUON (TenNguoiMuon, SDT, DiaChi, TenSach, NgayMuon, NgayTra)
VALUES 
    (N'Nguyễn Văn A', '0912345678', N'Hà Nội', N'Lập trình C#', '2024-11-01', '2024-12-01'),
    (N'Lê Thị B', '0987654321', N'Hồ Chí Minh', N'Kỹ thuật SQL', '2024-11-15', '2024-12-15');
CREATE TABLE SACH (
    MaSach INT IDENTITY(1,1) PRIMARY KEY,  -- Mã sách tự động tăng
    TenSach NVARCHAR(200) NOT NULL,       -- Tên sách
    TacGia NVARCHAR(100),                 -- Tác giả
    TheLoai NVARCHAR(50),                 -- Thể loại
    NamXuatBan INT,                       -- Năm xuất bản
    TrangThai NVARCHAR(50),               -- Trạng thái (VD: Có sẵn, Đã mượn, Hư hỏng)
    ViTri NVARCHAR(50)                    -- Vị trí sách (VD: Tủ A1, Tủ B2)
);
INSERT INTO SACH (TenSach, TacGia, TheLoai, NamXuatBan, TrangThai, ViTri)
VALUES 
    (N'Lập trình C#', N'Nguyễn Minh', N'Giáo trình', 2022, N'Có sẵn', N'Tủ A1'),
    (N'Kỹ thuật SQL', N'Lê Hùng', N'Giáo trình', 2023, N'Có sẵn', N'Tủ A2'),
    (N'Python cơ bản', N'Trần Văn B', N'Giáo trình', 2021, N'Đã mượn', N'Tủ B1');
CREATE TABLE MUONTRA (
    MaMuonTra INT IDENTITY(1,1) PRIMARY KEY,  -- Mã tự động tăng
    MaNguoiMuon INT NOT NULL,                 -- Mã người mượn (FK)
    MaSach INT NOT NULL,                      -- Mã sách (FK)
    NgayMuon DATE NOT NULL,                   -- Ngày mượn
    NgayTra DATE,                             -- Ngày trả
    TrangThai BIT NOT NULL,                   -- Trạng thái (0: Đang mượn, 1: Đã trả)
    FOREIGN KEY (MaNguoiMuon) REFERENCES NGUOIMUON(MaNguoiMuon),
    FOREIGN KEY (MaSach) REFERENCES SACH(MaSach)
);
INSERT INTO MUONTRA (MaNguoiMuon, MaSach, NgayMuon, NgayTra, TrangThai)
VALUES 
    (1, 1, '2024-11-01', '2024-12-01', 0), -- Người 1 mượn sách 1
    (2, 2, '2024-11-15', NULL, 0);         -- Người 2 mượn sách 2 (chưa trả)
CREATE TABLE THONGKE (
    MaThongKe INT IDENTITY(1,1) PRIMARY KEY, -- Mã tự động tăng
    TenThongKe NVARCHAR(100),               -- Tên báo cáo
    ThoiGianThucHien DATETIME DEFAULT GETDATE(), -- Thời gian tạo báo cáo
    GhiChu NVARCHAR(MAX)                    -- Ghi chú
);
INSERT INTO THONGKE (TenThongKe, GhiChu)
VALUES 
    (N'Thống kê sách theo tủ', N'Báo cáo sách hiện có trong thư viện theo từng vị trí');
