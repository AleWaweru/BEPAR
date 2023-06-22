-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 18, 2023 at 08:57 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beparifiduciarie_bepari`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `priviledge` enum('super','normal','standard') NOT NULL DEFAULT 'normal',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `priviledge`, `status`, `date_created`) VALUES
(1, 'admin', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'normal', 'active', '2022-03-18 04:27:20');

-- --------------------------------------------------------

--
-- Table structure for table `biking`
--

CREATE TABLE `biking` (
  `id` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(10) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `poster` varchar(100) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `biking`
--

INSERT INTO `biking` (`id`, `name`, `description`, `price`, `discount`, `poster`, `banner`, `status`, `date_created`) VALUES
('oLtGfbZexDu', 'Biking/Hiking', 'A great challenge is mountain biking around Kijabe Hill and reaching the top. There are multiple trails and routes on the cycling/running app Strava, so come and enjoy this enchanted experience of reaching the summit of a mountain.\r\nYou can rent a &#039;Limitless&#039; bicycle from our partner &#039;Explore Kenya&#039; or just ride the trails on your own or with friends!', 2500, NULL, 'imgtonp2209309120320220208amn47j.jpg', 'imgbuqi22111423461420223706pmbczy.png', 'active', '2022-06-14 16:45:07'),
('oZ8Ea1uVYzB', 'Biking/Hiking', 'A great challenge is mountain biking around Kijabe Hill and reaching the top. There are multiple trails and routes on the cycling/running app Strava, so come and enjoy this enchanted experience of reaching the summit of a mountain.\r\nYou can rent a &#039;Limitless&#039; bicycle from our partner &#039;Explore Kenya&#039; or just ride the trails on your own or with friends!', 6900, NULL, 'img01fb2203315090320223308pmzy6p.png', NULL, 'active', '2022-08-03 08:09:33'),
('QJ0O1HntRVv', 'Biking/Hiking', 'A great challenge is mountain biking around Kijabe Hill and reaching the top. There are multiple trails and routes on the cycling/running app Strava, so come and enjoy this enchanted experience of reaching the summit of a mountain.\r\nYou can rent a &#039;Limitless&#039; bicycle from our partner &#039;Explore Kenya&#039; or just ride the trails on your own or with friends!', 6900, NULL, 'imgiq3w2203315090320224508pmkjfn.png', NULL, 'active', '2022-08-03 08:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` varchar(11) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `activity_id` varchar(11) NOT NULL,
  `date_picked` date NOT NULL,
  `time_picked` time NOT NULL,
  `amount` float(10,2) NOT NULL,
  `no_of_people` int(11) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `remainder_amount` float(10,2) DEFAULT NULL,
  `remainder_status` enum('paid','not_paid') NOT NULL DEFAULT 'not_paid',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `extra_people` varchar(9000) NOT NULL,
  `deposit_paid` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `userid`, `activity_id`, `date_picked`, `time_picked`, `amount`, `no_of_people`, `payment_status`, `remainder_amount`, `remainder_status`, `date_created`, `extra_people`, `deposit_paid`) VALUES
('0CL7chKJm6i', 'W6vluTVYSde', '0YDar1x3Tmc', '2023-01-07', '10:00:00', 40000.00, 2, 'paid', NULL, 'not_paid', '2022-12-24 00:23:40', '', 20000.00),
('2m3a4PqiY5l', 'bdmIuy60R17', '0YDar1x3Tmc', '2022-08-18', '15:00:00', 2.00, 1, 'not_paid', NULL, 'not_paid', '2022-08-02 10:16:53', 'hello hello', 1.00),
('2p17sUwMbu8', 'rUaupWNQMqc', '0YDar1x3Tmc', '2022-10-30', '08:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2022-10-27 02:50:43', '', 10000.00),
('5aZMxGLeiKA', 'q8hLXtbmJ0U', '0YDar1x3Tmc', '2022-09-25', '08:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-09-17 09:02:00', '', 10000.00),
('5Z3cJVq6G8P', 'c8Wv5DLBxlY', '0YDar1x3Tmc', '2022-09-11', '11:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-09-08 02:53:40', '', 10000.00),
('7iHOP1KAryQ', 'j3tK6mzOr0X', '0YDar1x3Tmc', '2023-01-07', '10:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-12-27 23:39:02', '', 10000.00),
('7OMRHWwu9EN', 'rUaupWNQMqc', '0YDar1x3Tmc', '2022-10-30', '08:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2022-10-27 02:50:50', '', 10000.00),
('7rFvtzPudBI', 'GDkFKMuy3tX', '0YDar1x3Tmc', '2022-08-26', '09:00:00', 40000.00, 2, 'not_paid', NULL, 'not_paid', '2022-08-23 01:26:29', '', 20000.00),
('84riOvbRQl6', 'RvWCHNP4U8x', '0YDar1x3Tmc', '2022-08-25', '08:00:00', 60000.00, 3, 'not_paid', NULL, 'not_paid', '2022-08-22 12:38:55', '', 30000.00),
('8gUhkvHtGVW', 'gV8csXFA7wT', '0YDar1x3Tmc', '2023-02-19', '00:00:00', 40000.00, 2, 'paid', NULL, 'not_paid', '2023-02-07 02:32:40', '', 20000.00),
('9ZwnuqFPC7K', 'Ibpl6vdAcwW', '0YDar1x3Tmc', '0000-00-00', '10:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-10-19 02:39:33', '', 10000.00),
('Akg4JoxmOjN', 'KOaAUTpfgDX', '0YDar1x3Tmc', '2022-12-24', '00:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-12-19 07:52:55', '', 10000.00),
('ALROPN63bX7', 'GDkFKMuy3tX', '20azsxjigVP', '2022-08-11', '19:00:00', 2.00, 1, 'paid', NULL, 'not_paid', '2022-08-08 04:49:56', 'John -10/11/1997', 1.00),
('b9POtjK3MX0', 'Z8wusoiMQyB', '0YDar1x3Tmc', '2023-02-04', '10:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2023-01-14 02:56:57', '', 10000.00),
('bigy75hWNma', 'i21VYKBkHOr', '0YDar1x3Tmc', '2022-12-24', '00:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2022-12-20 07:33:23', '', 10000.00),
('bXR4HUG13sw', 'QYOpmZtX7Mb', '0YDar1x3Tmc', '2023-03-18', '09:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2023-02-11 06:53:21', '', 10000.00),
('Byar9mtVHTb', 'PNIQbYLal2c', '0YDar1x3Tmc', '2022-12-10', '10:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2022-11-25 02:48:02', '', 10000.00),
('CjSzTAtw0nZ', 'So8OwJuQzaN', '0YDar1x3Tmc', '0000-00-00', '09:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2023-02-07 21:09:04', '', 10000.00),
('cM2nQXVxzbq', 'bdmIuy60R17', '0YDar1x3Tmc', '2022-07-07', '11:14:04', 75000.00, 3, 'not_paid', NULL, 'not_paid', '2022-06-29 03:28:29', 'John Smith - 1234567, James Williams - 0987654', 37500.00),
('cuJIEPWSHC5', '2ZQgPfqEcMn', '0YDar1x3Tmc', '2023-03-18', '09:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2023-02-11 10:06:16', '', 10000.00),
('dbXTfG0O16m', '4caGouKUWVi', '0YDar1x3Tmc', '2022-10-16', '08:00:00', 80000.00, 4, 'not_paid', NULL, 'not_paid', '2022-10-01 04:36:52', '', 40000.00),
('dxmQCj9eUWO', 'bdmIuy60R17', '0YDar1x3Tmc', '2022-07-08', '15:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2022-06-29 05:35:24', '', 10000.00),
('fFlaIOJU7qv', 'GDkFKMuy3tX', '0YDar1x3Tmc', '2022-08-13', '08:00:00', 2.00, 1, 'paid', NULL, 'not_paid', '2022-08-10 04:43:42', 'John Ndungu', 1.00),
('G2NU91ZBznQ', 'bdmIuy60R17', '0YDar1x3Tmc', '2022-07-30', '15:00:00', 60000.00, 3, 'not_paid', NULL, 'not_paid', '2022-07-27 14:35:16', 'xyz', 30000.00),
('gybU251n8qT', 'rUaupWNQMqc', '0YDar1x3Tmc', '2022-10-30', '08:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-10-27 02:50:47', '', 10000.00),
('GZaJCHPzrV3', 'RvWCHNP4U8x', '0YDar1x3Tmc', '2022-08-25', '09:00:00', 60000.00, 3, 'not_paid', NULL, 'not_paid', '2022-08-22 12:40:26', '', 30000.00),
('HjUq1oOYIVQ', 'bdmIuy60R17', '0YDar1x3Tmc', '2022-09-29', '15:00:00', 3.00, 3, 'not_paid', NULL, 'not_paid', '2022-09-23 12:35:25', '', 1.50),
('HQKy7C4VGOM', 'FqK1ZxrdSPh', '0YDar1x3Tmc', '2022-10-30', '10:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-10-26 12:25:04', '', 10000.00),
('HY36TGPkwf5', 'qgo8tIXlYkf', '0YDar1x3Tmc', '2023-02-19', '10:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2023-02-11 02:41:51', '', 10000.00),
('IfCDTasFSLo', 'j3tK6mzOr0X', '20azsxjigVP', '2023-01-07', '08:00:00', 6000.00, 2, 'paid', NULL, 'not_paid', '2022-12-27 23:41:32', '', 3000.00),
('ivhVS1BkA0R', 'Z8wusoiMQyB', '0YDar1x3Tmc', '2023-02-04', '10:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2023-01-14 02:57:01', '', 10000.00),
('kS2oTwH0OEs', '6NZLCqyocU7', '0YDar1x3Tmc', '2023-03-18', '09:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2023-02-11 07:16:25', '', 10000.00),
('KtoWpXm5EYb', 'W0kSjdUq2Or', '0YDar1x3Tmc', '2022-09-24', '10:00:00', 40000.00, 2, 'not_paid', NULL, 'not_paid', '2022-09-17 00:38:58', '', 20000.00),
('l2NzFCpurVj', 'T4ZAWactz6l', '0YDar1x3Tmc', '2022-12-12', '10:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-11-28 01:51:23', '', 10000.00),
('l9AXnR41erF', 'Jj1FiZxH2KQ', '0YDar1x3Tmc', '2023-02-04', '15:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2023-01-26 22:37:15', '', 10000.00),
('lfCx1sF6wOc', 'KntAW3Qmpfx', '0YDar1x3Tmc', '2023-02-05', '08:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2023-01-30 11:45:49', '', 10000.00),
('lW8YnLUAhJs', 'Nv3XjD7wgGC', '0YDar1x3Tmc', '2022-09-09', '10:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-08-29 04:59:57', '', 10000.00),
('MAPYOxsQLRf', 'NpOFdb7g0Jm', '0YDar1x3Tmc', '0000-00-00', '10:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-12-14 22:01:26', '', 10000.00),
('NBFwaxPS9Xb', 'qgo8tIXlYkf', '0YDar1x3Tmc', '2023-02-19', '10:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2023-02-11 02:41:54', '', 10000.00),
('o7FUCDTpYNL', 'bdmIuy60R17', '0YDar1x3Tmc', '2022-08-19', '14:47:00', 2.00, 1, 'paid', NULL, 'not_paid', '2022-08-02 10:22:30', 'hello hello', 1.00),
('oTaEVUG1sM3', '9tSKB1ouxq4', '0YDar1x3Tmc', '2022-12-10', '10:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-11-25 02:38:32', '', 10000.00),
('pWdcI6ylX4R', 'bdmIuy60R17', '0YDar1x3Tmc', '2022-08-10', '13:00:00', 4.00, 2, 'paid', NULL, 'not_paid', '2022-08-02 12:13:13', '', 2.00),
('Q3SAiEMZlsF', 'QEX61jHpVqN', '0YDar1x3Tmc', '2022-10-15', '15:00:00', 40000.00, 2, 'not_paid', NULL, 'not_paid', '2022-10-05 02:55:14', '', 20000.00),
('qKfmX0EkZ9W', 'OPa1IB4TyLq', '0YDar1x3Tmc', '2022-08-26', '10:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-08-23 01:04:47', '', 10000.00),
('qoWANXapyKQ', 'oudPACkbimN', '0YDar1x3Tmc', '2023-01-07', '15:00:00', 80000.00, 4, 'not_paid', NULL, 'not_paid', '2023-01-02 23:46:00', '', 40000.00),
('s7YhfZWXbxe', 'tT64UIvi8k7', '0YDar1x3Tmc', '2022-09-16', '10:00:00', 40000.00, 2, 'paid', NULL, 'not_paid', '2022-09-11 12:56:25', '', 20000.00),
('sSwzlkmY4HR', '4caGouKUWVi', '0YDar1x3Tmc', '2022-10-16', '08:00:00', 40000.00, 2, 'paid', NULL, 'not_paid', '2022-10-01 04:28:33', '', 20000.00),
('tdc2MHxzoWy', '0aiT5KeUF78', '0YDar1x3Tmc', '0000-00-00', '15:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2022-10-11 13:31:58', '', 10000.00),
('tGg0wKQYa4P', 'OcRlbSigNza', '0YDar1x3Tmc', '2023-02-04', '10:00:00', 60000.00, 3, 'paid', NULL, 'not_paid', '2023-01-23 23:34:12', '', 30000.00),
('tGqFJAu9sQe', 'LbPkKuMWfog', '0YDar1x3Tmc', '2023-02-24', '11:00:00', 40000.00, 2, 'paid', NULL, 'not_paid', '2023-02-06 23:10:48', '', 20000.00),
('UyGtQr18oNg', 'xOSqm3C67QX', '0YDar1x3Tmc', '2022-12-03', '10:00:00', 40000.00, 2, 'paid', NULL, 'not_paid', '2022-09-16 06:43:53', '', 20000.00),
('VKTDNY5q78t', '3X7QV5NDybv', '0YDar1x3Tmc', '0000-00-00', '16:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2022-09-19 03:56:49', '', 10000.00),
('W1JaZfyxKBH', 'bdmIuy60R17', '0YDar1x3Tmc', '2022-08-18', '15:00:00', 2.00, 1, 'not_paid', NULL, 'not_paid', '2022-08-02 10:16:56', 'hello hello', 1.00),
('WL8DUfShesO', 'c8Wv5DLBxlY', '0YDar1x3Tmc', '2022-09-11', '11:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2022-09-08 02:53:08', '', 10000.00),
('wn8EOPZcNXt', 'NpOFdb7g0Jm', '0YDar1x3Tmc', '0000-00-00', '10:00:00', 20000.00, 1, 'not_paid', NULL, 'not_paid', '2022-12-14 22:01:22', '', 10000.00),
('wOBLCePzks6', 'HGBkq6CwgZL', '0YDar1x3Tmc', '2022-12-18', '10:00:00', 40000.00, 2, 'not_paid', NULL, 'not_paid', '2022-12-12 22:56:59', '', 20000.00),
('xY2NQwSZBgh', 'GHKXSYgrZQv', '0YDar1x3Tmc', '0000-00-00', '00:00:00', 40000.00, 2, 'not_paid', NULL, 'not_paid', '2022-10-04 00:52:25', '', 20000.00),
('Y34hlbpgaNP', 'BxrRYISXlmj', '0YDar1x3Tmc', '2022-10-01', '15:00:00', 2.00, 2, 'paid', NULL, 'not_paid', '2022-09-26 00:18:14', '', 1.00),
('YxhD6s2JZOR', 'Fl9uDHhILxd', '0YDar1x3Tmc', '2022-09-04', '08:00:00', 20000.00, 1, 'paid', NULL, 'not_paid', '2022-08-15 07:45:56', 'Job Ayubu - 01/01/1980 - 21955867\r\nJoshua Mugo-01/07/1986 - 24541455\r\nSonia Ayubu - 05/10/2002 - 40454990\r\nTheo Ayub - 22/07/2010 Minor\r\nPraises Murimi - 08/12/2016 Minor', 10000.00),
('zDt2HyLRo4e', '814JCiGgvt3', '0YDar1x3Tmc', '2022-09-25', '11:00:00', 40000.00, 2, 'paid', NULL, 'not_paid', '2022-09-12 02:49:52', '', 20000.00);

