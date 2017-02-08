-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2017 at 08:00 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turizm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cilent`
--

CREATE TABLE `cilent` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(70) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `addres` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cilent`
--

INSERT INTO `cilent` (`id`, `name`, `surname`, `phone`, `email`, `addres`) VALUES
(1, 'Vazirkhan', 'Tarverdiyev', 505395044, 'vezir.tarverdi@gmail.com', 'Y_A_S_A_M_A_L'),
(2, 'Xeyal', 'Yediyarov', 551234567, 'xeyal@gmail.com', 'Hovsan'),
(3, 'Cafar', 'Cabbarli', 557654321, 'cefer@gmail.com', 'Romana');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`) VALUES
(1, 'Azerbaijan'),
(2, 'Turkey'),
(3, 'England'),
(4, 'Germany');

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(70) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`id`, `name`, `surname`, `role_id`) VALUES
(1, 'Calil', 'Dadasov', 1),
(2, 'Nicat', 'Mardanli', 2),
(3, 'Sabir', 'Mammadli', 5),
(4, 'Ismayil', 'Rahimli', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pay_info`
--

CREATE TABLE `pay_info` (
  `cilent_id` int(11) DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `debt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pay_info`
--

INSERT INTO `pay_info` (`cilent_id`, `paid`, `debt`) VALUES
(1, 500, 2000),
(2, 0, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`) VALUES
(1, 'Programer'),
(2, 'Reklamer'),
(3, 'Photographer'),
(4, 'Casser'),
(5, 'Security');

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE `tours` (
  `id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `duration_of_tour` time DEFAULT NULL,
  `payment_of_tour` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`id`, `country_id`, `duration_of_tour`, `payment_of_tour`) VALUES
(1, 1, '04:00:00', 1500),
(2, 2, '08:00:00', 6500),
(3, 3, '08:00:00', 10500),
(4, 4, '08:00:00', 8500);

-- --------------------------------------------------------

--
-- Table structure for table `tour_orders`
--

CREATE TABLE `tour_orders` (
  `cilent_id` int(11) DEFAULT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `employe_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tour_orders`
--

INSERT INTO `tour_orders` (`cilent_id`, `tour_id`, `employe_id`, `date`) VALUES
(1, 4, 4, '2017-02-08 06:23:13'),
(2, 2, 3, '2017-02-08 06:23:13'),
(3, 2, 3, '2017-02-08 06:23:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cilent`
--
ALTER TABLE `cilent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role_id`);

--
-- Indexes for table `pay_info`
--
ALTER TABLE `pay_info`
  ADD UNIQUE KEY `cilent` (`cilent_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country` (`country_id`);

--
-- Indexes for table `tour_orders`
--
ALTER TABLE `tour_orders`
  ADD KEY `cilent` (`cilent_id`),
  ADD KEY `tour` (`tour_id`),
  ADD KEY `employe` (`employe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cilent`
--
ALTER TABLE `cilent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pay_info`
--
ALTER TABLE `pay_info`
  ADD CONSTRAINT `pay_info_ibfk_1` FOREIGN KEY (`cilent_id`) REFERENCES `cilent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tours`
--
ALTER TABLE `tours`
  ADD CONSTRAINT `tours_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tour_orders`
--
ALTER TABLE `tour_orders`
  ADD CONSTRAINT `tour_orders_ibfk_1` FOREIGN KEY (`cilent_id`) REFERENCES `cilent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tour_orders_ibfk_2` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tour_orders_ibfk_3` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
