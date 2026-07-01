-- Nama		: Rosiana sudrajat
-- NIM		: 24241157
-- Kelas	: PTI E
-- Modul	: 4


-- Menggunakan database
USE kelas_e_mart;

-- ========================================================
-- ORDER BY
-- ========================================================
-- Fungsinya untuk mengurutkan data hasil query secara ASC ataupun DESC.
-- Data yang diurutkan dapat dari kolom atau hasil pengelolaan (op. matematika) kolom.

-- Praktek #1
-- Ambil nama produk dan qty dari penjualan urut berdasarkan qty secara default (ASC)
SELECT nama_produk, qty FROM penjualan ORDER BY qty;

-- Praktek #2
-- Ambil nama_produk dan qty dari penjualan urut qty dan nama produk
SELECT nama_produk, qty FROM penjualan ORDER BY qty, nama_produk;

-- Latihan Mandiri 
-- Soal 1: Ambil nama produk dan harga dari tabel produk, urutkan berdasarkan harga terkecil
SELECT nama_produk, harga FROM produk ORDER BY harga;

-- Soal 2: Ambil seluruh data pelanggan, urutkan berdasarkan nama_pelanggan secara urutan alfabet
SELECT * FROM pelanggan ORDER BY nama_pelanggan;

-- Soal 3: Ambil nama_produk, qty, dan harga dari penjualan, urutkan berdasarkan harga terkecil
SELECT nama_produk, qty, harga FROM penjualan ORDER BY harga;


-- Praktek #3
-- ORDER BY dari nilai terbesar ke terkecil gunakan DESC
-- ORDER BY dari nilai terkecil ke terbesar gunakan ASC (tidak wajib karena otomatis default)
SELECT nama_produk, qty FROM penjualan ORDER BY qty DESC;

-- Praktek #4
-- Menggunakan ASC dan DESC dalam satu query (qty terbesar, jika qty sama diurutkan nama produk sesuai alfabet)
SELECT nama_produk, qty FROM penjualan ORDER BY qty DESC, nama_produk ASC;

-- Latihan Mandiri
-- Soal 1: Ambil nama produk dan harga dari tabel produk, urutkan berdasarkan harga tertinggi ke terendah
SELECT nama_produk, harga FROM produk ORDER BY harga DESC;

-- Soal 2: Ambil kode_produk, nama_produk, dan harga dari tabel produk, urutkan harga DESC lalu nama_produk ASC
SELECT kode_produk, nama_produk, harga FROM produk ORDER BY harga DESC, nama_produk ASC;

-- Soal 3: Ambil seluruh kolom dari tabel penjualan, urutkan berdasarkan tgl_transaksi terbaru (DESC)
SELECT * FROM penjualan ORDER BY tgl_transaksi DESC;


-- Praktek #5
-- ORDER BY digunakan dari hasil operasi matematika ataupun dari fungsi
-- Ambil nama produk, harga, qty, dan total (qty*harga) urut total terbesar
SELECT nama_produk, harga, qty, qty*harga AS total
FROM penjualan ORDER BY total DESC;

-- Latihan Mandiri
-- Soal 1 - Cari Total Bayar Setelah dikurangi Diskon
-- Cari dulu total diskon dalam rupiah -> (diskon_persen / 100) * harga * qty
-- setelah itu hitung total bruto - diskon_rupiah = total_bayar
-- lakukan dalam 1 query dan urutkan berdasarkan total_bayar terkecil
SELECT 
    nama_produk, 
    qty, 
    harga, 
    diskon_persen,
    (qty * harga) AS total_kotor,
    ((diskon_persen / 100) * harga * qty) AS diskon_rupiah,
    ((qty * harga) - ((diskon_persen / 100) * harga * qty)) AS total_bayar
FROM penjualan 
ORDER BY total_bayar ASC;


-- ========================================================
-- PENGGUNAAN WHERE DAN ORDER BY
-- ========================================================
-- ORDER BY bisa digabungkan dengan WHERE untuk pengurutan hasil filter.
-- Aturannya, klausa ORDER BY wajib diletakkan setelah klausa WHERE.

-- Praktek #6
-- Ambil nama produk yang berawalan huruf 'F' urut berdasarkan qty terbesar
SELECT nama_produk, qty FROM penjualan
WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;

-- Latihan Mandiri
-- Soal 1: Ambil data nama_produk dan qty yang harganya di atas 50.000, urutkan dari qty terbesar
SELECT nama_produk, qty, harga FROM penjualan
WHERE harga > 50000 ORDER BY qty DESC;

-- Soal 2: Ambil data transaksi yang qty-nya lebih dari 2, urutkan berdasarkan tgl_transaksi paling lampau (lama)
SELECT kode_transaksi, tgl_transaksi, qty FROM penjualan
WHERE qty > 2 ORDER BY tgl_transaksi ASC;

