-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2021 at 04:54 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

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
-- Table structure for table `tbtestcentre`
--

CREATE TABLE `tbtestcentre` (
  `id` int(20) NOT NULL,
  `testcentrename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbtestcentre`
--

INSERT INTO `tbtestcentre` (`id`, `testcentrename`) VALUES
(1, 'RS Denpasar'),
(19, 'RS Klungkung'),
(20, 'RS Widya');

-- --------------------------------------------------------

--
-- Table structure for table `tbtestkit`
--

CREATE TABLE `tbtestkit` (
  `id` int(20) NOT NULL,
  `testkitname` varchar(50) NOT NULL,
  `stock` int(50) NOT NULL,
  `testcentrename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbtestkit`
--

INSERT INTO `tbtestkit` (`id`, `testkitname`, `stock`, `testcentrename`) VALUES
(1, 'Paracetamol', 10, 'RS Denpasar'),
(7, 'AntiBiotik', 15, 'RS Denpasar'),
(8, 'paracetamol 500mg', 20, 'RS Klungkung'),
(9, 'paracetamol 500mg', 20, 'RS Klungkung');

-- --------------------------------------------------------

--
-- Table structure for table `tbtestreport`
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
-- Dumping data for table `tbtestreport`
--

INSERT INTO `tbtestreport` (`id`, `user_id`, `name`, `patienttype`, `symptoms`, `result`, `status`, `testcentrename`, `reportDate`) VALUES
(1, 4, 'Rama', 'Suspected', 'Cough', 'Negative, only normal cough', 'Complete', 'RS Khuntul', '2021-05-02 02:29:53'),
(29, 42, 'adnya', 'Close Contact', 'flu', '', 'Pending', 'RS Klungkung', '2021-05-02 02:29:53'),
(30, 45, 'Lia', 'Suspected', 'Cough', '', 'Pending', 'RS Khuntul', '2021-05-02 02:29:53'),
(31, 45, 'Lia', 'Suspected', 'Cough', '', 'Pending', 'RS Khuntul', '2021-05-02 02:29:53');

-- --------------------------------------------------------

--
-- Table structure for table `tbuser`
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
-- Dumping data for table `tbuser`
--

INSERT INTO `tbuser` (`id`, `username`, `password`, `levelakun`, `name`, `testcentrename`) VALUES
(1, 'admin', '$2y$10$ECFbWdSRfFOu7vnHOd3gfOGNpiQpzaUoUVFq4oOyRIMVMyZ6RZaTi', 'admin', 'admin', '0'),
(2, 'khuntul', '$2y$10$1.pvjPM8GFnnMHdjFph0ouYHA4gBHAgCDC9mwxnS2A1/FfRVfwgvy', 'tester', 'Sikuntul', 'RS Khuntul'),
(3, 'mhamanx', '$2y$10$70SYKxoiFy.XOMimholkQuSGk5BDyrk.wGY/Z4G4.2kBNLWgrdrrC', 'patient', 'Simhamanx', 'RS Khuntul'),
(4, 'rama', '$2y$10$zBZh5IEHcLm5KYsLqoL6NOvXrbiIkWmiI99LuZmTRM49bFCDv7D12', 'patient', 'Rama', 'RS Khuntul'),
(41, 'komang', '$2y$10$L2L4GvZ9FVRuuPf0Po/xfurWN4g4UoHOEVN8XzJt1C9nwZWjc1GKi', 'tester', 'Komang Lia', 'RS Klungkung'),
(42, 'adnya', '$2y$10$iNPyZ96qAVpApZ/PfUTk0.DcH9HaAhG6Gv46syN/6ezQ7RsmVZMjK', 'patient', 'adnya', 'RS Klungkung'),
(43, 'pratama', '$2y$10$A3KGgA.FhIt9A0E14gqlDOXFEjYXYzbi8pGhcxfcbRdAHW.aFWHqm', 'tester', 'Pratama Putra', 'RS Denpasar'),
(45, 'liacantik', '$2y$10$uR5yhMsRqD12l9YkC7Uel.DBtm3AxfOttsO3SuRfvuJAIQGMautiO', 'patient', 'Lia', 'RS Khuntul');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbtestcentre`
--
ALTER TABLE `tbtestcentre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testcentrename` (`testcentrename`);

--
-- Indexes for table `tbtestkit`
--
ALTER TABLE `tbtestkit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testcentrename` (`testcentrename`);

--
-- Indexes for table `tbtestreport`
--
ALTER TABLE `tbtestreport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`,`patienttype`,`symptoms`,`testcentrename`),
  ADD KEY `fk_test_report` (`user_id`);

--
-- Indexes for table `tbuser`
--
ALTER TABLE `tbuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbtestcentre`
--
ALTER TABLE `tbtestcentre`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbtestkit`
--
ALTER TABLE `tbtestkit`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbtestreport`
--
ALTER TABLE `tbtestreport`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbuser`
--
ALTER TABLE `tbuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbtestreport`
--
ALTER TABLE `tbtestreport`
  ADD CONSTRAINT `fk_test_report` FOREIGN KEY (`user_id`) REFERENCES `tbuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
