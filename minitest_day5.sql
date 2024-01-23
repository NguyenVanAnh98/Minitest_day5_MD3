CREATE DATABASE minites;
USE minites;
CREATE TABLE Vat_tu (
  id INT PRIMARY KEY,
  ma_vat_tu VARCHAR(50),
  ten_vat_tu VARCHAR(50),
  don_vi_tinh VARCHAR(50),
  gia_tien DECIMAL(10, 2)
);
CREATE TABLE Ton_kho (
  id INT PRIMARY KEY,
  vat_tu_id INT,
  so_luong_dau INT,
  tong_so_luong_nhap INT,
  tong_so_luong_xuat INT,
  FOREIGN KEY (vat_tu_id) REFERENCES Vat_tu(id)
);
CREATE TABLE Nha_Cung_cap (
  id INT PRIMARY KEY,
  ma_nha_cung_cap VARCHAR(50),
  ten_nha_cung_cap VARCHAR(50),
  dia_chi VARCHAR(100),
  so_dien_thoai VARCHAR(20)
);
CREATE TABLE Don_dat_hang (
  id INT PRIMARY KEY,
  ma_don VARCHAR(50),
  ngay_dat_hang DATE,
  nha_cung_cap_id INT,
  FOREIGN KEY (nha_cung_cap_id) REFERENCES Nha_cung_cap(id)
);
CREATE TABLE Phieu_nhap (
  id INT PRIMARY KEY,
  ma_phieu_nhap VARCHAR(50),
  ngay_nhap DATE,
  don_hang_id INT,
  FOREIGN KEY (don_hang_id) REFERENCES Don_dat_hang(id)
);
CREATE TABLE Phieu_xuat (
  id INT PRIMARY KEY,
  ma_phieu_xuat VARCHAR(50),
  ngay_xuat DATE,
  ten_khach_hang VARCHAR(50)
);
CREATE TABLE Chi_tiet_Don_hang (
  id INT PRIMARY KEY,
  don_hang_id INT,
  vat_tu_id INT,
  so_luong_dat INT,
  FOREIGN KEY (don_hang_id) REFERENCES Don_dat_hang(id),
  FOREIGN KEY (vat_tu_id) REFERENCES Vat_tu(id)
);
CREATE TABLE Chi_tiet_Phieu_nhap (
  id INT PRIMARY KEY,
  phieu_nhap_id INT,
  vat_tu_id INT,
  so_luong_nhap INT,
  don_gia_nhap DECIMAL(10, 2),
  ghi_chu VARCHAR(100),
  FOREIGN KEY (phieu_nhap_id) REFERENCES Phieu_nhap(id),
  FOREIGN KEY (vat_tu_id) REFERENCES Vat_tu(id)
);
CREATE TABLE Chi_tiet_Phieu_xuat (
  id INT PRIMARY KEY,
  phieu_xuat_id INT,
  vat_tu_id INT,
  so_luong_xuat INT,
  don_gia_xuat DECIMAL(10, 2),
  ghi_chu VARCHAR(100),
  FOREIGN KEY (phieu_xuat_id) REFERENCES phieu_xuat(id),
  FOREIGN KEY (vat_tu_id) REFERENCES Vat_tu(id)
);


//----------------- TAO BANG XONG
INSERT INTO Vat_tu (id, ma_Vat_tu, ten_Vat_tu, don_vi_tinh, gia_tien)
VALUES
  (1, 'VT001', 'Vat tu 1', 'Cai', 100),
  (2, 'VT002', 'Vat tu 2', 'Thung', 200),
  (3, 'VT003', 'Vat tu 3', 'Kg', 150),
  (4, 'VT004', 'Vat tu 4', 'Gram', 130),
  (5, 'VT005', 'Vat tu 5', 'Bao', 250);
  
  INSERT INTO Ton_kho (id, vat_tu_id, so_luong_dau, tong_so_luong_nhap, tong_so_luong_xuat)
VALUES
    (1, 1, 100, 200, 150),
    (2, 2, 50, 150, 100),
    (3, 3, 200, 300, 250),
    (4, 4, 80, 120, 100),
    (5, 5, 150, 250, 200);
  INSERT INTO Nha_Cung_cap (id, ma_nha_cung_cap, ten_nha_cung_cap, dia_chi, so_dien_thoai)
VALUES
    (1, 'NCC001', 'Nha cung cap 1', 'Dia chi 1', '1234567890'),
    (2, 'NCC002', 'Nha cung cap 2', 'Dia chi 2', '0987654321'),
    (3, 'NCC003', 'Nha cung cap 3', 'Dia chi 3', '9876543210');
   INSERT INTO don_dat_hang (id, ma_don, ngay_dat_hang, nha_cung_cap_id)
VALUES
    (1, 'DH001', '2022-01-01', 1),
    (2, 'DH002', '2022-02-01', 2),
    (3, 'DH003', '2022-03-01', 3);
    INSERT INTO phieu_nhap (id, ma_phieu_nhap, ngay_nhap, don_hang_id)
VALUES
    (1, 'PN001', '2022-01-10', 1),
    (2, 'PN002', '2022-02-10', 2),
    (3, 'PN003', '2022-03-10', 3);
    INSERT INTO phieu_xuat (id, ma_phieu_xuat, ngay_xuat, ten_khach_hang)
VALUES
    (1, 'PX001', '2022-01-20', 'Khach hang 1'),
    (2, 'PX002', '2022-02-20', 'Khach hang 2'),
    (3, 'PX003', '2022-03-20', 'Khach hang 3');
    INSERT INTO chi_tiet_don_hang (id, don_hang_id, vat_tu_id, so_luong_dat)
VALUES
    (1, 1, 1, 50),
    (2, 1, 2, 100),
    (3, 2, 3, 150),
    (4, 2, 4, 80),
    (5, 3, 5, 120),
    (6, 3, 1, 90);
    INSERT INTO chi_tiet_phieu_nhap (id, phieu_nhap_id, vat_tu_id, so_luong_nhap, don_gia_nhap, ghi_chu)
VALUES
    (1, 1, 1, 50, 90, 'Ghi chu 1'),
    (2, 1, 2, 80, 150, 'Ghi chu 2'),
    (3, 2, 3, 100, 120, 'Ghi chu 3'),
    (4, 2, 4, 60, 100, 'Ghi chu 4'),
    (5, 3, 5, 120, 170, 'Ghi chu 5'),
    (6, 3, 1, 70, 80, 'Ghi chu 6');
    INSERT INTO chi_tiet_phieu_xuat (id, phieu_xuat_id, vat_tu_id, so_luong_xuat, don_gia_xuat, ghi_chu)
VALUES
    (1, 1, 1, 30, 120, 'Ghi chu 1'),
    (2, 1, 2, 50, 180, 'Ghi chu 2'),
    (3, 2, 3, 80, 150, 'Ghi chu 3'),
    (4, 2, 4, 40, 130, 'Ghi chu 4'),
    (5, 3, 5, 100, 200, 'Ghi chu 5'),
    (6, 3, 1, 60, 100, 'Ghi chu 6');
    



