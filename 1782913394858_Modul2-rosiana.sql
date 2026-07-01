-- NAMA  : rosiana sudrajat
-- NIM   : 24241157
-- KELAS : PTI E 
-- MODUL : 2

-- ========================================================
-- SELECT STATEMENT
-- Perintah yang digunakan untuk mengambil data dari database
-- ========================================================

-- Mengaktifkan database yang digunakan
USE kelas_e_mart;

-- --------------------------------------------------------
-- Praktek 1: Mengambil satu kolom dari tabel
-- Ambil kolom nama produk dari tabel produk
-- --------------------------------------------------------
SELECT nama_produk FROM produk;

-- --------------------------------------------------------
-- Praktek 2: Mengambil dua kolom dari sebuah tabel
-- Ambil nama produk dan harga dari tabel produk
-- --------------------------------------------------------
SELECT nama_produk, harga FROM produk;

-- --------------------------------------------------------
-- Praktek 3: Mengambil seluruh kolom dari sebuah tabel 
-- Ambil semua kolom dari tabel produk
-- --------------------------------------------------------
SELECT * FROM produk;

-- --------------------------------------------------------
-- Latihan Mandiri
-- --------------------------------------------------------
-- Mengambil beberapa kolom spesifik
SELECT kode_produk, nama_produk FROM produk;

-- Ambil semua kolom dari tabel pelanggan
SELECT * FROM pelanggan;


-- ========================================================
-- PREFIX DAN ALIAS 
-- ========================================================

-- 1. PREFIX: Menyertakan nama tabel/database sebelum nama kolom
-- Format: nama_tabel.nama_kolom atau nama_database.nama_tabel.nama_kolom

-- Perbaikan typo: Sebelumnya tertulis 'FROM pellnggan', diperbaiki menjadi 'pelanggan'
SELECT kelas_e_mart.pelanggan.nama_pelanggan FROM pelanggan;

-- Menggunakan prefix nama tabel
SELECT pelanggan.nama_pelanggan FROM pelanggan;


-- 2. ALIAS (KATA KUNCI: AS)
-- Mengubah nama kolom atau tabel sementara pada hasil query

-- Menggunakan kata kunci AS pada kolom
SELECT nama_produk AS np FROM produk;

-- Tanpa kata kunci AS pada kolom (langsung spasi)
SELECT nama_produk np FROM produk;

-- Penggunaan alias pada nama tabel (Sering digunakan saat JOIN tabel)
SELECT nama_produk FROM produk AS msp;

-- Jika tabel diberi alias, maka prefix kolomnya wajib menggunakan nama alias tersebut
SELECT msp.nama_produk FROM produk AS msp;


-- ========================================================
-- CASE STUDY / TUGAS MANDIRI
-- ========================================================

-- Case 1: Ambil nama pelanggan dan alamat dari tabel pelanggan
SELECT nama_pelanggan, alamat FROM pelanggan;

-- Case 2: Ambil nama produk dan harga dari tabel produk
SELECT nama_produk, harga FROM produk;