CREATE DATABASE peternakan_kuda;
USE peternakan_kuda;

-- =========================
-- TABLE KATEGORI KUDA
-- =========================
CREATE TABLE kategori_kuda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100) NOT NULL
);

-- =========================
-- TABLE KUDA
-- =========================
CREATE TABLE kuda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_kuda VARCHAR(100) NOT NULL,
    asal_negara VARCHAR(100),
    harga INT NOT NULL,
    umur INT,
    kategori_id INT,
    FOREIGN KEY (kategori_id) REFERENCES kategori_kuda(id)
);

-- =========================
-- TABLE PELANGGAN
-- =========================
CREATE TABLE pelanggan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    alamat TEXT,
    no_hp VARCHAR(20)
);

-- =========================
-- TABLE TRANSAKSI
-- =========================
CREATE TABLE transaksi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pelanggan_id INT,
    tanggal DATE,
    total_harga INT,
    FOREIGN KEY (pelanggan_id) REFERENCES pelanggan(id)
);

-- =========================
-- TABLE DETAIL TRANSAKSI
-- =========================
CREATE TABLE detail_transaksi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    transaksi_id INT,
    kuda_id INT,
    qty INT,
    subtotal INT,
    FOREIGN KEY (transaksi_id) REFERENCES transaksi(id),
    FOREIGN KEY (kuda_id) REFERENCES kuda(id)
);

-- =========================
-- INSERT DATA KATEGORI KUDA
-- =========================
INSERT INTO kategori_kuda (nama_kategori) VALUES
('Arabian'),
('Thoroughbred'),
('Warmblood'),
('Akhal-Teke'),
('Friesian'),
('Mustang'),
('Andalusian'),
('Shire'),
('Clydesdale'),
('Appaloosa');

-- =========================
-- INSERT DATA KUDA
-- =========================
INSERT INTO kuda (nama_kuda, asal_negara, harga, umur, kategori_id) VALUES
('Desert King', 'Arab Saudi', 150000000, 5, 1),
('Thunder Bolt', 'Inggris', 200000000, 4, 2),
('Golden Spirit', 'Jerman', 180000000, 6, 3),
('Blue Flame', 'Turkmenistan', 250000000, 5, 4),
('Night Fury', 'Belanda', 220000000, 7, 5),
('Wild Runner', 'Amerika Serikat', 130000000, 4, 6),
('Royal Dancer', 'Spanyol', 210000000, 6, 7),
('Iron Giant', 'Inggris', 300000000, 8, 8),
('Silver Hoof', 'Skotlandia', 270000000, 7, 9),
('Star Dust', 'Amerika Serikat', 160000000, 5, 10);

-- =========================
-- INSERT DATA PELANGGAN
-- =========================
INSERT INTO pelanggan (nama_pelanggan, alamat, no_hp) VALUES
('Andi Saputra', 'Pekanbaru', '081111111111'),
('Budi Hartono', 'Jakarta', '082222222222'),
('Citra Lestari', 'Bandung', '083333333333'),
('Dina Amelia', 'Surabaya', '084444444444'),
('Eko Prasetyo', 'Medan', '085555555555'),
('Fajar Ramadhan', 'Padang', '086666666666'),
('Gina Putri', 'Yogyakarta', '087777777777'),
('Hadi Wijaya', 'Batam', '088888888888'),
('Intan Permata', 'Palembang', '089999999999'),
('Joko Susanto', 'Bogor', '081212121212');

-- =========================
-- INSERT DATA TRANSAKSI
-- =========================
INSERT INTO transaksi (pelanggan_id, tanggal, total_harga) VALUES
(1, '2026-05-01', 150000000),
(2, '2026-05-02', 200000000),
(3, '2026-05-03', 180000000),
(4, '2026-05-04', 250000000),
(5, '2026-05-05', 220000000),
(6, '2026-05-06', 130000000),
(7, '2026-05-07', 210000000),
(8, '2026-05-08', 300000000),
(9, '2026-05-09', 270000000),
(10, '2026-05-10', 160000000);

-- =========================
-- INSERT DATA DETAIL TRANSAKSI
-- =========================
INSERT INTO detail_transaksi (transaksi_id, kuda_id, qty, subtotal) VALUES
(1, 1, 1, 150000000),
(2, 2, 1, 200000000),
(3, 3, 1, 180000000),
(4, 4, 1, 250000000),
(5, 5, 1, 220000000),
(6, 6, 1, 130000000),
(7, 7, 1, 210000000),
(8, 8, 1, 300000000),
(9, 9, 1, 270000000),
(10, 10, 1, 160000000);

-- =========================
-- CEK DATA
-- =========================
SELECT * FROM kategori_kuda;
SELECT * FROM kuda;
SELECT * FROM pelanggan;
SELECT * FROM transaksi;
SELECT * FROM detail_transaksi;