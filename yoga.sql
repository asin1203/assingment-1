-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2022 at 09:32 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yoga`
--

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `EID` int(50) NOT NULL,
  `Name` text NOT NULL,
  `Age` int(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Batch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`EID`, `Name`, `Age`, `Address`, `Batch`) VALUES
(1, 'Aastha', 23, '173, Saket Nagar', '6-7AM'),
(2, 'Aahana', 18, '173, Saket Nagar', '6-7AM'),
(3, 'Hassi Sighanuia', 34, 'Amsterdam', '7-8AM'),
(4, 'khushi Sighanuia', 34, 'Amsterdam', '7-8AM'),
(5, 'Anjana', 34, 'Ballia', '8-9AM'),
(6, 'Anjana Adite', 50, 'Ballia', '8-9AM'),
(7, 'Shurutu', 50, 'Los Angeles', '8-9AM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`EID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
