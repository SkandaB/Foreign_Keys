-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 08, 2016 at 03:25 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hw7_db`
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
(5, 10, 5, 0),
(7, 216, 18, 1),
(8, 93, 36, 1),
(9, 293, 2, 1),
(10, 3, 14, 0),
(11, 86, 22, 0),
(12, 348, 14, 0),
(13, 5, 30, 1),
(14, 36, 1, 1),
(15, 127, 39, 1),
(16, 284, 16, 1),
(17, 5, 14, 1),
(18, 99, 28, 1),
(20, 107, 36, 0),
(22, 123, 11, 0),
(23, 228, 35, 0),
(24, 183, 18, 1),
(25, 153, 38, 0),
(26, 11, 10, 1),
(27, 43, 13, 0),
(28, 144, 36, 1),
(29, 107, 11, 1),
(30, 254, 16, 0),
(31, 197, 10, 0),
(32, 96, 20, 0),
(34, 313, 27, 0),
(35, 33, 1, 0),
(36, 61, 15, 1),
(37, 85, 14, 0),
(38, 127, 10, 1),
(39, 156, 5, 0),
(40, 322, 32, 1),
(41, 186, 10, 0),
(42, 44, 5, 0),
(43, 91, 11, 0),
(44, 186, 11, 1),
(46, 11, 37, 0),
(48, 146, 14, 0),
(49, 46, 12, 1),
(50, 223, 24, 1),
(51, 226, 36, 0),
(52, 249, 2, 0),
(53, 15, 11, 0),
(54, 255, 22, 1),
(55, 202, 9, 0),
(56, 29, 23, 1),
(57, 312, 25, 1),
(59, 97, 34, 1),
(60, 144, 25, 0),
(61, 294, 6, 0),
(62, 42, 24, 0),
(63, 208, 1, 1),
(64, 225, 19, 1),
(65, 36, 18, 0),
(66, 265, 32, 0),
(67, 195, 32, 1),
(68, 296, 4, 1),
(69, 64, 18, 1),
(70, 89, 9, 0),
(71, 114, 20, 0),
(72, 248, 29, 1),
(73, 179, 38, 0),
(74, 341, 8, 0),
(75, 164, 5, 1),
(78, 113, 11, 0),
(79, 343, 1, 0),
(80, 45, 24, 1),
(81, 42, 37, 0),
(82, 274, 12, 0),
(83, 64, 31, 0),
(84, 258, 26, 0),
(85, 187, 21, 0),
(86, 13, 24, 1),
(87, 249, 37, 1),
(88, 317, 26, 0),
(89, 123, 31, 0),
(90, 302, 4, 0),
(91, 253, 16, 1),
(92, 289, 19, 0),
(93, 169, 3, 0),
(94, 136, 34, 0),
(95, 186, 30, 1),
(96, 178, 2, 1),
(97, 56, 24, 0),
(98, 182, 1, 1),
(99, 16, 23, 0),
(100, 115, 18, 0),
(102, 161, 24, 0),
(103, 302, 28, 0),
(104, 218, 18, 0),
(105, 16, 30, 1),
(106, 213, 12, 0),
(107, 163, 8, 0),
(108, 214, 22, 1),
(109, 17, 21, 1),
(110, 266, 36, 1),
(111, 14, 32, 1),
(112, 308, 34, 0),
(113, 168, 23, 0),
(114, 7, 4, 0),
(115, 243, 17, 1),
(116, 307, 25, 1),
(117, 194, 14, 1),
(118, 245, 20, 0),
(119, 41, 25, 0),
(120, 339, 39, 0),
(121, 315, 27, 1),
(122, 226, 32, 0),
(123, 106, 38, 1),
(124, 192, 27, 0),
(125, 74, 26, 1),
(126, 291, 15, 1),
(127, 308, 33, 0),
(128, 139, 7, 0),
(129, 177, 36, 1),
(130, 282, 19, 0),
(131, 198, 30, 0),
(132, 336, 12, 1),
(133, 69, 33, 1),
(134, 335, 17, 0),
(135, 182, 31, 0),
(136, 281, 10, 0),
(137, 109, 31, 0),
(138, 25, 2, 1),
(139, 285, 24, 0),
(141, 117, 36, 0),
(144, 125, 37, 0),
(145, 181, 29, 0),
(146, 185, 12, 1),
(147, 98, 5, 0),
(148, 237, 29, 1),
(149, 197, 19, 1),
(150, 109, 32, 0),
(151, 215, 16, 1),
(152, 38, 3, 1),
(153, 92, 13, 1),
(154, 66, 19, 1),
(155, 87, 27, 0),
(156, 3, 22, 1),
(157, 289, 1, 1),
(158, 85, 1, 1),
(159, 249, 17, 0),
(160, 152, 16, 1),
(161, 277, 37, 0),
(162, 145, 21, 1),
(163, 153, 29, 1),
(164, 259, 12, 0),
(165, 65, 39, 0),
(166, 28, 25, 0),
(167, 186, 7, 1),
(168, 238, 14, 0),
(169, 38, 6, 1),
(170, 17, 2, 0),
(171, 62, 21, 0),
(172, 347, 21, 0),
(173, 324, 38, 0),
(174, 342, 4, 0),
(176, 72, 7, 0),
(177, 182, 12, 0),
(178, 202, 17, 0),
(180, 334, 33, 1),
(181, 149, 1, 1),
(182, 151, 29, 0),
(183, 326, 13, 1),
(184, 48, 7, 1),
(185, 234, 26, 0),
(186, 235, 13, 1),
(187, 76, 29, 0),
(188, 125, 4, 0),
(189, 167, 2, 0),
(190, 107, 7, 1),
(192, 99, 3, 0),
(193, 76, 20, 1),
(194, 191, 21, 1),
(195, 62, 5, 0),
(196, 221, 5, 1),
(197, 204, 23, 1),
(198, 125, 27, 0),
(199, 202, 30, 0),
(200, 69, 23, 0),
(201, 43, 28, 1),
(202, 299, 15, 0),
(203, 208, 14, 0),
(204, 141, 33, 1),
(205, 298, 1, 0),
(206, 247, 15, 0),
(207, 251, 25, 1),
(208, 347, 9, 0),
(209, 77, 10, 0),
(210, 33, 19, 0),
(211, 293, 35, 0),
(212, 297, 23, 1),
(213, 259, 28, 0),
(214, 95, 34, 0),
(215, 246, 2, 0),
(216, 57, 33, 0),
(217, 125, 35, 0),
(219, 47, 38, 0),
(220, 314, 19, 0),
(221, 62, 15, 0),
(222, 308, 35, 0),
(223, 326, 9, 1),
(224, 87, 10, 1),
(225, 7, 38, 1),
(226, 152, 31, 0),
(227, 244, 8, 1),
(228, 271, 35, 0),
(230, 331, 29, 1),
(231, 246, 2, 1),
(232, 319, 6, 0),
(233, 344, 8, 0),
(234, 52, 25, 1),
(235, 47, 36, 0),
(236, 309, 7, 1),
(237, 229, 5, 0),
(238, 188, 32, 0),
(239, 279, 15, 1),
(240, 299, 13, 0),
(241, 161, 22, 1),
(242, 122, 24, 1),
(243, 129, 3, 1),
(244, 288, 25, 1),
(245, 284, 15, 0),
(246, 5, 18, 0),
(247, 134, 17, 0),
(248, 322, 20, 0),
(249, 346, 13, 0),
(250, 349, 25, 0),
(253, 278, 1, 0),
(254, 206, 39, 0),
(255, 167, 10, 0),
(256, 171, 4, 0),
(257, 43, 23, 1),
(258, 205, 13, 1),
(259, 109, 20, 1),
(260, 145, 21, 0),
(261, 61, 11, 0),
(262, 145, 18, 0),
(263, 286, 24, 0),
(264, 307, 27, 1),
(265, 125, 16, 0),
(266, 341, 34, 0),
(267, 128, 25, 0),
(268, 31, 33, 1),
(269, 316, 17, 1),
(270, 257, 19, 1),
(272, 145, 5, 1),
(273, 81, 32, 0),
(274, 32, 28, 1),
(275, 42, 16, 0),
(276, 282, 1, 1),
(277, 299, 26, 0),
(279, 136, 31, 0),
(280, 151, 5, 1),
(281, 26, 19, 1),
(282, 31, 32, 1),
(283, 271, 2, 1),
(285, 329, 14, 0),
(286, 219, 1, 0),
(288, 255, 14, 0),
(289, 242, 28, 0),
(290, 288, 33, 0),
(291, 269, 28, 1),
(292, 197, 24, 0),
(293, 164, 34, 0),
(295, 288, 23, 1),
(296, 124, 35, 0),
(297, 31, 7, 1),
(298, 246, 16, 0),
(299, 348, 35, 0),
(300, 328, 38, 1),
(301, 8, 8, 0),
(302, 286, 2, 1),
(303, 38, 2, 0),
(304, 337, 3, 0),
(305, 156, 9, 0),
(306, 239, 10, 0),
(308, 274, 25, 0),
(309, 315, 12, 1),
(311, 166, 3, 0),
(312, 334, 31, 0),
(313, 46, 33, 1),
(314, 274, 21, 1),
(315, 155, 33, 1),
(316, 345, 26, 0),
(317, 243, 8, 0),
(318, 279, 10, 0),
(319, 71, 1, 0),
(320, 346, 31, 1),
(322, 212, 31, 0),
(323, 151, 14, 1),
(324, 5, 14, 1),
(325, 93, 10, 1),
(326, 71, 10, 0),
(328, 301, 23, 1),
(329, 72, 12, 0),
(330, 218, 20, 0),
(331, 77, 27, 0),
(332, 267, 23, 0),
(333, 337, 14, 0),
(334, 203, 33, 0),
(335, 186, 22, 1),
(336, 26, 35, 0),
(337, 234, 1, 0),
(338, 197, 14, 0),
(339, 162, 4, 0);

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
(6, 3, 1, 'I know this one'),
(7, 150, 81, 'Rerum hic qui dolore.'),
(8, 303, 84, 'Voluptatum fugiat minus odio temporibus nesciunt.'),
(9, 349, 97, 'Beatae voluptate magnam possimus sit quasi atque.'),
(10, 136, 8, 'Cum harum mollitia sint.'),
(11, 33, 30, 'Quod ullam aperiam dignissimos.'),
(12, 278, 10, 'Esse possimus id ea culpa dolorem quaerat.'),
(13, 184, 52, 'Culpa delectus voluptatem dolores vero debitis.'),
(14, 190, 4, 'Fugiat minus sapiente minus debitis voluptates.'),
(15, 320, 15, 'Ut mollitia vel ullam.'),
(16, 26, 6, 'Possimus esse eius pariatur dolores dicta.'),
(17, 212, 76, 'Quam iusto voluptates excepturi quo.'),
(18, 327, 24, 'Repellat porro praesentium debitis illo cumque ame'),
(19, 32, 26, 'Officiis dignissimos labore reiciendis impedit ist'),
(20, 296, 85, 'Quasi tempore blanditiis voluptatum.'),
(21, 324, 44, 'Vel nihil quibusdam iure omnis ducimus atque.'),
(22, 168, 22, 'Maxime voluptatum quis ratione facilis dolore.'),
(23, 9, 47, 'Quae laborum consectetur consectetur maiores.'),
(24, 77, 12, 'Eos aliquam corporis impedit ipsum.'),
(25, 304, 14, 'Repellat sint velit assumenda ullam.'),
(26, 79, 21, 'Harum minima iure tempora cupiditate necessitatibu'),
(27, 160, 6, 'Error quaerat corrupti veritatis ut repellat incid'),
(28, 145, 11, 'Fugiat qui nobis velit ratione nulla.'),
(29, 286, 72, 'Qui magni atque aliquam enim natus.'),
(30, 88, 5, 'Architecto ratione nesciunt expedita porro.'),
(31, 221, 14, 'Animi atque quasi explicabo sequi consectetur itaq'),
(32, 339, 16, 'Molestiae animi commodi magnam.'),
(33, 42, 12, 'Doloremque ab doloremque odio.'),
(34, 64, 93, 'Sit est vero veritatis possimus laboriosam tenetur'),
(35, 236, 54, 'Pariatur magni nihil magni.'),
(36, 182, 59, 'Autem repellendus impedit officia.'),
(37, 189, 52, 'Vel et doloribus similique ab sit.'),
(38, 55, 56, 'Recusandae consequatur sequi mollitia.'),
(39, 238, 76, 'Quibusdam recusandae veritatis nulla.'),
(40, 246, 35, 'Repellat possimus nesciunt quo.'),
(41, 263, 78, 'Soluta vel rerum ex provident voluptatum ducimus.'),
(42, 211, 11, 'Error odit soluta aspernatur expedita.'),
(43, 210, 80, 'Hic ratione fugit vel.'),
(44, 254, 17, 'Dolorem porro nemo alias nesciunt unde neque.'),
(45, 68, 30, 'Nisi est ratione quos sit aliquam.'),
(46, 198, 61, 'Sed est harum adipisci illum aliquid.'),
(47, 77, 60, 'Dolorem molestias nemo quaerat totam quas voluptat'),
(48, 265, 15, 'Fugiat accusamus ipsum itaque.'),
(49, 154, 10, 'Quasi optio impedit facilis molestiae.'),
(50, 100, 91, 'Placeat beatae fugit debitis doloremque quod offic'),
(51, 304, 69, 'Tempora molestias dolorem enim.'),
(52, 199, 28, 'Rerum culpa eveniet culpa illum quaerat itaque.'),
(53, 286, 87, 'Sequi deserunt assumenda quis.'),
(54, 245, 95, 'Corporis tempora ipsam magni reprehenderit unde.'),
(55, 47, 18, 'A deleniti sint temporibus rerum.'),
(56, 63, 52, 'Ipsum repellat illo corporis.'),
(57, 171, 3, 'Tempore nemo voluptatum maiores ratione magni.'),
(58, 143, 34, 'Deserunt non consequuntur dolorem.'),
(59, 242, 48, 'Occaecati est id enim at.'),
(60, 149, 29, 'Excepturi ab atque nam.'),
(61, 221, 56, 'Aperiam consectetur molestiae sunt reiciendis hic.'),
(62, 93, 62, 'Distinctio molestias qui optio.'),
(63, 154, 25, 'Quo laborum quasi quas libero aperiam.'),
(64, 290, 26, 'Explicabo vero quidem rem nemo.'),
(65, 195, 72, 'Natus quidem tenetur libero consequatur.'),
(66, 251, 20, 'Eius ipsum doloribus fugiat.'),
(67, 323, 82, 'Explicabo architecto amet cupiditate a.'),
(68, 297, 2, 'Error doloribus blanditiis beatae enim a.'),
(69, 70, 27, 'Molestiae quas excepturi unde atque numquam sit.'),
(70, 316, 54, 'Perspiciatis ab animi architecto laborum unde assu'),
(71, 199, 87, 'Nesciunt dignissimos officiis tenetur doloribus fu'),
(72, 125, 31, 'Eaque autem quidem autem facilis.'),
(73, 247, 63, 'Impedit facilis sit nihil quas doloremque ipsa dic'),
(74, 48, 46, 'At quisquam eum nam nobis.'),
(75, 106, 56, 'Explicabo est minima laudantium voluptatum ipsum.'),
(76, 116, 8, 'Minus eius odit aspernatur eius omnis aliquid.'),
(77, 320, 80, 'Itaque tempora inventore perspiciatis aperiam.'),
(78, 334, 11, 'Repudiandae corrupti officiis dolor enim.'),
(79, 326, 76, 'Sequi repellendus ab necessitatibus ipsum accusant'),
(80, 165, 82, 'Atque accusantium illo aliquid.'),
(81, 263, 83, 'Amet accusantium omnis distinctio distinctio.'),
(82, 210, 67, 'Ducimus temporibus dignissimos ut.'),
(83, 225, 35, 'Rerum dicta at deleniti facilis animi.'),
(84, 204, 88, 'Ratione neque possimus harum consequatur voluptati'),
(85, 127, 11, 'Nam non asperiores atque.'),
(86, 208, 36, 'Atque magni eveniet animi facilis cum distinctio.'),
(87, 321, 73, 'Sapiente vero rerum blanditiis natus est rem.'),
(88, 178, 69, 'Harum a saepe ipsam rem libero molestias.'),
(89, 286, 44, 'Iusto laboriosam dolores magnam ratione veniam.'),
(90, 338, 97, 'Consequuntur cum molestias quis quod veritatis.'),
(91, 137, 26, 'Possimus reiciendis minus illum.'),
(92, 326, 54, 'Esse illo id alias dolorum illo.'),
(93, 39, 63, 'At inventore veritatis quidem nesciunt.'),
(94, 209, 62, 'Nostrum dolores suscipit minus ipsam quos minima.'),
(95, 325, 80, 'Occaecati culpa doloremque natus asperiores.'),
(96, 229, 37, 'Sunt inventore eveniet doloremque saepe.'),
(97, 94, 76, 'Officiis voluptatum nobis suscipit natus minus mol'),
(98, 155, 49, 'Nulla modi animi delectus dolores rem.'),
(99, 214, 18, 'Quod expedita facere soluta laborum.'),
(100, 17, 11, 'Consequatur possimus aut facilis quis laudantium.'),
(101, 39, 52, 'Asperiores impedit repellat animi illo libero.'),
(102, 239, 18, 'Eos quasi eligendi doloribus eligendi.'),
(103, 204, 29, 'Accusantium perspiciatis enim minima architecto mo'),
(104, 78, 79, 'Cum eveniet vitae voluptatum.'),
(105, 314, 52, 'Tempora similique vero vero amet tempora.'),
(106, 210, 31, 'Enim soluta laborum voluptatem at repellendus haru'),
(107, 315, 55, 'Eligendi fuga illo sed.'),
(108, 87, 50, 'A molestiae omnis recusandae molestiae.'),
(109, 194, 4, 'Eum beatae corporis perferendis minima.'),
(110, 216, 51, 'Aut rem aliquam ab accusamus.'),
(111, 9, 9, 'Neque sequi totam at.'),
(112, 110, 18, 'Expedita perspiciatis quos dolorum impedit.'),
(113, 320, 23, 'Sapiente eius temporibus eos repudiandae.'),
(114, 40, 49, 'Voluptate numquam esse sint impedit.'),
(115, 154, 95, 'Et sed iure ratione adipisci accusamus.'),
(116, 307, 51, 'Qui fugiat saepe sit libero minus eius.'),
(117, 318, 53, 'Iusto consequatur ea quidem esse.'),
(118, 250, 64, 'Iusto ipsum ipsum nihil.'),
(119, 256, 4, 'Reprehenderit vel ad eius.'),
(120, 261, 23, 'Consectetur a blanditiis deserunt sapiente.'),
(121, 177, 21, 'Nobis id quibusdam dolorem tempora impedit.'),
(122, 235, 92, 'Id ipsum dolore inventore eveniet tempora ullam.'),
(123, 278, 35, 'Sequi architecto quis voluptates tenetur delectus.'),
(124, 115, 66, 'Sequi rem nostrum architecto dolore praesentium.'),
(125, 308, 93, 'Quibusdam odio animi totam tempore excepturi.'),
(126, 274, 21, 'Cum recusandae minus pariatur dolorem.'),
(127, 68, 49, 'Nemo corporis dicta necessitatibus.'),
(128, 15, 47, 'Illo nostrum consequatur nesciunt.'),
(129, 191, 98, 'Vel praesentium praesentium nihil porro.');

-- --------------------------------------------------------

--
-- Table structure for table `correct_answers`
--

CREATE TABLE `correct_answers` (
  `question_id` int(11) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `question_user_id` int(11) DEFAULT NULL,
  `answer_user_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `question_calendar_id` int(11) DEFAULT NULL,
  `answer_calendar_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `correct_answers`
--

INSERT INTO `correct_answers` (`question_id`, `answer_id`, `question_user_id`, `answer_user_id`, `tag_id`, `question_calendar_id`, `answer_calendar_id`) VALUES
(1, 6, 1, 2, 1, 1, 1),
(2, 7, 2, 1, 5, 1, 2),
(3, 8, 3, 4, 2, 2, 2);

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
(11, 1, 'What are diff between fragments and activities', '2016-10-28 00:00:00'),
(12, 7, 'Labore repellendus magni dignissimos similique.', '2015-07-17 01:57:12'),
(13, 40, 'Fuga enim totam mollitia fugit quae.', '2016-02-28 17:46:52'),
(14, 62, 'Id ad aliquid asperiores vel maiores amet doloribu', '2015-04-07 04:56:13'),
(15, 74, 'Excepturi inventore ipsam placeat aut deserunt tem', '2015-09-28 20:01:00'),
(16, 72, 'Veritatis qui molestiae laborum dolorum eaque.', '2015-06-04 11:03:32'),
(17, 71, 'Quia adipisci fuga quidem voluptatem assumenda ver', '2016-01-21 09:49:56'),
(18, 29, 'Blanditiis sed pariatur consequatur voluptas asper', '2016-02-06 09:28:22'),
(19, 9, 'In quibusdam modi maxime quo.', '2015-04-08 01:51:30'),
(20, 7, 'Officia pariatur itaque laborum.', '2016-07-24 14:46:55'),
(21, 66, 'Similique dolores deleniti laborum quo ad necessit', '2015-11-28 18:27:18'),
(22, 86, 'Reiciendis ullam exercitationem ducimus quaerat.', '2015-07-16 18:07:22'),
(23, 61, 'Est repellendus culpa sequi.', '2016-08-16 12:28:07'),
(24, 3, 'Officiis aliquid quam dolor eligendi.', '2015-11-18 02:47:39'),
(25, 38, 'Provident ut maiores non itaque pariatur necessita', '2015-11-09 17:14:46'),
(26, 10, 'Officia asperiores voluptates veritatis aliquam do', '2016-06-23 18:29:21'),
(27, 38, 'Et repudiandae laborum corrupti in commodi iste.', '2015-06-22 14:59:22'),
(28, 1, 'Quas dicta error est quam.', '2016-02-23 00:55:38'),
(29, 4, 'Voluptates recusandae mollitia inventore commodi q', '2015-03-17 15:45:30'),
(30, 14, 'Dolor quidem ratione est sit sit.', '2016-05-19 01:49:20'),
(31, 19, 'Autem porro porro veniam voluptates eius.', '2016-08-05 05:59:20'),
(32, 58, 'Veritatis fuga sint officiis magnam tempore exerci', '2016-02-06 00:55:39'),
(33, 28, 'Qui cumque velit possimus.', '2015-09-06 09:06:25'),
(34, 26, 'Deleniti aliquid voluptates quasi ut.', '2016-08-03 00:23:04'),
(35, 83, 'Corporis modi inventore neque quo.', '2015-09-17 15:05:16'),
(36, 3, 'Perspiciatis qui ad quaerat ullam dolores inventor', '2016-06-28 12:09:04'),
(37, 63, 'Amet quaerat ipsum molestiae sunt nisi.', '2015-04-25 18:06:51'),
(38, 85, 'Fugit magni facilis corrupti distinctio molestiae.', '2015-11-15 23:07:19'),
(39, 42, 'Blanditiis repellat accusantium modi similique.', '2015-10-07 05:37:21'),
(40, 84, 'Labore molestiae aspernatur fugit distinctio.', '2016-01-16 07:48:19'),
(41, 65, 'Enim laboriosam corrupti sit doloribus deleniti ip', '2016-04-21 23:16:05'),
(42, 69, 'Laboriosam nihil optio voluptatem numquam blanditi', '2015-03-06 11:28:08'),
(43, 36, 'Fugiat omnis et doloremque.', '2015-07-17 20:22:59'),
(44, 44, 'Dolorum rerum error ipsa nobis.', '2016-04-26 16:12:28'),
(45, 61, 'Dicta necessitatibus cumque laborum soluta tempori', '2015-09-14 12:13:40'),
(46, 27, 'Earum a earum voluptates.', '2016-10-05 07:03:00'),
(47, 11, 'Consequatur praesentium dolores totam.', '2015-01-14 10:36:49'),
(48, 29, 'Numquam delectus soluta reprehenderit quas.', '2015-12-22 19:41:14'),
(49, 85, 'Totam cupiditate nobis et sequi.', '2016-05-23 20:31:11'),
(50, 38, 'Atque qui eum eligendi molestiae.', '2015-04-25 01:44:59'),
(51, 42, 'Quam quibusdam voluptate blanditiis odio porro.', '2015-06-23 16:32:21'),
(52, 92, 'Sunt itaque quis quae omnis.', '2015-08-26 02:27:31'),
(53, 16, 'Dicta maiores veritatis unde tempore.', '2015-01-26 21:44:51'),
(54, 85, 'Nihil eum et numquam.', '2015-09-07 13:50:50'),
(55, 11, 'Vel praesentium commodi cum nobis eos porro.', '2015-01-15 08:46:39'),
(56, 62, 'Nihil deserunt voluptatum deserunt dolorem fuga al', '2016-04-12 01:31:05'),
(57, 75, 'Molestias quasi quibusdam architecto pariatur vel.', '2015-08-11 05:34:59'),
(58, 56, 'Consequuntur eos neque occaecati mollitia dolorum.', '2016-02-12 16:59:37'),
(59, 24, 'Illo velit enim aperiam beatae ad.', '2015-10-09 19:50:20'),
(60, 24, 'Veniam eos dolores deserunt asperiores molestias r', '2015-11-23 23:43:55'),
(61, 68, 'Qui sequi aliquid similique totam quos eaque.', '2016-07-20 05:11:44'),
(62, 11, 'Culpa aperiam illo maxime.', '2016-02-27 17:45:29'),
(63, 3, 'Illum laudantium beatae perferendis culpa repellen', '2016-03-07 04:22:35'),
(64, 49, 'Omnis optio similique suscipit quas veniam cumque.', '2015-04-26 23:23:58'),
(65, 73, 'Dignissimos accusamus eius quia aspernatur.', '2015-12-11 04:14:00'),
(66, 43, 'Illo minus alias quibusdam quas dolorum temporibus', '2015-01-06 22:23:21'),
(67, 16, 'Voluptates occaecati reiciendis adipisci dolor com', '2015-05-28 21:41:22'),
(68, 51, 'Eum itaque ipsum ducimus ipsa quia optio.', '2015-01-29 06:50:43'),
(69, 1, 'Natus cum ab unde quam.', '2015-03-02 02:57:03'),
(70, 70, 'Voluptatem nisi illum rem quae occaecati eum.', '2016-05-22 20:11:22'),
(71, 4, 'Sed iste rerum iste.', '2015-01-05 19:23:15'),
(72, 87, 'Eos error soluta provident odio sunt.', '2015-10-07 20:20:01'),
(73, 84, 'Quasi ipsa non asperiores.', '2016-05-24 03:15:22'),
(74, 18, 'Corporis quas perspiciatis sequi consectetur unde.', '2016-03-10 12:33:33'),
(75, 11, 'Ducimus accusamus unde nesciunt ut.', '2015-06-13 01:30:35'),
(76, 2, 'Delectus consequatur eaque nam corporis atque atqu', '2015-10-10 04:54:06'),
(77, 83, 'Recusandae dolore fugiat quam occaecati sapiente.', '2016-04-23 09:21:10'),
(78, 17, 'Minus repellendus necessitatibus tempore fugit aut', '2015-09-17 01:28:32'),
(79, 80, 'Maiores omnis illo placeat iusto.', '2015-01-21 16:21:54'),
(80, 4, 'Recusandae ea possimus impedit veniam.', '2015-10-30 05:11:10'),
(81, 23, 'Dolorum perspiciatis excepturi quibusdam iusto qua', '2016-07-27 22:17:22'),
(82, 64, 'Labore totam aspernatur dolorum corrupti sed.', '2015-12-31 23:41:57'),
(83, 68, 'Illo hic dignissimos unde nam adipisci.', '2016-05-02 20:28:50'),
(84, 97, 'Sint officia voluptatibus at et.', '2015-06-29 13:32:23'),
(85, 45, 'Aliquam quibusdam nesciunt nemo explicabo ipsam pe', '2016-09-03 16:16:46'),
(86, 32, 'Repellat cupiditate eum aspernatur amet assumenda.', '2015-02-28 22:56:19'),
(87, 65, 'Esse maxime necessitatibus atque in.', '2015-06-19 16:29:30'),
(88, 3, 'Itaque quibusdam esse repellendus.', '2016-01-25 01:11:33'),
(89, 33, 'Accusantium eligendi minima vero labore magni solu', '2015-01-12 01:35:01'),
(90, 91, 'Saepe enim at cum nulla repellendus.', '2015-06-27 09:33:12'),
(91, 99, 'Nam corrupti saepe labore dicta illo.', '2016-07-22 22:38:34'),
(92, 17, 'Consequatur in est voluptatibus.', '2016-04-28 02:59:17'),
(93, 100, 'Dignissimos ut aliquam facilis exercitationem.', '2015-03-22 01:13:47'),
(94, 10, 'Aperiam dolores doloribus explicabo consequatur il', '2015-11-02 12:21:46'),
(95, 70, 'Debitis quibusdam id ipsum exercitationem.', '2015-11-15 21:42:11'),
(96, 78, 'Sint accusamus molestias maiores aliquam et.', '2015-03-16 21:25:03'),
(97, 47, 'Magni atque quis magni aperiam nihil.', '2015-01-10 23:14:42'),
(98, 85, 'Autem enim quam necessitatibus accusamus nisi.', '2016-02-10 07:47:05'),
(99, 67, 'Fugiat autem esse provident ipsa.', '2015-04-10 13:37:52'),
(100, 69, 'Laboriosam sed dicta porro.', '2016-01-07 09:10:09'),
(101, 91, 'Non rerum officiis distinctio praesentium.', '2016-04-23 16:52:13'),
(102, 60, 'Pariatur tempora fugiat porro quibusdam corporis.', '2015-12-08 16:37:22'),
(103, 33, 'Incidunt esse in eaque nobis totam.', '2016-05-26 20:48:58'),
(104, 31, 'Maiores qui nihil illum.', '2015-01-08 23:33:41'),
(105, 37, 'Repellat exercitationem eum aliquam temporibus vol', '2015-04-23 14:03:30'),
(106, 33, 'Voluptatem ut ea temporibus eligendi accusantium o', '2016-06-20 15:06:49'),
(107, 78, 'A provident quas soluta quia fuga.', '2015-02-03 21:53:52'),
(108, 72, 'Dolor quaerat suscipit quibusdam iste veniam eum.', '2016-06-20 16:46:00'),
(109, 53, 'Quis in consequatur repellendus dolore.', '2015-12-09 03:41:42'),
(110, 16, 'Tenetur eligendi asperiores id perferendis.', '2015-08-10 07:32:13'),
(111, 92, 'Ab animi odit at.', '2015-05-18 06:45:17'),
(112, 9, 'Ullam rem odit aspernatur voluptatum.', '2015-07-03 09:02:49'),
(113, 17, 'Doloremque nihil deserunt soluta.', '2015-03-19 04:58:06'),
(114, 3, 'Dignissimos assumenda harum cum.', '2016-06-13 19:10:23'),
(115, 56, 'Facilis nostrum culpa dolor voluptatum ipsum.', '2016-04-09 06:34:03'),
(116, 88, 'Id iste saepe deserunt.', '2016-04-06 04:13:03'),
(117, 86, 'Iste accusantium natus quidem aliquid temporibus u', '2015-03-18 05:10:14'),
(118, 15, 'Recusandae voluptatem iure nostrum nam quaerat ali', '2015-10-17 08:34:52'),
(119, 51, 'Impedit dicta provident iste.', '2015-07-29 19:54:29'),
(120, 46, 'Nisi nulla assumenda esse deleniti velit.', '2016-02-17 03:33:45'),
(121, 19, 'Error unde repudiandae perspiciatis.', '2016-04-24 22:24:44'),
(122, 61, 'Itaque minus sequi tenetur.', '2016-07-08 14:54:35'),
(123, 66, 'Laboriosam libero amet aspernatur alias.', '2015-02-02 22:29:41'),
(124, 64, 'Omnis quis vel quisquam.', '2016-06-12 01:17:01'),
(125, 55, 'Ab possimus quis ea.', '2015-05-20 22:01:14'),
(126, 44, 'Nemo hic fugiat sequi consequuntur ipsa rem.', '2015-02-19 03:12:28'),
(127, 63, 'Soluta voluptas minima sunt commodi architecto.', '2015-02-10 14:24:08'),
(128, 64, 'Praesentium ut dignissimos optio.', '2016-02-29 08:26:17'),
(129, 22, 'Minus consequuntur ab illo.', '2016-04-03 22:14:45'),
(130, 26, 'Ad adipisci nostrum dolore eos magnam vitae.', '2015-07-09 06:28:49'),
(131, 79, 'Sapiente dignissimos nobis necessitatibus laborum ', '2015-03-06 16:44:23'),
(132, 99, 'Quis hic porro voluptatem ut nemo.', '2015-01-15 12:30:39'),
(133, 46, 'Id voluptate quia cumque assumenda praesentium qui', '2016-06-25 00:58:58'),
(134, 55, 'Cum nihil expedita molestias voluptatibus ullam.', '2015-03-09 14:36:09'),
(135, 14, 'Aut odio placeat iusto eligendi iste.', '2016-03-23 19:01:15'),
(136, 40, 'Voluptatibus vitae soluta maxime perferendis.', '2015-07-09 02:29:26'),
(137, 69, 'Fugiat expedita minus molestias beatae.', '2015-07-29 23:18:35'),
(138, 66, 'Facere quisquam asperiores omnis aliquid laboriosa', '2016-05-30 00:45:36'),
(139, 37, 'Veniam impedit unde iure.', '2016-03-27 05:36:22'),
(140, 91, 'Commodi nihil assumenda non.', '2015-01-03 08:39:36'),
(141, 18, 'Possimus in repellendus temporibus recusandae nam ', '2015-02-16 12:59:51'),
(142, 81, 'Quae minima voluptatibus quaerat quae.', '2015-03-07 13:47:01'),
(143, 47, 'Placeat labore ea consectetur voluptatibus.', '2015-01-04 06:34:04'),
(144, 51, 'Nihil fuga tenetur harum suscipit cumque ipsam.', '2015-08-22 08:05:06'),
(145, 35, 'Nemo harum ducimus quia sint autem aliquid repudia', '2016-01-15 17:36:45'),
(146, 36, 'A sapiente nulla minima tempora.', '2016-03-25 06:28:15'),
(147, 36, 'Ratione aliquid doloremque neque.', '2016-01-09 04:06:36'),
(148, 58, 'Ea voluptatibus doloremque ratione culpa at.', '2015-06-21 17:53:58'),
(149, 18, 'Officia provident corporis eaque consectetur exerc', '2015-10-10 02:55:26'),
(150, 29, 'Vero maiores doloremque ut.', '2015-02-14 21:52:24'),
(151, 97, 'Sapiente amet suscipit quis praesentium velit enim', '2015-02-25 01:11:01'),
(152, 92, 'Temporibus dignissimos iusto veniam tenetur simili', '2016-01-25 15:15:33'),
(153, 77, 'Magnam voluptas ipsam similique.', '2016-02-26 17:26:42'),
(154, 9, 'Perspiciatis deserunt laborum id nihil suscipit hi', '2015-05-08 12:49:53'),
(155, 61, 'Temporibus est commodi explicabo.', '2015-03-29 02:27:31'),
(156, 76, 'Animi eum nisi sunt suscipit quae laboriosam.', '2015-04-29 23:58:13'),
(157, 90, 'Omnis fugit reprehenderit rerum.', '2015-04-02 15:42:45'),
(158, 92, 'Ullam sequi fugit a.', '2015-02-05 20:43:03'),
(159, 17, 'Enim similique vel recusandae quidem fuga aut.', '2015-05-09 01:08:21'),
(160, 17, 'Dolorem tenetur reprehenderit quas amet vero optio', '2016-03-21 19:29:17'),
(161, 29, 'Quisquam qui recusandae esse voluptates.', '2015-09-20 13:04:49'),
(162, 81, 'Recusandae ad est quidem nostrum eius laborum.', '2015-01-25 05:27:23'),
(163, 52, 'Optio accusantium iste quas commodi maxime.', '2016-09-25 20:20:40'),
(164, 47, 'Repudiandae quia architecto iusto error voluptates', '2016-09-30 13:50:30'),
(165, 93, 'Totam possimus nemo natus assumenda.', '2016-08-06 15:37:58'),
(166, 62, 'A nobis incidunt voluptatum adipisci modi sequi.', '2015-07-24 12:46:03'),
(167, 21, 'Maiores voluptatum voluptate vel tempora.', '2015-02-06 14:03:10'),
(168, 89, 'Aperiam ipsam quibusdam sit harum similique.', '2016-03-17 19:03:34'),
(169, 82, 'Voluptas porro ipsam velit accusantium.', '2015-10-01 15:02:46'),
(170, 38, 'Porro voluptate aliquid adipisci facere deserunt.', '2015-02-14 10:28:52'),
(171, 4, 'Itaque ipsum facilis quis.', '2015-08-24 05:45:23'),
(172, 55, 'Recusandae hic ipsa doloribus quae quaerat.', '2015-01-05 13:53:47'),
(173, 50, 'Quae quisquam magni cumque.', '2015-02-01 19:54:28'),
(174, 50, 'Consequuntur perspiciatis mollitia sed reiciendis ', '2015-09-14 09:23:20'),
(175, 2, 'Distinctio veniam ducimus facere aut impedit.', '2016-04-28 02:19:09'),
(176, 100, 'Pariatur aliquam perferendis optio beatae repudian', '2016-08-03 22:32:48'),
(177, 53, 'Consectetur adipisci iste molestiae laudantium rep', '2015-01-17 07:37:50'),
(178, 90, 'Accusantium esse alias quasi excepturi minima.', '2015-12-20 19:21:20'),
(179, 72, 'Dolores possimus minus necessitatibus.', '2016-07-09 09:27:40'),
(180, 78, 'Dolore inventore eligendi repudiandae.', '2015-06-01 01:46:26'),
(181, 44, 'Fugit quae quisquam dicta dolorem cupiditate.', '2016-01-28 00:51:19'),
(182, 33, 'Temporibus velit blanditiis perspiciatis pariatur.', '2016-09-29 16:55:55'),
(183, 53, 'Ab laudantium beatae nesciunt ex aut maxime.', '2016-05-07 13:21:25'),
(184, 91, 'Quae labore nobis harum.', '2015-09-01 16:34:02'),
(185, 34, 'Amet dolores sint alias quisquam aut.', '2015-05-22 01:32:54'),
(186, 25, 'Ipsam totam in tempore quod.', '2016-05-14 20:26:30'),
(187, 97, 'Nihil dolore voluptatum aliquid porro reiciendis t', '2015-09-23 04:52:59'),
(188, 38, 'Id odit distinctio fuga sapiente repellendus.', '2015-08-22 10:22:50'),
(189, 90, 'Eligendi rem voluptatum sunt.', '2016-01-13 05:54:25'),
(190, 96, 'Dolor maxime ratione cupiditate.', '2015-11-18 13:17:06'),
(191, 60, 'Fugit eos suscipit accusamus.', '2016-06-21 03:30:16'),
(192, 88, 'Amet necessitatibus ea similique.', '2016-07-18 02:31:09'),
(193, 21, 'Error illo occaecati odit aliquam nobis veritatis.', '2016-08-14 07:23:29'),
(194, 30, 'Tempora distinctio id unde velit atque at.', '2015-11-06 23:36:36'),
(195, 53, 'Odio esse eaque mollitia consequatur sunt.', '2016-03-07 02:09:49'),
(196, 31, 'Fugit quod libero voluptatem.', '2015-06-15 09:10:43'),
(197, 49, 'Error tenetur ratione dolor hic voluptates.', '2016-05-05 04:54:48'),
(198, 70, 'Quia optio maiores earum voluptas.', '2016-07-27 00:35:35'),
(199, 91, 'Non numquam ab incidunt.', '2016-04-24 04:43:06'),
(200, 4, 'Iusto id vel ut doloribus.', '2016-04-23 02:22:42'),
(201, 69, 'Animi vel iste aperiam vel veritatis.', '2016-07-12 16:13:10'),
(202, 45, 'Dolorem sapiente itaque eius.', '2015-12-03 13:45:29'),
(203, 86, 'Eaque fuga totam harum quia expedita.', '2015-04-20 13:49:24'),
(204, 5, 'Molestias quis velit animi minima.', '2015-11-14 14:09:53'),
(205, 74, 'Iure earum occaecati illo eum.', '2015-12-20 16:08:10'),
(206, 28, 'Distinctio amet ducimus tempore magnam eaque magna', '2015-12-15 19:42:38'),
(207, 13, 'Recusandae incidunt beatae a doloribus ad.', '2015-06-30 07:23:08'),
(208, 97, 'Quaerat repellat aspernatur laboriosam doloremque ', '2015-09-20 00:46:05'),
(209, 31, 'Alias qui ducimus libero aspernatur sequi pariatur', '2015-06-24 06:06:55'),
(210, 52, 'Veniam nam ipsam consequatur animi ratione assumen', '2015-06-16 05:06:52'),
(211, 13, 'Repellendus in quibusdam harum.', '2015-12-23 02:40:14'),
(212, 13, 'In tempora veniam consequuntur expedita possimus c', '2016-07-13 01:59:12'),
(213, 61, 'Soluta eos laboriosam odit iste porro debitis.', '2016-08-27 07:33:03'),
(214, 91, 'Eveniet optio aut laudantium.', '2015-01-04 09:31:30'),
(215, 77, 'Repellat accusamus incidunt tempore praesentium qu', '2016-04-06 22:12:48'),
(216, 8, 'Eius quae illum doloremque minus.', '2015-10-29 03:41:15'),
(217, 93, 'Aspernatur unde hic provident placeat.', '2015-03-21 08:19:14'),
(218, 43, 'Eligendi eius quia dolore magnam ullam nostrum.', '2016-04-03 22:08:14'),
(219, 25, 'Consequatur minima quibusdam rerum libero maxime.', '2015-12-05 02:58:15'),
(220, 39, 'Commodi modi inventore tenetur earum architecto pe', '2016-02-16 21:35:56'),
(221, 71, 'Deleniti rerum laborum sit inventore illum.', '2016-01-20 09:47:03'),
(222, 76, 'Ut unde dolor hic.', '2016-08-25 13:25:13'),
(223, 99, 'Quam eligendi perferendis quasi sunt aliquam recus', '2016-09-25 18:09:38'),
(224, 99, 'Repellat magnam at sed debitis.', '2015-01-13 16:32:42'),
(225, 29, 'Tempora aliquid dolore quaerat.', '2015-07-30 00:43:30'),
(226, 65, 'Mollitia est nihil pariatur voluptatum corrupti.', '2016-09-01 05:53:34'),
(227, 61, 'Delectus labore voluptate autem.', '2016-06-26 10:57:05'),
(228, 63, 'Accusantium commodi vero illo eveniet veniam.', '2015-01-10 00:01:44'),
(229, 94, 'Aperiam maiores nemo reprehenderit.', '2015-10-21 03:09:55'),
(230, 86, 'Sunt recusandae optio incidunt aperiam.', '2016-09-28 13:01:01'),
(231, 80, 'Eveniet autem esse explicabo.', '2016-04-22 04:45:33'),
(232, 39, 'Recusandae exercitationem velit fugiat maxime sunt', '2015-08-23 03:25:14'),
(233, 49, 'Similique autem nobis dolor.', '2015-06-29 05:59:30'),
(234, 91, 'Cupiditate perspiciatis dolore nisi voluptate.', '2016-01-18 21:12:20'),
(235, 8, 'Veritatis eos quasi voluptates.', '2015-09-04 19:10:55'),
(236, 37, 'Repudiandae reprehenderit quaerat eos officiis.', '2016-01-18 21:23:53'),
(237, 88, 'Pariatur impedit provident impedit.', '2016-03-23 00:09:46'),
(238, 40, 'Debitis pariatur aliquam illo sapiente ex.', '2016-01-29 06:25:56'),
(239, 22, 'Accusamus unde rerum provident cumque sunt recusan', '2015-04-14 14:49:09'),
(240, 50, 'Ullam accusamus nulla accusantium voluptas neque q', '2016-02-11 08:34:28'),
(241, 24, 'Vero aut corporis corporis.', '2016-07-28 07:47:45'),
(242, 34, 'Magni eveniet et culpa.', '2016-06-29 23:43:26'),
(243, 45, 'Sequi nemo adipisci numquam quaerat necessitatibus', '2015-10-04 21:16:04'),
(244, 77, 'Eaque voluptatum reiciendis aperiam excepturi volu', '2015-04-17 01:44:05'),
(245, 65, 'Voluptate adipisci dolores est odit eveniet.', '2015-06-25 02:16:18'),
(246, 10, 'Eum ut amet reprehenderit distinctio quibusdam seq', '2016-03-11 22:15:37'),
(247, 88, 'Quisquam quis repellendus enim fugiat.', '2015-11-26 17:48:25'),
(248, 61, 'Consequatur iste accusamus sit velit.', '2015-10-12 14:20:22'),
(249, 33, 'Perspiciatis in tempora numquam magnam iste reicie', '2015-02-21 14:29:52'),
(250, 95, 'Exercitationem blanditiis ducimus tempora laborum ', '2016-04-16 21:11:45'),
(251, 67, 'Dolores possimus fuga voluptates possimus praesent', '2016-04-01 00:04:50'),
(252, 34, 'Saepe nobis dolorum vitae.', '2015-10-04 07:20:04'),
(253, 10, 'Impedit consectetur dolores tempora corporis.', '2015-09-22 03:43:25'),
(254, 81, 'Quisquam id magnam distinctio.', '2015-02-19 06:52:42'),
(255, 91, 'Eum error deleniti ut cumque pariatur deserunt.', '2016-02-29 07:31:06'),
(256, 26, 'Facere fuga magnam unde officia harum sed.', '2016-06-14 20:40:38'),
(257, 4, 'Architecto quam velit ratione expedita deserunt li', '2015-12-31 03:13:36'),
(258, 39, 'Illum eligendi at earum est laudantium possimus.', '2015-05-29 03:21:39'),
(259, 34, 'Quos perferendis eligendi reiciendis molestiae eve', '2015-03-02 06:24:20'),
(260, 72, 'Pariatur maiores necessitatibus eius.', '2015-10-11 12:03:15'),
(261, 27, 'Placeat tempore aliquid magnam beatae.', '2015-11-25 08:45:16'),
(262, 29, 'Ea soluta natus perferendis quod nulla.', '2015-03-06 04:48:22'),
(263, 66, 'Veritatis molestiae culpa quae cupiditate.', '2015-11-13 18:39:02'),
(264, 77, 'Placeat ducimus inventore aperiam nisi cum accusan', '2015-07-14 07:49:07'),
(265, 23, 'Vitae praesentium quam ipsam similique perspiciati', '2015-05-12 21:25:27'),
(266, 24, 'Qui commodi ipsam laudantium repudiandae quis dict', '2015-09-02 18:10:38'),
(267, 25, 'Molestiae deleniti tempora voluptate corrupti poss', '2015-04-05 17:41:41'),
(268, 72, 'Doloribus perferendis recusandae reprehenderit adi', '2016-09-29 10:54:29'),
(269, 57, 'Soluta deserunt nihil architecto voluptatibus accu', '2015-12-11 05:12:33'),
(270, 66, 'Voluptatum architecto corrupti deserunt.', '2016-08-26 00:48:42'),
(271, 87, 'Inventore quaerat ducimus eos vel unde.', '2016-03-01 04:38:37'),
(272, 4, 'Provident doloremque odio accusantium.', '2015-03-21 19:18:21'),
(273, 73, 'Laudantium id odit commodi dolores.', '2015-06-05 07:11:49'),
(274, 51, 'Omnis eveniet molestiae laudantium inventore rem.', '2015-03-22 10:40:24'),
(275, 4, 'Consequuntur tempora nemo et hic ratione.', '2016-09-04 08:45:19'),
(276, 37, 'Velit veritatis hic laboriosam quia blanditiis.', '2015-12-20 22:45:02'),
(277, 34, 'Laboriosam officia eum impedit debitis qui.', '2016-05-11 07:49:48'),
(278, 48, 'Consequuntur quo fuga quaerat maiores officiis vol', '2015-02-26 14:03:55'),
(279, 84, 'Saepe consectetur consequuntur fuga.', '2016-08-04 20:02:28'),
(280, 37, 'Ipsa nemo possimus aliquam corrupti libero.', '2016-08-11 21:45:15'),
(281, 18, 'Sint debitis labore provident temporibus expedita.', '2016-04-19 15:48:10'),
(282, 79, 'Quam rem corporis beatae dolor.', '2016-08-05 22:45:39'),
(283, 17, 'Est illum rem aut a perspiciatis aliquid a.', '2015-07-20 10:04:30'),
(284, 3, 'Impedit recusandae optio dicta nesciunt quis.', '2015-07-03 02:13:57'),
(285, 29, 'Cum vitae explicabo porro magni magni unde.', '2015-02-26 13:55:17'),
(286, 63, 'Distinctio possimus soluta ducimus.', '2015-06-10 16:17:41'),
(287, 51, 'Nam necessitatibus ea iure odit natus.', '2015-07-25 14:36:00'),
(288, 48, 'Quisquam rerum aperiam molestiae sint ipsa ab.', '2015-11-10 16:24:28'),
(289, 84, 'Beatae nostrum dignissimos iusto occaecati.', '2015-10-03 11:12:18'),
(290, 51, 'Dignissimos cupiditate dolorem laboriosam error de', '2015-01-31 03:27:17'),
(291, 10, 'Natus necessitatibus qui saepe quo.', '2016-07-22 08:29:56'),
(292, 44, 'Nesciunt non rerum animi accusantium necessitatibu', '2015-09-23 19:38:27'),
(293, 15, 'Eligendi porro voluptatem adipisci magnam odio.', '2016-03-22 13:09:30'),
(294, 34, 'Dolore commodi corporis quibusdam.', '2016-05-11 17:57:38'),
(295, 56, 'Adipisci aperiam sunt nobis.', '2015-12-25 07:48:30'),
(296, 21, 'Nemo doloremque placeat esse odit expedita deserun', '2016-06-17 22:22:48'),
(297, 13, 'Quisquam tenetur repellat hic.', '2015-05-13 19:31:17'),
(298, 30, 'Eaque praesentium natus at modi sit molestias.', '2015-06-10 10:12:17'),
(299, 75, 'Suscipit nisi cupiditate magni.', '2015-07-12 00:44:11'),
(300, 84, 'Dicta labore sed accusantium aperiam.', '2015-11-25 08:23:04'),
(301, 85, 'Dolorem temporibus harum modi officiis.', '2015-01-19 04:02:54'),
(302, 52, 'Eligendi quos et commodi aliquam.', '2016-03-21 22:33:33'),
(303, 95, 'Est doloremque architecto dolorum dicta quisquam a', '2015-04-16 15:16:21'),
(304, 59, 'Impedit perspiciatis quasi explicabo natus eius.', '2015-11-08 02:28:25'),
(305, 22, 'Tempore autem expedita quasi dolorem.', '2015-03-22 06:11:13'),
(306, 51, 'Facilis quod aperiam adipisci voluptatibus asperna', '2015-05-20 13:49:04'),
(307, 42, 'Fugit minus voluptate asperiores molestiae recusan', '2016-06-23 02:05:03'),
(308, 80, 'Quas accusantium qui enim.', '2015-01-12 08:36:10'),
(309, 32, 'Beatae nisi nobis nisi.', '2016-07-17 22:22:50'),
(310, 26, 'Assumenda facere omnis ut laborum.', '2015-05-30 23:01:28'),
(311, 27, 'Voluptates vel aspernatur doloremque.', '2015-04-05 21:05:39'),
(312, 81, 'Nulla quam reiciendis earum velit.', '2015-08-09 22:24:56'),
(313, 34, 'Natus dolores numquam sapiente quae.', '2016-07-08 13:57:49'),
(314, 99, 'Ullam harum eos aperiam.', '2016-07-15 14:19:53'),
(315, 3, 'Id dolorum aut reprehenderit in.', '2016-02-19 18:31:31'),
(316, 37, 'Iusto libero velit eaque est dolore.', '2016-07-11 21:11:19'),
(317, 54, 'Nam fugiat iure laboriosam.', '2016-04-30 13:07:19'),
(318, 90, 'Temporibus praesentium sapiente mollitia molestiae', '2015-02-15 02:48:01'),
(319, 25, 'Accusamus at iure vel sequi nobis.', '2015-08-22 21:25:59'),
(320, 90, 'Deserunt veritatis debitis fugit possimus minus il', '2015-11-24 21:19:55'),
(321, 33, 'Cupiditate culpa distinctio ab.', '2016-06-16 21:10:25'),
(322, 51, 'Dignissimos magnam consequatur odit.', '2015-08-18 03:01:13'),
(323, 91, 'Itaque totam ratione architecto consequuntur autem', '2016-02-25 17:05:09'),
(324, 86, 'Aliquam perferendis quas consectetur accusantium e', '2015-01-06 06:37:49'),
(325, 46, 'Perspiciatis hic totam facere.', '2015-03-21 18:56:28'),
(326, 37, 'Voluptatem molestias quos unde architecto.', '2015-11-23 16:45:55'),
(327, 32, 'Velit cum dicta hic ea quisquam.', '2016-07-17 01:42:36'),
(328, 48, 'Nulla libero maiores nam rem.', '2015-07-31 05:51:52'),
(329, 89, 'Vero quibusdam quae dolores.', '2015-07-11 17:42:53'),
(330, 53, 'Rem perspiciatis ab ullam necessitatibus atque.', '2015-03-06 01:12:54'),
(331, 100, 'Illo earum odio atque veritatis expedita.', '2015-12-01 11:56:15'),
(332, 22, 'Quae dolor tempore laborum aut accusamus corporis.', '2016-06-20 06:49:41'),
(333, 100, 'Repudiandae dolorem exercitationem quas corporis i', '2015-11-21 12:25:11'),
(334, 82, 'Magnam repellat dolore mollitia maxime.', '2016-08-31 21:02:35'),
(335, 36, 'Eligendi aut odit pariatur repellat porro eos.', '2015-05-25 06:49:51'),
(336, 89, 'Doloribus nihil nam earum sapiente.', '2015-03-10 14:23:45'),
(337, 56, 'Voluptates voluptate corrupti odit consectetur tem', '2016-01-07 11:23:03'),
(338, 13, 'Veritatis temporibus quos placeat.', '2016-01-15 11:37:28'),
(339, 27, 'Et reprehenderit voluptate consequuntur laborum.', '2015-06-13 21:11:15'),
(340, 23, 'Voluptatibus tempora quidem fugit dolores.', '2016-08-27 09:26:35'),
(341, 53, 'Natus dolorum quod debitis.', '2015-01-16 15:24:18'),
(342, 48, 'Magnam similique laboriosam adipisci illo.', '2015-02-04 07:54:14'),
(343, 78, 'Quia odit iste exercitationem harum nesciunt labor', '2015-03-19 10:37:32'),
(344, 34, 'Quo pariatur repellendus eaque nihil dignissimos q', '2016-01-15 23:27:22'),
(345, 30, 'Explicabo mollitia quia quae molestiae sint ex.', '2015-11-24 12:58:56'),
(346, 62, 'Itaque nisi non dolor assumenda.', '2016-04-09 21:17:16'),
(347, 78, 'Natus ipsa iste recusandae sed.', '2015-06-08 13:19:53'),
(348, 11, 'Optio dolor repudiandae tenetur veniam.', '2016-02-07 08:25:09'),
(349, 31, 'Distinctio autem enim beatae magni.', '2016-06-13 09:21:14');

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
(6, 11),
(7, 20),
(8, 30),
(9, 40),
(10, 50),
(11, 60),
(12, 70),
(13, 80),
(14, 90),
(15, 100),
(16, 110),
(17, 120),
(18, 130),
(19, 140),
(20, 150),
(21, 160),
(22, 170),
(23, 180),
(24, 190),
(25, 200),
(26, 210),
(27, 220),
(28, 230),
(29, 240),
(30, 250),
(31, 260),
(32, 270),
(33, 280),
(34, 290),
(35, 300),
(36, 310),
(37, 320),
(38, 330),
(39, 340);

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
(6, 1),
(7, 5),
(8, 1),
(9, 2),
(10, 5),
(11, 5),
(12, 5),
(13, 4),
(14, 2),
(15, 2),
(16, 4),
(17, 3),
(18, 3),
(19, 2),
(20, 5),
(21, 4),
(22, 1),
(23, 5),
(24, 4),
(25, 1),
(26, 5),
(27, 1),
(28, 3),
(29, 2),
(30, 3),
(31, 3),
(32, 2),
(33, 1),
(34, 2),
(35, 4),
(36, 1),
(37, 5),
(38, 1),
(39, 4);

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
(5, 'John', '101 E Taylor St', 'San Jose', 330, '95112'),
(6, 'Lisa Daugherty', '9065 Amanda Spring', 'Port Frederick', 1, '49327'),
(7, 'Melissa Randall', '722 Roberts Drives', 'New Albert', 1, '44869'),
(8, 'Kristina Perkins', '833 Pennington Court', 'East Cynthia', 8, '03616'),
(9, 'Connor Murphy', '59669 Young Trail', 'North Gloria', 6, '25772'),
(10, 'Phillip Jones', '639 Warren Gateway', 'West Douglas', 6, '90527'),
(11, 'Todd Boyd', '99241 Wright Corner', 'West Josephview', 2, '16760'),
(12, 'Ashley Walsh', '295 Ashley Circles Apt. 312', 'Amandafort', 2, '98022'),
(13, 'Michael Wood', '85793 Patricia Field', 'Richardport', 4, '83214'),
(14, 'Joshua Alexander', '479 Hernandez Ranch Suite 794', 'Port Judyview', 9, '09382'),
(15, 'Candace Powell', '087 Ryan Pine', 'Ericton', 2, '48478'),
(16, 'Shannon Smith', '507 Drew Passage', 'Branchburgh', 6, '16754'),
(17, 'Michele Anderson', '632 Bailey Cliff Suite 826', 'New Lisa', 1, '42380'),
(18, 'Kristina Davis', '4604 Brewer Plaza Apt. 006', 'New Aprilfurt', 7, '72308'),
(19, 'Charles Robinson', '579 William Island', 'East Stephanie', 3, '46141'),
(20, 'Paul Jones', '898 Tonya Ways Suite 595', 'New Jared', 3, '91627'),
(21, 'Emma Fitzpatrick', '9228 Torres Terrace', 'West Kimberly', 6, '20114'),
(22, 'David Zimmerman', '67144 Harris Spurs Suite 986', 'Conradberg', 4, '46301'),
(23, 'Sharon Hubbard', '604 Christopher Estate', 'East Melindaberg', 1, '54120'),
(24, 'Kyle Cole', '858 Stacy Turnpike Apt. 349', 'Riverashire', 4, '05198'),
(25, 'Shelly Hobbs', '5456 Hale Shore', 'East Gregory', 7, '57304'),
(26, 'Dana Hines', '08836 Robert Brooks Apt. 892', 'South Alicia', 7, '86777'),
(27, 'Rhonda Kramer', '6810 Skinner Roads Suite 831', 'Port Joshua', 1, '62122'),
(28, 'Jody Rodriguez', '857 Kennedy Junctions Suite 001', 'Jacobbury', 8, '26275'),
(29, 'Patrick King', '0951 Megan Squares', 'Edwardsborough', 3, '86301'),
(30, 'Jeremy Simmons', '0479 Mason Junctions Apt. 367', 'Brianmouth', 6, '08525'),
(31, 'Taylor Walker', '238 Christian Lane Suite 300', 'Meganborough', 5, '70431'),
(32, 'Tracy Smith', '6266 Espinoza Prairie', 'Aguirreborough', 8, '43949'),
(33, 'Brian Williams', '1316 Jason Ranch Apt. 126', 'Nicholasmouth', 4, '31054'),
(34, 'Tamara Griffin', '379 Pamela Path Apt. 749', 'North Steven', 6, '81372'),
(35, 'Kenneth Turner', '6843 Bowman Parkways Apt. 983', 'Lake Christopherburgh', 5, '76323'),
(36, 'Lisa Murray', '9978 William Stravenue Apt. 582', 'East Corey', 2, '58858'),
(37, 'Kenneth Harris', '108 Hopkins Row Suite 392', 'Port Kevinland', 4, '47927'),
(38, 'Wayne Sullivan', '220 Laura Bridge Suite 139', 'Ronaldborough', 8, '90789'),
(39, 'Stephanie Chang', '5495 Randy Parkways', 'Lauraport', 9, '90833'),
(40, 'Theresa Schmidt', '829 Michael Dam', 'Bethshire', 2, '14023'),
(41, 'Michelle Williams', '87116 Farley Union', 'Carneyberg', 6, '46345'),
(42, 'William Ward', '33441 Sharp Forge Suite 653', 'Joshuaside', 4, '63506'),
(43, 'Cameron Green', '013 King Cliffs', 'North George', 1, '79534'),
(44, 'Andrew Martinez', '2196 Stephen Terrace', 'Pittmanshire', 1, '32066'),
(45, 'Richard Miller', '680 Baker Manors', 'Moraland', 4, '55001'),
(46, 'Tommy Horton', '21654 Anthony Lodge Apt. 917', 'Taylorside', 9, '38409'),
(47, 'Sara Miller', '340 Huerta Lane', 'Hallside', 6, '50641'),
(48, 'Jeffrey Swanson', '2833 Jimenez Square', 'Johnburgh', 9, '20682'),
(49, 'Ryan Parks', '251 Dillon Pass Suite 005', 'Smithshire', 4, '35375'),
(50, 'Dale Randolph', '5695 Johnson Passage', 'New Brandibury', 8, '25036'),
(51, 'Rose Morrison', '3392 Clark Shoal', 'North William', 6, '50475'),
(52, 'Kelly Frank', '625 Kelly Lane', 'New Elizabeth', 3, '31654'),
(53, 'Brett Nichols', '0890 Elijah Forge Apt. 108', 'Lindseymouth', 6, '52532'),
(54, 'Stephanie Abbott', '38057 Wood Squares', 'Lake Markburgh', 7, '12396'),
(55, 'Amanda Solis', '39817 Thornton Plains', 'Morganborough', 8, '75190'),
(56, 'Tina Cox', '192 Carney Hill', 'Reedview', 4, '53568'),
(57, 'Robert Robinson', '38054 Pamela Ville Suite 162', 'Mcintoshshire', 9, '65420'),
(58, 'Kyle Flores', '75625 Patterson Run', 'Willieview', 8, '56182'),
(59, 'John Gaines', '79751 Matthew Street Suite 759', 'South Katie', 9, '14520'),
(60, 'Samantha Cole', '973 Curry Locks Suite 993', 'Carlsonberg', 4, '39004'),
(61, 'William Ibarra', '571 Robert Burgs', 'Ortizview', 2, '67426'),
(62, 'Randy Jones', '7746 King Dam Apt. 513', 'Port Brittney', 9, '86182'),
(63, 'Melissa Smith', '5862 Robert Crest Suite 651', 'Parkerland', 4, '31192'),
(64, 'John Clark', '81416 Chris Village Suite 994', 'Gomezside', 4, '22426'),
(65, 'Natalie Dixon', '21408 Cathy Pike', 'New Matthew', 6, '29387'),
(66, 'Lori Ellis', '0384 Scott Park', 'East Markhaven', 7, '12352'),
(67, 'Kimberly Walton', '992 Jones Heights', 'Griffinhaven', 2, '18097'),
(68, 'Heather Hill', '228 Patricia Coves Apt. 750', 'Youngstad', 4, '39621'),
(69, 'Clifford Huerta', '558 David Stream Apt. 527', 'South Shannonmouth', 4, '87605'),
(70, 'Kiara Sullivan', '562 Thomas Parkway Apt. 147', 'West Mary', 4, '59218'),
(71, 'Jacob Gutierrez', '827 Carl Light Apt. 593', 'West Katherine', 5, '07777'),
(72, 'William English', '1595 Robert Groves', 'Laceyburgh', 7, '57591'),
(73, 'William Jones', '826 Williams Ports', 'New Timothyhaven', 4, '01880'),
(74, 'Austin Morris', '703 Cody Valleys', 'West Morganberg', 8, '77198'),
(75, 'Michael Parker', '608 Aguilar Village Apt. 438', 'New Robertchester', 9, '11365'),
(76, 'Mrs. Robin Boyer', '9239 David Ways Suite 745', 'Edwardmouth', 1, '94322'),
(77, 'Rebecca Wilson', '2400 Jessica Villages', 'Lake Rodneyville', 3, '11260'),
(78, 'Phillip Gillespie', '133 John Viaduct', 'Davisstad', 4, '09904'),
(79, 'Bobby Clark', '53921 Amy Rapid Suite 897', 'Crystalmouth', 3, '27561'),
(80, 'Eric Trujillo', '35081 Gabriela Springs', 'Davidbury', 8, '98085'),
(81, 'Bradley Huynh', '09490 Christian Spur Apt. 325', 'Lake Tina', 8, '01617'),
(82, 'Jay Gomez', '774 Jeffrey Roads Apt. 279', 'East Jessicaview', 8, '56235'),
(83, 'Karen Patrick', '128 Fisher Orchard', 'Morganstad', 7, '74127'),
(84, 'Billy Buckley', '0049 Teresa Tunnel', 'Port Jacqueline', 6, '83284'),
(85, 'Daniel Terry', '33529 Hudson Haven Suite 476', 'Ronaldhaven', 2, '55127'),
(86, 'Daniel Hendricks', '98820 Simpson Heights Apt. 715', 'Mariafort', 2, '53935'),
(87, 'Tiffany Norman', '60705 Ho Inlet Apt. 674', 'Gibsonburgh', 2, '86820'),
(88, 'Lori Walsh', '0630 Angela Loaf Apt. 392', 'New Veronica', 6, '05236'),
(89, 'Michael Riley', '795 Wright Trail Suite 275', 'Port Leahchester', 9, '86865'),
(90, 'Elizabeth Newman', '8263 Lynn Creek', 'Dennisville', 1, '90636'),
(91, 'Patricia Arellano', '34612 Savage Brooks Apt. 420', 'Juliehaven', 6, '71397'),
(92, 'Brian Wheeler', '25989 Smith Way', 'South Dylanshire', 3, '46099'),
(93, 'Steven Williams', '5944 Wendy Light Apt. 005', 'Stephenshire', 6, '47501'),
(94, 'Jesus Perez', '503 Dennis Circles Suite 380', 'Cantuside', 4, '44591'),
(95, 'Angela Oneill', '35513 Green Village Suite 560', 'East Seth', 6, '60330'),
(96, 'James Jackson', '33922 Mason Mount', 'Lake Geoffreybury', 6, '28863'),
(97, 'Nicole Murphy', '37419 Ashley Drive Apt. 972', 'East Loriton', 5, '81689'),
(98, 'Janice Johnson', '323 Lee Junctions Apt. 215', 'Jenningston', 1, '44299'),
(99, 'Jared Hernandez', '817 Lindsay River Suite 328', 'Byrdchester', 4, '44049'),
(100, 'Carol Horton', '33876 Danielle Ranch', 'New Nicoleborough', 6, '85065');

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
('adamsbrandon@yahoo.com', 26),
('allisonosborne@yahoo.com', 97),
('andrew27@lang.com', 86),
('andrew67@gonzalez.com', 39),
('annbarnett@lynch.com', 91),
('apoorv.patel@sjsu.edu', 1),
('bethchapman@day.com', 36),
('bharper@yahoo.com', 90),
('blankenshipjames@yahoo.com', 18),
('bperez@gmail.com', 41),
('bradley23@perry.org', 81),
('brennanjulia@gmail.com', 23),
('brian46@hotmail.com', 94),
('bruce44@duffy.com', 45),
('cameron87@yahoo.com', 57),
('candice20@yahoo.com', 62),
('carlahernandez@dixon-keller.com', 8),
('carolynandrews@johnson.info', 12),
('charleswilson@hotmail.com', 15),
('christopherdavis@smith.info', 29),
('curtissutton@gmail.com', 31),
('dana96@hotmail.com', 75),
('danielcruz@luna-walters.com', 21),
('danielmartinez@carroll.com', 84),
('darias@green-torres.com', 7),
('davidstanton@stone-williams.com', 56),
('debragutierrez@yahoo.com', 27),
('erikturner@fitzpatrick.com', 89),
('esparzatina@ramirez.biz', 28),
('fsanchez@mitchell.biz', 58),
('graysavannah@bates-jones.com', 60),
('gregoryyork@gmail.com', 83),
('hernandezbrandi@russell.com', 88),
('hilldanielle@gmail.com', 96),
('hobbsandrew@hotmail.com', 49),
('houstoncarlos@davila.com', 55),
('jacobcrawford@pacheco-rose.biz', 68),
('jason27@evans-brown.com', 34),
('jennifer98@hotmail.com', 40),
('jeremiah62@gmail.com', 44),
('jessicaburton@olson.com', 30),
('john.smith@sjsu.edu', 5),
('josesnyder@palmer-malone.com', 63),
('katrinataylor@mcgrath.net', 85),
('kelleyscott@yahoo.com', 46),
('kellymills@guzman.net', 87),
('kjennings@silva.com', 69),
('kristinaleonard@hotmail.com', 70),
('kwilliams@sanders.com', 92),
('laurentorres@carter.info', 32),
('lindacontreras@brown.net', 17),
('lmiller@cox.com', 47),
('lozanopatricia@walker.com', 54),
('lwalker@short.com', 24),
('lwilliams@schneider.com', 25),
('margaret93@anderson.com', 99),
('mcdonaldjorge@williams-davis.net', 6),
('michaelkeith@warner.com', 35),
('michelle47@rubio-ibarra.com', 16),
('michelletucker@bond.net', 72),
('moorebrian@gmail.com', 13),
('morseantonio@yahoo.com', 67),
('muellernicole@allen.info', 42),
('murphyamy@yahoo.com', 22),
('ogarza@yahoo.com', 79),
('omiller@yahoo.com', 78),
('patelapoorv9990@gmail.com', 1),
('patrickbrooks@hotmail.com', 37),
('paul12@yahoo.com', 66),
('paul56@mccoy.com', 74),
('pdunn@gmail.com', 38),
('perryjamie@hotmail.com', 43),
('petersoncody@harris.com', 20),
('phillipsjessica@dudley.com', 93),
('plambert@donaldson.com', 61),
('pratik.vyas@sjsu.edu', 3),
('rachelgibson@sherman.com', 53),
('ramirezgina@clark-pearson.info', 51),
('randall30@mitchell-carroll.com', 59),
('raymond92@gmail.com', 80),
('rcarroll@gmail.com', 19),
('robersonjennifer@reese-howard.com', 65),
('robertmartinez@hall.com', 64),
('robertshah@hotmail.com', 73),
('shawcourtney@hotmail.com', 98),
('skanda.bhargav@sjsu.edu', 4),
('slang@yahoo.com', 95),
('smithbrian@adkins-foster.com', 14),
('smithcody@yahoo.com', 82),
('tacosta@lawrence.com', 9),
('thomastanner@evans-barnes.com', 71),
('tlara@hotmail.com', 11),
('toddmitchell@hotmail.com', 76),
('trodriguez@gmail.com', 50),
('tugce.akin@sjsu.edu', 2),
('valeriesanders@yahoo.com', 48),
('veronicagutierrez@lopez.biz', 100),
('wadewilliam@hale.net', 33),
('wileyjoshua@yahoo.com', 77),
('yateselizabeth@gmail.com', 10),
('zdavis@brown-jones.info', 52);

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
(9, 3, 6),
(10, 91, 285),
(11, 78, 331),
(12, 18, 329),
(13, 5, 278),
(14, 49, 106),
(15, 58, 204),
(16, 89, 118),
(17, 86, 236),
(18, 28, 148),
(19, 39, 270),
(20, 15, 41),
(21, 93, 282),
(22, 93, 173),
(23, 5, 48),
(24, 37, 262),
(25, 57, 127),
(26, 38, 251),
(27, 14, 190),
(28, 76, 42),
(29, 35, 309),
(31, 17, 293),
(32, 39, 284),
(33, 64, 344),
(34, 30, 22),
(35, 12, 206),
(36, 17, 339),
(37, 73, 56),
(38, 64, 191),
(39, 17, 345),
(40, 93, 182),
(41, 81, 157),
(42, 56, 297),
(43, 27, 154),
(44, 37, 15),
(45, 4, 86),
(46, 100, 25),
(47, 21, 238),
(48, 86, 98),
(49, 69, 196),
(50, 56, 41),
(51, 51, 189),
(52, 48, 35),
(53, 84, 321),
(54, 12, 322),
(55, 91, 138),
(56, 16, 46),
(57, 24, 26),
(58, 55, 173),
(59, 64, 108),
(60, 67, 343),
(61, 87, 216),
(62, 43, 194),
(63, 13, 206),
(64, 16, 263),
(65, 70, 43),
(66, 57, 169),
(67, 77, 161),
(68, 85, 219),
(69, 69, 333),
(70, 17, 329),
(71, 7, 162),
(72, 23, 110),
(73, 9, 268),
(74, 52, 270),
(75, 46, 25),
(76, 35, 192),
(77, 44, 78),
(78, 85, 159),
(79, 61, 247),
(80, 27, 94),
(81, 84, 321),
(82, 81, 223),
(83, 71, 192),
(84, 43, 64),
(85, 39, 209),
(86, 1, 313),
(87, 69, 147),
(88, 15, 78),
(89, 55, 242),
(90, 41, 196),
(91, 55, 249),
(92, 4, 253),
(93, 12, 3),
(94, 41, 65),
(95, 43, 143),
(96, 29, 41),
(97, 51, 65),
(98, 35, 348),
(99, 63, 293),
(100, 61, 331);

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
-- Indexes for table `correct_answers`
--
ALTER TABLE `correct_answers`
  ADD KEY `question_id` (`question_id`),
  ADD KEY `answer_id` (`answer_id`),
  ADD KEY `question_user_id` (`question_user_id`),
  ADD KEY `answer_user_id` (`answer_user_id`),
  ADD KEY `tag_id` (`tag_id`),
  ADD KEY `question_calendar_id` (`question_calendar_id`),
  ADD KEY `answer_calendar_id` (`answer_calendar_id`);

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
  MODIFY `number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
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
-- Constraints for table `correct_answers`
--
ALTER TABLE `correct_answers`
  ADD CONSTRAINT `answer_calendar_id` FOREIGN KEY (`answer_calendar_id`) REFERENCES `calendar` (`id`),
  ADD CONSTRAINT `answer_id` FOREIGN KEY (`answer_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `answer_user_id` FOREIGN KEY (`answer_user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `question_calendar_id` FOREIGN KEY (`question_calendar_id`) REFERENCES `calendar` (`id`),
  ADD CONSTRAINT `question_id` FOREIGN KEY (`question_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `question_user_id` FOREIGN KEY (`question_user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

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
