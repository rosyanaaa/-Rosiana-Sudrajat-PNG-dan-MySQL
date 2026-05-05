CREATE TABLE `DOKTER` (
  `id_dokter` int PRIMARY KEY,
  `nama` varchar(30),
  `sp` varchar(20),
  `no_tlpn` int,
  `kode_poli` int
);

CREATE TABLE `POLIKLINIK` (
  `kode_poli` int PRIMARY KEY,
  `nama_poli` varchar(20)
);

CREATE TABLE `pasien` (
  `NIK` int PRIMARY KEY,
  `nama_pasien` varchar(30),
  `alamat` varchar(50),
  `tgl_lahir` date
);

CREATE TABLE `daftar` (
  `no_antrean` int PRIMARY KEY,
  `tgl_daftar` date,
  `NIK` int,
  `id_dokter` int
);

CREATE TABLE `Rekam_Medis` (
  `no_rm` int PRIMARY KEY,
  `no_antrean` int,
  `diagnosis` text,
  `keluhan` text
);

CREATE TABLE `OBAT` (
  `kode_obat` int PRIMARY KEY,
  `nama_obat` varchar(50),
  `harga` int
);

CREATE TABLE `Resep` (
  `no_resep` int PRIMARY KEY,
  `tgl` date,
  `kode_obat` int,
  `no_rm` int
);

CREATE TABLE `kamar` (
  `no_kamar` int PRIMARY KEY,
  `tipe_kamar` varchar(30)
);

CREATE TABLE `Rawat_inap` (
  `tgl_masuk` date,
  `tgl_keluar` date,
  `NIK` int,
  `no_kamar` int
);

ALTER TABLE `DOKTER` ADD FOREIGN KEY (`kode_poli`) REFERENCES `POLIKLINIK` (`kode_poli`);

ALTER TABLE `daftar` ADD FOREIGN KEY (`id_dokter`) REFERENCES `DOKTER` (`id_dokter`);

ALTER TABLE `daftar` ADD FOREIGN KEY (`NIK`) REFERENCES `pasien` (`NIK`);

ALTER TABLE `Rekam_Medis` ADD FOREIGN KEY (`no_antrean`) REFERENCES `daftar` (`no_antrean`);

ALTER TABLE `Rekam_Medis` ADD FOREIGN KEY (`no_rm`) REFERENCES `Resep` (`no_rm`);

ALTER TABLE `OBAT` ADD FOREIGN KEY (`kode_obat`) REFERENCES `Resep` (`kode_obat`);

ALTER TABLE `Rawat_inap` ADD FOREIGN KEY (`NIK`) REFERENCES `pasien` (`NIK`);

ALTER TABLE `Rawat_inap` ADD FOREIGN KEY (`no_kamar`) REFERENCES `kamar` (`no_kamar`);
