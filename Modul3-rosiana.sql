-- Nama		: Rosiana sudrajat
-- NIM		: 24241157
-- Kelas	: PTI E
-- Modul	: 3

-- Menggunakan database
USE kelas_e_mart;

-- ========================================================
-- NILAI LITERAL
-- ========================================================
-- Isi/data dari kolom dalam tabel. Penggunaannya dengan SELECT Statement

-- Praktek #1: Menggunakan SELECT statement untuk menampilkan nilai literal
SELECT 77;  -- tipe data integer

-- Praktek #2: Menampilkan nilai literal yang beda tipe data
SELECT 77 AS angka, TRUE AS nilai_logika, 'PTI' AS teks;


-- ========================================================
-- NULL
-- ========================================================
-- Literal khusus yang artinya tidak punya nilai (kosong)

-- Praktek #3: Menampilkan NULL menggunakan SELECT
SELECT NULL AS kosong;


-- ========================================================
-- OPERATOR MATEMATIKA
-- ========================================================
-- * (perkalian), / (pembagian), + (penjumlahan), - (pengurangan), MOD/% (sisa bagi)
-- Derajat operator matematika: (), lalu */, lalu +-

-- Praktek #4
SELECT 5%2 AS sisa_bagi, 5/2 AS hasil_bagi1, 5 DIV 2 AS hasil_bagi2;

-- Latihan Mandiri (Operasi Matematika Dasar)
-- Soal 1: Penjumlahan & Pengurangan
SELECT 10 + 5 - 2 AS hasil_soal1;

-- Soal 2: Perkalian & Pembagian mendahului Penjumlahan jika tanpa kurung
SELECT 10 + 5 * 2 AS hasil_soal2;

-- Soal 3: Tanda kurung didahulukan
SELECT (10 + 5) * 2 AS hasil_soal3;

-- Praktek #5 
-- Mengalikan qty dan harga untuk mendapatkan total bayar dari penjualan
SELECT qty, harga, qty*harga AS total FROM penjualan;


-- ========================================================
-- OPERATOR PERBANDINGAN 
-- ========================================================
-- Selalu akan menghasilkan nilai boolean / logika (1 untuk TRUE, 0 untuk FALSE)

-- Praktek #6
SELECT 5=5, 5<>5, 5<>4, 5!=5, 5!=4, 5>4;

-- Latihan Mandiri (Eksperimen Operator Perbandingan)
-- Soal 1: Apakah 10 sama dengan 10?
-- Soal 2: Apakah 10 tidak sama dengan 11?
-- Soal 3: Apakah 15 lebih besar dari 20?
-- Soal 4: Apakah 15 lebih besar atau sama dengan 15?
-- Soal 5: Apakah 8 lebih kecil dari 12?
-- Soal 6: Apakah 8 lebih kecil atau sama dengan 7?

-- Gabung dalam 1 query soal 1 - 6 sesuai instruksi skrip
SELECT 
    10 = 10 AS soal1, 
    10 <> 11 AS soal2, 
    15 > 20 AS soal3, 
    15 >= 15 AS soal4, 
    8 < 12 AS soal5, 
    8 <= 7 AS soal6;


-- ========================================================
-- FUNGSI (BUILT-IN FUNCTIONS)
-- ========================================================

-- Praktek #7: Fungsi Tanggal dan Waktu Dasar
SELECT NOW(), YEAR(NOW()), MONTH(NOW()), DAY(NOW()),
DATEDIFF(NOW(), '1990-03-12'), DATEDIFF('1990-03-12', NOW());

-- Latihan Mandiri (Variasi Fungsi bawaan MySQL)
-- Soal 1: Menampilkan tahun saja dari tanggal spesifik
SELECT YEAR('2026-08-17') AS tahun_merdeka;

-- Soal 2: Menampilkan bulan saja dari tanggal spesifik
SELECT MONTH('2026-08-17') AS bulan_merdeka;

-- Soal 3: Menampilkan hari saja dari tanggal spesifik
SELECT DAY('2026-08-17') AS hari_merdeka;

-- Soal 4: Menghitung selisih hari dari dua tanggal acak
SELECT DATEDIFF('2026-12-31', '2026-01-01') AS jumlah_hari_setahun;

-- Soal 5: Mencoba fungsi teks dasar (Mengubah teks menjadi huruf kapital semua)
SELECT UPPER('pendidikan teknologi informasi') AS teks_kapital;

-- Praktek #10
-- Lama pelanggan tidak bertransaksi dalam hari (dihitung dari waktu sekarang)
SELECT kode_transaksi, tgl_transaksi, DATEDIFF(NOW(), tgl_transaksi) AS lama_hari FROM penjualan;


-- ========================================================
-- WHERE ATAU FILTERING
-- ========================================================
-- Digunakan untuk menyaring atau membatasi jumlah data yang ditampilkan

-- Praktek #11: Filter kuantitas yang lebih besar dari 2
SELECT nama_produk, qty FROM penjualan WHERE qty>2;

-- Filtering multi-kriteria (Banyak Kriteria)
-- Praktek #12: Ambil semua produk yang qty > 3 dan harga < 200.000
SELECT nama_produk, qty, harga FROM penjualan WHERE qty>3 AND harga<200000;

-- Filter menggunakan teks spesifik
-- Praktek #13: Ambil semua transaksi untuk produk 'Flashdisk DQLab 32 GB'
SELECT tgl_transaksi, kode_pelanggan, nama_produk, qty, harga, qty*harga AS total
FROM penjualan
WHERE nama_produk = 'Flashdisk DQLab 32 GB';

-- Operator LIKE (Pencarian karakter berpola)
-- Praktek #14: Filtering teks yang berawalan huruf 'f' atau 'F'
SELECT nama_produk FROM penjualan WHERE nama_produk LIKE 'f%';

-- Latihan Mandiri (Filtering Variasi)
-- Soal 1: Ambil data penjualan yang qty-nya tepat sama dengan 3
SELECT * FROM penjualan WHERE qty = 3;

-- Soal 2: Ambil data penjualan yang namanya berakhiran kata 'DQLab'
SELECT nama_produk, qty FROM penjualan WHERE nama_produk LIKE '%DQLab';

-- Soal 3: Ambil data penjualan yang harganya di atas 50.000
SELECT nama_produk, harga FROM penjualan WHERE harga > 50000;


-- ========================================================
-- OPERATOR LOGIKA
-- ========================================================
-- AND (Dan), OR (Atau), NOT (Negasi/Bukan)

-- Praktek #15: Ambil nama produk dan qty yang berawalan 'f' DAN qty > 2
SELECT nama_produk, qty
FROM penjualan
WHERE nama_produk LIKE 'f%' AND qty>2;