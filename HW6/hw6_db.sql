-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 31, 2016 at 12:46 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fkhw6`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `calendar_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`calendar_id`, `user_id`, `post_id`, `tag_id`) VALUES
(1, 1, 1, 1),
(2, 1, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `accepted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `post_id`, `question_id`, `accepted`) VALUES
(1, 6, 1, 0),
(2, 7, 2, 1),
(3, 8, 3, 1),
(4, 9, 4, 0),
(5, 10, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `fulldate` date NOT NULL,
  `month` varchar(20) NOT NULL,
  `year` int(11) NOT NULL,
  `day_of_month` int(11) NOT NULL,
  `day_of_week` varchar(20) NOT NULL,
  `id` int(11) NOT NULL,
  `quarter` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`fulldate`, `month`, `year`, `day_of_month`, `day_of_week`, `id`, `quarter`) VALUES
('2016-09-27', 'September', 2016, 9, 'Tuesday', 1, 'Q3'),
('2016-10-28', 'October', 2016, 28, 'Friday', 2, 'Q4');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `number` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`number`, `post_id`, `user_id`, `body`) VALUES
(1, 1, 3, 'Dude you should know this'),
(2, 1, 4, 'That''s like basic man'),
(3, 2, 1, 'Use Google bro'),
(4, 2, 2, 'Refer the official documentation'),
(5, 2, 5, 'This is a duplicate question'),
(6, 3, 1, 'I know this one');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` varchar(50) NOT NULL,
  `created_timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `user_id`, `body`, `created_timestamp`) VALUES
(1, 1, 'How to move between Activities?', '2016-09-27 14:38:29'),
(2, 2, 'How to call API in Javascript?', '2016-09-27 14:38:57'),
(3, 3, 'How to create endpoint in node.js?', '2016-09-27 14:39:19'),
(4, 4, 'How to bing values in angularjs?', '2016-09-27 14:39:39'),
(5, 5, 'How to connect to database in PHP?', '2016-09-27 14:40:01'),
(6, 2, 'Using intents', '2016-09-27 14:40:28'),
(7, 1, 'Using AJAX', '2016-09-27 14:40:47'),
(8, 4, 'Add GET or POST in app.js', '2016-09-27 14:41:12'),
(9, 5, 'Using ng-bind', '2016-09-27 14:41:34'),
(10, 3, 'Using PDO', '2016-09-27 14:41:44'),
(11, 1, 'What are diff between fragments and activities', '2016-10-28 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `post_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 11);

-- --------------------------------------------------------

--
-- Table structure for table `question_tag`
--

CREATE TABLE `question_tag` (
  `question_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_tag`
--

INSERT INTO `question_tag` (`question_id`, `tag_id`) VALUES
(1, 1),
(2, 5),
(3, 2),
(4, 3),
(5, 4),
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(1, 'android'),
(2, 'node.js'),
(3, 'angular.js'),
(4, 'php'),
(5, 'javascript');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `Street` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `unit_number` int(11) NOT NULL,
  `zip_code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `full_name`, `Street`, `City`, `unit_number`, `zip_code`) VALUES
(1, 'Apoorv', '101 E San Fernando St', 'San Jose', 163, '95112'),
(2, 'Tugce', '101 E San Antonio St', 'San Jose', 13, '95112'),
(3, 'Pratik', '101 E San Juan St', 'San Jose', 11, '95112'),
(4, 'Skanda', '101 E Hedding St', 'San Jose', 110, '95112'),
(5, 'John', '101 E Taylor St', 'San Jose', 330, '95112');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `profession`, `gender`) VALUES
(4, 'a', 'v', 'student', 'Male'),
(6, 'a', 'v', 'other', 'Male'),
(7, 'a', 'v', 'other', 'Male'),
(8, 'sdf', 'sfdsdf', 'engineer', 'Male'),
(9, 'SDF', 'ASDF', 'engineer', 'Male'),
(10, 'Apoorv', 'Patel', 'engineer', 'Male'),
(11, 'Apoorva', 'Patel', 'student', 'Male'),
(12, 'Amita', 'Patel', 'student', 'Female'),
(13, 'Anita', 'patel', 'engineer', 'Female'),
(14, 'harsh', 'Patel', 'student', 'Male'),
(15, 'Apoorv', 'Patel', 'engineer', 'Male'),
(16, 'Apoorv', 'Patel', 'engineer', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `user_email`
--

CREATE TABLE `user_email` (
  `email` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_email`
--

INSERT INTO `user_email` (`email`, `user_id`) VALUES
('apoorv.patel@sjsu.edu', 1),
('john.smith@sjsu.edu', 5),
('patelapoorv9990@gmail.com', 1),
('pratik.vyas@sjsu.edu', 3),
('skanda.bhargav@sjsu.edu', 4),
('tugce.akin@sjsu.edu', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vote`
--

INSERT INTO `vote` (`id`, `user_id`, `post_id`) VALUES
(1, 1, 6),
(2, 1, 8),
(3, 1, 9),
(4, 1, 10),
(5, 2, 7),
(6, 2, 6),
(7, 2, 7),
(8, 3, 8),
(9, 3, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`calendar_id`,`user_id`,`post_id`,`tag_id`),
  ADD KEY `calendar_id` (`calendar_id`,`user_id`,`post_id`,`tag_id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`number`,`post_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `question_tag`
--
ALTER TABLE `question_tag`
  ADD PRIMARY KEY (`question_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_email`
--
ALTER TABLE `user_email`
  ADD PRIMARY KEY (`email`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

--
-- Constraints for table `question_tag`
--
ALTER TABLE `question_tag`
  ADD CONSTRAINT `question_tag_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `question_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

--
-- Constraints for table `user_email`
--
ALTER TABLE `user_email`
  ADD CONSTRAINT `user_email_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
