-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Aug 01, 2016 at 09:19 PM
-- Server version: 5.5.49-cll-lve
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `adcapila_thechua`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'Dao The Hoang', 'daothehoang@gmail.com', '$2y$10$E8ozHlt.VgO112Qv9rLtaeITUAsSSmCZ9UUao.QJJURkta2Kj9W7S', 0, 'Q50Jkst2WSldZf8uDava9lrkXRttnXAhgYhocdaCmGk8K48PX3QSNiELxx3h', '2016-05-20 04:06:53', '2016-05-30 21:23:34');

-- --------------------------------------------------------

--
-- Table structure for table `clicks`
--

CREATE TABLE IF NOT EXISTS `clicks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offerId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `port` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `protocol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hostname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `userAgent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `trackingId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=59 ;

--
-- Dumping data for table `clicks`
--

INSERT INTO `clicks` (`id`, `offerId`, `uid`, `ip`, `port`, `protocol`, `hostname`, `userAgent`, `trackingId`, `created_at`, `updated_at`) VALUES
(1, 'bHRvs0', 'X0YHOP', '116.111.222.228', '37814', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'bW4lE9', '2016-06-22 20:41:44', '2016-06-22 20:41:44'),
(2, 'Mtv0fz', 'X0YHOP', '116.111.222.228', '37989', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'OVcKxp', '2016-06-22 20:41:54', '2016-06-22 20:41:54'),
(3, 'KO9Ab6', 'X0YHOP', '173.252.90.90', '38881', 'HTTP/1.1', 'thechua.vn', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'Hs9Luc', '2016-06-22 20:42:36', '2016-06-22 20:42:36'),
(4, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '42156', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'RcTsFr', '2016-06-22 20:43:56', '2016-06-22 20:43:56'),
(5, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '42624', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'jJloWC', '2016-06-22 20:44:08', '2016-06-22 20:44:08'),
(6, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '42682', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'FenIdJ', '2016-06-22 20:44:09', '2016-06-22 20:44:09'),
(7, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '43395', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'GDSdqt', '2016-06-22 20:44:25', '2016-06-22 20:44:25'),
(8, 'KO9Ab6', 'X0YHOP', '173.252.122.122', '44142', 'HTTP/1.1', 'thechua.vn', 'facebookexternalhit/1.1', 'D1zqRU', '2016-06-22 20:44:44', '2016-06-22 20:44:44'),
(9, 'KO9Ab6', 'X0YHOP', '66.220.152.37', '44236', 'HTTP/1.1', 'thechua.vn', 'facebookexternalhit/1.1', 'vV2wq1', '2016-06-22 20:44:47', '2016-06-22 20:44:47'),
(10, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '44633', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'j8L9hx', '2016-06-22 20:44:58', '2016-06-22 20:44:58'),
(11, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '44877', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'Dr1CYT', '2016-06-22 20:45:05', '2016-06-22 20:45:05'),
(12, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '46931', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'jNK4zA', '2016-06-22 20:45:55', '2016-06-22 20:45:55'),
(13, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '47013', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'hg7RUb', '2016-06-22 20:45:56', '2016-06-22 20:45:56'),
(14, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '48643', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '1tnhQq', '2016-06-22 20:46:35', '2016-06-22 20:46:35'),
(15, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '48738', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'Z1qrVj', '2016-06-22 20:46:37', '2016-06-22 20:46:37'),
(16, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '48787', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'J1NZ4U', '2016-06-22 20:46:38', '2016-06-22 20:46:38'),
(17, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '53369', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'Nyivg4', '2016-06-22 20:48:37', '2016-06-22 20:48:37'),
(18, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '53598', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'VDWGOH', '2016-06-22 20:48:46', '2016-06-22 20:48:46'),
(19, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '53691', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'vgoAWS', '2016-06-22 20:48:49', '2016-06-22 20:48:49'),
(20, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '58451', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'TCa0eh', '2016-06-22 20:50:37', '2016-06-22 20:50:37'),
(21, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '59085', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'zObGFW', '2016-06-22 20:50:48', '2016-06-22 20:50:48'),
(22, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '59911', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'Lgz8d0', '2016-06-22 20:51:03', '2016-06-22 20:51:03'),
(23, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '33482', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'M5loTI', '2016-06-22 20:51:43', '2016-06-22 20:51:43'),
(24, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '33667', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', 'RLa4lv', '2016-06-22 20:51:46', '2016-06-22 20:51:46'),
(25, 'KO9Ab6', 'X0YHOP', '116.111.222.228', '34103', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', 'AJBUrt', '2016-06-22 20:51:57', '2016-06-22 20:51:57'),
(26, 'bHRvs0', 'X0YHOP', '116.111.222.228', '39251', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'PtKpZN', '2016-06-22 20:53:49', '2016-06-22 20:53:49'),
(27, 'bHRvs0', 'X0YHOP', '116.111.222.228', '51684', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'jZoflJ', '2016-06-22 20:58:28', '2016-06-22 20:58:28'),
(28, 'bHRvs0', 'X0YHOP', '116.111.222.228', '41770', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'mRTvsK', '2016-06-23 03:51:47', '2016-06-23 03:51:47'),
(29, 'bHRvs0', 'X0YHOP', '116.111.222.228', '51303', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'o72tbg', '2016-06-25 18:47:52', '2016-06-25 18:47:52'),
(30, 'bHRvs0', 'X0YHOP', '14.175.131.142', '33015', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'CQfKOl', '2016-06-27 15:23:24', '2016-06-27 15:23:24'),
(31, 'bHRvs0', 'X0YHOP', '116.111.222.228', '58375', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13C75 Safari/601.1', 'rCKTek', '2016-06-28 04:08:09', '2016-06-28 04:08:09'),
(32, 'bHRvs0', 'FDBX1K', '17.200.11.44', '41809', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13F69 Safari/601.1', 'IbJgDq', '2016-06-29 14:47:08', '2016-06-29 14:47:08'),
(33, 'bHRvs0', 'X0YHOP', '116.111.222.228', '56819', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'EriyMk', '2016-06-29 19:13:40', '2016-06-29 19:13:40'),
(34, 'bHRvs0', 'X0YHOP', '116.111.222.228', '60850', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'Sv9Kz3', '2016-06-29 19:16:15', '2016-06-29 19:16:15'),
(35, 'bHRvs0', '1SX0KN', '116.111.222.228', '34635', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E230 Safari/601.1', 'dDqNtM', '2016-06-29 20:43:16', '2016-06-29 20:43:16'),
(36, 'bHRvs0', '1SX0KN', '116.111.222.228', '36102', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E230 Safari/601.1', 'OqkKdy', '2016-06-29 20:44:16', '2016-06-29 20:44:16'),
(37, 'KO9Ab6', '1SX0KN', '173.252.88.188', '39173', 'HTTP/1.1', 'thechua.vn', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'STO9t4', '2016-06-29 20:46:24', '2016-06-29 20:46:24'),
(38, 'KO9Ab6', '1SX0KN', '173.252.115.84', '39937', 'HTTP/1.1', 'thechua.vn', 'facebookexternalhit/1.1', 'O1r6dI', '2016-06-29 20:46:54', '2016-06-29 20:46:54'),
(39, 'bHRvs0', 'X0YHOP', '116.105.101.45', '57681', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13C75 Safari/601.1', 'YLSK70', '2016-06-30 01:29:49', '2016-06-30 01:29:49'),
(40, 'KO9Ab6', 'FDBX1K', '66.220.158.96', '46950', 'HTTP/1.1', 'thechua.vn', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 'GuBz70', '2016-06-30 16:08:39', '2016-06-30 16:08:39'),
(41, 'bHRvs0', 'FDBX1K', '17.200.11.44', '47320', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13F69 Safari/601.1', '7zTRZ5', '2016-06-30 16:08:56', '2016-06-30 16:08:56'),
(42, 'bHRvs0', 'X0YHOP', '116.105.101.45', '37057', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'AiKvXZ', '2016-06-30 18:10:45', '2016-06-30 18:10:45'),
(43, 'bHRvs0', 'X0YHOP', '116.105.101.45', '52540', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'ohKBGX', '2016-06-30 18:19:45', '2016-06-30 18:19:45'),
(44, 'bHRvs0', 'X0YHOP', '116.105.101.45', '53069', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'CSyAnM', '2016-06-30 18:20:03', '2016-06-30 18:20:03'),
(45, 'bHRvs0', 'X0YHOP', '116.105.101.45', '45583', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', '41mxz9', '2016-06-30 18:49:15', '2016-06-30 18:49:15'),
(46, 'bHRvs0', 'X0YHOP', '116.105.101.45', '45787', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'ajLTy1', '2016-06-30 18:49:21', '2016-06-30 18:49:21'),
(47, 'bHRvs0', 'X0YHOP', '116.105.101.45', '52340', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', '5mVpk9', '2016-06-30 18:53:44', '2016-06-30 18:53:44'),
(48, 'bHRvs0', 'X0YHOP', '116.105.101.45', '55646', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'ApUXPY', '2016-06-30 18:55:20', '2016-06-30 18:55:20'),
(49, 'bHRvs0', 'X0YHOP', '116.105.101.45', '36049', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'YejGsI', '2016-06-30 19:00:33', '2016-06-30 19:00:33'),
(50, 'bHRvs0', 'X0YHOP', '116.105.101.45', '38597', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'oRUDI1', '2016-06-30 19:02:18', '2016-06-30 19:02:18'),
(51, 'bHRvs0', 'X0YHOP', '116.105.101.45', '38865', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'duHDPR', '2016-06-30 19:02:27', '2016-06-30 19:02:27'),
(52, 'bHRvs0', 'X0YHOP', '116.105.101.45', '54810', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'YWS5Qs', '2016-06-30 19:13:05', '2016-06-30 19:13:05'),
(53, 'bHRvs0', 'X0YHOP', '116.105.101.45', '48603', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'KUYucx', '2016-06-30 19:26:20', '2016-06-30 19:26:20'),
(54, 'bHRvs0', 'X0YHOP', '116.105.101.45', '54915', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'vqH9ML', '2016-06-30 19:30:05', '2016-06-30 19:30:05'),
(55, 'bHRvs0', 'X0YHOP', '116.105.101.45', '55401', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', '8R16ND', '2016-06-30 19:30:24', '2016-06-30 19:30:24'),
(56, 'bHRvs0', 'X0YHOP', '116.105.101.45', '58591', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'LeixEa', '2016-06-30 19:32:12', '2016-06-30 19:32:12'),
(57, 'bHRvs0', 'X0YHOP', '116.105.101.45', '59121', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', '7vZyUp', '2016-06-30 19:32:25', '2016-06-30 19:32:25'),
(58, 'bHRvs0', 'X0YHOP', '116.105.101.45', '35484', 'HTTP/1.1', 'thechua.vn', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E238 Safari/601.1', 'CL2ME4', '2016-06-30 19:35:03', '2016-06-30 19:35:03');

-- --------------------------------------------------------

--
-- Table structure for table `congdiemevent`
--

CREATE TABLE IF NOT EXISTS `congdiemevent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idevent` int(11) NOT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `congdiemevent`
--

INSERT INTO `congdiemevent` (`id`, `idevent`, `uid`, `created_at`, `updated_at`) VALUES
(1, 2, 'Zr2P5a', '2016-01-11 18:06:12', '2016-05-05 22:13:00'),
(2, 2, 'Zr2P5a', '2016-06-11 20:06:15', '2016-05-05 22:13:01');

-- --------------------------------------------------------

--
-- Table structure for table `conversions`
--

CREATE TABLE IF NOT EXISTS `conversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `offerId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `trackingId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `point` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `conversions`
--

INSERT INTO `conversions` (`id`, `uid`, `offerId`, `trackingId`, `point`, `created_at`, `updated_at`) VALUES
(3, 'GflZAY', 'CmjZSi', 'instant', 5000, '2016-06-09 07:49:46', '2016-05-30 07:49:46'),
(5, 'Zr2P5a', 'JWfwra', 'instant', 5000, '2016-05-30 08:03:28', '2016-05-30 08:03:28'),
(6, 'Zr2P5a', 'gGikKa1', 'instant', 3000, '2016-05-30 08:03:46', '2016-05-30 08:03:46'),
(7, 'X0YHOP', 'bHRvs1', 'instant', 1200, '2016-06-30 19:27:13', '2016-06-30 19:27:13'),
(8, 'X0YHOP', 'bHRvs1', 'instant', 1200, '2016-06-30 19:30:32', '2016-06-30 19:30:32'),
(9, 'X0YHOP', 'bHRvs1', 'instant', 1200, '2016-06-30 19:32:34', '2016-06-30 19:32:34'),
(10, 'X0YHOP', 'bHRvs0', 'instant', 1200, '2016-06-30 19:35:25', '2016-06-30 19:35:25');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `cc`, `created_at`, `updated_at`) VALUES
(1, 'Viet Nam', 'VN', NULL, NULL),
(2, 'USA', 'US', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tensukien` text COLLATE utf8_unicode_ci NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8_unicode_ci NOT NULL,
  `point` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loaithes`
--

CREATE TABLE IF NOT EXISTS `loaithes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menhgia` int(11) NOT NULL,
  `url_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `loaithes`
--

INSERT INTO `loaithes` (`id`, `method`, `menhgia`, `url_image`, `status`) VALUES
(1, 'Viettel', 10000, 'http://a8.vietbao.vn/images/vn888/hot/v2014/best_4d8b682f00-1-img-1406450894-2.jpeg', 1),
(2, 'Viettel', 20000, 'http://a8.vietbao.vn/images/vn888/hot/v2014/best_4d8b682f00-1-img-1406450894-2.jpeg', 1),
(3, 'Viettel', 50000, 'http://a8.vietbao.vn/images/vn888/hot/v2014/best_4d8b682f00-1-img-1406450894-2.jpeg', 1),
(4, 'Mobifone', 10000, 'http://res.vtc.vn/media/vtcnews/2014/07/27/y-nghia-logo-Mobifone.jpg', 1),
(5, 'Mobifone', 20000, 'http://res.vtc.vn/media/vtcnews/2014/07/27/y-nghia-logo-Mobifone.jpg', 1),
(6, 'Mobifone', 50000, 'http://res.vtc.vn/media/vtcnews/2014/07/27/y-nghia-logo-Mobifone.jpg', 1),
(7, 'Vinaphone', 10000, 'http://www.thongtincongnghe.com/sites/default/files/images/2014/7/27/img-1406450894-3.jpg', 1),
(8, 'Vinaphone', 20000, 'http://www.thongtincongnghe.com/sites/default/files/images/2014/7/27/img-1406450894-3.jpg', 1),
(9, 'Vinaphone', 50000, 'http://www.thongtincongnghe.com/sites/default/files/images/2014/7/27/img-1406450894-3.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2016_03_31_062650_create_offers_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `offerId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deeplinking` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `typepromote` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cap` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `point` int(11) NOT NULL,
  `point_rrs` int(11) NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `cc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `offerId`, `name`, `deeplinking`, `typepromote`, `cap`, `url`, `point`, `point_rrs`, `imageUrl`, `OS`, `description`, `cc`, `status`, `created_at`, `updated_at`) VALUES
(2, 'KO9Ab6', 'SuperB Cleaner', 'com.igg.castleclash', 'incent', 99999, 'https://play.google.com/store/apps/details?id=com.hermes.superb.booster', 1200, 300, 'https://lh3.googleusercontent.com/1DgHNL48SN1x5Y6E0jMnGIbnLhYpnCTXIKL_qMzzClwPwq7Vsyc_ZIykj9n4PNW5HQ=w300', 'Android', 'Super B Cleaner can boost your phone to make phone faster by 50% and save battery by 20%. Enjoy the best Android and game experience, only at Super B Cleaner.\r\n\r\nAlbeit only 2 MB, Super B Cleaner is a small but effective memory boost tool and battery extender. It can clean unnecessary background apps to boost your phone and save battery power. With proper management, its one-tap boost can make phone faster by 50% and save battery power by 20%. Favored by users worldwide, Super B Cleaner is one of the best android booster for Android. ', 'VN', 1, '2016-06-22 20:23:16', '2016-06-29 20:46:10'),
(3, 'bHRvs0', 'Quốc Chiến Truyền Kỳ', 'com.gmt.quocchientruyenky://', 'instant', 99995, 'https://itunes.apple.com/us/app/quoc-chien-truyen-ky/id1108341542?mt=8', 1200, 300, 'http://2game.vn/xemanh/thumb.php?w=200&h=200&src=https://img.xtv.net.vn/images/2016/5/26/2game_logo_quoc_chien_truyen_ky_mobile_1.jpg', 'iOS', 'Quốc Chiến Truyền Kỳ đưa người chơi vào một thế giới võ hiêp với các đại anh hùng tranh ngôi đoạt vị, xưng bá võ lâm.Nếu từng say mê kiếm hiệp kim dung, Phong Vân, Cửu âm chân kinh chắc chắn bạn sẽ yêu thích tựa game này\r\nKhông chạy đua kỹ xảo, Quốc Chiến Truyền Kỳ tập trung vào các tính năng thú vị và quay lại với hình ảnh 2D nhưng vẫn thiết kế vô cùng đẹp mắt gây bồi hồi với nhiều game thủ 9x,8x.\r\nCác tính năng nổi bật, độc đáo:\r\n- Quốc chiến đoạt thành- Hàng nghìn game thủ cùng nhau công phá thành như những màn công thành chiến năm xưa\r\n- Chiến Liên Server – Những trận chiến càng thêm khốc liệt khi không giới hạn người tham gia\r\n- PK mãn nhã, sống lại cảm giác của Võ Lâm Truyền Kỳ và sự khốc liệt như Phong Vân\r\n- Tính năng giao dịch trở lại, các game thủ tự do buôn bán làm giàu\r\n- Vận Tiêu: Cải tiến vượt trội với các tính năng độc đáo\r\nHãy tham gia ngay Quốc Chiến Truyền Kỳ để được sống lại cảm giác hành tẩu giang hồ như thời Võ Lâm Truyền Kỳ. Các đại hiệp sẽ lại được tìm thấy những người bạn tri kỷ để cùng nhau gây dựng lên cộng đồng võ lâm thấm đậm tình người giống một thời vàng son của dòng game võ hiệp những năm 2000.', 'VN', 1, '2016-06-22 20:39:17', '2016-06-30 19:35:25');

-- --------------------------------------------------------

--
-- Table structure for table `redeems`
--

CREATE TABLE IF NOT EXISTS `redeems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `requestid` int(11) NOT NULL,
  `idloaithe` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE IF NOT EXISTS `requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `point` int(11) NOT NULL,
  `menhgia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `uid`, `method`, `point`, `menhgia`, `status`, `created_at`, `updated_at`) VALUES
(1, 'X0YHOP', 'Mobifone', 999999, '50000', 1, '2016-06-27 20:27:33', '2016-06-27 20:27:33'),
(2, 'X0YHOP', 'Viettel', 949999, '50000', 1, '2016-06-27 20:27:39', '2016-06-27 20:27:39'),
(3, 'X0YHOP', 'Mobifone', 906799, '10000', 1, '2016-06-30 19:41:11', '2016-06-30 19:41:11');

-- --------------------------------------------------------

--
-- Table structure for table `rrs`
--

CREATE TABLE IF NOT EXISTS `rrs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `offerId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shareevents`
--

CREATE TABLE IF NOT EXISTS `shareevents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `point` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_title_share` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_share` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_app_store` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_image_app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shareevents`
--

INSERT INTO `shareevents` (`id`, `title`, `noidung`, `point`, `link`, `content_title_share`, `content_share`, `url_app_store`, `url_image_app`, `created_at`, `updated_at`) VALUES
(1, 'Chia sẻ Thẻ Chùa', 'Chia sẻ Thẻ Chùa đến bạn bè bạn sẽ nhận được Xu khủng khi họ cài đặt ứng dụng và nhập mã giới thiệu của bạn.', 2000, 'http://google.com', 'Thẻ Chùa - Kiếm thẻ cào miễn phí hằng ngày!!!', 'Thẻ Chùa là ứng dụng kiếm thẻ cào hàng đầu tại Việt Nam. Với hệ thống chia sẻ, giới thiệu hấp dẫn, bạn có thể kiếm được hàng triệu đồng từ chúng Thẻ Chùa. \r\nTham gia ngay!', 'http://apple.com', 'https://pbs.twimg.com/profile_images/1261236202/TC_logo_Green_400x400.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thedienthoai`
--

CREATE TABLE IF NOT EXISTS `thedienthoai` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loaithe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menhgia` int(11) NOT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imei` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `thedienthoai`
--

INSERT INTO `thedienthoai` (`id`, `loaithe`, `menhgia`, `serial`, `imei`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Viettel', 10000, '1234567890123', '1234567890123', 1, '2016-06-30 19:37:32', '2016-06-30 19:37:32'),
(2, 'Mobifone', 10000, '1234567890120', '1234567890120', 1, '2016-06-30 19:37:42', '2016-06-30 19:37:42'),
(3, 'Vinaphone', 10000, '1234567890121', '1234567890121', 1, '2016-06-30 19:37:50', '2016-06-30 19:37:50'),
(4, 'Viettel', 20000, '1234567890124', '1234567890124', 1, '2016-06-30 19:38:09', '2016-06-30 19:38:09'),
(5, 'Mobifone', 20000, '1234567890125', '1234567890125', 1, '2016-06-30 19:38:25', '2016-06-30 19:38:25'),
(6, 'Vinaphone', 20000, '1234567890126', '1234567890126', 1, '2016-06-30 19:38:39', '2016-06-30 19:38:39'),
(7, 'Viettel', 50000, '1234567890127', '1234567890127', 1, '2016-06-30 19:38:53', '2016-06-30 19:38:53'),
(8, 'Mobifone', 50000, '1234567890128', '1234567890128', 1, '2016-06-30 19:39:04', '2016-06-30 19:39:04'),
(9, 'Vinaphone', 50000, '1234567890129', '1234567890129', 1, '2016-06-30 19:39:23', '2016-06-30 19:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebookId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `point` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `devicetoken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invitedBy` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `facebookId` (`facebookId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uid`, `facebookId`, `email`, `fullname`, `point`, `status`, `uuid`, `devicetoken`, `invitedBy`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'X0YHOP', '1583330648646584', 'daothehoangsp01@gmail.com', 'Đào Thế Hoàng', 896799, 1, '61296C7E-B541-4C58-920F-98CB17FE20D9', 'eabca7486041f1dc55b20caf03f33e3e72e0ba8abe00db05935dcb55801c31d4', '', 'CNH3l6zycM9wfuVePD2ZQsG1bXokdraL', '2016-06-22 19:26:42', '2016-06-22 19:26:42'),
(2, '1SX0KN', '843119969151948', 'huanco1009@gmail.com', 'Đào Minh Huấn', 2000, 1, 'FB4A29BE-7DD1-45D9-826C-873988F57A27', '', 'X0YHOP', 'PFD9cSBlA8X0Nw2GtKYUQaxynMivRhWO', '2016-06-27 15:33:19', '2016-06-27 15:33:19'),
(3, 'FDBX1K', '938332919646230', 'scubasteveo12345@gmail.com', 'Steve Stephanopolis', 100000, 1, 'DB403BBC-468C-4DC2-ADC6-5F25A94600AB', '', '', 'vpMY7J0P3VE2BTDolUXkt9SZQcAWnaRf', '2016-06-29 14:45:55', '2016-06-29 14:45:55');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
