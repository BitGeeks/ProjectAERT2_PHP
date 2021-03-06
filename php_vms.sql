-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th4 12, 2022 lúc 09:43 PM
-- Phiên bản máy phục vụ: 5.7.24-log
-- Phiên bản PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `php_vms`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_activity`
--

CREATE TABLE `vms_activity` (
  `Id` int(11) NOT NULL,
  `ActivityDesc` longtext,
  `ActivityEn` longtext,
  `Priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_activity`
--

INSERT INTO `vms_activity` (`Id`, `ActivityDesc`, `ActivityEn`, `Priority`) VALUES
(1, 'Đăng nhập', 'Login', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_algorithms`
--

CREATE TABLE `vms_algorithms` (
  `Id` int(11) NOT NULL,
  `Name` longtext,
  `Desc` longtext,
  `Slug` longtext,
  `Updated_at` varchar(27) DEFAULT NULL,
  `Created_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_algorithms`
--

INSERT INTO `vms_algorithms` (`Id`, `Name`, `Desc`, `Slug`, `Updated_at`, `Created_at`) VALUES
(1, 'Equihash', 'Equihash', 'equihash', '2021-07-11 22:21:54.8813593', '2021-07-11 22:21:54.8812877'),
(2, 'ETHash', 'Thuật toán ETHash', 'ethash', '2021-07-24 00:17:32.2471558', '2021-07-23 19:57:44.1056565'),
(3, 'SHA-256', 'Thuật toán SHA-256', 'sha-256', '2021-07-24 10:35:22.3696301', '2021-07-23 20:06:43.9415755'),
(4, 'Eaglesong', 'Thuật toán eaglesong', 'eaglesong', '2021-07-24 00:17:19.8987895', '2021-07-23 20:09:37.3750796'),
(5, 'Scrypt', NULL, 'scrypt', '2021-07-25 18:10:24.0326589', '2021-07-25 18:10:24.0325653'),
(6, 'Kadena', 'Thuật toán Kadena', 'kadena', '2021-07-25 18:11:41.2517144', '2021-07-25 18:11:41.2517126'),
(7, 'X11', NULL, 'x11', '2021-07-25 19:00:11.4555992', '2021-07-25 19:00:11.4555980');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_cartitems`
--

CREATE TABLE `vms_cartitems` (
  `Id` int(11) NOT NULL,
  `Session_id` int(11) DEFAULT NULL,
  `Product_id` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_cartitems`
--

INSERT INTO `vms_cartitems` (`Id`, `Session_id`, `Product_id`, `Quantity`, `Created_at`, `Updated_at`) VALUES
(25, 19, 4, 1, '2021-07-24 22:50:57.9053053', '2021-07-24 22:50:57.9052138');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_coupon`
--

CREATE TABLE `vms_coupon` (
  `Id` int(11) NOT NULL,
  `CouponCode` longtext,
  `User_id` int(11) DEFAULT NULL,
  `Desc` longtext,
  `CouponPercent` longtext,
  `CouponType` longtext,
  `MinPrice` double DEFAULT NULL,
  `Active` tinyint(4) DEFAULT NULL,
  `CouponLeft` int(11) DEFAULT NULL,
  `Expired_at` varchar(27) DEFAULT NULL,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_coupon`
--

INSERT INTO `vms_coupon` (`Id`, `CouponCode`, `User_id`, `Desc`, `CouponPercent`, `CouponType`, `MinPrice`, `Active`, `CouponLeft`, `Expired_at`, `Created_at`, `Updated_at`) VALUES
(1, 'DS6G9HVP', 27, 'Cảm ơn bạn đã tin tưởng Vĩ Miner Shop!!', '55', 'sales', 1000, 1, 0, '2021-08-07 18:21:44.8404684', '2021-07-19 18:21:44.8515623', '2021-07-19 18:21:44.8516432'),
(2, 'RHNO1W3S', 27, 'Cảm ơn bạn đã tin tưởng Vĩ Miner Shop!!', '55', 'sales', 1000, 1, 1, '2021-08-09 13:15:26.3386744', '2021-07-21 13:15:26.3387187', '2021-07-26 08:40:44.9059223'),
(3, '99QXXK4G', 27, 'Cảm ơn bạn đã tin tưởng Vĩ Miner Shop!!', '10', 'sales', 1000, 1, 1, '2021-08-11 17:25:31.1216508', '2021-07-23 17:25:31.1218343', '2021-07-23 17:25:31.1219181'),
(4, 'D2ERSE62', 27, 'Cảm ơn bạn đã tin tưởng Vĩ Miner Shop!!', '10', 'sales', 1000, 1, 0, '2021-08-13 01:15:08.9322427', '2021-07-25 01:15:08.9323376', '2021-07-25 01:15:08.9323987'),
(5, 'BW9CT1QK', 27, 'Cảm ơn bạn đã tin tưởng Vĩ Miner Shop!!', '55', 'sales', 1000, 1, 1, '2021-08-13 02:07:58.0341463', '2021-07-25 02:07:58.0642983', '2021-07-25 02:07:58.0643005'),
(6, '2SWKJGCG', 27, 'Cảm ơn bạn đã tin tưởng Vĩ Miner Shop!!', '55', 'sales', 1000, 1, 1, '2021-08-15 23:53:41.9831381', '2021-07-27 23:53:41.9832439', '2021-07-27 23:56:44.0170392');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_coupondonate`
--

CREATE TABLE `vms_coupondonate` (
  `Id` int(11) NOT NULL,
  `TransactionId` longtext,
  `User_id` int(11) DEFAULT NULL,
  `ReceiverId` int(11) DEFAULT NULL,
  `CouponId` int(11) DEFAULT NULL,
  `CouponName` longtext,
  `CouponPercent` longtext,
  `Quantity` int(11) DEFAULT NULL,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_coupondonate`
--

INSERT INTO `vms_coupondonate` (`Id`, `TransactionId`, `User_id`, `ReceiverId`, `CouponId`, `CouponName`, `CouponPercent`, `Quantity`, `Created_at`, `Updated_at`) VALUES
(1, 'HDCHVWCNPVJAH4A5WPAQ', 27, 27, 2, 'RHNO1W3S', '55', 1, '2021-07-26 08:40:44.9283819', '2021-07-26 08:40:44.9284202'),
(2, '3GNBK9EUQF14WCB5OE4L', 27, 27, 6, '2SWKJGCG', '55', 1, '2021-07-27 23:56:44.0176412', '2021-07-27 23:56:44.0177022');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_discounts`
--

CREATE TABLE `vms_discounts` (
  `Id` int(11) NOT NULL,
  `Name` longtext,
  `Desc` longtext,
  `Discount_percent` longtext,
  `Discount_type` longtext,
  `Active` longtext,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_failed_jobs`
--

CREATE TABLE `vms_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_hpnotice`
--

CREATE TABLE `vms_hpnotice` (
  `Id` int(11) NOT NULL,
  `Title` longtext,
  `Content` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_hpnotice`
--

INSERT INTO `vms_hpnotice` (`Id`, `Title`, `Content`) VALUES
(1, 'Thông báo 1', 'Vì ảnh hưởng của dịch covid19 nên việc hỗ trợ người dùng sẽ lâu hơn dự kiến.'),
(2, 'Thông báo 2', 'Việc vận chuyển có thể bị gián đoạn lâu hơn bình thường diễn biến dịch phức tạp và quy định cụ thể của từng địa phương.'),
(3, 'Thông báo 3', 'Hãy đăng ký tài khoản với nouce LESONGVI tại MaxMines để ủng hộ cho Vĩ Miner Shop! Cảm ơn các bạn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_migrations`
--

CREATE TABLE `vms_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vms_migrations`
--

INSERT INTO `vms_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_orderdetails`
--

CREATE TABLE `vms_orderdetails` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `SubTotal` double DEFAULT NULL,
  `CouponAmount` double DEFAULT NULL,
  `DiscountAmount` double DEFAULT NULL,
  `ShippingAmount` double DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Payment_id` int(11) DEFAULT NULL,
  `ShippingMethod_id` int(11) DEFAULT NULL,
  `ShippingAddress` longtext,
  `Discount_id` int(11) DEFAULT NULL,
  `Coupon_id` int(11) DEFAULT NULL,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL,
  `Latitute` longtext,
  `LocationName` longtext,
  `Longitute` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_orderdetails`
--

INSERT INTO `vms_orderdetails` (`Id`, `User_id`, `SubTotal`, `CouponAmount`, `DiscountAmount`, `ShippingAmount`, `Total`, `Payment_id`, `ShippingMethod_id`, `ShippingAddress`, `Discount_id`, `Coupon_id`, `Created_at`, `Updated_at`, `Latitute`, `LocationName`, `Longitute`) VALUES
(1, 1, 20000000, 0, 0, 0, 20000000, 1, 1, '180, 180, 180, 180, 180, 180, 180', NULL, NULL, '2021-07-13 16:09:48.3452112', '2021-07-13 16:09:48.3452417', NULL, 'Bắc Kạn', NULL),
(2, 1, 5000000, 0, 0, 0, 5000000, 2, 1, '180, 180, 180, 180, 180, 180, 180', NULL, NULL, '2021-07-13 22:57:37.8479588', '2021-07-13 22:57:37.8480086', NULL, 'Bắc Kạn', NULL),
(3, 1, 150, 0, 0, 0, 150, 3, 1, '180, 180, 180, 180, 180, 180, 180', NULL, NULL, '2021-07-13 23:26:06.6375535', '2021-07-13 23:26:06.6375559', NULL, 'Bắc Kạn', NULL),
(4, 1, 150, 0, 0, 0, 150, 5, 1, '180, 180, 180, 180, 180, 180, 180', NULL, NULL, '2021-07-15 22:25:02.4999601', '2021-07-15 22:25:02.4999921', NULL, 'Kon Tum', NULL),
(5, 1, 150, 0, 0, 0, 150, 6, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-17 23:48:51.1444796', '2021-07-17 23:48:51.1445371', NULL, 'Kon Tum', NULL),
(6, 1, 20000000, 0, 0, 60.6971016823812, 20000060.6971017, 7, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 17:55:02.5669790', '2021-07-19 17:55:02.5670486', NULL, 'Kon Tum', NULL),
(7, 1, 5000000, 0, 0, 0, 5000000, 8, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 17:56:16.2237621', '2021-07-19 17:56:16.2237645', NULL, 'Kon Tum', NULL),
(8, 1, 5000000, 0, 0, 60.6971016823812, 5000060.69710168, 9, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 17:56:16.2255350', '2021-07-19 17:56:16.2255362', NULL, 'Kon Tum', NULL),
(9, 1, 5000000, 0, 0, 0, 5000000, 10, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 17:56:16.2269066', '2021-07-19 17:56:16.2269079', NULL, 'Kon Tum', NULL),
(10, 1, 5000000, 0, 0, 0, 5000000, 11, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 17:56:16.2299010', '2021-07-19 17:56:16.2299021', NULL, 'Nghệ An', NULL),
(11, 1, 5000000, 0, 0, 60.8156286764061, 5000060.81562868, 12, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 17:58:37.6211807', '2021-07-19 17:58:37.6212640', NULL, 'Nghệ An', NULL),
(12, 1, 5000000, 0, 0, 0, 5000000, 15, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:00:36.2517480', '2021-07-19 18:00:36.2517491', NULL, 'Nghệ An', NULL),
(13, 1, 5000000, 0, 0, 0, 5000000, 13, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:00:36.2449842', '2021-07-19 18:00:36.2449864', NULL, 'Nghệ An', NULL),
(14, 1, 5000000, 0, 0, 60.8156286764061, 5000060.81562868, 14, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:00:36.2516408', '2021-07-19 18:00:36.2516419', NULL, 'Nghệ An', NULL),
(15, 1, 5000000, 0, 0, 0, 5000000, 16, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:00:36.3029223', '2021-07-19 18:00:36.3029236', NULL, 'Nghệ An', NULL),
(16, 1, 5000000, 0, 0, 60.8156286764061, 5000060.81562868, 17, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:44.8727631', '2021-07-19 18:01:44.8727690', NULL, 'Nghệ An', NULL),
(17, 1, 5000000, 0, 0, 0, 5000000, 18, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:44.9754391', '2021-07-19 18:01:44.9754402', NULL, 'Quảng Nam', NULL),
(18, 1, 5000000, 0, 0, 0, 5000000, 19, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:44.9767583', '2021-07-19 18:01:44.9767593', NULL, 'Quảng Nam', NULL),
(19, 1, 5000000, 0, 0, 0, 5000000, 20, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:44.9782025', '2021-07-19 18:01:44.9782035', NULL, 'Quảng Nam', NULL),
(20, 1, 5000000, 0, 0, 0, 5000000, 21, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:44.9796439', '2021-07-19 18:01:44.9796447', NULL, 'Đà Nẵng', NULL),
(21, 1, 5000000, 0, 0, 0, 5000000, 22, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:44.9810923', '2021-07-19 18:01:44.9810932', NULL, 'Đà Nẵng', NULL),
(22, 1, 5000000, 0, 0, 0, 5000000, 23, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:45.0285351', '2021-07-19 18:01:45.0285363', NULL, 'Đà Nẵng', NULL),
(23, 1, 5000000, 0, 0, 60.8156286764061, 5000060.81562868, 27, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:51.6663353', '2021-07-19 18:01:51.6663372', NULL, 'Đà Nẵng', NULL),
(24, 1, 5000000, 0, 0, 0, 5000000, 26, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:51.6668308', '2021-07-19 18:01:51.6668320', NULL, 'Đà Nẵng', NULL),
(25, 1, 5000000, 0, 0, 0, 5000000, 24, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:51.6350782', '2021-07-19 18:01:51.6350795', NULL, 'Đà Nẵng', NULL),
(26, 1, 5000000, 0, 0, 0, 5000000, 28, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:51.6426105', '2021-07-19 18:01:51.6426117', NULL, 'Hà Nội', NULL),
(27, 1, 5000000, 0, 0, 0, 5000000, 25, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:51.6428184', '2021-07-19 18:01:51.6428193', NULL, 'Hà Nội', NULL),
(28, 1, 5000000, 0, 0, 0, 5000000, 31, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:51.6871464', '2021-07-19 18:01:51.6871471', NULL, 'Hà Nội', NULL),
(29, 1, 5000000, 0, 0, 0, 5000000, 30, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:51.6871186', '2021-07-19 18:01:51.6871199', NULL, 'Hà Nội', NULL),
(30, 1, 5000000, 0, 0, 0, 5000000, 29, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:51.6871187', '2021-07-19 18:01:51.6871198', NULL, 'Hà Nội', NULL),
(31, 1, 5000000, 0, 0, 0, 5000000, 33, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:51.6883274', '2021-07-19 18:01:51.6883283', NULL, 'Hà Nội', NULL),
(32, 1, 5000000, 0, 0, 0, 5000000, 32, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:01:51.6891976', '2021-07-19 18:01:51.6891984', NULL, 'Hà Nội', NULL),
(33, 1, 5000000, 0, 0, 60.6970700614878, 5000060.69707006, 34, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:05:57.2978124', '2021-07-19 18:05:57.2978131', NULL, 'Hà Nội', NULL),
(34, 1, 5000000, 0, 0, 0, 5000000, 35, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:09:03.5423333', '2021-07-19 18:09:03.5424365', NULL, 'Bà Rịa - Vũng Tàu', NULL),
(35, 1, 5000000, 0, 0, 60.6970700614878, 5000060.69707006, 37, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:09:03.5423687', '2021-07-19 18:09:03.5424578', NULL, 'Bà Rịa - Vũng Tàu', NULL),
(36, 1, 5000000, 0, 0, 0, 5000000, 36, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:09:03.5423457', '2021-07-19 18:09:03.5424497', NULL, 'Bà Rịa - Vũng Tàu', NULL),
(37, 1, 5000000, 0, 0, 0, 5000000, 38, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:09:03.5423730', '2021-07-19 18:09:03.5424624', NULL, 'Hồ Chí Minh', NULL),
(38, 1, 20000000, 0, 0, 60.8156286764061, 20000060.8156287, 39, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-19 18:16:53.1416113', '2021-07-19 18:16:53.1416171', NULL, 'Hồ Chí Minh', NULL),
(39, 1, 5000600, 2750330, 0, 59.2105097349224, 2250329.21050973, 40, 1, 'dsaf, dsaf, dsaf, dsaf, dsaf, dsaf, dsaf', NULL, 1, '2021-07-21 13:13:18.8299448', '2021-07-21 13:13:18.8299874', NULL, 'Hồ Chí Minh', NULL),
(40, 1, 40, 0, 0, 60.6964720234301, 100.69647202343, 41, 1, 'dsaf, dsaf, dsaf, VN, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-23 17:09:11.3878280', '2021-07-23 17:09:11.3878959', NULL, 'Hồ Chí Minh', NULL),
(41, 9, 70, 0, 0, 60.6966407055397, 130.69664070554, 42, 1, '123, 123, 123, BH, 123, 123, 123', NULL, NULL, '2021-07-25 01:13:21.9198985', '2021-07-25 01:13:21.9199767', NULL, 'Gia Lai', NULL),
(42, 9, 10229, 1022.9, 0, 60.6965473066566, 9266.79654730666, 43, 1, '123, 123, 123, BH, 123, 123, 123', NULL, 4, '2021-07-25 01:34:39.1334775', '2021-07-25 01:34:39.1334849', NULL, 'Gia Lai', NULL),
(43, 9, 40846, 0, 0, 60.6961206311542, 40906.6961206312, 44, 1, '123, 123, 123, BH, 123, 123, 123', NULL, NULL, '2021-07-25 02:02:03.9552608', '2021-07-25 02:02:03.9552615', NULL, 'Gia Lai', NULL),
(44, 9, 51065, 0, 0, 60.6973816594139, 51125.6973816594, 45, 1, '123, 123, 123, BH, 123, 123, 123', NULL, NULL, '2021-07-25 02:05:23.7538954', '2021-07-25 02:05:23.7538963', NULL, 'Gia Lai', NULL),
(45, 1, 30792, 0, 0, 78.5489269507847, 30870.5489269508, 47, 2, '180 Nguyễn Huệ, dsaf, dsaf, VN, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-26 00:17:01.7016543', '2021-07-26 00:17:01.7017734', NULL, 'Hồ Chí Minh', NULL),
(46, 1, 6250, 0, 0, 612.812188138608, 6862.81218813861, 48, 1, '180 Nguyễn Huệ, dsaf, dsaf, VN, dsaf, dsaf, dsaf', NULL, NULL, '2021-07-26 15:33:12.5878964', '2021-07-26 15:33:12.5879334', '11.049491999999999', 'Bình Dương', NULL),
(47, 1, 25000, 0, 0, 146.385258402208, 25146.3852584022, 49, 3, '18, Trần Phú, Pleiku, VN, 600000, 0905182544, 0942503749', NULL, NULL, '2021-07-27 23:46:32.9210862', '2021-07-27 23:46:32.9211539', '11.0546613', 'Bình Dương', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_orderitems`
--

CREATE TABLE `vms_orderitems` (
  `Id` int(11) NOT NULL,
  `Order_id` int(11) DEFAULT NULL,
  `Product_id` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_orderitems`
--

INSERT INTO `vms_orderitems` (`Id`, `Order_id`, `Product_id`, `Quantity`, `Created_at`, `Updated_at`) VALUES
(1, 1, 1, 4, '2021-07-13 16:09:48.6501699', '2021-07-13 16:09:48.6502134'),
(2, 2, 1, 1, '2021-07-13 22:57:38.1009442', '2021-07-13 22:57:38.1010589'),
(3, 3, 2, 1, '2021-07-13 23:26:06.9316858', '2021-07-13 23:26:06.9316917'),
(4, 4, 2, 1, '2021-07-15 22:25:02.8572890', '2021-07-15 22:25:02.8573556'),
(5, 5, 2, 1, '2021-07-17 23:48:51.4051832', '2021-07-17 23:48:51.4052525'),
(6, 6, 1, 4, '2021-07-19 17:55:02.7841981', '2021-07-19 17:55:02.7843725'),
(7, 9, 1, 1, '2021-07-19 17:56:16.2352640', '2021-07-19 17:56:16.2352650'),
(8, 11, 1, 1, '2021-07-19 17:58:37.6796447', '2021-07-19 17:58:37.6797289'),
(9, 13, 1, 1, '2021-07-19 18:00:36.2864813', '2021-07-19 18:00:36.2864830'),
(10, 15, 1, 1, '2021-07-19 18:00:36.3211580', '2021-07-19 18:00:36.3211592'),
(11, 19, 1, 1, '2021-07-19 18:01:45.0247775', '2021-07-19 18:01:45.0247786'),
(12, 18, 1, 1, '2021-07-19 18:01:45.0597841', '2021-07-19 18:01:45.0597852'),
(13, 24, 1, 1, '2021-07-19 18:01:51.8646404', '2021-07-19 18:01:51.8646423'),
(14, 33, 1, 1, '2021-07-19 18:05:57.4537906', '2021-07-19 18:05:57.4537916'),
(15, 35, 1, 1, '2021-07-19 18:09:03.6884989', '2021-07-19 18:09:03.6885841'),
(16, 37, 1, 1, '2021-07-19 18:09:03.7175285', '2021-07-19 18:09:03.7175298'),
(17, 38, 1, 4, '2021-07-19 18:16:53.1972866', '2021-07-19 18:16:53.1972912'),
(18, 39, 2, 4, '2021-07-21 13:13:18.9201375', '2021-07-21 13:13:18.9201763'),
(19, 39, 1, 1, '2021-07-21 13:13:19.0330480', '2021-07-21 13:13:19.0330520'),
(20, 40, 2, 4, '2021-07-23 17:09:11.7423619', '2021-07-23 17:09:11.7424746'),
(21, 41, 2, 7, '2021-07-25 01:13:22.1390882', '2021-07-25 01:13:22.1391597'),
(22, 42, 2, 3, '2021-07-25 01:34:39.2376546', '2021-07-25 01:34:39.2376618'),
(23, 42, 4, 1, '2021-07-25 01:34:39.3047354', '2021-07-25 01:34:39.3047402'),
(24, 43, 2, 5, '2021-07-25 02:02:04.4074058', '2021-07-25 02:02:04.4074067'),
(25, 43, 4, 4, '2021-07-25 02:02:05.0558730', '2021-07-25 02:02:05.0558754'),
(26, 44, 4, 5, '2021-07-25 02:05:23.8595967', '2021-07-25 02:05:23.8595992'),
(27, 44, 2, 7, '2021-07-25 02:05:23.8701384', '2021-07-25 02:05:23.8701393'),
(28, 45, 12, 4, '2021-07-26 00:17:01.8931392', '2021-07-26 00:17:01.8931991'),
(29, 46, 15, 1, '2021-07-26 15:33:12.8470726', '2021-07-26 15:33:12.8471121'),
(30, 47, 15, 4, '2021-07-27 23:46:33.3176636', '2021-07-27 23:46:33.3177711');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_password_resets`
--

CREATE TABLE `vms_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_paymentdetails`
--

CREATE TABLE `vms_paymentdetails` (
  `Id` int(11) NOT NULL,
  `Amount` double DEFAULT NULL,
  `Provider` double DEFAULT NULL,
  `Status` double DEFAULT NULL,
  `ReferralBy` longtext,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL,
  `MaxMinesBillID` longtext,
  `PaypalID` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_paymentdetails`
--

INSERT INTO `vms_paymentdetails` (`Id`, `Amount`, `Provider`, `Status`, `ReferralBy`, `Created_at`, `Updated_at`, `MaxMinesBillID`, `PaypalID`) VALUES
(1, 20000000, 0, 0, NULL, '2021-07-13 16:09:48.1784426', '2021-07-13 16:09:48.1785055', NULL, NULL),
(2, 5000000, 0, 0, NULL, '2021-07-13 22:57:37.5364748', '2021-07-13 22:57:37.5365462', NULL, NULL),
(3, 150, 4, 2, NULL, '2021-07-13 23:26:06.5195878', '2021-07-14 01:19:49.1131058', NULL, '488198223P742893W'),
(4, 19, 4, 1, NULL, '2021-07-14 14:41:30.4317799', '2021-07-14 15:34:32.2303030', NULL, '67713192T1473105M'),
(5, 150, 1, 1, NULL, '2021-07-15 22:25:02.3529360', '2021-07-15 23:36:08.7919936', 'b8C8ar7HeSnKyiCr8HSwx3TuRYO31dNaqEQy911sSiTAQ', NULL),
(6, 150, 1, 1, NULL, '2021-07-17 23:48:51.0728642', '2021-07-17 23:50:10.9351743', 'sTlI4g3kogoGbEv6bAOnFk28pwR2B6nrFCyMlhQL5uidq', NULL),
(7, 20000000, 0, 0, NULL, '2021-07-19 17:55:01.9014676', '2021-07-19 17:55:01.9015770', NULL, NULL),
(8, 5000000, 0, 0, NULL, '2021-07-19 17:56:16.2133761', '2021-07-19 17:56:16.2133771', NULL, NULL),
(9, 5000000, 0, 0, NULL, '2021-07-19 17:56:16.2101040', '2021-07-19 17:56:16.2101049', NULL, NULL),
(10, 5000000, 0, 0, NULL, '2021-07-19 17:56:16.2097787', '2021-07-19 17:56:16.2097812', NULL, NULL),
(11, 5000000, 0, 0, NULL, '2021-07-19 17:56:16.2179662', '2021-07-19 17:56:16.2179673', NULL, NULL),
(12, 5000000, 0, 0, NULL, '2021-07-19 17:58:37.5722597', '2021-07-19 17:58:37.5723891', NULL, NULL),
(13, 5000000, 0, 0, NULL, '2021-07-19 18:00:36.2397303', '2021-07-19 18:00:36.2397314', NULL, NULL),
(14, 5000000, 0, 0, NULL, '2021-07-19 18:00:36.2380811', '2021-07-19 18:00:36.2380823', NULL, NULL),
(15, 5000000, 0, 0, NULL, '2021-07-19 18:00:36.2368275', '2021-07-19 18:00:36.2368299', NULL, NULL),
(16, 5000000, 0, 0, NULL, '2021-07-19 18:00:36.2814617', '2021-07-19 18:00:36.2814628', NULL, NULL),
(17, 5000000, 0, 0, NULL, '2021-07-19 18:01:44.8215279', '2021-07-19 18:01:44.8215324', NULL, NULL),
(18, 5000000, 0, 0, NULL, '2021-07-19 18:01:44.9648362', '2021-07-19 18:01:44.9648397', NULL, NULL),
(19, 5000000, 0, 0, NULL, '2021-07-19 18:01:44.9683718', '2021-07-19 18:01:44.9683728', NULL, NULL),
(20, 5000000, 0, 0, NULL, '2021-07-19 18:01:44.9684971', '2021-07-19 18:01:44.9684978', NULL, NULL),
(21, 5000000, 0, 0, NULL, '2021-07-19 18:01:44.9704607', '2021-07-19 18:01:44.9704618', NULL, NULL),
(22, 5000000, 0, 0, NULL, '2021-07-19 18:01:44.9669038', '2021-07-19 18:01:44.9669051', NULL, NULL),
(23, 5000000, 0, 0, NULL, '2021-07-19 18:01:44.9789578', '2021-07-19 18:01:44.9789586', NULL, NULL),
(24, 5000000, 0, 0, NULL, '2021-07-19 18:01:51.6214644', '2021-07-19 18:01:51.6214687', NULL, NULL),
(25, 5000000, 0, 0, NULL, '2021-07-19 18:01:51.6202855', '2021-07-19 18:01:51.6202905', NULL, NULL),
(26, 5000000, 0, 0, NULL, '2021-07-19 18:01:51.6204626', '2021-07-19 18:01:51.6204663', NULL, NULL),
(27, 5000000, 0, 0, NULL, '2021-07-19 18:01:51.6215448', '2021-07-19 18:01:51.6215478', NULL, NULL),
(28, 5000000, 0, 0, NULL, '2021-07-19 18:01:51.6223259', '2021-07-19 18:01:51.6223340', NULL, NULL),
(29, 5000000, 0, 0, NULL, '2021-07-19 18:01:51.6228475', '2021-07-19 18:01:51.6228480', NULL, NULL),
(30, 5000000, 0, 0, NULL, '2021-07-19 18:01:51.6236151', '2021-07-19 18:01:51.6236158', NULL, NULL),
(31, 5000000, 0, 0, NULL, '2021-07-19 18:01:51.6227663', '2021-07-19 18:01:51.6227670', NULL, NULL),
(32, 5000000, 0, 0, NULL, '2021-07-19 18:01:51.6247516', '2021-07-19 18:01:51.6247527', NULL, NULL),
(33, 5000000, 0, 0, NULL, '2021-07-19 18:01:51.6236968', '2021-07-19 18:01:51.6236973', NULL, NULL),
(34, 5000000, 0, 0, NULL, '2021-07-19 18:05:57.2714296', '2021-07-19 18:05:57.2714303', NULL, NULL),
(35, 5000000, 0, 0, NULL, '2021-07-19 18:09:03.5249834', '2021-07-19 18:09:03.5249854', NULL, NULL),
(36, 5000000, 0, 0, NULL, '2021-07-19 18:09:03.3929389', '2021-07-19 18:09:03.3930367', NULL, NULL),
(37, 5000000, 0, 0, NULL, '2021-07-19 18:09:03.3929308', '2021-07-19 18:09:03.3930133', NULL, NULL),
(38, 5000000, 0, 0, NULL, '2021-07-19 18:09:03.5266290', '2021-07-19 18:09:03.5266301', NULL, NULL),
(39, 20000000, 1, 1, NULL, '2021-07-19 18:16:53.1104600', '2021-07-19 18:21:44.7942725', 'nrgPzQwaIgqTwOB1UNk7k7VEmbiqQbsbLA2fXMCizRWL5', NULL),
(40, 2250270, 1, 1, NULL, '2021-07-21 13:13:18.7887317', '2021-07-21 13:15:26.3360661', 'Fv0gpX75Mdu7LKajMcA221SEG4LQIY1d177mfCeaQo7lw', NULL),
(41, 40, 1, 1, NULL, '2021-07-23 17:09:10.7455192', '2021-07-23 17:25:31.0508956', 'qUy7G3KE6cTCgrl7FyUfZf3ZDLDEChxw4cKaVuHbaV6qZ', NULL),
(42, 70, 1, 1, NULL, '2021-07-25 01:13:21.8214599', '2021-07-25 01:15:08.9283256', 'GVxWdhUAm7ZrkgWRfcPhZFmJV0AZA1ydiS5FaNBXyOls7', NULL),
(43, 9206.1, 0, 0, NULL, '2021-07-25 01:34:38.8431207', '2021-07-25 01:34:38.8431232', NULL, NULL),
(44, 40846, 0, 0, NULL, '2021-07-25 02:02:03.7310024', '2021-07-25 02:02:03.7310032', NULL, NULL),
(45, 51065, 4, 1, NULL, '2021-07-25 02:05:23.7494191', '2021-07-25 02:07:57.9736563', NULL, '94T676449V4920603'),
(46, 80, 4, 1, NULL, '2021-07-25 02:29:57.0102968', '2021-07-25 02:30:52.2425208', NULL, '9KJ13208D19707808'),
(47, 30792, 4, 0, NULL, '2021-07-26 00:17:01.4842274', '2021-07-26 00:17:01.4842935', NULL, NULL),
(48, 6250, 0, 0, NULL, '2021-07-26 15:33:12.3890382', '2021-07-26 15:33:12.3890959', NULL, NULL),
(49, 25000, 4, 1, NULL, '2021-07-27 23:46:32.8221319', '2021-07-27 23:53:41.6167889', NULL, '0DV66380XX352040C');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_paymentprovider`
--

CREATE TABLE `vms_paymentprovider` (
  `Id` int(11) NOT NULL,
  `Name` longtext,
  `Desc` longtext,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_paymentprovider`
--

INSERT INTO `vms_paymentprovider` (`Id`, `Name`, `Desc`, `Created_at`, `Updated_at`) VALUES
(1, 'MaxMines Payment', 'Thanh toán đơn hàng bằng số hash tại MaxMines', '2017-07-19 00:00:00.0000000', '2017-07-19 00:00:00.0000000'),
(3, 'Chuyển khoản ngân hàng', 'Chuyển khoản qua số tài khoản ngân hàng được liệt kê phía dưới (theo format: TÊN NGÂN HÀNG <strong>SỐ TÀI KHOẢN</strong>, <i>TÊN CHỦ TÀI KHOẢN</i>)\n<br/>\n<br/>\n<ul>\n<li>BIDV <strong>62010001060000</strong>, <i>LÊ SONG VĨ</i></li>\n<li>VIETINBANK <strong>109003472561</strong>, <i>VŨ HUYỀN MAI</i></li>\n<li>ACB <strong>9045067</strong>, <i>TRƯƠNG MINH DƯƠNG</i></li>\n<li>VIB <strong>601269869</strong>, <i>TRƯƠNG MINH DƯƠNG</i></li>\n<li>MB <strong>0005553456789</strong>, <i>VÕ NGỌC TUẤN</i></li>\n</ul>\n<br/>\n<strong>Quan trọng</strong>: Bạn phải nhập chính xác ghi chú giao dịch là <strong><i>THANHTOANDONHANG_VMS USER_CURRENT_ORDER_ID</i></strong>\n<br/>\n<small>Ví dụ: THANHTOANDONHANG_VMS 192</small>\n<br/>\n<small>Chuyển khoản sai nội dung giao dịch sẽ khiến quá trình xử lý đơn hàng của bạn chậm hơn.</small>\n', '2019-12-04 00:00:00.0000000', '2019-12-04 00:00:00.0000000'),
(4, 'Paypal', 'Thanh toán qua Paypal', '2020-07-19 00:00:00.0000000', '2020-07-25 00:00:00.0000000'),
(5, 'Thanh toán trưc tiếp', 'Thanh toán trực tiếp tại đại lý ủy quyền (theo format: TÊN ĐẠI LÝ, ĐỊA CHỈ THANH TOÁN TRỰC TIẾP - SỐ ĐIỆN THOẠI):\r\n<br/><br/>\r\n<h2>Khu vực miền Bắc</h2>\r\n<p>Vũ Huyền Mai - Khu tập thể Quân Đội bắc Nghĩa Tân, quận Cầu Giấy, thành phố Hà Nội - 0982216865</p>\r\n<p>Vũ Đức Hải - Đ4, xã Đồng Cam, huyện Cẩm Khê, tỉnh Phú Thọ - 0987105882</p>\r\n<br/>\r\n<h2>Khu vực Tây Nguyên</h2>\r\n<p>Trương Minh Dương - Hoàng Văn Thụ, thị trấn Đak Đoa, huyện Đak Đoa, tỉnh Gia Lai - 0389269869</p>\r\n<p>Nguyễn Hoàng Vinh - Lê Thánh Tôn, phường Ia Kring, thành phố Pleiku, tỉnh Gia Lai - 0839029852</p>\r\n<br/>\r\n<h2>Khu vực miền Trung</h2>\r\n<p>Lê Thanh Huy - Hùng Vương, Ba Ngòi, Cam Ranh, tỉnh Khánh Hòa - 0901640285</p>\r\n<br/>\r\n<h2>Khu vực miền Nam</h2>\r\n<p>Lê Song Vĩ - Xô Viết Nghệ Tĩnh, phường 27, quận Bình Thạnh, thành phố Hồ Chí Minh - 0911018157</p>\r\n<p>Lê Song Ngân - Khu Hoàng Gia, phường Tân Định, thị xã Bến Cát, tỉnh Bình Dương - 0818492353</p>\r\n<br/>\r\n<small>Hãy kết bạn zalo và gửi tin nhắn cho 1 trong những đại lý gần bạn, chúng tôi sẽ liên hệ lại bạn sau. Không khuyến khích bạn gọi thẳng vào số điện thoại.</small>', '2021-07-20 00:00:00.0000000', '2021-07-20 00:00:00.0000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_personal_access_tokens`
--

CREATE TABLE `vms_personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_productcategories`
--

CREATE TABLE `vms_productcategories` (
  `Id` int(11) NOT NULL,
  `Name` longtext,
  `Desc` longtext,
  `Image` longtext,
  `Slug` longtext,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_productcategories`
--

INSERT INTO `vms_productcategories` (`Id`, `Name`, `Desc`, `Image`, `Slug`, `Created_at`, `Updated_at`) VALUES
(1, 'CANAAN', 'Máy đào CANAAN', '', 'canaan', '2021-07-11 22:06:56.7390797', '2021-07-24 00:03:23.1006213'),
(2, 'Innosilicon', 'Máy đào Innosilicon', NULL, 'innosilicon', '2021-07-11 22:20:16.5580015', '2021-07-23 23:39:07.6859257'),
(3, 'TODEK', 'Máy đào todek', NULL, 'todek', '2021-07-24 00:03:01.3235591', '2021-07-24 00:03:19.2396482'),
(4, 'GOLDSHELL', '', NULL, 'goldshell', '2021-07-24 20:31:37.9315333', '2021-07-24 20:31:37.9316593'),
(5, 'BITMAIN', NULL, NULL, 'bitmain', '2021-07-25 17:58:41.5042102', '2021-07-25 17:58:41.5042656'),
(6, 'MicroBT', NULL, NULL, 'microbt', '2021-07-25 18:27:18.0688031', '2021-07-25 18:27:18.0688051'),
(7, 'StrongU', NULL, NULL, 'strongu', '2021-07-25 19:00:22.0972806', '2021-07-25 19:00:22.0972815');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_productimages`
--

CREATE TABLE `vms_productimages` (
  `Id` int(11) NOT NULL,
  `Product_Id` int(11) DEFAULT NULL,
  `Alt_Name` longtext,
  `ImageUrl` longtext,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_productimages`
--

INSERT INTO `vms_productimages` (`Id`, `Product_Id`, `Alt_Name`, `ImageUrl`, `Created_at`, `Updated_at`) VALUES
(3, 1, 'img1.png', 'https://cdn.notevn.com/atZZKpIsk.png', '2021-07-23 18:26:11.9208893', '2021-07-23 18:26:11.9209513'),
(4, 1, 'img2.png', 'https://cdn.notevn.com/o55twKoFu.png', '2021-07-23 18:26:12.3082762', '2021-07-23 18:26:12.3082864'),
(5, 1, 'img3.png', 'https://cdn.notevn.com/pauGZqvL1.png', '2021-07-23 18:26:12.3137559', '2021-07-23 18:26:12.3137571'),
(6, 1, 'img4.png', 'https://cdn.notevn.com/q3c8V6fYH.png', '2021-07-23 18:26:12.3191985', '2021-07-23 18:26:12.3191997'),
(7, 3, 'img1.png', 'https://cdn.notevn.com/rk4KGkGQM.png', '2021-07-24 15:15:46.1333363', '2021-07-24 15:15:46.1335327'),
(8, 3, 'img2.png', 'https://cdn.notevn.com/iacy3phEX.png', '2021-07-24 15:15:47.4337874', '2021-07-24 15:15:47.4337948'),
(9, 2, 'img2.png', 'https://cdn.notevn.com/yRQiWtyFv.png', '2021-07-24 15:17:42.9778322', '2021-07-24 15:17:42.9778389'),
(10, 2, 'img1.png', 'https://cdn.notevn.com/S8dW9wIHv.png', '2021-07-24 15:17:43.0189838', '2021-07-24 15:17:43.0189885'),
(11, 5, 'img1.png', 'https://cdn.notevn.com/XskZMPvJu.png', '2021-07-25 17:57:01.0174404', '2021-07-25 17:57:01.0174958'),
(12, 5, 'img2.png', 'https://cdn.notevn.com/OJdpXxzIr.png', '2021-07-25 17:57:01.1980163', '2021-07-25 17:57:01.1980182'),
(13, 5, 'img3.png', 'https://cdn.notevn.com/f2R16DZs5.png', '2021-07-25 17:57:01.2030645', '2021-07-25 17:57:01.2030653'),
(14, 8, 'img1.png', 'https://cdn.notevn.com/mJZU1ZdLH.png', '2021-07-25 18:10:00.2575678', '2021-07-25 18:10:00.2575685'),
(15, 8, 'img2.png', 'https://cdn.notevn.com/2mE9lmiJK.png', '2021-07-25 18:10:00.2618859', '2021-07-25 18:10:00.2618865'),
(16, 8, 'img3.png', 'https://cdn.notevn.com/NgQ3ra0PA.png', '2021-07-25 18:10:00.2638868', '2021-07-25 18:10:00.2638873'),
(17, 8, 'img4.png', 'https://cdn.notevn.com/fsvACNggf.png', '2021-07-25 18:10:00.2659893', '2021-07-25 18:10:00.2659898'),
(18, 8, 'img5.png', 'https://cdn.notevn.com/DNWdCbqqq.png', '2021-07-25 18:10:00.2689211', '2021-07-25 18:10:00.2689219'),
(19, 8, 'img6.png', 'https://cdn.notevn.com/8Xx3yqYY7.png', '2021-07-25 18:10:00.2716032', '2021-07-25 18:10:00.2716038'),
(20, 8, 'img7.png', 'https://cdn.notevn.com/tMygNWivp.png', '2021-07-25 18:10:00.2738369', '2021-07-25 18:10:00.2738374'),
(21, 9, 'img1.png', 'https://cdn.notevn.com/JN2Xi4KAr.png', '2021-07-25 18:18:40.3947873', '2021-07-25 18:18:40.3947880'),
(22, 9, 'img2.png', 'https://cdn.notevn.com/ZZNspjxwo.png', '2021-07-25 18:18:40.4010664', '2021-07-25 18:18:40.4010672'),
(23, 10, 'img1.png', 'https://cdn.notevn.com/MZiBtwLVo.png', '2021-07-25 18:27:04.1696354', '2021-07-25 18:27:04.1696360'),
(24, 11, 'img1.png', 'https://cdn.notevn.com/Fyk1nZAnH.png', '2021-07-25 18:34:14.8132436', '2021-07-25 18:34:14.8132444'),
(25, 11, 'img2.png', 'https://cdn.notevn.com/W8gP0s1zl.png', '2021-07-25 18:34:14.8396972', '2021-07-25 18:34:14.8396979'),
(27, 12, 'img1.png', 'https://cdn.notevn.com/EeJz4jyLV.png', '2021-07-25 18:54:05.9087585', '2021-07-25 18:54:05.9087593'),
(28, 12, 'img2.png', 'https://cdn.notevn.com/InpQkUvKg.png', '2021-07-25 18:54:05.9203729', '2021-07-25 18:54:05.9203736'),
(29, 13, 'img1.png', 'https://cdn.notevn.com/dkOTAm2BN.png', '2021-07-25 19:00:00.6853959', '2021-07-25 19:00:00.6853966'),
(30, 13, 'img2.png', 'https://cdn.notevn.com/50U3g1kim.png', '2021-07-25 19:00:00.6972490', '2021-07-25 19:00:00.6972498'),
(31, 14, 'img1.png', 'https://cdn.notevn.com/acx1eBb75.png', '2021-07-25 19:05:13.5940972', '2021-07-25 19:05:13.5940980'),
(32, 14, 'img2.png', 'https://cdn.notevn.com/4uFt7lloP.png', '2021-07-25 19:05:13.6045721', '2021-07-25 19:05:13.6046009'),
(33, 15, 'img1.png', 'https://cdn.notevn.com/IIfskubjk.png', '2021-07-25 19:09:10.8792894', '2021-07-25 19:09:10.8792901');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_productinventories`
--

CREATE TABLE `vms_productinventories` (
  `Id` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Flag` longtext,
  `Hps` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `ShippingInfo` longtext,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_productinventories`
--

INSERT INTO `vms_productinventories` (`Id`, `Quantity`, `Flag`, `Hps`, `weight`, `ShippingInfo`, `Created_at`, `Updated_at`) VALUES
(1, 100, 'NULL', 50000, 50000, 'Ngày ship tiếp theo 08/09/2029', '2021-07-11 21:45:18.0852079', '2021-07-12 08:49:57.9690184'),
(2, 200, 'FLAG_SPOT_ORDER', 81000000000000, 12.8, 'Thanh toán xong giao ngay', '2021-07-13 23:25:16.3452635', '2021-07-24 15:17:43.0229014'),
(3, 0, 'NULL', 3000000000000, 12, '', '2021-07-18 10:55:15.7133245', '2021-07-25 19:10:02.2665229'),
(4, 48, 'NULL', 12000000000000, 8.5, NULL, '2021-07-24 09:35:07.8173243', '2021-07-25 18:46:59.6760908'),
(5, 80, 'NULL', 56000000000000, 12.8, NULL, '2021-07-25 17:45:10.1425383', '2021-07-25 17:57:01.2067529'),
(6, 40, 'NULL', 90000000000000, 14.5, NULL, '2021-07-25 17:50:20.0964219', '2021-07-25 17:50:20.0964243'),
(7, 400, 'FLAG_SPOT_ORDER', 68000000000000, 12.8, NULL, '2021-07-25 17:54:56.8449041', '2021-07-25 17:54:56.8449069'),
(8, 50, 'NULL', 9500000000000, 7.5, NULL, '2021-07-25 18:07:59.5403214', '2021-07-25 18:10:36.8589651'),
(9, 800, 'NULL', 1600000000000, 2, NULL, '2021-07-25 18:18:40.3716611', '2021-07-25 18:18:55.1552227'),
(10, 62, 'FLAG_SPOT_ORDER', 52000000000000, 8, NULL, '2021-07-25 18:23:56.7972324', '2021-07-25 18:27:04.1759196'),
(11, 12, 'NULL', 110000000000000, 16, NULL, '2021-07-25 18:34:14.4882989', '2021-07-25 18:34:14.4882998'),
(12, 25, 'FLAG_SPOT_ORDER', 108000000000000, 14, NULL, '2021-07-25 18:41:57.5571526', '2021-07-25 18:54:23.3112425'),
(13, 54, 'NULL', 440000000000, 7.2, NULL, '2021-07-25 18:57:37.9427908', '2021-07-25 19:11:00.8082884'),
(14, 62, 'NULL', 74000000000000, 11.5, NULL, '2021-07-25 19:02:20.9138193', '2021-07-25 19:05:13.6095360'),
(15, 87, 'FLAG_SPOT_ORDER', 3260000000000, 8.2, NULL, '2021-07-25 19:09:10.8464937', '2021-07-25 19:09:10.8464946');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_products`
--

CREATE TABLE `vms_products` (
  `Id` int(11) NOT NULL,
  `Name` longtext,
  `Desc` longtext,
  `NoteDesc` longtext,
  `DetailDesc` longtext,
  `PaymentDesc` longtext,
  `WarrantyDesc` longtext,
  `SKU` longtext,
  `Category_id` int(11) DEFAULT NULL,
  `Inventory_id` int(11) DEFAULT NULL,
  `Algorithm_id` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL,
  `PricePromotion` double DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_products`
--

INSERT INTO `vms_products` (`Id`, `Name`, `Desc`, `NoteDesc`, `DetailDesc`, `PaymentDesc`, `WarrantyDesc`, `SKU`, `Category_id`, `Inventory_id`, `Algorithm_id`, `Price`, `Created_at`, `Updated_at`, `PricePromotion`, `isActive`) VALUES
(1, 'Innosilicon A10 Pro+ 750MH/S', 'Máy đào Innosilicon A10 pro + (750Mh) hỗ trợ thuật toán ETHash với công suất 750MH/s, mức tiêu thụ điện năng 1350W.', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Các máy còn hàng sẽ được vận chuyển trong 48-72 giờ từ kho Vĩ Miner Shop Gia Lai.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Máy đào đã bán lại sẽ được giao sau 5-7 ngày.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    3. Chúng tôi kiểm tra tất cả các máy đào bán lại trước khi vận chuyển.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    4. Tất cả các máy đào sẽ được vận chuyển bằng đơn vị vận chuyển mà khách hàng đã chọn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    5. Chúng tôi sẽ cung cấp cho bạn mã số theo dõi trong 24-48 giờ sau khi máy đào được chuyển từ kho của chúng tôi qua email đã đăng ký của bạn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    6. Thông thường lô hàng mất 5-10 ngày để đến nơi.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    7. Chúng tôi sẽ thông báo cho bạn tất cả các cập nhật về đơn đặt hàng của bạn trên một email.\n  </span>\n</p>\n', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Innosilicon\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  A10 Pro+ ETH (750Mh)\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Also known as\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  A10 PRO-S 7GB ETHMiner\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Release\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  December 2020\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  136 x 285 x 362mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Weight\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  8100g\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  75db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Fan(s)\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  1350W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Voltage\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12V\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Memory\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  7Gb\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 45 °C\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Humidity\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 95 %\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Khách hàng chọn thanh toán bằng các hình thức cho phép khi đặt hàng.\n  </span>\n</p>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Tất cả các máy đào mới (brand new) có 180 ngày bảo hành mặc định của nhà sản xuất.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Đội ngũ kỹ thuật của chúng tôi luôn sẵn sàng 24/7 để giúp bạn giải quyết bất kỳ loại vấn đề nào thông qua Teamviewer.\n  </span>\n</p>', 'INNOA107G', 1, 1, 2, 15799, '2021-07-11 22:31:24.8648975', '2021-07-23 20:00:18.6524798', 0, 1),
(2, 'Canaan Avalon Miner 1166 Pro', 'Máy đào Canaan AvalonMiner 1166 pro (81Th) hỗ trợ thuật toán SHA-256 với công suất \n 81TH/s, mức tiêu thụ điện năng 3400W.', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Các máy còn hàng sẽ được vận chuyển trong 48-72 giờ từ kho Vĩ Miner Shop Gia Lai.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Máy đào đã bán lại sẽ được giao sau 5-7 ngày.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    3. Chúng tôi kiểm tra tất cả các máy đào bán lại trước khi vận chuyển.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    4. Tất cả các máy đào sẽ được vận chuyển bằng đơn vị vận chuyển mà khách hàng đã chọn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    5. Chúng tôi sẽ cung cấp cho bạn mã số theo dõi trong 24-48 giờ sau khi máy đào được chuyển từ kho của chúng tôi qua email đã đăng ký của bạn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    6. Thông thường lô hàng mất 5-10 ngày để đến nơi.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    7. Chúng tôi sẽ thông báo cho bạn tất cả các cập nhật về đơn đặt hàng của bạn trên một email.\n  </span>\n</p>\n', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Canaan\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  AvalonMiner 1166 Pro\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Also known as\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  A1166 Pro\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Release\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  August 2020\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  306 x 405 x 442mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Weight\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12800g\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  75db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Cooling\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12038\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Fan(s)\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  4\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  3400W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Voltage\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12V\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Interface\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Ethernet\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  -5 – 35 °C\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Humidity\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 95 %\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Khách hàng chọn thanh toán bằng các hình thức cho phép khi đặt hàng.\n  </span>\n</p>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Tất cả các máy đào mới (brand new) có 180 ngày bảo hành mặc định của nhà sản xuất.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Đội ngũ kỹ thuật của chúng tôi luôn sẵn sàng 24/7 để giúp bạn giải quyết bất kỳ loại vấn đề nào thông qua Teamviewer.\n  </span>\n</p>', 'CA_1166_PRO', 2, 2, 3, 8900, '2021-07-13 23:25:53.9157358', '2021-07-24 15:17:43.0228860', 10, 1),
(3, 'Todek Toddminer C1 Pro', 'Máy đào Todek Toddminer C1 Pro (3TH/s) hỗ trợ thuật toán Eaglesong với công suất 3TH/s, mức tiêu thụ điện năng 2700W.', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Các máy còn hàng sẽ được vận chuyển trong 48-72 giờ từ kho Vĩ Miner Shop Gia Lai.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Máy đào đã bán lại sẽ được giao sau 5-7 ngày.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    3. Chúng tôi kiểm tra tất cả các máy đào bán lại trước khi vận chuyển.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    4. Tất cả các máy đào sẽ được vận chuyển bằng đơn vị vận chuyển mà khách hàng đã chọn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    5. Chúng tôi sẽ cung cấp cho bạn mã số theo dõi trong 24-48 giờ sau khi máy đào được chuyển từ kho của chúng tôi qua email đã đăng ký của bạn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    6. Thông thường lô hàng mất 5-10 ngày để đến nơi.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    7. Chúng tôi sẽ thông báo cho bạn tất cả các cập nhật về đơn đặt hàng của bạn trên một email.\n  </span>\n</p>\n', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Todek\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Toddminer C1 PRO\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Release\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  May 2020\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  185 x 281 x 300mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Weight\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12000g\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  70db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Fan(s)\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2700W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Voltage\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12V\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Interface\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Ethernet\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 45 °C\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Humidity\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 95 %\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Khách hàng chọn thanh toán bằng các hình thức cho phép khi đặt hàng.\n  </span>\n</p>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Tất cả các máy đào mới (brand new) có 180 ngày bảo hành mặc định của nhà sản xuất.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Đội ngũ kỹ thuật của chúng tôi luôn sẵn sàng 24/7 để giúp bạn giải quyết bất kỳ loại vấn đề nào thông qua Teamviewer.\n  </span>\n</p>', 'TODEK_C1_PRO', 3, 3, 4, 4300, '2021-07-18 10:55:53.3920943', '2021-07-25 19:10:02.2665219', 0, 1),
(4, 'Goldshell CK5', 'Máy đào Goldshell CK5 (12Th) hỗ trợ thuật toán Eaglesong với công suất 12Th/s, mức tiêu thụ điện năng 2400W.', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Các máy còn hàng sẽ được vận chuyển trong 48-72 giờ từ kho Vĩ Miner Shop Gia Lai.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Máy đào đã bán lại sẽ được giao sau 5-7 ngày.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    3. Chúng tôi kiểm tra tất cả các máy đào bán lại trước khi vận chuyển.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    4. Tất cả các máy đào sẽ được vận chuyển bằng đơn vị vận chuyển mà khách hàng đã chọn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    5. Chúng tôi sẽ cung cấp cho bạn mã số theo dõi trong 24-48 giờ sau khi máy đào được chuyển từ kho của chúng tôi qua email đã đăng ký của bạn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    6. Thông thường lô hàng mất 5-10 ngày để đến nơi.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    7. Chúng tôi sẽ thông báo cho bạn tất cả các cập nhật về đơn đặt hàng của bạn trên một email.\n  </span>\n</p>\n', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Goldshell\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  CK5\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Also known as\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  CKB Miner\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Release\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  March 2021\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  264 x 200 x 290mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Weight\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  8500g\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  80db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Fan(s)\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2400W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Voltage\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  220V\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Interface\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Ethernet\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 35 °C\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Humidity\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 95 %\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Khách hàng chọn thanh toán bằng các hình thức cho phép khi đặt hàng.\n  </span>\n</p>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Tất cả các máy đào mới (brand new) có 180 ngày bảo hành mặc định của nhà sản xuất.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Đội ngũ kỹ thuật của chúng tôi luôn sẵn sàng 24/7 để giúp bạn giải quyết bất kỳ loại vấn đề nào thông qua Teamviewer.\n  </span>\n</p>', 'GOLDCK5', 4, 4, 6, 10199, '2021-07-24 09:35:10.1137336', '2021-07-25 18:46:59.6760898', 0, 1),
(5, 'AvalonMiner 1146 – 56T', 'Máy đào AvalonMiner 1146 - 56T', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Các máy còn hàng sẽ được vận chuyển trong 48-72 giờ từ kho Vĩ Miner Shop Gia Lai.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Máy đào đã bán lại sẽ được giao sau 5-7 ngày.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    3. Chúng tôi kiểm tra tất cả các máy đào bán lại trước khi vận chuyển.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    4. Tất cả các máy đào sẽ được vận chuyển bằng đơn vị vận chuyển mà khách hàng đã chọn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    5. Chúng tôi sẽ cung cấp cho bạn mã số theo dõi trong 24-48 giờ sau khi máy đào được chuyển từ kho của chúng tôi qua email đã đăng ký của bạn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    6. Thông thường lô hàng mất 5-10 ngày để đến nơi.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    7. Chúng tôi sẽ thông báo cho bạn tất cả các cập nhật về đơn đặt hàng của bạn trên một email.\n  </span>\n</p>\n', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Canaan\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  AvalonMiner 1146-56T\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Hashrate\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  56TH/s， -3%~+3%\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power Efficiency	\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  57J/T, -5%~+5%@25℃\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power Consumption\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  3192W, -5%~+8%@Wall-Plug\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power Supply AC Input	\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  185~285V AC 50~60Hz 16A (Max)\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Smart Controller\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Canaan Kendryte K210 Artificial Intelligence SOC\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Connection\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  RJ45 Ethernet 10/100M, Daisy-Chain Connection\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Operating Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  -5℃~+35℃\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Cooling\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  4 x 12038 FAN\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  75dB (Max)\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Net Dimensions\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  331mm x 195mm x 292mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Net Weight\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12.8kg\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Khách hàng chọn thanh toán bằng các hình thức cho phép khi đặt hàng.\n  </span>\n</p>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Tất cả các máy đào mới (brand new) có 180 ngày bảo hành mặc định của nhà sản xuất.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Đội ngũ kỹ thuật của chúng tôi luôn sẵn sàng 24/7 để giúp bạn giải quyết bất kỳ loại vấn đề nào thông qua Teamviewer.\n  </span>\n</p>', 'AVALON_1146_56T', 1, 5, 3, 2155, '2021-07-25 17:45:10.3352468', '2021-07-25 17:57:01.2064876', 0, 1),
(6, 'AvalonMiner 1246 – 90T', 'Máy đào AvalonMiner 1246 công suất 90TH/s và mức tiêu thụ điện 3420W.', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Các máy còn hàng sẽ được vận chuyển trong 48-72 giờ từ kho Vĩ Miner Shop Gia Lai.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Máy đào đã bán lại sẽ được giao sau 5-7 ngày.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    3. Chúng tôi kiểm tra tất cả các máy đào bán lại trước khi vận chuyển.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    4. Tất cả các máy đào sẽ được vận chuyển bằng đơn vị vận chuyển mà khách hàng đã chọn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    5. Chúng tôi sẽ cung cấp cho bạn mã số theo dõi trong 24-48 giờ sau khi máy đào được chuyển từ kho của chúng tôi qua email đã đăng ký của bạn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    6. Thông thường lô hàng mất 5-10 ngày để đến nơi.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    7. Chúng tôi sẽ thông báo cho bạn tất cả các cập nhật về đơn đặt hàng của bạn trên một email.\n  </span>\n</p>\n', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Canaan\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Avalon Miner 1246\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Hashrate\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  90TH/s -3%~+3%\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power Efficiency	\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  38J/TH, -5%~+5%@25℃\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power Consumption\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  3420W -5%~+8%@Wall-Plug\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Cooling \n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  4 x 12038 FANs\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Operating Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  -5℃~35℃\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Nosie \n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  75dB（Max）\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Net Dimensions\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  331mm x 195mm x 292mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Net Weight\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12.8kg\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Gross Dimensions\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  442mm x 405mm x 306mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Gross Weight\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  14.5kg\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Khách hàng chọn thanh toán bằng các hình thức cho phép khi đặt hàng.\n  </span>\n</p>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Tất cả các máy đào mới (brand new) có 180 ngày bảo hành mặc định của nhà sản xuất.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Đội ngũ kỹ thuật của chúng tôi luôn sẵn sàng 24/7 để giúp bạn giải quyết bất kỳ loại vấn đề nào thông qua Teamviewer.\n  </span>\n</p>', 'AVALON_1246_90T', 1, 6, 3, 5250, '2021-07-25 17:50:20.1015287', '2021-07-25 17:50:20.1015308', 0, 1),
(7, 'AvalonMiner 1166 – 68T', 'Máy đào AvalonMiner 1166 – 68T hỗ trợ thuật toán SHA-256 với công suất 68TH/s. Mức tiêu thụ điện năng 3196W.', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Các máy còn hàng sẽ được vận chuyển trong 48-72 giờ từ kho Vĩ Miner Shop Gia Lai.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Máy đào đã bán lại sẽ được giao sau 5-7 ngày.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    3. Chúng tôi kiểm tra tất cả các máy đào bán lại trước khi vận chuyển.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    4. Tất cả các máy đào sẽ được vận chuyển bằng đơn vị vận chuyển mà khách hàng đã chọn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    5. Chúng tôi sẽ cung cấp cho bạn mã số theo dõi trong 24-48 giờ sau khi máy đào được chuyển từ kho của chúng tôi qua email đã đăng ký của bạn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    6. Thông thường lô hàng mất 5-10 ngày để đến nơi.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    7. Chúng tôi sẽ thông báo cho bạn tất cả các cập nhật về đơn đặt hàng của bạn trên một email.\n  </span>\n</p>\n', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Canaan\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  AvalonMiner 1166-68T\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Hashrate\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  68TH/s， -3%~+3%\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power Efficiency	\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  47J/T, -5%~+5%@25℃\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power Consumption\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  3196W, -5%~+8%@Wall-Plug\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power Supply AC Input	\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  185~285V AC 50~60Hz 16A (Max)\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Smart Controller\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Canaan Kendryte K210 Artificial Intelligence SOC\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Connection\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  RJ45 Ethernet 10/100M, Daisy-Chain Connection\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Operating Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                 -5℃~+35℃\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Cooling\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  4 x 12038 FAN\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  75dB (Max)\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Net Dimensions\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  331mm x 195mm x 292mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Net Weight\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12.8kg\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Khách hàng chọn thanh toán bằng các hình thức cho phép khi đặt hàng.\n  </span>\n</p>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Tất cả các máy đào mới (brand new) có 180 ngày bảo hành mặc định của nhà sản xuất.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Đội ngũ kỹ thuật của chúng tôi luôn sẵn sàng 24/7 để giúp bạn giải quyết bất kỳ loại vấn đề nào thông qua Teamviewer.\n  </span>\n</p>', 'AVALON_1166_68T', 1, 7, 3, 2299, '2021-07-25 17:54:56.8513780', '2021-07-25 17:54:56.8513790', 0, 1),
(8, 'Bitmain Antminer L7 (9.5Gh)', 'Bitmain Antminer L7 (9.5GH) hỗ trợ thuật toán Scrypt với công suất 9.5 GH/s. Mức tiêu thụ điện 3425W.', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Các máy còn hàng sẽ được vận chuyển trong 48-72 giờ từ kho Vĩ Miner Shop Gia Lai.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Máy đào đã bán lại sẽ được giao sau 5-7 ngày.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    3. Chúng tôi kiểm tra tất cả các máy đào bán lại trước khi vận chuyển.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    4. Tất cả các máy đào sẽ được vận chuyển bằng đơn vị vận chuyển mà khách hàng đã chọn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    5. Chúng tôi sẽ cung cấp cho bạn mã số theo dõi trong 24-48 giờ sau khi máy đào được chuyển từ kho của chúng tôi qua email đã đăng ký của bạn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    6. Thông thường lô hàng mất 5-10 ngày để đến nơi.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    7. Chúng tôi sẽ thông báo cho bạn tất cả các cập nhật về đơn đặt hàng của bạn trên một email.\n  </span>\n</p>\n', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Bitmain\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Antminer L7 (9.5Gh)\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Also known as\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Antminer L7 9500Mh\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Release\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  November 2021\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  195 x 290 x 370mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Weight	\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  7500g\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  75db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Fan(s)\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  4\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  3425W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Interface\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Ethernet\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 45 °C\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Humidity\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 95 %\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Khách hàng chọn thanh toán bằng các hình thức cho phép khi đặt hàng.\n  </span>\n</p>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Tất cả các máy đào mới (brand new) có 180 ngày bảo hành mặc định của nhà sản xuất.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Đội ngũ kỹ thuật của chúng tôi luôn sẵn sàng 24/7 để giúp bạn giải quyết bất kỳ loại vấn đề nào thông qua Teamviewer.\n  </span>\n</p>', 'ANTMINER_L7_95G', 5, 8, 5, 17599, '2021-07-25 18:07:59.5458734', '2021-07-25 18:10:36.8589638', 0, 1),
(9, 'Goldshell KD BOX (1.6Th)', 'Máy đào Goldshell KD BOX (1.6Th) hỗ trợ thuật toán Kadena với công suất 1.6TH/s. Mức tiêu thụ điện năng 205W.', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Các máy còn hàng sẽ được vận chuyển trong 48-72 giờ từ kho Vĩ Miner Shop Gia Lai.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Máy đào đã bán lại sẽ được giao sau 5-7 ngày.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    3. Chúng tôi kiểm tra tất cả các máy đào bán lại trước khi vận chuyển.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    4. Tất cả các máy đào sẽ được vận chuyển bằng đơn vị vận chuyển mà khách hàng đã chọn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    5. Chúng tôi sẽ cung cấp cho bạn mã số theo dõi trong 24-48 giờ sau khi máy đào được chuyển từ kho của chúng tôi qua email đã đăng ký của bạn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    6. Thông thường lô hàng mất 5-10 ngày để đến nơi.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    7. Chúng tôi sẽ thông báo cho bạn tất cả các cập nhật về đơn đặt hàng của bạn trên một email.\n  </span>\n</p>\n', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Goldshell\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  KD BOX (1.6 TH/S)\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Release\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  May 2021\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Dimensions\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  18*15*8.5CM\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  30db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  205W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Wires\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  PSU included\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Interface\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  USB\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Khách hàng chọn thanh toán bằng các hình thức cho phép khi đặt hàng.\n  </span>\n</p>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Tất cả các máy đào mới (brand new) có 180 ngày bảo hành mặc định của nhà sản xuất.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Đội ngũ kỹ thuật của chúng tôi luôn sẵn sàng 24/7 để giúp bạn giải quyết bất kỳ loại vấn đề nào thông qua Teamviewer.\n  </span>\n</p>', 'GOLDSHELL_1_6TH', 4, 9, 6, 2499, '2021-07-25 18:18:40.3761131', '2021-07-25 18:18:55.1552218', 0, 1);
INSERT INTO `vms_products` (`Id`, `Name`, `Desc`, `NoteDesc`, `DetailDesc`, `PaymentDesc`, `WarrantyDesc`, `SKU`, `Category_id`, `Inventory_id`, `Algorithm_id`, `Price`, `Created_at`, `Updated_at`, `PricePromotion`, `isActive`) VALUES
(10, 'MicroBT Whatsminer M32S (52TH)', 'Máy đào MicroBT Whatsminer M32S (52TH) hỗ trợ thuật toán SHA-256 với công suất 52TH/s. Mức tiêu thụ điện năng 3120W.', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Các máy còn hàng sẽ được vận chuyển trong 48-72 giờ từ kho Vĩ Miner Shop Gia Lai.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Máy đào đã bán lại sẽ được giao sau 5-7 ngày.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    3. Chúng tôi kiểm tra tất cả các máy đào bán lại trước khi vận chuyển.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    4. Tất cả các máy đào sẽ được vận chuyển bằng đơn vị vận chuyển mà khách hàng đã chọn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    5. Chúng tôi sẽ cung cấp cho bạn mã số theo dõi trong 24-48 giờ sau khi máy đào được chuyển từ kho của chúng tôi qua email đã đăng ký của bạn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    6. Thông thường lô hàng mất 5-10 ngày để đến nơi.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    7. Chúng tôi sẽ thông báo cho bạn tất cả các cập nhật về đơn đặt hàng của bạn trên một email.\n  </span>\n</p>\n', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  MicroBT\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Whatsminer M32S\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Release\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  June 2020\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  230 x 350 x 490mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  75db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Fan(s)\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  3120W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Interface\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Ethernet\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  0 – 45 °C\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Humidity\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 95 %\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Khách hàng chọn thanh toán bằng các hình thức cho phép khi đặt hàng.\n  </span>\n</p>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Tất cả các máy đào mới (brand new) có 180 ngày bảo hành mặc định của nhà sản xuất.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Đội ngũ kỹ thuật của chúng tôi luôn sẵn sàng 24/7 để giúp bạn giải quyết bất kỳ loại vấn đề nào thông qua Teamviewer.\n  </span>\n</p>', 'WHATSMINER_M32S_52TH', 1, 10, 3, 2765.98, '2021-07-25 18:23:56.8050939', '2021-07-25 18:27:04.1759186', 1175.53, 1),
(11, 'MicroBT Whatsminer M30++ (110Th)', 'Máy đào MicroBT Whatsminer M30++ (110Th) hỗ trợ thuật toán SHA-256. Mức tiêu thụ điện năng 3410W.', '', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  MicroBT\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Whatsminer M30S++\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Release\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  April 2020\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  125 x 225 x 425mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Chip size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12nm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  75db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Fan(s)\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  3472W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Voltage\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12V\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 40 °C\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Humidity\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 90 %\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', NULL, NULL, 'MICROBT_M30_PP_110TH', 6, 11, 3, 7690, '2021-07-25 18:34:14.5544749', '2021-07-25 18:34:14.5544756', 0, 1),
(12, 'MicroBT Whatsminer M30s++ (108TH)', 'Máy đào MicroBT Whatsminer M30s++ (108Th) hỗ trợ thuật toán SHA-256 với công suất 108TH/s. Mức tiêu thụ điện năng 3348W.', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Các máy còn hàng sẽ được vận chuyển trong 48-72 giờ từ kho Vĩ Miner Shop Gia Lai.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Máy đào đã bán lại sẽ được giao sau 5-7 ngày.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    3. Chúng tôi kiểm tra tất cả các máy đào bán lại trước khi vận chuyển.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    4. Tất cả các máy đào sẽ được vận chuyển bằng đơn vị vận chuyển mà khách hàng đã chọn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    5. Chúng tôi sẽ cung cấp cho bạn mã số theo dõi trong 24-48 giờ sau khi máy đào được chuyển từ kho của chúng tôi qua email đã đăng ký của bạn.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    6. Thông thường lô hàng mất 5-10 ngày để đến nơi.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    7. Chúng tôi sẽ thông báo cho bạn tất cả các cập nhật về đơn đặt hàng của bạn trên một email.\n  </span>\n</p>\n', '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  MicroBT\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Whatsminer M30S++\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Release\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  April 2020\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  125 x 225 x 425mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Chip size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12nm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  75db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Fan(s)\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  3348W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Voltage\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12V\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 40 °C\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Humidity\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 90 %\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Khách hàng chọn thanh toán bằng các hình thức cho phép khi đặt hàng.\n  </span>\n</p>\n', '<p class=\"product-detail-paragraph\">\n  <span>\n    1. Tất cả các máy đào mới (brand new) có 180 ngày bảo hành mặc định của nhà sản xuất.\n  </span>\n</p>\n<p class=\"product-detail-paragraph\">\n  <span>\n    2. Đội ngũ kỹ thuật của chúng tôi luôn sẵn sàng 24/7 để giúp bạn giải quyết bất kỳ loại vấn đề nào thông qua Teamviewer.\n  </span>\n</p>', 'MICRO_M30S_108TH', 6, 12, 3, 7698, '2021-07-25 18:41:57.5610328', '2021-07-25 18:54:23.3112415', 0, 1),
(13, 'StrongU STU-U6 (440GH)', 'Máy đào StrongU STU-U6 (440GH) hỗ trợ thuật toán X11 với công suất 440GH/s. Mức tiêu thụ điện năng 2200W.', NULL, '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  StrongU\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                 STU-U6\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Release\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  November 2019\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  135 x 208 x 370mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Weight\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  7200g\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  76db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Fan(s)\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2200W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Voltage\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12V\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Interface\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Ethernet\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 40 °C\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Humidity\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 95 %\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', NULL, NULL, 'STRONGU_STU_U6_440GH', 1, 13, 7, 3700, '2021-07-25 18:57:37.9491736', '2021-07-25 19:11:00.8082875', 0, 1),
(14, 'StrongU Hornbill H8 (74Th)', 'Máy đào StrongU Hornbill H8 (74Th) hỗ trợ thuật toán SHA-256. Mức tiêu thụ điện năng 3330W.', NULL, '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  StrongU\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                 Hornbill H8\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Release\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  April 2021\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  155 x 223 x 390mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Weight\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  11500g\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  76db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Fan(s)\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  3330W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Voltage\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12V\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Interface\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Ethernet\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 40 °C\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Humidity\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  5 – 95 %\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', NULL, NULL, 'STRONGU_HORNBILL_H8_74T', 7, 14, 3, 4899, '2021-07-25 19:02:20.9193187', '2021-07-25 19:05:13.6095351', 0, 1),
(15, 'StrongU STU-U6 Pro', NULL, '<table class=\"product-detail-table\">\n    <tbody>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Manufacturer\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  StrongU\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Model\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                 STU-U6 Pro\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Size\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  370 x 135 x 208mm\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Weight\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  8200g\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Noise level\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  76db\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Fan(s)\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Power\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  2145W\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Voltage\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  12V\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Interface\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  Ethernet\n                </span>\n            </td>\n        </tr>\n        <tr>\n            <td class=\"title\">\n                <span>\n                  Temperature\n                </span>\n            </td>\n            <td class=\"content\">\n                <span>\n                  0 – 40 °C\n                </span>\n            </td>\n        </tr>\n    </tbody>\n</table>\n', NULL, NULL, NULL, 'STRONGU_STU_U6_PRO', 7, 15, 7, 6250, '2021-07-25 19:09:10.8509908', '2021-07-25 19:09:10.8509914', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_productsoldoutnotify`
--

CREATE TABLE `vms_productsoldoutnotify` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` varchar(27) DEFAULT NULL,
  `updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_productsoldoutnotify`
--

INSERT INTO `vms_productsoldoutnotify` (`Id`, `User_id`, `Product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 5, '2021-07-22 14:10:44.2178778', '2021-07-22 14:10:44.2179564');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_repair`
--

CREATE TABLE `vms_repair` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `TicketReason` longtext,
  `TrackingNo` longtext,
  `ShippingLogisticsId` int(11) DEFAULT NULL,
  `CustomerAddress` longtext,
  `RepairSiteId` varchar(450) DEFAULT NULL,
  `ReturnLogisticsId` int(11) DEFAULT NULL,
  `Remark` longtext,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_repair`
--

INSERT INTO `vms_repair` (`Id`, `User_id`, `Status`, `TicketReason`, `TrackingNo`, `ShippingLogisticsId`, `CustomerAddress`, `RepairSiteId`, `ReturnLogisticsId`, `Remark`, `Created_at`, `Updated_at`) VALUES
(1, 1, 3, 'APPLY_FOR_REPAIR', '51423365', 1, '180, 180, 180, 180, 180, 180, 180', 'MAIMAX81', 1, '', '2021-07-12 16:22:13.1645153', '2021-07-12 16:22:13.1645610'),
(2, 9, 2, 'APPLY_FOR_REPAIR', '51423365', 1, '123, 123, 123, BH, 123, 123, 123', 'MAIMAX81', 1, '', '2021-07-25 02:27:00.7519584', '2021-07-25 02:27:00.7520341');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_repairitem`
--

CREATE TABLE `vms_repairitem` (
  `Id` int(11) NOT NULL,
  `RepairId` int(11) DEFAULT NULL,
  `Product_id` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Remark` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_repairitem`
--

INSERT INTO `vms_repairitem` (`Id`, `RepairId`, `Product_id`, `Quantity`, `Remark`) VALUES
(1, 1, 1, 19, 'Máy nát như con trâu mà trâu bị thiến'),
(2, 2, 2, 5, 'Abc123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_repairorder`
--

CREATE TABLE `vms_repairorder` (
  `Id` int(11) NOT NULL,
  `Repair_id` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Provider` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL,
  `Payment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_repairorder`
--

INSERT INTO `vms_repairorder` (`Id`, `Repair_id`, `Status`, `Provider`, `Price`, `Created_at`, `Updated_at`, `Payment_id`) VALUES
(2, 1, 2, 4, 19, '2021-07-14 14:41:30.8334417', '2021-07-14 14:41:30.8335051', 4),
(3, 2, 2, 4, 80, '2021-07-25 02:29:57.0315550', '2021-07-25 02:29:57.0316202', 46);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_repairsite`
--

CREATE TABLE `vms_repairsite` (
  `Code` varchar(450) NOT NULL,
  `Name` longtext,
  `ExtraInfo` longtext,
  `Note` longtext,
  `Location` longtext,
  `isDisabled` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_repairsite`
--

INSERT INTO `vms_repairsite` (`Code`, `Name`, `ExtraInfo`, `Note`, `Location`, `isDisabled`) VALUES
('MAIMAX81', 'MaiMax 81 Gia Lai', NULL, NULL, 'Gia Lai', 0),
('sdsdsd', 'SDSD372', NULL, NULL, 'Bà Rịa - Vũng Tàu', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_rolevars`
--

CREATE TABLE `vms_rolevars` (
  `Id` int(11) NOT NULL,
  `RoleName` longtext,
  `IsAdmin` longtext,
  `IsSeller` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_rolevars`
--

INSERT INTO `vms_rolevars` (`Id`, `RoleName`, `IsAdmin`, `IsSeller`) VALUES
(1, 'MEMBER', '0', '0'),
(2, 'ADMIN', '1', '0'),
(3, 'BANNED', '0', '0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_shippingmethod`
--

CREATE TABLE `vms_shippingmethod` (
  `Id` int(11) NOT NULL,
  `Name` longtext,
  `ShortName` longtext,
  `repairFlag` longtext,
  `salesFlag` longtext,
  `supportFreeShip` longtext,
  `erpCode` longtext,
  `logoUrl` longtext,
  `avgfeeperkm` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_shippingmethod`
--

INSERT INTO `vms_shippingmethod` (`Id`, `Name`, `ShortName`, `repairFlag`, `salesFlag`, `supportFreeShip`, `erpCode`, `logoUrl`, `avgfeeperkm`) VALUES
(1, 'Giao Hàng Tiết Kiệm', 'GHTK', '0', '1', '0', '000', 'http://localhost:4200/admin/shipping/add', 1.74),
(2, 'Tổng Công ty cổ phần bưu chính Viettel', 'VIETTELPOST', '1', '1', '0', '002', 'https://viettelpost.com.vn/wp-content/uploads/2019/11/logo-380x270.jpg', 0.22),
(3, 'Tổng công ty bưu điện việt nam', 'VNPOST', '1', '1', '0', '003', 'https://congtyquyetthang.com/wp-content/uploads/2020/10/buu-dien-vnpost-1280x720-1.png', 0.41),
(4, 'Giao Hàng Nhanh', 'GHN', '0', '1', '0', '004', 'https://suno.vn/blog/wp-content/uploads/2018/11/141139logos-768x274.jpg', 3.7),
(5, 'CÔNG TY CỔ PHẦN SGLOBAL', 'SSHIP', '1', '1', '0', '005', 'https://s.sship.vn/Content/images/sship_footer.png', 0.17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_shoppingsessions`
--

CREATE TABLE `vms_shoppingsessions` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Coupon_id` int(11) DEFAULT NULL,
  `Discount_id` int(11) DEFAULT NULL,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_shoppingsessions`
--

INSERT INTO `vms_shoppingsessions` (`Id`, `User_id`, `Total`, `Coupon_id`, `Discount_id`, `Created_at`, `Updated_at`) VALUES
(6, 2, 0, NULL, NULL, '2021-07-17 20:50:34.9330369', '2021-07-17 20:50:34.9329579'),
(19, 4, 0, NULL, NULL, '2021-07-24 22:50:57.6199872', '2021-07-24 22:50:57.6199183'),
(24, 9, 0, NULL, NULL, '2021-07-25 02:06:30.1308527', '2021-07-25 02:06:30.1308516'),
(25, 9, 0, NULL, NULL, '2021-07-25 02:06:30.4066059', '2021-07-25 02:06:30.4066050'),
(26, 3, 0, NULL, NULL, '2021-07-25 03:06:29.7098342', '2021-07-25 03:06:29.7097014'),
(28, 1, 0, NULL, NULL, '2021-07-26 15:45:11.0013510', '2021-07-26 15:45:10.9913441'),
(30, 21, 0, NULL, NULL, '2021-07-27 17:53:39.3540640', '2021-07-27 17:53:39.3539713'),
(31, 22, 0, NULL, NULL, '2021-07-27 17:54:05.2845801', '2021-07-27 17:54:05.2845761'),
(32, 25, 0, NULL, NULL, '2021-07-27 17:54:34.6863000', '2021-07-27 17:54:34.6862989'),
(33, 26, 0, NULL, NULL, '2021-07-29 23:24:17.9262729', '2021-07-29 23:24:17.9259478'),
(34, 27, 0, NULL, NULL, '2022-04-09 05:32:23', '2022-04-09 05:32:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_slideimage`
--

CREATE TABLE `vms_slideimage` (
  `Id` int(11) NOT NULL,
  `Name` longtext,
  `FillColor` longtext,
  `ImgUrl` longtext,
  `JumpTo` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_slideimage`
--

INSERT INTO `vms_slideimage` (`Id`, `Name`, `FillColor`, `ImgUrl`, `JumpTo`) VALUES
(2, 'Innosilicon A10 Pro+ 750MH/S', '444444', 'https://cdn.notevn.com/JgpENhLQc.png', '/detail/1'),
(3, 'Canaan Avalon Miner 1166 Pro', '5d2727', 'https://cdn.notevn.com/UbFVsmMc7.png', '/detail/2'),
(4, 'Todek Toddminer C1 Pro', '010920', 'https://cdn.notevn.com/JsmwdhjPq.png', '/detail/3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_sysdiagrams`
--

CREATE TABLE `vms_sysdiagrams` (
  `name` varchar(128) DEFAULT NULL,
  `principal_id` int(11) DEFAULT NULL,
  `diagram_id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_useraddresss`
--

CREATE TABLE `vms_useraddresss` (
  `Id` int(11) NOT NULL,
  `isDefault` tinyint(4) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Address` longtext,
  `Street_name` longtext,
  `City` longtext,
  `Postal_code` longtext,
  `Country` longtext,
  `Telephone` longtext,
  `Mobile` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_useraddresss`
--

INSERT INTO `vms_useraddresss` (`Id`, `isDefault`, `User_id`, `Address`, `Street_name`, `City`, `Postal_code`, `Country`, `Telephone`, `Mobile`) VALUES
(4, 1, 9, '123', '123', '123', '123', 'BH', '123', '123'),
(5, 1, 1, '18', 'Trần Phú', 'Pleiku', '600000', 'VN', '0905182544', '0942503749'),
(6, 0, 1, '28', 'Xô Viết Nghệ Tĩnh, phường 27, quận Bình Thạnh', 'Hồ Chí Minh', '670000', 'VN', '0942503341', '0905182415');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_usercredentialsverify`
--

CREATE TABLE `vms_usercredentialsverify` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `EmailVerifyCode` longtext,
  `ResendMailAt` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_usercredentialsverify`
--

INSERT INTO `vms_usercredentialsverify` (`Id`, `User_id`, `EmailVerifyCode`, `ResendMailAt`) VALUES
(1, 1, NULL, '2021-07-11 21:01:18.9244667'),
(2, 4, '9OBQMZDKAR', '2021-07-24 22:46:40.9904537'),
(3, 5, NULL, '2021-07-24 23:42:06.7705167'),
(4, 6, 'TYCGGPBYIW', '2021-07-24 23:48:35.6693675'),
(5, 7, 'KNE3HQ4DTD', '2021-07-24 23:53:25.6913607'),
(6, 8, 'ZLN96OQOKO', '2021-07-24 23:56:28.9992777'),
(7, 9, NULL, '2021-07-25 00:02:07.4701995'),
(8, 26, NULL, '2021-07-29 23:22:54.5268600');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_userpayments`
--

CREATE TABLE `vms_userpayments` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `payment_type` longtext,
  `provider` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_userrecord`
--

CREATE TABLE `vms_userrecord` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `ActivityName` longtext,
  `UserAgent` longtext,
  `loglevel` int(11) DEFAULT NULL,
  `ip` longtext,
  `Created_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_userrecord`
--

INSERT INTO `vms_userrecord` (`Id`, `User_id`, `ActivityName`, `UserAgent`, `loglevel`, `ip`, `Created_at`) VALUES
(1, 1, 'Đăng nhập', '', 2, '::1', '2021-07-11 21:01:25.5266697'),
(2, 1, 'Đăng nhập', '', 2, '::1', '2021-07-11 21:06:18.2229669'),
(3, 1, 'Đăng nhập', '', 2, '::1', '2021-07-12 08:10:21.6143619'),
(4, 1, 'Đăng nhập', '', 2, '::1', '2021-07-12 10:04:52.6305080'),
(5, 1, 'Đăng nhập', '', 2, '::1', '2021-07-13 13:08:41.1118646'),
(6, 1, 'Đăng nhập', '', 2, '::1', '2021-07-13 19:19:45.3153085'),
(7, 1, 'Đăng nhập', '', 2, '::1', '2021-07-14 00:14:08.2333750'),
(8, 1, 'Đăng nhập', '', 2, '::1', '2021-07-14 09:02:01.9568930'),
(9, 1, 'Đăng nhập', '', 2, '::1', '2021-07-14 12:07:09.9573694'),
(10, 1, 'Đăng nhập', '', 2, '::1', '2021-07-14 12:52:24.0464786'),
(11, 1, 'Đăng nhập', '', 2, '::1', '2021-07-14 13:00:20.4192332'),
(12, 1, 'Đăng nhập', '', 2, '::1', '2021-07-14 13:17:53.2251599'),
(13, 1, 'Đăng nhập', '', 2, '::1', '2021-07-16 10:20:09.4086044'),
(14, 1, 'Đăng nhập', '', 2, '::1', '2021-07-16 17:00:24.9158617'),
(15, 1, 'Đăng nhập', '', 2, '::1', '2021-07-16 18:30:41.1871633'),
(16, 1, 'Đăng nhập', '', 2, '::1', '2021-07-16 19:10:48.5220793'),
(17, 1, 'Đăng nhập', '', 2, '::1', '2021-07-16 19:42:04.8729037'),
(18, 1, 'Đăng nhập', '', 2, '::1', '2021-07-16 22:05:46.1352227'),
(19, 2, 'Đăng nhập', '', 2, '::1', '2021-07-17 20:50:34.1559045'),
(20, 1, 'Đăng nhập', '', 2, '::1', '2021-07-17 21:33:02.6486846'),
(21, 1, 'Đăng nhập', '', 2, '::1', '2021-07-17 23:47:04.6907433'),
(22, 1, 'Đăng nhập', '', 2, '::1', '2021-07-18 08:54:47.9938268'),
(23, 1, 'Đăng nhập', '', 2, '::1', '2021-07-18 09:49:52.9535333'),
(24, 1, 'Đăng nhập', '', 2, '::1', '2021-07-19 15:01:36.8386510'),
(25, 1, 'Đăng nhập', '', 2, '::1', '2021-07-19 17:08:42.7168531'),
(26, 1, 'Đăng nhập', '', 2, '::1', '2021-07-20 11:39:16.0563575'),
(27, 1, 'Đăng nhập', '', 2, '::1', '2021-07-20 17:16:33.9515211'),
(28, 1, 'Đăng nhập', '', 2, '::1', '2021-07-20 20:47:57.4060352'),
(29, 1, 'Đăng nhập', '', 2, '::1', '2021-07-21 13:08:13.6129578'),
(30, 1, 'Đăng nhập', '', 2, '::1', '2021-07-23 02:11:54.3797788'),
(31, 1, 'Đăng nhập', '', 2, '::1', '2021-07-23 11:47:52.8597405'),
(32, 1, 'Đăng nhập', '', 2, '::1', '2021-07-23 12:29:07.5015651'),
(33, 1, 'Đăng nhập', '', 2, '::1', '2021-07-23 20:55:37.8630943'),
(34, 1, 'Đăng nhập', '', 2, '::1', '2021-07-23 21:26:29.8526044'),
(35, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 11:30:25.3241102'),
(36, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 12:54:08.2642392'),
(37, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 13:57:37.1339331'),
(38, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 20:56:26.9682234'),
(39, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 20:58:39.7350825'),
(40, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 21:01:57.3725256'),
(41, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 21:02:38.1845357'),
(42, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 21:03:09.4580138'),
(43, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 21:03:32.3242187'),
(44, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 22:15:57.9388797'),
(45, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 22:16:28.0713381'),
(46, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 22:24:34.9398723'),
(47, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 22:42:29.5017909'),
(48, 1, 'Đăng nhập', '', 2, '::1', '2021-07-24 22:43:22.3489379'),
(49, 4, 'Đăng nhập', '', 2, '::1', '2021-07-24 22:46:48.3956386'),
(50, 4, 'Đăng nhập', '', 2, '::1', '2021-07-24 22:55:18.1885722');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_userrecovery`
--

CREATE TABLE `vms_userrecovery` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `recoveryCode` longtext,
  `IsUsed` tinyint(4) DEFAULT NULL,
  `Created_at` varchar(27) DEFAULT NULL,
  `Updated_at` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_userrecovery`
--

INSERT INTO `vms_userrecovery` (`Id`, `User_id`, `recoveryCode`, `IsUsed`, `Created_at`, `Updated_at`) VALUES
(1, 9, 'ZNFDUFT5OOH', 0, '2021-07-25 02:46:56.8273439', '2021-07-25 02:46:56.8274145'),
(2, 9, 'V77ZO6LC5Q7', 1, '2021-07-25 02:51:29.2660647', '2021-07-25 02:51:29.2660764'),
(3, 9, '5UA41801XRW', 1, '2021-07-26 10:41:23.7584070', '2021-07-26 10:41:23.7584851'),
(4, 1, 'IA8G597OVJK', 1, '2021-07-26 10:45:55.1892515', '2021-07-26 10:45:55.1892591'),
(5, 9, '84NTWT6LZOL', 1, '2021-07-29 10:35:57.6218191', '2021-07-29 10:35:57.6219449'),
(6, 9, 'JB6V4I9WHHD', 1, '2021-07-29 14:43:55.6946114', '2021-07-29 14:43:55.6946412');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_userroles`
--

CREATE TABLE `vms_userroles` (
  `Id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `UserDefine` int(11) DEFAULT NULL,
  `RoleVarId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vms_users`
--

CREATE TABLE `vms_users` (
  `id` int(11) NOT NULL,
  `FirstName` varchar(63) DEFAULT NULL,
  `LastName` varchar(63) DEFAULT NULL,
  `username` varchar(127) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `Telephone` varchar(15) DEFAULT NULL,
  `LoginFailedCount` int(11) DEFAULT NULL,
  `password` varchar(2047) NOT NULL,
  `PasswordHash` longblob,
  `PasswordSalt` longblob,
  `isSubscribedToMailing` tinyint(4) DEFAULT NULL,
  `RoleVar_Id` int(11) DEFAULT NULL,
  `ReferralCode` longtext,
  `ReferralBy` longtext,
  `created_at` varchar(27) DEFAULT NULL,
  `updated_at` varchar(27) DEFAULT NULL,
  `SocialID` varchar(255) DEFAULT NULL,
  `UserImage` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vms_users`
--

INSERT INTO `vms_users` (`id`, `FirstName`, `LastName`, `username`, `email`, `Telephone`, `LoginFailedCount`, `password`, `PasswordHash`, `PasswordSalt`, `isSubscribedToMailing`, `RoleVar_Id`, `ReferralCode`, `ReferralBy`, `created_at`, `updated_at`, `SocialID`, `UserImage`) VALUES
(27, 'Vĩ', 'Lê Song', 'lesongvi', 'lesongvi@gmail.com', NULL, NULL, '$2y$10$ccpMtyY.BgRdJtxHZumRkenVjt3sadKYvmskPiZsoo7gElaVvahr.', NULL, NULL, NULL, 1, NULL, NULL, '2022-03-30 05:45:09', '2022-03-30 05:45:09', NULL, NULL),
(28, 'TRUONG', 'DIU', 'truongthidiu', 'diu@roleplay.vn', NULL, NULL, '$2y$10$LIxDH2utrfIPFvRR0ySvIOioeNaMzqXn.CWO2PeJ/2LV97uXanhjW', NULL, NULL, NULL, 1, NULL, NULL, '2022-04-09 05:10:44', '2022-04-09 05:10:44', NULL, NULL),
(29, 'Le', 'Song', 'lesongviphp', 'lesongviphp@gmail.com', NULL, NULL, '$2y$10$Lw1WLwsDTQ8TKpyCycIW7eakGhCQZNKGCyUhcMNeFXWzbojWWER66', NULL, NULL, NULL, 1, NULL, NULL, '2022-04-11 02:57:13', '2022-04-11 02:57:13', NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `vms_activity`
--
ALTER TABLE `vms_activity`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_algorithms`
--
ALTER TABLE `vms_algorithms`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_cartitems`
--
ALTER TABLE `vms_cartitems`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CartItem_ShoppingSession` (`Session_id`),
  ADD KEY `CartItem_Product` (`Product_id`);

--
-- Chỉ mục cho bảng `vms_coupon`
--
ALTER TABLE `vms_coupon`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Coupon_User` (`User_id`);

--
-- Chỉ mục cho bảng `vms_coupondonate`
--
ALTER TABLE `vms_coupondonate`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CouponDonate_User_1` (`User_id`),
  ADD KEY `CouponDonate_User_2` (`ReceiverId`),
  ADD KEY `CouponDonate_Coupon` (`CouponId`);

--
-- Chỉ mục cho bảng `vms_discounts`
--
ALTER TABLE `vms_discounts`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_failed_jobs`
--
ALTER TABLE `vms_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `vms_hpnotice`
--
ALTER TABLE `vms_hpnotice`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_migrations`
--
ALTER TABLE `vms_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vms_orderdetails`
--
ALTER TABLE `vms_orderdetails`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_orderitems`
--
ALTER TABLE `vms_orderitems`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_password_resets`
--
ALTER TABLE `vms_password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `vms_paymentdetails`
--
ALTER TABLE `vms_paymentdetails`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_paymentprovider`
--
ALTER TABLE `vms_paymentprovider`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_personal_access_tokens`
--
ALTER TABLE `vms_personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `vms_productcategories`
--
ALTER TABLE `vms_productcategories`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_productimages`
--
ALTER TABLE `vms_productimages`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `product` (`Product_Id`);

--
-- Chỉ mục cho bảng `vms_productinventories`
--
ALTER TABLE `vms_productinventories`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_products`
--
ALTER TABLE `vms_products`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `productCategory` (`Category_id`),
  ADD KEY `productInventory` (`Inventory_id`),
  ADD KEY `algorithms` (`Algorithm_id`);

--
-- Chỉ mục cho bảng `vms_productsoldoutnotify`
--
ALTER TABLE `vms_productsoldoutnotify`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_repair`
--
ALTER TABLE `vms_repair`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_repairitem`
--
ALTER TABLE `vms_repairitem`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_repairorder`
--
ALTER TABLE `vms_repairorder`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_repairsite`
--
ALTER TABLE `vms_repairsite`
  ADD PRIMARY KEY (`Code`);

--
-- Chỉ mục cho bảng `vms_rolevars`
--
ALTER TABLE `vms_rolevars`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_shippingmethod`
--
ALTER TABLE `vms_shippingmethod`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_shoppingsessions`
--
ALTER TABLE `vms_shoppingsessions`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_slideimage`
--
ALTER TABLE `vms_slideimage`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_useraddresss`
--
ALTER TABLE `vms_useraddresss`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_usercredentialsverify`
--
ALTER TABLE `vms_usercredentialsverify`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_userpayments`
--
ALTER TABLE `vms_userpayments`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_userrecord`
--
ALTER TABLE `vms_userrecord`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_userrecovery`
--
ALTER TABLE `vms_userrecovery`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_userroles`
--
ALTER TABLE `vms_userroles`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vms_users`
--
ALTER TABLE `vms_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `vms_activity`
--
ALTER TABLE `vms_activity`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `vms_algorithms`
--
ALTER TABLE `vms_algorithms`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `vms_cartitems`
--
ALTER TABLE `vms_cartitems`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `vms_coupon`
--
ALTER TABLE `vms_coupon`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `vms_coupondonate`
--
ALTER TABLE `vms_coupondonate`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `vms_discounts`
--
ALTER TABLE `vms_discounts`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vms_failed_jobs`
--
ALTER TABLE `vms_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vms_hpnotice`
--
ALTER TABLE `vms_hpnotice`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `vms_migrations`
--
ALTER TABLE `vms_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `vms_orderdetails`
--
ALTER TABLE `vms_orderdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `vms_orderitems`
--
ALTER TABLE `vms_orderitems`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `vms_paymentdetails`
--
ALTER TABLE `vms_paymentdetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `vms_paymentprovider`
--
ALTER TABLE `vms_paymentprovider`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `vms_personal_access_tokens`
--
ALTER TABLE `vms_personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vms_productcategories`
--
ALTER TABLE `vms_productcategories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `vms_productimages`
--
ALTER TABLE `vms_productimages`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `vms_productinventories`
--
ALTER TABLE `vms_productinventories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `vms_products`
--
ALTER TABLE `vms_products`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `vms_productsoldoutnotify`
--
ALTER TABLE `vms_productsoldoutnotify`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `vms_repair`
--
ALTER TABLE `vms_repair`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `vms_repairitem`
--
ALTER TABLE `vms_repairitem`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `vms_repairorder`
--
ALTER TABLE `vms_repairorder`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `vms_rolevars`
--
ALTER TABLE `vms_rolevars`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `vms_shippingmethod`
--
ALTER TABLE `vms_shippingmethod`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `vms_shoppingsessions`
--
ALTER TABLE `vms_shoppingsessions`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `vms_slideimage`
--
ALTER TABLE `vms_slideimage`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `vms_useraddresss`
--
ALTER TABLE `vms_useraddresss`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `vms_usercredentialsverify`
--
ALTER TABLE `vms_usercredentialsverify`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `vms_userpayments`
--
ALTER TABLE `vms_userpayments`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vms_userrecord`
--
ALTER TABLE `vms_userrecord`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `vms_userrecovery`
--
ALTER TABLE `vms_userrecovery`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `vms_userroles`
--
ALTER TABLE `vms_userroles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vms_users`
--
ALTER TABLE `vms_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `vms_cartitems`
--
ALTER TABLE `vms_cartitems`
  ADD CONSTRAINT `CartItem_Product` FOREIGN KEY (`Product_id`) REFERENCES `vms_products` (`Id`),
  ADD CONSTRAINT `CartItem_ShoppingSession` FOREIGN KEY (`Session_id`) REFERENCES `vms_shoppingsessions` (`Id`);

--
-- Các ràng buộc cho bảng `vms_coupon`
--
ALTER TABLE `vms_coupon`
  ADD CONSTRAINT `Coupon_User` FOREIGN KEY (`User_id`) REFERENCES `vms_users` (`id`);

--
-- Các ràng buộc cho bảng `vms_coupondonate`
--
ALTER TABLE `vms_coupondonate`
  ADD CONSTRAINT `CouponDonate_Coupon` FOREIGN KEY (`CouponId`) REFERENCES `vms_coupon` (`Id`),
  ADD CONSTRAINT `CouponDonate_User_1` FOREIGN KEY (`User_id`) REFERENCES `vms_users` (`id`),
  ADD CONSTRAINT `CouponDonate_User_2` FOREIGN KEY (`ReceiverId`) REFERENCES `vms_users` (`id`);

--
-- Các ràng buộc cho bảng `vms_productimages`
--
ALTER TABLE `vms_productimages`
  ADD CONSTRAINT `product` FOREIGN KEY (`Product_Id`) REFERENCES `vms_products` (`Id`);

--
-- Các ràng buộc cho bảng `vms_products`
--
ALTER TABLE `vms_products`
  ADD CONSTRAINT `algorithms` FOREIGN KEY (`Algorithm_id`) REFERENCES `vms_algorithms` (`Id`),
  ADD CONSTRAINT `productCategory` FOREIGN KEY (`Category_id`) REFERENCES `vms_productcategories` (`Id`),
  ADD CONSTRAINT `productInventory` FOREIGN KEY (`Inventory_id`) REFERENCES `vms_productinventories` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
