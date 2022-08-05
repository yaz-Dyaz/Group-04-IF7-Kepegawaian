-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Agu 2022 pada 17.06
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `group_04_if-7_kepegawaian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bagian`
--

CREATE TABLE `bagian` (
  `id_bagian` varchar(6) NOT NULL,
  `nama_bagian` varchar(50) NOT NULL,
  `gaji` bigint(16) NOT NULL,
  `jml_staf` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bagian`
--

INSERT INTO `bagian` (`id_bagian`, `nama_bagian`, `gaji`, `jml_staf`) VALUES
('DEV001', 'WEB Developers', 4000000, 3),
('DSG001', 'Media Kreatif', 3000000, 4),
('HRD001', 'Human Resources Development', 7000000, 2),
('MKT001', 'Marketting', 3500000, 5),
('PMT001', 'Project Management', 10000000, 2),
('SLM001', 'Sales', 2500000, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_admin`
--

CREATE TABLE `login_admin` (
  `id_admin` varchar(3) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `user_admin` varchar(35) NOT NULL,
  `pass_admin` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login_admin`
--

INSERT INTO `login_admin` (`id_admin`, `nama_admin`, `user_admin`, `pass_admin`) VALUES
('AD1', 'Dyaz Amrullah', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_perubahan`
--

CREATE TABLE `log_perubahan` (
  `id_perubahan` int(3) NOT NULL,
  `waktu` datetime NOT NULL,
  `nm_pegawai` varchar(50) NOT NULL,
  `old_id_bagian` varchar(6) NOT NULL,
  `new_id_bagian` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_perubahan`
--

INSERT INTO `log_perubahan` (`id_perubahan`, `waktu`, `nm_pegawai`, `old_id_bagian`, `new_id_bagian`) VALUES
(1, '2022-08-04 21:55:30', 'Dyaz Amrullah', 'DEV001', 'DSG001'),
(2, '2022-08-04 21:55:37', 'Anggela Widyehadi', 'DSG001', 'DEV001'),
(3, '2022-08-04 21:55:51', 'Renaldi Algojali', 'SLM001', 'HRD001'),
(4, '2022-08-04 21:56:13', 'Hilmi Muhammad', 'HRD001', 'MKT001'),
(5, '2022-08-04 21:56:23', 'Amelya Wulandari', 'HRD001', 'MKT001'),
(6, '2022-08-04 21:56:33', 'Kitagawa', 'DEV001', 'PMT001'),
(7, '2022-08-04 21:56:45', 'Devina Aurelia', 'SLM001', 'SLM001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` char(10) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `nm_pegawai` varchar(50) NOT NULL,
  `tmp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` enum('Laki-laki','Perempuan') NOT NULL,
  `agama` enum('Islam','Kristen','Katholik','Budha','Hindu','Kong Hu Cu') NOT NULL,
  `telp` varchar(12) DEFAULT NULL,
  `almt_pegawai` text DEFAULT NULL,
  `id_bagian` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `tgl_daftar`, `nm_pegawai`, `tmp_lahir`, `tgl_lahir`, `jk`, `agama`, `telp`, `almt_pegawai`, `id_bagian`) VALUES
('P202200123', '2022-08-16', 'Dyaz Amrullah', 'Citayem', '2002-09-08', 'Laki-laki', 'Islam', '062-332-0093', 'Pandeglang - Banten - Indonesia', 'DSG001'),
('P202200124', '2022-08-04', 'Anggela Widyehadi', 'Bandung', '2002-06-13', 'Laki-laki', 'Katholik', '087-008-9987', 'Citayem Fashion Week', 'DEV001'),
('P202200125', '2022-08-04', 'Renaldi Algojali', 'Cibereum', '2022-08-03', 'Laki-laki', 'Kong Hu Cu', '095-443-2245', 'SCBD', 'HRD001'),
('P202200126', '2022-08-04', 'Hilmi Muhammad', 'Florida', '2022-07-31', 'Laki-laki', 'Islam', '084-332-4578', 'Pertigaan Gurun Sahara', 'MKT001'),
('P202200127', '2022-08-04', 'Amelya Wulandari', 'Pandeglang', '2002-08-06', 'Perempuan', 'Islam', '089-005-0954', 'Pandeglang - Banten', 'MKT001'),
('P202200128', '2022-08-04', 'Devina Aurelia', 'Cilegon', '2002-08-04', 'Perempuan', 'Kristen', '086-339-0393', 'Cilegon - Banten', 'SLM001'),
('P202200129', '2022-08-04', 'Kitagawa', 'Tokyo', '2007-10-10', 'Perempuan', 'Kong Hu Cu', '021-203-5543', 'Tokyo - Japan', 'PMT001');

--
-- Trigger `pegawai`
--
DELIMITER $$
CREATE TRIGGER `log_perubahan` AFTER UPDATE ON `pegawai` FOR EACH ROW INSERT INTO log_perubahan SET waktu=NOW(), nm_pegawai=NEW.nm_pegawai, old_id_bagian=OLD.id_bagian, new_id_bagian=NEW.id_bagian
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_jumlah_pegawai` AFTER INSERT ON `pegawai` FOR EACH ROW UPDATE bagian set jml_staf=jml_staf-1 
WHERE id_bagian = NEW.id_bagian
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_jumlah_pegawai2` AFTER DELETE ON `pegawai` FOR EACH ROW UPDATE bagian set jml_staf=jml_staf+1
WHERE id_bagian = OLD.id_bagian
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bagian`
--
ALTER TABLE `bagian`
  ADD PRIMARY KEY (`id_bagian`);

--
-- Indeks untuk tabel `login_admin`
--
ALTER TABLE `login_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `log_perubahan`
--
ALTER TABLE `log_perubahan`
  ADD PRIMARY KEY (`id_perubahan`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_bagian` (`id_bagian`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `log_perubahan`
--
ALTER TABLE `log_perubahan`
  MODIFY `id_perubahan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_bagian`) REFERENCES `bagian` (`id_bagian`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
