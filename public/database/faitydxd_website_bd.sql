-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 27, 2021 at 01:50 AM
-- Server version: 10.3.28-MariaDB-log-cll-lve
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `faitydxd_website_bd`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 or 1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `designation`, `admin_type`, `phone`, `email`, `path`, `address`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(10, 'Muhibbullah', 'president', 'president', '01770989591', 'muhibbullah611@gmail.com', 'public/backend/img/profile/4523746-muhibbullah_1592907159.jpg', 'Topten', '$2y$10$96.0eeCg1NHy/JnOCSSy7OzoGg/1JjYC4VKInClb.PD0m4lT2ow7i', 1, NULL, '2019-11-30 21:06:41', '2019-11-30 21:06:41'),
(12, 'Admin', 'maneger', 'super_admin', '01700000000', 'admin@gmail.com', 'public/backend/img/profile/7510444-_1624045001.jpg', 'test', '$2y$10$xySBEYvobCLygLrP052peO0h45YnNr0U9XLEsloribbGwkUZx4Toy', 1, NULL, '2020-06-18 18:33:27', '2020-06-18 18:33:27'),
(16, 'Sana Ullah', NULL, 'admin', '01770989592', 'sana@gmail.com', 'public/backend/img/profile/2944036-_1624045238.jpg', NULL, '$2y$10$Spg3uUhcwNO0biIQQV7uyeTF.9zuj/DREWtjk4Tu8Wdj7qFhaBlKC', 1, NULL, '2021-06-19 01:40:38', '2021-06-19 01:40:38'),
(17, 'Muhibbullah Ansary', NULL, 'admin', '01770989594', 'muhib@gmail.com', 'public/backend/img/profile/6071889-_1624053276.png', NULL, '$2y$10$nacCvqn.5GN9LSC2rzMea.qLdFlt1cLbsBt3IAdN3qQti3zf29ej6', 1, NULL, '2021-06-19 03:54:36', '2021-06-19 03:54:36'),
(18, 'NURHAN', NULL, 'admin', '017XXXXXXXX', 'nurhan@gmail.com', NULL, NULL, '$2y$10$K0fqNfyiAxV2EQ/uUNGXtOEHDkhaVmL8ncAXw6n/aRiEeztYBEc9K', 1, NULL, '2021-06-20 14:50:35', '2021-06-20 14:50:35'),
(19, 'NIZAM', NULL, 'admin', '0170XXXXXXX', 'nizam@gmail.com', 'public/backend/img/profile/2809800-_1624181908.jpg', NULL, '$2y$10$LFiqeJTbW3YEmLoL7mSAhO2dCHGymBMypWtpRzI3NUUBbnoYr9YPq', 1, NULL, '2021-06-20 15:38:28', '2021-06-20 15:38:28'),
(20, 'ansary', NULL, 'admin', '0171xxxxxxx', 'ansary@gmail.com', 'public/backend/img/profile/9851574-_1624182001.jpg', NULL, '$2y$10$dNGGTig57I6bXk/fVnHsPe9IzRzTNCModoDR5iyXEqF93cJakIWie', 1, NULL, '2021-06-20 15:40:01', '2021-06-20 15:40:01'),
(21, 'RIYADH', NULL, 'admin', '0172XXXXXX', 'riyadh@gmail.com', 'public/backend/img/profile/4881813-_1624182136.jpg', NULL, '$2y$10$b1WuME83wGJqsS/VF6Q.ouLrLUURDGgozYBEtM.4dBABP2ucIhuqm', 1, NULL, '2021-06-20 15:42:16', '2021-06-20 15:42:16'),
(22, 'AYAH', NULL, 'admin', '0173xxxxxxx', 'ayah@gmail.com', 'public/backend/img/profile/2717556-_1624182250.jpg', NULL, '$2y$10$PrwMlpM7SxzXTHr1lvlf8.xvJrF0pyAi4yLK.iiP6q6L3Pkj83UNW', 1, NULL, '2021-06-20 15:44:10', '2021-06-20 15:44:10'),
(23, 'ZAINAB HASSAN', NULL, 'admin', '0175XXXXXXX', 'zainabhassan@gmail.com', 'public/backend/img/profile/9075762-_1624183382.jpg', NULL, '$2y$10$J4dPipx31WoJv5dScEJW9O.6Eucics9.DqjMhJTCtU/FU0Quq58de', 1, NULL, '2021-06-20 16:03:02', '2021-06-20 16:03:02'),
(24, 'M GAMAL', NULL, 'admin', '0176XXXXXXX', 'mgamal@gmail.com', 'public/backend/img/profile/2869996-_1624183447.jpg', NULL, '$2y$10$hJpratCxnGufbSKbX9QCn.Ks2kNKIXHWiCOHtAnxs4y2y7oFQrm96', 1, NULL, '2021-06-20 16:04:07', '2021-06-20 16:04:07'),
(25, 'SAMIRA', NULL, 'admin', '0178XXXXXXX', 'samira@gmail.com', 'public/backend/img/profile/3352597-_1624304161.JPG', NULL, '$2y$10$AyHpLXTJdJAD411C3HVdbO1yd6cIzRIxvRV3RoMRGmSVg5fPMAupS', 1, NULL, '2021-06-20 16:05:06', '2021-06-20 16:05:06'),
(26, 'RAGAB', NULL, 'admin', '0174XXXXXXX', 'ragab@gmail.com', 'public/backend/img/profile/9907487-_1624183563.jpg', NULL, '$2y$10$7/eFieV9D78JDksMdGJq3uQ4trjw7CFx03dTyvroPaXKFyIxvmSWG', 1, NULL, '2021-06-20 16:06:03', '2021-06-20 16:06:03'),
(27, 'ZAINAB', NULL, 'admin', '0177XXXXXXX', 'zainab@gmail.com', 'public/backend/img/profile/1796173-_1624183735.jpg', NULL, '$2y$10$jEbLpeP2uDc6Vm6tq18nRuI/1UqCEmAIzaq/35F/kRcR4Nh8/zAPi', 1, NULL, '2021-06-20 16:08:55', '2021-06-20 16:08:55'),
(28, 'KHOLOUD', NULL, 'admin', '016XXXXXXXXX', 'kholoud@gmail.com', 'public/backend/img/profile/2836566-_1624183904.jpg', NULL, '$2y$10$roXD/coRlTVmm3e8twz/2uyV/6ZulBoMvxRUyLFUeXjYxmtwMkQwK', 1, NULL, '2021-06-20 16:11:44', '2021-06-20 16:11:44'),
(29, 'HELAL', NULL, 'admin', '0167XXXXXXX', 'helal@gmail.com', 'public/backend/img/profile/87556-_1624183965.jpg', NULL, '$2y$10$24UnpxEEX7scIflWJ5NDK.wbv1wk5BKtP6wm5HFJn0DDEyRXBJ4Jq', 1, NULL, '2021-06-20 16:12:45', '2021-06-20 16:12:45'),
(30, 'KHALED', NULL, 'admin', '019XXXXXXXXX', 'khaled@gmail.com', 'public/backend/img/profile/3641706-_1624184069.jpg', NULL, '$2y$10$Y1ujn2ifW0af/um8VikvQOi3usQEi1Vob7Npf6JPeamsaydAMRBuO', 1, NULL, '2021-06-20 16:14:29', '2021-06-20 16:14:29'),
(31, 'OMAR', NULL, 'admin', '0191XXXXXXX', 'omar@gmail.com', 'public/backend/img/profile/6188278-_1624184141.jpg', NULL, '$2y$10$GhxwAHc6Fxy.vucjVRvI.OO5Sy3O2tSw04hO/NFm2vxszxNeoNmLe', 1, NULL, '2021-06-20 16:15:40', '2021-06-20 16:15:40'),
(32, 'ALI', NULL, 'admin', '0192XXXXXXX', 'ali@gmail.com', 'public/backend/img/profile/7833571-_1624184183.jpg', NULL, '$2y$10$sy4QVv46CNxGw7.jaF4ZxeVkbRuVyrDRqiznRBTswCeSTvzTpbSD.', 1, NULL, '2021-06-20 16:16:23', '2021-06-20 16:16:23'),
(33, 'OLA', NULL, 'admin', '0193XXXXXXX', 'ola@gmail.com', 'public/backend/img/profile/4710222-_1624184242.jpg', NULL, '$2y$10$iSeanRJkc1mFovfCj30X9u7ryv.w.f8zbMmedb5woqdkrgVzNGyc6', 1, NULL, '2021-06-20 16:17:22', '2021-06-20 16:17:22'),
(34, 'TAREQ', NULL, 'admin', '0194XXXXXXX', 'tareq@gmail.com', 'public/backend/img/profile/6111025-_1624184284.jpg', NULL, '$2y$10$BF9sVVVQclau.fUhd/ZmceMaC5T/MQIKxdhUKlNaUWsEF97r8uQ0.', 1, NULL, '2021-06-20 16:18:04', '2021-06-20 16:18:04'),
(35, 'OMAR MAHMUD SHAFIEE', NULL, 'admin', '0195XXXXXXX', 'omarmahmud@gmail.com', 'public/backend/img/profile/5812975-_1624184355.jpg', NULL, '$2y$10$wZRFnjcwgQZ9sw0Nq5hhpup58UNwx6uqnypCaaAZITDXW/bEk06iq', 1, NULL, '2021-06-20 16:19:15', '2021-06-20 16:19:15'),
(36, 'ESRAA SALLAM', NULL, 'admin', '0196XXXXXXX', 'israsallam@gmail.com', 'public/backend/img/profile/2463109-_1624184424.jpg', NULL, '$2y$10$E7podO3t.Gq.uNktlu4p1e/Bap7G75gVUy8whw1Zq6SrOSFbAHEn2', 1, NULL, '2021-06-20 16:20:24', '2021-06-20 16:20:24'),
(37, 'A.ASEM', NULL, 'admin', '0197XXXXXXX', 'aasem@gmail.com', 'public/backend/img/profile/4302459-_1624184563.jpg', NULL, '$2y$10$0T2QdIv/lKAD1elI4.TeTu/yIKUfUzj2zjNepLvzKOLwCWovMP/zy', 1, NULL, '2021-06-20 16:22:43', '2021-06-20 16:22:43'),
(38, 'BARAKAT', NULL, 'admin', '0198XXXXXXX', 'barakat@gmail.com', 'public/backend/img/profile/920081-_1624184640.jpg', NULL, '$2y$10$lQ.kVJET6ctaIiYhYB4Uzur3f.8AjCHOb/UnucbrX1A9N.9UHWJlC', 1, NULL, '2021-06-20 16:24:00', '2021-06-20 16:24:00'),
(39, 'ZAHRA', NULL, 'admin', '0199XXXXXXX', 'zahra@gmail.com', 'public/backend/img/profile/8197868-_1624184732.jpg', NULL, '$2y$10$6ngqrDVcAPUs18BsvX6DauSJ8DbGs0pVHg6KbQCQTPzLglagaFc4a', 1, NULL, '2021-06-20 16:25:32', '2021-06-20 16:25:32'),
(40, 'AHMED HASSAN', NULL, 'admin', '018XXXXXXXXX', 'ahmedhassan@gmail.com', 'public/backend/img/profile/2220657-_1624184806.jpg', NULL, '$2y$10$PRu53Cvwp.nZhbw2lzzchuLNEeR/c8MOCg92oYyofTWgxm7NeL0mG', 1, NULL, '2021-06-20 16:26:46', '2021-06-20 16:26:46'),
(41, 'HUSSIEN', NULL, 'admin', '0181XXXXXXX', 'hussien@gmail.com', 'public/backend/img/profile/8529446-_1624184893.jpg', NULL, '$2y$10$Vn9zih8jtkCZHV4MDUtGRe7ONBNEK0KQxxk3fw1Uza1LJ32N1HjIu', 1, NULL, '2021-06-20 16:28:13', '2021-06-20 16:28:13'),
(42, 'BASSANT', NULL, 'admin', '0182XXXXXXX', 'bassant@gmail.com', 'public/backend/img/profile/1954421-_1624184950.jpg', NULL, '$2y$10$RvInqvmKiuMPlnhl1dHzFOd.AJggNOwNF9wpMvDtC6jY4o2SHWGMW', 1, NULL, '2021-06-20 16:29:10', '2021-06-20 16:29:10'),
(43, 'SARA GUMMA', NULL, 'admin', '0183XXXXXXX', 'saragumma@gmail.com', 'public/backend/img/profile/7330886-_1624185004.jpg', NULL, '$2y$10$sIg82WBRK5p3Uba81rXQceqdhNF2sVZomYfurL3A3gQRs858GNVm6', 1, NULL, '2021-06-20 16:30:04', '2021-06-20 16:30:04'),
(44, 'MOHAMMED REFAAT', NULL, 'admin', '0184XXXXXXX', 'mohammedrefaat@gmail.com', 'public/backend/img/profile/5360882-_1624185067.jpg', NULL, '$2y$10$60hNRuKINm6p0EjyrzFA6OK34PZO.ziP.QP0K0MWAlxm9KrKKqWZW', 1, NULL, '2021-06-20 16:31:07', '2021-06-20 16:31:07'),
(45, 'YUSUF', NULL, 'admin', '0185XXXXXXX', 'yusuf@gmail.com', 'public/backend/img/profile/3040404-_1624185304.jpg', NULL, '$2y$10$53wo.1OkJdOvcRnBfuDMyO1s.GcLOl.b4ehAYBVzuQhVZ5JN6J1Wy', 1, NULL, '2021-06-20 16:35:04', '2021-06-20 16:35:04'),
(46, 'Mennatallah', NULL, 'admin', '01800000000', 'mennatallah@gmail.com', 'public/backend/img/profile/7470630-_1624200647.jpg', NULL, '$2y$10$ccBcId7h7gRq55VLAQmjje0qGEESjlJfn4K1FZ2lbL4G/9XXKN8qa', 1, NULL, '2021-06-20 20:49:55', '2021-06-20 20:49:55'),
(47, 'Fatima', NULL, 'admin', '00000000000', 'fatima@gmail.com', 'public/backend/img/profile/8775336-_1624212484.jpg', NULL, '$2y$10$AXdY9xKFP7TLET0CNyHS8ebivyJ66L4eeNO27tHkdbrfYStWqmvq2', 1, NULL, '2021-06-21 00:08:04', '2021-06-21 00:08:04'),
(48, 'Shafiee', NULL, 'admin', '01504000000', 'shafiee@gmail.com', 'public/backend/img/profile/8643454-_1624218723.jpg', NULL, '$2y$10$1T./uB5zEd33nCxbAJ8SLuN/V7QrpYQ6Lq.4r1lq2ixpAI.ubWh/q', 1, NULL, '2021-06-20 20:52:03', '2021-06-20 20:52:03'),
(49, 'A.aziz', NULL, 'admin', '01200000000', 'aaziz@gmail.com', 'public/backend/img/profile/8779971-_1624219490.jpg', NULL, '$2y$10$1wAsk7Tnp6fRYQ/dtYz7JOgyfbySCbqr2J/q/qkdJZFVR8ZDz4N9i', 1, NULL, '2021-06-20 21:04:50', '2021-06-20 21:04:50');

-- --------------------------------------------------------

--
-- Table structure for table `admin_meta`
--

CREATE TABLE `admin_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_privileges`
--

CREATE TABLE `admin_privileges` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `aside_menu_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aside_menu_dropdown_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_menu_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_privileges`
--

INSERT INTO `admin_privileges` (`id`, `admin_id`, `aside_menu_id`, `aside_menu_dropdown_id`, `option_menu_id`, `created_at`, `updated_at`) VALUES
(1, 7, '[\"61\",\"69\",\"68\",\"60\",\"65\",\"63\",\"64\",\"66\",\"67\",\"44\"]', '[\"70\",\"71\",\"72\",\"92\",\"93\",\"95\",\"98\",\"85\",\"86\",\"87\",\"67\",\"68\",\"69\",\"80\",\"81\",\"82\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"83\",\"96\",\"84\",\"90\",\"91\",\"21\",\"26\",\"27\"]', '[\"72\",\"73\",\"74\",\"75\",\"101\",\"104\",\"105\",\"106\",\"92\",\"93\",\"94\",\"95\",\"68\",\"70\",\"71\",\"77\",\"85\",\"86\",\"87\",\"88\",\"78\",\"79\",\"80\",\"81\",\"83\",\"89\",\"90\",\"91\",\"102\",\"103\",\"96\",\"97\",\"99\",\"100\",\"107\"]', '2019-10-04 00:26:33', '2020-06-23 14:29:03'),
(9, 8, '[\"39\",\"43\"]', '[\"16\",\"17\",\"18\",\"19\",\"20\"]', '[\"6\",\"7\",\"9\",\"10\",\"11\",\"12\"]', '2019-10-03 18:42:29', '2019-10-16 20:11:55'),
(12, 2, '[\"39\",\"43\"]', '[\"16\",\"17\"]', '[\"7\"]', '2019-10-03 21:30:04', '2019-10-03 21:59:41'),
(13, 4, '[\"39\",\"43\"]', '[\"16\",\"17\"]', '[\"7\"]', '2019-10-03 21:30:09', '2019-10-03 21:59:55'),
(14, 10, '[\"43\",\"44\",\"47\",\"48\",\"49\"]', '[\"18\",\"19\",\"20\",\"21\",\"26\",\"27\",\"28\",\"29\",\"30\",\"32\",\"33\",\"34\",\"35\",\"36\",\"37\"]', '[\"9\",\"10\",\"11\",\"12\",\"14\",\"15\",\"17\",\"18\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\"]', '2019-11-30 21:16:30', '2019-11-30 21:17:52'),
(15, 12, '[\"110\",\"109\",\"108\",\"107\",\"106\",\"105\",\"104\",\"102\",\"71\",\"79\",\"80\",\"84\",\"78\",\"44\"]', '[\"181\",\"182\",\"183\",\"177\",\"178\",\"179\",\"180\",\"174\",\"175\",\"176\",\"171\",\"172\",\"173\",\"168\",\"169\",\"170\",\"165\",\"166\",\"167\",\"162\",\"163\",\"164\",\"159\",\"155\",\"156\",\"157\",\"115\",\"116\",\"117\",\"106\",\"107\",\"108\",\"114\",\"119\",\"120\",\"131\",\"132\",\"133\",\"113\",\"124\",\"21\",\"26\",\"102\"]', '[\"218\",\"219\",\"220\",\"221\",\"214\",\"215\",\"216\",\"217\",\"210\",\"211\",\"212\",\"213\",\"206\",\"207\",\"208\",\"209\",\"202\",\"203\",\"204\",\"205\",\"198\",\"199\",\"200\",\"201\",\"194\",\"195\",\"196\",\"197\",\"190\",\"186\",\"187\",\"188\",\"189\",\"131\",\"132\",\"133\",\"134\",\"123\",\"124\",\"129\",\"130\",\"135\",\"136\",\"137\",\"138\",\"156\",\"157\",\"158\",\"159\",\"144\",\"145\",\"146\",\"147\"]', '2020-06-23 16:31:58', '2021-06-27 06:48:34'),
(16, 13, '[\"71\",\"61\",\"68\",\"60\",\"65\",\"63\",\"64\",\"66\",\"67\",\"69\",\"44\"]', '[\"70\",\"71\",\"72\",\"85\",\"86\",\"87\",\"67\",\"68\",\"69\",\"80\",\"81\",\"82\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"83\",\"96\",\"84\",\"90\",\"91\",\"92\",\"93\",\"95\",\"98\",\"21\",\"26\",\"102\"]', '[\"72\",\"73\",\"74\",\"75\",\"92\",\"93\",\"94\",\"95\",\"110\",\"68\",\"70\",\"71\",\"77\",\"85\",\"86\",\"87\",\"88\",\"78\",\"79\",\"80\",\"81\",\"83\",\"89\",\"90\",\"91\",\"102\",\"103\",\"96\",\"97\",\"99\",\"100\",\"107\",\"108\",\"105\",\"106\"]', '2020-07-03 18:06:56', '2020-10-05 17:31:49'),
(17, 14, '[\"70\",\"61\",\"69\",\"68\",\"60\",\"65\",\"63\",\"64\",\"66\",\"67\",\"44\"]', '[\"70\",\"71\",\"72\",\"92\",\"93\",\"95\",\"98\",\"85\",\"86\",\"87\",\"67\",\"68\",\"69\",\"80\",\"81\",\"82\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"83\",\"96\",\"84\",\"90\",\"91\",\"21\",\"26\",\"27\"]', '[\"72\",\"73\",\"74\",\"75\",\"101\",\"104\",\"105\",\"106\",\"92\",\"93\",\"94\",\"95\",\"110\",\"68\",\"70\",\"71\",\"77\",\"85\",\"86\",\"87\",\"88\",\"78\",\"79\",\"80\",\"81\",\"83\",\"89\",\"90\",\"91\",\"102\",\"103\",\"96\",\"97\",\"99\",\"100\",\"107\",\"108\"]', '2020-09-25 14:27:52', '2020-09-25 14:31:13'),
(18, 17, '[\"109\",\"108\"]', '[\"177\",\"178\",\"180\",\"174\",\"175\",\"176\"]', '[\"214\",\"210\",\"211\",\"212\",\"213\"]', '2021-06-19 04:00:47', '2021-06-19 10:47:26'),
(19, 16, '[\"110\",\"109\",\"108\",\"44\"]', '[\"181\",\"182\",\"183\",\"177\",\"178\",\"179\",\"180\",\"174\",\"175\",\"176\",\"102\"]', '[\"218\",\"219\",\"220\",\"221\",\"214\",\"215\",\"216\",\"217\",\"210\",\"211\",\"212\",\"213\"]', '2021-06-19 16:05:30', '2021-06-27 06:48:23'),
(20, 19, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 18:37:04', '2021-06-20 21:01:29'),
(21, 20, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:03:26', '2021-06-20 21:01:46'),
(22, 21, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:03:59', '2021-06-20 21:02:01'),
(23, 22, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:04:19', '2021-06-20 21:02:17'),
(24, 23, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:04:40', '2021-06-20 21:02:32'),
(25, 24, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:05:03', '2021-06-20 21:02:51'),
(26, 25, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:05:29', '2021-06-20 21:03:00'),
(27, 26, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:06:14', '2021-06-20 21:03:10'),
(28, 27, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:06:55', '2021-06-20 21:03:30'),
(29, 28, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:07:11', '2021-06-20 21:03:40'),
(30, 29, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:07:30', '2021-06-20 21:03:51'),
(31, 30, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:07:53', '2021-06-20 21:04:02'),
(32, 31, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:08:11', '2021-06-20 21:04:17'),
(33, 32, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:08:26', '2021-06-20 21:07:52'),
(34, 33, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:08:48', '2021-06-20 21:04:36'),
(35, 34, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:09:18', '2021-06-20 21:04:45'),
(36, 35, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:09:38', '2021-06-20 21:05:03'),
(37, 36, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:09:58', '2021-06-20 21:05:12'),
(38, 37, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:10:18', '2021-06-20 21:05:21'),
(39, 38, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:10:51', '2021-06-20 21:05:29'),
(40, 39, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:11:18', '2021-06-20 21:05:39'),
(41, 40, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:11:39', '2021-06-20 21:05:49'),
(42, 41, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:12:00', '2021-06-20 21:06:05'),
(43, 42, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:12:21', '2021-06-20 21:06:15'),
(44, 43, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:12:43', '2021-06-20 21:06:24'),
(45, 44, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:13:06', '2021-06-20 21:06:34'),
(46, 45, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:13:32', '2021-06-20 21:06:47'),
(47, 18, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 20:14:01', '2021-06-20 21:01:15'),
(48, 46, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 21:07:07', '2021-06-20 21:07:07'),
(49, 49, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 21:05:18', '2021-06-20 21:05:18'),
(50, 48, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 21:05:28', '2021-06-20 21:05:28'),
(51, 47, '[\"109\"]', '[\"177\",\"178\",\"180\"]', '[\"214\",\"215\"]', '2021-06-20 21:05:48', '2021-06-20 21:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) UNSIGNED NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sounds_like` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `representative_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `representative_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representative_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `uploader_id`, `name`, `sounds_like`, `representative_name`, `representative_phone`, `representative_address`, `status`, `created_at`, `updated_at`, `position`) VALUES
(1, 10, 'ACI Limited', '', 'Test', '01770989591', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-07-02 16:56:04', 0),
(2, 4, 'ACME Laboratories Ltd', '', 'ACME Laboratories L\r\n  td', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(3, 4, 'Actavis (BOTS Pvt. Limited', '', 'Actavis (BOTS Pvt. Limited', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(4, 4, 'Ad-din pharmaceuticals Ltd', '', 'Ad-din pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(5, 4, 'Aexim Pharmaceuticals Ltd', '', 'Aexim Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(6, 4, 'Alco Pharma Ltd', '', 'Alco Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(7, 4, 'Alkad Laboratories', '', 'Alkad Laboratories', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(8, 12, 'Allied Pharmaceuticals Ltd', 'ALTFRMSTKLSLTT', 'Allied Pharmaceuticals Ltd', '01717683274', 'Mezan. Dhaka', 1, '2020-06-19 12:42:08', '2020-07-28 15:44:46', 0),
(9, 4, 'Ambee Pharmaceuticals Ltd', '', 'Ambee Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(10, 4, 'Amico Laboratories Ltd', '', 'Amico Laboratories Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(11, 4, 'Amulet Pharmaceuticals Ltd', '', 'Amulet Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(12, 4, 'APC Pharma Ltd', '', 'APC Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(13, 4, 'Apex Pharmaceuticals Ltd', '', 'Apex Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(14, 4, 'Apollo Pharmaceutical Ltd', '', 'Apollo Pharmaceutical Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(15, 4, 'Aristopharma Ltd', '', 'Aristopharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(16, 4, 'Asiatic Laboratories Ltd', '', 'Asiatic Laboratories Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(17, 4, 'Astra Biopharmaceuticals Ltd', '', 'Astra Biopharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(18, 4, 'Aztec Pharmaceuticals Ltd', '', 'Aztec Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(19, 4, 'Bangladesh Immunity Co', '', 'Bangladesh Immunity Co', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(20, 4, 'Baxter', '', 'Baxter', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(21, 4, 'Beacon Pharmaceuticals Ltd', '', 'Beacon Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(22, 4, 'Belsen Pharmaceuticals Ltd', '', 'Belsen Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(23, 12, 'Bengal drugs Ltd', 'BNKLTRKSLTT', 'Asis Dutta', '01728442839', 'Kumilla', 1, '2020-06-19 12:42:08', '2020-08-18 20:58:54', 0),
(24, 4, 'Benham Pharmaceuticals Ltd', '', 'Benham Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(25, 4, 'Beximco Pharmaceuticals Ltd', '', 'Beximco Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(26, 4, 'Biogene Pharma Ltd', '', 'Biogene Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(27, 4, 'Biopharma Laboratories Ltd', '', 'Biopharma Laboratories Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(28, 4, 'BioRx', '', 'BioRx', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(29, 4, 'Biotest', '', 'Biotest', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(30, 4, 'Bristol Pharmaceuticals Ltd', '', 'Bristol Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(31, 4, 'Centeon Pharma Ltd', '', 'Centeon Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(32, 4, 'Central Pharmaceuticals Ltd', '', 'Central Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(33, 4, 'Chemist Laboratories  Ltd', '', 'Chemist Laboratories  Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(34, 4, 'City Overseas Ltd', '', 'City Overseas Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(35, 4, 'Concord Pharmaceuticals Ltd', '', 'Concord Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(36, 4, 'Cosmic Pharma Ltd', '', 'Cosmic Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(37, 4, 'Cosmo Pharma Laboratories Ltd', '', 'Cosmo Pharma Laboratories Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(38, 4, 'Credence Pharmaceuticals Ltd', '', 'Credence Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(39, 4, 'Crystal Pharmaceuticals Ltd', '', 'Crystal Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(40, 4, 'D16 Pharma & Biotec', '', 'D16 Pharma & Biotec', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(41, 12, 'Decent Pharma Laboratories Ltd', 'TSNTFRMLBRTRSLTT', 'Decent Pharma Laboratories Ltd', '01712364189', 'Mymensingh', 1, '2020-06-19 12:42:08', '2020-08-19 14:13:46', 0),
(42, 4, 'Delta Pharma Ltd', '', 'Delta Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(43, 4, 'Desh Pharmaceuticals Ltd', '', 'Desh Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(44, 12, 'Doctor TIMS Pharmaceuticals Ltd', 'TKTRTMSFRMSTKLSLTT', 'Doctor TIMS Pharmaceuticals Ltd', '01744947060', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-08-16 10:54:33', 0),
(45, 4, 'Doctor’s Chemical Works Ltd', '', 'Doctor’s Chemical Works Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(46, 4, 'Drug International Ltd', '', 'Drug International Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(47, 4, 'Eastern Pharmaceuticals Ltd', '', 'Eastern Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(48, 4, 'Edruc Ltd', '', 'Edruc Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(49, 4, 'Eli Lilly and Company', '', 'Eli Lilly and Company', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(50, 4, 'Elixir Pharmaceuticals Ltd', '', 'Elixir Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(51, 12, 'SKF Bangladesh Ltd', 'SKFBNKLTXLTT', 'SKF Bangladesh Ltd', '+88-02-9351691-3', 'Mymensingh', 1, '2020-06-19 12:42:08', '2020-08-22 21:05:17', 0),
(52, 4, 'Essential Drugs Company Ltd', '', 'Essential Drugs Company Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(53, 4, 'Ethical Drug Ltd', '', 'Ethical Drug Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(54, 4, 'Euro Pharma Ltd', '', 'Euro Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(55, 4, 'Everest Pharmaceuticals Ltd', '', 'Everest Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(56, 4, 'FnF Pharmaceuticals Ltd', '', 'FnF Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(57, 4, 'Gaco Pharmaceuticals Ltd', '', 'Gaco Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(58, 4, 'General Pharmaceuticals Ltd', '', 'General Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(59, 4, 'Genvio Pharma Ltd', '', 'Genvio Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(60, 4, 'Genzyme Corporation', '', 'Genzyme Corporation', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(61, 4, 'Get Well Ltd', '', 'Get Well Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(62, 4, 'GlaxoSmithKline', '', 'GlaxoSmithKline', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(63, 4, 'Globe Pharmaceuticals Ltd', '', 'Globe Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(64, 4, 'Globex Pharmaceuticals Ltd', '', 'Globex Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(65, 4, 'Gonoshasthaya Pharma Ltd', '', 'Gonoshasthaya Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(66, 4, 'Goodman Pharmaceuticals Ltd', '', 'Goodman Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(67, 4, 'Greenland Pharmaceuticals Ltd', '', 'Greenland Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(68, 4, 'Guardian Healthcare Ltd', '', 'Guardian Healthcare Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(69, 4, 'Hallmark Pharmaceuticals Ltd', '', 'Hallmark Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(70, 4, 'Healthcare Pharmacuticals Ltd', '', 'Healthcare Pharmacuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(71, 4, 'Hudson Pharmaceuticals Ltd', '', 'Hudson Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(72, 4, 'Ibn-Sina Pharmaceuticals Ltd', '', 'Ibn-Sina Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(73, 4, 'Incepta Pharmaceuticals Ltd', '', 'Incepta Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(74, 4, 'Indo Bangla Pharmaceutical', '', 'Indo Bangla Pharmaceutical', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(76, 4, 'Institute of Public Health (IPH', '', 'Institute of Public Health (IPH', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(77, 4, 'Janata Traders', '', 'Janata Traders', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(78, 4, 'Jayson Pharma Ltd', '', 'Jayson Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(79, 4, 'Julphar Bangladesh Ltd', '', 'Julphar Bangladesh Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(80, 4, 'Kawsar Chemicals', '', 'Kawsar Chemicals', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(81, 4, 'Kemiko Pharmaceuticals Ltd', '', 'Kemiko Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(82, 4, 'Kumudini Pharma Ltd', '', 'Kumudini Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(83, 4, 'Labaid Pharma Ltd', '', 'Labaid Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(84, 4, 'Legends Pharma', '', 'Legends Pharma', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(85, 4, 'Leon Pharmaceuticals Ltd', '', 'Leon Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(86, 4, 'Libra Infusions Ltd', '', 'Libra Infusions Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(87, 4, 'Libra Pharmaceuticls Ltd', '', 'Libra Pharmaceuticls Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(88, 4, 'Linde Bangladesh Ltd', '', 'Linde Bangladesh Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(89, 4, 'Marie Stopes Bangladesh', '', 'Marie Stopes Bangladesh', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(90, 4, 'Marker Pharma Ltd', '', 'Marker Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(91, 4, 'Marksman Pharmaceuticals Ltd', '', 'Marksman Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(92, 4, 'Medicon Pharmaceuticals Ltd', '', 'Medicon Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(93, 4, 'Medimet Pharmaceuticals Ltd', '', 'Medimet Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(94, 12, 'MedRx Life Science Ltd', 'MTRKSLFSNSLTT', 'Diba Medical', '01738424259', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-08-20 19:02:47', 0),
(95, 4, 'Millat Pharmaceuticals Ltd', '', 'Millat Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(96, 4, 'Modern Pharmaceuticals Ltd', '', 'Modern Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(97, 4, 'Momotaz Pharmaceuticals Ltd', '', 'Momotaz Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(98, 4, 'Monicopharma Ltd', '', 'Monicopharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(99, 4, 'MST Pharma', '', 'MST Pharma', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(100, 4, 'Mundipharma (BD) Pvt. Ltd', '', 'Mundipharma (BD) Pvt. Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(101, 4, 'Mystic Pharmaceuticals Ltd', '', 'Mystic Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(102, 4, 'Naafco Pharma Ltd', '', 'Naafco Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(103, 4, 'Navana Pharmaceuticals Ltd', '', 'Navana Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(104, 4, 'Nipa Pharmaceuticals Ltd', '', 'Nipa Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(105, 4, 'NIPRO JMI Pharma Ltd', '', 'NIPRO JMI Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(106, 4, 'Novartis (Bangladesh) Ltd', '', 'Novartis (Bangladesh) Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(107, 4, 'Novelta Bestway Pharmaceuticals Ltd', '', 'Novelta Bestway Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(108, 4, 'Novo Healthcare and Pharma Ltd', '', 'Novo Healthcare and Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(109, 4, 'Novo Nordisk', '', 'Novo Nordisk', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(110, 4, 'Novus Pharmaceuticals Ltd', '', 'Novus Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(111, 4, 'Nuvista Pharma Ltd', '', 'Nuvista Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(112, 4, 'One Pharma Ltd', '', 'One Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(113, 4, 'Opso Saline Ltd', '', 'Opso Saline Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(114, 4, 'Opsonin Pharma Ltd', '', 'Opsonin Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(115, 4, 'Orbit Pharmaceuticals Ltd', '', 'Orbit Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(116, 4, 'Organic Health Care', '', 'Organic Health Care', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(117, 4, 'Orion Infusion Ltd', '', 'Orion Infusion Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(118, 4, 'Orion Pharma Ltd', '', 'Orion Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(119, 4, 'Oyster Pharmaceuticals Ltd', '', 'Oyster Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(120, 4, 'Pacific Pharmaceuticals Ltd', '', 'Pacific Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(121, 4, 'Peoples Pharma Ltd', '', 'Peoples Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(122, 4, 'Pfizer', '', 'Pfizer', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(123, 4, 'Pharmacil Limited', '', 'Pharmacil Limited', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(124, 4, 'Pharmadesh Laboratories Ltd', '', 'Pharmadesh Laboratories Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(125, 4, 'Pharmasia Limited', '', 'Pharmasia Limited', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(126, 12, 'Pharmik Laboratories Ltd', 'FRMKLBRTRSLTT', 'Ataur vi', '01710927786', 'Mymensingh', 1, '2020-06-19 12:42:08', '2020-08-11 21:12:08', 0),
(127, 4, 'Phoenix Chemical Laboratory', '', 'Phoenix Chemical Laboratory', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(128, 4, 'Popular Pharmaceuticals Ltd', '', 'Popular Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(129, 4, 'Premier Pharmaceuticals Ltd', '', 'Premier Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(130, 4, 'Prime Pharmaceuticals Ltd', '', 'Prime Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(131, 4, 'Purnava Limited', '', 'Purnava Limited', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(132, 4, 'Quality Pharmaceuticals Ltd', '', 'Quality Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(133, 4, 'Radiant Pharmaceuticals Ltd', '', 'Radiant Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(134, 4, 'Rangs Pharmaceuticals Ltd', '', 'Rangs Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(135, 4, 'Reckitt & Benckiser Bangladesh Ltd', '', 'Reckitt & Benckiser Bangladesh Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(136, 12, 'Reliance Pharmaceuticals Ltd', 'RLNSFRMSTKLSLTT', 'Reliance Pharmaceuticals Ltd', '01738424259', 'Diba Medical. Dhaka', 1, '2020-06-19 12:42:08', '2020-08-19 20:04:38', 0),
(137, 4, 'Reman Drug Laboratories Ltd', '', 'Reman Drug Laboratories Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(138, 4, 'Renata Limited', '', 'Renata Limited', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(139, 4, 'Rephco Pharmaceuticals Ltd', '', 'Rephco Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(140, 4, 'RN Pharmaceuticals', '', 'RN Pharmaceuticals', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(141, 4, 'Roche Bangladesh Ltd', '', 'Roche Bangladesh Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(142, 4, 'S.N. Pharmaceutical Ltd', '', 'S.N. Pharmaceutical Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(143, 4, 'Salton Pharmaceuticals Ltd', '', 'Salton Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(144, 4, 'SANDOZ (A Novartis Division', '', 'SANDOZ (A Novartis Division', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(145, 12, 'Sanofi Bangladesh Ltd', 'SNFBNKLTXLTT', 'Sanofi Bangladesh Ltd', '01709992561', 'Mymensingh', 1, '2020-06-19 12:42:08', '2020-08-25 22:05:42', 0),
(146, 4, 'Seba Laboratories Ltd', '', 'Seba Laboratories Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(147, 4, 'Seema Pharmaceuticals Ltd', '', 'Seema Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(148, 4, 'Servier Bangladesh Operation', '', 'Servier Bangladesh Operation', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(149, 4, 'Sharif Pharmaceuticals Ltd', '', 'Sharif Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(150, 4, 'Silco Pharmaceutical Ltd', '', 'Silco Pharmaceutical Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(151, 4, 'Silva Pharmaceuticals Ltd', '', 'Silva Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(152, 4, 'Skylab Pharmaceuticals Ltd', '', 'Skylab Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(153, 12, 'SMC Enterprise', 'SMKNTRPRS', 'Yeahya', '01712551862', 'Mymensingh', 1, '2020-06-19 12:42:08', '2020-08-20 21:05:59', 0),
(154, 4, 'Somatec Pharmaceuticals Ltd', '', 'Somatec Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(155, 4, 'Sonear Laboratories Ltd', '', 'Sonear Laboratories Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(156, 4, 'Square Pharmaceuticals Ltd', '', 'Square Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(157, 4, 'Sun Pharmaceutical (Bangladesh) Ltd', '', 'Sun Pharmaceutical (Bangladesh) Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(158, 4, 'Sunman-Birdem Pharma Ltd', '', 'Sunman-Birdem Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(159, 4, 'Supreme Pharmaceutical Ltd', '', 'Supreme Pharmaceutical Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(160, 4, 'Syntho Laboratories Ltd', '', 'Syntho Laboratories Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(161, 4, 'Team Pharmaceuticals Ltd', '', 'Team Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(162, 4, 'Techno Drugs Ltd', '', 'Techno Drugs Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(163, 4, 'The White Horse Pharma', '', 'The White Horse Pharma', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(164, 4, 'Therapeutics Bangladesh Ltd', '', 'Therapeutics Bangladesh Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(165, 4, 'Ultra Pharma Ltd', '', 'Ultra Pharma Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(166, 4, 'Unimed Unihealth MFG. Ltd', '', 'Unimed Unihealth MFG. Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(167, 4, 'Unique Pharmaceuticals Ltd', '', 'Unique Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(168, 4, 'United Chemicals & Pharmaceuticals Ltd', '', 'United Chemicals & Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(169, 12, 'Veritas Pharmaceuticals Ltd', 'FRTSFRMSTKLSLTT', 'Happy Drag House', '01736618048', 'Midford. Dhaka', 1, '2020-06-19 12:42:08', '2020-08-17 21:34:11', 0),
(170, 4, 'Virgo Pharmaceuticals Ltd', '', 'Virgo Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(171, 4, 'ZAS Corporation', '', 'ZAS Corporation', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-06-19 12:42:08', 0),
(172, 12, 'Zenith Pharmaceuticals Ltd', 'SN0FRMSTKLSLTT', 'Zenith Pharmaceuticals Ltd', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-07-27 16:13:42', 0),
(173, 10, 'Ziska Pharmaceuticals Ltd', 'SSKFRMSTKLSLTT', 'Test-representative Name', '+88-02-9351691-3', 'Dhaka', 1, '2020-06-19 12:42:08', '2020-07-27 11:38:28', 0),
(183, 12, 'Innova Pharmaceuticals LTD', 'INFFRMSTKLSLTT', 'Lotib', '01716855468', 'Text', 1, '2020-07-26 12:43:50', '2020-07-26 12:43:50', 0),
(184, 12, 'Albion Laboratories LTD', 'ALBNLBRTRSLTT', 'Subir', '01819472349', 'Mymensingh', 1, '2020-07-26 12:54:41', '2020-07-27 11:42:37', 0),
(187, 12, 'F Son Laboratories (Unani)', 'FSNLBRTRSNN', 'Touhid', '01716376849', 'Mymensingh', 1, '2020-07-28 20:30:14', '2020-07-28 20:30:14', 0),
(188, 12, 'Safeco Laboratories (Unani) LTD', 'SFKLBRTRSNNLTT', 'Sabur Hossain', '01711456638', 'Dhaka', 1, '2020-08-02 13:35:51', '2020-08-02 13:35:51', 0),
(189, 12, 'Safeco Laboratories (Unani) LTD', 'SFKLBRTRSNNLTT', 'Sabur Hossain', NULL, 'dha', 0, '2020-08-02 14:11:13', '2020-08-02 14:11:13', 0),
(190, 12, 'Care Distribution', 'KRTSTRBXN', 'Atic', '01740559265', 'Gagipur', 1, '2020-08-09 09:11:36', '2020-08-09 09:11:36', 0),
(191, 12, 'SNC saline', 'SNKSLN', 'Text', '01815419450', 'Babu bazar.  Dhaka', 1, '2020-08-11 18:05:57', '2020-08-11 18:05:57', 0),
(192, 12, 'Belsen Pharmaceuticals', 'BLSNFRMSTKLS', 'Sofin medical', '01759944764', 'Dhaka', 1, '2020-08-11 21:44:25', '2020-08-18 18:37:16', 0),
(193, 12, 'Surgical Item', 'SRJKLTM', 'Surgical item', '01799282900', 'Bappy surgical.  Dhaka', 1, '2020-08-11 22:11:49', '2020-08-11 22:11:49', 0),
(194, 12, 'Naplous Laboratories Ltd.', 'NPLSLBRTRSLTT', 'Jahangir', '01716965839', 'Narsingdi.', 1, '2020-08-11 22:49:16', '2020-08-11 22:49:16', 0),
(195, 12, 'Nazifa chemical corporation', 'NSFXMKLKRPRXN', 'Sujon', '01791044332', 'Dhaka', 1, '2020-08-12 10:44:06', '2020-08-12 10:44:06', 0),
(197, 12, 'Astro Ayurvedic LTD', 'ASTRYRFTKLTT', 'Sakline', '123456779', 'Mymensingh', 1, '2020-08-12 18:10:41', '2020-08-12 18:10:41', 0),
(198, 12, 'Rasa pharmaceuticals', 'RSFRMSTKLS', 'Anis', '01922608045', 'Mymensingh', 1, '2020-08-12 19:51:11', '2020-08-12 19:51:11', 0),
(199, 12, 'Rasa', 'RS', 'Tarak medical', NULL, 'Siraggong', 1, '2020-08-12 19:55:06', '2020-08-12 19:55:06', 0),
(200, 12, 'Nipa', 'NP', 'Dhaka m', NULL, 'D', 1, '2020-08-13 10:59:36', '2020-08-13 10:59:36', 0),
(201, 12, 'Indian Products', 'INTNPRTKTS', 'Akter Medical', '01977467340', 'Midford. Dhaka', 1, '2020-08-17 20:28:48', '2020-08-17 20:28:48', 0),
(202, 12, 'Bengal Pharmaceuticals', 'BNKLFRMSTKLS', 'Asis Dutta', '01728442839', 'Kumilla', 0, '2020-08-18 20:51:37', '2020-08-18 20:51:37', 0),
(203, 12, 'Decent', 'TSNT', 'Decent Pharma Laboratories Ltd', 'Decent', 'Mymensingh', 1, '2020-08-19 14:34:32', '2020-08-19 14:37:15', 0),
(204, 12, 'Amee Laboratory (AY)', 'AMLBRTR', 'Amee Laboratory', '01798219148', 'Bogura', 1, '2020-08-19 20:23:40', '2020-08-19 20:23:40', 0),
(205, 12, 'Nobaron Medical', 'NBRNMTKL', 'Nobaron', '01727231263', 'Midford.  Dhaka', 1, '2020-08-22 11:59:53', '2020-08-22 11:59:53', 0),
(206, 12, 'Diba Medical', 'TBMTKL', 'Diba Medical', '01738424259', 'Midford. Dhaka', 1, '2020-08-22 12:24:24', '2020-08-22 12:24:24', 0),
(207, 12, 'Veritas', 'FRTS', 'Uzzol', NULL, 'Borisal', 1, '2020-08-22 18:05:26', '2020-08-22 18:05:26', 0),
(208, 12, 'Indian Products', 'INTNPRTKTS', 'Ferous', NULL, 'Dhaka', 1, '2020-08-22 18:12:10', '2020-08-22 18:12:10', 0),
(209, 12, 'Surgical', 'SRJKL', 'Jasim surgical', NULL, 'D', 1, '2020-08-22 19:02:11', '2020-08-22 19:02:11', 0),
(210, 12, 'Sanj Bangladesh (Unani)', 'SNJBNKLTXNN', 'No name', '8432', 'Mymensingh', 1, '2020-09-01 11:50:19', '2020-09-01 11:50:19', 0),
(211, 12, 'Hamim Laboratories Unani', 'HMMLBRTRSNN', 'Joti Pharmaciy. Dinaspur', '01714606726', 'Dinaspur', 1, '2020-09-02 12:32:43', '2020-09-02 12:32:43', 0),
(212, 12, 'Necon Laboratories', 'NKNLBRTRS', 'Abu Bokkor', '01712116061', 'Kummilla', 1, '2020-09-05 22:12:54', '2020-09-05 22:12:54', 0),
(213, 12, 'Cipla Limited', 'SPLLMTT', 'Cipla Limited', '*', 'Mymensingh', 1, '2020-09-06 21:23:47', '2020-09-06 21:23:47', 0),
(214, 12, 'Sumia Cotton', 'SMKTN', 'Sumia cotton', '01733287804', 'Mymensingh', 1, '2020-09-07 20:46:59', '2020-09-07 20:46:59', 0),
(215, 12, 'Sree Krishna', 'SRKRXN', 'Sree Krishna', '12456', 'Mymensingh', 1, '2020-09-16 21:58:26', '2020-09-16 21:58:26', 0),
(216, 12, 'Evergreen Laboratories', 'EFRKRNLBRTRS', 'Ataur vi', '01710927786', 'Mymensingh', 1, '2020-09-18 19:32:45', '2020-09-18 19:32:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sounds_like` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `logo_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `uploader_id`, `name`, `sounds_like`, `status`, `created_at`, `updated_at`, `position`, `logo_name`, `banner_name`) VALUES
(4, 12, 'জাতীয়', '', 1, '2021-04-14 17:14:24', '2021-04-14 17:14:24', 0, '.webp', '.webp'),
(5, 12, 'আন্তর্জাতিক', '', 1, '2021-04-14 17:14:38', '2021-04-14 17:14:38', 0, '.webp', '.webp'),
(6, 12, 'রাজনীতি', '', 1, '2021-04-14 17:14:54', '2021-04-14 17:14:54', 0, '.webp', '.webp'),
(7, 12, 'খেলা', '', 1, '2021-04-14 17:15:28', '2021-04-14 17:15:28', 0, '.webp', '.webp'),
(8, 12, 'বিনোদন', '', 1, '2021-04-14 17:15:49', '2021-04-14 17:15:49', 0, '.webp', '.webp'),
(9, 12, 'অর্থনীতি', '', 1, '2021-04-14 17:16:01', '2021-04-14 17:16:01', 0, '.webp', '.webp'),
(10, 12, 'জেলা সংবাদ', '', 1, '2021-04-14 17:16:19', '2021-04-14 17:16:19', 0, '.webp', '.webp'),
(11, 12, 'ময়মনসিংহ', '', 1, '2021-04-14 17:16:27', '2021-04-14 17:16:27', 0, '.webp', '.webp'),
(12, 12, 'জামালপুর', '', 1, '2021-04-14 17:16:38', '2021-04-14 17:16:38', 0, '.webp', '.webp'),
(13, 12, 'নেত্রকোনা', '', 1, '2021-04-14 17:16:52', '2021-04-14 17:16:52', 0, '.webp', '.webp'),
(14, 12, 'শেরপুর', '', 1, '2021-04-14 17:17:03', '2021-04-14 17:17:03', 0, '.webp', '.webp'),
(15, 12, 'সারাদেশ', '', 1, '2021-04-14 17:18:38', '2021-04-14 17:18:38', 0, '.webp', '.webp'),
(16, 12, 'স্বাস্থ্য ও চিকিৎসা', '', 1, '2021-04-14 17:19:02', '2021-04-14 17:19:02', 0, '.webp', '.webp'),
(17, 12, 'শিক্ষা', '', 1, '2021-04-14 17:19:30', '2021-04-14 17:19:30', 0, '.webp', '.webp'),
(18, 12, 'লাইফস্টাইল', '', 1, '2021-04-14 17:19:46', '2021-04-14 17:19:46', 0, '.webp', '.webp'),
(19, 12, 'ফেসবুক থেকে', '', 1, '2021-04-17 20:20:06', '2021-04-17 20:20:06', 0, '.webp', '.webp'),
(20, 12, 'কলাম', '', 1, '2021-04-17 20:21:07', '2021-04-17 20:21:07', 0, '.webp', '.webp'),
(21, 12, 'গল্প কবিতা', '', 1, '2021-04-25 08:51:13', '2021-04-25 08:51:13', 0, '.webp', '.webp');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `date`, `time`, `name`, `phone`, `subject`, `email`, `details`, `status`) VALUES
(10, '2021-05-06', '21:03:39', 'Muhibbullah Ansary', NULL, 'Test Contact', 'muhibbullah611@gmail.com', 'Write something...', 1),
(12, '2021-05-06', '21:06:30', 'Muhibbullah Ansary', NULL, 'Subject', 'muhibbullah611@gmail.com', 'Write something about you.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `status`) VALUES
(2, 'Bangladesh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_feedbacks`
--

CREATE TABLE `customer_feedbacks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_feedbacks`
--

INSERT INTO `customer_feedbacks` (`id`, `name`, `country`, `details`, `path`, `created_at`, `updated_at`, `uploader_id`, `status`) VALUES
(1, 'Ayman Alam', 'UK', 'Being a part of the classes of the Faith Centre Online Islamic school has been a great asset to my Islamic learning. With a range of many different subjects, it’s been a marvelous spiritual journey and I hope for this essential work to continue Insha Allah, may Allah accept their efforts. I am excited and cannot wait to see what else they have in store for the Ummah.', '1620354980.webp', '2021-05-07 08:36:20', '2021-05-07 08:36:20', 10, 1),
(2, 'NINA WILLIAMS', 'UK', 'Alhamdulilah, the Faith Centre Online Islamic school has done a great job in ensuring my child gets the best level of Islamic education. My child looks forward to lessons and is learning more about the deen every single day.', '1620023506.webp', '2021-05-07 08:33:23', '2021-05-07 08:33:23', 10, 1),
(3, 'CHRISTINA OSHINE', 'UK', 'It has been a great gift upon our family to be able to have such a wonderful door of Islamic content open to us so accessibly.', '1620023605.webp', '2021-05-07 08:33:56', '2021-05-07 08:33:56', 10, 1),
(4, 'TOMM MORISON', 'USA', 'My children have been loving their classes. The Islamic faith Centre is always ready to deliver Masha Allah. It has been a great blessing to receive such valuable knowledge.', '1620023678.webp', '2021-05-07 08:34:22', '2021-05-07 08:34:22', 10, 1),
(5, 'Maisie Bennett', 'USA', 'I am really passionate about my classes, there is always something new to learn every day. Since coming I have learned much more about my religion and its beauty which I was not aware of before, all praise is to Allah who has opened the doors for my Islamic knowledge.', '1620023806.webp', '2021-05-07 08:34:51', '2021-05-07 08:34:51', 10, 1),
(6, 'Kate Richardson', 'UK', 'May Allah reward the Faith Centre Online Islamic school for all that they do. It has been a real blessing in my life to be able to have such easy access to superb content Alhamdulilah.', '1620023883.webp', '2021-05-07 08:35:16', '2021-05-07 08:35:16', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploader_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `name`, `slug`, `detail`, `uploader_id`, `status`) VALUES
(1, 'What is Lorem Ipsum', 'what-is-lorem-ipsum', '<p><strong>Lipsum generator: Lorem Ipsum - All the facts</strong></p>\r\n\r\n<p>Lipsum generator: Lorem Ipsum - All the factswww.lipsum.com Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.</p>\r\n\r\n<p><strong>Lorem</strong></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit ...</p>\r\n\r\n<p><strong>Consectetur</strong></p>\r\n\r\n<p>Reference site about Lorem Ipsum, giving information on its origins ...</p>', 10, 1),
(2, 'Why do we use it', 'why-do-we-use-it', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>\r\n\r\n<p><strong>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, </strong>as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem Ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years,</p>\r\n\r\n<ol>\r\n	<li>sometimes</li>\r\n	<li>by accident,</li>\r\n	<li>sometimes on</li>\r\n	<li>purpose (injected humour and the like).</li>\r\n</ol>', 10, 1),
(3, 'Lorem Ipsum', 'lorem-ipsum', '<h1>&quot;Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...&quot;</h1>\r\n\r\n<p>&quot;There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...&quot;</p>\r\n\r\n<hr />\r\n<ul>\r\n	<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n	<li>Duis fermentum tortor id quam bibendum pharetra.</li>\r\n	<li>Fusce blandit elit vel placerat efficitur.</li>\r\n	<li>Integer et diam nec dolor gravida luctus.</li>\r\n	<li>Pellentesque dictum augue vel fermentum faucibus.</li>\r\n	<li>Sed vel tellus eget lectus tristique viverra.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Nunc tempor nisl quis sodales dapibus.</li>\r\n	<li>Sed efficitur nisi nec ipsum hendrerit, id accumsan sem fermentum.</li>\r\n	<li>Duis dignissim est a pharetra facilisis.</li>\r\n	<li>Maecenas pretium mi sit amet erat egestas tincidunt.</li>\r\n	<li>Sed et mauris posuere, commodo odio dignissim, ultrices nisi.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Nulla bibendum ligula auctor risus laoreet dapibus.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Quisque vitae tellus eleifend velit cursus dictum id vitae ante.</li>\r\n	<li>Quisque molestie lectus ac arcu pretium, eget venenatis tellus blandit.</li>\r\n	<li>Sed aliquet justo eu commodo rutrum.</li>\r\n	<li>Nunc placerat nisi sagittis turpis fringilla pharetra.</li>\r\n	<li>Aenean non diam nec felis accumsan ullamcorper.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>In placerat ipsum ut lectus placerat elementum.</li>\r\n	<li>Nulla vitae purus eu dolor lacinia efficitur.</li>\r\n	<li>Phasellus ac ex eleifend tellus aliquam varius.</li>\r\n	<li>Fusce vel sem nec leo fringilla sodales elementum pulvinar sem.</li>\r\n</ul>', 10, 1),
(4, 'Test Faq', 'test-faq', '<table border=\"1\" cellpadding=\"5\" cellspacing=\"1\">\r\n	<caption>My Table</caption>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">SL</th>\r\n			<th scope=\"col\">Name</th>\r\n			<th scope=\"col\">Phone</th>\r\n			<th scope=\"col\">Address</th>\r\n			<th scope=\"col\">Details</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td>1</td>\r\n			<td>Muhibbullah Ansary</td>\r\n			<td>+880 01770 989594</td>\r\n			<td>Mymensingh Sadar, Dhaka Bangladesh</td>\r\n			<td>This is Details field to provide additional information</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `uploader_id` int(10) UNSIGNED NOT NULL,
  `caption` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `image_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `uploader_id`, `caption`, `slug`, `detail`, `status`, `created_at`, `updated_at`, `image_name`) VALUES
(4, 10, 'Caption', 'caption', NULL, 1, '2021-05-04', '2021-05-04', '1620143290.webp'),
(5, 10, 'test caption', 'test-caption', NULL, 1, '2021-05-04', '2021-05-04', '1620149081.webp'),
(6, 10, 'Stay Home Stay Safe', 'stay-home-stay-safe', NULL, 1, '2021-05-04', '2021-05-04', '1620149096.webp');

-- --------------------------------------------------------

--
-- Table structure for table `hifz_reports`
--

CREATE TABLE `hifz_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `uploader_id` int(10) UNSIGNED DEFAULT NULL,
  `student_status` varchar(30) NOT NULL,
  `is_passed_sabak` tinyint(2) UNSIGNED NOT NULL,
  `is_passed_seven_sabak` tinyint(2) UNSIGNED NOT NULL,
  `is_passed_rivision` tinyint(2) UNSIGNED NOT NULL,
  `remark` text DEFAULT NULL,
  `star` int(11) NOT NULL DEFAULT 0,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hifz_sabak_report`
--

CREATE TABLE `hifz_sabak_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `uploader_id` int(10) UNSIGNED NOT NULL,
  `report_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `juz` int(11) NOT NULL COMMENT 'sabak,seven sabak,rivision',
  `page_number` int(11) DEFAULT NULL COMMENT 'rivision',
  `page_number_to` int(11) DEFAULT NULL COMMENT 'rivision',
  `page_qnty` int(11) DEFAULT NULL COMMENT 'seven_sabak',
  `sabak_line` int(11) DEFAULT NULL COMMENT 'this box for sabak line number data',
  `sabak_type` varchar(50) NOT NULL COMMENT 'sabak,seven_sabak,rivision',
  `is_homework` tinyint(3) UNSIGNED NOT NULL COMMENT '1=homework, 0=sabak'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'file size in MB',
  `dimensions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt_text` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_tages` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `download_count` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `category_id`, `file_name`, `mime_type`, `file_size`, `dimensions`, `alt_text`, `title`, `caption`, `description`, `meta_description`, `meta_tages`, `view_count`, `download_count`, `created_at`, `updated_at`, `status`) VALUES
(4, 1, '106425315_23845172626730326_8472588683996580988_n.png1619929463.jpg', 'image/jpeg', '0.034909248352051', '515x315', 'Alt Text', 'Title', 'Caption', 'Description', NULL, NULL, 0, 0, '2021-05-02', '2021-05-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `media_categories`
--

CREATE TABLE `media_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_categories`
--

INSERT INTO `media_categories` (`id`, `name`, `slug`, `status`, `type`) VALUES
(1, 'uncategories', 'uncategories', 1, 'image');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_03_26_222107_create_admins_table', 1),
(4, '2019_04_07_212319_create_divisions_table', 2),
(5, '2019_04_11_210049_create_districts_table', 3),
(7, '2019_04_16_211957_create_upazilas_table', 4),
(8, '2019_04_25_083653_create_unions_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_img_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_caption` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `video` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(7) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `date`, `category_id`, `subcategory_id`, `uploader_id`, `title`, `slug`, `description`, `publisher`, `post_type`, `meta_tag`, `meta_description`, `banner_img_name`, `image_caption`, `position`, `video`, `created_at`, `updated_at`, `status`) VALUES
(3, '0000-00-00', 11, 3, 12, 'ময়মনসিংহের ইতিহাস', '', '<p>হাওর জঙ্গল মইষের শিং, এই তিনে ময়মনসিং&rsquo; প্রবাদ-প্রবচনে এভাবেই পরিচয় করানো হতো এক সময় ভারতবর্ষের বৃহত্তম জেলা ময়মনসিংহকে। ভারতবর্ষের সেই বৃহত্তম জেলা সময়ের বিবর্তনে ছয় জেলায় রূপান্তরিত হলেও জেলা সদরের গুরুত্ব তুলনামূলক বিচারে কমে যায় নি। বাংলাদেশের মানচিত্রে যে জেলাটি আজ ময়মনসিংহ জেলা হিসাবে চিহ্নিত তা বাংলাদেশের মধ্য-উত্তরাঞ্চলের ২৪০০২&#39;৩১&quot; থেকে ২৫০২৫&#39;৫৬&quot; উত্তর অক্ষাংশ এবং ৮৯০৩৯&#39;০০&quot; থেকে ৯১০১৫&#39;৩৫&quot; পূর্ব দ্রাঘিমাংশে অবস্থিত। ব্রহ্মপুত্র বিধৌত বাংলাদেশের এই উর্বর ভূমি শিক্ষা-শিল্প-সাহিত্য ও লোক-সংস্কৃতির এক বিপুল আধার।<br />\r\n<br />\r\nময়মনসিংহের ইতিহাস অতিশয় সমৃদ্ধ। উত্তরে গারো পাহাড়, দক্ষিণে ভাওয়াল মধুপুরের বনাঞ্চল, পশ্চিমে ব্রহ্মপুত্র নদ থেকে উৎসারিত মেঘনার জল বেষ্টনী এবং পূর্বে সোমেশ্বরী তিতাস, সুরমা ও মেঘনা নদীর অববাহিকা অঞ্চল, প্রাকৃতিক প্রাচীর দ্বারা পরিবেষ্টিত এই অঞ্চলকে বরাবরই একটি দুর্জেয় অঞ্চল হিসেবে দেখতে পাওয়া যেত। আধুনিক ঐতিহাসিকগণ একমত পোষণ করেন যে, বৃহত্তর ঢাকা ও ময়মনসিংহ জেলা নিয়ে গঠিত ছিল প্রাচীন বংগরাজ্য। গোড়ার দিকে ময়মনসিংহ জেলার মধুপুর গড়সহ লালমাটির অঞ্চল নিয়ে গঠিত ছিল প্রাচীন বংগরাজ্য। হিন্দু রাজাগণের মৌর্য শাসন এর প্রতিষ্ঠা ও পরবর্তী সময় গুপ্ত ও পাল শাসকদের ইতিহাস ময়মনসিংহকে ঘিরে রেখেছে। শেষের দিকে সেন বংশীয় রাজাদের প্রশাসনিক দৌর্বল্যে মুসলমান বাদশাহগণ বাংলায় রাজত্ব কায়েমের প্রভাব ময়মনসিংহেও পড়ে। সিকান্দর শাহ-এর আমল থেকে মোঘল সাম্রাজ্য পেরিয়ে নবাবী আমল, কোম্পানী আমল এবং শেষে পাকিস্তানি শাসন-শোষণে ময়মনসিংহও প্রভাবান্বিত হয়। বিভিন্ন সূত্রে ময়মনসিংহ অঞ্চলে ৩৯টি পরগনার নাম পাওয়া যায়- ময়মনসিংহ, আলাপসিংহ, জাফরশাহী, বনভাওয়াল, পুথুরিয়া, কাগমারী, আন্টীয়া, বড় বাজু, সেরপুর, হাজবাদি, খালিয়াজুরী, জয়নশাহী, কুড়ি খাই, নছরৎশাহী, লতিফপুর, মকিমাবাদ, আটগাও, বলরামপুর, বরিকান্দি, বাউ খন্দ, চন্দ্রপ্রতাপ, ঈদগা, ইছকাবাদ, বায় দোম, সিংধা দরজিবাজ, কাসেমপুর, নিক্লী, সাসরদি, হাউলী, জকুজিয়াল, ইছাপুর, বরদাখতি, পাতিলা দহ, তুলন্দর, ইছপসাহী, হোসেন শাহী, হোসেনপুর, সুসঙ্গ ও নাসিরুর্জিয়াল।<br />\r\n<br />\r\nজেলার নাম ময়মনসিংহ নিয়ে ইতিহাসবিদদের মাঝে ভিন্ন মত প্রচলিত আছে। আর ষোড়শ শতাব্দীতে বাংলার স্বাধীন সুলতান সৈয়দ আলাউদ্দিন হোসেন শাহ তাঁর পুত্র সৈয়দ নাসির উদ্দিন নসরত শাহ&rsquo;র জন্য এ অঞ্চলে একটি নতুন রাজ্য গঠন করেছিলেন, সেই থেকেই নসরতশাহী বা নাসিরাবাদ নামের সৃষ্টি। সলিম যুগের উৎস হিসেবে নাসিরাবাদ, নামটিও আজও শিক্ষা প্রতিষ্ঠান ছাড়া আর কোথাও উল্লেখ করা হচ্ছে না। ১৭৭৯-তে প্রকাশিত রেনেল এর ম্যাপে মোমেসিং নামটি বর্তমান &rsquo;ময়মনসিংহ&rsquo; অঞ্চলকেই নির্দেশ করে। তার আগে আইন-ই-আকবরীতে &lsquo;মিহমানশাহী&rsquo; এবং &lsquo;মনমনিসিংহ&rsquo; সরকার বাজুহার পরগনা হিসাবে লিখিত আছে; যা বর্তমান ময়মনসিংহকেই ধরা যায়। এসব বিবেচনায় বলা যায় সম্রাট আকবরের রাজত্ব কালের পূর্ব থেকেই ময়মনসিংহ নামটি প্রচলিত ছিলো। জেলা পত্তন কালে ময়মনসিংহ অঞ্চলের সমৃদ্ধ জমিদারগণ সরকারের কাছে জেলার নাম ময়মনসিংহ রাখার আবেদন করলে সরকার তা গ্রহণ করে নেন।<br />\r\n<br />\r\nময়মনসিংহ নামের বিস্তীর্ণ এ জনপদ প্রাকৃতিক সৌন্দর্য ও বৈচিত্রের লীলাভূমি। এককালে ভারতবর্ষের সর্ববৃহৎ জেলা হিসেবে খ্যাত ময়মনসিংহ পরবর্তীতে প্রশাসনিক প্রয়োজনে বেশ কিছুটা ছোট হয়ে আসে। ১৯৬৯ খ্রিস্টাব্দে টাঙ্গাইল জেলা পৃথক জেলার স্বীকৃতি পাবার পরও ময়মনসিংহ ছিল পাক-ভারতের দ্বিতীয় বৃহত্তম জেলা। ময়মনসিংহের ভূ-প্রকৃতিতে একদিকে নেত্রকোনা-কিশোরগঞ্জের বিস্তীর্ণ জলাভূমি-হাওর অঞ্চল, মধুপুর ও ভাওয়ালের বিশাল বনাঞ্চল, ময়মনসিংহ-জামালপুরের সমতল অঞ্চল, শেরপুর-ময়মনসিংহের পাহাড়ি অঞ্চল, টাঙ্গাইলের বিস্তীর্ণ বিলাঞ্চল সহ উর্বর ভূমি- এ জনপদকে দিয়েছে বৈচিত্রের সমাহার। ভূ-প্রকৃতির বৈচিত্রের কারণে এ অঞ্চলের মানুষের সামাজিক জীবন, চারিত্রিক বৈশিষ্ট্য, জীবিকা এবং সংস্কৃতি বৈচিত্রপূর্ণ। টাঙ্গাইলের পর পর্যায়ক্রমে জামালপুর (শেরপুরসহ), কিশোরগঞ্জ ও নেত্রকোনা পৃথক জেলার মর্যাদা পাবার পরও আয়তনের দিক থেকে বর্তমান ময়মনসিংহ জেলা বাংলাদেশের ৬৪ জেলার মধ্যে অন্যতম। এ জেলার উর্বর ভূমি ধান, পাট, সবজি ও রবিশস্য উৎপাদনের জন্য খুবই উপযোগী।<br />\r\n<br />\r\nজেলার উল্লেখযোগ্য সংখ্যক শিক্ষা প্রতিষ্ঠান জেলাকে দিয়েছে শিক্ষা নগরীর মর্যাদা। দেশের একমাত্র মহিলা শিক্ষক প্রশিক্ষণ মহাবিদ্যালয়, ন্যাশনাল একাডেমি ফর প্রাইমারী এডুকেশন, প্রথম গার্লস ক্যাডেট কলেজ এবং কাজী নজরুল ইসলাম বিশ্ববিদ্যালয় এ জেলায় অবস্থিত। এশিয়ার বৃহত্তম- বাংলাদেশ কৃষি বিশ্ববিদ্যালয় ময়মনসিংহ সদরে স্থাপিত। যেখানে বাংলাদেশের বিভিন্ন অঞ্চলসহ বিশ্বের বিভিন্ন দেশের ছাত্রছাত্রীরা কৃষি ক্ষেত্রে উচ্চতর শিক্ষা গ্রহণের জন্য আসেন। আণবিক কৃষি গবেষণা কেন্দ্র এবং মৎস্য গবেষণা ইনস্টিটিউট ময়মনসিংহ সদরেই স্থাপিত। ময়মনসিংহ দেশের প্রাচীনতম শহরগুলোর অন্যতম। এখানে অসংখ্য প্রাচীন স্থাপত্য, পুকুর-দীঘি রয়েছে। জেলা সদরের বুক চিড়ে বয়ে গেছে পুরাতন ব্রহ্মপুত্র নদ। বৃটিশ বিরোধী বিভিন্ন আন্দোলন, পাগলপন্থী বিদ্রোহ, ফকির বিদ্রোহ, টংক আন্দোলন, তেভাগা আন্দোলন, কৃষক আন্দোলন, ৬৯-এর গণ আন্দোলন, ১৯৭১ এর মুক্তিযুদ্ধসহ গণতান্ত্রিক প্রতিটি আন্দোলন সংগ্রামে এ অঞ্চলের সাহসী মানুষের উল্লেখযোগ্য ভূমিকার স্বীকৃতি রয়েছে ইতিহাসের পাতায়। মুক্তিযুদ্ধের প্রথম পর্যায়ে জলছত্র-মধুপুর, ভালুকা, ফাতেমা নগর (কালির বাজার)-এর প্রতিরোধ যুদ্ধ যেমন গুরুত্বপূর্ণ একইভাবে গুরুত্বপূর্ণ তেলিখালির যুদ্ধ এবং ধানুয়া কামালপুরের যুদ্ধও।<br />\r\n<br />\r\nদীর্ঘকালের হিন্দু, বৌদ্ধ ও মুসলিম শাসনের ঐতিহ্য ময়মনসিংহকে সাংস্কৃতিকভাবে ধনাঢ্য করে গেছে। বৃহত্তর ময়মনসিংহের ঐতিহ্যে লালিত হয়ে আসছে এই ধারাবাহিক সাংস্কৃতিক বন্ধন। যেসব ব্যক্তিত্ব ময়মনসিংহের সাংস্কৃতিক ও রাজনৈতিক অঙ্গনকে সমৃদ্ধ করে গেছেন তাঁরা হলেন এখানকার জমিদারবর্গ, সাহিত্যিক, সাংবাদিক, রাজনীতিবিদ আবুল মনসুর আহমেদ, সাহিত্যিক, সাংবাদিক আবুল কালাম শামছুদ্দিন, শিল্পাচার্য জয়নুল আবেদীন প্রমুখ। বৃহত্তর ময়মনসিংহের লোক সংস্কৃতিও রূপান্তরিত হয়েছে ঐতিহ্যে। ময়মনসিংহ গীতিকা বিশ্ব দরবারে অলংকৃত করেছে ময়মনসিংহের নিজস্ব পরিচয়। স্বপ্নের নকশী কাঁথায় বোনা হয়েছে এখানকার বাস্তবচিত্রের কাহিনী। মহুয়া মলুয়া থেকে জয়নুল আবেদীনের চিত্র হয়ে উঠেছে বিশ্বময় ময়মনসিংহের গৌরব গাঁথা। ঈশাখাঁর যুদ্ধ বা সখিনা-সোনাভানের কাহিনী বাতাসে ছড়ায় বীরত্বের হৃদয় ছোঁয়া বিরলপ্রভা।</p>', '0', '', '', '', '1618405599.webp', '', 0, NULL, '2021-04-14 19:08:07', '2021-04-14 19:08:07', 1),
(4, '0000-00-00', 11, 3, 12, 'তারুণ্যের অভিশাপঃআফসানা মিম', '', '<p>ছাত্রজীবন শেষ হলেই যুবকদের গলায় সুন্দর এক টাইটেল ঝুলিয়ে দেওয়া হয়,<br />\r\nবেকার!<br />\r\nএই সভ্য সমাজ নিয়মিত চর্চা করেন তাদের;<br />\r\nকি গো চাকরি-বাকরি কিছু হলো?<br />\r\nএতো বড় দামড়া ছেলে বাবার হোটেলে আর কত!<br />\r\nঅমুকের ছেলের শুনলাম বিসিএস হয়েছে,&nbsp;<br />\r\nতোর কি আদৌ কিছু হবে?<br />\r\nবেকার ছেলেটি মাথা নিচু করে জবাব দেয়,<br />\r\nএইতো হয়ে যাবে কিছু একটা!<br />\r\nআপনি পত্রিকা পড়ে বা না পড়ে পরিত্যক্ত ময়লার ঝুড়িতে ফেলে দিচ্ছেন,<br />\r\nসেই বেকার ছেলেটি দেখবেন প্রতিদিনের খবরের কাগজ কত যত্ন করে রেখে দিয়েছে।&nbsp;<br />\r\nকারণ নেক্সট টাইম আবারও তারা নিজেকে একবার যাচাই করতে চায়!<br />\r\nএখানেই শেষ নয়,<br />\r\nপাড়ার সেই টঙ দোকানের সংসদে রোজ আলাপ হবে<br />\r\nছেলেকে এতো পড়িয়ে কি হবে,&nbsp;<br />\r\nযদি সরকারি চাকরিই না করতে পারে!<br />\r\nনা শোনার ভঙ্গিতে বেকার ছেলেটি পাশকাটিয়ে চলে যায়।<br />\r\nঅসুস্থ মা আর ছোট ভাইবোনের প্রয়োজন মেটাতে না পেরে বেকার ছেলেটি আড়ালে চোখের জল ফেলে,<br />\r\nতাদের আত্ম চিৎকার শোনার জন্য কেউ থাকে না।&nbsp;<br />\r\nএই সমাজ জানে শুধু নামকরণ করতে!<br />\r\nবেকার!<br />\r\nশুধু মাত্র সেই বেকার ছেলেটি জানে ইন্টারভিউ রুমের সরি শব্দটার তীক্ষ্ণতা কত গভীর,<br />\r\nতারা জানে একগাদা কাগজপত্র নিয়ে এপাশ ওপাশ করার অভিজ্ঞতা কি!&nbsp;<br />\r\nতরুণের সবচেয়ে বড় অভিশাপ যেন বেকারত্ব।</p>', '0', '', '', '', '1618494510.webp', '', 0, NULL, '2021-04-15 19:48:30', '2021-04-15 19:48:30', 0),
(6, '2021-04-29', 11, 3, 12, 'তারুণ্যের অভিশাপ:আফসানা মিম', 'তারুণ্যের-অভিশাপ:আফসানা-মিম', '<p>ছাত্রজীবন শেষ হলেই যুবকদের গলায় সুন্দর এক টাইটেল ঝুলিয়ে দেওয়া হয়,<br />\r\nবেকার!<br />\r\nএই সভ্য সমাজ নিয়মিত চর্চা করেন তাদের;<br />\r\nকি গো চাকরি-বাকরি কিছু হলো?<br />\r\nএতো বড় দামড়া ছেলে বাবার হোটেলে আর কত!<br />\r\nঅমুকের ছেলের শুনলাম বিসিএস হয়েছে,&nbsp;<br />\r\nতোর কি আদৌ কিছু হবে?<br />\r\nবেকার ছেলেটি মাথা নিচু করে জবাব দেয়,<br />\r\nএইতো হয়ে যাবে কিছু একটা!<br />\r\nআপনি পত্রিকা পড়ে বা না পড়ে পরিত্যক্ত ময়লার ঝুড়িতে ফেলে দিচ্ছেন,<br />\r\nসেই বেকার ছেলেটি দেখবেন প্রতিদিনের খবরের কাগজ কত যত্ন করে রেখে দিয়েছে।&nbsp;<br />\r\nকারণ নেক্সট টাইম আবারও তারা নিজেকে একবার যাচাই করতে চায়!<br />\r\nএখানেই শেষ নয়,<br />\r\nপাড়ার সেই টঙ দোকানের সংসদে রোজ আলাপ হবে<br />\r\nছেলেকে এতো পড়িয়ে কি হবে,&nbsp;<br />\r\nযদি সরকারি চাকরিই না করতে পারে!<br />\r\nনা শোনার ভঙ্গিতে বেকার ছেলেটি পাশকাটিয়ে চলে যায়।<br />\r\nঅসুস্থ মা আর ছোট ভাইবোনের প্রয়োজন মেটাতে না পেরে বেকার ছেলেটি আড়ালে চোখের জল ফেলে,<br />\r\nতাদের আত্ম চিৎকার শোনার জন্য কেউ থাকে না।&nbsp;<br />\r\nএই সমাজ জানে শুধু নামকরণ করতে!<br />\r\nবেকার!<br />\r\nশুধু মাত্র সেই বেকার ছেলেটি জানে ইন্টারভিউ রুমের সরি শব্দটার তীক্ষ্ণতা কত গভীর,<br />\r\nতারা জানে একগাদা কাগজপত্র নিয়ে এপাশ ওপাশ করার অভিজ্ঞতা কি!&nbsp;<br />\r\nতরুণের সবচেয়ে বড় অভিশাপ যেন বেকারত্ব।</p>', 'ডেস্ক রিপোর্ট', 'news', 'তারুণ্য,অভিশাপ,পড়াশোনা,শেষ,চাকরি,বাকরি,এলাকা,নানা,কথা,', 'তারুণ্যের অভিশাপ', '1618494527.webp', '', 0, 'nnn', '2021-04-15 19:48:47', '2021-04-29 23:27:48', 1),
(7, '0000-00-00', 11, 3, 12, 'বায়তুল্লাহর হেফাজত ও নিরাপত্তার দায়িত্ব আল্লাহরঃড.তুহিন মালিক', '', '<p>[কোরআনটাইম] সূরা ফীল</p>\r\n\r\n<p>ছোটবেলা থেকেই আমরা পড়ে আসছি সূরা ফীলের ঘটনা। হাতিবাহিনী নিয়ে কা&lsquo;বাগৃহ ধ্বংস করার জন্য আবরাহার অভিযানের ঘটনা। ঝাঁকে ঝাঁকে ছোট ছোট পাখি দিয়ে (যদিও আমরা এই পাখিকে ভুল করে আবাবীল বলে থাকি) কংকর নিক্ষেপ করে হাতিবাহিনীকে নাস্তানাবুদ করার ঘটনা।&nbsp;</p>\r\n\r\n<p>কিন্তু পুরো ঘটনাটি জানলে, সত্যিই যে কেউ আশ্চর্যান্বিত হয়ে যাবেন নির্দ্বিধায়। একটু ধৈর্য নিয়ে ঘটনাটি শুনুন তাহলে:-</p>\r\n\r\n<p>রাসূলুল্লাহ (সাঃ)-এর জন্মের ৫০ বা ৫৫ দিন পূর্বে ইয়ামনের খ্রিষ্টান গভর্ণর আবরাহা প্রশিক্ষণপ্রাপ্ত হস্তীবাহিনীসহ বিশাল সৈন্যদল নিয়ে কা&lsquo;বাগৃহ ধ্বংস করার জন্য এসেছিলো। আবরাহা ছিল বেঁটে ও দুর্বল। ফলে ইতিপূর্বে এক লড়াইয়ের সময় আবরাহার প্রতিপক্ষ আরিয়াত্বের তরবারির আঘাতে তার নাক-মুখ কেটে রক্তাক্ত হয়ে যায়। এ অবস্থায় আবরাহার গোলাম আতাওদাহ হামলা চালিয়ে আরিয়াত্বকে হত্যা করে। আবরাহা আহত অবস্থায় ফিরে আসেন ও পরে সুস্থ হয়ে ইয়ামনের একচ্ছত্র শাসক হন। যুদ্ধে নাক-মুখ কাটা হওয়ার কারণেই তাকে &lsquo;আশরাম&rsquo; (الأشرم) বলা হ&rsquo;তে থাকে। তখন থেকে أبرهة الأشرم &lsquo;নাককাটা আবরাহা&rsquo; নামে তিনি পরিচিত হন। আবরাহার পুরো নাম ছিল আবরাহা ইবনুছ ছাববাহ (أبرهة بن الصبَّاح)।</p>\r\n\r\n<p>আবরাহা চিন্তা করলেন যে, আরবদেরকে মক্কায় হজ্জ বাদ দিয়ে ইয়েমেনে হজ্জ করাতে হবে। সঙ্গে সঙ্গে সর্বত্র ঘোষণা জারি করলেন যে, এবছর থেকে হজ্জ কা&lsquo;বাগৃহের বদলে ইয়েমেনের গীর্জায় হবে। তার এই ঘোষণা সর্বত্র দারুণ প্রতিক্রিয়ার সৃষ্টি করল। কুরায়েশরা রাগে ফেটে পড়ল। কথিত আছে যে, তাঁদের কেউ একজন এসে ঐ জাঁকজমকপূর্ণ &lsquo;কুল্লাইস&rsquo; গীর্জায় গোপনে ঢুকে পায়খানা করে যায়। অন্য বর্ণনায় এসেছে যে, কুরায়েশদের একদল যুবক ঐ গীর্জায় ঢুকে আগুন ধরিয়ে দেয়। যাতে গীর্জা পুড়ে ধূলিসাৎ হয়ে যায় (ইবনে কাসীর)।</p>\r\n\r\n<p>এর প্রতিশোধ নেওয়ার জন্য আবরাহা বিশাল বাহিনী প্রস্ত্তত করেন। কোন বর্ণনায় ২০ হাজার ও কোন বর্ণনায় ৬০ হাজার সৈন্যের কথা এসেছে। তাদের পরিকল্পনা ছিল, লোহার শিকলের এক প্রান্ত কা&lsquo;বার দেওয়ালে বেঁধে অন্য প্রান্ত হাতির ঘাড়ে বাঁধা হবে। অতঃপর হাতিকে হাঁকিয়ে দেয়া হবে, যাতে পুরা কা&lsquo;বাগৃহ এক সাথে উপড়ে ভেঙ্গে পড়ে (ইবনে কাসীর)।</p>\r\n\r\n<p>আবরাহার কা&lsquo;বা অভিযানের খবর শুনে সর্বত্র আতংক ছড়িয়ে পড়ল। কিছু সাহসী মানুষ তাকে প্রতিরোধের জন্য প্রস্ত্ততি নিল। এদের মধ্যে অন্যতম হ&rsquo;লেন ইয়ামনের সাবেক শাসক বংশের সর্বজনশ্রদ্ধেয় নেতা যূ-নফর (ذو نفر)। তিনি তার নিজ সম্প্রদায় এবং সমস্ত আরব জনগণকে বায়তুল্লাহ রক্ষার পবিত্র জিহাদে তার সাথে শরীক হওয়ার আহবান জানান। ফলে বহু লোক তার পতাকাতলে সমবেত হয় এবং আবরাহার সাথে যুদ্ধে লিপ্ত হয়। কিন্তু অবশেষে তারা পরাজিত হয়। যূ-নফর বন্দী হ&rsquo;লেন। কিন্তু আবরাহা তাকে হত্যা না করে সঙ্গে নিলেন। কিছু দূর যাওয়ার পর খাশ&lsquo;আম এলাকা অতিক্রমের সময় নুফায়েল বিন হাবীব আল-খাশ&lsquo;আমী (نفيل بن حبيب الخشعمى) তার সম্প্রদায়ের লোকদের নিয়ে বাধা দিলেন। কিন্তু তুমুল যুদ্ধের পর তারাও পরাজিত হ&rsquo;ল। নুফায়েলকে হত্যা না করে আবরাহা তাকেও সাথে নিলেন পথপ্রদর্শক হিসাবে। অতঃপর ত্বায়েফ অতিক্রম করার সময় সেখানকার প্রসিদ্ধ ছাক্বীফ গোত্র প্রতিরোধ গড়ে তুলল। কিন্তু সেটা বায়তুল্লাহর স্বার্থে ছিল না, বরং তাদের &lsquo;লাত&rsquo; প্রতিমা রক্ষার স্বার্থে ছিল। কারণ তারা ভেবেছিল যে, আবরাহা তাদের মূর্তি ধ্বংস করার জন্য আসছেন। পরে তারা তাদের ভুল বুঝতে পারল এবং আবরাহার সম্মানার্থে একজন দক্ষ পথপ্রদর্শক হিসাবে &lsquo;আবু রিগাল&rsquo; (أبو رغال) নামক জনৈক ব্যক্তিকে আবরাহার সাথে পাঠালো। তার নির্দেশনা অনুযায়ী আবরাহা মক্কার অদূরবর্তী &lsquo;মুগাম্মিস&rsquo; (المغمِّس) নামক স্থানে অবতরণ করলেন। অতঃপর তার বাহিনী মক্কার উট-দুম্বা ইত্যাদি গবাদিপশু লুট করা শুরু করল। যার মধ্যে মক্কার নেতা আব্দুল মুত্ত্বালিবের দু&rsquo;শো উট ছিল।</p>\r\n\r\n<p>আল্লাহর ইচ্ছায় পথপ্রদর্শক আবু রিগাল মুগাম্মিসে অবতরণ করেই মৃত্যুবরণ করল। সেই থেকে আরবরা তার কবরে পাথর ছুঁড়ে মারে।&nbsp;</p>\r\n\r\n<p>অতঃপর আবরাহা হুনাত্বাহ আল-হিমইয়ারী (حُناطة الحِمْيرى) নামক এক ব্যক্তিকে তার প্রতিনিধি হিসাবে মক্কায় পাঠান এই কথা বলে যে, তিনি যেন মক্কার নেতাকে গিয়ে বলেন যে, আমরা তাদের সঙ্গে যুদ্ধ করতে আসিনি। আমরা এসেছি কা&lsquo;বাগৃহ ধ্বংস করতে। যদি তারা বাধা না দেন, তাহ&rsquo;লে তাদের নেতা যেন তার সাথে সাক্ষাৎ করেন। হুনাত্বাহ গিয়ে মক্কার নেতা আব্দুল মুত্ত্বালিব-কে সব কথা খুলে বললেন। জওয়াবে আব্দুল মুত্ত্বালিব বললেন, আবরাহার বিশাল বাহিনীর সঙ্গে যুদ্ধ করার ক্ষমতা আমাদের নেই। এটি আল্লাহর ঘর ও তার বন্ধু ইবরাহীমের ঘর। আল্লাহ তার গৃহের হেফাযত করবেন। অতঃপর তিনি তার কয়েকজন পুত্রসহ আবরাহার কাছে গেলেন। আব্দুল মুত্ত্বালিবের সুশ্রী, সুঠাম, সৌম্যকান্তি দেখে আবরাহা শ্রদ্ধায় বিগলিত হয়ে তার আসন থেকে নেমে এসে তার পাশে বিছানায় বসেন এবং পূর্ণ সম্মান ও মর্যাদা বজায় রেখে দোভাষীর মাধ্যমে কথা বলেন। আব্দুল মুত্ত্বালিব তাঁর লুট করা দু&rsquo;শো উট ফেরত চাইলেন। কিন্তু কা&lsquo;বাগৃহ সম্পর্কে কিছু বললেন না। এতে বিস্মিত হয়ে আবরাহা বললেন, &lsquo;আপনাকে দেখে আমি শ্রদ্ধায় অবনত হয়েছিলাম। কিন্তু এখন আমি বিস্মিত হচ্ছি এজন্য যে, আপনি কেবল আপনার স্বার্থের কথা বললেন। অথচ যে কা&lsquo;বাগৃহ আমরা ধ্বংস করতে এসেছি, যা আপনার ও আপনার পিতৃপুরুষের ইবাদতগৃহ, তার সম্পর্কে আপনি কিছুই বললেন না&rsquo;। তখন জবাবে আব্দুল মুত্ত্বালিব বললেন, أَنَا رَبُّ الْإِبِلِ وَلِلْبَيْتِ رَبٌّ يَحْمِيْهِ &lsquo;আমি মালিক উটের। আর ঐ গৃহের একজন মালিক আছেন, যিনি তাকে রক্ষা করবেন&rsquo; (তানতাভী)। আবরাহা বললেন, مَا كَانَ لِيَمْتَنِعَ مِنِّي &lsquo;আজ আমার হাত থেকে ওকে রক্ষা করার কেউ নেই&rsquo;। আবদুল মুত্ত্বালিব বললেন, أَنْتَ وَذَاكَ &lsquo;এটা আপনার ও তাঁর (অর্থাৎ আল্লাহর) ব্যাপার&rsquo;।</p>\r\n\r\n<p>আবদুল মুত্ত্বালিব তাঁর দু&rsquo;শো উট নিয়ে ফিরে এলেন। অতঃপর সবাইকে মক্কা থেকে বেরিয়ে বিভিন্ন পাহাড়ের চূড়ায় আশ্রয় নিতে বললেন। তারপর তিনি নিজে ও একদল সাথীসহ গিয়ে কা&lsquo;বাগৃহের দরজার চৌকাঠ ধরে আল্লাহর কাছে প্রার্থনা করেন।</p>\r\n\r\n<p>অতঃপর আবরাহা যখন মক্কা অভিমুখে রওয়ানা হওয়ার উদ্যোগ নেন এবং হাতিকে মক্কার দিকে হাঁকাতে চেষ্টা করেন, তখন হাতি বসে পড়ে। অতঃপর শত চেষ্টা করেও হাতিকে মক্কা মুখো করা যায়নি। অথচ ইয়ামন মুখো করা হলেই হাতি দৌড় দেয়। মক্কা মুখো করলেই সে বসে পড়ে।</p>\r\n\r\n<p>ইতিমধ্যে সাগরের দিক থেকে ঝাঁকে ঝাঁকে অচেনা পাখি আসতে শুরু করে। যাদের প্রত্যেকের মুখে একটি ও দু&rsquo;পায়ে দু&rsquo;টি কংকর ছিল, যা ডাল ও গমের মত সাইজের। এই কংকর যার মাথায় পড়েছে, সে ধ্বংস হয়েছে। সবাইকে লাগেনি। কিছু আঘাতপ্রাপ্তদের মরতে দেখে বাকী সবাই দিগ্বিদিক ছুটে পালাতে শুরু করে।</p>\r\n\r\n<p>আবরাহা বাহিনী মক্কা থেকে পালিয়ে ইয়ামন পর্যন্ত পথে পথে মরতে মরতে যায় এবং আবরাহা তার প্রিয় রাজধানী ছান&lsquo;আ শহরে পৌঁছে লোকদের কাছে আল্লাহর গযবের ঘটনা বলার পর মৃত্যুবরণ করে। এ সময় তার বুক ফেটে কলিজা বেরিয়ে যায়। ইবনু ইসহাক বলেন, এর পরপরই আল্লাহ তাঁর বিশেষ রহমত স্বরূপ কুরায়েশদের গৃহে তাঁর প্রিয়নবী মুহাম্মাদ ছাল্লাল্লাহু আলাইহে ওয়া সাল্লামকে প্রেরণ করেন। এই ঘটনার পর দশ বছর মক্কার লোকেরা মূর্তিপূজা থেকে বিরত থাকে।</p>\r\n\r\n<p>এবার সূরাটি পড়ে নেই:-</p>\r\n\r\n<p>أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَابِ الْفِيلِ<br />\r\n(১) আলাম তারা কাইফা ফা&#39;আলা রাব্বুকা বিআছহ্বা-বিল ফীল ।&nbsp; &nbsp; &nbsp;&nbsp;<br />\r\nতুমি কি দেখো নি, তোমার প্রভু হস্তীওয়ালাদের সাথে কিরূপ আচরণ করেছিলেন?&nbsp;</p>\r\n\r\n<p>أَلَمْ يَجْعَلْ كَيْدَهُمْ فِي تَضْلِيلٍ<br />\r\n(২) আলাম ইয়া জ্বআ&#39;ল কাইদা হুম ফী তাদ্বলীলিওঁ।<br />\r\n&nbsp;তিনি কি তাদের চক্রান্ত নস্যাৎ করে দেননি?&nbsp;</p>\r\n\r\n<p>وَأَرْسَلَ عَلَيْهِمْ طَيْرًا أَبَابِيلَ<br />\r\n(৩) ওয়া আরসালা আ&#39;লাইহিম ত্বাইরান আবা-বীল ।&nbsp; &nbsp; &nbsp; &nbsp;<br />\r\nতিনি তাদের উপরে প্রেরণ করেছিলেন ঝাঁকে ঝাঁকে পাখি।&nbsp;</p>\r\n\r\n<p>تَرْمِيهِمْ بِحِجَارَةٍ مِنْ سِجِّيلٍ<br />\r\n(৪)&nbsp; তারমীহিম বিহ্বিজ্বা-রাতিম মিন <strong>সিজ্বজ্বীলিন</strong>।<br />\r\n&nbsp;যারা তাদের উপরে নিক্ষেপ করেছিল মেটেল পাথরের কংকর।</p>\r\n\r\n<p>فَجَعَلَهُمْ كَعَصْفٍ مَأْكُولٍ<br />\r\n(৫) ফাজ্বা&#39;আলাহুম কা&#39;আছফিম মা&#39;কূল ।&nbsp;<br />\r\nঅতঃপর তিনি তাদের করে দেন ভক্ষিত তৃণসদৃশ।</p>\r\n\r\n<p>সারকথা :&zwnj;<br />\r\nবায়তুল্লাহর হেফাযত ও নিরাপত্তার দায়িত্ব আল্লাহর। আল্লাহর ইচ্ছা ব্যতীত পৃথিবীর কোন শক্তি একে ধ্বংস করতে পারবে না।</p>', '0', '', '', '', '1618668751.webp', '', 0, NULL, '2021-04-17 20:12:31', '2021-04-17 20:12:31', 1),
(8, '0000-00-00', 11, 3, 12, '\'হারিয়ে যাওয়া\' এক সংবিধান দিবসঃডক্টর তুহিন মালিক', '', '<p>&lsquo;হারিয়ে যাওয়া&rsquo; এক সংবিধান দিবস।<br />\r\nডক্টর তুহিন মালিক&nbsp;</p>\r\n\r\n<p>আজ আমাদের সংবিধান দিবস। ১৯৭২ সালের ৪ নভেম্বর প্রণীত হয় বাংলাদেশের সংবিধান। গত ৪৮ বছরে সংবিধান সংশোধন করা হয়েছে ১৭ বার। অধিকাংশ ক্ষেত্রেই জনগণের মৌলিক অধিকার খর্ব করে শুধুমাত্র সংখ্যাগরিষ্ঠতার দোহাই দিয়ে এই সংশোধনীগুলো করা হয়েছে।</p>\r\n\r\n<p>&lsquo;রাষ্ট্রের মালিক জনগণ&rsquo; - একথা সংবিধানে লেখা আছে সত্য। কিন্তু বাস্তবে রাষ্ট্রীয় মালিকানা সম্পুর্নভাবে এক ব্যাক্তির অধীনে চলে গেছে! এক ব্যাক্তির ইচ্ছার অধীনে চলে যায় বলেই, সংবিধানের প্রায় এক তৃতীয়াংশ সংশোধনী অবৈধ ঘোষিত হয়।</p>\r\n\r\n<p>এক ব্যাক্তির ইচ্ছার অধীনে চলে যায় বলেই, অনেকগুলো আইন প্রণয়নের সাংবিধানিক নির্দেশনা আজও কার্যকর করা হয়নি! এক ব্যাক্তির ইচ্ছার অধীনে চলে যায় বলেই, উচ্চ আদালতে বিচারপতি নিয়োগ, প্রধান নির্বাচন কমিশনার ও কমিশনার নিয়োগ, ন্যায়পাল নিয়োগসহ বিভিন্ন বিষয়ে আজো কোন আইন প্রণয়ন করা সম্ভব হয়নি। আর এক ব্যাক্তির ইচ্ছাধীন নীতিমালা দিয়েই চলছে এগুলো।</p>\r\n\r\n<p>সংবিধানে স্বাধীন বিচার বিভাগের কথা লেখা আছে। কিন্তু বাস্তবে বিচার বিভাগের প্রশাসনিক ক্ষেত্রে দাপ্তরিক কাজ ছাড়া সুপ্রিম কোর্টের আর কোন ক্ষমতাই নেই।</p>\r\n\r\n<p>কত রকমের অধিকার, কত রকমের সুরক্ষা, কত মালিকানা, কত ক্ষমতা দেয়া হয়েছে জনগণকে এই সংবিধানে। অথচ বাস্তবে জনগণের সব ক্ষমতা ও মালিকানা তো এক ব্যাক্তির হাতেই! পৃথিবীর সবচেয়ে ছোট মাত্র ১৭ পাতার সংবিধান মার্কিন যুক্তরাষ্ট্রের। অথচ ১৭৭৬ সাল থেকে আজ পর্যন্ত তাদের সংবিধানে মাত্র ২৭টি সংশোধনী হয়েছে। আর আমরা সংবিধানকে ছিন্নভিন্ন করে যে যার মতো করে লিখেই চলেছি। কেউ আজীবন ক্ষমতায় থাকার জন্য! কেউ আবার তত্বাবধায়ক সরকারের জন্য ১৭৩ দিন হরতাল দিয়ে। তিনিই আবার মিডনাইট ইলেকশনের জন্য সেই তত্বাবধায়ক সরকারের পুরো ব্যবস্থাটাই বাতিল করে দিলেন!</p>\r\n\r\n<p>সংবিধানের মূল চেতনাগত জনগণের প্রত্যক্ষ নির্বাচনকে ক্ষুন্ন করে বিনাভোটে ক্ষমতা দখল করে নেয়া হলো। একইভাবে পাঁচ বছর পর মিডনাইট নির্বাচনেও জনগণের ভোটাধিকারকে নির্লজ্জভাবে হরন করা হলো। ঠিক যেমনটা ৭৫ সালের সংবিধানের চতুর্থ সংশোধনীতে নির্বাচন ছাড়াই তিনশ আসনে পাঁচ বছরের জন্য এমপি করা হয়েছিল। এ এক আশ্চর্যজনক সাংবিধানিক তামাশা! সংবিধানের দোহাই দিয়েই সাংবিধানিক তামাশা!</p>\r\n\r\n<p>সংবিধানের মেরুদণ্ড ভেঙে পঞ্চদশ সংশোধনী করে ৫৩টি অনুচ্ছেদ চিরকালের জন্য সংশোধন অযোগ্য করা হলো। সংবিধানকে রক্তাক্ত করে একনায়িকাতন্ত্র প্রতিষ্ঠা করা হলো। সেটাকে আবার চিরকালের মতো সংশোধনের অযোগ্য করে দেয়া হলো। কেউ যদি এই বিধানকে সংশোধন করতে চায় তার মৃত্যুদণ্ডের বিধানও করে রাখা হলো। অথচ তিনিই আবার একের পর এক সংবিধান লংঘনের গুরুতর অভিযোগ মাথায় নিয়ে দেশ শাসন করছেন। আর আশ্চর্যজনকভাবে, এটাও করা হচ্ছে খোদ সংবিধানের দোহাই দিয়েই।&nbsp;</p>\r\n\r\n<p>সংবিধানের চেক অ্যান্ড ব্যালেন্সকে ধ্বংস করে দেয়া হলো। সাংবিধানিক স্বীকৃতি থেকে বাদ দেয়া হলো আদিবাসীদের। গণভোট বিলুপ্ত করা হলো। তত্ত্বাবধায়ক বাদ দিয়ে একনায়িকার স্বৈরশাসন তৈরি করা হলো। সুপ্রিম কোর্টের রিভিউ ক্ষমতা খর্ব করা হলো।&nbsp; ১৬ কোটি মানুষের অভিপ্রায়ের এই সংবিধানকে এক ব্যক্তির অভিপ্রায়ের কাছে করুণভাবে পরাস্ত করা হলো। সংবিধানকে আওয়ামী লীগের দলীয় হ্যান্ডবুকে পরিণত করা হলো। ১৬ কোটি মানুষের সংবিধানকে এক ব্যক্তির ইচ্ছার অধীনে ন্যস্ত করা হলো।</p>\r\n\r\n<p>আদি গ্রিক সমাজে দাসপ্রথা প্রচলিত ছিল। সেখানে দাসদের কোনো অধিকার ছিল না। দাসদের শাসনকার্যে অংশগ্রহণ করারও কোন অধিকার ছিল না। একথা তাদের সংবিধানেও ছিল। অথচ আমাদের সংবিধানে কোন দাসত্ব নেই। বরং সংবিধানে রাষ্ট্রের মালিকানা দেয়া হয়েছে জনগণকে।অথচ বাস্তবে আমরা কিন্তু সেই আদি গ্রিক সমাজের দাসদের মতই রাজার মালিকানাধীন। সংবিধানের কাগজে কলমে আমরা মালিক। কিন্তু বাস্তবে আমরা আদিম সমাজের দাসদের মতই ক্ষমতাহীন। আর এই কারনেই এখন আর সংবিধান নিয়ে জনগণের তেমন কোন আগ্রহ নেই। জনগণের কাছে সংবিধান দিবস তাই আজ এতটাই আবেদনহীন। এতটাই &lsquo;হারিয়ে যাওয়া&rsquo; এক সংবিধান দিবস।</p>\r\n\r\n<p>ডক্টর তুহিন মালিক&nbsp; : আইনজ্ঞ ও সংবিধান বিশেষজ্ঞ</p>', '0', '', '', '', '1618669095.webp', '', 0, NULL, '2021-04-17 20:18:15', '2021-04-17 20:18:15', 1),
(9, '2021-04-18', 11, 3, 12, 'ময়মনসিংহের দর্শনীয় স্থান', 'ময়মনসিংহের-দর্শনীয়-স্থান-', '<p>ময়মনসিংহের দর্শনীয় স্থান&nbsp;</p>\r\n\r\n<p>■ বাংলাদেশ কৃষি বিশ্ববিদ্যালয়<br />\r\n■ মুক্তাগাছার রাজবাড়ী<br />\r\n■ আলেকজান্দ্রা ক্যাসল<br />\r\n■ শশী লজ,<br />\r\n■ ময়মনসিংহ জাদুঘর<br />\r\n■ শিল্পাচার্য জয়নুল আবেদিন সংগ্রহশালা,<br />\r\n■ পুরাতন ব্রহ্মপুত্র নদী,<br />\r\n■ সার্কিট হাউজ,<br />\r\n■ সিলভার প্যালেস,<br />\r\n■ বিপিন পার্ক,<br />\r\n■ রামগোপালপুর জমিদার বাড়ি,<br />\r\n■ বোটানিক্যাল গার্ডেন,<br />\r\n■ ময়মনসিংহ টাউন হল,<br />\r\n■ দুর্গাবাড়ী,<br />\r\n■ গৌরীপুর রাজবাড়ী,<br />\r\n■ কেল্লা তাজপুর।<br />\r\n■ আলাদিন্স পার্ক<br />\r\n■ তেপান্তর সুটিং স্পট<br />\r\n■ কুমির খামার<br />\r\n■ গারো পাহাড়<br />\r\n■ চীনা মাটির টিলা<br />\r\n■ কালুশাহকালশার দিঘী<br />\r\n■ নজরুল স্মৃতিকেন্দ্র<br />\r\n■ শহীদ আব্দুল জব্বার জাদুঘর<br />\r\n■ রাজ রাজেশ্বরী ওয়াটার ওয়ার্কস</p>', 'ডেস্ক রিপোর্ট', 'news', 'ময়মনসিংহ,দর্শনীয়,স্থান', 'ময়মনসিংহ', '1618716063.webp', 'Image Caption Goes Here', 0, 'nbbb', '2021-04-17 21:35:43', '2021-04-18 09:27:21', 1),
(10, '2021-04-18', 11, 3, 12, 'ময়মনসিংহের দর্শনীয় স্থান সমূহ', 'ময়মনসিংহের-দর্শনীয়-স্থান-সমূহ-', '<p>ময়মনসিংহের দর্শনীয় স্থান সমুহ</p>\r\n\r\n<p>ময়মনসিংহ শহরে একদিনের ভ্রমনে দেখার জন্য উল্লেখ্যযোগ্য স্থানের যাতায়াত ব্যবস্থা সহ সংক্ষিপ্ত বিবরন তুলে ধরা হলো।<br />\r\nবাংলাদেশ কৃষি বিশ্ববিদ্যালয়<br />\r\nযাতায়াত: ময়মনসিংহ শহর থেকে অটো কিংবা রিক্সায় যেতে পারবেন। মাসকান্দা বাস টার্মিনাল থেকে অটো ভাড়া ২০ আর রিক্সা নিবে ৪০-৫০ টাকা। আর ব্রীজ মোড় থেকে ভাড়া অটোতে ১০ আর রিক্সায় ২০-৩৫ টাকা।<br />\r\n১.কৃষি বিশ্ববিদ্যালয় কলেজ<br />\r\nকৃষি বিশ্ববিদ্যালয় কলেজ (কেবি কলেজ) ।<br />\r\nকেবি কলেজ পার হলেই হাতের বাম পাশের রাস্তায় ঢুকলে দেখতে পাবেন ব্রহ্মপুত্র নদের পাড়ে বিশ্ববিদ্যালয় ক্লাব, কমিউনিটি সেন্টার, গনহত্যার স্মৃতিস্তম্ভ বদ্ধভূমি।<br />\r\n২.বৈশাখী চত্বর<br />\r\n৩.বিজয়-৭১<br />\r\n৪.বঙ্গবন্ধু চত্বর<br />\r\n৫.বোটানিক্যাল গার্ডেন<br />\r\n৬.ফ্যাকাল্টির করিডোর<br />\r\n৭.কৃষি জাদুঘর<br />\r\n৮.মৎস্য জাদুঘর<br />\r\n৯.জার্মপ্লাজম সেন্টার<br />\r\n১০.কেন্দ্রীয় লাইব্রেরী<br />\r\n১১.নদের পাড়<br />\r\n&nbsp;এরপর আসে</p>\r\n\r\n<p>শশী লজ</p>\r\n\r\n<p>যাতায়াত: ময়মনসিংহ শহর থেকে অটো কিংবা রিক্সায় যেতে পারবেন। মাসকান্দা বাস টার্মিনাল থেকে অটো ভাড়া ১৫ আর রিক্সায় ৩০-৪০ টাকা</p>\r\n\r\n<p>বর্ণনা: শশী লজ বা শশীলজ, বাংলাদেশের ময়মনসিংহ শহরের কেন্দ্রস্থলে অবস্থিত মহারাজা শশীকান্ত আচার্যের বাড়ী, যা ময়মনসিংহের রাজবাড়ী নামেও সমধিক খ্যাত। শহরের কেন্দ্রস্থলে, ব্রহ্মপুত্র নদের অদূরে, এই রাজবাড়ী অবস্থিত। ১৯৫২ সাল থেকে শশী লজ ব্যবহূত হচ্ছে মহিলা শিক্ষক প্রশিক্ষণ কেন্দ্র হিসেবে।<br />\r\nজয়নুল আবেদিন সংগ্রহশালা ও পার্ক<br />\r\nযাতায়াত: ময়মনসিংহ শহর থেকে অটো কিংবা রিক্সায় যেতে পারবেন। মাসকান্দা বাস টার্মিনাল থেকে অটো ভাড়া ১৫ আর রিক্সা নিবে ৩০-৪৫ টাকা। আর ব্রীজ মোড় থেকে ভাড়া অটোতে ১০ আর রিক্সায় ২০-৩৫ টাকা। (অটোতে গেলে অল্প হেটে যেতে হবে মুল যায়গাতে)<br />\r\nবর্ণনা: ময়মনসিংহ শহরের উত্তর পাশ দিয়ে প্রবহমান পুরাতন ব্রহ্মপুত্র নদের তীরে একটি দোতলা দালান আশ্রয় করে ১৯৭৫ খ্রিস্টাব্দে এই সংগ্রহশালাটি প্রতিষ্ঠিত হয়। ১৯৭৫ সালের ১৫ এপ্রিল বাংলা ১৩৮২ সালের ১লা বৈশাখ তারিখে তৎকালীন বাংলাদেশ সরকারের উপ-রাষ্ট্রপতি সৈয়দ নজরুল ইসলাম এই সংগ্রহশালার উদ্বোধন করেন। সে সময় দেশব্যাপী জয়নুল আবেদিনের বিভিন্ন শিল্পকর্ম সংরক্ষণের নির্দেশ দেয়া হয়েছিলো। আর তাই প্রথম দিকেই শিল্পীর নিজের এলাকা তথা ময়মনসিংহে এই সংগহশালাটি প্রতিষ্ঠিত হয়।<br />\r\nবিপিন পার্ক<br />\r\nপ্রায় ২০০ বছরের প্রাচীন এ পার্কটি ভগ্নদশা পেরিয়ে পেয়েছে নতুন আদল। কংগ্রেস জুবিলি রোডে এ পার্কের অবস্থান।<br />\r\nপার্কটি আকারে ছোট হলেও সারাক্ষন জমজমাট থাকে চা&rsquo;আড্ডায়। এখানে প্রায় অর্ধশত পদের চা পাওয়া যায়।<br />\r\nযাতায়াত: ময়মনসিংহ শহর থেকে অটো কিংবা রিক্সায় যেতে পারবেন। মাসকান্দা বাস টার্মিনাল থেকে রিক্সা নিবে ৩০-৪৫ টাকা। আর ব্রীজ মোড় থেকে ভাড়া অটোতে ৫ আর রিক্সায় ২০-৩৫ টাকা।<br />\r\nআলেকজান্ডার ক্যাসেল</p>\r\n\r\n<p>ময়মনসিংহ শহরের প্রাচীন স্থাপনাগুলোর অন্যতম। শহরের কেন্দ্রস্থলে কোর্ট-কাচারি এলাকায় এর অবস্থান। বহু বরেণ্য ব্যক্তির পায়ের ধুলো পড়েছে এখানে। ১৯২৬ খ্রিস্টাব্দে রবীন্দ্রনাথ ঠাকুর ময়মনসিংহ সফরকালে আলেকজান্ডার ক্যাসেলে কিছুদিন অবস্থান করেছিলেন। এখানে আরো এসেছিলেন লর্ড কার্জন, দেশবন্ধু চিত্তরঞ্জন দাশ, নওয়াব স্যার সলিমুল্লাহ, কামাল পাশা প্রমুখ।<br />\r\nযাতায়াত: ময়মনসিংহ শহর থেকে অটো কিংবা রিক্সায় যেতে পারবেন। মাসকান্দা বাস টার্মিনাল থেকে অটো ভাড়া ১৫ আর রিক্সা নিবে ৩০-৪৫ টাকা। আর ব্রীজ মোড় থেকে ভাড়া অটোতে ১০ আর রিক্সায় ২০-৩৫ টাকা। (অটোতে গেলে অল্প হেটে যেতে হবে মুল যায়গাতে)<br />\r\nআনন্দ মোহন কলেজ<br />\r\n&nbsp;<br />\r\nযাতায়াত: ময়মনসিংহ শহর থেকে অটো কিংবা রিক্সায় যেতে পারবেন। মাসকান্দা বাস টার্মিনাল থেকে অটো ভাড়া ১৫ আর রিক্সা নিবে ৩০-৪৫ টাকা। আর ব্রীজ মোড় থেকে ভাড়া অটোতে ১০ আর রিক্সায় ২০-৩৫ টাকা। (অটোতে গেলে অল্প হেটে যেতে হবে মুল যায়গাতে)<br />\r\nগৌরিপুর লজ<br />\r\nগৌরিপুরের জমিদারদের নিমিথ কাঠের তৈরি গৌরিপুর লজ (বর্তমানে সোনালী ব্যাংকের বাংলো) বৃহ্মপুত্রের পারে অবস্থিত।<br />\r\nরাজ রাজেশ্বরী ওয়াটার ওয়ার্কস<br />\r\nময়মনসিংহ শহরে বর্তমান সোনালী ব্যাংক প্রধান কার্যালয়ের পাশে মুক্তাগাছার কিংবদমিত্মতুল্য জমিদার মহারাজ সূর্যকামত্ম আচার্য চৌধুরী শহরে পানীয় জল সরবরাহের নিমিত্ত রাজ রাজেশবরী ওয়াটার ওয়ার্কস স্থাপন করেন।<br />\r\n&nbsp;<br />\r\nযাতায়াত: ময়মনসিংহ শহর থেকে অটো কিংবা রিক্সায় যেতে পারবেন। মাসকান্দা বাস টার্মিনাল থেকে অটো ভাড়া ১৫ আর রিক্সা নিবে ৩০-৪৫ টাকা। আর ব্রীজ মোড় থেকে ভাড়া অটোতে ১০ আর রিক্সায় ২০-৩৫ টাকা। (অটোতে গেলে অল্প হেটে যেতে হবে মুল যায়গাতে)<br />\r\nমুক্তাগাছার রাজবাড়ী<br />\r\n&nbsp;<br />\r\nযাতায়াত: ময়মনসিংহ শহর থেকে বাস কিংবা সিএনজিতে যেতে পারবেন। টাউন হল মোড় থেকে বাস ও সিএজি পাওয়া যায়, বাসে ১০/১৫ এবং সিএনজিতে ২৫/৩০ টাকা ভাড়া নিবে।</p>\r\n\r\n<p>আপনি যদি বেশি সময় নিয়ে ময়মনসিংহে আসেন তবে দেখতে পারবেন আরো-<br />\r\nআলাদিন্স পার্ক (ফুলবাড়িয়া)<br />\r\n&nbsp;ফুলবাড়িয়ায় দক্ষিণপ্রান্তে লালমাটির পাহাড়ি এলাকায় গড়ে উঠেছে আলাদিন্স পার্ক।&nbsp;<br />\r\nপ্রবেশ মূল্য : প্রবেশ মূল্য ১০০টাকা। এছাড়া ভিতরের প্রতিটি রাইডের জন্য আলাদা করে ৩০ টাকা থেকে ২০০ টাকা দিতে হয়। ৫ বছরের নীচের বাচ্চাদের জন্য ৭টি রাইডার্স ফ্রি।<br />\r\nযেভাবে যাবেন : ময়মনসিংহ শহর থেকে ৩০ কিলোমিটার এবং ফুলবাড়িয়া সদর থেকে মাত্র ১০ কিলোমিটার দূরে এই পার্ক। রেলযোগে ঢাকার কমলাপুর ও এয়ারপোর্ট ষ্টেশন থেকে আন্তঃনগর তিস্তা, অগ্নিবীণা, যমুনা ও ব্রহ্মপুত্র ট্রেনে ময়মনসিংহ শহরে যাওয়া যায়। ময়মনসিংহ থেকে সিএনজি, বাস বা কার যোগে আলাদিন্স পার্কে যাওয়া যায়।<br />\r\nজাতীয় কবি কাজী নজরুল ইসলাম বিশ্ববিদ্যালয় (ত্রিশাল)<br />\r\nবাংলাদেশের ময়মনসিংহ জেলায় অবস্থিত কাজী নজরুল ইসলামের স্মৃতি বিজড়িত ত্রিশাল উপজেলার নামাপাড়া এলাকায় অবস্থিত একটি সরকারি বিশ্ববিদ্যালয়। বিশ্ববিদ্যালয়টি ২০০৬ সালে প্রতিষ্ঠিত হয়।<br />\r\nআঠারবাড়ী জমিদার বাড়ী (ঈশ্বরগঞ্জ)<br />\r\nময়মনসিংহ জেলার অর্ন্তগত ঈশ্বরগঞ্জ উপজেলার একটি সমৃদ্ধ এলাকা আঠার বাড়ী। ব্রিটিশ শাসন আমল থেকেই এলাকাটি ব্যবসা-ব্যাণিজ্যে ও যোগাযোগ ব্যবস্থায় অগ্রসর। এমন একটি সমৃদ্ধ এলাকায় জমিদার প্রমোদ চন্দ্র রায়ের পরিত্যক্ত দৃষ্টিনন্দন সুবিশাল জমিদার বাড়ী এখনও ইতিহাসের স্বাক্ষী হয়ে নিরব দাড়িয়ে আছে। চমৎকার কারুকার্যময় এ রাজবাড়ীটির বয়স প্রায় আড়াই শত বছর। ময়মনসিংহ কিশোরগঞ্জ মহাসড়কে ঈশ্বরগঞ্জ উপজেলার সদর থেকে ১৪ কিলোমিটার পূর্বে কিছু অগ্রসর হলেই চোখে পড়বে জমিদার বিশাল অট্টালিকা। ১৭৯৩ খ্রিষ্ঠাব্দ পর্যন্ত হোসেন শাহী পরগনা রাজশাহী কালেক্টরের অধিনে ছিল।<br />\r\nযেভাবে যাবেন:<br />\r\nময়মনসিংহ হতে ভৈরব গামী ট্রেনে আঠারবাড়ী রেলস্টেশনে নেমে যাওয়া যাবে এবং ময়মনসিংহ কিশোরগঞ্জ গামী বাসে ঈশ্বরগঞ্জ উপজেলায় নেমে আঠারবাড়ীগামী অটো টেক্সি করে যাওয়া যাবে।<br />\r\nকুমির ফার্ম (ভালুকা)<br />\r\nময়মনসিংহে ভালুকায় কুমির চাষ লাভজনক। বাণিজ্যিক ভিত্তিতে উভচর সরীসৃপ প্রাণি কুমিরের কোনো কিছুই &lsquo;ফেলনা&rsquo; নয়। ইতোমধ্যে উৎপাদিত কুমিরের চামড়া রপ্তানি হচ্ছে বিভিন্ন দেশে। এবার মাংস রপ্তানির চিন্তা-ভাবনাও চলছে বলে জানিয়েছে উৎপাদকারী প্রতিষ্ঠান। সবমিলিয়ে রপ্তানিবাণিজ্যে কুমিরের উজ্জ্বল সম্ভাবনা রয়েছে বলে জানিয়েছেন সংশ্লিষ্টরা। জানা যায়, ভালুকা উপজেলা সদর থেকে প্রায় ১৭ কিলোমিটার দূরে ভরাডোবা-সাগরদিঘি সড়কের উপজেলার উথুরা ইউনিয়নের হাতীবেড় গ্রামে রেপটাইল ফার্ম লিমিটেড কুমির চাষ ও কুমির রপ্তানি করছে।</p>\r\n\r\n<p>সৌদিয়া খেজুর বাগান (ভালুকা)<br />\r\nমধ্যবিত্ত পরিবারের সন্তান মোতালেব আর্থিক টানাপড়েনের মাঝখানে ১৯৯৭ সালে পাড়ি জমান সৌদি আরব। সেখানে তিনি মাসিক ৫০০ রিয়াল বেতনে খেজুরবাগানে চাকরি নেন। তিনি অতি অল্প সময়ে খেজুর চাষের ব্যাপারে অভিজ্ঞতা অর্জন করেন। তার ইচ্ছে জাগে তিনি দেশে ফিরে খেজুরবাগান করবেন। ২০০১ সালে ৩৫ কেজি কাঁচা খেজুর নিয়ে তিনি দেশে ফিরেন। খেজুরের বিচি থেকে চারা উৎপাদন করেন। তিনি বাড়িসংলগ্ন ১০ কাঠা জমিতে সেই চারা রোপণ করে পরিচর্যা শুরু করেন। বাংলাদেশে সৌদি খেজুর চাষ করা নিয়ে এলাকার মানুষ তখন বলাবলি করেন, মোতালেবের মাথা খারাপ হয়ে গেছে। খেজুর বাগান করে এলাকায় এক সময়ের মাথা খারাপ মোতালেব এখন খেজুর মোতালেব হিসেবে পরিচিত।<br />\r\nযেভাবে যাবেন:<br />\r\nঢাকা-ময়মনসিংহ সড়কের ভালুকার সিডস্টোর বাজার থেকে সখিপুর সড়কে তিন কিলোমিটার পশ্চিমে সৌদি খেজুরবাগান। অটোতে ভাড়া ১০ টাকা ও রিক্সায় ৩০/৪০ টাকা।<br />\r\nঅর্কিড বাগান (ফুলবাড়ীয়া)<br />\r\nবাংলাদেশের একমাত্র অর্কিড বাগান ময়মনসিংহ জেলার ফুলবাড়ীয়া উপজেলার এনায়েতপুর ইউনিয়নে রয়েছে। এ বাগানটি ২০ একর জমির উপর তৈরী জমির উপরতৈরী হয়েছে। এ বাগানের ২০০ এর অধিক প্রজাতীর অর্কিড রয়েছে। এ অর্কিড সমস্তবাংলাদেশের চাহিদা পূরণ করে বিদেশেও রপ্তানী করে বৈদেশী মুদ্রা অর্জনেসক্ষম হয়েছে। গুণে এবং মানে ও রং বৈচিত্রে ফুলবাড়ীয়ার অর্কিড এর তুলনা হয়না।<br />\r\nকিভাবে যাওয়া যায়: ঢাকা থেকে বাস অথবা ট্রেন যোগে ময়মনসিংহ জেলা শহরে আসতে হবে; দূরত্ব ১২২ কিঃমিঃ। ময়মনসিংহ হতে বাস অথবা সিএনজি যোগে ফুলবাড়ীয়া উপজেলা সদরে আসতে হবে; দূরত্ব ২০ কিঃ মিঃ। ফুলবাড়ীয়া হতে সিএনজি যোগে এনায়েতপুরস্থ অর্কিড বাগানে যেতে হবে; দূরত্ব প্রায় ১২ কিঃ মিঃ।</p>\r\n\r\n<p>সন্তোষপুর রাবার বাগান<br />\r\nসন্তোষপুর রাবার বাগানটি ময়মনসিংহ জেলার ফুলবাড়ীয়া উপজেলাস্থ নাওগাঁও ইউনিয়নের সন্তোষপুরে অবস্থিত। সন্তোষপুর রাবার বাগান ময়মনসিংহ জেলার একটি ঐতিহ্যবাহী স্থান। ইহা প্রায় ১০৬ একর জমি নিয়ে অবস্থিত। এখানে প্রতিদিন অনেক দর্শনার্থী আসেন। বাগানের অভ্যন্তরে বিরল প্রজাতির বানরের বসবাস রয়েছে। রাবার বাগান থেকে সংগৃহিত রাবার প্রক্রিয়াজাত করে দেশ বিদেশে রপ্তানি করে সরকার প্রচুর রাজস্ব আয় করে থাকে। ইহা বন বিভাগের নিয়ন্ত্রণাধীন।<br />\r\nকিভাবে যাওয়া যায়: ঢাকা হতে বাস অথবা ট্রেন যোগে ময়মনসিংহ জেলা শহরে ১২২ কিঃ মিঃ। ময়মনসিংহ হতে বাস অথবা সিএনজি যোগে ফুলবাড়ীয়া উপজেলা সদরে আসতে হবে ২০ কিঃ মিঃ। ফুলবাড়ীয়া হতে সিএনজি যোগে নাওগাঁও ইউনিয়নস্থ সন্তোষপুর রাবার বাগান প্রায় ১৮ কিঃ মিঃ।<br />\r\nতেপান্তর পিকনিক স্পট (ভালুকা)<br />\r\nময়মনসিংহের ভালুকার তেপান্তর পিকনিক স্পট। পিকনিক স্পটের সঙ্গেই রয়েছে একটি শুটিং স্পট। এখানে পিকনিকের আয়োজন করতে এসে দেখা হতে পারে আপনার পছন্দের কোনো তারকার সঙ্গে।<br />\r\nযেভাবে যাবেন: ঢাকা ময়মনসিংহ মহাসড়কের পাশেই স্কয়ার মাস্টারবাড়ীতে এর অবস্থান।<br />\r\nহালুয়াঘাটে দূর পাহাড়ের হাতছানি<br />\r\nরাস্তার ওপাশে দূরে বড় বড় পাহাড়। দৃষ্টির দুই পরতেই শুধু পাহাড় আর পাহাড়। একটির পেছনে আরেকটি। যেন একটি আরেকটির ছায়া। সব পাহাড় আকাশমুখী। কোন কোনটিকে ঘন মেঘ এসে ঢেকে দিচ্ছে। সেখানে মেঘের সঙ্গে পাহাড়ের যেন মিতালী চলছে। কোন কোন পাহাড়ে ঝুম বৃষ্টি। আবার মেঘের ফাঁক বুঝে এক রাশ রোদের আলো এসে পড়েছে কোনও কোনওটিতে। এক পাহাড়ে যখন বৃষ্টি, অন্যগুলোতে তখন রোদ। এভাবে প্রতিদিন পাহাড়ের গায়ে চলে রোদবৃষ্টির খেলা। কেউ কেউ ভাবতে পারে এটি নিশ্চয়ই পার্বত্য জেলার নয়নাভিরাম কোনও স্থান হবে। কিন্তু এ সব ধারণাকে তুড়ি বাজিয়ে উড়িয়ে দেয়া যায় যদি কেউ চলে আসে হালুয়াঘাটের কড়ইতলীতে।<br />\r\nকাদিগড় জাতীয় উদ্যান<br />\r\nকাদিগড় জাতীয় উদ্যান. ময়মনসিংহ বন বিভাগের অধীনস্থঃ ভালুকা রেঞ্জের একটি বিট কাদিগড় বিট। এখানে রয়েছে মনমোহিনী গজারী বাগান ও সেগুন বাগান। বাগানে হনুমান ও বানর আছে। এটি একটি খুব সুন্দর প্রাকৃতিক ও মনুষ্য সৃষ্ট বনের অপূর্ব সমন্বয়। বহুপূর্বে সৃজিত মিনজিরি, অর্জুন ও সেগুনের বাগান এখন প্রাকৃতিক বনের রূপ ধারণ করেছে। প্রকৃতির একান্ত সান্নিধ্যে এসে এই সবুজের সমারোহ আর মন ভুলানো পাখির কলকাকলী প্রকৃতিপ্রেমী মানুষকে করবে বিমোহিত। শুষ্ক মৌসুমে এখানে অনেক লোক বনভোজনে আসে আর নিজেকে সমর্পণ করে প্রকৃতির সম্মোহনী শক্তির কাছে।</p>', 'ডেস্ক রিপোর্ট', 'news', 'ময়মনসিংহ,দর্শনীয়,স্থান,সমূহ,উল্লেখযোগ্য,প্রাকৃতিক', 'ময়মনসিংহ', '1618716629.webp', 'ময়মনসিংহের দর্শনীয় স্থান', 0, 'nn', '2021-04-18 09:30:29', '2021-04-18 09:30:29', 1),
(11, '2021-04-20', 4, 4, 12, 'ক্র্যাকডাউনঃকি ঘটতে যাচ্ছে হেফাজতের ভাগ্যে?', 'ক্র্যাকডাউনঃকি-ঘটতে-যাচ্ছে-হেফাজতের-ভাগ্যে?', '<p>ক্র্যাকডাউন: হেফাজতে ইসলামের ভবিষ্যৎ কী?</p>\r\n\r\n<p>দেশে সর্বাত্মক লকডাউনের মাঝেও আলোচনায় থাকছে হেফাজতে ইসলাম। নানা ঘটনার সাথে রাজনৈতিক অঙ্গনে আলোচনায় বাদ থাকছে না অরাজনৈতিক এই সংগঠনটি। অবস্থাদৃষ্টে মনে হচ্ছে করোনা মহামারীর এই সময়ে সমান গুরত্বপূর্ণ হেফাজতের কর্মকান্ড। এজন্য সরকার এব্যাপারে অনমনীয় নীতি গ্রহণ করেছে। বিরোধী দলগুলোর মতো পুরোন মামলায় হেফাজতের একের পর এক নেতাকে গ্রেফতার সরকারের ক্র্যাকডাউন নীতির বহিঃপ্রকাশ কি না তা নিয়েও প্রশ্ন দেখা দিয়েছে।&nbsp;</p>\r\n\r\n<p>তবে সরকার দাবি করছে, ব্রাহ্মণবাড়িয়া এবং চট্টগ্রামের হাটহাজারীসহ বিভিন্ন জায়গায় নাশকতা বা সহিংসতার ঘটনায় যারা জড়িত ছিল, তাদেরকে চিহ্নিত করে পুলিশ গ্রেপ্তার করছে।</p>\r\n\r\n<p>চলতি বছরের মার্চে ভারতের প্রধানমন্ত্রী নরেন্দ্র মোদী বাংলাদেশ সফর করেন। সেসময় সফরকে কেন্দ্র করে তুমুল বিরোধিতা শুরু করেন দেশের বিভিন্ন মহল। আর সহিংস কিছু ঘটনার পর থেকে দেশের রাজনীতির মাঠ বেশ উত্তপ্ত হয়ে উঠে।</p>\r\n\r\n<p>এদিকে সহিংস ঘটনায় সরকার দলীয় লোকজন জড়িত থাকলেও তারা ধরাছোঁয়ার বাহিরে রয়ে গেছেন এখনো।&nbsp;</p>\r\n\r\n<p>সহিংস ওই ঘটনার পর ধর্মভিত্তিক সংগঠন হেফাজতে ইসলামের কেন্দ্রীয় যুগ্ন মহাসচিব মামুনল হক ও বেশ&nbsp; কিছু কেন্দ্রীয় ও মহানগর নেতাসহ বিভিন্ন জায়গায় থেকে ২০০ অধিক নেতাকর্মীকে গ্রেফতার করা হয়েছে । এরই মধ্যে মামুনুলকে ৭ দিনের রিমান্ডে নিয়েছে পুলিশ। এবং আরো একটি মামলায় তাকে রিমান্ডে চাইবে বলে জানিয়েছে গোয়েন্দা সংস্থা সিআইডি।&nbsp;</p>\r\n\r\n<p>এ বিষয়ে হেফাজত নেতারা বলছেন , সরকার লকডাউনকে পুঁজি করে আমাদের নেতাকর্মীদের ওপর গ্রেফতার অভিযান চালিয়ে যাচ্ছে ।</p>\r\n\r\n<p>এদিকে গত ১৩ এপ্রিল গণমাধ্যমে প্রেরিত এক বিবৃতিতে&nbsp; সংগঠনটির আমির আল্লামা বাবুনগরী বলেন, ২০১৩ সালে দায়েকৃত মিথ্যা মামলায় দীর্ঘ আট বছর পর গ্রেফতার হওয়া নতুন ষড়যন্ত্রের অংশ বলে আমি মনে করি। ২০১৩ সালের মামলায় এখন গ্রেফতার হওয়া কতটা হাস্যকর ও উদ্দেশ্যপ্রণোদিত তা বলার অপেক্ষা রাখে না।<br />\r\nএরপর ১৯ এপ্রিল গণমাধ্যমে পাঠানো একটি ভিডিও বার্তায় তিনি দাবি করেন মোদির সফর নিয়ে কোনো কর্মসূচি ছিল না হেফাজতের। একইসাথে তিনি এও বলেন ইসলাম কখনো কোনো জ্বালাও পোড়ানোতে বিশ্বাস করে না। তিনি বিচ্ছিন্ন ঘটনার জন্য দুঃখ প্রকাশ করে গ্রেফতারকৃত নেতাদের মুক্তি দাবি করেন। ২০ মিনিটের ওই ভিডিওতে হেফাজতের সাথ অন্য কোনো রাজনৈতিক দলের সম্পৃক্ততা প্রমান কেউ করতে পারবেন না বলেও তিনি উল্লেখ করেন।</p>\r\n\r\n<p>এদিকে বিভিন্ন সময় হেফাজতের কর্মসূচিকে ঘিরে&nbsp; সহিংসতার মামলায় বাংলাদশ জামায়াতে ইসলামী ও বিএনপি নেতাকর্মীদেরও গ্রেফতারের অভিযোগ উঠেছে ভুক্তভোগীর পরিবার ও দল দুটির পক্ষ থেকে। এরই মধ্যে বিএনপির মহাসচিব মির্জা ফখরুল&nbsp; লকডাউনের মধ্যে বিরোধী মতের ওপর ক্র্যাকডাউন চালানোর অভিযোগ তুলেছেন।&nbsp; একইভাবে জামায়াতের সেক্রেটারী জেনারেল সাবেক এমপি অধ্যাপক মিয়া গোলাম পরওয়ার নারায়ণগঞ্জে হেফাজতে ইসলাম বাংলাদেশের ডাকা হরতালে ভাঙচুর ও অগ্নিসংযোগের মামলায় মহানগর জামায়াতে ইসলামীর আমির মাওলানা মাঈনুদ্দিন আহমেদসহ ৩ জনকে গ্রেফতারের&nbsp; নিন্দা জানিয়ে&nbsp; এক বিবৃতি প্রদান করেছেন</p>\r\n\r\n<p>অন্যদিকে আওয়ামী লীগের যুগ্ম সাধারণ সম্পাদক মাহবুবুল আলম হানিফ বলেছেন, নাশকতা বা সহিংসতায় জড়িতদের চিহ্নিত করে তাদেরকেই আওতায় নেয়া হচ্ছে। &quot;যারা এই সন্ত্রসী বা নাশকতামূলক কর্মকাণ্ডে সরাসরি জড়িত ছিল, ভিডিও ফুটেজ দেখে তাদেরকে চিহ্নিত করেই তাদের বিরুদ্ধে ব্যবস্থা নেয়া হচ্ছে। তিনি অভিযোগ করেছেন, &quot;সহিংস ঘটনাগুলোতে বিএনপির নেতাকর্মীরা জড়িত ছিল। এসবের ভিডিও ফুটেজ আছে। তার ভিত্তিতেই ব্যবস্থা নেয়া হচ্ছে।&quot;</p>\r\n\r\n<p>এছাড়াও মামলা থেকে বাদ যায়নি ঢাকা বিশ্ববিদ্যালয় কেন্দ্রীয় ছাত্র সংসদের সাবেক সহ-সভাপতি (ভিপি) নুরুল হক নুর ।</p>\r\n\r\n<p>ফেসবুক লাইভে একটি বক্তব্যের কারণে নুরুল হক নুরের বিরুদ্ধে ডিজিটাল নিরাপত্তা আইনে ১৯ এপ্রিল পল্টন ও শহবাগ থানায় পৃথক দুটি মামলা দায়ের করা হয়েছে।&nbsp;</p>\r\n\r\n<p>মামলা দায়ের করাকে&nbsp; নুরুল হক নুর একটি রাজনৈতিক ষড়যন্ত্র হিসেবে উল্লেখ করছেন।</p>\r\n\r\n<p>হেফাজতের সাথে সমঝোতার গুঞ্জন</p>\r\n\r\n<p>হেফাজতের শীর্ষ নেতাদের সঙ্গে গতকাল&nbsp; সোমবার রাতে ধানমন্ডির সরকারি বাসভবনে স্বরাষ্ট্রমন্ত্রী আসাদুজ্জামান খান কামালের সাথে বৈঠক করছেন । জানা যায় বৈঠকে তিনটি বিষয়ে আলোচনা হয়েছে।&nbsp; এরমধ্যে ঢালাওভাবে গ্রেফতার বন্ধ, সাম্প্রতিক সময়ে সংঘটিত ঘটনাগুলোর তদন্ত এবং কওমি মাদ্রাসা খুলে দেয়া।</p>\r\n\r\n<p>অনেক বিশ্লেষকরা মনে করছেন , সরকারের কঠোর অবস্থানের কারণে হেফাজতে ইসলামের শীর্ষ নেতারা সমঝোতার চেষ্টা করছেন। তারই&nbsp; ধারাবাহিকতায় তারা গোয়েন্দা সংস্থা ও স্বরাষ্ট্রমন্ত্রীর সঙ্গে বৈঠক করেছেন।</p>\r\n\r\n<p>ঢাকা মেট্রোপলিটন পুলিশ সূত্রে জানা গেছে, এখন পর্যন্ত রাজধানী ঢাকাতেই হেফাজতের মধ্যম ও শীর্ষ নেতৃবৃন্দের মধ্যে ৯ জনকে গ্রেফতার করা হয়েছে।</p>\r\n\r\n<p>হেফাজতের প্রতিষ্ঠাতা আমির আল্লামা শাহ আহমদ শফি একসময় সরকারের সাথে সুসম্পর্ক স্থাপন করে কিছু দাবি আদায় করেছিলেন। সেসময় সরকারের তরফ থেকেও শীর্ষ মন্ত্রীরা যোগাযোগ করতো সংগঠনটির সাথে। তবে শফির ইন্তেকালের পর দৃশ্য পাল্টে যায়। হেফাজতের নতুন নেতৃত্বের সাথে সরকারের সমঝোতা না হওয়ায় এমন ক্র্যাকডাউন চালিয়ে নমনীয় করার কৌশল গ্রহণ করা হয়ে থাকতে পারে বলে অনেকে মনে করছেন। সংগঠনটিকে ধ্বংস করতে বা নিষিদ্ধ করার কোনো পরিকল্পনা নিয়ে সরকার এগুচ্ছে কি না&nbsp; এনিয়েও সচেতন মহলে প্রশ্ন তৈরি হয়েছে।&nbsp;</p>\r\n\r\n<p>হেফাজতে ইসলামকে জুলুম নির্যাতনের মাধ্যমে সমঝোতায় আসতে বাধ্য করে জাতীয় পার্টির মত নিয়ন্ত্রণ করার কৌশল নিয়েছে কি না তা এখনো পরিস্কার নয়। তবে সরকারের এমন নীতি প্রতিপক্ষের সাথে হেফাজতের দুরত্ব কমবে না, বাড়বে বলেই মনে হচ্ছে।&nbsp; এর মধ্য দিয়ে হেফাজতের রাজনৈতিক পরিপক্বতার বিকাশ ঘটবে। হেফাজতের ভবিষ্যৎ নির্ভর করছে তাদের নেতৃত্বের দূরদর্শিতার ওপর।</p>', 'ডেস্ক রিপোর্ট', 'news', 'হেফাজত,ইসলাম,বাংলাদেশ,আ\'লীগ,প্রশাসন,মামলা,গুম,নেতা,আটক,মামুনুল,হক,', 'হেফাজতের ভাগ্যে কি', '1618912453.webp', 'হেফাজতে ইসলামের ভাগ্য কি?', 0, 'nn', '2021-04-20 15:54:13', '2021-04-20 15:54:13', 1),
(12, '2021-04-21', 11, 3, 12, 'শহরে যানজট-নিরসনে উপায় কি?', 'শহরে-যানজট-নিরসনে-উপায়-কি?', '<p>শহরে যানজট - নিরসনে উপায় কি?<br />\r\nধীরে ধীরে ময়মনসিংহ শহর হয়ে উঠছে যানজটের নগরী হিসেবে, লকডাউনের আগেও চোখে পরত ভোগান্তি পূর্ণ যানজট, বিশেষ করে সকালের কর্মব্যস্ততার শুরু এবং বিকাল থেকে কর্মস্থান ত্যাগ করার সময়ে শুরু হত এই যানজটের, পৌরসভা থেকে সিটি কর্পোরেশন, কিংবা বিভাগে রূপান্তরিত হওয়ার পরেও রাস্তাঘাট গুলো হয়নি প্রশস্ত, তার উপর আবার শহরে প্রায় ২২টির মত রেলক্রসিং থাকায় নগরবাসীর ব্যাস্ততার মাঝেও থেমে থাকতে হয় ইচ্ছার বিরুদ্ধেই ।&nbsp;</p>\r\n\r\n<p><br />\r\nশহরে ভেদ করে রেলপথ চলে হওয়ায় সেই লাইনে চলে ২৯ টির মত ট্রেন, দিনে ৫৮ বার ট্রেনের&nbsp; যাতায়াত হওয়ায় রেলক্রসিং অন্তত ৭ মিনিট করে হলেও অন্তত ৭ ঘন্টা থামতে হয় যানাবাহনের।&nbsp; (তথ্যসূত্রঃ বৈশাখী টিভি) যার ফলে সৃষ্টি হয় যানজটের।&nbsp;</p>\r\n\r\n<p><br />\r\nএছাড়াও বাড়তি হিসেবে থাকছে অবৈধ অটো রিক্সার বিচরণ, ক্রসিং এর সময় উল্টাপথে যানবাহন চলাচল।&nbsp;<br />\r\nঅন্যদিকে শহরের গাঙ্গিনাপাড় ও আশপাশের এলাকায় বানিজ্যিক ব্যাস্ততা থাকায়৷&nbsp; চরপাড়া মোড়ে ব্রিজ হতে ঢাকাগামী বিভিন্ন বাসের চলাচল, রাস্তার পাশে এম্বুলেন্স এবং সিএনজির পার্কিং,&nbsp; টাউনহল মোড়ে জামালপুর ও মুক্তাগাছার সিএনজি স্ট্যান্ড থাকায় সৃষ্টি হয় যানজটের।&nbsp;<br />\r\nঅন্যদিকে মাসকান্দায় বাসস্ট্যান্ড এবং যানবাহনের পয়েন্ট ব্রিজ হওয়ায় এলাকাটি যানজন মুক্ত হয়না কখনই।&nbsp;</p>\r\n\r\n<p><br />\r\nট্রেন চলাচলে যানবাহনের থেমে যাওয়াই যানজটের মূল কারন হিসেবে দেখছে ময়মনসিংহ জেলা পুলিশ, তবে এই ব্যাপারে বাংলাদেশ রেলওয়ে ,ময়মনসিংহ বলছেন রেললাইনের বাইরেও যদি সিটি কর্পোরেশন কোন উদ্যোগ নিতে পারে তাহলে হয়ত দূর হতে পারে যানজটের।&nbsp;<br />\r\nএদিকে নগরবাসীর দাবী শহরের যানজট দূর করতে যথাযথ উদ্যোগ গ্রহণ করবে সিটি কর্পোরেশন, অবৈধ অটো রিক্সা ও উল্টাপথে চলাচল বন্ধের মাধ্যমেই দূর করা সম্ভব যন্ত্রণার চুড়ান্ত মাত্রায় থাকা এই যানজট।</p>', 'ডেস্ক রিপোর্ট', 'video', 'ময়মনসিংহ,যানজট,নিরসনে,উদ্যোগ,হুমকি,উপায়,', 'শহরের যানজট নিরসনে উপায় কি', '1619017455.webp', 'শহরে যানজট নিরসনে উপায় কি', 0, 'Nnn', '2021-04-21 21:04:15', '2021-04-21 21:04:15', 1),
(13, '2021-04-24', 4, 4, 12, 'আপনার ফোনে প্রমোশনাল এসএমএস বন্ধ করতে টাইপ করুন', 'আপনার-ফোনে-প্রমোশনাল-এসএমএস-বন্ধ-করতে-টাইপ-করুন', '<p><br />\r\nমোবাইলে প্রমোশনাল এসএমএস না পেতে চাইলে টাইপ করুনঃ<br />\r\nগ্রামীনফোনঃ *১২১*১১০১#<br />\r\nবাংলালিংকঃ *১২১*৮*৬#<br />\r\nরবি ও এয়ারটেলঃ *৭#</p>\r\n\r\n<p>জনস্বার্থে - বিটিআরসি</p>', 'ডেস্ক রিপোর্ট', 'video', 'মোবাইল,সিম,প্রমোশনাল,এসএমএস,গ্রাহক,চরম,ভোগান্তি,টাকা,অনাকাঙ্ক্ষিত,হয়রানি', 'মোবাইলে এসএমএস বন্ধ করতে', '1619273218.webp', 'মোবাইলে এসএমএস বন্ধ করতে', 0, 'Nnn', '2021-04-24 20:06:58', '2021-04-24 20:06:58', 1),
(14, '2021-04-24', 11, 3, 12, 'একদিনে ময়মনসিংহ জেলার দর্শনীয় স্থান ভ্রমণ করবেন যেভাবে', 'একদিনে-ময়মনসিংহ-জেলার-দর্শনীয়-স্থান-ভ্রমণ-করবেন-যেভাবে-', '<h1>একদিনে ময়মনসিংহ জেলার দর্শনীয় স্থানের ভ্রমণ গাইড</h1>', 'ডেস্ক রিপোর্ট', 'video', 'একদিনে,ময়মনসিংহ,ভ্রমণ', 'ময়মনসিংহে একদিনে ভ্রমণ', '1619278695.webp', 'একদিনে ময়মনসিংহ ভ্রমণ করবেন যেভাবে', 0, 'nn', '2021-04-24 21:38:15', '2021-04-24 21:38:15', 1),
(15, '2021-04-25', 4, 4, 12, 'প্রথম ধাপে ১০৭৮৯ রাজাকারের তালিকা প্রকাশ করেছে মুক্তিযোদ্ধ বিষয়ক মন্ত্রণালয়', 'প্রথম-ধাপে-১০৭৮৯-রাজাকারের-তালিকা-প্রকাশ-করেছে-মুক্তিযোদ্ধ-বিষয়ক-মন্ত্রণালয়', '<p>সরকারের হাতে থাকা নথির তথ্য-উপাত্তের ভিত্তিতে একাত্তরে রাজাকার, আল-বদর, আল-শামস বাহিনীর বেতনভোগী ১০ হাজার ৭৮৯ জন স্বাধীনতাবিরোধীর প্রথম তালিকা প্রকাশ করেছে মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয়।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>মন্ত্রী আ ক ম মোজাম্মেল হক জানিয়েছেন, স্বরাষ্ট্র মন্ত্রণালয়ের হেফাজতে থাকা দালিলিক প্রমাণের ভিত্তিতে এই তালিকা প্রকাশ করা হয়েছে। প্রথম তালিকা রোববার মন্ত্রণালয়ের ওয়েবসাইটে দেওয়া হয়েছে। পর্যায়ক্রমে পুরো তালিকা প্রকাশ করা হবে।</p>\r\n\r\n<p>রোববার মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয়ে এক সংবাদ সম্মেলনে মন্ত্রী বলেন, পাকিস্তানি হানাদার বাহিনী দীর্ঘ নয় মাস তাদের স্থানীয় দোসর জামায়াতে ইসলামী, মুসলিম লীগ, রাজাকার, আল-বদর, আল-শামস ও শান্তি কমিটির সহায়তায় বর্বরোচিত হত্যাযজ্ঞ চালিয়ে ৩০ লাখ বাঙালিকে হত্যা করেছে, দুই লাখ মা-বোনের সন্ত্রমহানি করেছে।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://m.bdnews24.com/bn/detail/bangladesh/1701036\">তালিকার রাজাকারদের &lsquo;অপরাধ অনুযায়ী&rsquo; বিচার হবে: আইনমন্ত্রী&nbsp;</a>&nbsp;</p>\r\n\r\n<p>স্বরাষ্ট্র মন্ত্রণালয়ের নথি পর্যালোচনা করে সেই সব স্বাধীনতাবিরোধীর মধ্যে ১০ হাজার ৭৮৯ জনের প্রথম তালিকা প্রকাশ করা হল বলে জানান মন্ত্রী।</p>\r\n\r\n<p>তিনি বলেন, &ldquo;একটি বিষয় স্পষ্ট করতে চাই, আমরা কোনো তালিকা তৈরি করছি না। যারা একাত্তরে রাজাকার, আল-বদর, আল-শামস বা স্বাধীনতাবিরোধী হিসেবে পাকিস্তান সরকার কর্তৃক নিয়োগপ্রাপ্ত হয়েছিলেন এবং যেসব পুরোনো নথি স্বরাষ্ট্র মন্ত্রণালয়ে সংরক্ষিত ছিল সেটুকু প্রকাশ করছি।&rdquo;</p>\r\n\r\n<p>তালিকায় যাদের নাম রয়েছে তা গেজেট আকারে প্রকাশ করা হবে কি-না জানতে চাইলে মোজাম্মেল হক বলেন, &ldquo;কোনো গেজেট প্রকাশ করা হবে না। তবে জাতি প্রত্যাশা করলে এবং সরকার মনে করলে গেজেট করবে। আমরা তালিকা প্রকাশ করলাম, আগে রিঅ্যাকশনটা দেখব, জাতি চাইলে এটা হবে।&rdquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>একাত্তরে বাংলাদেশের স্বাধীনতা যুদ্ধের সময় কয়েকটি রাজনৈতিক দল পাকিস্তানি বাহিনীর পক্ষ নিয়েছিল। এর মধ্যে রয়েছে জামায়াতে ইসলামী, মুসলিম লীগ, নেজামে ইসলামী।</p>\r\n\r\n<p>তখন যুদ্ধরত পাকিস্তানি সামরিক বাহিনীকে সহযোগিতা করতে রাজাকার বাহিনী গঠিত হয়েছিল। আনসার বাহিনীকে এই বাহিনীতে একীভূত করা হয়েছিল।</p>\r\n\r\n<p>প্রথমে এটি বাংলাদেশের স্বাধীনতাবিরোধী রাজনৈতিক দলের নেতাদের নিয়ে গঠিত শান্তি কমিটির অধীনে থাকলেও পরে একে আধা সামরিক বাহিনীর স্বীকৃতি দিয়েছিল পাকিস্তান সরকার।</p>\r\n\r\n<p>একই রকম আধা সামরিক বাহিনী ছিল আল বদর বাহিনী ও আল শামস বাহিনী। তবে স্বাধীনতাবিরোধী এই বাহিনীগুলোকে সাধারণ অর্থে রাজাকার বাহিনী হিসেবেই পরিচিত বাংলাদেশে।</p>\r\n\r\n<p>প্রায় এক দশক আগে একাত্তরের যুদ্ধাপরাধের বিচার শুরুর পর রাজাকারের তালিকা তৈরির দাবি জোরালো হয়। ২০১২ সালে আওয়ামী লীগ সরকারের মুক্তিযুদ্ধবিষয়কমন্ত্রী এ বি তাজুল ইসলাম সংসদে এক প্রশ্নের উত্তরে জানিয়েছিলেন, রাজাকারের কোনো তালিকা সরকারের কাছে নেই।</p>\r\n\r\n<p>তবে তিনি বলেছিলেন, ১৯৭১ সালের খুলনায় আনসার হেডকোয়ার্টার্সে পাওয়া তালিকায় ৩০ হাজারের বেশি রাজাকারের তথ্য মিলেছিল। ওই তালিকাটি মুক্তিযোদ্ধা সংসদের কেন্দ্রীয় কার্যালয়ে রয়েছে।</p>\r\n\r\n<p>এরপর গত ২৫ অগাস্ট মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয় সম্পর্কিত সংসদীয় স্থায়ী কমিটির বৈঠকে রাজাকারদের তালিকা সংগ্রহে কাজ শুরু হওয়ার কথা জানানো হয়।</p>\r\n\r\n<p>বৈঠকের কার্যপত্র থেকে জানা যায়, ১৯৭১ সালের বেতনভোগী রাজাকারদের তালিকা সংগ্রহের জন্য চলতি বছর ২১ মে জেলা প্রশাসকদের (ডিসি) চিঠি পাঠানো হয় স্বরাষ্ট্র মন্ত্রণালয়ের পক্ষ থেকে। পরে ওই তালিকা করার জন্য আবারও তাগিদ দেওয়া হয়।</p>\r\n\r\n<p>এর ধারাবাহিকতায় বিজয় দিবসের আগের দিন ৬৫৯ পৃষ্ঠার প্রথম তালিকা প্রকাশ করতে এসে মুক্তিযুদ্ধ বিষয়ক মন্ত্রণালয়ের মন্ত্রী আ ক ম মোজাম্মেল হক বলেন, বিগত বিএনপি-জামায়াত জোট সরকারের সময় অনেক নথি সুকৌশলে সরিয়ে ফেলা হয়েছে। ফলে পরিপূর্ণ তালিকা পাওয়া কঠিন হচ্ছে।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&ldquo;তৎকালীন ১৯ জেলার রেকর্ড রুমে যেসব দালিলিক প্রমাণ ছিল, সেগুলো দিতে বলা হয়েছিল; আশারুরূপ তালিকা পাইনি। তাই জানুয়ারি মাসের মধ্যে রেকর্ড পাঠানোর জন্য বলেছি।&rdquo;</p>\r\n\r\n<p>বিভিন্ন জেলার রেকর্ড রুম এবং ওই সময় বিজি প্রেসে ছাপানো তালিকাও সংগ্রহ করার চেষ্টা চলছে জানিয়ে মন্ত্রী বলেন, &ldquo;যাচাই-বাছাই করে ধাপে ধাপে আরও তালিকা প্রকাশ করা হবে।</p>\r\n\r\n<p>এক প্রশ্নে মোজাম্মেল বলেন, তালিকাভুক্ত ব্যক্তিদের বিরুদ্ধে যদি কোনো মানবতাবিরোধী অপরাধের অভিযোগ থেকে থাকে, তাহলে এই তালিকা প্রকাশের মধ্য দিয়ে তাদের বিচারের দ্বার উন্মোচিত হবে বলে তার বিশ্বাস।</p>\r\n\r\n<p>&ldquo;তবে কারো বিরুদ্ধে আইনগত ব্যবস্থা নেওয়ার জন্য এই তালিকা নয়। তালিকাভুক্ত হলে মামলা করা যাবে বা তালিকাভুক্ত না হলে মামলা করা যাবে না এমন নয়। বাদী অভিযোগ আনলে মামলা হবে।&rdquo;</p>\r\n\r\n<p>মন্ত্রী বলেন, প্রথম ধাপের তালিকায় যাদের নাম রয়েছে তাদের রাজনৈতিক পরিচয় চিহ্নিত করা হয়নি। তবে মুক্তিযুদ্ধ চলাকালে স্বেচ্ছায় যারা ক্যান্টনমেন্টে ছিলেন তারাও স্বাধীনতাবিরোধী।</p>', 'ডেস্ক রিপোর্ট', 'video', 'রাজাকার,শত্রু,বাংলাদেশ,মুক্তিযুদ্ধ,', 'রাজাকারের তালিকা প্রকাশ', '1619342215.webp', 'ছবিঃসংগৃহিত', 0, 'nnn', '2021-04-25 15:16:55', '2021-04-25 15:18:48', 1),
(16, '2021-04-25', 19, 5, 12, 'আবারো সংসার ভাঙ্গছে জনপ্রিয় সঙ্গিত শিল্পী নাজমুন মুনিরা ন্যানসি\'র', 'আবারো-সংসার-ভাঙ্গছে-জনপ্রিয়-সঙ্গিত-শিল্পী-নাজমুন-মুনিরা-ন্যানসি\'র', '<p>জনপ্রিয় শিল্পী নাজমুন মুনিরা ন্যানসির ভেরিফাইড ফেসবুক একাউন্টে দেওয়া স্ট্যাটাসটি হুবহু পাঠকদের জন্য তুলে দেওয়া হলো...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>আমি এবং জায়েদ দীর্ঘ দিন ধরেই আলাদা থাকছি | তবে মাঝে মধ্যেই আমাদের দেখা অথবা ফোনালাপ হয় | আমার এবং জায়েদের একমাত্র কন্যা সন্তান নায়লা তার বাবার সাথেই থাকে | নায়লা কে নিজের কাছে রাখবার সিদ্ধান্ত একক ভাবে জায়েদের | যেহেতু স্বামী স্ত্রীর বাইরেও আমরা দীর্ঘ দিনের বন্ধু কাজেই বোঝা পড়া টা মন্দ নয় | তবে নাটকীয় ভাবে বলবোনা - আমরা আজীবন বন্ধু থেকে যাবো | কিছু বৈরি সম্পর্ক তৈরী না হলে নিশ্চই আলাদা থাকতাম না! কে সঠিক, কে বেঠিক এ নিয়ে ফিসফিস করবার কিছুই নেই | আমাকে অথবা জায়েদ কে সরাসরি জিজ্ঞেস করলেই হয়! আর হ্যা, আমাদের এখনো বিচ্ছেদ হয়নি | হলে নিশ্চই সবাইকে জানিয়ে দেয়া হবে | তারপর নতুন জীবনে কি করবো সেটা আপাতত আমি নিজেই ভাবছিনা, দয়া করে আপনারাও মানসিক চাপ নেবেন না | আপনারাও ভালো থাকুন, আমাদেরও ভালো থাকতে দিন | জীবন থেমে থাকেনা, নিশ্চিত নতুন করে পথ চলা শুরু করবো | তবে এটাও নিশ্চিত - আমার নতুন পথচলায় কাছের মানুষরাই আমন্ত্রিত হবেন | বহিরাগত দের প্রবেশ সম্পূর্ণ রূপে নিষেধ |</p>', 'ডেস্ক রিপোর্ট', 'video', 'ন্যান্ সি,সঙ্গীত,শিল্পী', 'সংসার ভাঙ্গছে', '1619370785.webp', 'ছবিঃসংগৃহিত', 0, 'nnn', '2021-04-25 23:13:05', '2021-04-25 23:13:05', 1);
INSERT INTO `news` (`id`, `date`, `category_id`, `subcategory_id`, `uploader_id`, `title`, `slug`, `description`, `publisher`, `post_type`, `meta_tag`, `meta_description`, `banner_img_name`, `image_caption`, `position`, `video`, `created_at`, `updated_at`, `status`) VALUES
(17, '2021-04-26', 4, 4, 10, 'ময়মনসিংহের সকল বিশেষজ্ঞ ডাক্তারের মোবাইল নাম্বার ও ঠিকানা', 'ময়মনসিংহের-সকল-বিশেষজ্ঞ-ডাক্তারের-মোবাইল-নাম্বার-ও-ঠিকানা', '<p>প্রফেসর ডাঃ এম শামছুল হক এমবিবিএস।এম,ডি এম (কার্ডিওলজী) প্রাক্তন বিভাগীয় প্রধান(অবঃ) , কার্ডিওলজী ময়মনসিংহ মেডিকেল কলেজ এন্ড হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ সকাল ৮.৩০টা থেকে সন্ধ্যা ৬.০০ টা পর্যন্ত সিরিয়ালের জন্যঃ ০১৭২৭-৩২২৪৯৬ সার্জারী বিশেষজ্ঞ ডাঃ আফরোজা ইসলাম এমবিবিএস(ঢাকা), বি.সি.এস (স্বাস্থ্য) এফ.সি.পি.এস সার্জারী কনসালটেন্ট (সার্জারী) সার্জারী বিশেষজ্ঞ (নেক্সাস হাসপাতাল) সাক্ষাতের সময়ঃ শনিবার থেকে বৃহপতিবার পর্যন্ত বিকাল ৫ থেকে রাত ৮ টা পর্যন্ত ডাঃ এ.কে.এম সাজিদুর রহমান সিদ্দিক এম.বি.বি.এস, ডি-কার্ড এম.ফিল এন্ডোক্রাইনোলজী এন্ড মেটাবলিজম সহযোগী অধ্যাপক, কার্ডিওলজী ময়মনসিংহ মেডিকেল ও হাসপাতাল (নেক্সাস হাসপাতাল) সিরিয়ালের জন্যঃ ০১৭৯৬-৫৮৬৫৬১ ডাঃ গোলাম রহমান ভুঁঞা এমবিবিএস (ডিএমসি),বিসিএস, এফসিপিএস(মেডিসিন) এম আর সি পি (এন.পি.এ.সি.ই.এস ,ইংল্যান্ড), এম ডি (কার্ডিওলজী) মেডিসিন এন্ড কার্ডিওলজিস্ট ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ বিকাল ৪.০০ টা থেকে রাত৯.০০ টা পর্যন্ত(শুক্রবার বন্ধ) সিরিয়ালের জন্যঃ ০১৫৫৩-৩৪১৬৬২-৬৩ প্রফেসর ডাঃ শংকর নারায়ন দাস এম.বি.বি.এস, এফ.সি.পি.এস,এম.ডি,এম.এ.সি.পি (আমেরিকা) এফ.আর.সি.পি,(গ্লাসগো) মেডিসিন স্পেশালিস্ট প্রফেসর এন্ড বিভাগীয় প্রধান (মেডিসিন) ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ বিকাল ৪.০০ টা থেকে রাত ৯.০০ টা পর্যন্ত(শনিবার,রবি বার) সিরিয়ালের জন্যঃ ০১৫৫৩-৩৪১৬৬২-৬৩ ডাঃ মোঃ টিটো মিঞা এফ.সি.পি.এস (মেডিসিন)ডব্লিউ এইচ ও ফেলো গ্রামাটোলজী মেডিসিন এন্ড বাতরোগ স্পেশালিস্ট সহকারী অধ্যাপক,মেডিসিন বিভাগ ঢাকা মেডিকেল কলেজ এন্ড হাসপাতাল, ঢাকা (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ বৃহস্পতিবার ও শুক্রবার সিরিয়ালের জন্যঃ ০১৫৫৩-৩৪১৬৬২-৬৩ ডাঃ মোঃ খুরশেদ আলম এমবিবিএস,বিসিএস(স্বাস্থ্য), এমডি(মেডিসিন) সহকারী অধ্যাপক ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ দুপুর ২.৩০ টা থেকে সন্ধ্যা ৭.৩০ টা পর্যন্ত সিরিয়ালের জন্যঃ ০১৫৫৩-৩৪১৬৬২-৬৩ ডাঃ মনজুরুল চৌধুরী এমবিবিএস(ঢাকা), এফসিপিএস(মেডিসিন) এমডি(গ্যাস্ট্রোএন্টারোলজী) মেডিসিন লিভার ও পরিপাকতন্ত্র বিশেষজ্ঞ সহকারী অধ্যাপক ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ বিকাল ৪.০০ টা থেকে রাত ৮.০০ টা পর্যন্ত সিরিয়ালের জন্যঃ ০১৫৫৩-৩৪১৬৬২-৬৩ চিত্তরঞ্জন দেবনাথ এমবিবিএস,এফসিপিএস(মেডিসিন) এমডি (হেপাটলজী) এমএসিপি(আমেরিকা) এফআরসিপি (এডিন) ইউকে লিভার ও মেডিসিন বিশেষজ্ঞ ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ বিকাল ৩.০০টা থেকে সন্ধ্যা ৭.০০টা পর্যন্ত সিরিয়ালের জন্যঃ ০১৫৫৩-৩৪১৬৬২-৬৩ ডাঃ কনোজ কুমার বর্মণ এমবিবিএস(ঢাকা),এমএস-সি,এমপিএইচ, এমডি(নিউরোলজী) ফেলোশীপ ইন এপিলেপ্টোলজী(ভারত), জাপান ও দক্ষিণ কোরিয়াতে উচ্চতর প্রশিক্ষণ প্রাপ্ত সহকারী অধ্যাপক (নিউরোলজী বিভাগ) বঙ্গবন্ধু শেখ মুজিব মেডিকেল বিশ্ববিদ্যালয় (পিজি হাসপাতাল)ঢাকা (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতেরত সময়ঃ সকাল ৯.০০ টা থেকে দুপুর পর্যন্ত সিরিয়ালের জন্যঃ ০১৫৫৩-৩৪১৬৬২-৬৩ ডাঃ মানবেন্দ্র ভট্টাচার্য স্নায়োরোগ বিশেষজ্ঞ এমবিবিএস,এমডি(নিউরোলজী) ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ বিকাল ৪.৩০টা থেকে রাত ৯.০০টা পর্যন্ত সিরিয়ালের জন্যঃ ০১৫৫৩-৩৪১৬৬২-৬৩ ডাঃ রতন চন্দ্র সাহা এমবিবিএস(ঢাকা),বিসিএস(স্বাস্থ্য) ডিটিসিডি(ডিইউ), এফসিসিপি(আমেরিকা) ডিএফএম(ইউকে), পিএইচডি বক্ষব্যাধি, ফেলো বিশ্বস্বাস্থ্য সংস্থা(ইন্দোনেশিয়া) সহকারী অধ্যাপক ও বিভাগীয় প্রধান রেসপিরেটরী মেডিসিন ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ বিকাল ৩.০০টা থেকে দুপুর পর্যন্ত সিরিয়ালের জন্যঃ ০১৭০৬-০১০১৪৬ ডাঃ নজামুল করিম খান এমবিবিএস,ডিইএম(বারডেম) ডায়াবেটিস,থাইরয়েড,হরমোন ও এন্ডোক্রাইন মেডিসিন বিশেষজ্ঞ সহকারী অধ্যাপক,ডায়াবেটিস ও এন্ডোক্রাইনোলজী বিভাগ ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ বিকাল ৫.০০টা থেকে রাত ৮.০০টা পর্যন্ত(বৃহস্পতিবার ও শুক্রবার বন্ধ) সিরিয়ালের জন্যঃ ০১৭২৭-৯১১৫৫৫ ডাঃ কে.বি.এম.হাদিউজ্জামান এমবিবিএস(ঢাকা),বিসিএস(স্বাস্থ্য), এমডি(নেফ্রোলজী) মেডিসিন ও কিডনী রোগ বিশেষজ্ঞ সহকারী অধ্যাপক, বঙ্গবন্ধু শেখ মুজিব মেডিকেল বিশ্ববিদ্যালয় (পিজি হাসপাতাল) (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ বিকাল ৪.০০টা থেকে রাত ৯.০০টা পর্যন্ত(শুক্রবার বন্ধ) সিরিয়ালের জন্যঃ ০১৫৫৩-৩৪১৬৬২-৬৩ ডাঃ মোঃ আমিনুল ইসলাম এমবিবিএস,ডিএমআরটি(ডিইউ), এমডি,এফএসিপি(ইউএসএ) ক্যান্সার বিশেষজ্ঞ(অনকোলজিস্ট) সহকারী অধ্যাপক,রেডিওথেরাপি বিভাগ ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ বিকাল ৩.০০টা থেকে রাত ৯.০০টা পর্যন্ত(শুক্রবার বন্ধ) সিরিয়ালের জন্যঃ ০১৭১০-৫১৬৯৭০ ডাঃ মোঃ হাবিবুর রহমান (তারেক) এমবিবিএস,ডিসিপি(প্যাথ), এফসিপিএস (হেমাটোলজী) ক্লিনিক্যাল হেমাটোলজিস্ট সহকারী অধ্যাপক,রক্তরোগ বিভাগ ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ সিরিয়ালের জন্যঃ ০১৫৫৩-৩৪১৬৬২-৬৩ ডাঃ মোঃ আয়ুব আলী এমবিবিএস(ঢাকা), ডিসিএইচ(ডিইউ) এফসিপিএস(শিশু-মেডিসিন), এমডি(নবজাতক-শিশু) নবজাতক ও শিশু বিশেষজ্ঞ সহকারী অধ্যাপক ও শিশু বিভাগ ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল (পপুলার ডায়গনস্টিক সেন্টার লিঃ) সাক্ষাতের সময়ঃ বিকাল ৩.০০টা থেকে রাত ৯.০০টা পর্যন্ত সিরিয়ালের জন্যঃ ০১৫৫৩- ৩৪১৬৬২-৬৩ ডাঃ সৌমিত্র সরকার এমবিবিএস,এমএস(নিউরোসার্জারি) বিশেষজ্ঞ নিউরোসার্জন ও স্পাইন সার্জন সহকারী অধ্যাপক,নিউরোসার্জারি বিভাগ ময়মনসিংহ মেডিকেল কলেজ ও হাসপাতাল</p>', 'ডেস্ক রিপোর্ট', 'news', 'ময়মনসিংহের,সকল-বিশেষজ্ঞ,ডাক্তারের,মোবাইল,নাম্বার,ঠিকানা', 'ময়মনসিংহের-সকল-বিশেষজ্ঞ-ডাক্তারের-মোবাইল-নাম্বার-ও-ঠিকানা', '1619373971.webp', 'Image Caption Goes Here', 0, NULL, '2021-04-26 00:06:11', '2021-04-26 00:06:11', 1),
(18, '2021-04-26', 11, 3, 12, 'ময়মনসিংহ জেলা ছাত্রলীগ নেতা সজীবের উদ্যোগে কৃষকের ধান কাটা কর্মসূচি', 'ময়মনসিংহ-জেলা-ছাত্রলীগ-নেতা-সজীবের-উদ্যোগে-কৃষকের-ধান-কাটা-কর্মসূচি', '<p>ময়মনসিংহ জেলা ছাত্রলীগ নেতা নাজমুল ইসলাম সজীব তাঁর নিজ উদ্যোগে ছাত্রলীগের নেতাকর্মীদের নিয়ে কৃষকের পাকা ধান কেটে দিলেন।&nbsp;</p>\r\n\r\n<p>স্থানীয় লোকজনরা বলেন, নাজমুল ইসলাম সজীব ও তাঁর সাথে কিছু ছাত্রলীগকর্মী কৃষক হাফিজ মিয়ার এক বিঘা জমির ধান কেটে বাড়িতে তুলে দেন। ছাত্রলীগের নেতাকর্মীদের এ ধরনের উদ্যোগকে স্বাগত জানান স্থানীয় এলাকাবাসী। তারা ছাত্রলীগের নেতাকর্মীদের প্রশংসা করেন।&nbsp;</p>\r\n\r\n<p>কৃষক হাফিজ মিয়া জানান, &quot;লকডাউনের মধ্যে ধান কাটার উপযুক্ত সময় হওয়া সত্ত্বেও অর্থ ও শ্রমিক সংকটের কারণে পাকা ধান কাটতে পারছিলাম না। ফলে ক্ষেতে ধান পাকার পরও তা কাটতে না পারায় কিছুটা ক্ষতির শঙ্কায় ছিলাম। আমার এমন অসহায়ত্বের কথা শুনে ছাত্রলীগ নেতা নাজমুল ইসলাম সজীব আরও কয়েকজন নেতাকর্মীকে সঙ্গে নিয়ে এসে টাকা-পয়সা ছাড়াই আমার এক বিঘা ক্ষেতের ধান কেটে দেন। আমি তাদের প্রতি খুব কৃতজ্ঞ।&quot;</p>\r\n\r\n<p>ময়মনসিংহ জেলা ছাত্রলীগ নেতা নাজমুল ইসলাম সজীব বলেন, &quot;বাংলাদেশ ছাত্রলীগের সংগ্রামী সভাপতি, প্রিয় নেতা আল নাহিয়ান খান জয় ভাই ও বাংলাদেশ ছাত্রলীগের বিপ্লবী সাধারণ সম্পাদক লেখক ভট্টাচার্য দাদার নির্দেশনায় ও আমাদের প্রিয় নেতা ময়মনসিংহ মহানগর আওয়ামী লীগের সংগ্রামী সাধারণ সম্পাদক জননেতা মোহিত উর রহমান শান্ত ভাইয়ের অনুপ্রেরণায় অসহায় ও দরিদ্র কৃষকদের ধান কেটে দেওয়ার সিদ্ধান্ত নেই। কৃষক হাফিজ চাচা এক বিঘা জমির পাকা ধান কাটতে না পেরে বিপাকে পড়েন। তাঁর অসহায়ত্বের কথা শুনে ছাত্রলীগের নেতাকর্মীদের সঙ্গে নিয়ে তাঁর ধান কেটে দিয়েছি। এরকম আরো কোন কৃষক ভাই যদি বিপদে পড়ে থাকেন তবে আমরা অবশ্যই স্বেচ্ছাশ্রম দিয়ে তাঁর পাশে দাঁড়াবার চেষ্টা করবো।&quot;</p>', 'প্রতিনিধিঃ', 'video', 'ছাত্রলীগ, ধানকাটা, ময়মনসিংহ,', 'ধান কাটছে ছাত্রলীগ নেতা', '1619446130.webp', 'ধান কাটছে ছাত্রলীগ নেতা', 0, 'nnn', '2021-04-26 20:08:50', '2021-04-26 20:08:50', 1),
(19, '2021-04-26', 18, 18, 12, 'সন্তানের বয়স ১৩ থেকে ১৯ হলে যে ধরনের কথা বলা ঠিক নয়', 'সন্তানের-বয়স-১৩-থেকে-১৯-হলে-যে-ধরনের-কথা-বলা-ঠিক-নয়', '<p><strong>সন্তানকে যে ধরনের কথা বলা ঠিক</strong> নয়</p>\r\n\r\n<p>সন্তানের বয়স ১৩ থেকে ১৯ হলে অন্যের সঙ্গে তুলনা করা থেকে বিরত থাকতে হবে।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>কারণ কৈশোরে ছেলেমেয়েরা অনেক বেশি আবেগপ্রবণ হয়। এই সময়ে তাদের মাঝে নানান শারীরিক ও মানসিক পরিবর্তন দেখা দেয়।</p>\r\n\r\n<p>তাই তাদের সঙ্গে কথা বলতে ও আচরণে সাবধানতা অবলম্বন করা প্রয়োজন।</p>\r\n\r\n<p>মানসিক স্বাস্থ্য-বিষয়ক একটি ওয়েবসাইটে প্রকাশিত প্রতিবেদন অবলম্বনে কৈশোরে সন্তানদের সঙ্গে কী ধরনের আচরণ করা ঠিক না, সে সম্পর্কে ধারণা দেওয়া হল।</p>\r\n\r\n<p>&lsquo;তোমার ভাই/বোন তোমার চেয়ে ভালো&rsquo;</p>\r\n\r\n<p>সন্তানকে কখনই তার ভাই বা বোনের সঙ্গে তুলনা করে ছোট করা যাবে না। মনে রাখতে হবে, প্রত্যেক শিশুরই আলাদা কিছু বৈশিষ্ট ও গুণ আছে। তাই একজনের সঙ্গে অন্যজনের তুলনা করে কথা বললে শিশুকে ভালো পথে না এনে বরং তার আত্মবিশ্বাসকে দুর্বল করে দিবে।</p>\r\n\r\n<p>&lsquo;এটা করো না ওটা করো না&rsquo;</p>\r\n\r\n<p>কৈশোরে ছেলে মেয়েরা অন্যের আদেশ অনুযায়ী কাজ করতে বা চলতে চায় না। তাই, তাদের কাজকর্মের ওপর বিধি নিষেধ না টেনে বরং কোন কাজ কেনো করা ঠিক না সে সম্পর্কে বুঝিয়ে বলতে হবে। এছাড়া কিছু ক্ষেত্রে তাদেরকে ঝুঁকি গ্রহণ করতে দিন, এতে অভিজ্ঞতার পাল্লা ভারী হবে।</p>\r\n\r\n<p>&lsquo;তোমার ব্যক্তিগত কোন কিছু পরিবার থেকে আলাদা নয়&rsquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>শৈশব ও কৈশোরে ছেলেমেয়েদের নিজস্ব ব্যক্তিগত বিষয় থাকতে পারে। তাই তাদের সব ব্যক্তিগত বিষয় নিয়ে প্রশ্ন না তুলে বরং তাদের স্বাধীনতার জন্য জায়গা উন্মুক্ত রাখুন।</p>\r\n\r\n<p>পোশাক নিয়ে নিষেধাজ্ঞা</p>\r\n\r\n<p>কৈশোরে ছেলে মেয়েরা অন্যের মাধ্যমে অনেক বেশি প্রভাবিত হয়। এই সময়ে তাদের নিজেদের কিছু মতামত থাকে। তাই পোশাক সম্পর্কে নিজের পছন্দ তাদের ওপর চাপিয়ে দেওয়া ঠিক না, বিশেষত মেয়েদের ওপরে।</p>\r\n\r\n<p>এছাড়াও, পোশাক নির্বাচন করতে গিয়ে ছেলে মেয়েদের মাঝে লিঙ্গ বৈষম্য তৈরি করা ঠিক নয়।</p>\r\n\r\n<p>&lsquo;তুমি খুব বেশি ছোট&rsquo;</p>\r\n\r\n<p>সন্তান যতই ছোট হোক না কেনো, মনে রাখতে হবে সে বড় হচ্ছে। তাই তার পছন্দকে সম্মান করা প্রয়োজন। ক্ষেত্রে বিশেষে তার সিদ্ধান্ত তাকে গ্রহণ করতে দিন; ছোট বলে তাকে অবহেলা করা যাবে না।</p>\r\n\r\n<p>&lsquo;বড় ছেলে-মেয়েরা কাঁদে না&rsquo;</p>\r\n\r\n<p>যে কেউই ভয় পেতে পারে বা আবেগপ্রবণ হয়ে পড়তে পারে। কৈশোরে ছেলে-মেয়েদের মধ্যে এই প্রবণতা বাড়ে। কোনো কারণে কান্না করলে তাদের আবেগ অবদমন করতে না বলে বরং মানসিকভাবে পাশে থাকার চেষ্টা করতে হবে।</p>', 'ডেস্ক রিপোর্ট', 'video', 'সন্তান,শিশু,বড়,কথা,', 'সন্তানের সাথে কথা গুলো বলা যাবে না', '1619447791.webp', 'ছবিঃরয়টার্স', 0, 'nnn', '2021-04-26 20:36:31', '2021-04-26 20:36:31', 1),
(20, '2021-04-26', 5, 8, 12, 'ভারতে অক্সিজেনের সংকট যে কারণে', 'ভারতে-অক্সিজেনের-সংকট-যে-কারণে-', '<p>করোনাভাইরাস মহামারির মধ্যে ভারতে অক্সিজেনের অভাব প্রকট রূপ নিয়েছে। বিভিন্ন রাজ্যের হাসপাতালগুলোয় পাওয়া যাচ্ছে না অক্সিজেনের পর্যাপ্ত সরবরাহ। সাত মাস আগে ঠিক একই ধরনের সংকটে পড়েছিল ভারত। কিন্তু বারবার একই সমস্যায় কেন পড়ছে দেশটি?</p>\r\n\r\n<p>ভারতে কয়েক দিন ধরে প্রতিদিনই করোনাভাইরাসে এক দিনে মৃত্যু ও সংক্রমণে রেকর্ড হচ্ছে। দেশটিতে গত ২৪ ঘণ্টায় সর্বোচ্চ ২ হাজার ৬২৪ জনের মৃত্যু হয়েছে। ভারতের কেন্দ্রীয় স্বাস্থ্য মন্ত্রণালয় সূত্রে এ খবর জানা গেছে। এনডিটিভির খবরে জানা যায়, গত ২৪ ঘণ্টায় করোনায় সংক্রমিত হয়েছে ৩ লাখ ৪৬ হাজার জন। এর আগের ২৪ ঘণ্টার তুলনায় সংক্রমণ ও মৃত্যু দুই-ই বেড়েছে। এদিকে দিল্লিতেও করোনাভাইরাসে এক দিনে সর্বোচ্চ মৃত্যুর ঘটনা ঘটেছে। সেখানে গতকাল শুক্রবার ৩৪৮ জনের মৃত্যু হয়েছে।</p>\r\n\r\n<p>ব্রিটিশ সংবাদমাধ্যম বিবিসির খবরে বলা হয়েছে, সাধারণত ভারতে স্বাস্থ্য খাতে অক্সিজেনের মোট সরবরাহের ১৫ শতাংশ ব্যয় হয়। বাকিটা শিল্প খাতে ব্যবহৃত হয়ে থাকে। কিন্তু করোনার এই দ্বিতীয় ঢেউয়ে দেশটির মোট অক্সিজেন সরবরাহের ৯০ শতাংশই স্বাস্থ্য খাতে দিতে হচ্ছে। প্রতিদিন এ খাতে সাড়ে ৭ হাজার মেট্রিক টন অক্সিজেন খরচ হচ্ছে বলে নিশ্চিত করেছেন দেশটির জ্যেষ্ঠ স্বাস্থ্য কর্মকর্তা রাজেশ ভূষণ। গত বছরের সেপ্টেম্বরের চাহিদার তুলনায় এটি তিন গুণ বেশি।</p>\r\n\r\n<p>পুনেতে একটি কোভিড-১৯ হাসপাতাল পরিচালনা করেন চিকিৎসক সিদ্ধেশ্বর শিন্ডে। তিনি বলেন, &lsquo;পরিস্থিতি এতটাই খারাপ যে আইসিইউ বেড না পাওয়ায় কিছু রোগীকে বিশেষ অ্যাম্বুলেন্সে রেখে চিকিৎসা দিতে হচ্ছে।&rsquo; সিদ্ধেশ্বর শিন্ডে বলেন, &lsquo;সাধারণত আমাদের হাসপাতালে অক্সিজেনের যথেষ্ট সরবরাহ থাকে। কিন্তু এখন অক্সিজেন প্রয়োজন&mdash;এমন রোগীর সংখ্যা বেড়ে গেছে। ২২ বছর বয়সী তরুণেরও এখন অক্সিজেন লাগছে।&rsquo;</p>\r\n\r\n<p>অক্সিজেনের সংকটে ভারতের হাসপাতালগুলোয় রোগীদের মৃত্যুও বেড়ে চলেছে। যেমন গতকাল দিল্লির স্যার গঙ্গারাম হাসপাতালে চিকিৎসাধীন ২৫ জন করোনা রোগী মারা গেছেন। অক্সিজেন সরবরাহ কম থাকায় তাঁদের মৃত্যু হয়েছে বলে হাসপাতাল কর্তৃপক্ষ জানিয়েছে। দেশটির কেন্দ্রীয় সরকার অবশ্য অক্সিজেনের সংকট মোকাবিলায় চেষ্টা চালাচ্ছে। জার্মানি থেকে জরুরি ভিত্তিতে অক্সিজেন তৈরির ২৩টি প্ল্যান্ট আনছে কেন্দ্রীয় সরকার।</p>', 'ডেস্ক রিপোর্ট', 'video', 'ভারত,করোনা,সংকট,অক্সিজেন,', 'ভারতে অক্সিজেন সংকট', '1619448168.webp', 'ভারতে অক্সিজেন সংকট যে কারণে', 0, 'nnn', '2021-04-26 20:42:48', '2021-04-26 20:42:48', 1),
(21, '2021-04-26', 7, 9, 10, 'ক্যানসার আক্রান্ত সাবেক ফুটবলার প্রধানমন্ত্রীর সাহায্য চান', 'ক্যানসার-আক্রান্ত-সাবেক-ফুটবলার-প্রধানমন্ত্রীর-সাহায্য-চান', '<p>একই সঙ্গে জাতীয় দলের অধিনায়ক ও জাতীয় দলের কোচ হওয়ার গৌরব যে হাতে গোনা কয়জন ফুটবলারের আছে, তাঁদের মধ্যে অন্যতম শহীদ উদ্দিন (সেলিম)। ইতিহাসে একবারই এশিয়ান কাপ ফুটবলে খেলেছে বাংলাদেশ। ১৯৮০ সালে কুয়েতে অনুষ্ঠিত সে টুর্নামেন্টে বাংলাদেশ দলের অধিনায়ক ছিলেন তিনি। ১৯৮৪ সালে খেলা থেকে অবসর নিয়ে কোচ হিসেবেও নিজেকে বসিয়েছিলেন সেরাদের আসনে। ১৯৯১</p>\r\n\r\n<p>সাফ গেমস ফুটবলে ছিলেন বাংলাদেশ দলের কোচ।</p>\r\n\r\n<p>ফুটবল মাঠের সেই লড়াকু ডিফেন্ডার এখন লড়াই করছেন ক্যানসারের সঙ্গে। দাঁতের মাড়িতে ক্যানসার ধরা পড়েছে তাঁর। গত শনিবার ঢাকার একটি হাসপাতালে অস্ত্রোপচার হয়েছে ৬৭ বছর বয়সী সাবেক ফুটবলারের। অস্ত্রোপচারের খরচসহ পরবর্তী চিকিৎসা চালিয়ে নিতে প্রায় ২৫ লাখ টাকার প্রয়োজন। এত টাকার সংস্থান করা কঠিন বলে সেলিমের চিকিৎসার জন্য প্রধানমন্ত্রীর দৃষ্টি আকর্ষণ করেছে তাঁর পরিবার। সেলিমের জ্যেষ্ঠ পুত্র সাকিব আহমেদ বলেন, &lsquo;বাবার প্রথম অপারেশনে প্রায় ১৫ লাখ টাকা খরচ হয়েছে। পরবর্তী চিকিৎসা দীর্ঘমেয়াদি। সব মিলিয়ে প্রায় ২৫ লাখ টাকার মতো ব্যয় হবে। বাবা যেহেতু জাতীয় ফুটবল দলের অধিনায়ক ছিলেন, তাঁর চিকিৎসার জন্য মাননীয় প্রধানমন্ত্রীর সহযোগিতা কামনা করছি।&rsquo;</p>', 'ডেস্ক রিপোর্ট', 'news', 'সাবেক,ফুটবলার,ক্যান্সার,অনুদান,', 'প্রাধানমন্ত্রীর সাহায্য চান সাবেক ফুটবলার শহিদ উদ্দিন', '1619449823.webp', 'ছবিঃশহিদ উদ্দিন', 0, '', '2021-04-26 21:10:23', '2021-04-29 02:46:02', 1),
(22, '2021-04-26', 8, 22, 12, 'যে গল্প জানার পর তাহসানের সংসারে জটিলতা!', 'যে-গল্প-জানার-পর-তাহসানের-সংসারে-জটিলতা!', '<p>টিভি পর্দায় গায়ক তাহসান খানের এখন দেখা মেলে বিশেষ দিবসে। আসছে বৈশাখেও সেই নিয়মের ব্যত্যয় ঘটছে না। &lsquo;টোনাটুনির ভালবাসা&rsquo; শিরোনামের একটি একক নাটকে দেখা মিলবে তাঁর।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>নাট্যনির্মাতা সাগর জাহানের রচনা ও পরিচালনায় এ নাটকে তাহসানের বিপরীতে দেখা যাবে তানজিন তিশাকে।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>নাটকের গল্পে দেখা যাবে, আবির (তাহসান) পায়ে ফ্র্যাকচার নিয়ে ঘরে বসা প্রায় তিন মাস। কুয়াশা (তানজিন তিশা) কোনোভাবেই ডাক্তারের কথামতো তিন মাস রেস্ট ছাড়া আবিরকে ছাড়বে না। সেজন্য একটা গেম খেলে আবিরকে ব্যস্ত থাকার ব্যবস্থা করে কুয়াশা। গেমটা একজন আরেকজনকে এমন প্রশ্ন করবে, যেটা আবির-কুয়াশার অজানা। সেই না জানা উত্তর জানতে গিয়ে তাদের ব্যক্তিগত জীবনের জটিল বিষয় বের হয়ে আসে। সেখানে কুয়াশার কিশোরী বয়সের প্রেমের গল্প তাঁদের সম্পর্কে কাল হয়ে দাঁড়ায়। বাকি গল্প জানতে চোখ রাখতে হবে নাটকে।</p>\r\n\r\n<p>এক সংবাদ বিজ্ঞপ্তিতে জানা গেছে, নাটকটি ১৪ এপ্রিল বুধবার বাংলা নববর্ষ উপলক্ষে আরটিভিতে রাত ১০টায় প্রচার হবে।</p>\r\n\r\n<p>&nbsp;</p>', 'ডেস্ক রিপোর্ট', 'video', 'সংসার,তাহসান,ভাঙ্গছে', 'যে কারণে সংসার ভাঙ্গছে', '1619450909.webp', 'যে কারণে সংসার ভাঙ্গছে', 0, 'nnn', '2021-04-26 21:28:29', '2021-04-26 21:28:29', 1),
(23, '2021-04-29', 21, 20, 12, 'ক্লান্তিঃআফসানা মিম', 'ক্লান্তিঃআফসানা-মিম', '<p>~<strong>আফসানা মীম</strong></p>\r\n\r\n<p><strong>হয় কি এমন ক্লান্তি ভীষণ?<br />\r\nশরীর নুয়ে ঘেমেই মেখে!<br />\r\nপথটা যেমন বেড়েই চলে<br />\r\nঘাস ফুলেরাও কথা বলে।</strong></p>\r\n\r\n<p><strong>গ্রীষ্ম কেবল জেগেই উঠে<br />\r\nছায়ার খুঁজে রাস্তা মাঠে,<br />\r\nপা থেমে যায় দিঘল দেখে&nbsp;<br />\r\nঅস্থিরতায় দুপুর সেজে।</strong></p>\r\n\r\n<p><strong>দম যে ভীষণ হয় যে ভারী<br />\r\nবাদলা দিনে মিলবে আড়ি,<br />\r\nচোখের পলক ধীর গতি<br />\r\nদৃষ্টি যেন ধূসর জ্যোতি।&nbsp;</strong></p>\r\n\r\n<p><strong>ভুল যে হবে তুচ্ছ আজ<br />\r\nহঠাৎ নেমেই মেঘের বাজ্ব,<br />\r\nএইতো বুঝি আসর শান্তি&nbsp;<br />\r\nসব-ই আসল দেহের ক্লান্তি।&nbsp;</strong></p>', 'ডেস্ক রিপোর্ট', 'news', 'ক্লান্ত,ক্লান্তি,গানি,', 'শরীরের ক্লান্তি, ক্লান্ত জীবন', '1619717531.webp', 'ছবি আফসানা মিম', 0, '', '2021-04-29 23:32:11', '2021-04-29 23:36:13', 1),
(24, '2021-04-29', 11, 3, 12, 'ময়মনসিংহ জেলা ছাত্রলীগ নেতা শাওনের উদ্যোগে অসহায় কৃষকের ধান কাটা কর্মসূচি', 'ময়মনসিংহ-জেলা-ছাত্রলীগ-নেতা-শাওনের-উদ্যোগে-অসহায়-কৃষকের-ধান-কাটা-কর্মসূচি', '<p>ময়মনসিংহে সময়ে অসময়ে বৈশাখী ঝড়ে হেলে পড়েছে কৃষকের আবাদকৃত ধান। এতে জমির ধান নিয়ে দুঃচিন্তায় বেশির ভাগ কৃষক। এমনই একজন কৃষক আবুল হাসেম মিয়া। করোনায় শ্রমিক সংকট আর অর্থাভাবে পাকা ধান কাটা এবং সেগুলো ঘরে তোলা নিয়ে দিশেহারা এই কৃষকের পাশে দাঁড়িয়েছেন ময়মনসিংহ জেলা ছাত্রলীগ নেতা ও আনন্দ মোহন কলেজ ছাত্রলীগের সদ্য সাবেক যুগ্ম আহ্বায়ক এস এম নাফিদুল জান্নাত শাওন।</p>\r\n\r\n<p>তার উদ্যোগে ময়মনসিংহ নগরীর ৩১ নং ওয়ার্ড, কল্পা বিশ্ব রোড় সংলগ্ন এলাকায় আবুল হাসেম নামক এক অসহায় কৃষকের ধান ক্ষেতের প্রায় ৫০ শতাংশ জমির পাঁকা ধান কেটে ঘরে তুলে দেন ছাত্রলীগ নেতাকর্মীরা।&nbsp;</p>\r\n\r\n<p>অসহায় কৃষকের দু্ঃখে ব্যথিত হয়ে ধান কাটাকালীন সময়ে শাওন জানান,বাংলাদেশ ছাত্রলীগ এদেশের মানুষের প্রয়োজনে জন্ম নেওয়া একটি ছাত্র সংগঠন।দেশের মা মাটি মানুষের দুর্যোগে দুর্ভোগে কাজ করার আদর্শিক ইচ্ছায় তেজোদৃপ্ত সংগঠন বাংলাদেশ ছাত্রলীগ।বাংলাদেশ সরকারের মাননীয় প্রধানমন্ত্রী দেশরত্ন শেখ হাসিনার নির্দেশে বাংলাদেশ ছাত্রলীগ কেন্দ্রীয় কার্যনির্বাহী সংসদের বিভিন্ন কর্মসূচীর অংশ হিসেবে ময়মনসিংহ মহানগর আওয়ামী লীগের সুযোগ্য সাধারণ সম্পাদক মোহিত উর রহমান শান্তর সার্বিক তত্ত্বাবধানে ময়মনসিংহ জেলা ছাত্রলীগ অসহায় দরিদ্র কৃষকের ধান কাটার কর্মসূচি &nbsp;হাতে নেয়।কৃষকের ধান ঘরে না পৌছাঁনো পর্যন্ত দেশরত্ন শেখ হাসিনার নির্দেশে এভাবেই ছাত্রলীগ মাঠে থাকবে বলে জানিয়েছেন তিনি।</p>\r\n\r\n<p>তারা সকাল থেকে বিকাল পর্যন্ত দল বেঁধে সামাজিক দূরত্ব ও স্বাস্থ্যবিধি মেনে ধান কাটেন। পরে জমি থেকে ধান নিয়ে ওই কৃষকের ধানের গোলায় রেখে আসেন। মহামারী করোনাকালে ছাত্রলীগের নেতা-কর্মীদের এমন সহযোগীতায় সন্তোষ প্রকাশ করেন কৃষক আবুল হাসেম &nbsp;মিয়া। দেশের প্রধানমন্ত্রী শেখ হাসিনার নির্দেশনায় অসহায় কৃষকের পাশে এগিয়ে আসা ছাত্রলীগের নেতা-কর্মীদের প্রতি তিনি কৃতজ্ঞতা জানান।</p>', 'নিজস্ব প্রতিনিধিঃ', 'video', 'ছাত্রলীগ, ময়মনসিংহ, ধানকাটা,', 'অসহায় কৃষকের ধান কেটে দিল ছাত্রলীগ নেতা শাওন', '1619718214.webp', 'অসহায় কৃষকের ধান কেটে দিচ্ছে ছাত্রলীগ নেতা শাওন', 0, 'nnn', '2021-04-29 23:43:34', '2021-04-29 23:43:34', 1),
(25, '2021-04-29', 15, 14, 12, 'ভাড়া বিমানে দেশ ছেড়েছেন বসুন্ধরার এমডির স্ত্রী–সন্তান', 'ভাড়া-বিমানে-দেশ-ছেড়েছেন-বসুন্ধরার-এমডির-স্ত্রী–সন্তান', '<p>মোসারাত জাহান (মুনিয়া) কে আত্মহত্যায় প্ররোচনা মামলার একমাত্র আসামি সায়েম সোবহান আনভীরের স্ত্রী-সন্তান ও পরিবারের কয়েক সদস্য দেশ ছেড়েছেন। আনভীরের বিরুদ্ধে মামলা হওয়ার তিন দিনের মাথায় তাঁরা দেশ ছাড়লেন।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>আজ বৃহস্পতিবার রাতে বেসামরিক বিমান চলাচল কর্তৃপক্ষ ও অভিবাসন পুলিশের একটি সূত্র প্রথম আলোকে এ তথ্যের সত্যতা নিশ্চিত করেছে।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>বেসামরিক বিমান চলাচল কর্তৃপক্ষের (বেবিচক) চেয়ারম্যান এয়ার ভাইস মার্শাল মফিদুর রহমান প্রথম আলোকে বলেন, বুধবার তাঁরা একটি বিশেষ ফ্লাইটের অনুমতি নিয়েছেন। আজ তাঁদের দেশ ছাড়ার কথা।&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>জানা গেছে, ফ্লাইটটি ঢাকার হজরত শাহজালাল আন্তর্জাতিক বিমানবন্দর থেকে বিকেলে রওনা দেয়। এটির গন্তব্য দুবাইয়ের আল মাকতুম আন্তর্জাতিক বিমানবন্দর।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>চার্টার্ড ফ্লাইটের (ভাড়া করা বিমান) সদস্য ছিলেন আটজন। যাত্রী তালিকা অনুযায়ী দেশ ছেড়েছেন সায়েম সোবহান আনভীরের স্ত্রী সাবরিনা সোবহান, তাঁদের দুই সন্তান (অপ্রাপ্তবয়স্ক বলে নাম লেখা হলো না), ছোট ভাই সাফওয়ান সোবহানের স্ত্রী ইয়াশা সোবহান এবং তাঁদের মেয়ে ও দুই পরিবারের তিনজন গৃহকর্মী ডায়ানা হার্নানডেজ চাকানান্দো, মোহাম্মদ কাদের মীর ও হোসনে আরা খাতুন। এর আগে সায়েম সোবহান আনভীরের ছোট ভাই সাফওয়ান সোবহানও দেশ ছাড়েন।</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>গত ২৬ এপ্রিল মামলা হওয়ার পর গত ২৭ এপ্রিল পুলিশের আবেদনের পরিপ্রেক্ষিতে সায়েম সোবহান আনভীরের বিদেশ যাত্রায় নিষেধাজ্ঞা আরোপ করেন আদালত। যদিও আনভীর দেশ ছেড়েছেন এমন প্রচার আছে। গতকাল বৃহস্পতিবার গুলশান বিভাগের উপকমিশনার সুদীপ কুমার চক্রবর্তী সাংবাদিকদের জানান, অভিবাসন কর্তৃপক্ষের ডেটা বেজের তথ্য অনুযায়ী সায়েম সোবহান আনভীর দেশেই আছেন। তিনি দুটি পাসপোর্ট ব্যবহার করেন। কোনোটি ব্যবহার করেই দেশত্যাগের কোনো তথ্য নেই।</p>\r\n\r\n<p>সূত্রঃপ্রথম আলো</p>', 'ডেস্ক রিপোর্ট', 'news', 'বসুন্ধরা,মুনিয়া,ধর্ষণ,হত্যা,মামলা,বিদেশ,ইন্টারমিডিয়েট,সৌন্দর্য', 'মোসারাত জাহান (মুনিয়া) কে আত্মহত্যায় প্ররোচনা মামলার একমাত্র আসামি সায়েম সোবহান আনভীরের স্ত্রী-সন্তান ও পরিবারের কয়েক সদস্য দেশ ছেড়েছেন।', '1619719179.webp', 'প্রতীকী ছবি', 0, NULL, '2021-04-29 23:59:39', '2021-04-29 23:59:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `our_courses`
--

CREATE TABLE `our_courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `uploader_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `image_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `our_courses`
--

INSERT INTO `our_courses` (`id`, `uploader_id`, `name`, `slug`, `detail`, `meta_description`, `status`, `created_at`, `updated_at`, `image_name`) VALUES
(1, 10, 'Hifdhul Quran Course', 'hifdhul-quran-course', '<p><strong>Lorem ipsum</strong> dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, <img alt=\"https://discussion.qodeinteractive.com/wp-content/uploads/2016/02/post-single-img-1.jpg\" src=\"https://discussion.qodeinteractive.com/wp-content/uploads/2016/02/post-single-img-1.jpg\" style=\"float:left; height:203px; width:300px\" />eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error,</p>\r\n\r\n<p>harum nesciunt ipsum debitis quas aliquid. Reprehenderit, quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam recusandae alias error harum maxime adipisci amet laborum. Perspiciatis minima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit quibusdam sed amet tempora.</p>\r\n\r\n<p>Sit laborum ab, eius fugit doloribus tenetur fugiat, temporibus enim commodi iusto libero magni deleniti quod quam consequuntur! Commodi minima excepturi repudiandae velit hic maxime doloremque. Quaerat provident commodi consectetur veniam similique ad earum omnis ipsum saepe, voluptas,</p>\r\n\r\n<blockquote>\r\n<p>hic voluptates pariatur est explicabo fugiat, dolorum eligendi quam cupiditate excepturi mollitia maiores labore suscipit quas? Nulla, placeat. Voluptatem quaerat non architecto ab laudantium modi minima sunt esse temporibus sint culpa, recusandae aliquam numquam totam ratione voluptas quod exercitationem fuga. Possimus quis earum veniam quasi aliquam eligendi, placeat qui corporis!</p>\r\n</blockquote>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n	<li>Nulla molestie nunc sed rutrum pharetra.</li>\r\n	<li>Integer porttitor erat vel cursus bibendum.</li>\r\n	<li>Donec nec mauris eget augue malesuada vulputate.</li>\r\n	<li>Phasellus tempus leo ac facilisis hendrerit.</li>\r\n	<li>Suspendisse congue magna eget est sollicitudin, non lobortis elit ultrices.</li>\r\n	<li>Aenean eu mauris vitae ante lacinia hendrerit nec at sapien.</li>\r\n	<li>In gravida ex ut luctus tempus.</li>\r\n	<li>Suspendisse auctor nunc quis sapien blandit egestas.</li>\r\n</ul>', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem.', 1, '2021-05-06', '2021-05-06', '1620029542.webp'),
(2, 10, 'Islamic Foundation', 'islamic-foundation', '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem.', 1, '2021-05-05', '2021-05-05', '1620029768.webp'),
(3, 10, 'Alim Course', 'alim-course', '<h2>Where can I get some?</h2>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem.', 1, '2021-05-05', '2021-05-05', '1620029892.webp'),
(4, 10, 'ROBERT L. LEIST', 'robert-l.-leist', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem.', 1, '2021-05-05', '2021-05-05', '1620029987.webp'),
(5, 10, 'Quran Reading', 'quran-reading', '<h1>Lorem Ipsum</h1>\r\n\r\n<p>&quot;Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...&quot;</p>\r\n\r\n<p>&quot;There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...&quot;</p>\r\n\r\n<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>&nbsp;</p>', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem.', 1, '2021-05-05', '2021-05-05', '1620030096.webp'),
(6, 10, 'Arabic Language', 'arabic-language', '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,\r\nmolestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum\r\nnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium\r\noptio, eaque rerum! Provident similique accusantium nemo autem.', 1, '2021-05-05', '2021-05-05', '1620030158.webp');

-- --------------------------------------------------------

--
-- Table structure for table `our_teams`
--

CREATE TABLE `our_teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `uploader_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_info` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `image_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `our_teams`
--

INSERT INTO `our_teams` (`id`, `uploader_id`, `name`, `slug`, `designation`, `detail`, `social_info`, `status`, `created_at`, `updated_at`, `image_name`) VALUES
(1, 10, 'Muhibbullah Ansary', 'muhibbullah-ansary', 'Teacher', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '{\"ion_social_facebook\":{\"icon\":\"ion-social-facebook\",\"link\":\"https:\\/\\/www.facebook.com\\/muhib116\"},\"ion_social_twitter\":{\"icon\":\"ion-social-twitter\",\"link\":\"https:\\/\\/twitter.com\\/muhib116\"},\"ion_social_linkedin\":{\"icon\":\"ion-social-linkedin\",\"link\":\"https:\\/\\/www.linkedin.com\\/in\\/muhibbullah-ansary-830110147\\/\"},\"ion_social_instagram\":{\"icon\":\"ion-social-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/muhibbullah611\"}}', 1, '2021-05-04', '2021-05-04', '1620081994.webp'),
(2, 10, 'MARC J.ALVARADO', 'marc-j.alvarado', 'Teacher', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '{\"ion_social_facebook\":{\"icon\":\"ion-social-facebook\",\"link\":\"https:\\/\\/www.facebook.com\\/muhib116\"},\"ion_social_twitter\":{\"icon\":\"ion-social-twitter\",\"link\":\"https:\\/\\/twitter.com\\/muhib116\"},\"ion_social_linkedin\":{\"icon\":\"ion-social-linkedin\",\"link\":\"https:\\/\\/www.linkedin.com\\/in\\/muhibbullah-ansary-830110147\\/\"},\"ion_social_instagram\":{\"icon\":\"ion-social-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/muhibbullah611\"}}', 1, '2021-05-04', '2021-05-04', '1620082111.webp'),
(4, 10, 'ROBERT L. LEIST', 'robert-l.-leist', 'Teacher', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '{\"ion_social_facebook\":{\"icon\":\"ion-social-facebook\",\"link\":\"https:\\/\\/www.facebook.com\\/muhib116\"},\"ion_social_linkedin\":{\"icon\":\"ion-social-linkedin\",\"link\":\"https:\\/\\/www.linkedin.com\\/in\\/muhibbullah-ansary-830110147\\/\"},\"ion_social_instagram\":{\"icon\":\"ion-social-instagram\",\"link\":\"https:\\/\\/www.instagram.com\\/muhibbullah611\"}}', 1, '2021-05-04', '2021-05-04', '1620081871.webp'),
(3, 10, 'TIMOTHY D. JUAREZ', 'timothy-d.-juarez', 'Teacher', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '[]', 1, '2021-05-04', '2021-05-04', '1620082159.webp');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `page`, `meta_description`, `uploader_id`, `status`) VALUES
(2, 'Privacy and Policy', 'privacy-and-policy', '<p><strong>What is Lorem Ipsum?</strong></p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Why do we use it?</strong></p>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p><strong>Where does it come from?</strong></p>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n\r\n<p><strong>Where can I get some?</strong></p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'What is Lorem Ipsum?\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 10, 1),
(3, 'Terms and Conditions', 'terms-and-conditions', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare libero id magna fermentum, sit amet commodo massa lobortis. Vestibulum sed nulla sem. Proin et vestibulum libero, in gravida nulla. Proin a orci sit amet augue dictum luctus. Nulla semper ex quis augue interdum feugiat. Sed sed ex vitae ipsum auctor euismod. Duis eget volutpat purus. Donec fringilla, ligula in porttitor efficitur, nisi mauris aliquam metus, nec ornare felis massa id dolor. Quisque sed erat nunc. Suspendisse fermentum velit tellus, ac congue mauris malesuada eget. Sed interdum erat ut nisi lobortis, a condimentum magna maximus. Phasellus sed turpis arcu. Donec bibendum eget ante quis dictum.</p>\r\n\r\n<p>Aliquam sit amet laoreet quam, quis euismod purus. Maecenas ac eros nec enim fermentum congue. Donec dapibus dictum aliquet. Quisque at venenatis ex. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut ac purus sed dui varius hendrerit sed et tortor. Aenean porttitor ligula dolor, in egestas lectus mollis vel. Fusce venenatis erat vel bibendum condimentum. Cras sit amet nisi eu est gravida tempor vel et risus. Aliquam nec eros vitae ex sagittis ullamcorper sed at nisi. Duis vehicula ligula lectus, nec imperdiet mauris vestibulum non. Ut ante justo, semper sit amet massa non, egestas placerat velit. Nam sit amet ante metus. Donec ut ultricies tellus. Morbi at sapien sit amet magna auctor porttitor. Duis nec placerat augue.</p>\r\n\r\n<p>Mauris non turpis sit amet eros tincidunt luctus id id nulla. Nullam sed condimentum erat. Integer sed urna vitae ipsum elementum dignissim. In vestibulum enim fermentum nibh vulputate dictum quis et lacus. Nulla ut dolor et sapien gravida elementum. Suspendisse vitae ipsum non enim volutpat mollis vitae non mauris. Donec orci lorem, facilisis vel ornare vel, vestibulum ac leo. Nullam non metus libero. Fusce nulla lacus, convallis venenatis consequat in, pulvinar sit amet eros. Ut eget lobortis erat. Pellentesque in tortor sit amet nulla aliquam euismod sed eu dui. Sed semper sapien ac leo tempus, sit amet accumsan erat maximus.</p>\r\n\r\n<p>Mauris quis augue mauris. Aliquam vel ipsum congue nisi ultricies iaculis non id libero. Nam tincidunt convallis est eget tempor. Pellentesque rutrum, velit finibus ullamcorper sagittis, eros arcu fringilla velit, sit amet commodo dolor justo id justo. Pellentesque ornare interdum nunc quis ornare. Suspendisse potenti. Quisque rhoncus rutrum sapien eu tempor. Nullam faucibus velit non nulla semper hendrerit. Praesent pellentesque mollis nisi non commodo. Suspendisse sit amet massa luctus erat ultricies imperdiet. Vestibulum nec odio id elit tincidunt cursus id a neque. Curabitur pharetra ex in dui posuere cursus.</p>\r\n\r\n<p>Ut ornare metus a est aliquam gravida. Nam pretium pharetra libero nec blandit. Nullam congue massa ut turpis interdum mollis. Nunc ut efficitur nulla. Mauris vitae tincidunt elit, non semper mi. Fusce sagittis vitae lorem a tincidunt. Donec dapibus neque eget risus porttitor ultrices. Proin vitae facilisis erat, tempor mollis nisl. Sed non felis eu ipsum lobortis dignissim. Ut vel mauris id ante euismod sagittis. Cras turpis ante, eleifend sed risus in, malesuada tempus elit. Praesent posuere felis ut augue laoreet, sit amet tempor enim laoreet.</p>\r\n\r\n<p>Quisque scelerisque est non leo porta, vitae rhoncus mauris eleifend. Donec tellus risus, mollis ut mauris ut, fringilla dignissim eros. Curabitur vitae ante efficitur, sollicitudin elit et, dignissim massa. Praesent nibh nisl, porttitor vitae imperdiet nec, condimentum eu neque. Praesent at enim vitae nunc varius porta. Vivamus dictum tempor nisi, euismod efficitur dolor gravida ut. Phasellus posuere mollis augue placerat efficitur. Fusce diam magna, cursus non eleifend sagittis, semper eget nibh. Nulla augue nunc, bibendum sit amet ornare sit amet, aliquet faucibus est. Duis malesuada ullamcorper dictum. Integer malesuada in mi nec ornare. Praesent bibendum, sem ac iaculis maximus, risus augue finibus lorem, dictum sodales nisl diam id eros.</p>\r\n\r\n<p>In dictum venenatis mattis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque nunc neque, eleifend id vestibulum id, venenatis non libero. Fusce non efficitur ipsum. In quis mollis purus. Etiam posuere est vel massa finibus pharetra. Donec sit amet finibus quam. Integer leo elit, viverra ut ultrices et, ullamcorper in quam.</p>\r\n\r\n<p>Fusce eleifend orci lobortis mauris ultricies, ut mattis dui gravida. Etiam euismod nisl eu eros aliquam, vel euismod tortor tincidunt. Curabitur cursus molestie massa, at tincidunt turpis ultrices sed. Vestibulum a est urna. Nullam eleifend neque ac justo bibendum semper. Donec auctor finibus augue nec commodo. Sed vitae magna in nisl tempus egestas at id nunc. Nullam quis finibus nisi. Nulla facilisi. Curabitur ultricies orci sollicitudin, venenatis nunc in, aliquam nisi.</p>\r\n\r\n<p>Nam ut turpis euismod, porttitor eros sed, aliquam dui. Nunc posuere dui sit amet arcu condimentum imperdiet. Curabitur faucibus eget dolor a egestas. Ut vitae lectus eu justo mattis pharetra. Cras at lorem eu velit aliquam blandit. Donec sapien sapien, bibendum sit amet elit ornare, lobortis rutrum odio. Phasellus blandit vulputate congue. Donec pulvinar dui in augue consequat, eu facilisis risus consequat. Praesent aliquet risus vel sem pellentesque, nec pretium metus euismod. Quisque imperdiet venenatis massa. Ut quis mauris vitae orci interdum posuere ac eget nisl. Nulla eu turpis lacinia nisi molestie suscipit nec nec arcu.</p>\r\n\r\n<p>Sed nec elit ac ante cursus tincidunt. Curabitur at lectus in eros sodales euismod. Maecenas sed purus eu mauris pulvinar viverra eget a libero. Etiam venenatis blandit enim, vel maximus leo accumsan id. Suspendisse condimentum egestas leo, eget dapibus erat eleifend in. Pellentesque tempor volutpat elit, eu rutrum sem pretium nec. Duis ac est dapibus, scelerisque mauris interdum, venenatis sapien. Nulla condimentum risus placerat, scelerisque dolor a, laoreet ex. Phasellus ac magna vel lectus lacinia malesuada.</p>\r\n\r\n<p>Ut euismod pulvinar leo, vel scelerisque arcu semper nec. In euismod sem in erat consequat faucibus. Mauris non ante auctor, pharetra diam in, semper turpis. Suspendisse vitae mauris orci. Nulla arcu ipsum, egestas et ex vel, dapibus laoreet est. Nam lobortis odio sem, sit amet tempor sem consequat nec. Vestibulum sed nisi vestibulum, tincidunt libero id, molestie lacus. Donec eget rutrum tortor. Vestibulum id dui tincidunt, dapibus tellus non, porta magna. Suspendisse potenti. Nunc malesuada ante est, quis laoreet libero dapibus a. Suspendisse scelerisque blandit nisl, sed gravida sapien volutpat posuere. Nullam non libero quis neque suscipit posuere et id ex.</p>\r\n\r\n<p>Nullam convallis diam eu risus rhoncus congue. Sed sem felis, tristique in aliquam quis, tempor sit amet quam. Maecenas tempor nisi congue nunc viverra accumsan. Integer rhoncus nisi nec pulvinar blandit. In eu ante dolor. Etiam placerat tellus id enim mattis commodo. Cras at nibh dolor. Praesent viverra mi non orci congue, et egestas sem placerat. Etiam lacus justo, tristique suscipit aliquet a, convallis in libero.</p>\r\n\r\n<p>Cras dictum auctor arcu ac malesuada. Nulla sit amet nunc quis diam blandit vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec feugiat, nisl nec varius scelerisque, nisl massa fermentum nibh, eget euismod est nulla eu risus. Vestibulum vel justo finibus, pharetra dolor ut, consequat mauris. In egestas est nec ullamcorper vestibulum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus velit diam, auctor vel tellus vitae, maximus finibus nisl. Vivamus aliquet ac lacus condimentum efficitur. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas imperdiet ante velit, vel elementum elit sodales et. Praesent venenatis gravida justo eget ultricies. Sed convallis eleifend tellus id semper. Pellentesque et pellentesque felis, quis aliquet est. Donec molestie massa at augue gravida condimentum.</p>\r\n\r\n<p>In sed sapien sit amet lectus iaculis porta vitae a lectus. Phasellus orci leo, maximus vel ligula eget, posuere ornare est. Maecenas sit amet pretium libero. Aliquam pulvinar quam vestibulum elit faucibus, ut convallis odio aliquet. Maecenas quis eros ipsum. Morbi luctus, lorem ut ultricies blandit, neque mi sollicitudin sem, nec eleifend metus quam ac lorem. Nam nec nibh faucibus, condimentum mi sit amet, sollicitudin eros. Nullam volutpat vehicula mauris, id sagittis sapien egestas in.</p>\r\n\r\n<p>Morbi consequat massa interdum, sagittis felis vel, consequat risus. Donec tincidunt mollis eros non semper. Etiam maximus nisi turpis, eget venenatis turpis porta in. Aenean non nulla pellentesque arcu malesuada tempus. Pellentesque vitae mauris tempor, pharetra turpis eget, vehicula tellus. Vestibulum convallis lacus vitae ullamcorper bibendum. Vivamus ex mi, congue ut porta sed, cursus sit amet ex. Nullam mattis sit amet velit vitae commodo.</p>\r\n\r\n<p>Etiam vitae aliquet sem. Vivamus accumsan lobortis ante. Vivamus commodo tincidunt odio non tincidunt. Proin sit amet libero tincidunt, fringilla libero eu, luctus tellus. Fusce vitae arcu posuere, lacinia metus non, ullamcorper lectus. Duis consectetur diam nunc, ac rhoncus tortor maximus a. Duis non dignissim ex. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse tincidunt mauris erat, et maximus nisi accumsan sed. Mauris tempus risus a urna tincidunt, a congue nisi tristique.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et condimentum magna, ut scelerisque sapien. Maecenas sed semper elit, sed iaculis nulla. Suspendisse ac risus purus. Morbi auctor ligula magna, vestibulum luctus erat congue vitae. Phasellus quis enim erat. Aliquam ligula diam, gravida eu tristique sit amet, pellentesque quis justo. Fusce in maximus augue. Aenean nec dictum erat. In lacinia non lectus quis sodales. Proin sit amet condimentum sem. Suspendisse aliquet auctor bibendum. Nulla facilisi. Ut quis eleifend purus. Ut pharetra purus felis, eu bibendum elit eleifend id. Etiam neque justo, consequat eu ultricies eget, interdum a eros.</p>\r\n\r\n<p>Praesent ac turpis et metus semper congue at ut sapien. Suspendisse id velit congue, dictum lacus non, fringilla leo. Quisque sit amet ultrices tellus, id tristique dui. Integer elementum tristique nisl, eu lobortis sapien finibus vitae. Aenean condimentum neque eget mollis efficitur. Ut lorem tortor, ullamcorper eu felis rutrum, dapibus tincidunt ex. Donec ut justo tempor, faucibus velit sit amet, feugiat leo. Duis porttitor a elit sit amet sollicitudin. Mauris commodo elit nec lectus semper, ac pulvinar sapien scelerisque. Morbi tincidunt nunc nibh, ut vestibulum nunc congue in. Nunc tempor felis quis massa ultricies, at congue velit efficitur. Nulla sed consequat arcu. Nulla pretium, nulla nec ullamcorper pellentesque, enim libero vestibulum odio, id egestas ex orci nec nibh. Aenean sed mollis ante. Suspendisse maximus nisi vel lobortis pulvinar. Quisque elementum placerat felis, id dictum elit aliquet eget.</p>\r\n\r\n<p>Phasellus eleifend eleifend dictum. Suspendisse vehicula enim at nibh pharetra, id aliquam risus iaculis. Suspendisse ultrices magna est, eget varius neque lobortis sit amet. Suspendisse interdum risus eu dui tempus, nec rutrum magna feugiat. Pellentesque vulputate arcu metus, eget pretium sem convallis a. Donec sollicitudin nisi nibh. Praesent hendrerit porta lacus, at lacinia lorem convallis non. Praesent fringilla metus at nisi consectetur, quis accumsan lorem vehicula. Curabitur in orci turpis. Suspendisse non auctor massa, et mollis enim. Duis sed justo metus. Aliquam erat volutpat. Donec quis leo a libero vestibulum laoreet non non nunc. Etiam ac porta est, ac semper leo. Aliquam ut ante vitae odio consequat venenatis. Etiam ornare in nisl ac mattis.</p>\r\n\r\n<p>Nulla porttitor sapien in consectetur porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet accumsan velit. Nunc dictum, arcu in tempor tincidunt, massa ipsum convallis magna, non bibendum felis lectus eget lorem. Phasellus nec justo eget nisi tempor sodales. Duis consectetur quam et felis consectetur molestie. Praesent posuere a est nec cursus. Sed nisi est, tristique id vestibulum et, dictum vitae felis. Quisque consectetur pellentesque tortor.</p>', 'Praesent ac turpis et metus semper congue at ut sapien. Suspendisse id velit congue, dictum lacus non, fringilla leo. Quisque sit amet ultrices tellus, id tristique dui. Integer elementum tristique nisl, eu lobortis sapien finibus vitae. Aenean condimentum neque eget mollis efficitur. Ut lorem tortor, ullamcorper eu felis rutrum, dapibus tincidunt ex. Donec ut justo tempor, faucibus velit sit amet, feugiat leo. Duis porttitor a elit sit amet sollicitudin. Mauris commodo elit nec lectus semper, ac pulvinar sapien scelerisque. Morbi tincidunt nunc nibh, ut vestibulum nunc congue in. Nunc tempor felis quis massa ultricies, at congue velit efficitur. Nulla sed consequat arcu. Nulla pretium, nulla nec ullamcorper pellentesque, enim libero vestibulum odio, id egestas ex orci nec nibh. Aenean sed mollis ante. Suspendisse maximus nisi vel lobortis pulvinar. Quisque elementum placerat felis, id dictum elit aliquet eget.', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_sections`
--

CREATE TABLE `page_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `uploader_id` int(10) UNSIGNED NOT NULL,
  `section_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_sections`
--

INSERT INTO `page_sections` (`id`, `uploader_id`, `section_name`, `title`, `slug`, `short_detail`, `detail`, `note`, `image_name`, `created_at`, `updated_at`, `status`) VALUES
(9, 12, 'about-us', 'About Us', 'about-us', '<p>Living in an age of information overload there has emerged a growing need in acquiring knowledge of both the Islamic and Secular sciences in a highly effective and meticulous manner. The Faith Centre Online Islamic School aspire to accommodate education in numerous disciplines delivered by a network of qualified and talented instructors, suited for all ages there is always something for everyone. Understanding the developing needs of today&rsquo;s times, we aim to distribute this ongoing enterprise of positivity and necessity through an online platform providing accessibility of this content globally. We hope this will be a resource in attaining a service that will enable a healthy dialogue, proficiency in distinct areas of expertise, and a course for establishing authenticity and transformational leadership by the will of Allah.</p>\r\n\r\n<p><strong>FEATURES</strong></p>\r\n\r\n<ul>\r\n	<li>We administer a wide range of courses for those who wish to specialize in a particular field ensuring to use an interactive approach in learning the desired subject matter, whereby a student&rsquo;s participation in the flowing of ideas and way for discussion will encourage the pupils to develop a natural cognitive ability in problem-solving as well as utilizing these skills in being able to present their arguments in the most effective and constructive manner.</li>\r\n	<li>Education from a young age is a vital element in reinforcing a sound intelligence within a child which will be an efficacious process in being able to solve any obstacles that come in life both in the academic and outside realms.</li>\r\n</ul>', '<p>Living in an age of information overload there has emerged a growing need in acquiring knowledge of both the Islamic and Secular sciences in a highly effective and meticulous manner. The Faith Centre Online Islamic School aspire to accommodate education in numerous disciplines delivered by a network of qualified and talented instructors, suited for all ages there is always something for everyone. Understanding the developing needs of today&rsquo;s times, we aim to distribute this ongoing enterprise of positivity and necessity through an online platform providing accessibility of this content globally. We hope this will be a resource in attaining a service that will enable a healthy dialogue, proficiency in distinct areas of expertise, and a course for establishing authenticity and transformational leadership by the will of Allah.</p>\r\n\r\n<p><strong>FEATURES</strong></p>\r\n\r\n<ul>\r\n	<li>We administer a wide range of courses for those who wish to specialize in a particular field ensuring to use an interactive approach in learning the desired subject matter, whereby a student&rsquo;s participation in the flowing of ideas and way for discussion will encourage the pupils to develop a natural cognitive ability in problem-solving as well as utilizing these skills in being able to present their arguments in the most effective and constructive manner.</li>\r\n	<li>Education from a young age is a vital element in reinforcing a sound intelligence within a child which will be an efficacious process in being able to solve any obstacles that come in life both in the academic and outside realms. We aim to produce students with enthusiasm for learning and continuous growth.</li>\r\n	<li>Approachable and qualified teachers will work towards building individual capability as well as assigning additional group tasks within the classroom setting to increase teamwork, this will strengthen the areas of confidence, collective research including an appreciation for each other&rsquo;s ideas, this method of collaboration will be under the guidance of the teacher to be able to aid in areas which need addressing for each pupil.</li>\r\n</ul>', '<p>Living in an age of information overload there has emerged a growing need in acquiring knowledge of both the Islamic and Secular sciences in a highly effective and meticulous manner.</p>', '1620438815.webp', '2021-05-08', '2021-05-08', 1),
(5, 10, 'why-choose-us', 'Why Choose Us', 'why-choose-us', '<p>By setting higher standards in education, you endeavor upon a journey of self-rectification in different spheres of knowledge constantly improving in your literary skills to re-enter society as a beacon of light that emanates its positive energy.&nbsp;</p>\r\n\r\n<p>This will all be achieved in the pursuit of valuable tutoring, instructing, and mentorship by a reliable circle of academics.</p>\r\n\r\n<p>We help our students in obtaining these goals by allowing their individual talents to flourish, giving them the tools to project their skills to the outside world, Insha Allah. Make all your ambitions a reality by prioritizing what you&rsquo;re learning today.</p>', '<p>By setting higher standards in education, you endeavor upon a journey of self-rectification in different spheres of knowledge constantly improving in your literary skills to re-enter society as a beacon of light that emanates its positive energy.</p>\r\n\r\n<p>This will all be achieved in the pursuit of valuable tutoring, instructing, and mentorship by a reliable circle of academics.</p>\r\n\r\n<p>We help our students in obtaining these goals by allowing their individual talents to flourish, giving them the tools to project their skills to the outside world, Insha Allah. Make all your ambitions a reality by prioritizing what you&rsquo;re learning today.</p>', 'By setting higher standards in education, you endeavor upon a journey of self-rectification in different spheres of knowledge constantly improving in your literary skills to re-enter society as a beacon of light that emanates its positive energy.', '1620353580.webp', '2021-05-07', '2021-05-07', 1),
(7, 10, 'our-mission', 'Our Mission', 'our-mission', '<p>Our mission for our students is to receive the best level of education wherever they may be in the world. We wish to support students in discovering their independent strengths to further enhance their potential including detecting their individual weaknesses in order to resolve them in the method best suited for each person. Our long-term objective of what we hope to achieve for ourselves and our students is to come out of their courses, programs, and classes having an appropriate understanding of what they wish to be in life and how will that specific qualification support the building of a more tolerant and optimistic society as well as in what ways will they be able to accomplish these aspirations. Together we not only can build a more spiritually productive environment but also a better world paving the way for peaceful coexistence through the means of impactful education and positive reform Insha Allah.</p>', '<p>Our mission for our students is to receive the best level of education wherever they may be in the world. We wish to support students in discovering their independent strengths to further enhance their potential including detecting their individual weaknesses in order to resolve them in the method best suited for each person. Our long-term objective of what we hope to achieve for ourselves and our students is to come out of their courses, programs, and classes having an appropriate understanding of what they wish to be in life and how will that specific qualification support the building of a more tolerant and optimistic society as well as in what ways will they be able to accomplish these aspirations. Together we not only can build a more spiritually productive environment but also a better world paving the way for peaceful coexistence through the means of impactful education and positive reform Insha Allah.</p>', 'Our mission for our students is to receive the best level of education wherever they may be in the world.', '1620021963.webp', '2021-05-07', '2021-05-07', 1),
(8, 10, 'our-vision', 'Our Vision', 'our-vision', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h3>Features</h3>\r\n\r\n<ul>\r\n	<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n	<li>Integer vel augue eget lacus finibus cursus nec sed augue.</li>\r\n	<li>Mauris non augue hendrerit, pulvinar tortor nec, maximus felis.</li>\r\n	<li>Nullam ac sapien pharetra, faucibus mauris in, ultricies ex.</li>\r\n</ul>', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h3>Features</h3>\r\n\r\n<ul>\r\n	<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n	<li>Integer vel augue eget lacus finibus cursus nec sed augue.</li>\r\n	<li>Mauris non augue hendrerit, pulvinar tortor nec, maximus felis.</li>\r\n	<li>Nullam ac sapien pharetra, faucibus mauris in, ultricies ex.</li>\r\n</ul>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>', NULL, '1620430727.webp', '2021-05-08', '2021-05-08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `page_section_meta`
--

CREATE TABLE `page_section_meta` (
  `id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `meta_key` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `uploader_id` int(10) UNSIGNED DEFAULT NULL,
  `student_type` varchar(100) NOT NULL,
  `student_status` varchar(30) NOT NULL,
  `memorizing` text NOT NULL,
  `tajwid` text NOT NULL,
  `handwriting` text NOT NULL,
  `home_work_memorizing` text NOT NULL,
  `home_work_tajwid` text NOT NULL,
  `home_work_handwriting` text NOT NULL,
  `remark` text DEFAULT NULL,
  `star` int(11) NOT NULL DEFAULT 0,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `student_id`, `date`, `time`, `uploader_id`, `student_type`, `student_status`, `memorizing`, `tajwid`, `handwriting`, `home_work_memorizing`, `home_work_tajwid`, `home_work_handwriting`, `remark`, `star`, `updated_at`, `status`) VALUES
(1, 11, '2021-06-19', '06:03:50', 17, 'qaidah', 'present', 'Kalima-e-shahadat', 'n/a', 'n/a', 'The meaning of kalima-e-shadat', 'not available', 'n/a', NULL, 2, '2021-06-19 06:56:38', 1),
(2, 11, '2021-06-16', '07:00:43', 17, 'quran', 'present', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', NULL, 2, '2021-06-19 07:03:21', 1),
(3, 8, '2021-04-30', '09:44:01', 17, 'qaidah', 'present', 'Durud-e-ibrahim', 'n/a', 'n/a', 'Durud-e ibrahim', 'n/a', 'n/a', NULL, 2, '2021-06-19 09:44:01', 1),
(4, 7, '2021-04-30', '09:45:18', 17, 'qaidah', 'present', 'Durude-e-ibrahim', 'n/a', 'n/a', 'durude-e-ibrahim', 'n/a', 'n/a', NULL, 2, '2021-06-19 09:45:18', 1),
(5, 9, '2021-04-19', '09:46:54', 17, 'qaidah', 'present', 'Sura Al Fatiha', 'n/a', 'n/a', 'sura al fatiha', 'n/a', 'n/a', NULL, 2, '2021-06-19 09:46:54', 1),
(6, 8, '2021-05-01', '09:49:23', 17, 'qaidah', 'present', 'durude-e-ibrahim', 'n/a', 'n/a', 'durud-e-ibrahim meaning', 'n/a', 'n/a', NULL, 2, '2021-06-19 09:49:23', 1),
(7, 7, '2021-05-01', '09:51:18', 17, 'qaidah', 'present', 'Durud-e-ibrahim meaning', 'n/a', 'n/a', 'Durud-e-ibrahim meaning', 'n/a', 'n/a', NULL, 2, '2021-06-19 09:51:18', 1),
(8, 8, '2021-05-02', '10:41:55', 17, 'qaidah', 'present', 'Durud-e-ibrahim Meaning', 'n/a', 'n/a', 'Durud-e-ibrahim Meaning', 'n/a', 'n/a', NULL, 2, '2021-06-19 10:41:55', 1),
(9, 7, '2021-05-02', '10:43:37', 17, 'qaidah', 'present', 'durud-e-ibrahim meaning', 'n/a', 'n/a', 'durud-e-ibrahim meaning', 'n/a', 'n/a', NULL, 2, '2021-06-19 10:43:37', 1),
(10, 7, '2021-05-02', '10:45:04', 17, 'qaidah', 'interrupted', 'sura al fatiha', 'n/a', 'n/a', 'Sura al fatiha', 'n/a', 'n/a', NULL, 1, '2021-06-19 10:45:04', 1),
(11, 6, '2021-06-19', '16:15:21', 16, 'qaidah', 'present', 'Kalima shahadah', 'N/A', 'N/A', 'Iman mujmal', 'N/A', 'N/A', 'Satisfactory', 2, '2021-06-19 16:15:21', 1),
(12, 5, '2021-06-20', '20:50:57', 39, 'qaidah', 'present', 'Sura Fatiha', 'Makhraj', '1 page', 'Tashahhud', 'NA', 'NA', NULL, 2, '2021-06-20 20:50:57', 1),
(13, 26, '2021-06-20', '21:58:23', 17, 'qaidah', 'present', 'Tashahhud have been done', 'NA', 'NA', 'Durud', 'Maraj', '1 page', NULL, 2, '2021-06-20 21:58:23', 1),
(14, 116, '2021-06-20', '19:12:46', 38, 'quran', 'present', 'No', 'No', 'No', 'No memorizing', 'No', 'No', NULL, 1, '2021-06-20 19:12:46', 1),
(15, 8, '2021-06-20', '19:16:45', 10, 'qaidah', 'present', 'Dua-e-qunud', 'n/a', 'n/a', 'Dua-e-qunut', 'n/a', 'n/a', NULL, 2, '2021-06-20 19:16:45', 1),
(16, 177, '2021-06-20', '19:18:46', 10, 'qaidah', 'present', 'Dua-e-qunud meaning first 3lines', 'n/a', 'n/a', 'Dua-e-qunud meaning first 3lines', 'n/a', 'n/a', NULL, 2, '2021-06-20 19:42:43', 1),
(17, 124, '2021-06-20', '19:19:02', 28, 'quran', 'present', 'Duas for Salatul janazah for adult man or woman and a boy.', '_', '_', 'Duas for Salatul janazah for a boy in Arabic and English', '_', '_', 'She is clever and active.', 2, '2021-06-20 19:19:02', 1),
(18, 55, '2021-02-06', '19:23:55', 22, 'qaidah', 'present', 'Dua for a girl', '-', '-', 'level 2 test', '-', '-', NULL, 2, '2021-06-20 19:23:55', 1),
(19, 69, '2021-02-06', '19:31:38', 22, 'qaidah', 'present', 'Durood e Ibrahim', '-', '-', 'Durood e Ibrahim', '-', '-', NULL, 1, '2021-06-20 19:31:38', 1),
(20, 61, '2021-06-20', '19:32:58', 28, 'juz amma', 'present', 'Duas for Salatul janazah for adult man or woman.', '_', '_', 'Duas for Salatul janazah for adult man or woman in Arabic and English for 5 times.', '_', '_', 'She is less attentive.', 2, '2021-06-20 19:32:58', 1),
(21, 56, '2021-02-06', '19:35:10', 22, 'qaidah', 'present', 'Ruku - Tasmee', '-', '-', 'Ruku - Tasmee', '-', '-', NULL, 1, '2021-06-20 19:35:10', 1),
(22, 78, '2021-06-20', '20:14:54', 42, 'juz amma', 'present', 'Durood-e-Ibrahim Done', 'Makhraj of seen', 'wrote 2 ayat', 'Dua Mathurah', 'Makhraj of seen', 'ayah 21', NULL, 2, '2021-06-20 20:14:54', 1),
(23, 177, '2021-06-20', '20:26:49', 42, 'juz amma', 'late', 'Thana', 'Makhraj of qaf', '2 ayat', 'Ruku', 'Makhraj of qaf', 'ayah number 3', 'she has many problems of letters makharaj', 2, '2021-06-20 20:38:46', 0),
(24, 60, '2021-06-20', '20:32:57', 42, 'juz amma', 'late', 'Thana', 'Makhraj of ayn', '3 ayat', 'Thana', 'Makhraj of ayn', 'aya number 4', 'she still young and has some difficulties in makharaj', 2, '2021-06-20 20:32:57', 1),
(25, 59, '2021-06-20', '20:42:48', 42, 'juz amma', 'late', 'Thana done', 'makhraj of qaf', '2 ayat', 'Ruku', 'makhraj of qaf', 'aya number 3', 'she has many problems of letters makharaj', 1, '2021-06-20 20:42:48', 1),
(26, 109, '2021-06-21', '20:48:33', 21, 'qaidah', 'present', 'Iman e muzmal', 'Wajeeb gunnah', 'Letters with shaddah', 'Sura fatiha', 'Wajeeb gunnah practice', 'Letters with shaddah without looking', NULL, 2, '2021-06-20 20:48:33', 1),
(27, 108, '2021-06-21', '20:51:53', 21, 'qaidah', 'present', 'Iman e muzmal(fail)', 'None', 'Letters with Fatab', 'Iman e muzmal', 'None', 'Letter with fatah without looking', 'She is too youger,Tajwid should start after few weeks or 1 month.', 1, '2021-06-20 20:51:53', 1),
(28, 101, '2021-06-21', '20:57:13', 21, 'juz amma', 'present', 'Janaza dua for a girl', 'Gunnah', 'Some ayats from sura Abasa(looking)', 'Tashahhud,Darud,Dua qunut(as a revision)', 'Gunnah practice', 'One small sura from Juz amma (without looking', NULL, 2, '2021-06-20 20:57:13', 1),
(29, 62, '2021-02-06', '21:12:44', 47, 'juz amma', 'present', 'Dua after druud \r\nDua e-qunoot', 'NA', 'NA', 'Dua e-Qunoot', 'NA', 'NA', NULL, 2, '2021-06-20 21:12:44', 1),
(30, 70, '2021-06-20', '21:19:07', 47, 'juz amma', 'present', 'Did not take any', 'NA', 'NA', 'Dua after boarding a car', 'NA', 'NA', 'He left before the break so he did not  do memorizing', 1, '2021-06-20 21:19:07', 1),
(31, 118, '2021-06-20', '21:41:09', 28, 'quran', 'present', '_', '_', '_', '_', '_', '_', NULL, 2, '2021-06-20 21:41:09', 1),
(32, 119, '2021-06-20', '21:42:42', 28, 'quran', 'present', '_', '_', '_', '_', '_', '_', NULL, 2, '2021-06-20 21:42:42', 1),
(33, 120, '2021-06-20', '21:47:01', 28, 'quran', 'present', '_', '_', '_', '_', '_', '_', NULL, 2, '2021-06-20 21:47:01', 1),
(34, 49, '2021-06-20', '22:27:33', 18, 'quran', 'present', 'surat abasa from 30 up to 34', 'NA', 'NA', 'the hole of the sura abasa', 'NA', 'NA', NULL, 2, '2021-06-20 22:27:33', 1),
(35, 66, '2021-06-20', '22:29:27', 24, 'juz amma', 'interrupted', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'Yusuf is interrupted many times because of his bad network.', 1, '2021-06-20 22:29:27', 1),
(36, 65, '2021-06-20', '22:32:12', 24, 'quran', 'interrupted', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', 'Sameera is interrupted many times because of bad network.', 1, '2021-06-20 22:32:12', 1),
(37, 131, '2021-06-20', '22:35:37', 26, 'quran', 'present', 'Sura Al humazah', 'Qalaqalah', 'Not yet', 'Sura Al adyat', 'None', 'None', NULL, 2, '2021-06-20 22:35:37', 1),
(38, 98, '2021-06-20', '22:39:49', 26, 'quran', 'present', 'Sura Al humaza', 'Qalaqalah-Madd Tabee', 'None', 'Sura Al humaza', 'None', 'None', 'Arman\'s level is very low..He need to have less amount of reading and concentrate more', 1, '2021-06-20 22:39:49', 1),
(39, 121, '2021-06-20', '16:38:36', 29, 'quran', 'present', 'Surat At-takweer from Aya N. 19 to Aya N.29.', 'Revise the four rules of Noon Sakinah and Tanween.', 'Extract the ayas that have the four rules of Noon Sakinah and Tanween in Surat At-takweer.', 'The full At-takweer.', 'Extract the ayas that have the four rules of Noon Sakinah and Tanween in Surat At-takweer.', 'Extract the ayas that have the four rules of Noon Sakinah and Tanween in Surat At-takweer.', '7/10', 1, '2021-06-21 16:38:36', 1),
(40, 5, '2021-06-21', '19:05:55', 17, 'qaidah', 'present', 'Durud-e-ibrahim', 'n/a', 'n/a', 'Durud-e-ibrahim', 'n/a', 'n/a', NULL, 2, '2021-06-21 19:05:55', 1),
(41, 4, '2021-06-21', '19:06:49', 17, 'qaidah', 'present', 'Tashahud', 'n/a', 'n/a', 'Tashahud', 'n/a', 'n/a', NULL, 2, '2021-06-21 19:06:49', 1),
(42, 6, '2021-06-21', '19:07:53', 17, 'qaidah', 'present', 'First & 2nd Kalima', 'n/a', 'n/a', 'First & 2nd Kalima', 'n/a', 'n/a', NULL, 2, '2021-06-21 19:07:53', 1),
(43, 113, '2021-02-16', '19:11:09', 22, 'qaidah', 'present', 'Tashahud', '-', '-', 'Durood e Ibrahim', '-', '-', NULL, 2, '2021-06-21 19:11:09', 1),
(44, 135, '2021-02-06', '19:19:27', 22, 'qaidah', 'present', 'Third Kalima', '-', '-', 'Fourth Kalima', '-', '-', NULL, 2, '2021-06-21 19:19:27', 1),
(45, 40, '2021-06-21', '19:20:20', 28, 'quran', 'present', 'Dua e Qunoot.', '_', '_', 'Dua e Qunoot, reading for 5 times', '_', '_', 'her recitation is improved , alhamdalalah.', 2, '2021-06-21 19:20:20', 1),
(46, 129, '2021-02-16', '19:21:43', 22, 'qaidah', 'present', 'level 1 test', '-', '-', 'Thana', '-', '-', NULL, 2, '2021-06-21 19:21:43', 1),
(47, 94, '2021-06-21', '19:24:03', 36, 'quran', 'present', 'Sura Al nabaa', '_', '_', 'Sura Al nabaa 30_40', '_', '_', NULL, 1, '2021-06-21 19:24:03', 1),
(48, 36, '2021-06-21', '19:27:29', 28, 'quran', 'present', 'Dua e Qunoot and Dua Salatul janazah for a boy.', '_', '_', 'Dua Salatul janazah for a boy and Dua e Qunoot, for 5 times.', '_', '_', 'His recitation is quite well.', 1, '2021-06-21 19:27:29', 1),
(49, 112, '2021-06-21', '19:27:53', 36, 'juz amma', 'present', 'Drud ibrahim', '_', '_', 'Drud ibrahim', '_', '_', 'Sura Al nas_ Al falq_Al ekalas_Al makad.', 1, '2021-06-21 19:27:53', 1),
(50, 51, '2021-06-21', '19:32:47', 42, 'juz amma', 'present', 'Durood-e- Ibrahim', 'Qalqalah', 'aya number 9', 'Durood-e- Ibrahim', 'to look for 5 words of qalqalah in his sura', 'NA', NULL, 2, '2021-06-21 19:32:47', 1),
(51, 37, '2021-06-21', '19:34:21', 28, 'quran', 'present', 'Dua before sleeping and Dua on  awakening', '_', '_', 'Dua before sleeping and on awakening for 5 times.', '_', '_', 'Nusaiba is an excellent , active and clever student, I ask God to protect her.', 2, '2021-06-21 19:34:21', 1),
(52, 27, '2021-06-21', '19:36:58', 42, 'juz amma', 'present', 'Durood-e- Ibrahim', 'Qalqalah', 'aya number 10', 'Durood-e- Ibrahim', 'to look for 8 words of qalqalah in his sura', 'NA', NULL, 2, '2021-06-21 19:36:58', 1),
(53, 45, '2021-06-21', '19:39:00', 28, 'quran', 'present', 'Dua e Qunoot', '_', '_', 'Dua e Qunoot for 4 times.', '_', '_', 'Her recitation is good.', 1, '2021-06-21 19:39:00', 1),
(54, 126, '2021-06-21', '19:43:33', 42, 'juz amma', 'late', 'Durood-e- Ibrahim', 'Qalqalah', 'aya number 103', 'Durood-e- Ibrahim', 'looking for 5 words of qalqalah in her sura', 'NA', NULL, 2, '2021-06-21 19:43:33', 1),
(55, 91, '2021-06-21', '20:22:20', 29, 'quran', 'present', 'N/A', 'Qalqalah', 'Write down the vibrated letters in Full Surat Al-Burooj (1:11) on a paper three times.', 'N/A', 'Write down the vibrated letters in Full Surat Al-Burooj (1:11) on a paper three times.', 'Write down the vibrated letters in Full Surat Al-Burooj (1:11) on a paper three times.', '9/10', 2, '2021-06-21 20:22:20', 1),
(56, 25, '2021-06-21', '20:25:44', 29, 'juz amma', 'present', 'N/A', 'Qalqalah', 'Write down the vibrated letters in Full Surat Al-Burooj (1:11) on a paper three times.', 'N/A', 'Write down the vibrated letters in Full Surat Al-Burooj (1:11) on a paper three times.', 'Write down the vibrated letters in Full Surat Al-Burooj (1:11) on a paper three times.', '7/10', 1, '2021-06-21 20:25:44', 1),
(57, 110, '2021-06-21', '20:29:18', 29, 'quran', 'present', 'N/A', 'Qalqalah', 'Write down the vibrated letters in Full Surat Al-Balad & Al-fajr (1:10) on a paper three times.', 'N/A', 'Write down the vibrated letters in Full Surat Al-Balad & Al-fajr (1:10) on a paper three times.', 'Write down the vibrated letters in Full Surat Al-Balad & Al-fajr (1:10) on a paper three times.', '8.5/10', 2, '2021-06-21 20:29:18', 1),
(58, 18, '2022-06-21', '21:51:30', 21, 'quran', 'present', 'Tashahhud,Darud, Dua qunut with out meaning(as a revision)', 'Qalqalah', 'None', 'Dua after durood and dua qunut with meaning', 'Gunnah', 'First 3 ayats from Al fatiha(without looking', NULL, 2, '2021-06-21 21:51:30', 1),
(59, 19, '2021-06-21', '21:54:16', 21, 'quran', 'late', 'Durood ibraheem without meaning', 'None', 'None', 'Durood with meaning', 'Gunnah', 'Sura fatiha 3 ayat looking', NULL, 1, '2021-06-21 21:54:16', 1),
(60, 28, '2021-06-21', '22:07:38', 21, 'juz amma', 'interrupted', 'Dua before bording on a caf without meaning', 'Qalqalah', 'Not taday', 'Dua before bording on a car with meaning', 'Example of qalqalah', 'First 3 ayats from Al fatiha without looking', NULL, 2, '2021-06-21 22:07:38', 1),
(61, 52, '2021-06-21', '00:35:27', 26, 'quran', 'present', 'None', 'Qalaqalah-Madd', 'None', 'Sura Al duha', 'None', 'None', NULL, 1, '2021-06-22 00:35:27', 1),
(62, 131, '2021-06-21', '00:38:18', 26, 'quran', 'present', 'Sura Al Adyat', 'None', 'None', 'Sura Al Asr', 'None', 'None', NULL, 2, '2021-06-22 00:38:18', 1),
(63, 150, '2021-06-21', '00:43:28', 26, 'quran', 'present', 'Sura Al lail', 'None', 'None', 'Sura Al qadr', 'None', 'None', NULL, 1, '2021-06-22 00:43:28', 1),
(64, 177, '2021-06-21', '16:45:59', 40, 'qaidah', 'present', 'Surah Al Fatiha', 'NA', 'NA', 'Surah Al Fatiha', 'NA', 'NA', NULL, 2, '2021-06-22 16:51:12', 1),
(65, 177, '2021-06-21', '16:50:24', 40, 'qaidah', 'present', 'Sura Al Fatiha', 'NA', 'NA', 'Surah Al Fatiha', 'NA', 'NA', NULL, 2, '2021-06-22 16:50:59', 1),
(66, 111, '2021-06-21', '16:54:33', 40, 'qaidah', 'present', 'Surah Al Fatiha', 'NA', 'NA', 'Surah Al Fatiha', 'NA', 'NA', NULL, 2, '2021-06-22 16:54:33', 1),
(67, 4, '2021-06-22', '19:09:24', 10, 'qaidah', 'present', 'Tashahud', 'n/a', 'n/a', 'Tashahud', 'n/a', 'n/a', NULL, 2, '2021-06-22 19:09:24', 1),
(68, 129, '2021-02-26', '19:10:38', 22, 'qaidah', 'present', 'Thana', '-', '-', 'Ruku\r\nTasmee\r\nTahmeed\r\nSajda', '-', '-', NULL, 2, '2021-06-22 19:10:38', 1),
(69, 5, '2021-06-22', '19:11:27', 10, 'qaidah', 'present', 'Durude-ibrahim, Tashahud', 'n/a', 'n/a', 'Durude-e-ibrehim', 'n/a', 'n/a', NULL, 2, '2021-06-22 19:11:27', 1),
(70, 135, '2021-02-26', '19:14:07', 22, 'qaidah', 'present', 'Forth Kalima \r\nSoura  Al Fatiha', '-', '-', 'Level 1 test', '-', '-', NULL, 2, '2021-06-22 19:14:07', 1),
(71, 6, '2021-06-22', '19:14:26', 10, 'qaidah', 'present', 'First & 2nd kalima', 'n/a', 'n/a', '3rd & 4th kalima', 'n/a', 'n/a', NULL, 2, '2021-06-22 19:14:26', 1),
(72, 113, '2021-06-22', '19:21:19', 22, 'qaidah', 'present', 'Duaa e ibrahim', '-', '-', 'Duaa after durood', '-', '-', NULL, 2, '2021-06-22 19:21:19', 1),
(73, 36, '2021-06-22', '19:21:55', 28, 'quran', 'present', 'Due e Qunoot and Dua Salatul janazah for a boy and a girl.', '_', '_', 'Reading each kalimah in level 2 in memorising for 4 times.', '_', '_', NULL, 1, '2021-06-22 19:21:55', 1),
(74, 37, '2021-06-22', '19:26:35', 28, 'quran', 'present', 'Dua before eating, on forgetting and after eating', '_', '_', 'Dua before eating , on forgetting and after eating each one for 3 times', '_', '_', NULL, 2, '2021-06-22 19:26:35', 1),
(75, 40, '2021-06-22', '19:28:51', 28, 'quran', 'present', 'Dua e Qunoot', '_', '_', 'Dua e Qunoot for 7 times', '_', '_', NULL, 2, '2021-06-22 19:28:51', 1),
(76, 27, '2021-06-22', '19:36:38', 42, 'juz amma', 'present', 'Durood-e-Ibrahim', 'Qalqalah & Ghunah', 'Aya number 19', 'Durood-e-Ibrahim', 'looking for qalqalah and ghunah in his sura', 'NA', NULL, 2, '2021-06-22 19:36:38', 1),
(77, 51, '2021-06-22', '19:43:59', 42, 'juz amma', 'present', 'Durood-e-Ibrahim', 'Qalqalah & Ghunah', 'Ayat numbers 12 ,13 and 14', 'Durood-e-Ibrahim', 'Looking for qalqalah and ghunah in his sura', 'NA', NULL, 2, '2021-06-22 19:43:59', 1),
(78, 126, '2021-06-22', '19:50:37', 42, 'juz amma', 'present', 'Durood-e-Ibrahim', 'Qalqalah and Ghunah', 'Aya number 112', 'Durood-e-Ibrahim', 'Looking for qalqalah and ghunah in her ayat', 'NA', NULL, 2, '2021-06-22 19:50:37', 1),
(79, 85, '2021-06-22', '20:03:56', 40, 'qaidah', 'present', 'Surah Al Fatiha', 'NA', 'NA', 'NA', 'NA', 'NA', NULL, 2, '2021-06-22 20:03:56', 1),
(80, 117, '2021-06-22', '20:07:53', 40, 'qaidah', 'interrupted', 'Surah Al Fatiha', 'NA', 'NA', 'Surah Al Fatiha', 'NA', 'NA', NULL, 2, '2021-06-22 20:07:53', 1),
(81, 177, '2021-06-22', '20:08:34', 29, 'quran', 'present', 'Tahmeed with meaning & Sajdah with meaning & Tashahud.', 'Heavy letters.', 'Write down ten heavy letters from Surat Al-fajr.', 'Tashahud\'s meaning.', 'Write down ten heavy letters from Surat Al-fajr.', 'Write down ten heavy letters from Surat Al-fajr.', '9/10', 2, '2021-06-22 20:19:10', 1),
(82, 111, '2021-06-22', '20:09:59', 40, 'qaidah', 'present', 'Surah Al Fatiha', 'NA', 'NA', 'Surah Al Fatiha', 'NA', 'NA', NULL, 2, '2021-06-22 20:09:59', 1),
(83, 25, '2021-06-22', '20:15:39', 29, 'juz amma', 'present', 'Dua On-Boarding a car', 'Write down ten heavy letters from Surat Al-burooj.', 'Write down ten heavy letters from Surat Al-burooj.', 'Dua On-Boarding a car\'s meaning.', 'Write down ten heavy letters from Surat Al-burooj.', 'Write down ten heavy letters from Surat Al-burooj.', '9', 2, '2021-06-22 20:15:39', 1),
(84, 91, '2021-06-22', '20:18:44', 29, 'quran', 'present', 'Tashahud with meaning.', 'Heavy letters.', 'Write down ten heavy letters from Surat Al-burooj.', 'Durood Ibrahim.', 'Write down ten heavy letters from Surat Al-burooj.', 'Write down ten heavy letters from Surat Al-burooj.', '9/10', 2, '2021-06-22 20:18:44', 1),
(85, 18, '2021-06-22', '20:44:34', 21, 'quran', 'present', 'tadhahud,durood,dua after dorud w meaning(as revision)', 'Practice on gunnah/finding out gunnah and qalqalah', 'N A', 'Dua qunoot mening,Al janaza dua with meaning', 'N/A', 'First 3 ayats from Sura Fatiha (without looking)', NULL, 2, '2021-06-22 20:44:34', 1),
(86, 28, '2021-06-21', '20:54:53', 21, 'juz amma', 'interrupted', 'Meaning of dua before boarding on a car', 'N/A', 'N/A', 'Some important expression', 'Gunnah,and qalqalah', 'Sura fauta\'s first 3 ayats(without looking', 'His internet is weak', 2, '2021-06-22 20:54:53', 1),
(87, 19, '2021-06-22', '20:56:59', 21, 'quran', 'present', 'Meaning of durood', 'N/A', 'N/A', 'Dua after durood/Dua mathura', 'N/A', 'Sura fatihas first 3 ayat (looking)', NULL, 1, '2021-06-22 20:56:59', 1),
(88, 150, '2021-06-22', '13:00:12', 26, 'quran', 'present', 'None', 'None', 'Arabic Alphabet', 'Sura Al tareq', 'None', 'None', 'His camera is blurred', 1, '2021-06-23 13:00:12', 1),
(89, 52, '2021-06-22', '14:53:27', 26, 'quran', 'present', 'None', 'None', 'None', 'Sura Al lail', 'None', 'None', NULL, 1, '2021-06-23 14:53:27', 1),
(90, 131, '2021-06-22', '14:56:44', 26, 'quran', 'present', 'Sura Al Adyat', 'None', 'None', 'Sura Al kafiroon', 'None', 'Arabic Alphabet', NULL, 2, '2021-06-23 14:56:44', 1),
(91, 110, '2021-06-22', '17:17:00', 29, 'quran', 'present', 'Tahmeed with meaning & Sajdah with meaning & Tashahud', 'Heavy Letters', 'Extract ten heavy letters in Surat Al-fajr and write down them on paper.', 'Tashahud\'s meaning.', 'Extract ten heavy letters in Surat Al-fajr and write down them on paper.', 'Extract ten heavy letters in Surat Al-fajr and write down them on paper.', '9/10', 2, '2021-06-23 17:17:00', 1),
(92, 15, '2021-06-23', '19:04:51', 47, 'quran', 'present', 'dua after druud', 'NA', 'NA', 'Dua after druud', 'NA', 'NA', NULL, 2, '2021-06-23 19:04:51', 1),
(93, 84, '2021-06-23', '19:07:44', 47, 'quran', 'present', 'NA', 'NA', 'NA', 'finished', 'NA', 'NA', NULL, 1, '2021-06-23 19:07:44', 1),
(94, 95, '2021-06-21', '19:12:00', 47, 'qaidah', 'present', 'thana', 'NA', 'NA', 'thana', 'NA', 'NA', NULL, 2, '2021-06-23 19:12:00', 1),
(95, 85, '2021-06-23', '19:12:06', 40, 'qaidah', 'present', 'NA', 'NA', 'NA', 'Tashahud', 'NA', 'NA', NULL, 2, '2021-06-23 19:12:06', 1),
(96, 36, '2021-06-23', '19:14:14', 28, 'quran', 'present', 'Level 2', 'Mad leen', '_', '_', '_', '_', 'He passed the test of level 2 in memorising.', 2, '2021-06-23 19:14:14', 1),
(97, 111, '2021-06-23', '19:14:33', 40, 'qaidah', 'present', 'Surah Al Fatiha', 'NA', 'NA', 'Tashahud', 'NA', 'NA', NULL, 2, '2021-06-23 19:14:33', 1),
(98, 43, '2021-06-21', '19:14:40', 47, 'qaidah', 'present', 'thana', 'NA', 'NA', 'thana', 'NA', 'NA', NULL, 2, '2021-06-23 19:14:40', 1),
(99, 4, '2021-06-23', '19:15:28', 10, 'qaidah', 'present', 'Tashahud', 'n/a', 'n/a', 'Tashahud', 'n/a', 'n/a', NULL, 2, '2021-06-23 19:15:28', 1),
(100, 5, '2021-06-23', '19:17:02', 10, 'qaidah', 'present', 'Durud-e-ibrahim', 'n/a', 'n/a', 'Durud-e-ibrahim meaning', 'n/a', 'n/a', NULL, 2, '2021-06-23 19:17:02', 1),
(101, 37, '2021-06-23', '19:17:15', 28, 'quran', 'present', 'Dua before sleeping and on awakening\r\nDua before eating , on forgetting and after.\r\nDua before and after toilet.', 'Mad leen', '_', 'Dua before and after toilet.', '_', '_', NULL, 2, '2021-06-23 19:17:15', 1),
(102, 89, '2021-06-21', '19:17:30', 47, 'qaidah', 'present', 'thana\r\nruku', 'NA', 'NA', 'thana \r\nruku', 'NA', 'NA', NULL, 2, '2021-06-23 19:17:30', 1),
(103, 40, '2021-06-23', '19:20:02', 28, 'quran', 'present', 'Dua e Qunoot.', 'Mad leen', '_', 'She left early.', '_', '_', 'She left 20 minutes early.', 1, '2021-06-23 19:20:02', 1),
(104, 6, '2021-06-23', '19:20:07', 10, 'qaidah', 'interrupted', 'n/a', 'n/a', 'n/a', '3rd & 4th kalimah', 'n/a', 'n/a', NULL, 1, '2021-06-23 19:20:07', 1),
(105, 140, '2021-06-23', '19:20:32', 40, 'qaidah', 'present', 'kalimah shahadah', 'NA', 'NA', 'kalimah shahadah', 'NA', 'NA', NULL, 2, '2021-06-23 19:20:32', 1),
(106, 27, '2021-06-23', '19:34:47', 42, 'juz amma', 'present', 'Durood -e- Ibrahim (Done)', 'Madd Tabbiee', '2 ayat', 'Dua Ma`thurah', 'Madd Tabbiee', '1 aya', NULL, 1, '2021-06-23 19:34:47', 1),
(107, 126, '2021-06-23', '19:39:46', 42, 'juz amma', 'present', 'Durood -e- Ibrahim (Done)', 'Madd Tabbiee', '2 ayat', 'Dua Ma`thurah', 'Madd Tabbiee', 'NA', NULL, 2, '2021-06-23 19:39:46', 1),
(108, 51, '2021-06-23', '19:43:06', 42, 'juz amma', 'present', 'Durood -e- Ibrahim (Done)', 'Madd Tabbiee', '3 ayat', 'Dua Ma`thurah', 'Madd Tabbiee', '1 aya', NULL, 2, '2021-06-23 19:43:06', 1),
(109, 31, '2021-06-23', '22:51:11', 27, 'juz amma', 'present', 'Dua on boarding a car', '_', '_', 'Meaning od Dua on boarding a car', '_', '_', NULL, 2, '2021-06-23 22:51:11', 1),
(110, 38, '2021-06-23', '00:29:46', 27, 'qaidah', 'present', 'Dua E_Qunot', '_', '_', 'Dua E_ Qunot', '_', '_', NULL, 2, '2021-06-24 00:29:46', 1),
(111, 74, '2021-06-24', '01:44:39', 25, 'juz amma', 'present', 'none', 'none', 'none', 'rrr', 'rr', 'rrr', NULL, 1, '2021-06-24 01:44:39', 1),
(112, 164, '2021-06-24', '21:45:59', 27, 'juz amma', 'present', 'Na', 'Real hiding', '_', '_', 'Clarity', '_', NULL, 1, '2021-06-24 21:45:59', 1),
(113, 136, '2021-06-24', '21:48:57', 27, 'qaidah', 'present', 'Level 1', '_', '_', 'Thana', '_', '_', NULL, 2, '2021-06-24 21:48:57', 1),
(114, 61, '2021-06-25', '19:13:54', 28, 'juz amma', 'present', 'Dua Salatul janazah for adult man or woman\r\nDua for a boy', '_', '_', 'Dua for a boy', '_', '_', 'She is not active', 1, '2021-06-25 19:13:54', 1),
(115, 71, '2021-06-25', '19:15:18', 40, 'qaidah', 'present', 'thana', 'NA', 'NA', 'NA', 'NA', 'NA', NULL, 2, '2021-06-25 19:15:18', 1),
(116, 73, '2021-06-25', '19:16:44', 40, 'qaidah', 'late', 'THANA', 'NA', 'NA', 'NA', 'NA', 'NA', NULL, 1, '2021-06-25 19:16:44', 1),
(117, 124, '2021-06-25', '19:17:38', 28, 'quran', 'interrupted', 'Dua Salatul janazah for adult man or woman\r\nDua for a boy', '_', '_', 'Dua for a boy for 5 times', '_', '_', NULL, 2, '2021-06-25 19:17:38', 1),
(118, 67, '2021-06-25', '19:18:07', 40, 'qaidah', 'present', 'THANA', 'NA', 'NA', 'NA', 'NA', 'NA', NULL, 2, '2021-06-25 19:18:07', 1),
(119, 138, '2021-06-25', '19:19:10', 27, 'qaidah', 'present', 'First kalema', '_', '_', 'First kalema', '_', '_', NULL, 1, '2021-06-25 19:19:10', 1),
(120, 128, '2021-06-25', '19:19:50', 28, 'quran', 'present', 'Dua Salatul janazah for adult man or woman\r\nDua for a boy', '_', '_', 'Dua Salatul janazah for adult man or woman for 5 times\r\nDua for a boy for 5 times', '_', '_', NULL, 1, '2021-06-25 19:19:50', 1),
(121, 78, '2021-06-25', '19:28:48', 42, 'juz amma', 'present', 'Durood -e- Ibrahim', 'Ghunah', 'one ayah', 'Dua Ma`thurah', 'Qalqalah', 'one ayah', NULL, 2, '2021-06-25 19:28:48', 1),
(122, 59, '2021-06-25', '19:33:11', 42, 'juz amma', 'late', 'Thana', 'Ghunah', 'one ayah', 'Ruku', 'Qalqalah', '1 aya', NULL, 1, '2021-06-25 19:33:11', 1),
(123, 104, '2021-06-25', '20:25:43', 24, 'quran', 'present', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', NULL, 1, '2021-06-25 20:25:43', 1),
(124, 157, '2021-06-25', '21:07:14', 28, 'quran', 'interrupted', '_', 'Mad leen', '-', '_', '_', '_', 'Her recitation is very good .\r\nAnd I asked her and her sister to join from 2 devices because l can\'t see them in one device , but they said they can\'t use 2 devices . \r\nAnd l asked them to sit down on chair and table not bed, but they didn\'t respond.', 2, '2021-06-25 21:07:14', 1),
(125, 158, '2021-06-25', '21:31:10', 28, 'quran', 'interrupted', '_', '_', '_', '_', '_', '_', 'She told me that , she want to recite quran , and she doesn\'t want to read from memorising book.\r\nHer recitation is very good but she reads slowly.', 1, '2021-06-25 21:31:10', 1),
(126, 139, '2021-06-25', '22:13:16', 23, 'qaidah', 'present', 'no', 'no', 'no', 'letters', 'no', 'no', NULL, 1, '2021-06-25 22:13:16', 1),
(127, 70, '2021-06-25', '22:59:57', 47, 'juz amma', 'present', 'short duaa', 'NA', 'NA', 'test on level 3', 'NA', 'NA', NULL, 2, '2021-06-25 22:59:57', 1),
(128, 62, '2021-06-25', '23:01:33', 47, 'juz amma', 'present', 'duaa qnout', 'NA', 'NA', 'duaa qnout', 'NA', 'NA', NULL, 2, '2021-06-25 23:01:33', 1),
(129, 108, '2021-06-25', '03:22:47', 21, 'qaidah', 'present', 'Nope', 'N/A', 'N/A', 'Iman e mujmal', 'N/A', 'N/A', NULL, 1, '2021-06-26 03:22:47', 1),
(130, 109, '2021-06-25', '03:27:51', 21, 'qaidah', 'present', 'Iman.e mujmal', 'Wajib gunnah', 'N/A', 'Iman e nufassal', 'Gunnah practice', 'N/A', NULL, 2, '2021-06-26 03:27:51', 1),
(131, 101, '2021-06-25', '03:30:06', 21, 'juz amma', 'present', 'Janaza dua for boy amd girl', 'Madd tabyi', 'N/A', 'Sura Nas and falak', 'Madd tabyi practice', 'N/A', 'He needs memorising book', 2, '2021-06-26 03:30:06', 1),
(132, 18, '2021-06-24', '03:33:49', 21, 'quran', 'present', 'Dua qunut meanung with all janaza  dua (revision)', 'Qalqalah', 'First 3 ayats from sura fatiha', 'All of level 4( revision)', 'Qalqalah and gunnah', 'Sura fatiha Ayat no And 5', NULL, 2, '2021-06-26 03:33:49', 1),
(133, 19, '2021-06-24', '03:36:24', 21, 'quran', 'present', 'Meaning of dorud', 'Madd tabyi', 'First 3 ayat of sura fatiha', 'Durood\'s meaning', 'Madd tabyi', 'Sura fatiha 3 ayar,looking', NULL, 1, '2021-06-26 03:36:24', 1),
(134, 7, '2021-06-25', '09:38:42', 17, 'qaidah', 'interrupted', 'The meaning of Dua-masura', 'n/a', 'n/a', 'The meaning of Dua-masura', 'n/a', 'n/a', NULL, 1, '2021-06-26 09:46:53', 1),
(135, 8, '2021-06-25', '09:41:49', 17, 'qaidah', 'interrupted', 'Dua-qunut', 'n/a', 'n/a', 'The meaning of dua-masura-first half part', 'n/a', 'n/a', NULL, 1, '2021-06-26 09:46:32', 1),
(136, 9, '2021-06-25', '09:44:34', 17, 'qaidah', 'present', 'Durud-e-ibrahim first 2line', '-', '-', 'Durud-e-ibrahim first 2line', '-', '-', NULL, 1, '2021-06-26 09:44:34', 1),
(137, 121, '2021-06-25', '14:24:55', 29, 'quran', 'present', 'Surat At-takwir.', 'Extract four rules of Noon Skinah and Tanween in Surat At-takwir.', 'Extract four rules of Noon Skinah and Tanween in Surat At-takwir.', 'Memorize Abasa (1:10).', 'Extract different types of Madd in Surat Abasa (1:10).', 'Extract different types of Madd in Surat Abasa (1:10).', '9/10', 2, '2021-06-26 14:24:55', 1),
(138, 110, '2021-06-23', '14:44:00', 29, 'quran', 'present', 'Tashahud without meaning & Durood Ibrahim without meaning & Salam without meaning.', 'Heavy and Light letters.', 'Extract Heavy letters in Surat Al-fajr (1:10).', 'Tashahud\'s meaning & Salam\'s meaning', 'Extract Heavy letters in Surat Al-fajr (1:22).', 'Extract Heavy letters in Surat Al-fajr (1:22).', '8.5/10', 2, '2021-06-26 14:44:00', 1),
(139, 91, '2021-06-23', '14:56:21', 29, 'quran', 'present', 'Tashahud\'s meaning & Durood-Ibrahim without meaning & Salam without meaning.', 'Heavy letters.', 'Extract ten heavy letters in Surat Al-burooj.', 'Durood-Ibrahim\'s meaning & Salam\'s meaning.', 'Extract ten Mushaddad letters in Surat Al-inshiqaq (1:9).', 'Extract ten Mushaddad letters in Surat Al-inshiqaq (1:9).', '8.5/10', 2, '2021-06-26 14:56:21', 1),
(140, 164, '2021-06-25', '16:57:22', 27, 'juz amma', 'present', '_', '_', '_', '_', '_', '_', NULL, 1, '2021-06-26 16:57:22', 1),
(141, 136, '2021-06-25', '17:00:56', 27, 'qaidah', 'present', 'Thana', '_', '_', 'Ruku', '_', '_', NULL, 2, '2021-06-26 17:00:56', 1),
(142, 62, '2021-06-26', '19:02:17', 47, 'juz amma', 'present', 'Dua Qnoot', 'NA', 'NA', 'Duaa for janaza', 'NA', 'NA', NULL, 2, '2021-06-26 19:02:17', 1),
(143, 116, '2021-06-26', '19:03:47', 47, 'quran', 'present', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA', NULL, 1, '2021-06-26 19:03:47', 1),
(144, 9, '2021-06-26', '19:04:12', 17, 'qaidah', 'interrupted', 'Durud-e-ibrahim first 2lines', '-', '-', 'Durud-e-ibrahim first 2lines', '-', '-', NULL, 1, '2021-06-26 19:04:12', 1),
(145, 8, '2021-06-26', '19:05:22', 17, 'qaidah', 'interrupted', 'The meaning of dua masurah', '-', '-', 'The meaning of dua masurah', '-', '-', NULL, 0, '2021-06-26 19:05:22', 1),
(146, 7, '2021-06-26', '19:07:11', 17, 'qaidah', 'present', 'Dua masura meaning', '-', '-', 'Meaning of dua qunut', '-', '-', NULL, 1, '2021-06-26 19:07:11', 1),
(147, 61, '2021-06-26', '19:08:13', 28, 'juz amma', 'interrupted', 'Dua for a boy \r\nDua for a girl.', 'Maad leen', '_', 'Dua for a boy and a girl for 7 times.', '_', '_', NULL, 1, '2021-06-26 19:08:13', 1),
(148, 128, '2021-06-26', '19:10:22', 28, 'quran', 'present', 'Dua for a boy \r\nDua for a girl', 'Maad leen', '_', 'Dua for a boy and a girl for 7 times', '_', '_', NULL, 1, '2021-06-26 19:10:22', 1),
(149, 124, '2021-06-26', '19:12:19', 28, 'quran', 'present', 'Dua for a boy \r\nDua for a girl', 'Maad leen', '_', 'Dua for a boy and a girl for 7 times', '_', '_', NULL, 2, '2021-06-26 19:12:19', 1),
(150, 136, '2021-06-26', '23:50:15', 27, 'qaidah', 'present', 'Ruku', '_', '_', 'Tahmeed and Tasmee', '_', '_', NULL, 2, '2021-06-26 23:50:15', 1),
(151, 164, '2021-06-26', '23:52:45', 27, 'juz amma', 'present', '_', 'Real hiding', 'Letters of real hiding', 'dua before sleeping', 'Real hiding', '_', NULL, 1, '2021-06-26 23:52:45', 1),
(152, 108, '2021-06-26', '01:05:01', 21, 'qaidah', 'present', 'Fail', 'N/A', 'N/A', 'Iamn e muzmal', 'N/A', '3 boxes from page 8', NULL, 1, '2021-06-27 01:05:01', 1),
(153, 101, '2021-06-26', '01:07:28', 21, 'juz amma', 'present', 'Sura naas, falak,ikhlas', 'Madd tabyi', 'N/A', 'Sura Lahab,Sura nasr,Sura kafirun', 'Madd tabyi practice', '3 ayat from.naziaat.', NULL, 2, '2021-06-27 01:07:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sabak_report`
--

CREATE TABLE `sabak_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `uploader_id` int(10) UNSIGNED NOT NULL,
  `report_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `page_or_sura` varchar(191) NOT NULL,
  `from` int(11) NOT NULL COMMENT 'ayat/box',
  `to` int(11) NOT NULL COMMENT 'ayat/box',
  `type` varchar(30) NOT NULL DEFAULT 'current_sabak' COMMENT 'current_sabak/homework'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sabak_report`
--

INSERT INTO `sabak_report` (`id`, `uploader_id`, `report_id`, `student_id`, `page_or_sura`, `from`, `to`, `type`) VALUES
(31, 17, 1, 11, '1', 25, 35, 'homework'),
(28, 17, 1, 11, '2', 1, 20, 'current_sabak'),
(29, 17, 1, 11, '2', 21, 75, 'homework'),
(30, 17, 1, 11, '1', 15, 25, 'homework'),
(27, 17, 1, 11, '1', 20, 29, 'current_sabak'),
(32, 17, 1, 11, '2', 76, 80, 'homework'),
(35, 17, 2, 11, 'Al-fatiha', 1, 8, 'current_sabak'),
(36, 17, 2, 11, 'Al-baqara', 1, 5, 'current_sabak'),
(37, 17, 2, 11, 'Al-baqara', 6, 10, 'homework'),
(38, 17, 2, 11, 'Al-fatiha', 1, 6, 'homework'),
(39, 17, 3, 8, '106', 3, 15, 'current_sabak'),
(40, 17, 3, 8, '106', 15, 24, 'homework'),
(41, 17, 4, 7, '119', 2, 13, 'current_sabak'),
(42, 17, 4, 7, '119', 14, 23, 'homework'),
(43, 17, 5, 9, '71', 46, 52, 'current_sabak'),
(44, 17, 5, 9, '71', 53, 55, 'homework'),
(45, 17, 6, 8, '106', 15, 24, 'current_sabak'),
(46, 17, 6, 8, '106', 25, 27, 'homework'),
(47, 17, 6, 8, '107', 1, 6, 'homework'),
(48, 17, 7, 7, '119', 14, 23, 'current_sabak'),
(49, 17, 7, 7, '119', 25, 29, 'homework'),
(50, 17, 7, 7, '120', 1, 6, 'homework'),
(51, 17, 8, 8, '106', 25, 27, 'current_sabak'),
(52, 17, 8, 8, '107', 1, 6, 'current_sabak'),
(53, 17, 8, 8, '107', 6, 9, 'homework'),
(54, 17, 9, 7, '119', 25, 29, 'current_sabak'),
(55, 17, 9, 7, '120', 1, 6, 'current_sabak'),
(56, 17, 9, 7, '120', 6, 9, 'homework'),
(57, 17, 10, 7, '72', 1, 13, 'current_sabak'),
(58, 17, 10, 7, '72', 14, 18, 'homework'),
(59, 16, 11, 6, '50', 10, 20, 'current_sabak'),
(60, 16, 11, 6, '10', 21, 30, 'homework'),
(61, 39, 12, 5, '67', 5, 18, 'current_sabak'),
(62, 39, 12, 5, '45', 10, 20, 'homework'),
(63, 17, 13, 26, '50', 20, 30, 'current_sabak'),
(64, 17, 13, 26, '151', 20, 30, 'homework'),
(65, 38, 14, 116, 'Al-hadid', 25, 29, 'current_sabak'),
(66, 38, 14, 116, 'Al-mujadilah', 1, 8, 'homework'),
(67, 10, 15, 8, '118', 1, 5, 'current_sabak'),
(68, 10, 15, 8, '118', 8, 16, 'homework'),
(81, 10, 16, 177, '129', 1, 5, 'current_sabak'),
(71, 28, 17, 124, 'Al-qaria', 1, 11, 'current_sabak'),
(72, 28, 17, 124, 'Al-qaria', 1, 11, 'homework'),
(73, 22, 18, 55, '120', 1, 18, 'current_sabak'),
(74, 22, 18, 55, '121', 1, 20, 'homework'),
(75, 22, 19, 69, '143', 1, 13, 'current_sabak'),
(76, 22, 19, 69, '144', 1, 7, 'homework'),
(77, 28, 20, 61, 'Al-alaq', 1, 14, 'current_sabak'),
(78, 28, 20, 61, 'Al-alaq', 1, 14, 'homework'),
(79, 22, 21, 56, '129', 1, 18, 'current_sabak'),
(80, 22, 21, 56, '130', 1, 18, 'homework'),
(82, 10, 16, 177, '129', 6, 18, 'homework'),
(83, 42, 22, 78, 'Al-inshiqaq', 1, 15, 'current_sabak'),
(84, 42, 22, 78, 'Al-inshiqaq', 16, 25, 'homework'),
(92, 42, 23, 177, 'Al-falaq', 1, 5, 'homework'),
(87, 42, 24, 60, 'Al-falaq', 1, 5, 'current_sabak'),
(88, 42, 24, 60, 'Al-falaq', 1, 5, 'homework'),
(91, 42, 23, 177, 'Al-falaq', 1, 5, 'current_sabak'),
(93, 42, 25, 59, 'Al-falaq', 1, 5, 'current_sabak'),
(94, 42, 25, 59, 'Al-falaq', 1, 5, 'homework'),
(95, 21, 26, 109, '15', 1, 20, 'current_sabak'),
(96, 21, 26, 109, '15', 21, 29, 'homework'),
(97, 21, 27, 108, '8', 2, 2, 'current_sabak'),
(98, 21, 27, 108, '8', 2, 2, 'homework'),
(99, 21, 28, 101, 'Abasa', 39, 42, 'current_sabak'),
(100, 21, 28, 101, 'Abasa', 1, 42, 'homework'),
(101, 47, 29, 62, 'Alkadr', 1, 5, 'current_sabak'),
(102, 47, 29, 62, 'Albaina', 1, 8, 'homework'),
(103, 47, 30, 70, 'Altarek', 1, 17, 'current_sabak'),
(104, 47, 30, 70, 'Al-ala', 1, 19, 'homework'),
(105, 28, 31, 118, 'Al-dukhan', 1, 11, 'current_sabak'),
(106, 28, 31, 118, 'Al-dukhan', 1, 11, 'homework'),
(107, 28, 32, 119, 'Al-araf', 32, 33, 'current_sabak'),
(108, 28, 32, 119, 'Al-araf', 32, 33, 'homework'),
(109, 28, 33, 120, 'Al-Qari\'a, Al-Adiyat and alzalzalih', 1, 11, 'current_sabak'),
(110, 28, 33, 120, 'Al-Qari\'a, Al-Adiyat and alzalzalih', 1, 11, 'homework'),
(111, 18, 34, 49, 'NA', 11, 1, 'current_sabak'),
(112, 18, 34, 49, 'NA', 1, 1, 'homework'),
(113, 24, 35, 66, 'At-Takwir', 1, 10, 'current_sabak'),
(114, 24, 35, 66, 'At-Takwir', 1, 10, 'homework'),
(115, 24, 36, 65, 'An-Najm', 1, 8, 'current_sabak'),
(116, 24, 36, 65, 'An-Najm', 1, 8, 'homework'),
(117, 26, 37, 131, 'Al-zalzala', 1, 8, 'current_sabak'),
(118, 26, 37, 131, 'Al-bayyina', 1, 3, 'current_sabak'),
(119, 26, 37, 131, 'Al-bayyina', 3, 6, 'homework'),
(120, 26, 38, 98, 'Al-anbiya', 50, 54, 'current_sabak'),
(121, 26, 38, 98, 'Al-anbiya', 54, 57, 'homework'),
(122, 29, 39, 121, 'At-tahrim', 5, 9, 'current_sabak'),
(123, 29, 39, 121, 'At-takwir', 19, 29, 'homework'),
(124, 17, 40, 5, '93', 16, 21, 'current_sabak'),
(125, 17, 40, 5, '93', 22, 44, 'homework'),
(126, 17, 41, 4, '85', 11, 19, 'current_sabak'),
(127, 17, 41, 4, '85', 20, 36, 'homework'),
(128, 17, 42, 6, '32', 9, 21, 'current_sabak'),
(129, 17, 42, 6, '33', 1, 5, 'current_sabak'),
(130, 17, 42, 6, '33', 6, 15, 'homework'),
(131, 22, 43, 113, '106', 1, 27, 'current_sabak'),
(132, 22, 43, 113, '107', 1, 7, 'current_sabak'),
(133, 22, 43, 113, '107', 7, 12, 'homework'),
(134, 22, 44, 135, '72', 1, 36, 'current_sabak'),
(135, 22, 44, 135, '77', 30, 61, 'current_sabak'),
(136, 22, 44, 135, '78', 30, 45, 'current_sabak'),
(137, 22, 44, 135, '78', 46, 61, 'homework'),
(138, 28, 45, 40, 'Al-ala', 1, 19, 'current_sabak'),
(139, 28, 45, 40, 'Al-ala', 12, 19, 'homework'),
(140, 22, 46, 129, '77', 46, 61, 'current_sabak'),
(141, 22, 46, 129, '78', 30, 45, 'current_sabak'),
(142, 22, 46, 129, '78', 46, 61, 'homework'),
(143, 36, 47, 94, 'Al-baqara', 1, 16, 'current_sabak'),
(144, 36, 47, 94, 'An-naba', 1, 40, 'homework'),
(145, 28, 48, 36, 'Al-waqia', 77, 90, 'current_sabak'),
(146, 28, 48, 36, 'Al-waqia', 86, 90, 'homework'),
(147, 36, 49, 112, 'An-nas', 1, 8, 'current_sabak'),
(148, 36, 49, 112, 'Al-falaq', 1, 5, 'homework'),
(149, 42, 50, 51, 'Al-burooj', 1, 10, 'current_sabak'),
(150, 42, 50, 51, 'Al-burooj', 11, 22, 'homework'),
(151, 28, 51, 37, 'Al-infitar', 1, 17, 'current_sabak'),
(152, 28, 51, 37, 'Al-infitar', 9, 17, 'homework'),
(153, 42, 52, 27, 'Al-fajr', 1, 17, 'current_sabak'),
(154, 42, 52, 27, 'Al-fajr', 17, 30, 'homework'),
(155, 28, 53, 45, 'Al-lail', 1, 7, 'current_sabak'),
(156, 28, 53, 45, 'Al-lail', 1, 7, 'homework'),
(157, 42, 54, 126, 'AL-Baqarah', 102, 106, 'current_sabak'),
(158, 42, 54, 126, 'AL-Baqarah', 106, 112, 'homework'),
(159, 29, 55, 91, 'Al-burooj', 6, 11, 'current_sabak'),
(160, 29, 55, 91, 'Al-burooj', 6, 11, 'homework'),
(161, 29, 56, 25, 'Al-burooj', 6, 11, 'current_sabak'),
(162, 29, 56, 25, 'Al-burooj', 6, 11, 'homework'),
(163, 29, 57, 110, 'Al-balad & Al-fajr (1:10)', 1, 10, 'current_sabak'),
(164, 29, 57, 110, 'Al-fajr', 1, 10, 'homework'),
(165, 21, 58, 18, 'Al-baqara', 120, 121, 'current_sabak'),
(166, 21, 58, 18, 'Al-baqara', 121, 123, 'homework'),
(167, 21, 59, 19, 'Al-baqara', 32, 32, 'current_sabak'),
(168, 21, 59, 19, 'Al-baqara', 32, 32, 'homework'),
(169, 21, 60, 28, 'At-takwir', 13, 23, 'current_sabak'),
(170, 21, 60, 28, 'At-takwir', 24, 27, 'homework'),
(171, 26, 61, 52, 'Al-baqara', 112, 114, 'current_sabak'),
(172, 26, 61, 52, 'Al-baqara', 114, 116, 'homework'),
(173, 26, 62, 131, 'Al-bayyina', 1, 5, 'current_sabak'),
(174, 26, 62, 131, 'Al-bayyina', 5, 8, 'homework'),
(175, 26, 63, 150, 'Al-burooj', 8, 13, 'current_sabak'),
(176, 26, 63, 150, 'Al-burooj', 13, 19, 'homework'),
(189, 40, 64, 177, '107', 1, 7, 'current_sabak'),
(188, 40, 64, 177, '106', 19, 27, 'current_sabak'),
(186, 40, 65, 177, '47', 11, 20, 'homework'),
(185, 40, 65, 177, '47', 1, 10, 'current_sabak'),
(184, 40, 65, 177, '46', 1, 15, 'current_sabak'),
(187, 40, 65, 177, '48', 1, 15, 'homework'),
(190, 40, 64, 177, '107', 8, 12, 'homework'),
(191, 40, 66, 111, '81', 30, 53, 'current_sabak'),
(192, 40, 66, 111, '82', 30, 41, 'homework'),
(193, 10, 67, 4, '85', 21, 30, 'current_sabak'),
(194, 10, 67, 4, '85', 31, 36, 'homework'),
(195, 22, 68, 129, '78', 46, 61, 'current_sabak'),
(196, 22, 68, 129, '79', 30, 61, 'current_sabak'),
(197, 22, 68, 129, '80', 1, 36, 'homework'),
(198, 10, 69, 5, '93', 22, 36, 'current_sabak'),
(199, 10, 69, 5, '93', 37, 44, 'homework'),
(200, 22, 70, 135, '78', 46, 61, 'current_sabak'),
(201, 22, 70, 135, '79', 30, 61, 'current_sabak'),
(202, 22, 70, 135, '80', 1, 36, 'homework'),
(203, 10, 71, 6, '33', 6, 23, 'current_sabak'),
(204, 10, 71, 6, '33', 23, 25, 'homework'),
(205, 10, 71, 6, '34', 1, 5, 'homework'),
(206, 22, 72, 113, '107', 7, 12, 'current_sabak'),
(207, 22, 72, 113, '112', 1, 18, 'current_sabak'),
(208, 22, 72, 113, '112', 10, 18, 'homework'),
(209, 28, 73, 36, 'Al-waqia', 77, 96, 'current_sabak'),
(210, 28, 73, 36, 'Al-waqia', 77, 96, 'homework'),
(211, 28, 74, 37, 'Al-infitar and At-Takwir', 1, 19, 'current_sabak'),
(212, 28, 74, 37, 'At-takwir', 1, 9, 'homework'),
(213, 28, 75, 40, 'Al-ala and At_tarek', 1, 19, 'current_sabak'),
(214, 28, 75, 40, 'At-tariq', 1, 6, 'homework'),
(215, 42, 76, 27, 'Al-fajr', 15, 24, 'current_sabak'),
(216, 42, 76, 27, 'Al-fajr', 24, 30, 'homework'),
(217, 42, 77, 51, 'Al-burooj', 10, 22, 'current_sabak'),
(218, 42, 77, 51, 'Al-inshiqaq', 1, 10, 'homework'),
(219, 42, 78, 126, 'Al-Baqarah', 106, 112, 'current_sabak'),
(220, 42, 78, 126, 'Al-Baqarah', 113, 118, 'homework'),
(221, 40, 79, 85, '107', 5, 12, 'current_sabak'),
(222, 40, 79, 85, '106', 1, 27, 'homework'),
(223, 40, 79, 85, '107', 1, 12, 'homework'),
(224, 40, 80, 117, '48', 1, 15, 'current_sabak'),
(225, 40, 80, 117, '49', 1, 10, 'current_sabak'),
(226, 40, 80, 117, '49', 6, 15, 'homework'),
(227, 40, 80, 117, '50', 1, 15, 'homework'),
(236, 29, 81, 177, 'Al-fajr', 11, 22, 'current_sabak'),
(230, 40, 82, 111, '82', 1, 41, 'current_sabak'),
(231, 40, 82, 111, '82', 42, 53, 'homework'),
(232, 29, 83, 25, 'Al-burooj', 11, 22, 'current_sabak'),
(233, 29, 83, 25, 'Al-burooj', 11, 22, 'homework'),
(234, 29, 84, 91, 'Al-burooj', 11, 22, 'current_sabak'),
(235, 29, 84, 91, 'Al-burooj', 11, 22, 'homework'),
(237, 29, 81, 177, 'Al-fajr', 11, 22, 'homework'),
(238, 21, 85, 18, 'Al-baqara', 121, 123, 'current_sabak'),
(239, 21, 85, 18, 'Al-baqara', 124, 125, 'homework'),
(240, 21, 86, 28, 'At-takwir', 24, 29, 'current_sabak'),
(241, 21, 86, 28, 'At-takwir', 1, 15, 'homework'),
(242, 21, 87, 19, 'Al-baqara', 32, 32, 'current_sabak'),
(243, 21, 87, 19, 'Al-baqara', 33, 33, 'homework'),
(244, 26, 88, 150, 'Al-burooj', 15, 22, 'current_sabak'),
(245, 26, 88, 150, 'Al-inshiqaq', 1, 8, 'homework'),
(246, 26, 89, 52, 'Al-baqara', 113, 117, 'current_sabak'),
(247, 26, 89, 52, 'Al-baqara', 117, 120, 'homework'),
(248, 26, 90, 131, 'Al-bayyina', 6, 8, 'current_sabak'),
(249, 26, 90, 131, 'Al-qadr', 1, 5, 'homework'),
(250, 29, 91, 110, 'Al-fajr', 11, 22, 'current_sabak'),
(251, 29, 91, 110, 'Al-fajr', 11, 22, 'homework'),
(252, 47, 92, 15, 'alsharh', 1, 8, 'current_sabak'),
(253, 47, 92, 15, 'aldoha', 1, 11, 'current_sabak'),
(254, 47, 92, 15, 'allail', 1, 14, 'homework'),
(255, 47, 93, 84, 'Albakra', 82, 87, 'current_sabak'),
(256, 47, 93, 84, 'Albakara', 87, 105, 'homework'),
(257, 47, 94, 95, '54', 1, 12, 'current_sabak'),
(258, 47, 94, 95, '55', 1, 16, 'current_sabak'),
(259, 47, 94, 95, '57', 1, 32, 'homework'),
(260, 40, 95, 85, '112', 1, 12, 'current_sabak'),
(261, 40, 95, 85, '112', 13, 21, 'homework'),
(262, 40, 95, 85, '113', 1, 16, 'homework'),
(263, 28, 96, 36, 'Al-waqia , an nasr, al kaferon and al kawther', 77, 96, 'current_sabak'),
(264, 28, 96, 36, 'Al-kauther , al kaferoon and an nasrr', 1, 3, 'homework'),
(265, 40, 97, 111, '82', 42, 53, 'current_sabak'),
(266, 40, 97, 111, '83', 1, 33, 'current_sabak'),
(267, 40, 97, 111, '83', 34, 53, 'homework'),
(268, 47, 98, 43, '54', 1, 12, 'current_sabak'),
(269, 47, 98, 43, '55', 1, 16, 'current_sabak'),
(270, 47, 98, 43, '57', 1, 32, 'homework'),
(271, 10, 99, 4, '85', 31, 36, 'current_sabak'),
(272, 10, 99, 4, '86', 1, 7, 'current_sabak'),
(273, 10, 99, 4, '86', 7, 33, 'homework'),
(274, 10, 100, 5, '93', 37, 44, 'current_sabak'),
(275, 10, 100, 5, '94', 1, 7, 'current_sabak'),
(276, 10, 100, 5, '94', 8, 16, 'homework'),
(277, 28, 101, 37, 'At-takwir', 1, 23, 'current_sabak'),
(278, 28, 101, 37, 'At-takwir', 10, 23, 'homework'),
(279, 47, 102, 89, '62', 1, 65, 'current_sabak'),
(280, 47, 102, 89, '63', 1, 65, 'homework'),
(281, 28, 103, 40, 'At-tariq', 1, 17, 'current_sabak'),
(282, 28, 103, 40, 'At-tariq', 7, 17, 'homework'),
(283, 10, 104, 6, '33', 24, 25, 'current_sabak'),
(284, 10, 104, 6, '34', 1, 11, 'current_sabak'),
(285, 10, 104, 6, '34', 12, 20, 'homework'),
(286, 40, 105, 140, '24', 16, 30, 'current_sabak'),
(287, 40, 105, 140, '25', 1, 45, 'current_sabak'),
(288, 40, 105, 140, '25', 46, 90, 'homework'),
(289, 42, 106, 27, 'Al-fajr', 19, 30, 'current_sabak'),
(290, 42, 106, 27, 'Al-ghashiya', 1, 16, 'homework'),
(291, 42, 107, 126, 'Al-Baqarah', 112, 118, 'current_sabak'),
(292, 42, 107, 126, 'AL-Baqarah', 118, 123, 'homework'),
(293, 42, 108, 51, 'Al-inshiqaq', 1, 10, 'current_sabak'),
(294, 42, 108, 51, 'Al-inshiqaq', 10, 25, 'homework'),
(295, 27, 109, 31, 'Al-ikhlas', 1, 4, 'current_sabak'),
(296, 27, 109, 31, 'Al-masadd', 1, 4, 'homework'),
(297, 27, 110, 38, '99', 1, 30, 'current_sabak'),
(298, 27, 110, 38, '100', 1, 15, 'homework'),
(299, 25, 111, 74, 'Al-ikhlas', 1, 5, 'current_sabak'),
(300, 25, 111, 74, 'Abasa', 1, 5, 'homework'),
(301, 27, 112, 164, 'Al-balad', 1, 8, 'current_sabak'),
(302, 27, 112, 164, 'Al-balad', 4, 10, 'homework'),
(303, 27, 113, 136, '53', 1, 20, 'current_sabak'),
(304, 27, 113, 136, '54', 1, 12, 'homework'),
(305, 28, 114, 61, 'Al-alaq', 1, 19, 'current_sabak'),
(306, 28, 114, 61, 'Al-alaq', 14, 19, 'homework'),
(307, 40, 115, 71, '40', 1, 21, 'current_sabak'),
(308, 40, 115, 71, '40', 22, 27, 'homework'),
(309, 40, 116, 73, '63', 42, 65, 'current_sabak'),
(310, 40, 116, 73, '63', 1, 65, 'homework'),
(311, 28, 117, 124, 'Al-qaria and al adiyat', 1, 11, 'current_sabak'),
(312, 28, 117, 124, 'Al-adiyat', 1, 11, 'homework'),
(313, 40, 118, 67, '77', 46, 61, 'current_sabak'),
(314, 40, 118, 67, '77', 1, 61, 'homework'),
(315, 27, 119, 138, '20', 10, 23, 'current_sabak'),
(316, 27, 119, 138, '20', 1, 23, 'homework'),
(317, 28, 120, 128, 'Al-qadr and al alaq', 1, 10, 'current_sabak'),
(318, 28, 120, 128, 'Al-alaq', 1, 10, 'homework'),
(319, 42, 121, 78, 'Al-mutaffifin', 1, 22, 'current_sabak'),
(320, 42, 121, 78, 'Al-mutaffifin', 22, 36, 'homework'),
(321, 42, 122, 59, 'Al-ikhlas', 1, 4, 'current_sabak'),
(322, 42, 122, 59, 'Al-masadd', 1, 5, 'homework'),
(323, 24, 123, 104, 'Al-balad', 1, 11, 'current_sabak'),
(324, 24, 123, 104, 'Al-balad', 12, 20, 'homework'),
(325, 28, 124, 157, 'Al-fajr', 1, 30, 'current_sabak'),
(326, 28, 124, 157, 'Al-fajr', 1, 30, 'homework'),
(327, 28, 125, 158, 'Aal-imran', 133, 140, 'current_sabak'),
(328, 28, 125, 158, 'Aal-imran', 133, 140, 'homework'),
(329, 23, 126, 139, '1', 1, 1, 'current_sabak'),
(330, 23, 126, 139, '1', 1, 1, 'homework'),
(331, 47, 127, 70, 'Al borog', 1, 11, 'current_sabak'),
(332, 47, 127, 70, 'Alborog', 11, 13, 'homework'),
(333, 47, 128, 62, 'Al-alaq', 1, 8, 'current_sabak'),
(334, 47, 128, 62, 'Al-alaq', 8, 10, 'homework'),
(335, 21, 129, 108, '8', 37, 42, 'current_sabak'),
(336, 21, 129, 108, '8', 43, 48, 'homework'),
(337, 21, 130, 109, '16', 1, 42, 'current_sabak'),
(338, 21, 130, 109, '16', 43, 60, 'homework'),
(339, 21, 131, 101, 'Abasa', 11, 22, 'current_sabak'),
(340, 21, 131, 101, 'Abasa', 23, 33, 'homework'),
(341, 21, 132, 18, 'Al-baqara', 123, 125, 'current_sabak'),
(342, 21, 132, 18, 'Al-baqara', 125, 126, 'homework'),
(343, 21, 133, 19, 'Al-baqara', 33, 33, 'current_sabak'),
(344, 21, 133, 19, 'Al-baqara', 34, 34, 'homework'),
(353, 17, 134, 7, '129', 6, 9, 'current_sabak'),
(351, 17, 135, 8, '118', 8, 8, 'current_sabak'),
(349, 17, 136, 9, '79', 30, 39, 'current_sabak'),
(350, 17, 136, 9, '79', 49, 61, 'homework'),
(352, 17, 135, 8, '118', 8, 16, 'homework'),
(354, 17, 134, 7, '129', 10, 18, 'homework'),
(355, 29, 137, 121, 'At-tahrim', 5, 9, 'current_sabak'),
(356, 29, 137, 121, 'At-tahrim', 10, 12, 'homework'),
(357, 29, 138, 110, 'Al-fajr', 11, 22, 'current_sabak'),
(358, 29, 138, 110, 'Al-fajr', 23, 30, 'homework'),
(359, 29, 139, 91, 'Al-burooj', 12, 22, 'current_sabak'),
(360, 29, 139, 91, 'Al-inshiqaq', 1, 9, 'homework'),
(361, 27, 140, 164, 'Al-balad', 1, 20, 'current_sabak'),
(362, 27, 140, 164, 'Al-balad', 1, 20, 'homework'),
(363, 27, 141, 136, '58', 1, 27, 'current_sabak'),
(364, 27, 141, 136, '57', 1, 32, 'homework'),
(365, 47, 142, 62, 'Al-alaq', 1, 8, 'current_sabak'),
(366, 47, 142, 62, 'Al doha', 1, 11, 'homework'),
(367, 47, 143, 116, 'Mogadla', 21, 22, 'current_sabak'),
(368, 47, 143, 116, 'Al hashr', 1, 3, 'homework'),
(369, 17, 144, 9, '79', 40, 61, 'current_sabak'),
(370, 17, 144, 9, '80', 1, 12, 'homework'),
(371, 17, 145, 8, '118', 8, 8, 'current_sabak'),
(372, 17, 145, 8, '118', 8, 10, 'homework'),
(373, 17, 146, 7, '129', 10, 14, 'current_sabak'),
(374, 17, 146, 7, '129', 15, 18, 'homework'),
(375, 28, 147, 61, 'Al-alaq', 1, 19, 'current_sabak'),
(376, 28, 147, 61, 'Al-alaq', 1, 19, 'homework'),
(377, 28, 148, 128, 'Al-alaq', 1, 14, 'current_sabak'),
(378, 28, 148, 128, 'Al-alaq', 1, 14, 'homework'),
(379, 28, 149, 124, 'Al-adiyat and al zalzalh', 1, 5, 'current_sabak'),
(380, 28, 149, 124, 'Al-zalzala', 1, 5, 'homework'),
(381, 27, 150, 136, '63', 1, 65, 'current_sabak'),
(382, 27, 150, 136, '63', 1, 65, 'homework'),
(383, 27, 151, 164, 'Al-fajr', 1, 5, 'current_sabak'),
(384, 27, 151, 164, 'At-takathur', 1, 8, 'homework'),
(385, 21, 152, 108, '8', 49, 54, 'current_sabak'),
(386, 21, 152, 108, '8', 55, 61, 'homework'),
(387, 21, 153, 101, 'Abasa', 24, 42, 'current_sabak'),
(388, 21, 153, 101, 'An-naziat', 1, 8, 'homework');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anchor_text` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploader_id` int(11) DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `caption`, `link`, `anchor_text`, `description`, `uploader_id`, `path`, `status`, `created_at`, `updated_at`, `position`) VALUES
(40, 'Stay Home Stay Safe', 'https://www.google.com/', 'Google', 'Stay Home Stay Safe', 10, '1604087667.webp', 1, '2020-10-31 01:54:27', '2020-10-31 01:54:27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `uploader_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `image_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `uploader_id`, `name`, `slug`, `type`, `detail`, `status`, `created_at`, `updated_at`, `image_name`) VALUES
(1, 10, 'Test Student', 'test-student', 'qaidah', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 0, '2021-06-17', '2021-06-17', '1623879933.webp'),
(2, 10, 'Student 2', 'student-2', 'juz amma', '<p>sdfsd df dsf sdf sf sdfsdf</p>', 0, '2021-06-17', '2021-06-17', '1623883051.webp'),
(3, 10, 'Student 3', 'student-3', 'quran', '<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.&nbsp;<a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum\">Wikipedia</a></p>', 0, '2021-06-17', '2021-06-17', '1623890842.webp'),
(4, 17, 'Adnan Khan', 'adnan-khan', 'qaidah', '<p>Nothing.</p>', 1, '2021-06-19', '2021-06-19', '1624053953.webp'),
(5, 17, 'Ayman Alam', 'ayman-alam', 'qaidah', NULL, 1, '2021-06-19', '2021-06-19', NULL),
(6, 17, 'Maria Begum', 'maria-begum', 'qaidah', NULL, 1, '2021-06-19', '2021-06-19', NULL),
(7, 17, 'Aariz', 'aariz', 'qaidah', NULL, 1, '2021-06-19', '2021-06-19', NULL),
(8, 17, 'Ayyoub', 'ayyoub', 'qaidah', NULL, 1, '2021-06-19', '2021-06-19', NULL),
(9, 17, 'Jerin Ahmed', 'jerin-ahmed', 'qaidah', NULL, 1, '2021-06-19', '2021-06-19', NULL),
(10, 17, 'Quran Student', 'quran-student', 'quran', NULL, 1, '2021-06-19', '2021-06-19', NULL),
(11, 17, 'Juz Amma Student', 'juz-amma-student', 'juz amma', NULL, 1, '2021-06-19', '2021-06-19', NULL),
(12, 16, 'Maria Begum', 'maria-begum', 'qaidah', NULL, 1, '2021-06-19', '2021-06-19', NULL),
(13, 17, 'MARIAM CHOWDHURY', 'mariam-chowdhury', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(14, 17, 'MARIAM CHOWDHURY', 'mariam-chowdhury', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(15, 17, 'SUMAYA CHOWDHURY', 'sumaya-chowdhury', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(16, 17, 'TAHSIN BIN NASIR', 'tahsin-bin-nasir', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(17, 17, 'ZENAN KHAN DAKER', 'zenan-khan-daker', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(18, 17, 'JASHAN KHAN DAKER', 'jashan-khan-daker', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(19, 17, 'ZAYYNAN HAYDER', 'zayynan-hayder', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(20, 17, 'AQIB AHMED', 'aqib-ahmed', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(21, 17, 'MARIA AHMED', 'maria-ahmed', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(22, 17, 'TANISHA AHMED', 'tanisha-ahmed', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(23, 17, 'NAISHA MIAH', 'naisha-miah', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(24, 17, 'TAYEBA MIAH', 'tayeba-miah', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(25, 17, 'MAHADI MOHAMMED', 'mahadi-mohammed', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(26, 17, 'MAHIM MOHAMMED', 'mahim-mohammed', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(27, 17, 'RAHIM MOHAMMED', 'rahim-mohammed', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(28, 17, 'OPURBO HOSSAIN', 'opurbo-hossain', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(29, 17, 'HAMJA ULLAH', 'hamja-ullah', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(30, 17, 'RAUDA CHOWDHURY', 'rauda-chowdhury', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(31, 17, 'AYAN ALAM', 'ayan-alam', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(32, 17, 'NAFEEZ RAHMAN', 'nafeez-rahman', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(33, 17, 'RAEID', 'raeid', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(34, 17, 'AYMAN ALAM', 'ayman-alam', 'qaidah', NULL, 0, '2021-06-20', '2021-06-20', NULL),
(35, 17, 'MARYAM ELGORBA', 'maryam-elgorba', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(36, 17, 'RIHAN ISLAM', 'rihan-islam', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(37, 17, 'NUSAIBA', 'nusaiba', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(38, 17, 'NUNAIRA', 'nunaira', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(39, 17, 'MARIA BEGUM', 'maria-begum', 'qaidah', NULL, 0, '2021-06-20', '2021-06-20', NULL),
(40, 17, 'HUMAYARA KHAN', 'humayara-khan', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(41, 17, 'ADNAN KHAN', 'adnan-khan', 'qaidah', NULL, 0, '2021-06-20', '2021-06-20', NULL),
(42, 17, 'HUSSAIN LUDHI', 'hussain-ludhi', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(43, 17, 'NAJAH ALI', 'najah-ali', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(44, 17, 'MUHTADY SHARKER', 'muhtady-sharker', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(45, 17, 'RUFAYOHA SHARKER', 'rufayoha-sharker', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(46, 17, 'ARIF ALI MEAH', 'arif-ali-meah', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(47, 17, 'TASNIA KHAN', 'tasnia-khan', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(48, 17, 'LAMHA ISMAIL', 'lamha-ismail', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(49, 17, 'SAMI N.ZAMAN', 'sami-n.zaman', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(50, 17, 'RAMISA TABASSUM', 'ramisa-tabassum', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(51, 17, 'ISMAEEL IBN AMEEN', 'ismaeel-ibn-ameen', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(52, 17, 'HABIB RUHAN', 'habib-ruhan', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(53, 17, 'RAFI UDDIN', 'rafi-uddin', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(54, 17, 'RAJ ALI', 'raj-ali', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(55, 17, 'RAFIN ALI', 'rafin-ali', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(56, 17, 'FILZA SYEDA', 'filza-syeda', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(57, 17, 'TAMIM RANA', 'tamim-rana', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(58, 17, 'RAHIM ALI MIAZINABIL', 'rahim-ali-miazinabil', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(59, 17, 'SAMIRA KHANOM', 'samira-khanom', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(60, 17, 'SANGIDA KHANOM', 'sangida-khanom', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(61, 17, 'NEWCI AZHAR', 'newci-azhar', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(62, 17, 'NUSRAT AZHAR', 'nusrat-azhar', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(63, 17, 'NOURIN SAKI', 'nourin-saki', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(64, 17, 'TASNIM SAKI', 'tasnim-saki', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(65, 17, 'SAMEERA CHOWDHURY', 'sameera-chowdhury', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(66, 17, 'YUSUF  CHOWDHURY', 'yusuf--chowdhury', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(67, 17, 'OMERA ZAMAN', 'omera-zaman', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(68, 17, 'JERIN AHMED', 'jerin-ahmed', 'qaidah', NULL, 0, '2021-06-20', '2021-06-20', NULL),
(69, 17, 'WAFI AN NUR', 'wafi-an-nur', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(70, 17, 'RAFSAN RAMIN', 'rafsan-ramin', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(71, 17, 'MUNTAHA', 'muntaha', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(72, 17, 'AYYUB', 'ayyub', 'qaidah', NULL, 0, '2021-06-20', '2021-06-20', NULL),
(73, 17, 'AREEB', 'areeb', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(74, 17, 'ANIQA', 'aniqa', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(75, 17, 'AARIZ', 'aariz', 'qaidah', NULL, 0, '2021-06-20', '2021-06-20', NULL),
(76, 17, 'MAIDA', 'maida', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(77, 17, 'MARIAM', 'mariam', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(78, 17, 'ARISHA HOSSAIN', 'arisha-hossain', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(79, 17, 'SAFWAN', 'safwan', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(80, 17, 'SAFIA', 'safia', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(81, 17, 'SAMIR SHIKDER', 'samir-shikder', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(82, 17, 'MINHA SHAKH', 'minha-shakh', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(83, 17, 'ARMAN HUSSAIN', 'arman-hussain', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(84, 17, 'SABIYA HUSSAIN', 'sabiya-hussain', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(85, 17, 'AYAN A. KAHHAR', 'ayan-a.-kahhar', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(86, 17, 'YUSRA A.KAHHAR', 'yusra-a.kahhar', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(87, 17, 'AYUB OUAHMANE', 'ayub-ouahmane', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(88, 17, 'AMIN OUAHMANE', 'amin-ouahmane', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(89, 17, 'AMAAL ALIM', 'amaal-alim', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(90, 17, 'KHADEEJA UDDIN', 'khadeeja-uddin', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(91, 17, 'WASFI SARWAR', 'wasfi-sarwar', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(92, 17, 'MAYSOON RIDA', 'maysoon-rida', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(93, 17, 'ABUBAKAR SIDDIQUI', 'abubakar-siddiqui', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(94, 17, 'MARIA UDDIN', 'maria-uddin', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(95, 17, 'MARWAN UDDIN', 'marwan-uddin', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(96, 17, 'TAHSIN SIDDIQUI', 'tahsin-siddiqui', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(97, 17, 'SHAZID MOTALEB', 'shazid-motaleb', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(98, 17, 'ARMAN AHMED', 'arman-ahmed', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(99, 17, 'LAHSEN OAHMANE', 'lahsen-oahmane', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(100, 17, 'GUAZI PRONOY', 'guazi-pronoy', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(101, 17, 'ALAMIN RONI', 'alamin-roni', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(102, 17, 'EESA KHAN', 'eesa-khan', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(103, 17, 'FATHIMA KHAN', 'fathima-khan', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(104, 17, 'HUDHAIFA KHAN', 'hudhaifa-khan', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(105, 17, 'MOHAMMED ADYAN', 'mohammed-adyan', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(106, 17, 'MEQAJUL ISLAM', 'meqajul-islam', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(107, 17, 'NUORAT ARSHI', 'nuorat-arshi', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(108, 17, 'MAIMUNA ISLAM', 'maimuna-islam', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(109, 17, 'MUHAIMIN ISLAM', 'muhaimin-islam', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(110, 17, 'RAYAN NHAQI', 'rayan-nhaqi', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(111, 17, 'MUAJ AHMED', 'muaj-ahmed', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(112, 17, 'SUMAIYAH KALAM', 'sumaiyah-kalam', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(113, 17, 'AFREEN CHOWDHURY', 'afreen-chowdhury', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(114, 17, 'IHSAN CHOWDHURY', 'ihsan-chowdhury', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(115, 17, 'IFRA HUSSAIN', 'ifra-hussain', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(116, 17, 'SHIHAB MATUBBER', 'shihab-matubber', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(117, 17, 'TAUSIF ALAM', 'tausif-alam', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(118, 17, 'FARJANA AKTHER', 'farjana-akther', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(119, 17, 'FARHANA AKTHER', 'farhana-akther', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(120, 17, 'FARHAD ALI', 'farhad-ali', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(121, 17, 'RADIYAH HOSSAIN', 'radiyah-hossain', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(122, 17, 'SABA KHAN', 'saba-khan', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(123, 17, 'SUMAIYA UDDIN', 'sumaiya-uddin', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(124, 17, 'KAMILA AHMED', 'kamila-ahmed', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(125, 17, 'RAHI AHMED', 'rahi-ahmed', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(126, 17, 'ZARA MIAH', 'zara-miah', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(127, 17, 'ADIMUL HAQUE', 'adimul-haque', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(128, 17, 'NUSRAT LUDI', 'nusrat-ludi', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(129, 17, 'SUHA USMAN', 'suha-usman', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(130, 17, 'RAYHAB USMAN', 'rayhab-usman', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(131, 17, 'ASIR YUSUF', 'asir-yusuf', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(132, 17, 'MOHAMMED KALI', 'mohammed-kali', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(133, 17, 'TAFRIF RAHMAN', 'tafrif-rahman', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(134, 17, 'FAIZA RAHMAN', 'faiza-rahman', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(135, 17, 'FATIHA KABIR', 'fatiha-kabir', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(136, 17, 'ZAHRA RAHMAN', 'zahra-rahman', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(137, 17, 'ANISATU', 'anisatu', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(138, 17, 'MUMENATU', 'mumenatu', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(139, 17, 'IBRAHIM', 'ibrahim', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(140, 17, 'ZAIN KHAN', 'zain-khan', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(141, 17, 'SHAREEN JANNET', 'shareen-jannet', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(142, 17, 'SAAOAT AOIB', 'saaoat-aoib', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(143, 17, 'ISHAQ', 'ishaq', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(144, 17, 'UMAR CHOWDHURY', 'umar-chowdhury', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(145, 17, 'NAIM KHALIQUE', 'naim-khalique', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(146, 17, 'SUHANN UDDIN', 'suhann-uddin', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(147, 17, 'ASHAJ WADEE', 'ashaj-wadee', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(148, 17, 'AHNAF WAFEE', 'ahnaf-wafee', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(149, 17, 'DIYAN', 'diyan', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(150, 17, 'SHAHAN SHAIKH', 'shahan-shaikh', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(151, 17, 'MOHIUDDIN KHAN', 'mohiuddin-khan', 'hifz', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(152, 17, 'LIKHITA ALI ORIN', 'likhita-ali-orin', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(153, 17, 'KANGKHITA ALI ONI', 'kangkhita-ali-oni', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(154, 17, 'DHIYA CHOWDHURY', 'dhiya-chowdhury', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(155, 17, 'SABIHA MIAH', 'sabiha-miah', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(156, 17, 'FAIZA SYEDA', 'faiza-syeda', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(157, 17, 'FATEMA AKTER', 'fatema-akter', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(158, 17, 'SAMIHA MOHAMMED', 'samiha-mohammed', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(159, 17, 'NASRIN AZHAR', 'nasrin-azhar', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(160, 17, 'RIHANA EL SAOAT', 'rihana-el-saoat', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(161, 17, 'TASNIA  ZARRIN', 'tasnia--zarrin', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(162, 17, 'ANISAH ALIM', 'anisah-alim', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(163, 17, 'ANISA UDDIN', 'anisa-uddin', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(164, 17, 'NAFISA RAHMAN', 'nafisa-rahman', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(165, 17, 'NUSRAT RAHMAN', 'nusrat-rahman', 'qaidah', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(166, 17, 'ABONEE MAZHAR', 'abonee-mazhar', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(167, 17, 'NABILA KHALIQUE', 'nabila-khalique', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(168, 17, 'ASMIN KHAN', 'asmin-khan', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(169, 17, 'TAJMIN KHAN', 'tajmin-khan', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(170, 17, 'EHSAN CHOWDHURY', 'ehsan-chowdhury', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(171, 17, 'ADNAN BHUYAN', 'adnan-bhuyan', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(172, 17, 'RAYYAN MIAH', 'rayyan-miah', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(173, 17, 'ADIF ALAM', 'adif-alam', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(174, 17, 'MOHAMMED RAIHAN', 'mohammed-raihan', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(175, 17, 'MOHAMMED RUHAN', 'mohammed-ruhan', 'juz amma', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(176, 17, 'MUNTASIM SHARKER', 'muntasim-sharker', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL),
(177, 17, 'AFSAN', 'afsan', 'quran', NULL, 1, '2021-06-20', '2021-06-20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) UNSIGNED NOT NULL,
  `uploader_id` int(11) DEFAULT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sounds_like` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `uploader_id`, `category_id`, `name`, `name_bn`, `sounds_like`, `logo_name`, `banner_name`, `status`, `position`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 'Sub Category One', NULL, 'SBKTKRN', '.webp', '.webp', 1, 0, '2021-04-14 02:44:17', '2021-04-14 02:46:50'),
(2, 10, 3, 'sd fsfds fsdf', NULL, 'STFSFTSFSTF', '.webp', '.webp', 1, 0, '2021-04-14 03:36:55', '2021-04-14 03:36:55'),
(3, 12, 11, 'mymensingh', NULL, 'MMNSNF', '.webp', '.webp', 1, 0, '2021-04-14 19:04:38', '2021-04-14 19:04:38'),
(4, 12, 4, 'জাতীয়', NULL, '', '.webp', '.webp', 1, 0, '2021-04-17 20:18:59', '2021-04-17 20:18:59'),
(5, 12, 19, 'ফেসবুক থেকে', NULL, '', '.webp', '.webp', 1, 0, '2021-04-17 20:20:35', '2021-04-17 20:20:35'),
(6, 12, 20, 'কলাম', NULL, '', '.webp', '.webp', 1, 0, '2021-04-17 20:21:51', '2021-04-17 20:21:51'),
(7, 12, 20, 'কলাম', NULL, '', '.webp', '.webp', 1, 0, '2021-04-17 20:21:54', '2021-04-17 20:21:54'),
(8, 12, 5, 'আন্তর্জাতিক', NULL, '', '.webp', '.webp', 1, 0, '2021-04-24 22:51:57', '2021-04-24 22:51:57'),
(9, 12, 7, 'খেলা', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:46:31', '2021-04-25 08:46:31'),
(10, 12, 9, 'অর্থনীতি', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:46:54', '2021-04-25 08:46:54'),
(11, 12, 12, 'জামালপুর', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:47:23', '2021-04-25 08:47:23'),
(12, 12, 13, 'নেত্রকোনা', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:47:44', '2021-04-25 08:47:44'),
(13, 12, 14, 'শেরপুর', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:48:09', '2021-04-25 08:48:09'),
(14, 12, 15, 'সারাদেশ', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:48:29', '2021-04-25 08:48:29'),
(15, 12, 16, 'চিকিৎসা', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:48:50', '2021-04-25 08:48:50'),
(16, 12, 17, 'শিক্ষা', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:49:08', '2021-04-25 08:49:08'),
(17, 12, 19, 'ফেসবুক কলাম', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:49:30', '2021-04-25 08:49:30'),
(18, 12, 18, 'লাইফস্টাইল', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:49:55', '2021-04-25 08:49:55'),
(19, 12, 20, 'কলাম', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:50:09', '2021-04-25 08:50:09'),
(20, 12, 21, 'কবিতা', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:51:38', '2021-04-25 08:51:38'),
(21, 12, 21, 'গল্প', NULL, '', '.webp', '.webp', 1, 0, '2021-04-25 08:52:01', '2021-04-25 08:52:01'),
(22, 12, 8, 'বিনোদন', NULL, '', '.webp', '.webp', 1, 0, '2021-04-26 21:24:24', '2021-04-26 21:24:24');

-- --------------------------------------------------------

--
-- Table structure for table `subscriber_meta`
--

CREATE TABLE `subscriber_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_aside_menus`
--

CREATE TABLE `system_aside_menus` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selector` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_sub_menu` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=not available, 1=available',
  `has_option_menu` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=not available, 1=available',
  `position` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_aside_menus`
--

INSERT INTO `system_aside_menus` (`id`, `name`, `route_name`, `selector`, `icon`, `has_sub_menu`, `has_option_menu`, `position`, `status`) VALUES
(44, 'Settings', NULL, 'theme_settings_menu', 'settings1.svg', 1, 1, 12, 1),
(71, 'Dashboard', 'admin.dashboard', NULL, 'tree1.svg', 0, 0, 0, 1),
(73, 'Slider', NULL, NULL, 'carousel7.svg', 1, 1, 0, 0),
(74, 'News Category', NULL, NULL, 'color1.svg', 1, 1, 0, 1),
(75, 'Sub-subcategory', NULL, NULL, 'color.svg', 1, 1, 0, 0),
(76, 'News Subcategory', NULL, NULL, 'color.svg', 1, 1, 0, 1),
(78, 'Contact Info', NULL, NULL, 'envelope(open).svg', 1, 1, 10, 1),
(79, 'Videos', NULL, NULL, 'camera-fill-black.svg', 1, 1, 2, 1),
(80, 'FAQ', NULL, NULL, 'list1.svg', 1, 1, 8, 1),
(84, 'Customer feedback', NULL, NULL, 'diagram.svg', 1, 1, 9, 1),
(90, 'Country', NULL, NULL, 'tree2.svg', 1, 1, 7, 0),
(101, 'News', NULL, NULL, 'subcategory-1.svg', 1, 1, 0, 1),
(102, 'Pages', NULL, NULL, 'layer.svg', 1, 1, 0, 1),
(103, 'Media', NULL, NULL, 'image.svg', 1, 1, 0, 1),
(104, 'Page Section', NULL, NULL, 'note.svg', 1, 1, 0, 1),
(105, 'Cours', NULL, NULL, 'book.svg', 1, 1, 0, 1),
(106, 'Our Team', NULL, NULL, 'team.svg', 1, 1, 0, 1),
(107, 'Gallery', NULL, NULL, 'gallery (1).svg', 1, 1, 0, 1),
(108, 'Students', NULL, NULL, 'team-strok-2.svg', 1, 1, 0, 1),
(109, 'Report', NULL, NULL, 'layer-strok.svg', 1, 1, 0, 1),
(110, 'Hifz Report', NULL, NULL, 'book-black.svg', 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_aside_menu_dropdowns`
--

CREATE TABLE `system_aside_menu_dropdowns` (
  `id` int(11) NOT NULL,
  `aside_menu_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_aside_menu_dropdowns`
--

INSERT INTO `system_aside_menu_dropdowns` (`id`, `aside_menu_id`, `name`, `route_name`, `icon`, `position`, `status`) VALUES
(21, 44, 'Image & Text', 'admin.image_and_text', 'camara.svg', 0, 1),
(26, 44, 'Settings', 'admin.settings', 'settings2.svg', 0, 1),
(27, 44, 'Front-end Theme Color', 'admin.frontend_theme_color', 'paint1.svg', 0, 1),
(102, 44, 'Role Permission', 'admin.privilege', 'diagram.svg', 0, 1),
(103, 73, 'New', 'admin.add_new_slider', 'arrow_right.svg', 0, 0),
(104, 73, 'Manage', 'admin.all_slider', 'list2.svg', 0, 0),
(105, 73, 'Trash', 'admin.all_trash_slider', 'trash-strock.svg', 0, 0),
(106, 74, 'New', 'admin.add_new_category', 'plus-black-bold.svg', 0, 1),
(107, 74, 'List', 'admin.all_category', 'list2.svg', 0, 1),
(108, 74, 'Trash', 'admin.all_trash_category', 'trash-strock.svg', 0, 1),
(113, 78, 'Contact List', 'admin.contact_us', 'list2.svg', 0, 1),
(114, 79, 'New', 'admin.video', 'plus-black-bold-rounded.svg', 0, 1),
(115, 76, 'New', 'admin.add_new_subcategory', 'plus-black-bold.svg', 0, 1),
(116, 76, 'List', 'admin.all_subcategory', 'list2.svg', 0, 1),
(117, 76, 'Trast', 'admin.all_trash_subcategory', 'trash-strock.svg', 0, 1),
(118, 80, 'New', 'admin.add_new_faq', 'plus-black-bold.svg', 0, 1),
(119, 80, 'List', 'admin.all_faq', 'list2.svg', 0, 1),
(120, 80, 'Trash', 'admin.all_trash_faq', 'trash-strock.svg', 0, 1),
(124, 78, 'Trash', 'admin.contact_us_all_trash', 'trash-strock.svg', 0, 1),
(131, 84, 'New', 'admin.add_new_customer_feedback', 'plus-black-bold.svg', 0, 1),
(132, 84, 'List', 'admin.all_customer_feedback', 'list2.svg', 0, 1),
(133, 84, 'Trash', 'admin.all_trash_customer_feedback', 'trash-strock.svg', 0, 1),
(145, 90, 'New', 'admin.country', 'plus-black-bold.svg', 0, 0),
(155, 101, 'New', 'admin.add_new_news', 'plus-black-bold.svg', 0, 1),
(156, 101, 'List', 'admin.all_news', 'list2.svg', 0, 1),
(157, 101, 'Trash', 'admin.all_trash_news', 'trash-strock.svg', 0, 1),
(158, 102, 'New', 'admin.add_new_pages', 'plus-black-bold.svg', 0, 1),
(159, 102, 'List', 'admin.all_pages', 'list2.svg', 0, 1),
(160, 102, 'Trash', 'admin.all_trash_pages', 'trash-strock.svg', 0, 1),
(161, 103, 'New', 'admin.add_new_media', 'plus-black-bold.svg', 0, 1),
(162, 104, 'New', 'admin.add_new_page_section', 'plus-black-bold.svg', 0, 1),
(163, 104, 'List', 'admin.all_page_section', 'list2.svg', 0, 1),
(164, 104, 'Trash', 'admin.all_trash_page_section', 'trash-strock.svg', 0, 1),
(165, 105, 'New', 'admin.add_new_cours', 'plus-black-bold.svg', 0, 1),
(166, 105, 'List', 'admin.all_cours', 'list2.svg', 0, 1),
(167, 105, 'Trash', 'admin.all_trash_cours', 'trash-strock.svg', 0, 1),
(168, 106, 'New', 'admin.add_new_team', 'plus-black-bold.svg', 0, 1),
(169, 106, 'List', 'admin.all_team', 'list2.svg', 0, 1),
(170, 106, 'Trash', 'admin.all_trash_team', 'trash-strock.svg', 0, 1),
(171, 107, 'New', 'admin.add_new_gallery', 'plus-black-bold.svg', 0, 1),
(172, 107, 'List', 'admin.all_gallery', 'list2.svg', 0, 1),
(173, 107, 'Trash', 'admin.all_trash_gallery', 'trash-strock.svg', 0, 1),
(174, 108, 'New', 'admin.add_new_students', 'plus-black-bold.svg', 0, 1),
(175, 108, 'List', 'admin.all_students', 'list2.svg', 0, 1),
(176, 108, 'Trash', 'admin.all_trash_students', 'trash-strock.svg', 0, 1),
(177, 109, 'Daily Report', 'admin.new_report', 'plus-circle.svg', 0, 1),
(178, 109, 'List', 'admin.all_report', 'list2.svg', 0, 1),
(179, 109, 'Trash', 'admin.all_trash_report', 'trash-strock.svg', 0, 1),
(180, 109, 'Overview', 'admin.overview_report', 'calendar-black.svg', 0, 1),
(181, 110, 'Daily Report', 'admin.new_hifzreport', 'plus-circle.svg', 0, 1),
(182, 110, 'List', 'admin.all_hifzreport', 'list2.svg', 0, 1),
(183, 110, 'Trash', 'admin.all_trash_hifzreport', 'trash-strock.svg', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_option_menus`
--

CREATE TABLE `system_option_menus` (
  `id` int(11) NOT NULL,
  `aside_menu_id` int(11) DEFAULT NULL,
  `asidedropdown_menu_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_option_menus`
--

INSERT INTO `system_option_menus` (`id`, `aside_menu_id`, `asidedropdown_menu_id`, `name`, `type`, `route_name`, `position`, `icon`, `status`) VALUES
(117, 73, 104, 'Edit', 'warning', 'admin.update_slider', 0, 'pancil-strok.svg', 0),
(119, 73, 104, 'Trash', 'danger', 'admin.trash_slider', 0, 'trash-strock.svg', 0),
(120, 73, 105, 'Restore', 'success', 'admin.restore_slider', 0, 'undo-black.svg', 0),
(121, 73, 105, 'Delete', 'danger', 'admin.delete_slider', 0, 'close-red.svg', 0),
(123, 74, 107, 'Trash', 'danger', 'admin.trash_category', 0, 'trash-strock.svg', 1),
(124, 74, 108, 'Restore', 'success', 'admin.restore_category', 0, 'undo-black.svg', 1),
(129, 74, 107, 'Edit', 'warning', 'admin.update_category', 0, 'pancil-strok.svg', 1),
(130, 74, 108, 'Delete', 'danger', 'admin.delete_category', 0, 'close-red.svg', 1),
(131, 76, 116, 'Edit', 'warning', 'admin.update_subcategory', 0, 'pancil-strok.svg', 1),
(132, 76, 116, 'Delete', 'success', 'admin.trash_subcategory', 0, 'trash-strock.svg', 1),
(133, 76, 117, 'Restore', 'success', 'admin.restore_subcategory', 0, 'undo-black.svg', 1),
(134, 76, 117, 'Delete', 'danger', 'admin.delete_subcategory', 0, 'close-red.svg', 1),
(135, 80, 119, 'Edit', 'warning', 'admin.update_faq', 0, 'pancil-strok.svg', 1),
(136, 80, 119, 'Trash', 'danger', 'admin.trash_faq', 0, 'trash-strock.svg', 1),
(137, 80, 120, 'Restore', 'success', 'admin.restore_faq', 0, 'undo-black.svg', 1),
(138, 80, 120, 'Delete', 'danger', 'admin.delete_faq', 0, 'close-red.svg', 1),
(144, 78, 113, 'Replay', 'success', 'admin.contact_us_replay', 0, 'list1.svg', 1),
(145, 78, 113, 'Trash', 'danger', 'admin.contact_us_trash', 0, 'trash-strock.svg', 1),
(146, 78, 124, 'Restore', 'success', 'admin.contact_us_restor', 0, 'undo-black.svg', 1),
(147, 78, 124, 'Delete', 'danger', 'admin.contact_us_delete', 0, 'close-red.svg', 1),
(156, 84, 132, 'Edit', 'warning', 'admin.update_customer_feedback', 0, 'pancil-strok.svg', 1),
(157, 84, 132, 'Trash', 'danger', 'admin.trash_customer_feedback', 0, 'trash-strock.svg', 1),
(158, 84, 133, 'Restore', 'success', 'admin.restore_customer_feedback', 0, 'undo-black.svg', 1),
(159, 84, 133, 'Delete', 'danger', 'admin.delete_customer_feedback', 0, 'close-red.svg', 1),
(174, 90, 145, 'Delete', 'danger', 'admin.country_delete', 0, 'close-red.svg', 0),
(186, 101, 156, 'Edit', 'warning', 'admin.update_news', 0, 'pancil-strok.svg', 1),
(187, 101, 156, 'Trash', 'danger', 'admin.trash_news', 0, 'trash-strock.svg', 1),
(188, 101, 157, 'Restore', 'success', 'admin.restore_news', 0, 'undo-black.svg', 1),
(189, 101, 157, 'Delete', 'danger', 'admin.delete_news', 0, 'close-red.svg', 1),
(190, 102, 159, 'Edit', 'warning', 'admin.update_pages', 0, 'pancil-strok.svg', 1),
(191, 102, 159, 'Trash', 'danger', 'admin.trash_pages', 0, 'trash-strock.svg', 1),
(192, 102, 160, 'Restore', 'success', 'admin.restore_pages', 0, 'undo-black.svg', 1),
(193, 102, 160, 'Delete', 'danger', 'admin.delete_pages', 0, 'close-red.svg', 1),
(194, 104, 163, 'Edit', 'warning', 'admin.update_page_section', 0, 'pancil-strok.svg', 1),
(195, 104, 163, 'Trash', 'danger', 'admin.trash_page_section', 0, 'trash-strock.svg', 1),
(196, 104, 164, 'Restore', 'success', 'admin.restore_page_section', 0, 'undo-black.svg', 1),
(197, 104, 164, 'Delete', 'danger', 'admin.delete_page_section', 0, 'close-red.svg', 1),
(198, 105, 166, 'Edit', 'warning', 'admin.update_cours', 0, 'pancil-strok.svg', 1),
(199, 105, 166, 'Trash', 'danger', 'admin.trash_cours', 0, 'trash-strock.svg', 1),
(200, 105, 167, 'Restore', 'success', 'admin.restore_cours', 0, 'undo-black.svg', 1),
(201, 105, 167, 'Delete', 'danger', 'admin.delete_cours', 0, 'close-red.svg', 1),
(202, 106, 169, 'Edit', 'warning', 'admin.update_team', 0, 'pancil-strok.svg', 1),
(203, 106, 169, 'Trash', 'danger', 'admin.trash_team', 0, 'trash-strock.svg', 1),
(204, 106, 170, 'Restore', 'success', 'admin.restore_team', 0, 'undo-black.svg', 1),
(205, 106, 170, 'Delete', 'danger', 'admin.delete_team', 0, 'close-red.svg', 1),
(206, 107, 172, 'Edit', 'warning', 'admin.update_gallery', 0, 'pancil-strok.svg', 1),
(207, 107, 172, 'Trash', 'danger', 'admin.trash_gallery', 0, 'trash-strock.svg', 1),
(208, 107, 173, 'Restore', 'success', 'admin.restore_gallery', 0, 'restore.svg', 1),
(209, 107, 173, 'Delete', 'danger', 'admin.delete_gallery', 0, 'close-red.svg', 1),
(210, 108, 175, 'Edit', 'warning', 'admin.update_students', 0, 'pancil-strok.svg', 1),
(211, 108, 175, 'Trash', 'danger', 'admin.trash_students', 0, 'trash-strock.svg', 1),
(212, 108, 176, 'Restore', 'success', 'admin.restore_students', 0, 'undo-black.svg', 1),
(213, 108, 176, 'Delete', 'danger', 'admin.delete_students', 0, 'close-red.svg', 1),
(214, 109, 178, 'Edit', 'warning', 'admin.update_report', 0, 'pancil-strok.svg', 1),
(215, 109, 178, 'Trash', 'danger', 'admin.trash_report', 0, 'trash-strock.svg', 1),
(216, 109, 179, 'Undo', 'success', 'admin.restore_report', 0, 'undo-black.svg', 1),
(217, 109, 179, 'Delete', 'danger', 'admin.delete_report', 0, 'close-red.svg', 1),
(218, 110, 182, 'Edit', 'warning', 'admin.update_hifzreport', 0, 'pancil-strok.svg', 1),
(219, 110, 182, 'Trash', 'danger', 'admin.trash_hifzreport', 0, 'trash-strock.svg', 1),
(220, 110, 183, 'Restore', 'success', 'admin.restore_hifzreport', 0, 'undo-black.svg', 1),
(221, 110, 183, 'Delete', 'danger', 'admin.delete_hifzreport', 0, 'close-red.svg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_theme_settings`
--

CREATE TABLE `system_theme_settings` (
  `id` int(11) NOT NULL,
  `theme_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_theme_settings`
--

INSERT INTO `system_theme_settings` (`id`, `theme_key`, `theme_value`, `status`) VALUES
(13, 'site_name', 'Faithcentre', 1),
(15, 'footer_text', 'The Faithcentre is an online platform for Islamic studies.', 1),
(16, 'header_logo', 'public/backend/img/logo/header_logo_1471016_1620445669000.png', 1),
(17, 'footer_logo', 'public/backend/img/logo/footer_logo_1320998_1620446214000.png', 1),
(18, 'favicon', 'public/backend/img/logo/favicon_5884575_1620446214000.png', 1),
(22, 'soft_mode', 'light', 1),
(25, 'email', 'info@faithcentre.org.uk', 1),
(26, 'phone', '+44 7368 848900', 1),
(29, 'address', '102 Mile End Road\r\nLondon, E1 4UN', 1),
(30, 'contact_text', 'Get in touch to discuss your employee wellbeing needs today. Please give us a call, drop us an email or fill out the contact form and we’ll get back to you.', 1),
(32, 'facebook', 'https://www.facebook.com/', 1),
(33, 'twitter', 'https://twitter.com/home', 1),
(34, 'instagram', 'https://www.instagram.com/', 1),
(35, 'youtube', 'https://youtube.com/', 1),
(36, 'theme_color', '#26bff2', 1),
(37, 'map_url', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2482.6058641407244!2d-0.054132484027813024!3d51.52044651756984!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x48761cd6a649770b%3A0x95c89dd737198efb!2s102%20Mile%20End%20Rd%2C%20Stepney%20Green%2C%20London%20E1%204UN%2C%20UK!5e0!3m2!1sen!2sbd!4v1620351321345!5m2!1sen!2sbd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agreement_status` tinyint(4) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `trx_pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `sponsore_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_level` int(11) DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_id`, `img_name`, `phone`, `email`, `password`, `remember_token`, `agreement_status`, `created_at`, `updated_at`, `trx_pin`, `date_of_birth`, `address`, `zip_code`, `passport_no`, `blood_group`, `country_id`, `sponsore_id`, `user_level`, `status`) VALUES
(18, 'Muhibbullah Ansary', '1607798886', 'public/userpanel/img/profile/1607880834.webp', '+8801307619085', 'muhibbullah611@gmail.com', '$2y$10$xnwHzRld/0RHoj0reHf7sed2EmhTu6rLg90p19R4mN9whMGdEWusG', NULL, 0, '2020-12-13 23:33:54', '2020-12-13 23:33:54', '1234', '2020-12-13', 'Mymensingh, guail kandi', '2200', '123456789123', 'a+', 2, 'muhib116', 0, 1),
(19, 'Antoe', '1607824777', NULL, '01765848919', 'antorahmed899@gmail.com', '$2y$10$xnwHzRld/0RHoj0reHf7sed2EmhTu6rLg90p19R4mN9whMGdEWusG', NULL, 0, '2020-12-13 07:59:37', '2020-12-13 07:59:37', 'asdfghjkl4321', NULL, NULL, NULL, NULL, NULL, NULL, '1607798886', 0, 1),
(20, 'arif', '1607885420', 'public/userpanel/img/profile/1607885685.jpg', '01747688184', 'parinami2030@gmail.com', '$2y$10$0JswkocAhC96uVPrDFt9iezkyCBJLTdeHHQtA5b84ypN6UHnKMBey', NULL, 0, '2020-12-14 00:54:45', '2020-12-14 00:54:45', '123456', '1993-01-25', 'mymensingh', '2290', '109272525426', 'o+', 2, '1607798886', 0, 1),
(21, 'Test Name', '1609693529', NULL, '01787224001', 'test@gmail.com', '$2y$10$8T9ZzVciEx9FH9TSBReB3elL.DzIkl3Xc6mTn5WfmfmToUg6ikUJG', NULL, 0, '2021-01-03 23:05:29', '2021-01-03 23:05:29', '1609693281', NULL, NULL, NULL, NULL, NULL, NULL, '1607824777', 0, 1),
(22, 'Homayun', '1609759047', NULL, '01787570896', 'lonelyantor899@gmail.com', '$2y$10$p6LAVkNnUzpgVO6O/.Ey4evJtMwTvupzKbT2TLCCgtHWzePqw7Mfm', NULL, 0, '2021-01-04 17:17:27', '2021-01-04 17:17:27', '1609758988', NULL, NULL, NULL, NULL, NULL, NULL, '1607824777v', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `division_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `upazila_id` int(11) NOT NULL,
  `area_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `division_id`, `district_id`, `upazila_id`, `area_name`, `street_address`, `ip`) VALUES
(2, 3, 1, 2, 17, 'Achargaon', 'test', '::1'),
(6, 7, 1, 2, 10, 'Sha', 'Mymensingh,Mymensingh Sadar, Guailkandi,Jamtola mur.', '::1'),
(7, 8, 1, 2, 10, 'Jamtola mure', 'street address', '::1'),
(8, 9, 1, 2, 10, 'College road', 'Mirbari...', '43.245.120.30'),
(9, 10, 1, 2, 10, 'Mirbari', NULL, '27.147.202.96'),
(10, 11, 1, 2, 13, 'Borodashpara,', NULL, '27.147.202.96'),
(11, 12, 1, 2, 10, 'Mymensingh sadar', '11/1,rambabu road', '27.147.202.96'),
(12, 14, 1, 2, 10, 'Aqua,Gondropa,Mymensingh', NULL, '103.210.59.208');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `video_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_code`, `details`) VALUES
(2, 'vE-LbePvbBE', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(3, '3HgiET60Yyo', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(4, 'Ka2PxvMuHKM', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(5, 'zTFCb9K-4YI', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(6, 'ilAKF4jS3ZM', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(7, 's9leVG_STAA', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(8, 'F22rI8jpaV4', 'fsdfsdfsdf'),
(10, 'Law7wfdg_ls', 'Hello');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_phone_unique` (`phone`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_meta`
--
ALTER TABLE `admin_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminmeta_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `admin_privileges`
--
ALTER TABLE `admin_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploader_id` (`uploader_id`),
  ADD KEY `slug` (`sounds_like`(191)),
  ADD KEY `representative_phone` (`representative_phone`),
  ADD KEY `representative_name` (`representative_name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`sounds_like`(191)),
  ADD KEY `uploader_id` (`uploader_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_feedbacks`
--
ALTER TABLE `customer_feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hifz_reports`
--
ALTER TABLE `hifz_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hifz_sabak_report`
--
ALTER TABLE `hifz_sabak_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `report_id` (`report_id`),
  ADD KEY `uploader_id` (`uploader_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_categories`
--
ALTER TABLE `media_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`description`(191)),
  ADD KEY `uploader_id` (`uploader_id`);

--
-- Indexes for table `our_courses`
--
ALTER TABLE `our_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_teams`
--
ALTER TABLE `our_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `page_section_meta`
--
ALTER TABLE `page_section_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sabak_report`
--
ALTER TABLE `sabak_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `subscriber_meta`
--
ALTER TABLE `subscriber_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminmeta_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `system_aside_menus`
--
ALTER TABLE `system_aside_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_aside_menu_dropdowns`
--
ALTER TABLE `system_aside_menu_dropdowns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aside_menu_id` (`aside_menu_id`);

--
-- Indexes for table `system_option_menus`
--
ALTER TABLE `system_option_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aside_menu_id` (`aside_menu_id`),
  ADD KEY `asidedropdown_menu_id` (`asidedropdown_menu_id`);

--
-- Indexes for table `system_theme_settings`
--
ALTER TABLE `system_theme_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_key` (`theme_key`(191));

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone` (`phone`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `division_id` (`division_id`),
  ADD KEY `district_id` (`district_id`),
  ADD KEY `upazila_id` (`upazila_id`),
  ADD KEY `area_name` (`area_name`(191)),
  ADD KEY `ip` (`ip`),
  ADD KEY `address` (`street_address`(191));

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `admin_meta`
--
ALTER TABLE `admin_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_privileges`
--
ALTER TABLE `admin_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_feedbacks`
--
ALTER TABLE `customer_feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hifz_reports`
--
ALTER TABLE `hifz_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hifz_sabak_report`
--
ALTER TABLE `hifz_sabak_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `media_categories`
--
ALTER TABLE `media_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `our_courses`
--
ALTER TABLE `our_courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `our_teams`
--
ALTER TABLE `our_teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `page_sections`
--
ALTER TABLE `page_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `page_section_meta`
--
ALTER TABLE `page_section_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `sabak_report`
--
ALTER TABLE `sabak_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `subscriber_meta`
--
ALTER TABLE `subscriber_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_aside_menus`
--
ALTER TABLE `system_aside_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `system_aside_menu_dropdowns`
--
ALTER TABLE `system_aside_menu_dropdowns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `system_option_menus`
--
ALTER TABLE `system_option_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `system_theme_settings`
--
ALTER TABLE `system_theme_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_meta`
--
ALTER TABLE `admin_meta`
  ADD CONSTRAINT `adminmeta_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