-- Soal 3: Ambil transaksi dari kode_pelanggan 'dqlabcust07', urutkan berdasarkan harga termahal
SELECT kode_transaksi, kode_pelanggan, nama_produk, harga FROM penjualan
WHERE kode_pelanggan = 'dqlabcust07' ORDER BY harga DESC;


-- ========================================================
-- FUNGSI AGREGASI
-- ========================================================
-- Digunakan untuk mengelola kumpulan baris data (rows) untuk menghasilkan satu nilai ringkasan baru.

-- Praktek #7
-- Jumlahkan seluruh qty yang ada di tabel penjualan
SELECT SUM(qty) AS total_qty_terjual FROM penjualan;
-- Berapa rata-rata qty terjual dari penjualan
SELECT AVG(qty) AS rata_rata_qty FROM penjualan;

-- Praktek #8
-- Berapa banyak jumlah baris transaksi yang terjadi
SELECT COUNT(*) AS total_baris_transaksi FROM penjualan;

-- Praktek #9 
-- Menggunakan dua fungsi agregasi secara bersamaan untuk mencari rasio
SELECT SUM(qty), COUNT(*), SUM(qty)/COUNT(*) AS Rasio_Penjualan
FROM penjualan;

-- Praktek #10
-- Rata-rata, nilai tertinggi, nilai terendah dari kolom qty
SELECT AVG(qty) AS rata_qty, MAX(qty) AS qty_tertinggi, MIN(qty) AS qty_terendah FROM penjualan;

-- Praktek #11
-- COUNT DISTINCT untuk mencari kuantitas nilai unik dari sebuah kolom
-- Berapa banyak jenis produk unik yang berhasil terjual
SELECT COUNT(DISTINCT nama_produk) AS produk_unik_terjual FROM penjualan;

-- Praktek #12
-- Berapa banyak pelanggan unik yang sudah melakukan transaksi
SELECT COUNT(DISTINCT kode_pelanggan) AS pelanggan_unik_belanja FROM penjualan;

-- Praktek #13
-- Menggabungkan rangkuman agregasi dalam 1 query tunggal
SELECT 
    COUNT(*) AS Jumlah_transaksi,
    COUNT(DISTINCT nama_produk) AS Jumlah_Produk_terjual,
    COUNT(DISTINCT kode_pelanggan) AS Jumlah_pelanggan_yang_transaksi
FROM penjualan;


-- ========================================================
-- GROUP BY
-- ========================================================
-- Mengelompokkan isi data berdasarkan baris nilai yang sama dari kolom tertentu.

-- Praktek #14
-- Mengelompokkan produk untuk melihat daftar produk apa saja yang pernah dibeli
SELECT nama_produk FROM penjualan GROUP BY nama_produk;

-- Praktek #15
-- Kelompok dengan kombinasi multi-kolom (2 kolom)
SELECT nama_produk, qty FROM penjualan GROUP BY nama_produk, qty;

-- Praktek #16 
-- Kelompok dengan 1 kolom disertai 1 fungsi agregasi (Mencari total qty per produk)
SELECT nama_produk, SUM(qty)
FROM penjualan GROUP BY nama_produk
ORDER BY SUM(qty); 

-- Praktek #17
-- Sama seperti praktek 16, namun hasil kelompok diurutkan dari qty paling jumbo (DESC)
SELECT nama_produk, SUM(qty)
FROM penjualan GROUP BY nama_produk
ORDER BY SUM(qty) DESC;


-- ========================================================
-- HAVING (FILTERING UNTUK GROUP BY)
-- ========================================================
-- Digunakan untuk menyaring data agregasi kelompok. WHERE tidak bisa dipakai untuk fungsi agregasi.

-- Praktek #18
-- Ambil nama produk terjual beserta total qty-nya, tampilkan yang hanya total qty > 3
SELECT nama_produk, SUM(qty)
FROM penjualan GROUP BY nama_produk
HAVING SUM(qty) > 3
ORDER BY SUM(qty) DESC;

-- Latihan Mandiri 
-- Soal 1: Tampilkan nama produk beserta jumlah baris transaksinya (COUNT), lalu tampilkan yang transaksinya lebih dari 1 kali
SELECT nama_produk, COUNT(*) AS jumlah_transaksi
FROM penjualan 
GROUP BY nama_produk
HAVING COUNT(*) > 1;

-- Soal 2: Tampilkan kode_pelanggan beserta total belanja qty-nya, kelompokkan berdasarkan pelanggan yang total beli qty >= 5
SELECT kode_pelanggan, SUM(qty) AS total_qty_beli
FROM penjualan
GROUP BY kode_pelanggan
HAVING SUM(qty) >= 5;

-- Soal 3: Tampilkan nama produk beserta nilai rata-rata harga produk tersebut di tabel penjualan yang rata-ratanya di atas 60.000
SELECT nama_produk, AVG(harga) AS rata_rata_harga
FROM penjualan
GROUP BY nama_produk
HAVING AVG(harga) > 60000;