-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 13, 2016 at 06:21 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foreignkeys`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `subscribe` varchar(3) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `profession`, `gender`, `subscribe`) VALUES
(4, 'a', 'v', 'student', 'Male', 'Yes'),
(6, 'a', 'v', 'other', 'Male', 'No'),
(7, 'a', 'v', 'other', 'Male', 'No'),
(8, 'sdf', 'sfdsdf', 'engineer', 'Male', 'Yes'),
(9, 'SDF', 'ASDF', 'engineer', 'Male', 'No'),
(14, 'Abc', 'Xyz', 'student', 'Female', 'Yes'),
(15, 'Abc', 'Xyz', 'student', 'Female', 'Yes'),
(16, 'Pkl', 'Ush', 'other', 'Male', 'No'),
(17, 'asfhlk', 'posdhvlk', 'student', 'Male', 'Yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