-- --------------------------------------------------------

--
-- Table structure for table `booking_camping`
--

CREATE TABLE `booking_camping` (
  `id` varchar(11) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `activity_id` varchar(11) NOT NULL,
  `date_picked` date NOT NULL,
  `time_picked` time NOT NULL,
  `amount` float(10,2) NOT NULL,
  `no_of_people` int(11) NOT NULL,
  `no_of_nights` int(11) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `remainder_amount` float(10,2) DEFAULT NULL,
  `remainder_status` enum('paid','not_paid') NOT NULL DEFAULT 'not_paid',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `extra_people` varchar(9000) NOT NULL,
  `deposit_paid` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `booking_camping`
--

INSERT INTO `booking_camping` (`id`, `userid`, `activity_id`, `date_picked`, `time_picked`, `amount`, `no_of_people`, `no_of_nights`, `payment_status`, `remainder_amount`, `remainder_status`, `date_created`, `extra_people`, `deposit_paid`) VALUES
('AyO1swlQGqJ', 'gV8csXFA7wT', '1CFl2KrjEPy', '2023-02-18', '13:30:00', 5000.00, 2, 1, 'paid', NULL, 'not_paid', '2023-02-07 02:20:44', '', 2500.00),
('GsTiu60Yz3Q', 'bdmIuy60R17', '1CFl2KrjEPy', '2022-08-10', '16:00:00', 2.00, 1, 1, 'paid', NULL, 'paid', '2022-08-02 10:27:27', '', 1.00),
('IPZlsRCtA2y', 'j3tK6mzOr0X', '1CFl2KrjEPy', '2023-01-06', '16:00:00', 5000.00, 2, 1, 'not_paid', NULL, 'not_paid', '2022-12-27 23:37:06', '', 2500.00),
('WHXyebJFthi', 'j3tK6mzOr0X', '1CFl2KrjEPy', '2023-01-06', '16:00:00', 5000.00, 2, 1, 'not_paid', NULL, 'not_paid', '2022-12-27 23:37:02', '', 2500.00);

-- --------------------------------------------------------

--
-- Table structure for table `camping`
--

CREATE TABLE `camping` (
  `id` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(10) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `poster` varchar(100) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `camping`
--

INSERT INTO `camping` (`id`, `name`, `description`, `price`, `discount`, `poster`, `banner`, `status`, `date_created`) VALUES
('1CFl2KrjEPy', 'Camping', 'The core spirit of Mawingu Camp Kijabe is its unique location on the summit of a mountain with unique views into the Rift Valley and to the crater of Mt Longonot. The campsite is located right next to the paragliding launch so its ideal for paragliding pilots to camp to enjoy evening or early morning flights. As we have hosted a few bigger events up there, the campsite can be used for larger groups of self campers, you an also rent a tent or ask for a glamping solution with or without full catering services. There is enough firewoood and the caretaker can also get you water and supplies from the nearby village.', 2500, 0, 'imgyloc2209309110320220508amzan6.jpg', 'imgm3jk22111423541420221006pmgsnb.png', 'active', '2022-06-14 16:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` varchar(11) NOT NULL,
  `user_id` varchar(11) DEFAULT NULL,
  `device` varchar(100) NOT NULL,
  `product_id` varchar(11) NOT NULL,
  `cart_quantity` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `cart_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `device`, `product_id`, `cart_quantity`, `date_created`, `date_updated`, `status`, `cart_price`) VALUES
('3K4qiM5Q1gE', NULL, '4b6bdfcd-d0d1-4865-bfa7-0b847eaf43f6', 'ijIRpbMBZ0v', 1, '2022-08-14 05:09:32', NULL, 'active', 4500),
('8ivtLrOGDuH', NULL, 'b84df4d0-398f-46f8-b982-ab3082f688d1', '0dL3jGDQzqS', 1, '2023-01-13 23:22:33', NULL, 'active', 1500),
('B7FJQDXV2xw', 'bdmIuy60R17', 'c83e5c68-f70b-45bc-8a33-3c4af3aad70c', '0dL3jGDQzqS', 3, '2022-08-19 02:03:10', '2022-08-19 02:03:17', 'active', 4500),
('CsgbTlH1hSx', NULL, '88b2ceb1-3bb5-4bcf-b2ac-ad32dca1cc59', '0dL3jGDQzqS', 1, '2022-09-19 03:12:28', NULL, 'active', 1500),
('f3GXkQ5B4qM', NULL, '3c1e199e-9d0e-4081-b2e1-981dfe9aabb9', '6m2FrG5XiLs', 5, '2022-11-16 00:28:51', NULL, 'active', 4000),
('I5nNqiJ8tvM', NULL, '', '', 0, '2023-02-14 21:47:11', NULL, 'active', NULL),
('oL4JgSNOkUn', NULL, '4f110c0f-12f0-446d-bb64-ac5023a2014a', '0dL3jGDQzqS', 1, '2022-08-16 01:29:11', NULL, 'active', 1500),
('qU2AmBftezh', NULL, '50649685-af1e-45a7-8266-49a3b82e095d', '0dL3jGDQzqS', 1, '2022-07-06 00:13:14', NULL, 'active', 1000),
('TEAYysXjV84', NULL, '2d1b6871-ed1a-4bed-938b-b6954cc35f73', 'ijIRpbMBZ0v', 5, '2022-08-11 03:03:20', NULL, 'active', 5),
('uNekFRr5jVK', NULL, 'f8e30fdc-3d4a-4b5b-8366-981d584871d4', '0dL3jGDQzqS', 2, '2022-09-19 03:09:12', NULL, 'active', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `counter_figures`
--

CREATE TABLE `counter_figures` (
  `id` varchar(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(30) NOT NULL,
  `picture` varchar(30) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `counter_figures`
--

INSERT INTO `counter_figures` (`id`, `name`, `number`, `picture`, `date_created`) VALUES
('fv6BxabSsQ0', 'Events', 7, 'calendar', '2022-06-14 17:55:24'),
('HZNfm8bvRtM', 'Locations', 3, 'location', '2022-06-14 17:55:56'),
('sgb4ri2FOvH', 'Instructors', 5, 'instructor', '2022-06-14 17:52:59'),
('ZbTMsF5YUwt', 'Happy Clients', 700, 'happiness', '2022-06-14 17:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `email_banner`
--

CREATE TABLE `email_banner` (
  `id` int(11) NOT NULL,
  `top_image` varchar(255) NOT NULL,
  `bottom_image` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_banner`
--

INSERT INTO `email_banner` (`id`, `top_image`, `bottom_image`, `date_created`) VALUES
(1, 'img2btu2205317040320220408pmxleh.jpg', 'imgetyg22031215351220222907pmilnh.jpeg', '2022-07-12 08:35:29');

-- --------------------------------------------------------

--
-- Table structure for table `email_content`
--

CREATE TABLE `email_content` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email_body` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_content`
--

INSERT INTO `email_content` (`id`, `name`, `email_body`, `status`, `date_created`) VALUES
(1, 'Booking Email', 'Congratulations on booking your tandem paragliding experience with us. We are looking forward to hosting you at our camp soon!', 'active', '2022-08-18 07:24:34'),
(2, 'Mawingu Camp Tandem Flight Certificate', 'Congratulations on completion of your tandem flight at Mawingu Camp Kenya. \r\n\r\nWe are proud to present you, your certificate!\r\n\r\nSee up in the sky!', 'active', '2022-08-18 07:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` varchar(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `venue` varchar(100) NOT NULL,
  `poster` varchar(100) NOT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  `video_url` varchar(100) DEFAULT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `name`, `description`, `venue`, `poster`, `banner`, `video`, `video_url`, `event_date`, `event_time`, `status`, `date_created`) VALUES
('4yhFSlHd582', 'Rift Valley Retreat', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Langata Road', 'img52nv22121500391520222406amjwui.png', NULL, NULL, '', '2022-07-29', '18:45:00', 'active', '2022-06-14 17:39:24'),
('6N5HK9tIS7l', 'Naivasha paragliding Festival', 'We are back with the Naivasha Paragliding Festival that will be hosted at our Eburru site ðŸ“ from the 2nd - 4th of September 2022. It will be a weekend like full of accuracy landing and cross county paragliding ðŸª‚ action with tandems offered to those interested m, camping ðŸ• with sunrise and sunset ðŸŒ… yoga sessions and a whole lot of fun hilltop parties with great music and good food.', 'Sky Camp Kijabe', 'imgqs3022073119133120220508pm7hz9.jpg', NULL, 'vidjsoc22111211371220223508amkyq3.mp4', '', '2022-09-02', '14:30:00', 'active', '2022-06-14 17:20:41'),
('TPpryK9Own2', '', '', '', '', NULL, NULL, NULL, '0000-00-00', '00:00:00', 'active', '2022-08-03 10:00:39'),
('UzMvrShxyWs', 'Tandem Bonanza', 'We present to you our tandem bonanza end-month experience, to celebrate the end of our tandem paragliding season at our infamous Kijabe site. The package will include accommodation for 2 days and 1 night on a full board basis, transportation and a fun tandem paragliding flight experience. You don&#039;t want to miss this. Book your tickets and lets have a blast on more time at Kijabe!', 'Kijabe', 'imgk4o32208920060920220010pmz2jh.jpg', NULL, NULL, '', '2022-10-29', '07:00:00', 'active', '2022-10-09 11:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `event_booking`
--

CREATE TABLE `event_booking` (
  `id` int(11) NOT NULL,
  `event_id` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `ticket_type` varchar(100) NOT NULL,
  `num_ticket` int(11) NOT NULL,
  `bought_tickets` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `paid` enum('paid','not_paid') NOT NULL DEFAULT 'not_paid',
  `order_id` int(6) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `admission` enum('pending','admitted') NOT NULL DEFAULT 'pending',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event_booking`
--

INSERT INTO `event_booking` (`id`, `event_id`, `name`, `email`, `phone_number`, `ticket_type`, `num_ticket`, `bought_tickets`, `amount`, `paid`, `order_id`, `status`, `admission`, `date_created`) VALUES
(1, '', 'John Ndungu', 'john.ndungu@vesencomputing.com', '0713564852', 'Single', 1, 0, 500, 'not_paid', 579895, 'active', 'admitted', '2022-08-03 01:41:43'),
(2, '', '', '', '', '', 0, 0, 0, 'not_paid', 289318, 'active', 'pending', '2022-08-03 01:41:46'),
(3, '', 'mmm', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 12, 'not_paid', 392984, 'active', 'pending', '2022-08-03 03:59:20'),
(4, '6N5HK9tIS7l', 'Patrick Manyara', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 1, 'not_paid', 530732, 'active', 'pending', '2022-08-03 04:25:19'),
(5, '6N5HK9tIS7l', 'Patrick Manyara', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 1, 'paid', 191134, 'active', 'pending', '2022-08-03 04:27:27'),
(6, '6N5HK9tIS7l', 'Patrick Manyara', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 1, 'not_paid', 908119, 'active', 'pending', '2022-08-03 04:28:30'),
(7, '6N5HK9tIS7l', 'Patrick Manyara', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 1, 'paid', 857333, 'active', 'pending', '2022-08-03 04:29:57'),
(8, '6N5HK9tIS7l', 'Patrick Manyara', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 1, 'paid', 450103, 'active', 'pending', '2022-08-03 04:30:35'),
(9, '6N5HK9tIS7l', 'Patrick Manyara', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 1, 'paid', 760314, 'active', 'pending', '2022-08-03 04:31:35'),
(10, '6N5HK9tIS7l', 'Patrick Manyara', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 1, 'not_paid', 482405, 'active', 'pending', '2022-08-03 04:33:43'),
(11, '6N5HK9tIS7l', 'Patrick Manyara', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 1, 'not_paid', 866263, 'active', 'pending', '2022-08-03 04:34:11'),
(12, '6N5HK9tIS7l', 'Patrick Manyara', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 1, 'paid', 223595, 'active', 'pending', '2022-08-03 04:36:20'),
(13, '6N5HK9tIS7l', 'Patrick Manyara', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 1, 'paid', 451356, 'active', 'pending', '2022-08-03 04:38:45'),
(14, '6N5HK9tIS7l', 'Patrick Manyara', 'pmanyara97@gmail.com', '070007877', 'Regular', 1, 0, 1, 'not_paid', 895731, 'active', 'pending', '2022-08-03 04:39:15'),
(15, '', '', '', '', '', 0, 0, 0, 'not_paid', 898788, 'active', 'pending', '2022-08-22 11:58:59'),
(16, '', '', '', '', '', 0, 0, 0, 'not_paid', 564043, 'active', 'pending', '2022-08-22 11:59:04'),
(17, '6N5HK9tIS7l', 'John', 'ndungu.murimi@gmail.com', '07135648523', 'Advanced Tickets', 1, 0, 2500, 'not_paid', 840070, 'active', 'pending', '2022-08-22 12:25:44'),
(18, '6N5HK9tIS7l', 'John', 'ndungu.murimi@gmail.com', '07135648523', 'Advanced Tickets', 1, 0, 2500, 'not_paid', 188840, 'active', 'pending', '2022-08-22 12:25:47'),
(19, '6N5HK9tIS7l', 'John Ndungu', 'esokonik@gmail.com', '0713564851', 'Advanced Tickets', 2, 0, 5000, 'not_paid', 843677, 'active', 'pending', '2022-08-22 14:50:41'),
(20, '6N5HK9tIS7l', 'John', 'ndungu.murimi@gmail.com', '07135648523', 'Advanced Tickets', 1, 0, 2500, 'not_paid', 991774, 'active', 'pending', '2022-08-23 01:11:14'),
(21, '6N5HK9tIS7l', 'John', 'ndungu.murimi@gmail.com', '07135648523', 'Advanced Tickets', 1, 0, 2500, 'not_paid', 396701, 'active', 'pending', '2022-08-23 04:45:24'),
(22, '6N5HK9tIS7l', 'Judy Wanjiku', 'Judyshiku@gmail.com', '+254714588606', 'Accommodation (full board) + Transport + Tandem Pa', 2, 0, 50000, 'paid', 798662, 'active', 'pending', '2022-08-26 03:40:24'),
(23, '', '', '', '', '', 0, 0, 0, 'not_paid', 493598, 'active', 'pending', '2022-08-26 03:40:29'),
(24, '6N5HK9tIS7l', 'Alfred Maina', 'volks.alfred@gmail.com', '0712779402', 'Accommodation (full board) + Transport + Tandem Pa', 1, 0, 25000, 'not_paid', 174296, 'active', 'pending', '2022-08-27 07:32:56'),
(25, '6N5HK9tIS7l', 'Alfred Maina', 'volks.alfred@gmail.com', '0712779402', 'Accommodation (full board) + Transport + Tandem Pa', 1, 0, 25000, 'paid', 748558, 'active', 'pending', '2022-08-27 07:35:49'),
(26, '6N5HK9tIS7l', 'Joy Ngigi', 'joyngigi88@gmail.com', '+254799724807', 'Accommodation (full board) + Transport + Tandem Pa', 2, 0, 50000, 'not_paid', 975450, 'active', 'pending', '2022-08-30 10:25:18'),
(27, '6N5HK9tIS7l', 'Caroline Wainaina', 'barbarawainaina.bw@gmail.com', '0725995367', 'Accommodation (full board) + Transport', 2, 0, 20000, 'paid', 980393, 'active', 'pending', '2022-09-01 07:19:15'),
(28, '6N5HK9tIS7l', 'Aryana', 'ramlarumish@gmail.com', 'Yusra abdi', 'Accommodation (full board) + Transport + Tandem Pa', 1, 0, 25000, 'paid', 242252, 'active', 'pending', '2022-09-02 02:57:01'),
(29, '6N5HK9tIS7l', 'Mugo Mutuota', 'mugomutuota@gmail.com', '0713394417', 'Advanced Tickets', 2, 0, 5000, 'not_paid', 660059, 'active', 'pending', '2022-09-02 04:05:59'),
(30, 'UzMvrShxyWs', 'Mariam Diallo', 'diallo.mariam@hotmail.fr', 'Mariam Diallo', 'Tandem Paragliding + Accommodation (full board) +', 1, 0, 25000, 'not_paid', 508701, 'active', 'pending', '2022-10-10 03:49:23'),
(31, '', '', '', '', '', 0, 0, 0, 'not_paid', 297406, 'active', 'pending', '2022-10-15 14:59:12'),
(32, '', '', '', '', '', 0, 0, 0, 'not_paid', 600967, 'active', 'pending', '2022-10-18 17:05:42'),
(33, '', '', '', '', '', 0, 0, 0, 'not_paid', 378869, 'active', 'pending', '2022-10-29 06:21:05'),
(34, '', '', '', '', '', 0, 0, 0, 'not_paid', 288124, 'active', 'pending', '2022-11-06 08:48:09'),
(35, '', '', '', '', '', 0, 0, 0, 'not_paid', 326331, 'active', 'pending', '2022-11-15 10:09:37'),
(36, '', '', '', '', '', 0, 0, 0, 'not_paid', 483167, 'active', 'pending', '2022-11-23 21:19:52'),
(37, '', '', '', '', '', 0, 0, 0, 'not_paid', 944706, 'active', 'pending', '2022-12-03 02:02:43'),
(38, '', '', '', '', '', 0, 0, 0, 'not_paid', 775437, 'active', 'pending', '2022-12-12 00:53:56');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tag` varchar(30) DEFAULT NULL,
  `poster` varchar(100) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `name`, `tag`, `poster`, `status`, `date_created`) VALUES
('5PFzGHtQlx8', 'Longonot', 'Longonot', 'imgfja522111611181620224806am3k9j.png', 'active', '2022-06-16 04:18:48'),
('5Vk8q4dXUHc', 'Kijabe', 'Kijabe', 'img5pks22011501081520225306am87uo.png', 'active', '2022-06-14 18:08:53'),
('7g1VmE3MNZG', 'Kijabe', 'Kijabe', 'imgfw9622111611181620223106am78xq.png', 'active', '2022-06-16 04:18:31'),
('8qlabIpRZGz', 'Longonot', 'Longonot', 'imgmlen22111611201620220206am0i1f.png', 'active', '2022-06-16 04:20:02'),
('9T0CiqWBO8Q', 'Rift Valley', 'Rift', 'imgqalb22081208301220220808am920g.jpg', 'active', '2022-06-16 04:16:57'),
('FTgVx0hOGEW', 'Rift Valley', 'Rift', 'img6srx22111611151620224106amvl62.png', 'active', '2022-06-16 04:15:41'),
('hANYkjP1Oi3', 'Kijabe', 'Kijabe', 'imgbzrd22111611181620221506ampj1v.png', 'active', '2022-06-16 04:18:15'),
('Lr9sOTo2kMS', 'Longonot', 'Longonot', 'img14uz22111611181620220106amd5q3.png', 'active', '2022-06-16 04:18:01'),
('NFWp8HUYv4X', 'Rift Valley', 'Rift', 'imgvh2u22111611191620222306amgps0.png', 'active', '2022-06-16 04:19:23'),
('qt7DU0K2o4k', 'Longonot', 'Longonot', 'img5mkl2205317020320221508pmklu8.jpeg', 'active', '2022-06-16 04:16:36'),
('vrLXF0GBuEs', 'Rift Valley', 'Rift', 'imgmx9d22111611171620221406amcg5z.png', 'active', '2022-06-16 04:17:14'),
('WwPVOhGKI6f', 'Longonot', 'Longonot', 'imgwium22111611191620220906amzchq.png', 'active', '2022-06-16 04:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE `inquiry` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inquiry`
--

INSERT INTO `inquiry` (`id`, `name`, `email`, `phone`, `message`, `date_created`) VALUES
(1, 'Pat Ayub', 'patjunhopat@gmail.com', '07121212', 'Hello Mawala', '2023-02-01 05:09:46'),
(2, ' ', '', '', '', '2023-02-03 13:20:41'),
(3, ' ', '', '', '', '2023-02-03 18:15:40'),
(4, 'Muturi  Mokua ', 'muturicalebmokua@gmail.com', '0793584622', 'Hello\r\nI&#039;m an exercise and sports science student from kenyatta University. I&#039;m inquiring if your company has attachment or internship opportunities that you are offering. Waiting to hear from you soon.', '2023-02-04 19:59:10'),
(5, 'Neal Ruot Dave Stalker', 'JanaePovey@gmail.com', '', 'Submit your new website to our directory and start getting more clients.  http://bit.ly/3JEP48y', '2023-02-07 18:53:04'),
(6, 'Mitchel', 'support@vesencomputing.com', '07459576', 'test share', '2023-02-15 12:11:30'),
(7, 'Josphat', 'dww.23988@gmail.com', '12345678', 'Hello.\r\nI would like to set up a Kenyan entity.', '2023-02-16 10:48:36'),
(8, 'ttt ttt', 'johnnygachoki@gmail.com', '0715164966', 'test', '2023-03-02 13:51:46'),
(9, 'ttt ttt', 'johnnygachoki@gmail.com', '0715164966', 'test', '2023-03-02 13:55:01'),
(10, 'ttt ttt', 'johnnygachoki@gmail.com', '', 'twst', '2023-03-02 14:00:32'),
(11, 'ttt ttt', 'johnnygachoki@gmail.com', '', 'test', '2023-03-02 14:03:34'),
(12, 'ttt ttt', 'johnnygachoki@gmail.com', '', 'test', '2023-03-02 14:04:03'),
(13, 'ttt ttt', 'johnnygachoki@gmail.com', '', 'test', '2023-03-02 14:04:38'),
(14, 'ttt ttt', 'johnnygachoki@gmail.com', '0715164966', 'test', '2023-03-02 14:05:57'),
(15, 'ttt ttt', 'johnnygachoki@gmail.com', '0715164966', 'test', '2023-03-02 14:11:13'),
(16, 'ttt ttt', 'johnnygachoki@gmail.com', '0715164966', 'test', '2023-03-02 14:12:07'),
(17, '', '', '', '', '2023-03-16 02:20:18'),
(18, '', '', '', '', '2023-03-20 04:29:36'),
(19, 'ttt ttt', 'johnnygachoki@gmail.com', '0715164966', 'test', '2023-03-30 10:45:48'),
(20, 'ttt ttt', 'johnnygachoki@gmail.com', '0715164966', 'test', '2023-03-30 12:45:41'),
(21, 'ttt ttt', 'johnnygachoki@gmail.com', '0715164966', 'test', '2023-03-30 12:47:52'),
(22, 'ttt ttt', 'johnnygachoki@gmail.com', '0715164966', 'test', '2023-03-30 14:13:20'),
(23, 'ttt ttt', 'johnnygachoki@gmail.com', '0715164966', 'test', '2023-03-30 14:14:46'),
(24, 'John Ndungu', 'vesendummy@gmail.com', '+254713564851', 'Hey testing Recaptcha', '2023-03-30 22:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `limited_offer`
--

CREATE TABLE `limited_offer` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `showing` enum('yes','no') NOT NULL DEFAULT 'yes',
  `url` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `limited_offer`
--

INSERT INTO `limited_offer` (`id`, `title`, `description`, `showing`, `url`, `status`, `date_created`) VALUES
(1, 'NAIVASHA PARAGLIDING FESTIVAL', 'The Mawingu Camp Kenya Team is proud to present to you the Naivasha Paragliding Festival that will take place at our campsite in the Great Rift Valley. The festival will have a lot of paragliding action, both solo and tandem, as well as yoga, camping and a whole lot of partying. You don&#039;t want to miss out on this!', 'no', 'https://mawingucampkenya.com/single_event?id=6N5HK9tIS7l', 'active', '2022-08-18 08:55:04');

-- --------------------------------------------------------

--
-- Table structure for table `main_banner`
--

CREATE TABLE `main_banner` (
  `id` int(11) NOT NULL,
  `banner_name` varchar(255) DEFAULT NULL,
  `poster` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `main_banner`
--

INSERT INTO `main_banner` (`id`, `banner_name`, `poster`, `date_created`) VALUES
(1, 'Main Banner', 'img3vgq22031215281220220407pmapxe.jpg', '2022-07-12 08:28:04'),
(2, 'Events Page Banner', 'img7y0m22101910431920223508amtnjl.jpg', '2022-07-12 08:28:04'),
(3, 'Services Page Banner', 'img9nuz2212412450420222611pmx752.jpeg', '2022-07-12 08:28:04'),
(4, 'Gallery Page Banner', 'img6oqz22101910441920225908am5cuj.jpg', '2022-07-12 08:28:04'),
(5, 'Shop Page Banner', 'img7ksy22101910451920221808ameqxi.jpg', '2022-07-12 08:28:04'),
(6, 'Contact Us Page Banner', 'imgolmk22101910451920224208amiecu.jpg', '2022-07-12 08:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` varchar(11) NOT NULL,
  `order_status` enum('pending','confirmed','processing','transit','delivered','returned','failed','cancelled') NOT NULL DEFAULT 'pending',
  `payment_status` enum('paid','not_paid') NOT NULL DEFAULT 'not_paid',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `total_cost` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_status`, `payment_status`, `date_created`, `total_cost`) VALUES
(1, 'bdmIuy60R17', 'confirmed', 'paid', '2022-08-03 03:57:09', '2300'),
(2, 'jrDsu3cWJ2H', 'confirmed', 'not_paid', '2022-08-03 07:33:35', '800'),
(3, 'GDkFKMuy3tX', 'confirmed', 'not_paid', '2022-10-05 07:21:05', '2400');

-- --------------------------------------------------------

--
-- Table structure for table `other_images`
--

CREATE TABLE `other_images` (
  `id` varchar(20) NOT NULL,
  `activity_id` varchar(20) NOT NULL,
  `otherImage1` varchar(50) DEFAULT NULL,
  `otherImage2` varchar(50) DEFAULT NULL,
  `otherImage3` varchar(50) DEFAULT NULL,
  `otherImage4` varchar(50) DEFAULT NULL,
  `otherImage5` varchar(50) DEFAULT NULL,
  `otherImage6` varchar(50) DEFAULT NULL,
  `otherImage7` varchar(255) DEFAULT NULL,
  `otherImage8` varchar(255) DEFAULT NULL,
  `otherImage9` varchar(255) DEFAULT NULL,
  `otherImage10` varchar(255) DEFAULT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `other_images`
--

INSERT INTO `other_images` (`id`, `activity_id`, `otherImage1`, `otherImage2`, `otherImage3`, `otherImage4`, `otherImage5`, `otherImage6`, `otherImage7`, `otherImage8`, `otherImage9`, `otherImage10`, `datecreated`) VALUES
('2dGeakfFB1V', '0YDar1x3Tmc', 'img4dy722111211221220220108aml6ht.jpeg', 'img07em22121500041520223806am0si1.png', 'img0fsk22121500041520223806amhrx4.png', 'imgfpad22121500041520223806amiht4.png', 'imgb26t22121500041520223806am39pi.png', 'imgg2ja22121500041520223806aml5pi.png', NULL, NULL, NULL, NULL, '2022-06-14 17:04:38'),
('VN8tXW3EeaY', '0dL3jGDQzqS', 'imgy9p022113111403120222507amq57g.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-31 04:40:25');

-- --------------------------------------------------------

--
-- Table structure for table `pa`
--

CREATE TABLE `pa` (
  `TransactionType` varchar(255) DEFAULT NULL,
  `TransID` varchar(255) DEFAULT NULL,
  `TransTime` varchar(255) DEFAULT NULL,
  `TransAmount` varchar(255) DEFAULT NULL,
  `BillRefNumber` varchar(255) DEFAULT NULL,
  `MSISDN` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `id` int(255) NOT NULL,
  `BusinessShortCode` varchar(255) NOT NULL,
  `InvoiceNumber` varchar(255) NOT NULL,
  `OrgAccountBalance` varchar(255) NOT NULL,
  `ThirdPartyTransID` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pa`
--

INSERT INTO `pa` (`TransactionType`, `TransID`, `TransTime`, `TransAmount`, `BillRefNumber`, `MSISDN`, `FirstName`, `id`, `BusinessShortCode`, `InvoiceNumber`, `OrgAccountBalance`, `ThirdPartyTransID`, `date_created`) VALUES
('Pay Bill', 'QH20J7V0EE', '20220802163600', '1.00', 'test', '2547 ***** 739', 'MICHAEL', 1, '4067387', '0', '2.00', '', '2022-08-02 09:36:02'),
('Pay Bill', 'QH21JBWM5H', '20220802172238', '1.00', 'o7FUCDTpYNL', '2547 ***** 739', 'MICHAEL', 2, '4067387', '', '4.00', '', '2022-08-02 10:22:39'),
('Pay Bill', 'QH28JCCV54', '20220802172735', '1.00', 'GsTiu60Yz3Q', '2547 ***** 739', 'MICHAEL', 3, '4067387', '', '5.00', '', '2022-08-02 10:27:36'),
('Pay Bill', 'QH21JN9F41', '20220802191339', '2.00', 'pWdcI6ylX4R', '2547 ***** 891', 'PATRICK', 4, '4067387', '', '7.00', '', '2022-08-02 12:13:40'),
('Pay Bill', 'QH33KLV3KD', '20220803105410', '1.00', '10', '2547 ***** 739', 'MICHAEL', 5, '4067387', '', '8.00', '', '2022-08-03 03:54:11'),
('Pay Bill', 'QH35KM3L31', '20220803105722', '1.00', '1', '2547 ***** 739', 'MICHAEL', 6, '4067387', '', '9.00', '', '2022-08-03 03:57:23'),
('Pay Bill', 'QH36KOXSOM', '20220803113635', '1.00', '12', '2547 ***** 739', 'MICHAEL', 7, '4067387', '', '10.00', '', '2022-08-03 04:36:37'),
('Pay Bill', 'QH38KP46EO', '20220803113858', '1.00', '13', '2547 ***** 739', 'MICHAEL', 8, '4067387', '', '11.00', '', '2022-08-03 04:38:59'),
('Pay Bill', 'QH81V97I47', '20220808115007', '1.00', 'ALROPN63bX7', '2547 ***** 301', 'John', 9, '4067387', '', '12.00', '', '2022-08-08 04:50:09'),
('Pay Bill', 'QHA0Z1MF84', '20220810134407', '1.00', 'fFlaIOJU7qv', '2547 ***** 301', 'John', 10, '4067387', '', '13.00', '', '2022-08-10 04:44:09'),
('Pay Bill', 'QHF699K1HU', '20220815165124', '10000.00', 'YxhD6s2JZOR', '2547 ***** 695', 'JOB', 11, '4067387', '', '10013.00', '', '2022-08-15 07:51:26'),
('Pay Bill', 'QHG9A5VE6X', '20220816093031', '40000.00', 'YxhD6s2JZOR', '2547 ***** 695', 'JOB', 12, '4067387', '', '50013.00', '', '2022-08-16 00:30:33'),
('Pay Bill', 'QHI3E3HGQ7', '20220818112629', '72000.00', 'Tandum', '2541 ***** 507', 'Tariq', 13, '4067387', '', '72000.00', '', '2022-08-18 02:26:31'),
('Pay Bill', 'QHK4HPYKNK', '20220820090556', '18000.00', 'TANDEM', '2547 ***** 655', 'BHAVISH', 14, '4067387', '', '90000.00', '', '2022-08-20 00:05:59'),
('Pay Bill', 'QHM9LJ6P2L', '20220822095330', '5000.00', 'NPFs', '2547 ***** 612', 'GUILLAUME', 15, '4067387', '0', '95000.00', '', '2022-08-22 00:53:32'),
('Pay Bill', 'QHN5O7BCL5', '20220823165839', '24000.00', 'Tandem', '2547 ***** 383', 'JUDY', 16, '4067387', '', '119000.00', '', '2022-08-23 07:58:41'),
('Pay Bill', 'QHO3PETBV3', '20220824103827', '8000.00', 'Tandem', '2547 ***** 383', 'JUDY', 17, '4067387', '', '127000.00', '', '2022-08-24 01:38:37'),
('Pay Bill', 'QHO6QQKH0W', '20220824205802', '5000.00', 'NPFs', '2547 ***** 976', 'JULIETTE', 18, '4067387', '0', '132000.00', '', '2022-08-24 11:58:04'),
('Pay Bill', 'QHP5RQ9Y4Z', '20220825141802', '25000.00', 'NFPs', '2547 ***** 685', 'SUSAN', 19, '4067387', '', '157000.00', '', '2022-08-25 05:18:03'),
('Pay Bill', 'QHQ6THXOT4', '20220826124045', '50000.00', '22', '2547 ***** 606', 'JUDY', 20, '4067387', '', '207000.00', '', '2022-08-26 03:40:48'),
('Pay Bill', 'QHR0W19NLE', '20220827163605', '25000.00', '25', '2547 ***** 402', 'Alfred', 21, '4067387', '', '232000.00', '', '2022-08-27 07:36:07'),
('Pay Bill', 'QHS8XZ1CH0', '20220828164238', '44000.00', 'tandem', '2547 ***** 383', 'JUDY', 22, '4067387', '', '276000.00', '', '2022-08-28 07:42:40'),
('Pay Bill', 'QHT9Z0VBR5', '20220829091235', '1500.00', 'NPFs', '2547 ***** 855', 'WOODS', 23, '4067387', '0', '277500.00', '', '2022-08-29 00:12:38'),
('Pay Bill', 'QHT9ZDP4K7', '20220829122719', '1500.00', 'NPFs', '2541 ***** 551', 'JURG', 24, '4067387', '0', '279000.00', '', '2022-08-29 03:27:21'),
('Pay Bill', 'QHT8ZKBWS2', '20220829140013', '10000.00', 'lW8YnLUAhJs', '2547 ***** 393', 'BRIGHT', 25, '4067387', '', '289000.00', '', '2022-08-29 05:00:14'),
('Pay Bill', 'QHV14IDBRD', '20220831131926', '28500.00', 'Tandem', '2547 ***** 126', 'LIU', 26, '4067387', '', '78500.00', '', '2022-08-30 23:54:29'),
('Pay Bill', 'QI166GUI56', '20220901114726', '25000.00', 'NPFs', '2547 ***** 166', 'BENSON', 27, '4067387', '0', '103500.00', '', '2022-09-01 02:47:28'),
('Pay Bill', 'QI196QFTGR', '20220901135948', '8500.00', 'TANDEM', '2547 ***** 655', 'BHAVISH', 28, '4067387', '', '112000.00', '', '2022-09-01 04:59:49'),
('Pay Bill', 'QI1270OBPA', '20220901161941', '20000.00', '27', '2547 ***** 367', 'CAROLINE', 29, '4067387', '', '132000.00', '', '2022-09-01 07:19:43'),
('Pay Bill', 'QI187YMRJO', '20220901223945', '2000.00', 'Transport', '2547 ***** 552', 'SARAH', 30, '4067387', '', '134000.00', '', '2022-09-01 13:39:48'),
('Pay Bill', 'QI228MYFYE', '20220902120608', '25000.00', '28', '2547 ***** 905', 'YUSRA', 31, '4067387', '', '25000.00', '', '2022-09-02 03:06:09'),
('Organization To Organization Transfer', 'QI298WKABX', '20220902141525', '70000.00', 'NFPs', '2547 ***** 032', 'B2C LOOP VIA NCBA', 32, '4067387', 'Cynthia Onyango', '95000.00', '', '2022-09-02 05:15:26'),
('Pay Bill', 'QI259HPBTJ', '20220902182017', '18000.00', 'NPFs', '2547 ***** 612', 'GUILLAUME', 33, '4067387', '0', '113000.00', '', '2022-09-02 09:20:20'),
('Pay Bill', 'QI249Z4PYC', '20220902210131', '40000.00', 'tandem', '2547 ***** 677', 'FREDRICK', 34, '4067387', '', '153000.00', '', '2022-09-02 12:01:34'),
('Pay Bill', 'QI39A8A7CR', '20220903050835', '36000.00', 'Tandem', '2547 ***** 417', 'JULIUS', 35, '4067387', '', '189000.00', '', '2022-09-02 20:08:37'),
('Pay Bill', 'QI35AQYWPX', '20220903114120', '2500.00', 'NPFs', '2541 ***** 012', 'LUKE', 36, '4067387', '0', '191500.00', '', '2022-09-03 02:41:21'),
('Pay Bill', 'QI40CKZA6M', '20220904084224', '2500.00', 'NIPFs', '2547 ***** 389', 'FINLAY', 37, '4067387', '0', '194000.00', '', '2022-09-03 23:42:26'),
('Pay Bill', 'QI40CKZQ4S', '20220904084229', '2500.00', 'NPFS', '2547 ***** 315', 'ANDREAS', 38, '4067387', '', '196500.00', '', '2022-09-03 23:42:30'),
('Pay Bill', 'QI49CL6VFJ', '20220904084625', '40000.00', 'YxhD6s2JZOR', '2547 ***** 001', 'JOB', 39, '4067387', '0', '236500.00', '', '2022-09-03 23:46:26'),
('Pay Bill', 'QI44CLFOJS', '20220904085058', '2500.00', 'NPFs', '2547 ***** 777', 'JACK', 40, '4067387', '', '239000.00', '', '2022-09-03 23:51:00'),
('Pay Bill', 'QI41CLV1IN', '20220904085839', '2500.00', 'NPf', '2547 ***** 760', 'DAVINA', 41, '4067387', '', '241500.00', '', '2022-09-03 23:58:43'),
('Pay Bill', 'QI42CPOVZA', '20220904100424', '28500.00', 'NPF tandem', '2547 ***** 126', 'LIU', 42, '4067387', '', '270000.00', '', '2022-09-04 01:04:26'),
('Pay Bill', 'QI61GZCA21', '20220906113934', '10000.00', 'Tandem', '2547 ***** 504', 'AGNES', 43, '4067387', '', '280000.00', '', '2022-09-06 02:39:39'),
('Pay Bill', 'QI77INCYR3', '20220907070834', '12000.00', 'Tandem', '2547 ***** 470', 'GATHONI', 44, '4067387', '', '12000.00', '', '2022-09-06 22:08:35'),
('Pay Bill', 'QI80KWAL52', '20220908085720', '1000.00', 'Tandem', '2547 ***** 470', 'GATHONI', 45, '4067387', '', '13000.00', '', '2022-09-07 23:57:22'),
('Pay Bill', 'QI80L8D88C', '20220908115347', '10000.00', '5Z3cJVq6G8P', '2541 ***** 034', 'rihards', 46, '4067387', '', '23000.00', '', '2022-09-08 02:53:49'),
('Pay Bill', 'QI88LBYP7A', '20220908124341', '15000.00', 'mark tandem', '2547 ***** 760', 'DAVINA', 47, '4067387', '', '38000.00', '', '2022-09-08 03:43:43'),
('Pay Bill', 'QI99O2MZLF', '20220909171325', '15000.00', 'tandem', '2547 ***** 677', 'FREDRICK', 48, '4067387', '', '15000.00', '', '2022-09-09 08:13:26'),
('Pay Bill', 'QIA1PI6JI5', '20220910113008', '12500.00', 'Tandem', '2547 ***** 675', 'JUDDY', 49, '4067387', '', '27500.00', '', '2022-09-10 02:30:10'),
('Pay Bill', 'QIB0SCHW2Y', '20220911171450', '4000.00', 'Tandem Transport', '2547 ***** 084', 'RODGERS', 50, '4067387', '0', '31500.00', '', '2022-09-11 08:14:52'),
('Pay Bill', 'QIB1T21J87', '20220911220836', '23000.00', 's7YhfZWXbxe', '2547 ***** 464', 'LEROY', 51, '4067387', '', '54500.00', '', '2022-09-11 13:08:38'),
('Pay Bill', 'QIC6TFHXKC', '20220912092217', '11000.00', 'tandem', '2541 ***** 034', 'rihards', 52, '4067387', '0', '65500.00', '', '2022-09-12 00:22:19'),
('Pay Bill', 'QIC6TPWC4O', '20220912115000', '20000.00', 'zDt2HyLRo4e', '2547 ***** 709', 'KUZIVA', 53, '4067387', '', '85500.00', '', '2022-09-12 02:50:03'),
('Pay Bill', 'QIC1TTI4F1', '20220912123920', '26000.00', 'tandem', '2547 ***** 677', 'FREDRICK', 54, '4067387', '', '111500.00', '', '2022-09-12 03:39:23'),
('Pay Bill', 'QIG13MH9RN', '20220916154402', '20000.00', 'UyGtQr18oNg', '2547 ***** 242', 'WENDY', 55, '4067387', '', '20000.00', '', '2022-09-16 06:44:03'),
('Pay Bill', 'QIH1686YNJ', '20220917180647', '10000.00', '5aZMxGLeiKA', '2547 ***** 450', 'RAJESH', 56, '4067387', '0', '30000.00', '', '2022-09-17 09:06:49'),
('Pay Bill', 'QII57H0I1R', '20220918114325', '19000.00', 'tandem', '2547 ***** 827', 'HILARY', 57, '4067387', '0', '49000.00', '', '2022-09-18 02:43:29'),
('Pay Bill', 'QII77QPGKN', '20220918140806', '8000.00', 'Tandem', '2547 ***** 492', 'FOKJE', 58, '4067387', '', '57000.00', '', '2022-09-18 05:08:10'),
('Pay Bill', 'QII17ZNUUL', '20220918160849', '11000.00', 'Tandem', '2547 ***** 450', 'RAJESH', 59, '4067387', '0', '68000.00', '', '2022-09-18 07:08:50'),
('Pay Bill', 'QII07ZSH4Y', '20220918161019', '10500.00', 'Tandem', '2547 ***** 675', 'JUDDY', 60, '4067387', '', '78500.00', '', '2022-09-18 07:10:21'),
('Pay Bill', 'QII78GCAXD', '20220918191343', '23000.00', 'Tandem', '2547 ***** 433', 'LEROY', 61, '4067387', '', '101500.00', '', '2022-09-18 10:13:46'),
('Pay Bill', 'QIJ89A4OAG', '20220919095838', '4500.00', 'TANDEM', '2547 ***** 655', 'BHAVISH', 62, '4067387', '', '106000.00', '', '2022-09-19 00:58:41'),
('Pay Bill', 'QIJ69D3WLI', '20220919104022', '1080.00', 'yoor', '2547 ***** 195', 'LYDIA', 63, '4067387', '', '107080.00', '', '2022-09-19 01:40:25'),
('Pay Bill', 'QIK4BNGYT6', '20220920120614', '20000.00', 'Tandem', '2547 ***** 314', 'Michael', 64, '4067387', '', '20000.00', '', '2022-09-20 03:06:16'),
('Pay Bill', 'QIK3BV9NDV', '20220920135013', '750.00', 'Picnic', '2547 ***** 989', 'Bansi', 65, '4067387', '0', '20750.00', '', '2022-09-20 04:50:15'),
('Pay Bill', 'QIN2JJQTEA', '20220923213325', '5250.00', 'Tandem', '2547 ***** 314', 'Michael', 66, '4067387', '', '24920.00', '', '2022-09-23 12:33:26'),
('Pay Bill', 'QIQ0O8125K', '20220926091827', '1.00', 'Y34hlbpgaNP', '2547 ***** 064', 'GOERGE', 67, '4067387', '', '24921.00', '', '2022-09-26 00:18:29'),
('Pay Bill', 'QIQ8OD0WUY', '20220926102750', '18000.00', 'Tandem', '2547 ***** 578', 'MIKE', 68, '4067387', '', '42921.00', '', '2022-09-26 01:27:52'),
('Pay Bill', 'QIS1TJWY6B', '20220928154318', '13000.00', 'Tandem', '2547 ***** 084', 'RODGERS', 69, '4067387', '0', '13000.00', '', '2022-09-28 06:43:20'),
('Pay Bill', 'QIT3VX99UL', '20220929165058', '20000.00', 'Tandem', '2547 ***** 084', 'RODGERS', 70, '4067387', '', '33000.00', '', '2022-09-29 07:51:00'),
('Pay Bill', 'QJ141780R6', '20221001133112', '20000.00', 'sSwzlkmY4HR', '2547 ***** 788', 'YVONNE', 71, '4067387', '', '53000.00', '', '2022-10-01 04:31:14'),
('Pay Bill', 'QJ519YZQT3', '20221005095048', '23000.00', 'Tandem ', '2547 ***** 304', 'mercy', 72, '4067387', '', '76000.00', '', '2022-10-05 00:50:54'),
('Pay Bill', 'QJ53BWRQG1', '20221005225149', '23000.00', 'Tandem', '2547 ***** 110', 'PURITY', 73, '4067387', '0', '99000.00', '', '2022-10-05 13:51:51'),
('Pay Bill', 'QJ75ET7QMH', '20221007102824', '12500.00', 'Tandem', '2547 ***** 900', 'SIBBHA', 74, '4067387', '', '12500.00', '', '2022-10-07 01:28:25'),
('Pay Bill', 'QJA1LZTPQ5', '20221010130823', '12500.00', 'TANDEM BONANZA', '2547 ***** 625', 'MARIAM', 75, '4067387', '', '25000.00', '', '2022-10-10 04:08:28'),
('Pay Bill', 'QJB5NXSCZ9', '20221011103813', '23000.00', 'Tandem', '2547 ***** 748', 'JOAN', 76, '4067387', '0', '48000.00', '', '2022-10-11 01:38:15'),
('Pay Bill', 'QJB1O7XPTN', '20221011125054', '9500.00', 'Tandem', '2547 ***** 788', 'YVONNE', 77, '4067387', '', '57500.00', '', '2022-10-11 03:50:56'),
('Pay Bill', 'QJC2R388GU', '20221012170426', '19000.00', 'Tandem', '2547 ***** 788', 'YVONNE', 78, '4067387', '', '76500.00', '', '2022-10-12 08:04:30'),
('Pay Bill', 'QJD3SF69J1', '20221013093631', '13000.00', 'Tandem Bonanza', '2547 ***** 824', 'JACKLINE', 79, '4067387', '0', '89500.00', '', '2022-10-13 00:36:32'),
('Pay Bill', 'QJE5USS0QX', '20221014095817', '5000.00', 'Sound Refund', '2547 ***** 815', 'JOSEPH', 80, '4067387', '', '94500.00', '', '2022-10-14 00:58:19'),
('Pay Bill', 'QJE7WJILST', '20221014212632', '12500.00', 'Tandem', '2547 ***** 826', 'DENNIS', 81, '4067387', '', '107000.00', '', '2022-10-14 12:26:35'),
('Pay Bill', 'QJF5XANW3J', '20221015112454', '23000.00', 'Tandem', '2547 ***** 304', 'mercy', 82, '4067387', '', '130000.00', '', '2022-10-15 02:24:55'),
('Pay Bill', 'QJH934CT51', '20221017143448', '65500.00', 'Tandem', '2547 ***** 788', 'YVONNE', 83, '4067387', '', '195500.00', '', '2022-10-17 05:34:50'),
('Pay Bill', 'QJH340CZ93', '20221017200018', '12500.00', 'Tandem', '2547 ***** 689', 'Martin', 84, '4067387', '', '208000.00', '', '2022-10-17 11:00:20'),
('Pay Bill', 'QJI74WDS0Z', '20221018111343', '10000.00', 'Tandem', '2547 ***** 105', 'WINROSE', 85, '4067387', '', '218000.00', '', '2022-10-18 02:13:46'),
('Pay Bill', 'QJJ274LPT6', '20221019113946', '10000.00', '9ZwnuqFPC7K', '2547 ***** 328', 'Nishal', 86, '4067387', '', '228000.00', '', '2022-10-19 02:39:50'),
('Pay Bill', 'QJK69FQTYS', '20221020121315', '21000.00', 'Tandem', '2547 ***** 698', 'RAJVI', 87, '4067387', '', '21000.00', '', '2022-10-20 03:13:16'),
('Pay Bill', 'QJK49IWTX8', '20221020125528', '13000.00', 'Tandem Bonanza', '2547 ***** 052', 'mary', 88, '4067387', '', '34000.00', '', '2022-10-20 03:55:29'),
('Pay Bill', 'QJK29ST17S', '20221020150409', '12500.00', 'Tandem', '2547 ***** 755', 'EVA', 89, '4067387', '0', '46500.00', '', '2022-10-20 06:04:12'),
('Pay Bill', 'QJL8BMXIV8', '20221021122423', '13000.00', 'Tandem', '2547 ***** 328', 'Nishal', 90, '4067387', '', '135500.00', '', '2022-10-21 03:24:24'),
('Pay Bill', 'QJM5DQ79JV', '20221022105846', '12500.00', 'TANDEM', '2547 ***** 826', 'DENNIS', 91, '4067387', '', '148000.00', '', '2022-10-22 01:58:47'),
('Pay Bill', 'QJM0E15EEW', '20221022131836', '12500.00', 'Tandem', '2547 ***** 900', 'SIBBHA', 92, '4067387', '', '160500.00', '', '2022-10-22 04:18:38'),
('Pay Bill', 'QJO9IT94NV', '20221024170046', '1250.00', 'Camping', '2547 ***** 950', 'GETRUDE JENNIFER', 93, '4067387', '0', '161750.00', '', '2022-10-24 08:00:51'),
('Pay Bill', 'QJP0KXL3XK', '20221025162149', '20000.00', 'TANDEM', '2547 ***** 830', 'JACKLINE', 94, '4067387', '', '181750.00', '', '2022-10-25 07:21:54'),
('Pay Bill', 'QJQ3MFPK97', '20221026102821', '23000.00', 'Tandem', '2547 ***** 084', 'RODGERS', 95, '4067387', '0', '204750.00', '', '2022-10-26 01:28:24'),
('Pay Bill', 'QJQ0O32HDG', '20221026212520', '10000.00', 'HQKy7C4VGOM', '2547 ***** 544', 'SIMON', 96, '4067387', '', '10000.00', '', '2022-10-26 12:25:22'),
('Pay Bill', 'QJR7OVKYBH', '20221027115101', '10000.00', 'gybU251n8qT', '2547 ***** 765', 'BARBARA', 97, '4067387', '', '20000.00', '', '2022-10-27 02:51:03'),
('Pay Bill', 'QJT5U6WE8Z', '20221029162106', '10500.00', 'Tandem', '2547 ***** 625', 'MARIAM', 98, '4067387', '', '30500.00', '', '2022-10-29 07:21:08'),
('Pay Bill', 'QJT1U746TZ', '20221029162321', '12500.00', 'Tandem', '2547 ***** 689', 'Martin', 99, '4067387', '', '43000.00', '', '2022-10-29 07:23:26'),
('Pay Bill', 'QJT0V0CMO6', '20221029204434', '10000.00', 'Tandem Bonanza ', '2547 ***** 052', 'mary', 100, '4067387', '', '53000.00', '', '2022-10-29 11:44:36'),
('Pay Bill', 'QJU2VPBWEY', '20221030102550', '63000.00', 'Tandem', '2547 ***** 048', 'caroline', 101, '4067387', '', '116000.00', '', '2022-10-30 01:25:53'),
('Pay Bill', 'QJV9YKOB7D', '20221031154922', '34500.00', 'Tandem', '2547 ***** 426', 'NAOMI', 102, '4067387', '0', '150500.00', '', '2022-10-31 06:49:24'),
('Pay Bill', 'QJV3YNWT4L', '20221031162805', '13000.00', 'tandem', '2547 ***** 326', 'MAUREEN', 103, '4067387', '0', '163500.00', '', '2022-10-31 07:28:10'),
('Pay Bill', 'QK141H9VJC', '20221101122243', '12500.00', 'Tandem', '2547 ***** 954', 'KENNETH', 104, '4067387', '', '176000.00', '', '2022-11-01 03:22:44'),
('Pay Bill', 'QK151ZOAHN', '20221101160804', '23000.00', 'Tandem', '2547 ***** 091', 'FREIDA', 105, '4067387', '', '199000.00', '', '2022-11-01 07:08:05'),
('Pay Bill', 'QK53BF1FZL', '20221105135118', '23000.00', 'Tandem', '2547 ***** 091', 'FREIDA', 106, '4067387', '', '23000.00', '', '2022-11-05 04:51:20'),
('Pay Bill', 'QK76FIHJ4S', '20221107091330', '11500.00', 'Tandem', '2547 ***** 380', 'MEET', 107, '4067387', '', '34500.00', '', '2022-11-06 23:13:32'),
('Pay Bill', 'QKD7URAR3F', '20221113165412', '10500.00', 'tandem', '2541 ***** 433', 'DAISY', 108, '4067387', '0', '45000.00', '', '2022-11-13 06:54:14'),
('Pay Bill', 'QKG01M81VW', '20221116100238', '18000.00', 'Tandem', '2547 ***** 992', 'FESTUS', 109, '4067387', '', '63000.00', '', '2022-11-16 00:02:45'),
('Pay Bill', 'QKI46BVCZO', '20221118113816', '750.00', 'Picnic', '2547 ***** 244', 'GEORGE', 110, '4067387', '', '750.00', '', '2022-11-18 01:38:21'),
('Pay Bill', 'QKP1MK037T', '20221125123839', '10000.00', 'oTaEVUG1sM3', '2547 ***** 031', 'ABIGAL', 111, '4067387', '', '10750.00', '', '2022-11-25 02:38:41'),
('Pay Bill', 'QKP8MNZOQS', '20221125132438', '12500.00', 'Tandem', '2547 ***** 012', 'EVELYNE', 112, '4067387', '0', '23250.00', '', '2022-11-25 03:24:39'),
('Pay Bill', 'QKQ4OYKDBC', '20221126120733', '15500.00', 'tandem', '2547 ***** 426', 'NAOMI', 113, '4067387', '0', '38750.00', '', '2022-11-26 02:07:37'),
('Pay Bill', 'QKQ6P7IFCE', '20221126135319', '12500.00', 'Tandem', '2547 ***** 954', 'KENNETH', 114, '4067387', '', '51250.00', '', '2022-11-26 03:53:21'),
('Pay Bill', 'QKS7T240DJ', '20221128083038', '25000.00', 'Tandem', '2547 ***** 084', 'RODGERS', 115, '4067387', '', '76250.00', '', '2022-11-27 22:30:43'),
('Pay Bill', 'QKS3TGTY1T', '20221128115134', '10000.00', 'l2NzFCpurVj', '2547 ***** 388', 'ERICA', 116, '4067387', '', '86250.00', '', '2022-11-28 01:51:36'),
('Pay Bill', 'QKS1U2TLCR', '20221128161655', '11500.00', 'Tandem', '2547 ***** 051', 'ANGELA', 117, '4067387', '', '97750.00', '', '2022-11-28 06:16:57'),
('Pay Bill', 'QKT6W4L7VG', '20221129141224', '11500.00', 'Tandem', '2547 ***** 410', 'HARRISON', 118, '4067387', '', '11500.00', '', '2022-11-29 04:12:27'),
('Pay Bill', 'QL121JK66U', '20221201083740', '11500.00', 'Tandem', '2547 ***** 904', 'GERALDINE', 119, '4067387', '', '23000.00', '', '2022-11-30 22:37:41'),
('Pay Bill', 'QL1841EASQ', '20221201220238', '11500.00', 'Tandem', '2547 ***** 904', 'GERALDINE', 120, '4067387', '', '34500.00', '', '2022-12-01 12:02:41'),
('Pay Bill', 'QLA8V7DI1I', '20221210191900', '12500.00', 'Tandem', '2547 ***** 012', 'EVELYNE', 121, '4067387', '0', '47000.00', '', '2022-12-10 09:19:04'),
('Pay Bill', 'QLA8VMCOCW', '20221210212938', '15000.00', 'Tandem', '2547 ***** 031', 'ABIGAL', 122, '4067387', '', '62000.00', '', '2022-12-10 11:29:39'),
('Pay Bill', 'QLC4YJDZ6C', '20221212080825', '11500.00', 'Tandem', '2547 ***** 904', 'GERALDINE', 123, '4067387', '', '73500.00', '', '2022-12-11 22:08:29'),
('Pay Bill', 'QLC6ZW70Y8', '20221212171034', '25000.00', 'tandem', '2547 ***** 261', 'Lindsey', 124, '4067387', '', '98500.00', '', '2022-12-12 07:10:35'),
('Pay Bill', 'QLC8ZWLB2W', '20221212171426', '25000.00', 'tandem', '2541 ***** 577', 'JANNIK', 125, '4067387', '', '123500.00', '', '2022-12-12 07:14:27'),
('Pay Bill', 'QLF77GWERV', '20221215080138', '10000.00', 'MAPYOxsQLRf', '2547 ***** 309', 'ROSEMARY', 126, '4067387', '', '10000.00', '', '2022-12-14 22:01:42'),
('Pay Bill', 'QLF07MSEH2', '20221215091714', '11500.00', 'Tandem', '2547 ***** 904', 'GERALDINE', 127, '4067387', '', '21500.00', '', '2022-12-14 23:17:16'),
('Pay Bill', 'QLG0B4L96E', '20221216141438', '12500.00', 'Tandem', '2547 ***** 661', 'VALLERIE', 128, '4067387', '0', '34000.00', '', '2022-12-16 04:14:41'),
('Pay Bill', 'QLH3D6ZO8H', '20221217094350', '13000.00', 'tandem ', '2547 ***** 309', 'ROSEMARY', 129, '4067387', '', '59500.00', '', '2022-12-16 23:43:52'),
('Pay Bill', 'QLH3D6ZBGR', '20221217094350', '12500.00', 'Tandem', '2547 ***** 661', 'VALLERIE', 130, '4067387', '0', '46500.00', '', '2022-12-16 23:43:53'),
('Organization To Organization Transfer', 'QLH5D905HV', '20221217100712', '33500.00', 'tandem ', '', 'NCBA  Bank M-pesa', 131, '4067387', 'DEFI MOTORS LIMITED -254726610339', '93000.00', '', '2022-12-17 00:07:14'),
('Pay Bill', 'QLH5DK7QN1', '20221217121155', '21000.00', 'Tandem ', '2547 ***** 339', 'JIMMY', 132, '4067387', '0', '114000.00', '', '2022-12-17 02:11:57'),
('Pay Bill', 'QLI6H0FT6Y', '20221218174535', '25000.00', 'Tandem', '2547 ***** 084', 'RODGERS', 133, '4067387', '', '139000.00', '', '2022-12-18 07:45:39'),
('Pay Bill', 'QLJ8JGJTXW', '20221219172056', '42000.00', 'TANDEM', '2547 ***** 949', 'JOSEPHINE', 134, '4067387', '', '181000.00', '', '2022-12-19 07:20:57'),
('Pay Bill', 'QLJ1JLWMC5', '20221219180737', '10000.00', 'Akg4JoxmOjN', '2547 ***** 760', 'Dorothy', 135, '4067387', '', '191000.00', '', '2022-12-19 08:07:38'),
('Pay Bill', 'QLJ8KEQDYG', '20221219224452', '20000.00', 'Tandem', '2547 ***** 690', 'CAROL', 136, '4067387', '', '211000.00', '', '2022-12-19 12:44:53'),
('Pay Bill', 'QLK3KYYWCB', '20221220101412', '4000.00', 'TANDEM', '2547 ***** 949', 'JOSEPHINE', 137, '4067387', '', '215000.00', '', '2022-12-20 00:14:14'),
('Pay Bill', 'QLL4NL2GK2', '20221221095324', '10000.00', 'Tandem', '2547 ***** 790', 'ERIC', 138, '4067387', '', '10000.00', '', '2022-12-20 23:53:26'),
('Pay Bill', 'QLN8UHTD2C', '20221223181822', '25000.00', 'TANDEM', '2547 ***** 518', 'CONCILIA', 139, '4067387', '0', '35000.00', '', '2022-12-23 08:18:26'),
('Pay Bill', 'QLO3VWL6AN', '20221224094812', '15000.00', 'TANDEM', '2547 ***** 760', 'Dorothy', 140, '4067387', '', '50000.00', '', '2022-12-23 23:48:14'),
('Pay Bill', 'QLO1VWYOJL', '20221224095156', '13000.00', 'Tandem', '2547 ***** 790', 'ERIC', 141, '4067387', '', '63000.00', '', '2022-12-23 23:51:59'),
('Pay Bill', 'QLO6W1817M', '20221224103528', '20000.00', '0CL7chKJm6i', '2547 ***** 162', 'MERCY', 142, '4067387', '', '83000.00', '', '2022-12-24 00:35:30'),
('Pay Bill', 'QLS86F10QK', '20221228094813', '2500.00', 'IPZIsRCtA2y', '2541 ***** 811', 'RALF', 143, '4067387', '0', '85500.00', '', '2022-12-27 23:48:15'),
('Pay Bill', 'QLS36F3QFX', '20221228094907', '10000.00', '7iHOP1KAryQ', '2541 ***** 811', 'RALF', 144, '4067387', '0', '95500.00', '', '2022-12-27 23:49:09'),
('Pay Bill', 'QLS16F658V', '20221228094950', '3000.00', 'ifCDTasFSLo', '2541 ***** 811', 'RALF', 145, '4067387', '0', '98500.00', '', '2022-12-27 23:49:56'),
('Pay Bill', 'QLT79TVIKF', '20221229170832', '21000.00', 'Tandem', '2547 ***** 241', 'Arturs', 146, '4067387', '0', '119500.00', '', '2022-12-29 07:08:37'),
('Pay Bill', 'QLT0AEEJ3A', '20221229201117', '12500.00', 'Tandem', '2547 ***** 628', 'TRUPHENA', 147, '4067387', '', '132000.00', '', '2022-12-29 10:11:18'),
('Pay Bill', 'QLU0B2WMXU', '20221230090442', '21000.00', 'tandem', '2547 ***** 241', 'Arturs', 148, '4067387', '0', '153000.00', '', '2022-12-29 23:04:44'),
('Pay Bill', 'QLU0B33IV4', '20221230090705', '12500.00', 'Tandem', '2547 ***** 628', 'TRUPHENA', 149, '4067387', '', '165500.00', '', '2022-12-29 23:07:07'),
('Pay Bill', 'RA75UL82OF', '20230107083447', '30000.00', 'tandem', '2547 ***** 669', 'BARTHELEMY', 150, '4067387', '0', '30000.00', '', '2023-01-06 22:34:49'),
('Pay Bill', 'RA74UM1MZO', '20230107084607', '15000.00', 'Tandem', '2541 ***** 811', 'RALF', 151, '4067387', '0', '45000.00', '', '2023-01-06 22:46:11'),
('Pay Bill', 'RA82WY4XJK', '20230108063609', '69000.00', 'TANDEM', '2547 ***** 822', 'NIMROD', 152, '4067387', '', '114000.00', '', '2023-01-07 20:36:11'),
('Pay Bill', 'RA9712TM4J', '20230109135440', '42000.00', 'Tandem', '2547 ***** 084', 'RODGERS', 153, '4067387', '0', '42000.00', '', '2023-01-09 03:54:41'),
('Pay Bill', 'RA9219Z8G8', '20230109151521', '21000.00', 'Tandem', '2547 ***** 084', 'RODGERS', 154, '4067387', '', '63000.00', '', '2023-01-09 05:15:22'),
('Pay Bill', 'RAE3D98EUT', '20230114125714', '10000.00', 'ivhVS1BkA0R', '2547 ***** 811', 'MARTIN', 155, '4067387', '', '73000.00', '', '2023-01-14 02:57:15'),
('Pay Bill', 'RAN9ZZXOY3', '20230123153158', '16000.00', 'TANDEM', '2547 ***** 811', 'MARTIN', 156, '4067387', '0', '16000.00', '', '2023-01-23 05:32:02'),
('Pay Bill', 'RAO42OLU9S', '20230124093530', '30000.00', 'tGg0wKQYa4P', '2547 ***** 426', 'KRISTEL', 157, '4067387', '', '46000.00', '', '2023-01-23 23:35:31'),
('Pay Bill', 'RAR2A6DY4K', '20230127083950', '10000.00', 'I9AXnR41erF', '2547 ***** 404', 'FANNY', 158, '4067387', '', '56000.00', '', '2023-01-26 22:39:52'),
('Pay Bill', 'RAT0F552AI', '20230129065002', '3000.00', 'TANDEM', '2547 ***** 811', 'MARTIN', 159, '4067387', '', '59000.00', '', '2023-01-28 20:50:07'),
('Pay Bill', 'RAU0IXKRHK', '20230130172619', '57000.00', 'Tandem', '2547 ***** 302', 'YUNIS', 160, '4067387', '0', '116000.00', '', '2023-01-30 07:26:24'),
('Pay Bill', 'RAU2IXMUCW', '20230130172655', '10000.00', 'Transport ', '2547 ***** 302', 'YUNIS', 161, '4067387', '0', '126000.00', '', '2023-01-30 07:27:00'),
('Pay Bill', 'RAV0KB8EVG', '20230131092340', '10000.00', 'lfCx1sF6wOc', '2547 ***** 830', 'YVETTE', 162, '4067387', '', '136000.00', '', '2023-01-30 23:23:43'),
('Pay Bill', 'RB45VJUOBP', '20230204132944', '36000.00', 'Tandem Kristel Juril', '2547 ***** 426', 'KRISTEL', 163, '4067387', '', '36000.00', '', '2023-02-04 03:29:46'),
('Pay Bill', 'RB773UNAFB', '20230207091617', '20000.00', 'tGqFJAu9sQe', '2547 ***** 505', 'JEREMIAH', 164, '4067387', '', '56000.00', '', '2023-02-06 23:16:19'),
('Organization To Organization Transfer', 'RB764DEQ2C', '20230207124039', '3000.00', 'AyO1swlQGqJ', '2547 ***** 998', 'I&M BANK LTD - BANK TO TILL', 165, '4067387', 'LILLIAN WANJA KARIUKI', '59000.00', '', '2023-02-07 02:40:41'),
('Organization To Organization Transfer', 'RB734DJM8R', '20230207124208', '20000.00', '8gUhkvHtGVW', '2547 ***** 998', 'I&M BANK LTD - BANK TO TILL', 166, '4067387', 'LILLIAN WANJA KARIUKI', '79000.00', '', '2023-02-07 02:42:09'),
('Organization To Organization Transfer', 'RB714DZ5SB', '20230207124638', '2500.00', '8gUhkvHtGVW', '2547 ***** 998', 'I&M BANK LTD - BANK TO TILL', 167, '4067387', 'LILLIAN WANJA KARIUKI', '81500.00', '', '2023-02-07 02:46:42'),
('Pay Bill', 'RB744EIQ02', '20230207125209', '65004.00', 'Tandem - Omar Group', '2547 ***** 949', 'JOSEPHINE', 168, '4067387', '', '146504.00', '', '2023-02-07 02:52:13'),
('Pay Bill', 'RB784F5NTC', '20230207125842', '13000.00', 'Tandem - Fanny', '2547 ***** 949', 'JOSEPHINE', 169, '4067387', '', '159504.00', '', '2023-02-07 02:58:46'),
('Pay Bill', 'RB744FBTM8', '20230207130020', '16000.00', 'Tandem - Mitchelle ', '2547 ***** 949', 'JOSEPHINE', 170, '4067387', '', '175504.00', '', '2023-02-07 03:00:23'),
('Pay Bill', 'RB876AIJ3L', '20230208071918', '23000.00', 'CjSzTAtw0nZ', '2547 ***** 061', 'BERYL', 171, '4067387', '', '198504.00', '', '2023-02-07 21:19:21'),
('Pay Bill', 'RB877EUX5X', '20230208152029', '57000.00', 'Tandem -Nimrod Maina', '2547 ***** 949', 'JOSEPHINE', 172, '4067387', '', '57000.00', '', '2023-02-08 05:20:31'),
('Pay Bill', 'RBB1F170QR', '20230211125538', '10000.00', 'NBFwaxPS9Xb', '2547 ***** 099', 'Micah', 173, '4067387', '0', '67000.00', '', '2023-02-11 02:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_no` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bid` varchar(255) NOT NULL,
  `btable` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `id_no`, `email`, `bid`, `btable`, `date_created`) VALUES
(1, 'test', '123456', 'dummye72@gmail.com', 'GZaJCHPzrV3', 'booking', '2022-08-22 12:40:26'),
(2, 'test1', '123456', 'patrickayub5@gmail.com', 'GZaJCHPzrV3', 'booking', '2022-08-22 12:40:26'),
(3, 'John Ndungu', '341322789', 'ndungu.murimi@gmail.com', '7rFvtzPudBI', 'booking', '2022-08-23 01:26:29'),
(4, 'Leroy Kimutai', '30315332', 'kimutaileroy@gmail.com', 's7YhfZWXbxe', 'booking', '2022-09-11 12:56:25'),
(5, 'Kuziva Paradzai', 'dn486531', 'kuzivaparadzai@gmail.com', 'zDt2HyLRo4e', 'booking', '2022-09-12 02:49:52'),
(6, 'Wendy Banja', '28147558', 'webanja@gmail.com', 'UyGtQr18oNg', 'booking', '2022-09-16 06:43:53'),
(7, 'Anne ngumbi', '27791541', 'ostrich@bonfireadventures.com', 'KtoWpXm5EYb', 'booking', '2022-09-17 00:38:58'),
(8, 'Avellino', '123123123', 'patrickayub5@gmail.com', 'fC2nQRogrK3', 'booking', '2022-09-23 11:25:25'),
(9, 'Kvaradona', '321321321', 'santojuliototsan@gmail.com', 'fC2nQRogrK3', 'booking', '2022-09-23 11:25:25'),
(10, 'Avellino', '123', 'patrickayub5@gmail.com', 'HjUq1oOYIVQ', 'booking', '2022-09-23 12:35:25'),
(11, 'Kvara', '321', 'santojuliototsan@gmail.com', 'HjUq1oOYIVQ', 'booking', '2022-09-23 12:35:25'),
(12, 'George Mwangi', '27802656', 'gexxmwangi@gmail.com', 'Y34hlbpgaNP', 'booking', '2022-09-26 00:18:14'),
(13, 'Edward Mweu', '', 'anakinadventures@gmail.com', 'sSwzlkmY4HR', 'booking', '2022-10-01 04:28:33'),
(14, 'Daniel Gichuru', '', 'anakinadventures@gmail.com', 'dbXTfG0O16m', 'booking', '2022-10-01 04:36:52'),
(15, 'Chris Kimanga', '', 'anakinadventures@gmail.com', 'dbXTfG0O16m', 'booking', '2022-10-01 04:36:52'),
(16, 'Maggie Wambui', '', 'anakinadventures@gmail.com', 'dbXTfG0O16m', 'booking', '2022-10-01 04:36:52'),
(17, 'Mary Muriithi ', '31503634 ', 'wanguimuriithi39@gmail.com ', 'xY2NQwSZBgh', 'booking', '2022-10-04 00:52:25'),
(18, 'Purity murungi', '31236429', 'Puritykmurungi@gmail.com', 'Q3SAiEMZlsF', 'booking', '2022-10-05 02:55:14'),
(19, 'Jim Chapman', '', 'Jim.chapman1@outlook.com', 'wOBLCePzks6', 'booking', '2022-12-12 22:56:59'),
(20, 'Wambui Wairua', '25984398', 'wairuawambui@gmail.com', '0CL7chKJm6i', 'booking', '2022-12-24 00:23:40'),
(21, 'Leonard Macua', '37955136', 'Macualeonard@gmail.com', 'qoWANXapyKQ', 'booking', '2023-01-02 23:46:00'),
(22, 'Joseph Mwangi', '', '', 'qoWANXapyKQ', 'booking', '2023-01-02 23:46:00'),
(23, 'Lee Thairu', '', '', 'qoWANXapyKQ', 'booking', '2023-01-02 23:46:00'),
(24, 'Kristel Juriloo', '34218339', 'kristel.juriloo@gmail.com', 'tGg0wKQYa4P', 'booking', '2023-01-23 23:34:12'),
(25, 'Kristine Hansen', '210409151', 'kristinesorgenfrihansen@gmail.com', 'tGg0wKQYa4P', 'booking', '2023-01-23 23:34:12'),
(26, 'Jeremiah Dindi', '28672684', 'jerrydindi@gmail.com', 'tGqFJAu9sQe', 'booking', '2023-02-06 23:10:48'),
(27, 'Lilly', 'AK0229461', 'kariuki.lillian@gmail.com', '8gUhkvHtGVW', 'booking', '2023-02-07 02:32:40');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `old_price` int(11) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `stocked` enum('yes','no') NOT NULL DEFAULT 'yes',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `short_description`, `description`, `price`, `old_price`, `poster`, `banner`, `tags`, `stocked`, `status`, `date_created`) VALUES
('0dL3jGDQzqS', 'Mawingu T', NULL, '100% Cotton round neck Tshirt with sleave print of paraglider\r\nColours: Dark Blue, Safari Green, Black\r\nSize: S, M, L, XL', 1500, 0, 'img6opw22113111423120220907amwdv9.jpeg', NULL, '', 'yes', 'active', '2022-07-04 09:05:35'),
('6m2FrG5XiLs', 'Mawingu Cap', NULL, 'Cool Cap in Unisize\r\nColours: Black, Safari Green, Blue', 800, 0, 'imgoag122113111423120224007amy13l.jpeg', 'imgy3in22113111483120224107amqza5.jpeg', 'none', 'yes', 'active', '2022-07-04 09:04:49'),
('8zGiqUYAVcm', 'Mawingu Mug', NULL, 'Great mug to show off your last weekend&#039;s adventure at the office!\r\nColours: White and Black', 600, 700, 'imgn3w922113111473120223507amk2yg.jpeg', NULL, 'none', 'yes', 'active', '2022-07-04 09:01:18'),
('bcw2gqizo74', 'MCK Water Bottle 1ltr', NULL, 'Great rugged Alu water bottle for all your outdoor adventures!', 1000, 1200, 'imgsgfo22091609481620225509amem75.jpg', NULL, '', 'yes', 'active', '2022-09-16 00:48:55'),
('ijIRpbMBZ0v', 'Hoodie', NULL, 'For a cold day, or some warmth on your outdoor experience, this 100% hoodie will make you feel snuggled up!\r\nColours: Black, Safari Green, Dark Blue\r\nSizes: S, M, L, XL', 4500, 5000, 'imgw7q322113111463120222307amip3h.jpeg', NULL, 'none', 'yes', 'active', '2022-07-31 04:46:23');

-- --------------------------------------------------------

--
-- Table structure for table `promo_code`
--

CREATE TABLE `promo_code` (
  `id` varchar(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `off` int(11) NOT NULL,
  `promo_user` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promo_code`
--

INSERT INTO `promo_code` (`id`, `code`, `off`, `promo_user`, `date_created`, `status`) VALUES
('U43dZ5XPriF', 'KC10', 10, NULL, '2022-07-12 09:57:55', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `service_times`
--

CREATE TABLE `service_times` (
  `id` varchar(11) NOT NULL,
  `service_time` time NOT NULL,
  `service_id` varchar(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `service_times`
--

INSERT INTO `service_times` (`id`, `service_time`, `service_id`, `status`, `date_created`) VALUES
('4IXuKfN8yaU', '12:00:00', '0YDar1x3Tmc', 'active', '2023-01-30 03:46:30'),
('9LhoxMWdrse', '16:00:00', '1CFl2KrjEPy', 'active', '2022-06-15 13:37:18'),
('A6f9WL5PFiY', '08:00:00', '0YDar1x3Tmc', 'active', '2022-06-15 13:26:46'),
('fWu06mTbSqX', '08:00:00', '20azsxjigVP', 'active', '2022-06-15 13:37:29'),
('G5lcTNjnwHa', '12:00:00', '20azsxjigVP', 'active', '2022-06-15 13:37:41'),
('iLMctmflr2d', '09:00:00', '0YDar1x3Tmc', 'active', '2022-06-15 13:36:03'),
('lJ2Sd9QYH6K', '13:30:00', '1CFl2KrjEPy', 'active', '2022-06-15 13:37:07'),
('Lu8nGxjRJp2', '16:00:00', 'oLtGfbZexDu', 'active', '2022-06-15 13:36:52'),
('qthvzy1I682', '10:00:00', '0YDar1x3Tmc', 'active', '2022-06-15 13:35:49'),
('RFqbyEuUfWg', '11:00:00', '0YDar1x3Tmc', 'active', '2022-06-29 06:09:59'),
('wHJ9X7SvzCA', '14:00:00', 'oLtGfbZexDu', 'active', '2022-06-15 13:36:42');

-- --------------------------------------------------------

--
-- Table structure for table `suborders`
--

CREATE TABLE `suborders` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `message` varchar(9000) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_status` enum('paid','not_paid') NOT NULL DEFAULT 'not_paid',
  `oid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `suborders`
--

INSERT INTO `suborders` (`id`, `uid`, `pid`, `total_price`, `quantity`, `message`, `date_created`, `payment_status`, `oid`) VALUES
(1, 'bdmIuy60R17', '0dL3jGDQzqS', '1500', '1', '', '2022-08-03 03:57:13', 'paid', '1'),
(2, 'bdmIuy60R17', '6m2FrG5XiLs', '800', '1', '', '2022-08-03 03:57:13', 'paid', '1'),
(3, 'jrDsu3cWJ2H', '6m2FrG5XiLs', '800', '1', '', '2022-08-03 07:33:38', 'paid', '2'),
(4, 'GDkFKMuy3tX', '6m2FrG5XiLs', '2400', '3', '', '2022-10-05 07:21:11', 'paid', '3');

-- --------------------------------------------------------

--
-- Table structure for table `tandem`
--

CREATE TABLE `tandem` (
  `id` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(10) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `poster` varchar(100) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tandem`
--

INSERT INTO `tandem` (`id`, `name`, `description`, `price`, `discount`, `poster`, `banner`, `status`, `date_created`) VALUES
('0YDar1x3Tmc', 'Tandem Paragliding', 'To fly as a tandem passenger, no previous experience is required - you just need to bring your sense of adventure, a pair of sturdy closed shoes, a long-sleeved top and some refreshments for afterwards. You will be flown by one of our licensed tandem paragliding pilots. Our priority is to be safe, to have fun, and help you create some beautiful flying memories. We&#039;ve flown hundreds of tandems and would love for you to experience the exhilaration of having a bird&#039;s eye-view of nature.', 20000, 0, 'img8hbr2208308410320221908amdvku.jpg', 'imgv9ma2208308410320221908am8ghp.jpeg', 'active', '2022-06-14 16:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` varchar(50) NOT NULL,
  `event_id` varchar(50) NOT NULL,
  `ticket_type` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `expiry` date DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `event_id`, `ticket_type`, `quantity`, `amount`, `expiry`, `status`, `date_created`) VALUES
('0G6mJtgWDe9', '6N5HK9tIS7l', 'Accommodation (full board) + Transport + Tandem Pa', 63, 25000, '2022-09-03', 'active', '2022-08-24 00:43:55'),
('1QM5azlAcXP', 'UzMvrShxyWs', 'Tandem Paragliding + Accommodation (full board) + ', 15, 25000, '2022-10-28', 'active', '2022-10-09 11:17:34'),
('Bpq1VutYgie', '6N5HK9tIS7l', 'Self Camp', 50, 1500, '2022-09-03', 'active', '2022-08-24 00:44:43'),
('GI3zuMJA9dX', '6N5HK9tIS7l', 'Flash Sale', 3, 3333, '2022-08-27', 'inactive', '2022-08-19 01:57:41'),
('yhUNTkotWeM', '6N5HK9tIS7l', 'Advanced Tickets', 100, 2500, '2022-09-02', 'active', '2022-08-18 08:51:46'),
('ysilJ62EXDC', '6N5HK9tIS7l', 'Accommodation (full board) + Transport', 60, 10000, '2022-09-03', 'active', '2022-08-24 00:43:02'),
('zdtjkV0nZTu', '6N5HK9tIS7l', 'Camping and Ticket', 50, 5000, '2022-09-01', 'inactive', '2022-08-18 08:55:07');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `id_number` varchar(30) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone_number`, `id_number`, `status`, `date_created`) VALUES
('0aiT5KeUF78', 'Stephen', 'smwega@gmail.com', 'db9c25df9abe7185a87873ced83c7032', '0710166054', '27470718', 'active', '2022-10-11 13:30:12'),
('0NlLX9RPAEZ', 'Francis Lameck Kieti', 'francislameck01@gmail.com', 'a64a06455f326d97e3c7596cc07932c8', '0797722576', '38962253', 'active', '2022-08-12 09:33:55'),
('1CHpk4g3sUN', 'Tutu Maina', 'tutumaina55@gmail.com', '234d04e0f4e6dae5ce63fc9ee342169b', '0702828958', '31588362', 'active', '2022-08-14 13:23:25'),
('2ZQgPfqEcMn', 'Martha Kariuki', 'mj.wangarik@gmail.com', 'b940bbcc9250e4dba78cc03c5f10029c', '0727036911', '25958723', 'active', '2023-02-11 10:04:55'),
('37A8s9KbBpX', 'James', 'james.mbiyu@gmail.com', '6e037a9e17619a82fc66d63b7e6adbdd', '0702191508', '22175471', 'active', '2022-10-19 04:18:58'),
('3X7QV5NDybv', 'Pauline', 'mainapauline21@gmail.com', '5b3dbb5a771387c7dda9d053e0654e02', '0713612197', '33155245', 'active', '2022-09-19 03:54:53'),
('4caGouKUWVi', 'Anakin Adventures Ltd', 'anakinadventures@gmail.com', 'a180b2afe172faf198e518f9286214fc', '+254741844049', '29454382', 'active', '2022-10-01 04:25:25'),
('5OTK9Ln7R0I', 'Tariq Mehri', 'tariqmehri@yahoo.co.uk', '112b93378e6c26e648cc8636741ae909', '+254114537507', '21899022', 'active', '2022-08-17 02:49:06'),
('5v740eDaptc', 'Hadia', 'hadiaahmed143@gmail.com', '1193e63693ec1cfb7fd8b8765627fa58', '0724850919', '36723330', 'active', '2022-10-26 09:19:34'),
('6NZLCqyocU7', 'Jessicah Njeru', 'njeru605@gmail.com', '0c5c5ce8d67bd1576033c41aa7914fbc', '0711463073', '30103461', 'active', '2023-02-11 07:11:36'),
('814JCiGgvt3', 'Kuziva Paradzai', 'kuzivaparadzai@gmail.com', '4c0eeb9153c1fd28196e80b0cc9453fc', '0798637709', 'dn486531', 'active', '2022-09-12 02:42:57'),
('9tSKB1ouxq4', 'Nyawira Gitari', 'nyawirankinga@gmail.com', '7b3337b578669382c46038120130b80d', '+254700523031', '28605094', 'active', '2022-11-25 02:37:51'),
('AN20UdIBJ4l', 'Moses Mwole Mukiza', 'momwole@gmail.com', '45237611026d0d784afe13b22bbe5837', '+254722762193', '23602953', 'active', '2022-10-19 14:40:44'),
('bdmIuy60R17', 'Patrick Manyara', 'pmanyara97@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '070007877', '1134500', 'active', '2022-06-27 05:55:38'),
('BxrRYISXlmj', 'George Mwangi', 'gexxmwangi@gmail.com', 'd0921e383f717d9e979abbc874305500', '0729844064', '27802656', 'active', '2022-09-26 00:16:35'),
('C7lU02q6WpL', 'Juliette Keeley', 'juliettekeeley@gmail.com', '5dcc69d5129618fdeb720f437fec1f71', '0742640976', '0742640976', 'active', '2022-08-22 01:56:56'),
('c8Wv5DLBxlY', 'Rihards', 'rstruka@gmail.com', '1cf15b66a4b89150bff236d6e6a9fc1f', '+254111374034', 'lv591603', 'active', '2022-09-08 02:52:38'),
('F5bOpHzK3wh', 'jiohn', 'johnnygachoki@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0715164966', NULL, 'active', '2022-06-15 10:14:27'),
('fDUldGJNREm', 'Charlie Hofmann', 'charlie.hofmann@hotmail.fr', '4c1925112b4a54ae6630686b65a542b1', '+41788937742', 'X4963211', 'active', '2023-01-03 17:51:21'),
('Fl9uDHhILxd', 'Job', 'jobayub254@protonmail.com', 'a85e6db37918bda0032d5962731fa848', '0710602695', '0710602695', 'active', '2022-08-15 07:37:56'),
('FqK1ZxrdSPh', 'Simon', 'gichsimon@gmail.com', 'b2c2608c32f25287e043f6eae50a2c2e', '+254726577544', '29284156', 'active', '2022-10-26 12:18:39'),
('FuR4QtDACqo', 'Vivianne', 'vivianne.dwalo@gmail.com', 'c59032940b501ebe059985bd42bd80ac', '0708770005', '37488103', 'active', '2022-08-13 05:39:24'),
('GDkFKMuy3tX', 'John', 'ndungu.murimi@gmail.com', '4bba7af483f631758c1e5d20f6877128', '07135648523', '232222', 'active', '2022-08-08 04:48:48'),
('GHKXSYgrZQv', 'Mary Muriithi', 'wanguimuriithi39@gmail.com', '212f5fade224c9262a1aa30c69b65bff', '0746251556', '31503634', 'active', '2022-10-04 00:50:32'),
('gV8csXFA7wT', 'Lilly B', 'kariuki.lillian@gmail.com', '6374d2a0568af6e90f194daa115e12e3', '+254731441998', 'AK0229461', 'active', '2023-02-07 02:18:46'),
('He089lmwnKr', 'Meet', 'Pancholi.meet@gmail.com', 'd23013249fe50f6cb9a17620bfb1044c', '0737600380', '33495210', 'active', '2022-11-04 14:10:38'),
('HGBkq6CwgZL', 'Jim Chapman', 'jim.chapman1@outlook.com', '3508e810fb47b613152bb52ed3f4e44a', '0792606919', '0792606919', 'active', '2022-11-16 01:16:49'),
('hkwKjgve2ZF', 'Josh Jones', 'admin@virtue.com', '827ccb0eea8a706c4c34a16891f84e7b', '0723487877', NULL, 'active', '2022-06-14 06:43:28'),
('hKZCudAOzjx', 'Linda Gitau', 'gitaulinda32@gmail.com', 'e3549bd040ae11a9b7d147fa89cbfa6f', '070562I872', '28491896', 'active', '2022-10-13 16:10:42'),
('i21VYKBkHOr', 'Eric Riitho', 'erwakahia@yahoo.com', '70f8a8514eab2511fb6aef7bb422806b', '0733804180', '14417786', 'active', '2022-12-20 07:32:47'),
('Ibpl6vdAcwW', 'Nishal Sodha', 'nishal.sodha@gmail.com', '8c279edec8421d6056728bb036051901', '0732456225', '13789708', 'active', '2022-10-19 02:37:34'),
('j3tK6mzOr0X', 'Ralf Heidrich', 'ralf.heidrich2@gmail.com', '3f00198150d732e7fd832b4ca7aaae3c', '+254110010811', 'CGVL88R5C', 'active', '2022-12-27 23:29:48'),
('Jj1FiZxH2KQ', 'FANNY WAWIRA', 'fannywawira@gmail.com', 'c5cf888e0c4c7caf0eba0de84f9f654c', '0711100404', '31659577', 'active', '2023-01-26 22:36:00'),
('jrDsu3cWJ2H', 'Ndungu', 'john.ndungu@vesencomputing.com', '4bba7af483f631758c1e5d20f6877128', '0713564852', '34132269', 'active', '2022-08-03 01:40:59'),
('Jtnu36MyA4H', 'Gikonyo', 'gikonyo.alex@gmail.com', '692d32903072fa2eee535ed4fc2e5429', '0723351851', '24629151', 'active', '2022-10-06 06:39:32'),
('KIFgO4x5Qbk', 'Diana Nyaga', 'diananyaga@gmail.com', 'a6cec4af9f48c0a2cbf96a6b3a861209', '0724121577', '24730679', 'active', '2022-09-02 13:52:19'),
('KntAW3Qmpfx', 'Mitchelle', 'mitchelleyve@yahoo.com', 'c8e68ad0b3310d03a9d26bef7296644a', '+254714632830', '', 'active', '2023-01-30 11:44:04'),
('KOaAUTpfgDX', 'Dorothy Mbayagi', 'mbayagid@gmail.com', 'd210decd61340150b901da00706403c8', '0740482769', '0740482769', 'active', '2022-12-19 07:51:25'),
('ksJCYurWUdP', 'John Ndungu', 'esokonik@gmail.com', '4bba7af483f631758c1e5d20f6877128', '0713564851', '34122222', 'active', '2022-08-22 14:49:39'),
('LbPkKuMWfog', 'Jeremiah Dindi', 'jerrydindi@gmail.com', '6d4187cc3ae4cc808435b76c198aded8', '0727399505', '28672684', 'active', '2023-02-06 23:09:13'),
('MI9p6ehJrvy', 'JUDY', 'cibymartin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0737683079', '', 'active', '2022-08-23 06:35:02'),
('NFDHYQkO32E', 'VEIT', 'skyremyservices@gmail.com', '1675c83156277cdf62cbaf43638ccfdc', '', '0704913791', 'active', '2022-09-16 00:57:04'),
('NpOFdb7g0Jm', 'Rosemary', 'misrosemary@gmail.com', '3d9ce5a6b265162e8e2004ce81309159', '0741769309', '21410629', 'active', '2022-12-14 21:59:45'),
('nTE4fDFxdcJ', 'Judy', 'cibycymonmartin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0712833383', '', 'active', '2022-08-22 06:24:34'),
('Nv3XjD7wgGC', 'Ozima Bright', 'o_allbright@yahoo.com', 'b3ae490c67de7f612a8045641f068829', '0708744393', 'A11271076', 'active', '2022-08-29 04:43:01'),
('NybfLmDIOtK', 'Dennis Munene', 'chiefscript@gmail.com', 'b90d8a027a274f3e0c6a6f8ee9e9073e', '254712596826', '', 'active', '2022-10-14 05:26:03'),
('OcRlbSigNza', 'Kridtel Juriloo', 'kristel.juriloo@gmail.com', '00717f2498c87a2d93cc6526fdbe144d', '+254 794 736426', '+254 794 736426', 'active', '2023-01-22 05:17:57'),
('OPa1IB4TyLq', 'Rodgers', 'rdotmawala22@gmail.com', 'b906ef531c9941ce9bf4c5e6607af044', '0725959084', '33206929', 'active', '2022-08-09 04:39:34'),
('oudPACkbimN', 'Leonard Macua', 'macualeonard@gmail.com', '4690c287095b6bc2ca85aeca2f608918', '0703541721', '37955136', 'active', '2023-01-02 23:43:55'),
('pB0XydKk7AC', 'Mbithe Mbatha', 'mbithembatha@icloud.com', 'a07e5c3e98ee2f0388866e76594596d1', '0716441687', '33238526', 'active', '2022-11-29 02:44:00'),
('PELfIMAnSlo', 'Sylvia zighe Wafula', 'swafula@gmail.com', 'b5ea4fdfe8fb59b49d6facf604c50b70', '739800250', '27114558', 'active', '2022-08-15 06:07:57'),
('pFLP9AEkBv3', 'John Ndungu', 'vesendummy@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '+254713564851', NULL, 'active', '2022-06-16 06:27:39'),
('PNIQbYLal2c', 'Nthenya', 'eve.nthenya90@gmail.com', '502b50e3e15c0a2eaddc75b4fcf4ba8b', '0715612012', '28018702', 'active', '2022-11-25 02:46:18'),
('q8hLXtbmJ0U', 'Rajesh Prasad yadav', 'rajeshpy@gmail.com', '5d332ce5fb5802bc9cf0139a3a2b65d8', '0735041450', '790776', 'active', '2022-09-17 08:53:31'),
('QEX61jHpVqN', 'Purity murungi', 'puritykmurungi@gmail.com', 'ea493728282908648c0bc91876d02f67', '0714914110', '31236429', 'active', '2022-10-05 02:53:07'),
('qgo8tIXlYkf', 'Micah', 'micahkibera@gmail.com', 'f192cd31aef7a58ff2c9a6f4fc19cca6', '0746666099', '29306099', 'active', '2023-02-11 02:40:40'),
('QYOpmZtX7Mb', 'Ellina', 'ellina.kabiru@gmail.com', 'd12fd6c38870fbfb6bf14ecebafde00e', '0720 426462', '23583616', 'active', '2023-02-11 06:51:05'),
('rUaupWNQMqc', 'Barbara Delahayes', 'barbaradelahayes@gmail.com', '0a4447af6eb23454c6ed4c4fcba03acb', '+254711913765', '+33676208459', 'active', '2022-10-27 02:48:56'),
('RvWCHNP4U8x', 'Michael', 'michael1998march@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0702710739', '36151789', 'active', '2022-08-18 05:05:32'),
('So8OwJuQzaN', 'Anyiti', 'walubengoberyl@gmail.com', 'de9f705f37e86a2df9c48c5046c604d0', '0712327061', '29500534', 'active', '2023-02-07 21:06:20'),
('T4ZAWactz6l', 'Erica Gathoni', 'gkikunze@gmail.com', '5d9f7c9f9640ae6de16a50f74cc5c010', '0748018388', '35525021', 'active', '2022-11-28 01:42:10'),
('TAVGXCYHqib', 'Daisy Rono', 'gmail@virtue.com', '827ccb0eea8a706c4c34a16891f84e7b', '0712345678', NULL, 'active', '2022-06-14 06:57:40'),
('tT64UIvi8k7', 'Leroy', 'kimutaileroy@gmail.com', '15ddca3b16eac7c8656d93b62bcc4b8e', '0790201464', '30315332', 'active', '2022-09-11 12:54:24'),
('VaLm3pC4JIY', 'Guillaume', 'bn_guillaume@hotmail.fr', '73d9e9075c87f808380c2dd96eb64272', '0758726612', '10169285', 'active', '2022-08-22 00:32:07'),
('vaTJZ7RIlBy', 'Romieu', 'Sromieu@hotmail.com', 'c9a3ade6619d839d68489cd60df05bc2', '0788440185', '12ah28117', 'active', '2022-09-17 11:42:35'),
('vWoea0cnuYQ', 'Eunice Waweru', 'officialkui8@gmail.com', 'c3207c5f4e53652c691eb23fbb2da4f1', '+254792421819', '+254792421819', 'active', '2022-08-22 03:36:10'),
('W0kSjdUq2Or', 'lucia mwongeli mutisya', 'ostrich@bonfireadventures.com', 'e6a5d9bf4f7febfdcd74a7299dbe0ff0', '0757333777', '27791541', 'active', '2022-09-17 00:38:11'),
('W6vluTVYSde', 'Wambui Wairua', 'wairuawambui@gmail.com', 'fe5af0f788dd953362c9b4cd90c93153', '0724026162', '25984398', 'active', '2022-12-24 00:22:20'),
('W9MgaGRkNEi', 'Selina', 'Almasibiebs8@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '0703833655', '28304832', 'active', '2022-11-13 10:44:47'),
('wZ0KdR5sIUN', '', '', '', '', NULL, 'active', '2023-01-14 05:31:21'),
('xOSqm3C67QX', 'Wendy Banja', 'webanja@gmail.com', '90a720ea3b8346e263e8deb3cc5091d2', '0729645242', '28147558', 'active', '2022-09-15 08:42:49'),
('xVcZo1GdHvi', 'Josh Jones', 'patrick.ayub@vesencomputing.com', '86ec38cbcba59fcf2f989144b83d9a30', '0712886121', '345654', 'active', '2022-08-03 02:14:45'),
('Z8wusoiMQyB', 'Martin-John Wamagatta', 'jwamagatta@gmail.com', '9865a384944bea9725a9f4be1e611605', '+254727317811', '25786959', 'active', '2023-01-13 22:33:24'),
('zADLP8wBhv3', 'Davies', 'davies.mulani@gmail.com', '496b64c6e79b95b13d20f4e7594ea1ee', '0780297650', '', 'active', '2022-12-21 04:41:39'),
('zqh5O8cN7Jv', 'Freida', 'matifreida1@gmail.com', '18e898a78958d1290b995363ae2d7158', '254702050091', '33066196', 'active', '2022-11-01 02:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `yoga`
--

CREATE TABLE `yoga` (
  `id` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(10) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `poster` varchar(100) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `yoga`
--

INSERT INTO `yoga` (`id`, `name`, `description`, `price`, `discount`, `poster`, `banner`, `status`, `date_created`) VALUES
('20azsxjigVP', 'Yoga', 'Breath in the fresh air, stretch out and relax!\r\nMawingu Camp Kijabe boasts with a unique 4x10m wooden Yoga Deck facing Mt Longonot to the west, making it an ideal location for Sunset Yoga sessions.\r\nThe Mawingu Camp Kijabe team regularly hosts yoga- camping packages over the weekend.\r\nThe deck can also be used for seating or as a performance platform for martial arts or dancing.\r\nContact us and let us know your own reason why you want to utilize this one of a kind platform!', 3000, NULL, 'imgwji522081208471220220608am64en.jpg', 'img5apt2208308430320224808ammt2x.jpg', 'active', '2022-06-14 16:55:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `biking`
--
ALTER TABLE `biking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_camping`
--
ALTER TABLE `booking_camping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `camping`
--
ALTER TABLE `camping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `counter_figures`
--
ALTER TABLE `counter_figures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_banner`
--
ALTER TABLE `email_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_content`
--
ALTER TABLE `email_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `event_booking`
--
ALTER TABLE `event_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limited_offer`
--
ALTER TABLE `limited_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_banner`
--
ALTER TABLE `main_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_images`
--
ALTER TABLE `other_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pa`
--
ALTER TABLE `pa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_code`
--
ALTER TABLE `promo_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_times`
--
ALTER TABLE `service_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suborders`
--
ALTER TABLE `suborders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tandem`
--
ALTER TABLE `tandem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `yoga`
--
ALTER TABLE `yoga`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_banner`
--
ALTER TABLE `email_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_content`
--
ALTER TABLE `email_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_booking`
--
ALTER TABLE `event_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `limited_offer`
--
ALTER TABLE `limited_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `main_banner`
--
ALTER TABLE `main_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pa`
--
ALTER TABLE `pa`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `suborders`
--
ALTER TABLE `suborders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
