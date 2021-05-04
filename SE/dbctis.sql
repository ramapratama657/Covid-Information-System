-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Bulan Mei 2021 pada 16.38
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbctis`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbtestcentre`
--

CREATE TABLE `tbtestcentre` (
  `id` int(20) NOT NULL,
  `testcentrename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbtestcentre`
--

INSERT INTO `tbtestcentre` (`id`, `testcentrename`) VALUES
(6, 'RS Bangli'),
(8, 'RS Denpasar Selatan'),
(4, 'RS Dharma Yadnya'),
(9, 'RS Gianyar'),
(13, 'RS Karangasem');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbtestkit`
--

CREATE TABLE `tbtestkit` (
  `id` int(20) NOT NULL,
  `testkitname` varchar(50) NOT NULL,
  `stock` int(50) NOT NULL,
  `testcentrename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbtestkit`
--

INSERT INTO `tbtestkit` (`id`, `testkitname`, `stock`, `testcentrename`) VALUES
(1, 'Paracetamol', 45, 'RS Bangli'),
(3, 'panadol ekstra', 12, 'RS Gianyar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbtestreport`
--

CREATE TABLE `tbtestreport` (
  `id` int(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `patienttype` varchar(50) NOT NULL,
  `symptoms` varchar(100) NOT NULL,
  `result` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `testcentrename` varchar(50) NOT NULL,
  `reportDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbtestreport`
--

INSERT INTO `tbtestreport` (`id`, `user_id`, `name`, `patienttype`, `symptoms`, `result`, `status`, `testcentrename`, `reportDate`) VALUES
(14, 21, 'patient1', 'Quarantined', 'Vomitting', 'Positive', 'Complete', 'RS Bangli', '2021-05-01 14:34:03'),
(16, 21, 'patient1', 'Close Contact', 'Alergi Babi', 'Positive', 'Complete', 'RS Bangli', '2021-05-01 14:34:03'),
(21, 34, 'Joko', 'Returnee', 'Sakit Pala', '', 'Pending', 'RS Gianyar', '2021-05-01 14:34:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbuser`
--

CREATE TABLE `tbuser` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `levelakun` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `testcentrename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbuser`
--

INSERT INTO `tbuser` (`id`, `username`, `password`, `levelakun`, `name`, `testcentrename`) VALUES
(1, 'admin', '$2y$10$ECFbWdSRfFOu7vnHOd3gfOGNpiQpzaUoUVFq4oOyRIMVMyZ6RZaTi', 'admin', 'admin', '0'),
(6, 'tester1', '$2y$10$K/dRzUWCvYMFKQWqo8COe.R8s49IZ1vNB5KjJahkEQtfVg2R3dybi', 'tester', 'Gempol', 'RS Gianyar'),
(21, 'patient1', '$2y$10$2Wr.jG.jLaebHt2osHdKv.0DLdyFS3TWZUVjCfcN15pjC3flP53wK', 'patient', 'patient1', 'RS Denpasar'),
(34, 'patient2', '$2y$10$HrjqrI.s1h4NHHMQ72POK.wkNKnE2q.CIYXPX.b9Y0D1vuBQMg2HK', 'patient', 'Joko', 'RS Gianyar');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbtestcentre`
--
ALTER TABLE `tbtestcentre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testcentrename` (`testcentrename`);

--
-- Indeks untuk tabel `tbtestkit`
--
ALTER TABLE `tbtestkit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testcentrename` (`testcentrename`);

--
-- Indeks untuk tabel `tbtestreport`
--
ALTER TABLE `tbtestreport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`,`patienttype`,`symptoms`,`testcentrename`),
  ADD KEY `fk_test_report` (`user_id`);

--
-- Indeks untuk tabel `tbuser`
--
ALTER TABLE `tbuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbtestcentre`
--
ALTER TABLE `tbtestcentre`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tbtestkit`
--
ALTER TABLE `tbtestkit`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbtestreport`
--
ALTER TABLE `tbtestreport`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tbuser`
--
ALTER TABLE `tbuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbtestreport`
--
ALTER TABLE `tbtestreport`
  ADD CONSTRAINT `fk_test_report` FOREIGN KEY (`user_id`) REFERENCES `tbuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
