-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 04, 2021 at 01:02 AM
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
-- Database: `muhikgzv_project_`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 or 1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `designation`, `admin_type`, `phone`, `email`, `path`, `address`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(10, 'Muhibbullah', 'muhibbullah', 'president', 'president', '01770989591', 'muhibbullah611@gmail.com', 'public/backend/img/profile/4523746-muhibbullah_1592907159.jpg', 'Topten', '$2y$10$96.0eeCg1NHy/JnOCSSy7OzoGg/1JjYC4VKInClb.PD0m4lT2ow7i', 1, NULL, '2019-11-30 21:06:41', '2019-11-30 21:06:41'),
(12, 'Admin', 'admin', 'maneger', 'admin', '01700000000', 'admin@gmail.com', 'public/backend/img/profile/600225-admin_1592483607.jpg', 'test', '$2y$10$xySBEYvobCLygLrP052peO0h45YnNr0U9XLEsloribbGwkUZx4Toy', 1, NULL, '2020-06-18 18:33:27', '2020-06-18 18:33:27');

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
  `aside_menu_id` text COLLATE utf8mb4_unicode_ci DEFAULT '[]',
  `aside_menu_dropdown_id` text COLLATE utf8mb4_unicode_ci DEFAULT '[]',
  `option_menu_id` text COLLATE utf8mb4_unicode_ci DEFAULT '[]',
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
(15, 12, '[\"71\",\"96\",\"97\",\"98\",\"99\",\"44\"]', '[\"151\",\"153\",\"154\",\"21\",\"26\"]', '[\"181\",\"182\",\"183\",\"184\"]', '2020-06-23 16:31:58', '2021-03-31 01:26:03'),
(16, 13, '[\"71\",\"61\",\"68\",\"60\",\"65\",\"63\",\"64\",\"66\",\"67\",\"69\",\"44\"]', '[\"70\",\"71\",\"72\",\"85\",\"86\",\"87\",\"67\",\"68\",\"69\",\"80\",\"81\",\"82\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"83\",\"96\",\"84\",\"90\",\"91\",\"92\",\"93\",\"95\",\"98\",\"21\",\"26\",\"102\"]', '[\"72\",\"73\",\"74\",\"75\",\"92\",\"93\",\"94\",\"95\",\"110\",\"68\",\"70\",\"71\",\"77\",\"85\",\"86\",\"87\",\"88\",\"78\",\"79\",\"80\",\"81\",\"83\",\"89\",\"90\",\"91\",\"102\",\"103\",\"96\",\"97\",\"99\",\"100\",\"107\",\"108\",\"105\",\"106\"]', '2020-07-03 18:06:56', '2020-10-05 17:31:49'),
(17, 14, '[\"70\",\"61\",\"69\",\"68\",\"60\",\"65\",\"63\",\"64\",\"66\",\"67\",\"44\"]', '[\"70\",\"71\",\"72\",\"92\",\"93\",\"95\",\"98\",\"85\",\"86\",\"87\",\"67\",\"68\",\"69\",\"80\",\"81\",\"82\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"83\",\"96\",\"84\",\"90\",\"91\",\"21\",\"26\",\"27\"]', '[\"72\",\"73\",\"74\",\"75\",\"101\",\"104\",\"105\",\"106\",\"92\",\"93\",\"94\",\"95\",\"110\",\"68\",\"70\",\"71\",\"77\",\"85\",\"86\",\"87\",\"88\",\"78\",\"79\",\"80\",\"81\",\"83\",\"89\",\"90\",\"91\",\"102\",\"103\",\"96\",\"97\",\"99\",\"100\",\"107\",\"108\"]', '2020-09-25 14:27:52', '2020-09-25 14:31:13');

-- --------------------------------------------------------

--
-- Table structure for table `ads_earning`
--

CREATE TABLE `ads_earning` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` float(8,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ads_earning`
--

INSERT INTO `ads_earning` (`id`, `user_id`, `amount`) VALUES
(1, 18, 0.00),
(2, 19, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `ads_earning_history`
--

CREATE TABLE `ads_earning_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` float(8,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ads_earning_history`
--

INSERT INTO `ads_earning_history` (`id`, `user_id`, `date`, `amount`) VALUES
(1, 18, '2021-01-01', 4.20),
(2, 18, '2021-01-01', 0.25),
(3, 18, '2021-01-01', 0.25),
(4, 18, '2021-01-01', 0.30),
(5, 19, '2021-01-01', 0.02),
(6, 19, '2021-01-01', 50.00),
(7, 19, '2021-01-02', 60.00);

-- --------------------------------------------------------

--
-- Table structure for table `ads_hit_count`
--

CREATE TABLE `ads_hit_count` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `user_id` int(11) NOT NULL,
  `ads_id` int(11) NOT NULL,
  `ads_type` varchar(100) NOT NULL COMMENT 'link/video'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ads_hit_count`
--

INSERT INTO `ads_hit_count` (`id`, `date`, `time`, `user_id`, `ads_id`, `ads_type`) VALUES
(1, '2020-12-31', '20:58:52', 17, 2, 'link'),
(2, '2020-12-31', '21:00:12', 17, 1, 'link'),
(3, '2020-12-31', '23:35:39', 17, 8, 'video'),
(4, '2020-12-31', '23:37:50', 17, 8, 'video'),
(5, '2021-01-01', '02:43:15', 17, 3, 'link'),
(6, '2021-01-01', '14:37:48', 18, 2, 'link'),
(7, '2021-01-01', '14:38:07', 18, 3, 'link'),
(8, '2021-01-01', '14:39:07', 18, 8, 'video'),
(9, '2021-01-01', '14:39:54', 18, 9, 'video'),
(10, '2021-01-01', '19:31:36', 19, 2, 'link'),
(11, '2021-01-01', '19:35:21', 19, 4, 'link'),
(12, '2021-01-01', '19:39:05', 19, 6, 'link'),
(13, '2021-01-01', '19:39:17', 19, 5, 'link'),
(14, '2021-01-01', '19:42:45', 19, 7, 'link'),
(15, '2021-01-02', '07:28:17', 19, 8, 'link'),
(16, '2021-01-04', '17:10:37', 19, 9, 'link');

-- --------------------------------------------------------

--
-- Table structure for table `amount`
--

CREATE TABLE `amount` (
  `id` int(11) UNSIGNED NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) UNSIGNED NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sounds_like` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `uploader_id`, `name`, `sounds_like`, `status`, `created_at`, `updated_at`, `position`) VALUES
(1, 4, 'Shankipara', 'SNKPR', 1, '2020-04-15 11:24:15', '2020-04-15 11:24:15', 0),
(2, 4, 'Collage Road', 'KLJRT', 1, '2020-04-15 11:24:26', '2020-04-15 11:25:29', 0),
(3, 4, 'Helth Officer Goli', 'HL0FSRKL', 1, '2020-04-15 11:24:39', '2020-04-15 11:24:39', 0),
(1, 4, 'Shankipara', 'SNKPR', 1, '2020-04-15 11:24:15', '2020-04-15 11:24:15', 0),
(2, 4, 'Collage Road', 'KLJRT', 1, '2020-04-15 11:24:26', '2020-04-15 11:25:29', 0),
(3, 4, 'Helth Officer Goli', 'HL0FSRKL', 1, '2020-04-15 11:24:39', '2020-04-15 11:24:39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` float(8,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`id`, `user_id`, `amount`) VALUES
(1, 18, 4950.00),
(2, 19, 582.02),
(3, 21, 50.00),
(4, 22, 0.00);

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
-- Table structure for table `btcs`
--

CREATE TABLE `btcs` (
  `id` int(11) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `btc_address` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `btcs`
--

INSERT INTO `btcs` (`id`, `uploader_id`, `btc_address`, `path`, `created_at`, `updated_at`, `status`) VALUES
(1, 10, 's7tyfhuwertsgufjklsdhf8sgdifuili7eyr78uiowoeoifs9ofifg', '1604087390.webp', '2020-10-31 01:50:07', '2020-10-31 01:50:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(11) UNSIGNED NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_on` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `uploader_id`, `name`, `recipient`, `event`, `add_on`, `status`, `created_at`, `updated_at`, `position`) VALUES
(1, 10, 'Test Name', 'Recipient Two', 'Start Date', '$25 VISA Card', 1, '2021-03-30 04:31:21', '2021-03-30 04:45:18', 0);

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
(1, 10, 'test', 'TST', 1, '2021-03-30 03:56:16', '2021-03-30 03:56:16', 0, '.webp', '.webp');

-- --------------------------------------------------------

--
-- Table structure for table `cirtificates`
--

CREATE TABLE `cirtificates` (
  `id` int(11) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cirtificates`
--

INSERT INTO `cirtificates` (`id`, `uploader_id`, `name`, `details`, `path`, `created_at`, `updated_at`, `status`) VALUES
(1, 10, 'test', 'Some details about customer.', '1604086095.webp', '2020-10-31 01:28:15', '2020-10-31 01:28:15', 1),
(2, 10, 'Restore', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '1604086111.webp', '2020-10-31 01:28:31', '2020-10-31 01:28:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `name` varchar(60) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `subject` varchar(200) NOT NULL,
  `email` varchar(80) NOT NULL,
  `details` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `date`, `time`, `name`, `phone`, `subject`, `email`, `details`, `status`) VALUES
(7, '2020-11-22', '02:45:00', 'Saidul Islam Babu', NULL, 'Test', 'saidulislam_babu@yahoo.com', 'Hi How Are You?', 1),
(8, '2020-12-05', '23:26:34', 'Muhibbullah Ansary', '+8801307619085', 'Test Subject Start Here', 'muhibbullah611@gmail.com', 'Test Message', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_feedbacks`
--

INSERT INTO `customer_feedbacks` (`id`, `name`, `country`, `details`, `path`, `created_at`, `updated_at`, `uploader_id`, `status`) VALUES
(1, 'Muhibbullah Ansary', 'Bangladesh', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '1604087071.webp', '2020-10-31 01:44:31', '2020-10-31 01:44:31', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(11) NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploader_id` int(11) DEFAULT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_thumbnail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `caption`, `description`, `uploader_id`, `path`, `path_thumbnail`, `status`, `created_at`, `updated_at`) VALUES
(1, 'This is captiond', 'This is description', 1, '[\"public\\/backend\\/img\\/galleries\\/2308037_This is caption_1570560852.jpg\",\"public\\/backend\\/img\\/galleries\\/7817947_This is caption_1570560852.jpg\",\"public\\/backend\\/img\\/galleries\\/4229884_This is caption_1570560852.jpg\",\"public\\/backend\\/img\\/galleries\\/3072360_This is caption_1570560852.jpg\",\"public\\/backend\\/img\\/galleries\\/9289432_This is caption_1570560852.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/2308037_This is caption_1570560852.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/7817947_This is caption_1570560852.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/4229884_This is caption_1570560852.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/3072360_This is caption_1570560852.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/9289432_This is caption_1570560852.jpg\"]', 1, '2019-10-08 18:54:12', '2019-11-24 21:29:43'),
(2, 'Lorem Ipsum is simply dummy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 8, '[\"public\\/backend\\/img\\/galleries\\/9701852_Lorem_Ipsum_is_simply_dummy_1571262015.jpg\",\"public\\/backend\\/img\\/galleries\\/436475_Lorem_Ipsum_is_simply_dummy_1571262015.jpg\",\"public\\/backend\\/img\\/galleries\\/7989273_Lorem_Ipsum_is_simply_dummy_1571262015.jpg\",\"public\\/backend\\/img\\/galleries\\/8441530_Lorem_Ipsum_is_simply_dummy_1571262015.jpg\",\"public\\/backend\\/img\\/galleries\\/6922052_Lorem_Ipsum_is_simply_dummy_1571341594.jpeg\",\"public\\/backend\\/img\\/galleries\\/3139691_Lorem_Ipsum_is_simply_dummy_1571341595.png\",\"public\\/backend\\/img\\/galleries\\/6265566_Lorem_Ipsum_is_simply_dummy_1571341595.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/9701852_Lorem_Ipsum_is_simply_dummy_1571262015.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/436475_Lorem_Ipsum_is_simply_dummy_1571262015.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/7989273_Lorem_Ipsum_is_simply_dummy_1571262015.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/8441530_Lorem_Ipsum_is_simply_dummy_1571262015.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/6922052_Lorem_Ipsum_is_simply_dummy_1571341594.jpeg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/3139691_Lorem_Ipsum_is_simply_dummy_1571341595.png\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/6265566_Lorem_Ipsum_is_simply_dummy_1571341595.jpg\"]', 0, '2019-10-08 20:23:45', '2019-11-25 17:39:02'),
(3, 'Lorem Ipsum sis simply dummy text', 'Lorem Ipsum is simply dummy textLorem Ipsum is simply dummy textLorem Ipsum is simply dummy textLorem Ipsum is simply dummy textLorem Ipsum is simply dummy textLorem Ipsum is simply dummy textLorem Ipsum is simply dummy text', 8, '[\"public\\/backend\\/img\\/galleries\\/2323471_Lorem Ipsum sis simply dummy text_1570566276.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/2323471_Lorem Ipsum sis simply dummy text_1570566276.jpg\"]', 1, '2019-10-08 20:24:36', '2019-10-08 20:24:36'),
(4, 'top publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 8, '[\"public\\/backend\\/img\\/galleries\\/1223689_top publishing software like Aldus PageMaker including versions of Lorem Ipsum._1570566378.jpg\",\"public\\/backend\\/img\\/galleries\\/8380356_top publishing software like Aldus PageMaker including versions of Lorem Ipsum._1570566378.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/1223689_top publishing software like Aldus PageMaker including versions of Lorem Ipsum._1570566378.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/8380356_top publishing software like Aldus PageMaker including versions of Lorem Ipsum._1570566378.jpg\"]', 1, '2019-10-08 20:26:18', '2019-10-08 20:26:18'),
(5, 'Lorem Ipsusm sis simply dummy text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 8, '[\"public\\/backend\\/img\\/galleries\\/565406_Lorem Ipsusm sis simply dummy text_1570566399.jpg\",\"public\\/backend\\/img\\/galleries\\/7095347_Lorem Ipsusm sis simply dummy text_1570566399.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/565406_Lorem Ipsusm sis simply dummy text_1570566399.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/7095347_Lorem Ipsusm sis simply dummy text_1570566399.jpg\"]', 1, '2019-10-08 20:26:39', '2019-10-08 20:26:39'),
(6, 'fJTkujZtdR', 'adfd17YbW4', 4, '[\"public\\/backend\\/img\\/galleries\\/3795792_fJTkujZtdR_1571252694.jpg\",\"public\\/backend\\/img\\/galleries\\/4916948_fJTkujZtdR_1571252695.jpg\",\"public\\/backend\\/img\\/galleries\\/5039113_fJTkujZtdR_1571252695.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/3795792_fJTkujZtdR_1571252694.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/4916948_fJTkujZtdR_1571252695.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/5039113_fJTkujZtdR_1571252695.jpg\"]', 1, '2019-10-16 19:04:54', '2019-10-16 19:04:54'),
(10, 'nWRoQVIj2b', '2uHe7w2nUH', 4, '[\"public\\/backend\\/img\\/galleries\\/1554681_nWRoQVIj2b_1571252782.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/1554681_nWRoQVIj2b_1571252782.jpg\"]', 1, '2019-10-16 19:06:22', '2019-10-16 19:06:22'),
(14, '6VZGjFfb3O', 'Fg4Znn5SO5', 4, '[\"public\\/backend\\/img\\/galleries\\/4864417_6VZGjFfb3O_1571252958.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/4864417_6VZGjFfb3O_1571252958.jpg\"]', 1, '2019-10-16 19:09:18', '2019-10-16 19:09:18'),
(15, 'weB4wvCFB8', 'UXSXyBXVYg', 4, '[\"public\\/backend\\/img\\/galleries\\/1380547_weB4wvCFB8_1571252968.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/1380547_weB4wvCFB8_1571252968.jpg\"]', 1, '2019-10-16 19:09:28', '2019-10-16 19:09:28'),
(16, 'rqwgCxrKeZ', 'iHOXjtFSNB', 4, '[\"public\\/backend\\/img\\/galleries\\/1349759_rqwgCxrKeZ_1571252977.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/1349759_rqwgCxrKeZ_1571252977.jpg\"]', 1, '2019-10-16 19:09:37', '2019-10-16 19:09:37'),
(20, 'The TouchEvent inherits all.', 'The TouchEvent inherits all.', 4, '[\"public\\/backend\\/img\\/galleries\\/2647403_The_TouchEvent_inherits_all._1571253608.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/2647403_The_TouchEvent_inherits_all._1571253608.jpg\"]', 1, '2019-10-16 19:20:08', '2019-10-16 19:20:08'),
(21, 'Tempora commodo veni', 'Quis aliquam exercit', 4, '[\"public\\/backend\\/img\\/galleries\\/2721782_Tempora_commodo_veni_1571253620.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/2721782_Tempora_commodo_veni_1571253620.jpg\"]', 1, '2019-10-16 19:20:20', '2019-10-16 19:20:20'),
(22, 'In excepteur vero oc', 'Odit porro voluptati', 4, '[\"public\\/backend\\/img\\/galleries\\/3054349_In_excepteur_vero_oc_1571253628.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/3054349_In_excepteur_vero_oc_1571253628.jpg\"]', 1, '2019-10-16 19:20:28', '2019-10-16 19:20:28'),
(23, 'Dolorum tempora labo', 'Saepe id do laborios', 4, '[\"public\\/backend\\/img\\/galleries\\/7615581_Dolorum_tempora_labo_1571253638.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/7615581_Dolorum_tempora_labo_1571253638.jpg\"]', 1, '2019-10-16 19:20:38', '2019-10-16 19:20:38'),
(24, 'Illo dolorem dolores', 'Magni sed tenetur lo', 4, '[\"public\\/backend\\/img\\/galleries\\/8934979_Illo_dolorem_dolores_1571253651.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/8934979_Illo_dolorem_dolores_1571253651.jpg\"]', 1, '2019-10-16 19:20:51', '2019-10-16 19:20:51'),
(25, 'Minus velit a sequi', 'Et esse in dolorem', 4, '[\"public\\/backend\\/img\\/galleries\\/8259906_Minus_velit_a_sequi_1571253661.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/8259906_Minus_velit_a_sequi_1571253661.jpg\"]', 1, '2019-10-16 19:21:01', '2019-10-16 19:21:01'),
(26, 'Velit neque amet of', 'Molestiae autem prov', 4, '[\"public\\/backend\\/img\\/galleries\\/4772536_Velit_neque_amet_of_1571253670.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/4772536_Velit_neque_amet_of_1571253670.jpg\"]', 1, '2019-10-16 19:21:10', '2019-10-16 19:21:10'),
(27, 'Aut ut laudantium r', 'Perspiciatis nobis', 4, '[\"public\\/backend\\/img\\/galleries\\/5060283_Aut_ut_laudantium_r_1571253690.jpeg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/5060283_Aut_ut_laudantium_r_1571253690.jpeg\"]', 1, '2019-10-16 19:21:30', '2019-10-16 19:21:30'),
(30, 'Cupidatat corporis o', 'Enim itaque vel aliq', 4, '[\"public\\/backend\\/img\\/galleries\\/9426382_Cupidatat_corporis_o_1571254565.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/9426382_Cupidatat_corporis_o_1571254565.jpg\"]', 1, '2019-10-16 19:36:05', '2019-10-16 19:36:05'),
(31, 'Deleniti et nostrum', 'Officia qui adipisci', 4, '[\"public\\/backend\\/img\\/galleries\\/7205698_Deleniti_et_nostrum_1571254577.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/7205698_Deleniti_et_nostrum_1571254577.jpg\"]', 1, '2019-10-16 19:36:17', '2019-10-16 19:36:17'),
(32, 'Nulla qui quaerat su', 'Magni consequatur a', 4, '[\"public\\/backend\\/img\\/galleries\\/6130995_Nulla_qui_quaerat_su_1571254630.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/6130995_Nulla_qui_quaerat_su_1571254630.jpg\"]', 1, '2019-10-16 19:37:10', '2019-10-16 19:37:10'),
(33, 'Saepe non rerum id e', 'Placeat quaerat sol', 4, '[\"public\\/backend\\/img\\/galleries\\/4851163_Saepe_non_rerum_id_e_1571254640.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/4851163_Saepe_non_rerum_id_e_1571254640.jpg\"]', 1, '2019-10-16 19:37:20', '2019-10-16 19:37:20'),
(35, 'Lorem Ipsum is simply dummy text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 8, '[\"public\\/backend\\/img\\/galleries\\/7239401_Lorem_Ipsum_is_simply_dummy_text_1571261612.jpg\",\"public\\/backend\\/img\\/galleries\\/6992626_Lorem_Ipsum_is_simply_dummy_text_1571261613.jpg\",\"public\\/backend\\/img\\/galleries\\/7137073_Lorem_Ipsum_is_simply_dummy_text_1571261613.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/7239401_Lorem_Ipsum_is_simply_dummy_text_1571261612.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/6992626_Lorem_Ipsum_is_simply_dummy_text_1571261613.jpg\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/7137073_Lorem_Ipsum_is_simply_dummy_text_1571261613.jpg\"]', 1, NULL, '2019-10-16 21:33:32'),
(36, 'Lorem Ipsum is simply dummy textf', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, '[\"public\\/backend\\/img\\/galleries\\/4882810_Lorem_Ipsum_is_simply_dummy_textf_1571333417.png\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/4882810_Lorem_Ipsum_is_simply_dummy_textf_1571333417.png\"]', 1, NULL, '2019-10-17 17:30:17'),
(37, 'Lorem Ipsum is simply dummymmm', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, '[\"public\\/backend\\/img\\/galleries\\/8953284_Lorem_Ipsum_is_simply_dummymmm_1571333382.jpg\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/8953284_Lorem_Ipsum_is_simply_dummymmm_1571333382.jpg\"]', 1, NULL, '2019-10-17 17:29:42'),
(38, 'Lorem Ipsum is simply dummy sdfdsfsdf', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, '[\"public\\/backend\\/img\\/galleries\\/620700_Lorem_Ipsum_is_simply_dummy_sdfdsfsdf_1571333355.png\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/620700_Lorem_Ipsum_is_simply_dummy_sdfdsfsdf_1571333355.png\"]', 1, NULL, '2019-10-17 17:29:15'),
(39, 'test', 'fdgdfg', 4, '[\"public\\/backend\\/img\\/galleries\\/4800556_test_1574702723000.png\",\"public\\/backend\\/img\\/galleries\\/5593265_test_1574702723000.png\",\"public\\/backend\\/img\\/galleries\\/6954342_test_1574702724000.png\",\"public\\/backend\\/img\\/galleries\\/6541021_test_1574702724000.png\",\"public\\/backend\\/img\\/galleries\\/5868634_test_1574702724000.png\"]', '[\"public\\/backend\\/img\\/galleries\\/thumbnail\\/4800556_test_1574702723000.png\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/5593265_test_1574702723000.png\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/6954342_test_1574702724000.png\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/6541021_test_1574702724000.png\",\"public\\/backend\\/img\\/galleries\\/thumbnail\\/5868634_test_1574702724000.png\"]', 1, '2019-11-25 17:25:23', '2019-11-25 17:25:23');

-- --------------------------------------------------------

--
-- Table structure for table `link_ads`
--

CREATE TABLE `link_ads` (
  `id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `cpc` float(8,2) NOT NULL,
  `hit_count` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `link_ads`
--

INSERT INTO `link_ads` (`id`, `link`, `cpc`, `hit_count`) VALUES
(9, 'https://shrinke.me/si0OObU', 30.00, 1),
(8, 'https://drive.google.com/file/d/1IrYrtzn0IZY-ZhDkZffaBWl7Yl3-sctS/view?usp=drivesdk', 60.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` int(11) UNSIGNED NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sounds_like` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `modal_offer`
--

CREATE TABLE `modal_offer` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modal_offer`
--

INSERT INTO `modal_offer` (`id`, `title`, `description`) VALUES
(1, 'Test title', '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) UNSIGNED NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `banner_img_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `uploader_id`, `title`, `description`, `status`, `created_at`, `updated_at`, `position`, `banner_img_name`) VALUES
(9, 12, 't', 'hi', 0, '2020-11-22 05:17:54', '2020-11-22 05:17:54', 0, '.webp'),
(10, 12, 'Privacy Policy 247trade Generator:', 'Effective: May 25th, 2019\r\nWe respect the privacy of users of our Service and visitors of our Site (“you”) and we are committed to protecting your online privacy. This Privacy Policy summarizes Genesis Mining, Ltd.’s and its affiliated entities’ (“Genesis Mining”, “we”, and “us”) procedures governing the collection, maintenance, and handling of your Personal Data.\r\nWe may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.\r\n1. Information Collection\r\nWe use your Personal Data for providing and improving our hosted blockchain and mining services (the “Service”) and improving your experience of the Site. “Personal Data” means any information relating to an identified or identifiable person. We collect information you provide us when creating an account for the Service. We also use various technologies to collect and store information, including cookies, pixel tags, local storage, such as browser web storage or application data caches, databases, and server logs.\r\nBy using the Service or accepting the terms of our Site, you agree to the collection and use of information in accordance with this Privacy Policy. Unless otherwise defined in this Privacy Policy, terms used in this Privacy Policy have the same meanings as in our terms and conditions, accessible at http://247trade-generator.com/\r\n1.1. Account Creation Information\r\nWhen you sign up for the Service or create an account on the Site, we collect and use the Personal Data you provide to us such as your name, email address, or billing information, credit card information, cryptocurrency wallet address, IP address, or other data that can be reasonably linked to such information by Genesis Mining, such as information we associate with your Genesis Mining Account and the Service provided to you. You will also be asked to choose a unique username and a password in order to sign up for the Service, which information will be used solely for the purpose of providing access to your user account. Upon signing up, you will have the option of securing your account by enabling the Google Authentication on Settings page. For account or password recoveries, you will be able to enter recovery email on the Settings page.\r\nIf you are opening an account for your clients as a business user, you certify that where you have provided information regarding them you have received prior consent to provide their Personal Data to us and that you have informed them for the present Privacy Policy, to which they have agreed.\r\n1.2. Log Information\r\nGenesis Mining collects information that your browser sends whenever you visit our Site and log into your account (“Log Data”). This Log Data may include information such as your computer’s Internet Protocol (“IP”) address, browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages and other statistics. In addition, we may use third-party services such as Google Analytics that collect, monitor and analyze this type of information in order to increase our Service’s functionality. These third-party service providers have their own privacy policies addressing how they use such information. These third-party service providers have limited access only to your Personal Data necessary to perform the tasks for which they were engaged for our behalf and are contractually bound to protect and use it only for the purposes for which it was disclosed.\r\n1.3. Information on Cookies\r\nPlease be informed about how we use “cookies” by reading our Cookie Policy.\r\n2. Service Providers\r\nWe may engage third party companies and individuals to facilitate our Service, to provide the Service on our behalf, to perform Service-related services or to assist us in analyzing how our Service is used. These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.\r\n3. Compliance with Laws\r\nWe will disclose your Personal Data where required to do so by law or subpoena or if we believe that such action is necessary to comply with the law and the reasonable requests of law enforcement or to protect the as is set forth in the General Data Protection Regulation of the European Union. Residents of the European Union, the European Economic Area and Switzerland who visit the Site or use the Service have the following legal data protection rights under the relevant legal conditions: right to information, right to erasure, right to rectification, right to access by the data subject (Article 15 GDPR), right to deletion (Article 17 GDPR), right to correction (Article 16 GDPR), right to restriction of processing (Article 18 GDPR), right to data portability (Article 20 GDPR), right to lodge a complaint with a supervisory authority (Article 77 GDPR), right to withdraw consent (Article 7 (3) GDPR) as well as the right to object to particular data processing measures (Article 21 GDPR). These users have the right of access of their Personal Data and may at any time unsubscribe from our newsletter.\r\n4. Information Security\r\nGenesis Mining has adopted reasonably designed industry appropriate data collection, storage, and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure or destruction of your Personal Data, username, password, transaction information and data stored in your user account. Our employees are restricted from accessing user’s names and email addresses on a need to know basis. The security of Personal Data is important to us, but we remind users that no method of transmission over the Internet, or method of electronic storage is 100% secure. While we strive to use effective measures and tools for protection of your Personal Data, we cannot guarantee 100% security and protection of such information.\r\n5. International Data Transfers\r\nYour information, including Personal Data, may be transferred to, and maintained on, computers and systems located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from your jurisdiction. Your consent to this Privacy Policy followed by your submission of such information represents your agreement to such transfers. We will protect the privacy and security of Personal Data we collect in accordance with this Privacy Policy, regardless of where it is processed or stored.\r\n6. Links to Other Sites\r\nOur Service may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third party’s site. We strongly advise you to review the Privacy Policy of every site you visit. Genesis Mining has no control over, and assume no responsibility for the content, privacy policies or practices of any third party sites or services.\r\n7. Children’s Privacy\r\nThe Site is not directed at person under the age of eighteen (18). In general, and with certain exception, privacy laws, including the General Data Protection Regulation, generally require that the collection of Personal Data of persons under the age of sixteen (16) (“Children”) requires parental consent. Further, if the member state of the European Union has not provided a lower age limit (provided that such lower age is not under 13 years), the General Data Protection Regulation obliges parents to give a consent. If you are a parent or guardian and you are aware that your Children has provided us with Personal Data, please contact us. If we discover that a person under the age of 16 has provided use us with Personal Data, we will delete such information from our servers immediately.\r\n8. Changes to your Personal Data\r\nIn the event we decide to use your Personal Data for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt out of the usage of your Personal Data for those other purposes. From time to time, we may send emails to you regarding new services, releases and upcoming events (“Newsletters”) . You may opt out of receiving newsletters and other secondary messages from Genesis Mining by selecting the ‘unsubscribe’ function present in every email we send. However, users of the Service shall continue to receive essential Service related emails.\r\n9. Will my data be deleted?\r\nWe will store your personal data as long as is necessary for the purposes set forth in this Privacy Policy and to satisfy our contractual and legal obligations. We may also store your personal data for other purposes if or as long as the law allows us store it for particular purposes, including for defense against legal claims.\r\n10. Newsletter\r\nUsers may subscribe to our Newsletter through the Site to receive information about the Service and new service offerings. To receive our Newsletter, users must provide a valid email address and will, in turn, receive a confirmation email for the user to verify and authorize use of the email address as a recipient of the Newsletter. We will store the IP address and date and time of each Newsletter subscription to identify when an unauthorized third party’s email subscribed to our Newsletter. We will not collect any other data and will not transfer this information to third parties except when required legally obliged to for the establishment, exercise or defense of legal claims. You may cancel your subscription to the Newsletter at any time. You will find additional details in the subscription confirmation that we will send to your E-mail address as well as in each Newsletter.\r\n11. How to Contact Us\r\nIf you have any questions regarding this Privacy Policy, please contact us by email at helpteam@247trade-generator.com or help.center247@aol.com write us at:\r\nStreet: 146  Saint Marys Avenue \r\nCity: Massena \r\nState: NY \r\nState Full: New York \r\nZip Code: 13662', 0, '2020-11-22 05:18:28', '2020-11-22 05:18:28', 0, '.webp'),
(11, 12, 'Privacy Policy 247trade Generator:', 'Effective: May 25th, 2019\r\nWe respect the privacy of users of our Service and visitors of our Site (“you”) and we are committed to protecting your online privacy. This Privacy Policy summarizes Genesis Mining, Ltd.’s and its affiliated entities’ (“Genesis Mining”, “we”, and “us”) procedures governing the collection, maintenance, and handling of your Personal Data.\r\nWe may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.', 1, '2020-11-22 05:19:14', '2020-11-22 05:19:14', 0, '.webp'),
(12, 12, '1. Information Collection', 'We use your Personal Data for providing and improving our hosted blockchain and mining services (the “Service”) and improving your experience of the Site. “Personal Data” means any information relating to an identified or identifiable person. We collect information you provide us when creating an account for the Service. We also use various technologies to collect and store information, including cookies, pixel tags, local storage, such as browser web storage or application data caches, databases, and server logs.\r\nBy using the Service or accepting the terms of our Site, you agree to the collection and use of information in accordance with this Privacy Policy. Unless otherwise defined in this Privacy Policy, terms used in this Privacy Policy have the same meanings as in our terms and conditions, accessible at http://247trade-generator.com/', 1, '2020-11-22 05:19:38', '2020-11-22 05:19:38', 0, '.webp'),
(13, 12, '1.1. Account Creation Information', 'When you sign up for the Service or create an account on the Site, we collect and use the Personal Data you provide to us such as your name, email address, or billing information, credit card information, cryptocurrency wallet address, IP address, or other data that can be reasonably linked to such information by Genesis Mining, such as information we associate with your Genesis Mining Account and the Service provided to you. You will also be asked to choose a unique username and a password in order to sign up for the Service, which information will be used solely for the purpose of providing access to your user account.', 1, '2020-11-22 05:20:03', '2020-11-22 05:20:03', 0, '.webp'),
(14, 12, '1.2', 'Upon signing up, you will have the option of securing your account by enabling the Google Authentication on Settings page. For account or password recoveries, you will be able to enter recovery email on the Settings page.\r\nIf you are opening an account for your clients as a business user, you certify that where you have provided information regarding them you have received prior consent to provide their Personal Data to us and that you have informed them for the present Privacy Policy, to which they have agreed.', 1, '2020-11-22 05:20:15', '2020-11-22 05:20:15', 0, '.webp'),
(15, 12, '1.2. Log Information', 'Genesis Mining collects information that your browser sends whenever you visit our Site and log into your account (“Log Data”). This Log Data may include information such as your computer’s Internet Protocol (“IP”) address, browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages and other statistics. In addition, we may use third-party services such as Google Analytics that collect, monitor and analyze this type of information in order to increase our Service’s functionality. These third-party service providers have their own privacy policies addressing how they use such information. These third-party service providers have limited access only to your Personal Data necessary to perform the tasks for which they were engaged for our behalf and are contractually bound to protect and use it only for the purposes for which it was disclosed.', 1, '2020-11-22 05:20:31', '2020-11-22 05:20:31', 0, '.webp'),
(16, 12, '1.3. Information on Cookies', 'Please be informed about how we use “cookies” by reading our Cookie Policy.', 1, '2020-11-22 05:20:44', '2020-11-22 05:20:44', 0, '.webp'),
(17, 12, '2. Service Providers', 'We may engage third party companies and individuals to facilitate our Service, to provide the Service on our behalf, to perform Service-related services or to assist us in analyzing how our Service is used. These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.', 1, '2020-11-22 05:20:58', '2020-11-22 05:20:58', 0, '.webp'),
(18, 12, '3. Compliance with Laws', 'We will disclose your Personal Data where required to do so by law or subpoena or if we believe that such action is necessary to comply with the law and the reasonable requests of law enforcement or to protect the as is set forth in the General Data Protection Regulation of', 1, '2020-11-22 05:21:31', '2020-11-22 05:21:31', 0, '.webp'),
(19, 12, '3. Compliance with Laws 2 Page', 'the European Union. Residents of the European Union, the European Economic Area and Switzerland who visit the Site or use the Service have the following legal data protection rights under the relevant legal conditions: right to information, right to erasure, right to rectification, right to access by the data subject (Article 15 GDPR), right to deletion (Article 17 GDPR), right to correction (Article 16 GDPR), right to restriction of processing (Article 18 GDPR), right to data portability (Article 20 GDPR), right to lodge a complaint with a supervisory authority (Article 77 GDPR), right to withdraw consent (Article 7 (3) GDPR) as well as the right to object to particular data processing measures (Article 21 GDPR). These users have the right of access of their Personal Data and may at any time unsubscribe from our newsletter.', 1, '2020-11-22 05:21:49', '2020-11-22 05:21:49', 0, '.webp'),
(20, 12, '4. Information Security', 'Genesis Mining has adopted reasonably designed industry appropriate data collection, storage, and processing practices and security measures, as well as physical security measures to protect against unauthorized access, alteration, disclosure or destruction of your Personal Data, username, password, transaction information and data stored in your user account. Our employees are restricted from accessing user’s names and email addresses on a need to know basis. The security of Personal Data is important to us, but we remind users that no method of transmission over the Internet, or method of electronic storage is 100% secure. While we strive to use effective measures and tools for protection of your Personal Data, we cannot guarantee 100% security and protection of such information.', 1, '2020-11-22 05:22:03', '2020-11-22 05:22:03', 0, '.webp'),
(21, 12, '5. International Data Transfers', 'Your information, including Personal Data, may be transferred to, and maintained on, computers and systems located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from your jurisdiction. Your consent to this Privacy Policy followed by your submission of such information represents your agreement to such transfers. We will protect the privacy and security of Personal Data we collect in accordance with this Privacy Policy, regardless of where it is processed or stored.', 1, '2020-11-22 05:22:17', '2020-11-22 05:22:17', 0, '.webp'),
(22, 12, '6. Links to Other Sites', 'Our Service may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third party’s site. We strongly advise you to review the Privacy Policy of every site you visit. Genesis Mining has no control over, and assume no responsibility for the content, privacy policies or practices of any third party sites or services.', 1, '2020-11-22 05:22:33', '2020-11-22 05:22:33', 0, '.webp'),
(23, 12, '7. Children’s Privacy', 'The Site is not directed at person under the age of eighteen (18). In general, and with certain exception, privacy laws, including the General Data Protection Regulation, generally require that the collection of Personal Data of persons under the age of sixteen (16) (“Children”) requires parental consent. Further, if the member state of the European Union has not provided a lower age limit (provided that such lower age is not under 13 years), the General Data Protection Regulation obliges parents to give a consent. If you are a parent or guardian and you are aware that your Children has provided us with Personal Data, please contact us. If we discover that a person under the age of 16 has provided use us with Personal Data, we will delete such information from our servers immediately.', 1, '2020-11-22 05:22:46', '2020-11-22 05:22:46', 0, '.webp'),
(24, 12, '8. Changes to your Personal Data', 'In the event we decide to use your Personal Data for any purpose other than as stated in this Privacy Policy Statement, we will offer you an effective way to opt out of the usage of your Personal Data for those other purposes. From time to time, we may send emails to you regarding new services, releases and upcoming events (“Newsletters”) . You may opt out of receiving newsletters and other secondary messages from Genesis Mining by selecting the ‘unsubscribe’ function present in every email we send. However, users of the Service shall continue to receive essential Service related emails.', 1, '2020-11-22 05:22:59', '2020-11-22 05:22:59', 0, '.webp'),
(25, 12, '9. Will my data be deleted?', 'We will store your personal data as long as is necessary for the purposes set forth in this Privacy Policy and to satisfy our contractual and legal obligations. We may also store your personal data for other purposes if or as long as the law allows us store it for particular purposes, including for defense against legal claims.', 1, '2020-11-22 05:23:14', '2020-11-22 05:23:14', 0, '.webp'),
(26, 12, '10. Newsletter', 'Users may subscribe to our Newsletter through the Site to receive information about the Service and new service offerings. To receive our Newsletter, users must provide a valid email address and will, in turn, receive a confirmation email for the user to verify and authorize use of the email address as a recipient of the Newsletter. We will store the IP address and date and time of each Newsletter subscription to identify when an unauthorized', 1, '2020-11-22 05:23:27', '2020-11-22 05:23:27', 0, '.webp'),
(27, 12, 'News 2n Page', 'third party’s email subscribed to our Newsletter. We will not collect any other data and will not transfer this information to third parties except when required legally obliged to for the establishment, exercise or defense of legal claims. You may cancel your subscription to the Newsletter at any time. You will find additional details in the subscription confirmation that we will send to your E-mail address as well as in each Newsletter.', 1, '2020-11-22 05:23:40', '2020-11-22 05:23:40', 0, '.webp'),
(28, 12, '11. How to Contact Us', 'If you have any questions regarding this Privacy Policy, please contact us by email at helpteam@247trade-generator.com or help.center247@aol.com write us at:\r\nStreet: 146  Saint Marys Avenue \r\nCity: Massena \r\nState: NY \r\nState Full: New York \r\nZip Code: 13662', 1, '2020-11-22 05:23:55', '2020-11-22 05:23:55', 0, '.webp');

-- --------------------------------------------------------

--
-- Table structure for table `ordered_product_list`
--

CREATE TABLE `ordered_product_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `sku_id` bigint(20) UNSIGNED NOT NULL COMMENT 'this field help to get image of specific product',
  `order_code` bigint(20) UNSIGNED NOT NULL,
  `product_code` bigint(20) UNSIGNED NOT NULL COMMENT 'if i need more information about this product i''ll use this code',
  `product_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_price` int(11) NOT NULL,
  `prev_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_status` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT 'pending/processing/shifted/delivered/cancelled',
  `action_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT 'to identify when user delete order from there panel'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ordered_product_list`
--

INSERT INTO `ordered_product_list` (`id`, `date`, `time`, `sku_id`, `order_code`, `product_code`, `product_name`, `current_price`, `prev_price`, `quantity`, `delivery_status`, `action_by`) VALUES
(1, '2020-04-21', '22:19:18', 29, 12674249, 36112035, 'Long Lemon 4 pcs', 60, 0, 1, 'pending', 'admin'),
(2, '2020-04-21', '22:19:18', 17, 12674249, 77402136, 'Green Chili 200 gm', 80, 0, 1, 'pending', 'admin'),
(3, '2020-04-21', '22:19:18', 30, 12674249, 55336102, 'Green Capsicum (Net Weight ± 20 gm) 250 gm', 40, 50, 2, 'pending', 'admin'),
(4, '2020-04-22', '10:59:26', 29, 30529541, 36112035, 'Long Lemon 4 pcs', 60, 0, 2, 'delivered', 'admin'),
(5, '2020-04-22', '10:59:26', 17, 30529541, 77402136, 'Green Chili 200 gm', 80, 0, 1, 'delivered', 'admin'),
(6, '2020-04-22', '10:59:26', 30, 30529541, 55336102, 'Green Capsicum (Net Weight ± 20 gm) 250 gm', 40, 50, 3, 'delivered', 'admin'),
(7, '2020-04-22', '10:59:26', 32, 30529541, 2253979, 'Kacha Holud 250 gm', 110, 0, 1, 'delivered', 'admin'),
(8, '2020-07-09', '16:59:11', 29, 57333076, 36112035, 'Long Lemon 4 pcs', 60, 0, 2, 'delivered', 'admin'),
(9, '2020-07-09', '16:59:11', 17, 57333076, 77402136, 'Green Chili 200 gm', 80, 0, 2, 'delivered', 'admin'),
(10, '2020-07-09', '16:59:11', 30, 57333076, 55336102, 'Green Capsicum (Net Weight ± 20 gm) 250 gm', 40, 50, 3, 'delivered', 'admin'),
(11, '2020-07-09', '16:59:11', 32, 57333076, 2253979, 'Kacha Holud 250 gm', 110, 0, 1, 'delivered', 'admin'),
(12, '2020-05-09', '23:27:40', 29, 29180104, 36112035, 'Long Lemon 4 pcs', 60, 0, 2, 'pending', 'admin'),
(13, '2020-05-09', '23:27:40', 17, 29180104, 77402136, 'Green Chili 200 gm', 80, 0, 2, 'pending', 'admin'),
(14, '2020-05-09', '23:27:40', 30, 29180104, 55336102, 'Green Capsicum (Net Weight ± 20 gm) 250 gm', 40, 50, 3, 'pending', 'admin'),
(15, '2020-05-09', '23:27:40', 32, 29180104, 2253979, 'Kacha Holud 250 gm', 110, 0, 1, 'pending', 'admin'),
(16, '2020-05-09', '23:27:41', 25, 29180104, 30023732, 'Coriander Leaves 100 gm', 100, 0, 1, 'pending', 'admin'),
(17, '2020-07-23', '16:47:34', 4, 69105583, 72790056, 'eFEMamNkr5', 60, 60, 6, 'delivered', 'admin'),
(18, '2020-07-23', '17:28:34', 4, 44206160, 72790056, 'eFEMamNkr5', 60, 60, 6, 'delivered', 'admin'),
(44, '2020-07-24', '16:41:41', 7, 58821398, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'cancelled', 'admin'),
(45, '2020-07-24', '16:41:41', 6, 58821398, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 2, 'cancelled', 'admin'),
(46, '2020-08-07', '12:47:36', 7, 60894470, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'cancelled', 'admin'),
(47, '2020-08-07', '12:47:36', 6, 60894470, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 3, 'cancelled', 'admin'),
(48, '2020-07-27', '16:17:47', 7, 36024154, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'delivered', 'admin'),
(49, '2020-07-27', '16:17:47', 17, 36024154, 24972526, 'Khusboo Premium Chinigura Rice', 130, 0, 1, 'delivered', 'admin'),
(50, '2020-07-27', '16:17:47', 20, 36024154, 66894973, 'PRAN Nazirshail Rice', 402, 0, 1, 'delivered', 'admin'),
(51, '2020-07-27', '16:17:47', 28, 36024154, 75105556, 'Teer Chinigura Rice', 130, 0, 1, 'delivered', 'admin'),
(52, '2020-07-27', '16:17:47', 26, 36024154, 99870466, 'Aarong Nazirshail Rice', 430, 0, 1, 'delivered', 'admin'),
(53, '2020-08-07', '12:04:02', 2144, 45750497, 26052884, 'Odonil Zipper Lavender', 60, 0, 1, 'delivered', 'admin'),
(54, '2020-08-07', '12:04:02', 43, 45750497, 90531026, 'Anmol Aromatic Chinigura Rice', 125, 0, 1, 'delivered', 'admin'),
(55, '2020-08-07', '12:04:02', 568, 45750497, 4574086, 'Nocilla Two Colour Chocolate', 275, 275, 2, 'delivered', 'admin'),
(56, '2020-08-06', '17:10:55', 2448, 18276013, 29617740, 'Godrej Good Knight Power Activ   Cartridge', 120, 0, 1, 'cancelled', 'admin'),
(57, '2020-08-06', '17:10:55', 2449, 18276013, 51527181, 'Super Action Booster Mosquito Coil', 30, 0, 1, 'cancelled', 'admin'),
(58, '2020-08-06', '17:10:55', 2450, 18276013, 42406445, 'Finis Insect Powder', 40, 0, 1, 'cancelled', 'admin'),
(59, '2020-08-07', '12:04:00', 2441, 82250386, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'delivered', 'admin'),
(60, '2020-08-07', '12:04:00', 2444, 82250386, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 1, 'delivered', 'admin'),
(61, '2020-08-07', '12:04:00', 2445, 82250386, 6535598, 'Naphthalene Ball', 150, 0, 3, 'delivered', 'admin'),
(62, '2020-08-18', '18:20:24', 2440, 87042648, 31716849, 'Fay Multi Fold Hand Towel', 150, 0, 1, 'cancelled', 'admin'),
(63, '2020-08-18', '18:20:24', 2441, 87042648, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'cancelled', 'admin'),
(64, '2020-08-18', '18:20:24', 2444, 87042648, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 1, 'cancelled', 'admin'),
(71, '2020-08-07', '12:03:59', 2441, 84009565, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'delivered', 'admin'),
(72, '2020-08-07', '12:03:59', 2444, 84009565, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 1, 'delivered', 'admin'),
(73, '2020-08-07', '12:03:59', 2445, 84009565, 6535598, 'Naphthalene Ball', 150, 0, 1, 'delivered', 'admin'),
(74, '2020-08-07', '13:39:27', 1500, 7708830, 85583197, 'Mango Fazli (Net Weight ± 50 gm)', 249, 0, 1, 'delivered', 'admin'),
(75, '2020-08-07', '13:39:27', 1501, 7708830, 61703248, 'Pineapple', 49, 0, 1, 'delivered', 'admin'),
(76, '2020-08-07', '13:39:27', 1502, 7708830, 30883068, 'Green Coconut (Daab)', 59, 0, 1, 'delivered', 'admin'),
(77, '2020-08-07', '12:03:58', 1476, 70772115, 26507094, 'Sajeeb Hot Tomato Sauce', 85, 0, 1, 'delivered', 'admin'),
(81, '2020-08-07', '12:03:56', 2449, 39812274, 51527181, 'Super Action Booster Mosquito Coil', 30, 0, 1, 'delivered', 'admin'),
(87, '2020-08-18', '18:14:39', 2452, 51742192, 16655477, 'Odomos Mosquito Repellent Cream', 130, 0, 1, 'cancelled', 'admin'),
(88, '2020-08-18', '18:14:39', 2451, 51742192, 71649855, 'Finis Insect Powder', 40, 0, 1, 'cancelled', 'admin'),
(89, '2020-08-18', '18:02:09', 2440, 246685, 31716849, 'Fay Multi Fold Hand Towel', 150, 0, 1, 'cancelled', 'admin'),
(90, '2020-08-18', '18:02:09', 2441, 246685, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'cancelled', 'admin'),
(91, '2020-08-18', '18:02:09', 2444, 246685, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 1, 'cancelled', 'admin'),
(92, '2020-08-18', '18:02:08', 539, 11394375, 68142848, 'Kellogg\'s Chocos', 345, 0, 1, 'cancelled', 'admin'),
(93, '2020-08-18', '18:02:08', 2455, 11394375, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill', 100, 0, 1, 'cancelled', 'admin'),
(94, '2020-08-18', '18:02:08', 547, 11394375, 43078399, 'Sajeeb Corn Flakes', 155, 0, 1, 'cancelled', 'admin'),
(95, '2020-08-18', '18:02:08', 564, 11394375, 73691982, 'Premium Grade Fig Muesli', 680, 0, 1, 'cancelled', 'admin'),
(96, '2020-08-18', '18:02:08', 1481, 69160768, 47265067, 'Shezan Tomato Ketchup', 90, 0, 1, 'cancelled', 'admin'),
(97, '2020-08-18', '18:02:08', 1483, 69160768, 93344996, 'Ahmed Hot Chilli Sauce', 95, 0, 1, 'cancelled', 'admin'),
(98, '2020-08-18', '18:02:08', 1491, 69160768, 82235730, 'Ahmed Family Combo Offer (Free Busket)', 650, 0, 1, 'cancelled', 'admin'),
(99, '2020-08-18', '18:02:08', 1489, 69160768, 35217526, 'King Bell Chili Sauce', 130, 0, 1, 'cancelled', 'admin'),
(100, '2020-08-18', '18:02:07', 2450, 17202569, 42406445, 'Finis Insect Powder', 40, 0, 1, 'cancelled', 'admin'),
(101, '2020-08-18', '18:02:07', 2456, 17202569, 40329674, 'Elephant King Jumbo Violet Mosquito Coil', 50, 0, 1, 'cancelled', 'admin'),
(102, '2020-08-07', '18:03:10', 2445, 73346709, 6535598, 'Naphthalene Ball', 150, 0, 1, 'pending', 'admin'),
(103, '2020-08-07', '18:03:10', 2441, 73346709, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'pending', 'admin'),
(104, '2020-08-07', '18:03:10', 2444, 73346709, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 1, 'pending', 'admin'),
(105, '2020-08-18', '18:02:06', 2445, 67616054, 6535598, 'Naphthalene Ball', 150, 0, 1, 'cancelled', 'admin'),
(106, '2020-08-18', '18:02:06', 2441, 67616054, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'pending', 'admin'),
(107, '2020-08-18', '18:02:06', 2444, 67616054, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 6, 'cancelled', 'admin'),
(108, '2020-08-18', '18:02:06', 3310, 67616054, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 3, 'cancelled', 'admin'),
(109, '2020-08-18', '18:02:06', 3310, 67616054, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 3, 'cancelled', 'admin'),
(110, '2020-08-18', '18:02:06', 61, 67616054, 65536551, 'Neelam Rozana Long Grain Aromatic Rice', 220, 0, 1, 'pending', 'admin'),
(111, '2020-08-18', '18:02:06', 424, 67616054, 36940522, 'Tamarind peeled (Tetul)', 35, 0, 3, 'pending', 'admin'),
(112, '2020-09-02', '18:37:35', 12, 18718083, 47918662, 'Atop Rice', 45, 0, 1, 'cancelled', 'admin'),
(113, '2020-09-02', '18:37:35', 2581, 18718083, 44941331, 'Clariss Baby Wipes (Sensitive)', 220, 0, 1, 'cancelled', 'admin'),
(135, '2020-09-03', '14:20:18', 2441, 48773764, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'cancelled', 'admin'),
(136, '2020-09-03', '14:20:18', 2457, 48773764, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'cancelled', 'admin'),
(137, '2020-09-03', '14:20:18', 2458, 48773764, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'cancelled', 'admin'),
(138, '2020-09-03', '14:20:18', 2459, 48773764, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'cancelled', 'admin'),
(141, '2020-09-01', '14:14:19', 2451, 28926743, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 2, 'pending', 'admin'),
(142, '2020-09-01', '14:15:47', 2451, 31556841, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 2, 'pending', 'admin'),
(148, '2020-09-02', '18:30:24', 3, 50420990, 93345059, 'Lifeboy', 32, 0, 1, 'delivered', 'admin'),
(149, '2020-09-02', '18:30:24', 23, 50420990, 95340284, 'Shashya Prabartana Sundarban Honey - 500 gm', 350, 0, 1, 'delivered', 'admin'),
(151, '2020-09-02', '18:30:24', 21, 50420990, 82426852, 'BPM Chinigura Rice (Khud) - 1 kg', 70, 0, 1, 'delivered', 'admin'),
(152, '2020-09-01', '18:11:52', 13, 95557631, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(153, '2020-09-01', '18:11:52', 8, 95557631, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(154, '2020-09-01', '18:11:52', 2452, 95557631, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(155, '2020-09-02', '17:50:23', 2452, 46765428, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(156, '2020-09-02', '17:50:23', 2454, 46765428, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(157, '2020-09-02', '17:50:23', 2456, 46765428, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(158, '2020-09-02', '18:13:40', 2441, 22146639, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 2, 'pending', 'admin'),
(159, '2020-09-02', '18:13:40', 2434, 22146639, 27953557, 'Fresh Hand Towel (250X1 Ply) each', 78, 78, 2, 'pending', 'admin'),
(160, '2020-09-02', '18:13:40', 2450, 22146639, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 2, 'pending', 'admin'),
(161, '2020-09-02', '18:13:40', 2449, 22146639, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(162, '2020-09-02', '18:24:52', 2449, 10277443, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(163, '2020-09-02', '18:24:52', 2456, 10277443, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(164, '2020-09-02', '18:24:52', 2455, 10277443, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 2, 'pending', 'admin'),
(165, '2020-09-02', '18:24:52', 2458, 10277443, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 2, 'pending', 'admin'),
(166, '2020-09-02', '18:24:52', 2459, 10277443, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(167, '2020-09-02', '18:24:52', 2451, 10277443, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(168, '2020-09-02', '18:30:24', 6, 50420990, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'delivered', 'admin'),
(169, '2020-09-02', '18:30:24', 8, 50420990, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'delivered', 'admin'),
(179, '2020-09-02', '18:39:00', 2454, 54570661, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(180, '2020-09-02', '18:39:00', 2456, 54570661, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(181, '2020-09-02', '18:39:00', 6, 54570661, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(182, '2020-09-02', '18:43:34', 2454, 48816514, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'cancelled', 'admin'),
(183, '2020-09-02', '18:43:34', 2456, 48816514, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'cancelled', 'admin'),
(184, '2020-09-02', '18:43:34', 6, 48816514, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'cancelled', 'admin'),
(185, '2020-09-02', '18:43:34', 7, 48816514, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'cancelled', 'admin'),
(186, '2020-09-02', '18:43:34', 16, 48816514, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'cancelled', 'admin'),
(187, '2020-09-02', '18:43:34', 2150, 48816514, 95781296, 'Spring Air Freshener Lemon Fresh 300 ml', 215, 0, 1, 'cancelled', 'admin'),
(188, '2020-09-02', '18:43:34', 2145, 48816514, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 1, 'cancelled', 'admin'),
(189, '2020-09-02', '20:45:36', 13, 15232080, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(190, '2020-09-02', '20:45:36', 8, 15232080, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(191, '2020-09-02', '20:45:36', 2452, 15232080, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(192, '2020-09-02', '20:45:36', 2453, 15232080, 97772298, 'ACI Cockroach Spray 400 ml', 280, 280, 1, 'pending', 'admin'),
(193, '2020-09-02', '20:45:36', 2454, 15232080, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(194, '2020-09-02', '20:45:36', 2459, 15232080, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(195, '2020-09-02', '23:02:09', 7, 8777418, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 2, 'delivered', 'admin'),
(196, '2020-09-02', '23:02:09', 1521, 8777418, 59706702, 'Onion (Local) 1 kg', 45, 0, 5, 'delivered', 'admin'),
(197, '2020-09-02', '23:02:09', 1523, 8777418, 37257663, 'Garlic Imported (Net Weight ± 10 gm) 250 gm', 29, 0, 4, 'delivered', 'admin'),
(198, '2020-09-02', '23:02:09', 275, 8777418, 25119021, 'Arku Chilli Powder - 200 gm', 95, 0, 1, 'delivered', 'admin'),
(199, '2020-09-02', '23:02:09', 12, 8777418, 47918662, 'Atop Rice - 1kg', 45, 0, 2, 'delivered', 'admin'),
(200, '2020-09-02', '23:02:09', 225, 8777418, 4600203, 'Rupchanda Soyabean Oil - 5 ltr', 525, 0, 1, 'delivered', 'admin'),
(201, '2020-09-02', '23:02:09', 258, 8777418, 91093912, 'Fresh Mustard Oil - 500 ml', 120, 0, 1, 'delivered', 'admin'),
(202, '2020-09-02', '23:02:09', 170, 8777418, 60165346, 'Garam Masala Powder - 50 gm', 75, 0, 1, 'delivered', 'admin'),
(203, '2020-09-02', '23:02:09', 879, 8777418, 28269584, 'Nestlé MAGGI 2-Minute Noodles Masala 8 Pack 496 gm', 135, 0, 1, 'delivered', 'admin'),
(204, '2020-09-02', '23:02:09', 988, 8777418, 99312801, 'Safari Chocolate Bar 12 gm', 20, 0, 5, 'delivered', 'admin'),
(205, '2020-09-02', '23:02:09', 1444, 8777418, 34634776, 'PRAN Hot Tomato Sauce 340 gm', 90, 0, 1, 'delivered', 'admin'),
(207, '2020-09-02', '23:02:09', 1418, 8777418, 32961964, 'PRAN White Vinegar 650 ml', 55, 0, 1, 'delivered', 'admin'),
(208, '2020-09-02', '23:02:09', 588, 8777418, 69627896, 'Ispahani Mirzapore Best Leaf Tea 400 gm', 210, 0, 1, 'delivered', 'admin'),
(209, '2020-09-02', '23:02:09', 593, 8777418, 43566755, 'Lipton Green Tea Bag Honey and Lemon 25 pcs', 140, 0, 1, 'delivered', 'admin'),
(210, '2020-09-02', '23:02:09', 381, 8777418, 25449427, 'Fresh Refined Sugar - 1 kg', 66, 0, 1, 'delivered', 'admin'),
(211, '2020-09-02', '23:02:09', 1631, 8777418, 21480448, 'Broiler Chicken Skin Off (Net Weight ± 50 gm) 1 kg', 229, 0, 1, 'delivered', 'admin'),
(212, '2020-09-02', '23:02:09', 1630, 8777418, 59876030, 'Beef Bone In (Net Weight ± 50 gm) 1 kg', 575, 0, 1, 'delivered', 'admin'),
(213, '2020-09-02', '23:02:09', 1971, 8777418, 90346085, 'Dabur Honey 250 gm', 200, 0, 1, 'delivered', 'admin'),
(214, '2020-09-02', '23:02:09', 1448, 8777418, 88859267, 'Ahmed Soya Sauce 500 ml', 110, 0, 1, 'delivered', 'admin'),
(215, '2020-09-03', '10:20:50', 2152, 16595340, 5570527, 'Fay Air Freshener Lime 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(228, '2020-09-03', '13:13:54', 2441, 32661233, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'cancelled', 'user'),
(229, '2020-09-03', '13:13:54', 2449, 32661233, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'cancelled', 'user'),
(230, '2020-09-03', '13:13:54', 2450, 32661233, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'cancelled', 'user'),
(231, '2020-09-03', '13:22:02', 2451, 99820596, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'cancelled', 'user'),
(232, '2020-09-03', '13:22:02', 2455, 99820596, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'cancelled', 'user'),
(233, '2020-09-03', '13:22:02', 2458, 99820596, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'cancelled', 'user'),
(234, '2020-09-03', '13:38:11', 7, 56821392, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(242, '2020-09-03', '14:06:31', 3344, 9812834, 59223019, 'Horlicks Standard Jar 500 gm', 350, 0, 15, 'pending', 'admin'),
(243, '2020-09-03', '14:06:31', 3345, 9812834, 83498594, 'Horlicks Standard Jar 250 gm', 190, 190, 4, 'pending', 'admin'),
(244, '2020-09-03', '14:35:50', 1501, 60668970, 61703248, 'Pineapple each', 49, 0, 1, 'delivered', 'admin'),
(245, '2020-09-03', '14:35:50', 1504, 60668970, 33443447, 'Green Apple (Net Weight ± 50 gm) 1 kg', 169, 0, 1, 'delivered', 'admin'),
(246, '2020-09-03', '14:35:50', 1502, 60668970, 30883068, 'Green Coconut (Daab) each', 59, 0, 3, 'delivered', 'admin'),
(247, '2020-09-03', '14:35:50', 1530, 60668970, 40146539, 'Coriander Leaves 100 gm', 15, 0, 1, 'delivered', 'admin'),
(248, '2020-09-03', '14:35:50', 1531, 60668970, 88375979, 'Carrot (Net Weight ± 20 gm) 500 gm', 29, 0, 1, 'delivered', 'admin'),
(249, '2020-09-03', '14:35:50', 1573, 60668970, 1697086, 'Betel Leaf 30 pcs', 50, 0, 1, 'delivered', 'admin'),
(250, '2020-09-03', '14:35:50', 1570, 60668970, 69680818, 'Small Potato (Jaam Alu) 1 kg', 55, 0, 1, 'delivered', 'admin'),
(251, '2020-09-03', '14:37:00', 3310, 99820596, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 100, 'pending', 'admin'),
(252, '2020-09-03', '15:50:14', 7, 4718297, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(253, '2020-09-03', '15:50:14', 2451, 4718297, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(254, '2020-09-03', '15:50:14', 2452, 4718297, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(255, '2020-09-03', '22:34:39', 2441, 28929884, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(256, '2020-09-03', '22:34:39', 2449, 28929884, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(257, '2020-09-03', '23:52:03', 1531, 28917157, 88375979, 'Carrot (Net Weight ± 20 gm) 500 gm', 29, 0, 1, 'pending', 'admin'),
(258, '2020-09-03', '23:52:03', 2081, 28917157, 49375356, 'Teer Maida Flour 2 kg', 92, 0, 1, 'pending', 'admin'),
(259, '2020-09-03', '23:52:03', 1523, 28917157, 37257663, 'Garlic Imported (Net Weight ± 10 gm) 250 gm', 29, 0, 1, 'pending', 'admin'),
(264, '2020-09-04', '10:58:11', 6, 17313646, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(265, '2020-09-04', '10:58:11', 13, 17313646, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(266, '2020-09-04', '10:58:11', 20, 17313646, 66894973, 'PRAN Nazirshail Rice - 5kg', 402, 0, 1, 'pending', 'admin'),
(267, '2020-09-04', '10:58:11', 25, 17313646, 99145703, 'BPM White Binni Rice - 1 kg', 100, 0, 1, 'pending', 'admin'),
(268, '2020-09-04', '10:58:11', 2583, 17313646, 84545090, 'Nannys Baby Diaper Belt 1 New Born 2-5 kg 44 pcs', 999, 0, 1, 'pending', 'admin'),
(271, '2020-09-04', '11:11:53', 6, 66280160, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(272, '2020-09-04', '11:13:18', 6, 67949679, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 2, 'pending', 'admin'),
(293, '2020-09-04', '12:23:33', 3353, 31943625, 26134947, 'Women\'s Horlicks Jar 400 gm', 480, 0, 1, 'pending', 'admin'),
(294, '2020-09-04', '15:22:11', 2458, 71674915, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(295, '2020-09-04', '16:54:55', 6, 17076361, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(296, '2020-09-04', '16:54:55', 224, 17076361, 56200036, 'Fresh Soyabean Oil - 5 ltr', 465, 0, 1, 'pending', 'admin'),
(297, '2020-09-04', '16:54:55', 227, 17076361, 98461225, 'Radhuni Pure Mustard Oil - 500 ml', 125, 0, 1, 'pending', 'admin'),
(298, '2020-09-04', '16:54:55', 471, 17076361, 58162790, 'Cocola Chocolate Wafer Roll Jar - 280 gm', 60, 0, 1, 'pending', 'admin'),
(299, '2020-09-04', '16:54:55', 1713, 17076361, 47985891, 'Nestle Coffee Mate Creamer 1 kg', 535, 0, 1, 'pending', 'admin'),
(300, '2020-09-04', '16:54:55', 210, 17076361, 32074799, 'Danish Turmeric Powder Jar (Dal Chamoch Free) - 200 gm', 100, 0, 1, 'pending', 'admin'),
(301, '2020-09-04', '16:54:55', 236, 17076361, 30923673, 'Danish Chilli Powder Jar (Dal Chamoch Free) - 200 gm', 100, 0, 1, 'pending', 'admin'),
(302, '2020-09-04', '16:54:55', 252, 17076361, 93685462, 'Danish Cumin Powder Jar (Dal Chamoch Free) - 200 gm', 160, 0, 1, 'pending', 'admin'),
(303, '2020-09-04', '16:54:55', 262, 17076361, 54205055, 'Danish Coriander Powder Jar (Dal Chamoch Free) - 200 gm', 65, 0, 1, 'pending', 'admin'),
(304, '2020-09-04', '16:54:55', 408, 17076361, 48269890, 'Moshur Dal (Deshi) - 1 kg', 135, 0, 1, 'pending', 'admin'),
(305, '2020-09-04', '16:54:55', 419, 17076361, 32611307, 'Split Pea (Motor Dal) - 500 gm', 45, 0, 1, 'pending', 'admin'),
(306, '2020-09-04', '16:54:55', 2432, 17076361, 7169830, 'Bashundhara Facial Tissue (Chaldal Logo) 120X2 ply', 62, 0, 1, 'pending', 'admin'),
(307, '2020-09-04', '16:54:55', 3515, 17076361, 20389779, 'Sandalina Sandal Soap 100 gm', 36, 0, 1, 'pending', 'admin'),
(308, '2020-09-04', '16:54:55', 3820, 17076361, 41145942, 'Nivea Fresh Lily and Sandal Body Deodorizer 120 ml', 400, 0, 1, 'pending', 'admin'),
(309, '2020-09-04', '16:54:55', 4475, 17076361, 65960996, 'Bactrol Liquid Hand Wash Refill - 180 ml', 55, 55, 1, 'pending', 'admin'),
(310, '2020-09-04', '16:54:55', 3256, 17076361, 20601359, 'Transtec LED Luster Blue (Pin) each', 50, 0, 1, 'pending', 'admin'),
(311, '2020-09-04', '16:54:55', 3255, 17076361, 22956372, 'Transtec 2 Pin Travel Adapter (10 AMP)', 60, 0, 1, 'pending', 'admin'),
(312, '2020-09-04', '16:54:55', 3287, 17076361, 98580713, 'BSM Half Spiral Energy Light (Screw) 30 Watt', 331, 0, 1, 'pending', 'admin'),
(313, '2020-09-04', '16:54:55', 3113, 17076361, 65419926, 'Sunlite Heavy Duty AAA Battery 2 pcs', 24, 0, 1, 'pending', 'admin'),
(314, '2020-09-04', '16:54:55', 726, 17076361, 20290063, 'PRAN Frooto Mango Fruit Drink 500 ml', 45, 0, 1, 'pending', 'admin'),
(315, '2020-09-04', '17:00:20', 2450, 70163137, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(316, '2020-09-04', '17:00:20', 2451, 70163137, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(317, '2020-09-04', '17:00:20', 2441, 70163137, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(318, '2020-09-04', '17:00:20', 2452, 70163137, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(319, '2020-09-04', '17:00:20', 2453, 70163137, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin'),
(320, '2020-09-04', '17:00:20', 2455, 70163137, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(321, '2020-09-04', '17:00:20', 2458, 70163137, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(322, '2020-09-04', '17:00:20', 2456, 70163137, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(323, '2020-09-04', '17:00:44', 2451, 33745132, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(324, '2020-09-04', '17:00:44', 2452, 33745132, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(325, '2020-09-04', '17:00:44', 2454, 33745132, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(326, '2020-09-04', '17:00:44', 2455, 33745132, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(327, '2020-09-04', '17:01:24', 7, 46582334, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(328, '2020-09-04', '17:01:24', 16, 46582334, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(329, '2020-09-04', '17:01:24', 19, 46582334, 38121719, 'Aarong Kalijira Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(330, '2020-09-04', '17:01:24', 69, 46582334, 51532238, 'Shashya Prabartana Kalojira Oil - 50 gm', 100, 0, 1, 'pending', 'admin'),
(331, '2020-09-04', '17:01:24', 70, 46582334, 27866833, 'Chosen Foods Avocado Oil', 666, 0, 1, 'pending', 'admin'),
(332, '2020-09-04', '17:01:24', 3498, 46582334, 35685189, 'Wild Stone Ultra Sensual Soap 125 gm', 120, 0, 1, 'pending', 'admin'),
(333, '2020-09-04', '17:01:24', 741, 46582334, 93454876, 'Pepsi Pet 1 ltr', 60, 0, 1, 'pending', 'admin'),
(334, '2020-09-04', '17:04:41', 9, 58278852, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'delivered', 'admin'),
(335, '2020-09-04', '17:04:41', 2515, 58278852, 59599431, 'Cloth Pin 4 Colour (China) 16 pcs', 85, 0, 1, 'delivered', 'admin'),
(336, '2020-09-04', '17:04:41', 3097, 58278852, 21851415, 'Farlin Baby Clothing Detergent (BF-300-) 500 ml', 486, 0, 1, 'delivered', 'admin'),
(337, '2020-09-04', '17:04:41', 2260, 58278852, 76764999, 'Alex Microfiber Cloth (14\" X 14\") each', 170, 0, 1, 'delivered', 'admin'),
(338, '2020-09-04', '17:05:01', 13, 15155010, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 3, 'pending', 'admin'),
(339, '2020-09-04', '17:05:01', 16, 15155010, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(340, '2020-09-04', '17:05:01', 14, 15155010, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(341, '2020-09-04', '17:05:01', 10, 15155010, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(342, '2020-09-04', '17:05:01', 12, 15155010, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(343, '2020-09-04', '17:05:01', 29, 15155010, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(344, '2020-09-04', '17:05:01', 11, 15155010, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(346, '2020-09-04', '17:10:39', 3256, 80366769, 20601359, 'Transtec LED Luster Blue (Pin) each', 50, 0, 1, 'pending', 'admin'),
(347, '2020-09-04', '17:17:56', 3268, 75505781, 76457779, 'Transtec Green LED Bulb (Pin) 18 Watt', 410, 0, 1, 'pending', 'admin'),
(348, '2020-09-04', '17:17:56', 3293, 75505781, 9775829, 'Sunlite Super Econo Flash Light each', 220, 0, 1, 'pending', 'admin'),
(349, '2020-09-04', '17:17:56', 4475, 75505781, 65960996, 'Bactrol Liquid Hand Wash Refill - 180 ml', 55, 55, 3, 'pending', 'admin'),
(350, '2020-09-04', '17:20:16', 2619, 50699813, 50926675, 'Huggies Dry Baby Diaper Belt M 6-11 kg 72 pcs', 1399, 0, 3, 'pending', 'admin'),
(351, '2020-09-04', '17:20:16', 2622, 50699813, 74382102, 'Love Baby Super Diaper 5 Junior Belt XL 11-25 kg 48 pcs', 1099, 0, 1, 'pending', 'admin'),
(352, '2020-09-04', '17:20:16', 2624, 50699813, 86014427, 'Bashundhara Baby Diaper Belt ST Series XL 11-25 kg 32 pcs', 699, 0, 1, 'pending', 'admin'),
(353, '2020-09-04', '17:20:16', 2625, 50699813, 73784122, 'MamyPoko Pants Diaper XXL (15-25 kg) 44 pcs', 1699, 1699, 4, 'pending', 'admin'),
(354, '2020-09-04', '17:20:53', 2625, 19077554, 73784122, 'MamyPoko Pants Diaper XXL (15-25 kg) 44 pcs', 1699, 0, 1, 'pending', 'admin'),
(355, '2020-09-04', '17:22:20', 263, 61992605, 57774105, 'BPM Sesame Oil - 100 ml', 60, 0, 1, 'pending', 'admin'),
(356, '2020-09-04', '17:22:20', 271, 61992605, 20594977, 'Pusti Soybean Oil (poly) - 1 ltr', 100, 0, 1, 'pending', 'admin'),
(357, '2020-09-04', '17:22:20', 266, 61992605, 74881451, 'Fresh Soyabean Oil - 8 ltr', 805, 0, 1, 'pending', 'admin'),
(358, '2020-09-04', '17:37:07', 2457, 64212613, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 275, 1, 'pending', 'admin'),
(359, '2020-09-04', '17:37:07', 1678, 64212613, 46255860, 'Chicken Eggs (Layer) 12 pcs', 109, 0, 1, 'pending', 'admin'),
(360, '2020-09-04', '17:37:07', 1680, 64212613, 71547031, 'Duck Eggs (Deshi) Pack 12 pcs', 149, 0, 1, 'pending', 'admin'),
(361, '2020-09-04', '17:37:07', 1681, 64212613, 72406843, 'Organic Chicken Eggs (Deshi) 12 pcs', 199, 0, 1, 'pending', 'admin'),
(362, '2020-09-04', '17:37:07', 1682, 64212613, 3678321, 'Purnava Vitamin E Egg 12 pcs', 160, 0, 1, 'pending', 'admin'),
(363, '2020-09-04', '17:51:38', 3114, 34621730, 40116733, 'Olympic AAA Battery 2 pcs', 24, 0, 1, 'pending', 'admin'),
(364, '2020-09-04', '17:51:38', 2454, 34621730, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(365, '2020-09-04', '17:51:38', 2457, 34621730, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'pending', 'admin'),
(366, '2020-09-04', '17:51:38', 2456, 34621730, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(367, '2020-09-04', '17:51:38', 2459, 34621730, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(368, '2020-09-04', '17:51:38', 2452, 34621730, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(369, '2020-09-04', '17:51:38', 2142, 34621730, 92712323, 'Shalimar Honey Incense Sticks (Agarbatti) each', 20, 0, 1, 'pending', 'admin'),
(370, '2020-09-04', '17:51:38', 2143, 34621730, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 1, 'pending', 'admin'),
(371, '2020-09-04', '17:51:38', 2144, 34621730, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 1, 'pending', 'admin'),
(372, '2020-09-04', '17:51:38', 2148, 34621730, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(373, '2020-09-04', '17:51:38', 2147, 34621730, 88987363, 'Odonil Zipper Jasmine 10 gm', 60, 0, 1, 'pending', 'admin'),
(374, '2020-09-04', '17:51:38', 2145, 34621730, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'pending', 'admin'),
(375, '2020-09-04', '17:51:38', 2156, 34621730, 85855934, 'Godrej Aer Cool Surf Blue Click Gel AC Vent Car Freshener each', 299, 0, 1, 'pending', 'admin'),
(376, '2020-09-04', '17:51:38', 2158, 34621730, 99621131, 'Angelic Fresh Air Freshener Anti Tabaco 300 ml', 215, 0, 1, 'pending', 'admin'),
(377, '2020-09-04', '17:51:38', 9, 34621730, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(378, '2020-09-04', '17:51:38', 12, 34621730, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(379, '2020-09-04', '17:51:38', 6, 34621730, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(380, '2020-09-04', '17:51:38', 10, 34621730, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(381, '2020-09-04', '17:51:38', 29, 34621730, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(382, '2020-09-04', '17:51:38', 14, 34621730, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(383, '2020-09-04', '17:51:38', 13, 34621730, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(384, '2020-09-04', '17:51:38', 7, 34621730, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(385, '2020-09-04', '17:51:38', 15, 34621730, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(397, '2020-09-04', '17:59:35', 2451, 49512003, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(398, '2020-09-04', '17:59:35', 2450, 49512003, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(399, '2020-09-04', '17:59:35', 2449, 49512003, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(400, '2020-09-04', '17:59:35', 2441, 49512003, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(401, '2020-09-04', '17:59:35', 2457, 49512003, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 2, 'pending', 'admin'),
(402, '2020-09-04', '17:59:35', 2458, 49512003, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 2, 'pending', 'admin'),
(403, '2020-09-04', '17:59:35', 2459, 49512003, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 2, 'pending', 'admin'),
(404, '2020-09-04', '17:59:35', 2454, 49512003, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(405, '2020-09-04', '17:59:35', 6, 49512003, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 2, 'pending', 'admin'),
(406, '2020-09-04', '17:59:35', 12, 49512003, 47918662, 'Atop Rice - 1kg', 45, 0, 2, 'pending', 'admin'),
(407, '2020-09-04', '17:59:35', 9, 49512003, 69333818, 'Chinigura Rice - 1kg', 99, 0, 2, 'pending', 'admin'),
(408, '2020-09-04', '17:59:35', 16, 49512003, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 2, 'pending', 'admin'),
(409, '2020-09-04', '17:59:35', 10, 49512003, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 2, 'pending', 'admin'),
(410, '2020-09-04', '17:59:35', 13, 49512003, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 2, 'pending', 'admin'),
(411, '2020-09-04', '17:59:35', 7, 49512003, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 2, 'pending', 'admin'),
(412, '2020-09-04', '17:59:35', 2144, 49512003, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 4, 'pending', 'admin'),
(413, '2020-09-04', '17:59:35', 2143, 49512003, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 3, 'pending', 'admin'),
(414, '2020-09-04', '17:59:35', 2145, 49512003, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'pending', 'admin'),
(415, '2020-09-04', '17:59:35', 2148, 49512003, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(416, '2020-09-04', '18:02:25', 2449, 94427081, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(417, '2020-09-04', '18:02:25', 2450, 94427081, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(418, '2020-09-04', '18:02:25', 2451, 94427081, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(419, '2020-09-04', '18:02:25', 2441, 94427081, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(420, '2020-09-04', '18:02:25', 2452, 94427081, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(421, '2020-09-04', '18:02:25', 2453, 94427081, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin'),
(422, '2020-09-04', '18:02:25', 2454, 94427081, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(423, '2020-09-04', '18:02:25', 2455, 94427081, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(424, '2020-09-04', '18:02:25', 2459, 94427081, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(425, '2020-09-04', '18:02:25', 2458, 94427081, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(426, '2020-09-04', '18:02:25', 2457, 94427081, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'pending', 'admin'),
(427, '2020-09-04', '18:02:25', 2456, 94427081, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(428, '2020-09-04', '18:02:25', 15, 94427081, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(429, '2020-09-04', '18:02:25', 11, 94427081, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(430, '2020-09-04', '18:02:25', 10, 94427081, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(431, '2020-09-04', '18:02:25', 9, 94427081, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(432, '2020-09-04', '18:02:25', 29, 94427081, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(433, '2020-09-04', '18:02:25', 7, 94427081, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(434, '2020-09-04', '18:02:25', 16, 94427081, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(435, '2020-09-04', '18:02:25', 13, 94427081, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(436, '2020-09-04', '18:02:25', 12, 94427081, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(437, '2020-09-04', '18:02:25', 14, 94427081, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(438, '2020-09-04', '18:02:25', 6, 94427081, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(439, '2020-09-04', '18:02:25', 4474, 94427081, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(440, '2020-09-04', '18:02:25', 2149, 94427081, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'pending', 'admin'),
(441, '2020-09-04', '18:03:21', 2453, 5179644, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin'),
(442, '2020-09-04', '18:03:21', 2454, 5179644, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(443, '2020-09-04', '18:03:21', 2455, 5179644, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(445, '2020-09-04', '18:03:21', 2458, 5179644, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(446, '2020-09-04', '18:03:21', 2457, 5179644, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'pending', 'admin'),
(447, '2020-09-04', '18:03:21', 2456, 5179644, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(449, '2020-09-04', '18:03:21', 7, 5179644, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(450, '2020-09-04', '18:03:21', 14, 5179644, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(451, '2020-09-04', '18:03:21', 13, 5179644, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(452, '2020-09-04', '18:03:21', 11, 5179644, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(453, '2020-09-04', '18:03:21', 9, 5179644, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(454, '2020-09-04', '18:03:21', 15, 5179644, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(455, '2020-09-04', '18:03:21', 10, 5179644, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(456, '2020-09-04', '18:03:21', 16, 5179644, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(457, '2020-09-04', '18:03:21', 12, 5179644, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(458, '2020-09-04', '18:03:21', 29, 5179644, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(459, '2020-09-04', '18:03:21', 6, 5179644, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(460, '2020-09-04', '18:03:21', 2144, 5179644, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 1, 'pending', 'admin'),
(461, '2020-09-04', '18:03:21', 2150, 5179644, 95781296, 'Spring Air Freshener Lemon Fresh 300 ml', 215, 0, 2, 'pending', 'admin'),
(462, '2020-09-04', '18:03:21', 2143, 5179644, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 1, 'pending', 'admin'),
(463, '2020-09-04', '18:03:21', 2148, 5179644, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(464, '2020-09-04', '18:03:21', 2152, 5179644, 5570527, 'Fay Air Freshener Lime 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(465, '2020-09-04', '18:03:21', 2147, 5179644, 88987363, 'Odonil Zipper Jasmine 10 gm', 60, 0, 1, 'pending', 'admin'),
(466, '2020-09-04', '18:03:21', 2141, 5179644, 2134070, 'Odonil Natural Air Freshner Lavender Meadows 50 gm', 45, 0, 1, 'pending', 'admin'),
(467, '2020-09-04', '18:03:21', 2142, 5179644, 92712323, 'Shalimar Honey Incense Sticks (Agarbatti) each', 20, 0, 1, 'pending', 'admin'),
(468, '2020-09-04', '18:03:21', 2145, 5179644, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 1, 'pending', 'admin'),
(469, '2020-09-04', '18:03:21', 2149, 5179644, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'pending', 'admin'),
(470, '2020-09-04', '19:18:54', 2449, 72135749, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'delivered', 'admin'),
(471, '2020-09-04', '19:18:54', 2450, 72135749, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'delivered', 'admin'),
(472, '2020-09-04', '19:18:54', 2451, 72135749, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'delivered', 'admin'),
(473, '2020-09-04', '19:18:54', 2454, 72135749, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'delivered', 'admin'),
(474, '2020-09-04', '19:18:54', 2453, 72135749, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'delivered', 'admin'),
(475, '2020-09-04', '19:18:54', 2452, 72135749, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'delivered', 'admin'),
(476, '2020-09-04', '19:18:54', 2456, 72135749, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'delivered', 'admin'),
(477, '2020-09-04', '19:18:54', 2457, 72135749, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'delivered', 'admin'),
(478, '2020-09-04', '19:18:54', 2458, 72135749, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'delivered', 'admin'),
(479, '2020-09-04', '19:18:54', 2459, 72135749, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'delivered', 'admin'),
(480, '2020-09-04', '19:18:54', 7, 72135749, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'delivered', 'admin'),
(481, '2020-09-04', '19:18:54', 6, 72135749, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'delivered', 'admin'),
(482, '2020-09-04', '19:18:54', 16, 72135749, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'delivered', 'admin'),
(483, '2020-09-04', '19:18:54', 29, 72135749, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'delivered', 'admin'),
(484, '2020-09-04', '19:18:54', 15, 72135749, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'delivered', 'admin'),
(485, '2020-09-04', '19:18:54', 10, 72135749, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'delivered', 'admin'),
(486, '2020-09-04', '19:18:54', 14, 72135749, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'delivered', 'admin'),
(487, '2020-09-04', '19:18:54', 13, 72135749, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'delivered', 'admin'),
(488, '2020-09-04', '19:18:54', 11, 72135749, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'delivered', 'admin'),
(489, '2020-09-04', '19:18:54', 9, 72135749, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'delivered', 'admin'),
(490, '2020-09-04', '19:18:54', 12, 72135749, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'delivered', 'admin'),
(491, '2020-09-04', '19:18:54', 4474, 72135749, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'delivered', 'admin'),
(492, '2020-09-04', '19:18:54', 2150, 72135749, 95781296, 'Spring Air Freshener Lemon Fresh 300 ml', 215, 0, 2, 'delivered', 'admin'),
(493, '2020-09-04', '19:18:54', 2149, 72135749, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'delivered', 'admin'),
(494, '2020-09-04', '19:18:54', 2144, 72135749, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 1, 'delivered', 'admin'),
(495, '2020-09-04', '19:18:54', 2142, 72135749, 92712323, 'Shalimar Honey Incense Sticks (Agarbatti) each', 20, 0, 1, 'delivered', 'admin'),
(496, '2020-09-04', '19:18:54', 2145, 72135749, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'delivered', 'admin'),
(497, '2020-09-04', '19:18:54', 2141, 72135749, 2134070, 'Odonil Natural Air Freshner Lavender Meadows 50 gm', 45, 0, 2, 'delivered', 'admin'),
(498, '2020-09-04', '19:18:54', 2148, 72135749, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'delivered', 'admin'),
(499, '2020-09-04', '19:18:54', 2147, 72135749, 88987363, 'Odonil Zipper Jasmine 10 gm', 60, 0, 1, 'delivered', 'admin'),
(500, '2020-09-04', '19:18:54', 2152, 72135749, 5570527, 'Fay Air Freshener Lime 3 in 1 300 ml', 220, 0, 1, 'delivered', 'admin'),
(501, '2020-09-04', '19:18:54', 2143, 72135749, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 1, 'delivered', 'admin'),
(502, '2020-09-04', '18:05:46', 2441, 1043213, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(503, '2020-09-04', '18:05:46', 2451, 1043213, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(504, '2020-09-04', '18:05:46', 2449, 1043213, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(505, '2020-09-04', '18:05:46', 2450, 1043213, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(506, '2020-09-04', '18:05:46', 2452, 1043213, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(507, '2020-09-04', '18:05:46', 2455, 1043213, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(508, '2020-09-04', '18:05:46', 2459, 1043213, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(509, '2020-09-04', '18:05:46', 2458, 1043213, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(510, '2020-09-04', '18:05:46', 2457, 1043213, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'pending', 'admin'),
(511, '2020-09-04', '18:05:46', 2456, 1043213, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(512, '2020-09-04', '18:05:46', 14, 1043213, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(513, '2020-09-04', '18:05:46', 4474, 1043213, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(514, '2020-09-04', '18:05:46', 13, 1043213, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(515, '2020-09-04', '18:05:46', 7, 1043213, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(516, '2020-09-04', '18:05:46', 11, 1043213, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(517, '2020-09-04', '18:05:46', 15, 1043213, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(518, '2020-09-04', '18:05:46', 16, 1043213, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(519, '2020-09-04', '18:05:46', 9, 1043213, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(520, '2020-09-04', '18:05:46', 10, 1043213, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(521, '2020-09-04', '18:05:46', 12, 1043213, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(522, '2020-09-04', '18:05:46', 6, 1043213, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(523, '2020-09-04', '18:05:46', 29, 1043213, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(524, '2020-09-04', '18:05:46', 2143, 1043213, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 1, 'pending', 'admin'),
(525, '2020-09-04', '18:05:46', 2145, 1043213, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'pending', 'admin'),
(526, '2020-09-04', '18:05:46', 2152, 1043213, 5570527, 'Fay Air Freshener Lime 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(527, '2020-09-04', '18:05:46', 2147, 1043213, 88987363, 'Odonil Zipper Jasmine 10 gm', 60, 0, 1, 'pending', 'admin'),
(528, '2020-09-04', '18:05:46', 2149, 1043213, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'pending', 'admin'),
(529, '2020-09-04', '18:05:46', 2144, 1043213, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 1, 'pending', 'admin'),
(530, '2020-09-04', '18:05:46', 2148, 1043213, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(532, '2020-09-09', '12:18:05', 16, 10835254, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'cancelled', 'admin'),
(563, '2020-09-04', '19:23:46', 1669, 5179644, 93466262, 'Goodlife Mozzarella Cheese 200 gm', 150, 0, 1, 'pending', 'admin'),
(564, '2020-09-04', '19:24:33', 3145, 5179644, 43160121, 'Fresh Good Day Ball Pen 12 pcs', 72, 0, 1, 'pending', 'admin'),
(566, '2020-09-04', '19:27:22', 3310, 75970585, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 1, 'pending', 'admin'),
(570, '2020-09-09', '11:56:29', 16, 83092000, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'cancelled', 'admin'),
(578, '2020-09-07', '11:54:07', 2441, 10939860, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(579, '2020-09-07', '11:54:07', 2449, 10939860, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin');
INSERT INTO `ordered_product_list` (`id`, `date`, `time`, `sku_id`, `order_code`, `product_code`, `product_name`, `current_price`, `prev_price`, `quantity`, `delivery_status`, `action_by`) VALUES
(580, '2020-09-07', '11:54:59', 2441, 99662153, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(581, '2020-09-07', '11:54:59', 2449, 99662153, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(582, '2020-09-09', '11:31:31', 2441, 65881266, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'cancelled', 'admin'),
(586, '2020-09-07', '12:02:11', 2455, 52032071, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(587, '2020-09-07', '12:02:11', 2454, 52032071, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(588, '2020-09-07', '12:02:11', 2453, 52032071, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin'),
(589, '2020-09-07', '12:02:11', 2452, 52032071, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(590, '2020-09-07', '12:02:11', 2441, 52032071, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(591, '2020-09-07', '12:02:11', 2449, 52032071, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(592, '2020-09-07', '12:02:11', 2450, 52032071, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(593, '2020-09-07', '12:02:12', 2451, 52032071, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(594, '2020-09-07', '12:02:12', 2459, 52032071, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(595, '2020-09-07', '12:02:12', 2458, 52032071, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(596, '2020-09-07', '12:08:30', 2441, 6894949, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(597, '2020-09-07', '12:08:30', 2449, 6894949, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(598, '2020-09-07', '12:08:30', 2450, 6894949, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(599, '2020-09-07', '12:08:30', 2451, 6894949, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(600, '2020-09-07', '12:08:30', 2455, 6894949, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(601, '2020-09-07', '12:08:30', 2454, 6894949, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(602, '2020-09-07', '12:08:30', 2453, 6894949, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin'),
(603, '2020-09-07', '12:08:30', 2452, 6894949, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(604, '2020-09-07', '12:08:30', 2456, 6894949, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(605, '2020-09-07', '12:08:30', 2457, 6894949, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'pending', 'admin'),
(606, '2020-09-07', '12:08:30', 2459, 6894949, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(607, '2020-09-07', '12:08:30', 11, 6894949, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(608, '2020-09-07', '12:08:30', 15, 6894949, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(609, '2020-09-07', '12:08:30', 4474, 6894949, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(610, '2020-09-07', '12:08:30', 12, 6894949, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(611, '2020-09-07', '12:08:30', 10, 6894949, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(612, '2020-09-07', '12:08:30', 6, 6894949, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(613, '2020-09-07', '12:08:30', 16, 6894949, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(614, '2020-09-07', '12:08:30', 13, 6894949, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(615, '2020-09-07', '12:08:30', 4476, 6894949, 59706702, 'Onion (Local) 1 kg', 50, 0, 1, 'pending', 'admin'),
(616, '2020-09-07', '12:08:30', 7, 6894949, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(617, '2020-09-07', '12:08:30', 9, 6894949, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(618, '2020-09-07', '12:08:30', 14, 6894949, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(619, '2020-09-07', '12:08:30', 29, 6894949, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(620, '2020-09-07', '12:08:30', 2149, 6894949, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'pending', 'admin'),
(621, '2020-09-07', '12:08:30', 2148, 6894949, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(622, '2020-09-07', '12:08:30', 2150, 6894949, 95781296, 'Spring Air Freshener Lemon Fresh 300 ml', 215, 0, 2, 'pending', 'admin'),
(623, '2020-09-07', '12:08:30', 2141, 6894949, 2134070, 'Odonil Natural Air Freshner Lavender Meadows 50 gm', 45, 0, 1, 'pending', 'admin'),
(624, '2020-09-07', '12:08:30', 2145, 6894949, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'pending', 'admin'),
(625, '2020-09-07', '12:08:30', 2144, 6894949, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 1, 'pending', 'admin'),
(626, '2020-09-07', '12:08:30', 2142, 6894949, 92712323, 'Shalimar Honey Incense Sticks (Agarbatti) each', 20, 0, 1, 'pending', 'admin'),
(627, '2020-09-07', '12:08:30', 2143, 6894949, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 1, 'pending', 'admin'),
(628, '2020-09-07', '12:08:30', 2147, 6894949, 88987363, 'Odonil Zipper Jasmine 10 gm', 60, 0, 1, 'pending', 'admin'),
(629, '2020-09-07', '12:08:30', 2152, 6894949, 5570527, 'Fay Air Freshener Lime 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(630, '2020-09-07', '12:08:30', 3117, 6894949, 73172728, 'Energizer Max 1.5V AA Battery 2 pcs', 170, 0, 1, 'pending', 'admin'),
(631, '2020-09-07', '12:08:30', 3123, 6894949, 54350448, 'Sony Charger With Battery BCG34HH4KN each', 1560, 0, 1, 'pending', 'admin'),
(632, '2020-09-07', '12:08:30', 3121, 6894949, 35774382, 'Energizer Rechargeable Machine each', 660, 0, 1, 'pending', 'admin'),
(633, '2020-09-07', '12:08:31', 3115, 6894949, 10260062, 'Olympic Heavy Duty AA Battery 2 pcs', 30, 0, 1, 'pending', 'admin'),
(634, '2020-09-07', '12:08:31', 3118, 6894949, 34713888, 'Sony New Ultra AAA Battery 2 pcs', 90, 0, 1, 'pending', 'admin'),
(637, '2020-09-09', '11:26:56', 2441, 51673635, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'cancelled', 'admin'),
(651, '2020-09-07', '12:50:34', 2452, 13999509, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(652, '2020-09-07', '12:50:34', 2453, 13999509, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin'),
(653, '2020-09-07', '13:51:15', 3353, 4002300, 26134947, 'Women\'s Horlicks Jar 400 gm', 480, 0, 1, 'pending', 'admin'),
(654, '2020-09-07', '13:51:15', 3352, 4002300, 98426376, 'Ensure Diabetes Care Adult Health Drink 400 gm', 940, 0, 1, 'pending', 'admin'),
(655, '2020-09-07', '13:51:15', 3350, 4002300, 72369672, 'Pedia Sure Vanilla Delight 400 gm', 689, 0, 1, 'pending', 'admin'),
(656, '2020-09-07', '13:51:15', 3348, 4002300, 3174878, 'Junior Horlicks Jar 500 gm', 390, 0, 1, 'pending', 'admin'),
(657, '2020-09-07', '13:51:15', 3349, 4002300, 13878034, 'Pedia Sure Vanilla Delight 1 kg', 1568, 0, 1, 'pending', 'admin'),
(658, '2020-09-07', '13:51:15', 3345, 4002300, 83498594, 'Horlicks Standard Jar 250 gm', 190, 0, 1, 'pending', 'admin'),
(659, '2020-09-07', '13:51:15', 3351, 4002300, 75109296, 'Chocolate Horlicks Jar 500 gm', 350, 0, 1, 'pending', 'admin'),
(660, '2020-09-07', '13:51:15', 3344, 4002300, 59223019, 'Horlicks Standard Jar 500 gm', 350, 0, 1, 'pending', 'admin'),
(661, '2020-09-07', '13:51:15', 3346, 4002300, 42292323, 'Horlicks Standard Jar 1000 gm', 645, 0, 1, 'pending', 'admin'),
(662, '2020-09-07', '13:51:15', 7, 4002300, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(663, '2020-09-07', '13:51:15', 11, 4002300, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(664, '2020-09-07', '13:51:15', 6, 4002300, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(665, '2020-09-07', '13:51:15', 14, 4002300, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(666, '2020-09-07', '13:51:15', 10, 4002300, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(667, '2020-09-07', '13:51:15', 12, 4002300, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(668, '2020-09-07', '13:51:15', 4476, 4002300, 59706702, 'Onion (Local) 1 kg', 50, 0, 1, 'pending', 'admin'),
(669, '2020-09-07', '13:51:15', 13, 4002300, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(670, '2020-09-07', '13:51:15', 9, 4002300, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(671, '2020-09-07', '13:51:16', 15, 4002300, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(672, '2020-09-07', '13:51:16', 29, 4002300, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(673, '2020-09-07', '13:51:16', 4474, 4002300, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(674, '2020-09-07', '13:51:16', 2149, 4002300, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'pending', 'admin'),
(675, '2020-09-07', '13:51:16', 2145, 4002300, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'pending', 'admin'),
(676, '2020-09-07', '13:51:16', 2605, 4002300, 9224346, 'Huggies Dry Baby Belt Diaper L 9-14 kg 60 pcs', 1399, 0, 1, 'pending', 'admin'),
(677, '2020-09-07', '13:51:16', 2583, 4002300, 84545090, 'Nannys Baby Diaper Belt 1 New Born 2-5 kg 44 pcs', 999, 0, 1, 'pending', 'admin'),
(678, '2020-09-07', '13:51:16', 2603, 4002300, 5257142, 'Farlin Baby Moisture Anti Rash Wet Wipes Pink (DT-006A) 85 pcs', 415, 0, 1, 'pending', 'admin'),
(679, '2020-09-07', '13:51:16', 2578, 4002300, 47108849, 'Molfix Baby Diaper Belt 1 New Born 2-5 kg 44 pcs', 799, 0, 1, 'pending', 'admin'),
(680, '2020-09-07', '13:51:16', 2579, 4002300, 91319153, 'SUPERMOM Baby Diaper Belt S New Born-8 kg 28 pcs', 549, 0, 1, 'pending', 'admin'),
(681, '2020-09-07', '13:51:16', 2606, 4002300, 28969671, 'Huggies Dry Pants Baby Diaper Pant L 9-14 kg 50 pcs', 1299, 0, 1, 'pending', 'admin'),
(683, '2020-09-09', '11:27:33', 4480, 52032071, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 1, 'pending', 'admin'),
(687, '2020-09-09', '17:28:10', 3, 57000936, 93345059, 'Lifeboy', 32, 0, 1, 'pending', 'admin'),
(689, '2020-09-09', '17:45:49', 4480, 57000936, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 5, 'pending', 'admin'),
(690, '2020-09-11', '13:39:06', 2449, 26296017, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(691, '2020-09-11', '13:39:06', 2450, 26296017, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(692, '2020-09-11', '13:39:06', 2451, 26296017, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(693, '2020-09-11', '16:02:24', 3347, 88278397, 37327116, 'Nestle MILO Activ-Go (Chocolate Flavored) Powder Drink Pouch 250 gm', 270, 0, 1, 'pending', 'admin'),
(694, '2020-09-11', '16:02:24', 3351, 88278397, 75109296, 'Chocolate Horlicks Jar 500 gm', 350, 0, 1, 'pending', 'admin'),
(695, '2020-09-11', '16:02:24', 3348, 88278397, 3174878, 'Junior Horlicks Jar 500 gm', 390, 0, 1, 'pending', 'admin'),
(696, '2020-09-11', '16:02:24', 3346, 88278397, 42292323, 'Horlicks Standard Jar 1000 gm', 645, 0, 1, 'pending', 'admin'),
(1, '2020-04-21', '22:19:18', 29, 12674249, 36112035, 'Long Lemon 4 pcs', 60, 0, 1, 'pending', 'admin'),
(2, '2020-04-21', '22:19:18', 17, 12674249, 77402136, 'Green Chili 200 gm', 80, 0, 1, 'pending', 'admin'),
(3, '2020-04-21', '22:19:18', 30, 12674249, 55336102, 'Green Capsicum (Net Weight ± 20 gm) 250 gm', 40, 50, 2, 'pending', 'admin'),
(4, '2020-04-22', '10:59:26', 29, 30529541, 36112035, 'Long Lemon 4 pcs', 60, 0, 2, 'delivered', 'admin'),
(5, '2020-04-22', '10:59:26', 17, 30529541, 77402136, 'Green Chili 200 gm', 80, 0, 1, 'delivered', 'admin'),
(6, '2020-04-22', '10:59:26', 30, 30529541, 55336102, 'Green Capsicum (Net Weight ± 20 gm) 250 gm', 40, 50, 3, 'delivered', 'admin'),
(7, '2020-04-22', '10:59:26', 32, 30529541, 2253979, 'Kacha Holud 250 gm', 110, 0, 1, 'delivered', 'admin'),
(8, '2020-07-09', '16:59:11', 29, 57333076, 36112035, 'Long Lemon 4 pcs', 60, 0, 2, 'delivered', 'admin'),
(9, '2020-07-09', '16:59:11', 17, 57333076, 77402136, 'Green Chili 200 gm', 80, 0, 2, 'delivered', 'admin'),
(10, '2020-07-09', '16:59:11', 30, 57333076, 55336102, 'Green Capsicum (Net Weight ± 20 gm) 250 gm', 40, 50, 3, 'delivered', 'admin'),
(11, '2020-07-09', '16:59:11', 32, 57333076, 2253979, 'Kacha Holud 250 gm', 110, 0, 1, 'delivered', 'admin'),
(12, '2020-05-09', '23:27:40', 29, 29180104, 36112035, 'Long Lemon 4 pcs', 60, 0, 2, 'pending', 'admin'),
(13, '2020-05-09', '23:27:40', 17, 29180104, 77402136, 'Green Chili 200 gm', 80, 0, 2, 'pending', 'admin'),
(14, '2020-05-09', '23:27:40', 30, 29180104, 55336102, 'Green Capsicum (Net Weight ± 20 gm) 250 gm', 40, 50, 3, 'pending', 'admin'),
(15, '2020-05-09', '23:27:40', 32, 29180104, 2253979, 'Kacha Holud 250 gm', 110, 0, 1, 'pending', 'admin'),
(16, '2020-05-09', '23:27:41', 25, 29180104, 30023732, 'Coriander Leaves 100 gm', 100, 0, 1, 'pending', 'admin'),
(17, '2020-07-23', '16:47:34', 4, 69105583, 72790056, 'eFEMamNkr5', 60, 60, 6, 'delivered', 'admin'),
(18, '2020-07-23', '17:28:34', 4, 44206160, 72790056, 'eFEMamNkr5', 60, 60, 6, 'delivered', 'admin'),
(44, '2020-07-24', '16:41:41', 7, 58821398, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'cancelled', 'admin'),
(45, '2020-07-24', '16:41:41', 6, 58821398, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 2, 'cancelled', 'admin'),
(46, '2020-08-07', '12:47:36', 7, 60894470, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'cancelled', 'admin'),
(47, '2020-08-07', '12:47:36', 6, 60894470, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 3, 'cancelled', 'admin'),
(48, '2020-07-27', '16:17:47', 7, 36024154, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'delivered', 'admin'),
(49, '2020-07-27', '16:17:47', 17, 36024154, 24972526, 'Khusboo Premium Chinigura Rice', 130, 0, 1, 'delivered', 'admin'),
(50, '2020-07-27', '16:17:47', 20, 36024154, 66894973, 'PRAN Nazirshail Rice', 402, 0, 1, 'delivered', 'admin'),
(51, '2020-07-27', '16:17:47', 28, 36024154, 75105556, 'Teer Chinigura Rice', 130, 0, 1, 'delivered', 'admin'),
(52, '2020-07-27', '16:17:47', 26, 36024154, 99870466, 'Aarong Nazirshail Rice', 430, 0, 1, 'delivered', 'admin'),
(53, '2020-08-07', '12:04:02', 2144, 45750497, 26052884, 'Odonil Zipper Lavender', 60, 0, 1, 'delivered', 'admin'),
(54, '2020-08-07', '12:04:02', 43, 45750497, 90531026, 'Anmol Aromatic Chinigura Rice', 125, 0, 1, 'delivered', 'admin'),
(55, '2020-08-07', '12:04:02', 568, 45750497, 4574086, 'Nocilla Two Colour Chocolate', 275, 275, 2, 'delivered', 'admin'),
(56, '2020-08-06', '17:10:55', 2448, 18276013, 29617740, 'Godrej Good Knight Power Activ   Cartridge', 120, 0, 1, 'cancelled', 'admin'),
(57, '2020-08-06', '17:10:55', 2449, 18276013, 51527181, 'Super Action Booster Mosquito Coil', 30, 0, 1, 'cancelled', 'admin'),
(58, '2020-08-06', '17:10:55', 2450, 18276013, 42406445, 'Finis Insect Powder', 40, 0, 1, 'cancelled', 'admin'),
(59, '2020-08-07', '12:04:00', 2441, 82250386, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'delivered', 'admin'),
(60, '2020-08-07', '12:04:00', 2444, 82250386, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 1, 'delivered', 'admin'),
(61, '2020-08-07', '12:04:00', 2445, 82250386, 6535598, 'Naphthalene Ball', 150, 0, 3, 'delivered', 'admin'),
(62, '2020-08-18', '18:20:24', 2440, 87042648, 31716849, 'Fay Multi Fold Hand Towel', 150, 0, 1, 'cancelled', 'admin'),
(63, '2020-08-18', '18:20:24', 2441, 87042648, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'cancelled', 'admin'),
(64, '2020-08-18', '18:20:24', 2444, 87042648, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 1, 'cancelled', 'admin'),
(71, '2020-08-07', '12:03:59', 2441, 84009565, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'delivered', 'admin'),
(72, '2020-08-07', '12:03:59', 2444, 84009565, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 1, 'delivered', 'admin'),
(73, '2020-08-07', '12:03:59', 2445, 84009565, 6535598, 'Naphthalene Ball', 150, 0, 1, 'delivered', 'admin'),
(74, '2020-08-07', '13:39:27', 1500, 7708830, 85583197, 'Mango Fazli (Net Weight ± 50 gm)', 249, 0, 1, 'delivered', 'admin'),
(75, '2020-08-07', '13:39:27', 1501, 7708830, 61703248, 'Pineapple', 49, 0, 1, 'delivered', 'admin'),
(76, '2020-08-07', '13:39:27', 1502, 7708830, 30883068, 'Green Coconut (Daab)', 59, 0, 1, 'delivered', 'admin'),
(77, '2020-08-07', '12:03:58', 1476, 70772115, 26507094, 'Sajeeb Hot Tomato Sauce', 85, 0, 1, 'delivered', 'admin'),
(81, '2020-08-07', '12:03:56', 2449, 39812274, 51527181, 'Super Action Booster Mosquito Coil', 30, 0, 1, 'delivered', 'admin'),
(87, '2020-08-18', '18:14:39', 2452, 51742192, 16655477, 'Odomos Mosquito Repellent Cream', 130, 0, 1, 'cancelled', 'admin'),
(88, '2020-08-18', '18:14:39', 2451, 51742192, 71649855, 'Finis Insect Powder', 40, 0, 1, 'cancelled', 'admin'),
(89, '2020-08-18', '18:02:09', 2440, 246685, 31716849, 'Fay Multi Fold Hand Towel', 150, 0, 1, 'cancelled', 'admin'),
(90, '2020-08-18', '18:02:09', 2441, 246685, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'cancelled', 'admin'),
(91, '2020-08-18', '18:02:09', 2444, 246685, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 1, 'cancelled', 'admin'),
(92, '2020-08-18', '18:02:08', 539, 11394375, 68142848, 'Kellogg\'s Chocos', 345, 0, 1, 'cancelled', 'admin'),
(93, '2020-08-18', '18:02:08', 2455, 11394375, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill', 100, 0, 1, 'cancelled', 'admin'),
(94, '2020-08-18', '18:02:08', 547, 11394375, 43078399, 'Sajeeb Corn Flakes', 155, 0, 1, 'cancelled', 'admin'),
(95, '2020-08-18', '18:02:08', 564, 11394375, 73691982, 'Premium Grade Fig Muesli', 680, 0, 1, 'cancelled', 'admin'),
(96, '2020-08-18', '18:02:08', 1481, 69160768, 47265067, 'Shezan Tomato Ketchup', 90, 0, 1, 'cancelled', 'admin'),
(97, '2020-08-18', '18:02:08', 1483, 69160768, 93344996, 'Ahmed Hot Chilli Sauce', 95, 0, 1, 'cancelled', 'admin'),
(98, '2020-08-18', '18:02:08', 1491, 69160768, 82235730, 'Ahmed Family Combo Offer (Free Busket)', 650, 0, 1, 'cancelled', 'admin'),
(99, '2020-08-18', '18:02:08', 1489, 69160768, 35217526, 'King Bell Chili Sauce', 130, 0, 1, 'cancelled', 'admin'),
(100, '2020-08-18', '18:02:07', 2450, 17202569, 42406445, 'Finis Insect Powder', 40, 0, 1, 'cancelled', 'admin'),
(101, '2020-08-18', '18:02:07', 2456, 17202569, 40329674, 'Elephant King Jumbo Violet Mosquito Coil', 50, 0, 1, 'cancelled', 'admin'),
(102, '2020-08-07', '18:03:10', 2445, 73346709, 6535598, 'Naphthalene Ball', 150, 0, 1, 'pending', 'admin'),
(103, '2020-08-07', '18:03:10', 2441, 73346709, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'pending', 'admin'),
(104, '2020-08-07', '18:03:10', 2444, 73346709, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 1, 'pending', 'admin'),
(105, '2020-08-18', '18:02:06', 2445, 67616054, 6535598, 'Naphthalene Ball', 150, 0, 1, 'cancelled', 'admin'),
(106, '2020-08-18', '18:02:06', 2441, 67616054, 10766419, 'Planet Pocket Tissue (10X2 Ply)', 96, 0, 1, 'pending', 'admin'),
(107, '2020-08-18', '18:02:06', 2444, 67616054, 62962961, 'Godrej Good Knight Mosquito Fabric Roll On', 99, 0, 6, 'cancelled', 'admin'),
(108, '2020-08-18', '18:02:06', 3310, 67616054, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 3, 'cancelled', 'admin'),
(109, '2020-08-18', '18:02:06', 3310, 67616054, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 3, 'cancelled', 'admin'),
(110, '2020-08-18', '18:02:06', 61, 67616054, 65536551, 'Neelam Rozana Long Grain Aromatic Rice', 220, 0, 1, 'pending', 'admin'),
(111, '2020-08-18', '18:02:06', 424, 67616054, 36940522, 'Tamarind peeled (Tetul)', 35, 0, 3, 'pending', 'admin'),
(112, '2020-09-02', '18:37:35', 12, 18718083, 47918662, 'Atop Rice', 45, 0, 1, 'cancelled', 'admin'),
(113, '2020-09-02', '18:37:35', 2581, 18718083, 44941331, 'Clariss Baby Wipes (Sensitive)', 220, 0, 1, 'cancelled', 'admin'),
(135, '2020-09-03', '14:20:18', 2441, 48773764, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'cancelled', 'admin'),
(136, '2020-09-03', '14:20:18', 2457, 48773764, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'cancelled', 'admin'),
(137, '2020-09-03', '14:20:18', 2458, 48773764, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'cancelled', 'admin'),
(138, '2020-09-03', '14:20:18', 2459, 48773764, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'cancelled', 'admin'),
(141, '2020-09-01', '14:14:19', 2451, 28926743, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 2, 'pending', 'admin'),
(142, '2020-09-01', '14:15:47', 2451, 31556841, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 2, 'pending', 'admin'),
(148, '2020-09-02', '18:30:24', 3, 50420990, 93345059, 'Lifeboy', 32, 0, 1, 'delivered', 'admin'),
(149, '2020-09-02', '18:30:24', 23, 50420990, 95340284, 'Shashya Prabartana Sundarban Honey - 500 gm', 350, 0, 1, 'delivered', 'admin'),
(151, '2020-09-02', '18:30:24', 21, 50420990, 82426852, 'BPM Chinigura Rice (Khud) - 1 kg', 70, 0, 1, 'delivered', 'admin'),
(152, '2020-09-01', '18:11:52', 13, 95557631, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(153, '2020-09-01', '18:11:52', 8, 95557631, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(154, '2020-09-01', '18:11:52', 2452, 95557631, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(155, '2020-09-02', '17:50:23', 2452, 46765428, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(156, '2020-09-02', '17:50:23', 2454, 46765428, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(157, '2020-09-02', '17:50:23', 2456, 46765428, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(158, '2020-09-02', '18:13:40', 2441, 22146639, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 2, 'pending', 'admin'),
(159, '2020-09-02', '18:13:40', 2434, 22146639, 27953557, 'Fresh Hand Towel (250X1 Ply) each', 78, 78, 2, 'pending', 'admin'),
(160, '2020-09-02', '18:13:40', 2450, 22146639, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 2, 'pending', 'admin'),
(161, '2020-09-02', '18:13:40', 2449, 22146639, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(162, '2020-09-02', '18:24:52', 2449, 10277443, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(163, '2020-09-02', '18:24:52', 2456, 10277443, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(164, '2020-09-02', '18:24:52', 2455, 10277443, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 2, 'pending', 'admin'),
(165, '2020-09-02', '18:24:52', 2458, 10277443, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 2, 'pending', 'admin'),
(166, '2020-09-02', '18:24:52', 2459, 10277443, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(167, '2020-09-02', '18:24:52', 2451, 10277443, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(168, '2020-09-02', '18:30:24', 6, 50420990, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'delivered', 'admin'),
(169, '2020-09-02', '18:30:24', 8, 50420990, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'delivered', 'admin'),
(179, '2020-09-02', '18:39:00', 2454, 54570661, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(180, '2020-09-02', '18:39:00', 2456, 54570661, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(181, '2020-09-02', '18:39:00', 6, 54570661, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(182, '2020-09-02', '18:43:34', 2454, 48816514, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'cancelled', 'admin'),
(183, '2020-09-02', '18:43:34', 2456, 48816514, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'cancelled', 'admin'),
(184, '2020-09-02', '18:43:34', 6, 48816514, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'cancelled', 'admin'),
(185, '2020-09-02', '18:43:34', 7, 48816514, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'cancelled', 'admin'),
(186, '2020-09-02', '18:43:34', 16, 48816514, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'cancelled', 'admin'),
(187, '2020-09-02', '18:43:34', 2150, 48816514, 95781296, 'Spring Air Freshener Lemon Fresh 300 ml', 215, 0, 1, 'cancelled', 'admin'),
(188, '2020-09-02', '18:43:34', 2145, 48816514, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 1, 'cancelled', 'admin'),
(189, '2020-09-02', '20:45:36', 13, 15232080, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(190, '2020-09-02', '20:45:36', 8, 15232080, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(191, '2020-09-02', '20:45:36', 2452, 15232080, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(192, '2020-09-02', '20:45:36', 2453, 15232080, 97772298, 'ACI Cockroach Spray 400 ml', 280, 280, 1, 'pending', 'admin'),
(193, '2020-09-02', '20:45:36', 2454, 15232080, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(194, '2020-09-02', '20:45:36', 2459, 15232080, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(195, '2020-09-02', '23:02:09', 7, 8777418, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 2, 'delivered', 'admin'),
(196, '2020-09-02', '23:02:09', 1521, 8777418, 59706702, 'Onion (Local) 1 kg', 45, 0, 5, 'delivered', 'admin'),
(197, '2020-09-02', '23:02:09', 1523, 8777418, 37257663, 'Garlic Imported (Net Weight ± 10 gm) 250 gm', 29, 0, 4, 'delivered', 'admin'),
(198, '2020-09-02', '23:02:09', 275, 8777418, 25119021, 'Arku Chilli Powder - 200 gm', 95, 0, 1, 'delivered', 'admin'),
(199, '2020-09-02', '23:02:09', 12, 8777418, 47918662, 'Atop Rice - 1kg', 45, 0, 2, 'delivered', 'admin'),
(200, '2020-09-02', '23:02:09', 225, 8777418, 4600203, 'Rupchanda Soyabean Oil - 5 ltr', 525, 0, 1, 'delivered', 'admin'),
(201, '2020-09-02', '23:02:09', 258, 8777418, 91093912, 'Fresh Mustard Oil - 500 ml', 120, 0, 1, 'delivered', 'admin'),
(202, '2020-09-02', '23:02:09', 170, 8777418, 60165346, 'Garam Masala Powder - 50 gm', 75, 0, 1, 'delivered', 'admin'),
(203, '2020-09-02', '23:02:09', 879, 8777418, 28269584, 'Nestlé MAGGI 2-Minute Noodles Masala 8 Pack 496 gm', 135, 0, 1, 'delivered', 'admin'),
(204, '2020-09-02', '23:02:09', 988, 8777418, 99312801, 'Safari Chocolate Bar 12 gm', 20, 0, 5, 'delivered', 'admin'),
(205, '2020-09-02', '23:02:09', 1444, 8777418, 34634776, 'PRAN Hot Tomato Sauce 340 gm', 90, 0, 1, 'delivered', 'admin'),
(207, '2020-09-02', '23:02:09', 1418, 8777418, 32961964, 'PRAN White Vinegar 650 ml', 55, 0, 1, 'delivered', 'admin'),
(208, '2020-09-02', '23:02:09', 588, 8777418, 69627896, 'Ispahani Mirzapore Best Leaf Tea 400 gm', 210, 0, 1, 'delivered', 'admin'),
(209, '2020-09-02', '23:02:09', 593, 8777418, 43566755, 'Lipton Green Tea Bag Honey and Lemon 25 pcs', 140, 0, 1, 'delivered', 'admin'),
(210, '2020-09-02', '23:02:09', 381, 8777418, 25449427, 'Fresh Refined Sugar - 1 kg', 66, 0, 1, 'delivered', 'admin'),
(211, '2020-09-02', '23:02:09', 1631, 8777418, 21480448, 'Broiler Chicken Skin Off (Net Weight ± 50 gm) 1 kg', 229, 0, 1, 'delivered', 'admin'),
(212, '2020-09-02', '23:02:09', 1630, 8777418, 59876030, 'Beef Bone In (Net Weight ± 50 gm) 1 kg', 575, 0, 1, 'delivered', 'admin'),
(213, '2020-09-02', '23:02:09', 1971, 8777418, 90346085, 'Dabur Honey 250 gm', 200, 0, 1, 'delivered', 'admin'),
(214, '2020-09-02', '23:02:09', 1448, 8777418, 88859267, 'Ahmed Soya Sauce 500 ml', 110, 0, 1, 'delivered', 'admin'),
(215, '2020-09-03', '10:20:50', 2152, 16595340, 5570527, 'Fay Air Freshener Lime 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(228, '2020-09-03', '13:13:54', 2441, 32661233, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'cancelled', 'user'),
(229, '2020-09-03', '13:13:54', 2449, 32661233, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'cancelled', 'user'),
(230, '2020-09-03', '13:13:54', 2450, 32661233, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'cancelled', 'user'),
(231, '2020-09-03', '13:22:02', 2451, 99820596, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'cancelled', 'user'),
(232, '2020-09-03', '13:22:02', 2455, 99820596, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'cancelled', 'user'),
(233, '2020-09-03', '13:22:02', 2458, 99820596, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'cancelled', 'user'),
(234, '2020-09-03', '13:38:11', 7, 56821392, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(242, '2020-09-03', '14:06:31', 3344, 9812834, 59223019, 'Horlicks Standard Jar 500 gm', 350, 0, 15, 'pending', 'admin'),
(243, '2020-09-03', '14:06:31', 3345, 9812834, 83498594, 'Horlicks Standard Jar 250 gm', 190, 190, 4, 'pending', 'admin'),
(244, '2020-09-03', '14:35:50', 1501, 60668970, 61703248, 'Pineapple each', 49, 0, 1, 'delivered', 'admin'),
(245, '2020-09-03', '14:35:50', 1504, 60668970, 33443447, 'Green Apple (Net Weight ± 50 gm) 1 kg', 169, 0, 1, 'delivered', 'admin'),
(246, '2020-09-03', '14:35:50', 1502, 60668970, 30883068, 'Green Coconut (Daab) each', 59, 0, 3, 'delivered', 'admin'),
(247, '2020-09-03', '14:35:50', 1530, 60668970, 40146539, 'Coriander Leaves 100 gm', 15, 0, 1, 'delivered', 'admin'),
(248, '2020-09-03', '14:35:50', 1531, 60668970, 88375979, 'Carrot (Net Weight ± 20 gm) 500 gm', 29, 0, 1, 'delivered', 'admin'),
(249, '2020-09-03', '14:35:50', 1573, 60668970, 1697086, 'Betel Leaf 30 pcs', 50, 0, 1, 'delivered', 'admin'),
(250, '2020-09-03', '14:35:50', 1570, 60668970, 69680818, 'Small Potato (Jaam Alu) 1 kg', 55, 0, 1, 'delivered', 'admin'),
(251, '2020-09-03', '14:37:00', 3310, 99820596, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 100, 'pending', 'admin'),
(252, '2020-09-03', '15:50:14', 7, 4718297, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(253, '2020-09-03', '15:50:14', 2451, 4718297, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(254, '2020-09-03', '15:50:14', 2452, 4718297, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(255, '2020-09-03', '22:34:39', 2441, 28929884, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(256, '2020-09-03', '22:34:39', 2449, 28929884, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(257, '2020-09-03', '23:52:03', 1531, 28917157, 88375979, 'Carrot (Net Weight ± 20 gm) 500 gm', 29, 0, 1, 'pending', 'admin'),
(258, '2020-09-03', '23:52:03', 2081, 28917157, 49375356, 'Teer Maida Flour 2 kg', 92, 0, 1, 'pending', 'admin'),
(259, '2020-09-03', '23:52:03', 1523, 28917157, 37257663, 'Garlic Imported (Net Weight ± 10 gm) 250 gm', 29, 0, 1, 'pending', 'admin'),
(264, '2020-09-04', '10:58:11', 6, 17313646, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(265, '2020-09-04', '10:58:11', 13, 17313646, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(266, '2020-09-04', '10:58:11', 20, 17313646, 66894973, 'PRAN Nazirshail Rice - 5kg', 402, 0, 1, 'pending', 'admin'),
(267, '2020-09-04', '10:58:11', 25, 17313646, 99145703, 'BPM White Binni Rice - 1 kg', 100, 0, 1, 'pending', 'admin'),
(268, '2020-09-04', '10:58:11', 2583, 17313646, 84545090, 'Nannys Baby Diaper Belt 1 New Born 2-5 kg 44 pcs', 999, 0, 1, 'pending', 'admin'),
(271, '2020-09-04', '11:11:53', 6, 66280160, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(272, '2020-09-04', '11:13:18', 6, 67949679, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 2, 'pending', 'admin'),
(293, '2020-09-04', '12:23:33', 3353, 31943625, 26134947, 'Women\'s Horlicks Jar 400 gm', 480, 0, 1, 'pending', 'admin'),
(294, '2020-09-04', '15:22:11', 2458, 71674915, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(295, '2020-09-04', '16:54:55', 6, 17076361, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(296, '2020-09-04', '16:54:55', 224, 17076361, 56200036, 'Fresh Soyabean Oil - 5 ltr', 465, 0, 1, 'pending', 'admin'),
(297, '2020-09-04', '16:54:55', 227, 17076361, 98461225, 'Radhuni Pure Mustard Oil - 500 ml', 125, 0, 1, 'pending', 'admin'),
(298, '2020-09-04', '16:54:55', 471, 17076361, 58162790, 'Cocola Chocolate Wafer Roll Jar - 280 gm', 60, 0, 1, 'pending', 'admin'),
(299, '2020-09-04', '16:54:55', 1713, 17076361, 47985891, 'Nestle Coffee Mate Creamer 1 kg', 535, 0, 1, 'pending', 'admin'),
(300, '2020-09-04', '16:54:55', 210, 17076361, 32074799, 'Danish Turmeric Powder Jar (Dal Chamoch Free) - 200 gm', 100, 0, 1, 'pending', 'admin'),
(301, '2020-09-04', '16:54:55', 236, 17076361, 30923673, 'Danish Chilli Powder Jar (Dal Chamoch Free) - 200 gm', 100, 0, 1, 'pending', 'admin'),
(302, '2020-09-04', '16:54:55', 252, 17076361, 93685462, 'Danish Cumin Powder Jar (Dal Chamoch Free) - 200 gm', 160, 0, 1, 'pending', 'admin'),
(303, '2020-09-04', '16:54:55', 262, 17076361, 54205055, 'Danish Coriander Powder Jar (Dal Chamoch Free) - 200 gm', 65, 0, 1, 'pending', 'admin'),
(304, '2020-09-04', '16:54:55', 408, 17076361, 48269890, 'Moshur Dal (Deshi) - 1 kg', 135, 0, 1, 'pending', 'admin'),
(305, '2020-09-04', '16:54:55', 419, 17076361, 32611307, 'Split Pea (Motor Dal) - 500 gm', 45, 0, 1, 'pending', 'admin'),
(306, '2020-09-04', '16:54:55', 2432, 17076361, 7169830, 'Bashundhara Facial Tissue (Chaldal Logo) 120X2 ply', 62, 0, 1, 'pending', 'admin'),
(307, '2020-09-04', '16:54:55', 3515, 17076361, 20389779, 'Sandalina Sandal Soap 100 gm', 36, 0, 1, 'pending', 'admin'),
(308, '2020-09-04', '16:54:55', 3820, 17076361, 41145942, 'Nivea Fresh Lily and Sandal Body Deodorizer 120 ml', 400, 0, 1, 'pending', 'admin'),
(309, '2020-09-04', '16:54:55', 4475, 17076361, 65960996, 'Bactrol Liquid Hand Wash Refill - 180 ml', 55, 55, 1, 'pending', 'admin'),
(310, '2020-09-04', '16:54:55', 3256, 17076361, 20601359, 'Transtec LED Luster Blue (Pin) each', 50, 0, 1, 'pending', 'admin'),
(311, '2020-09-04', '16:54:55', 3255, 17076361, 22956372, 'Transtec 2 Pin Travel Adapter (10 AMP)', 60, 0, 1, 'pending', 'admin'),
(312, '2020-09-04', '16:54:55', 3287, 17076361, 98580713, 'BSM Half Spiral Energy Light (Screw) 30 Watt', 331, 0, 1, 'pending', 'admin'),
(313, '2020-09-04', '16:54:55', 3113, 17076361, 65419926, 'Sunlite Heavy Duty AAA Battery 2 pcs', 24, 0, 1, 'pending', 'admin'),
(314, '2020-09-04', '16:54:55', 726, 17076361, 20290063, 'PRAN Frooto Mango Fruit Drink 500 ml', 45, 0, 1, 'pending', 'admin'),
(315, '2020-09-04', '17:00:20', 2450, 70163137, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(316, '2020-09-04', '17:00:20', 2451, 70163137, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(317, '2020-09-04', '17:00:20', 2441, 70163137, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(318, '2020-09-04', '17:00:20', 2452, 70163137, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(319, '2020-09-04', '17:00:20', 2453, 70163137, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin'),
(320, '2020-09-04', '17:00:20', 2455, 70163137, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(321, '2020-09-04', '17:00:20', 2458, 70163137, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(322, '2020-09-04', '17:00:20', 2456, 70163137, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(323, '2020-09-04', '17:00:44', 2451, 33745132, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(324, '2020-09-04', '17:00:44', 2452, 33745132, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(325, '2020-09-04', '17:00:44', 2454, 33745132, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(326, '2020-09-04', '17:00:44', 2455, 33745132, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(327, '2020-09-04', '17:01:24', 7, 46582334, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(328, '2020-09-04', '17:01:24', 16, 46582334, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(329, '2020-09-04', '17:01:24', 19, 46582334, 38121719, 'Aarong Kalijira Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(330, '2020-09-04', '17:01:24', 69, 46582334, 51532238, 'Shashya Prabartana Kalojira Oil - 50 gm', 100, 0, 1, 'pending', 'admin'),
(331, '2020-09-04', '17:01:24', 70, 46582334, 27866833, 'Chosen Foods Avocado Oil', 666, 0, 1, 'pending', 'admin'),
(332, '2020-09-04', '17:01:24', 3498, 46582334, 35685189, 'Wild Stone Ultra Sensual Soap 125 gm', 120, 0, 1, 'pending', 'admin'),
(333, '2020-09-04', '17:01:24', 741, 46582334, 93454876, 'Pepsi Pet 1 ltr', 60, 0, 1, 'pending', 'admin'),
(334, '2020-09-04', '17:04:41', 9, 58278852, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'delivered', 'admin'),
(335, '2020-09-04', '17:04:41', 2515, 58278852, 59599431, 'Cloth Pin 4 Colour (China) 16 pcs', 85, 0, 1, 'delivered', 'admin'),
(336, '2020-09-04', '17:04:41', 3097, 58278852, 21851415, 'Farlin Baby Clothing Detergent (BF-300-) 500 ml', 486, 0, 1, 'delivered', 'admin'),
(337, '2020-09-04', '17:04:41', 2260, 58278852, 76764999, 'Alex Microfiber Cloth (14\" X 14\") each', 170, 0, 1, 'delivered', 'admin'),
(338, '2020-09-04', '17:05:01', 13, 15155010, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 3, 'pending', 'admin'),
(339, '2020-09-04', '17:05:01', 16, 15155010, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(340, '2020-09-04', '17:05:01', 14, 15155010, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(341, '2020-09-04', '17:05:01', 10, 15155010, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(342, '2020-09-04', '17:05:01', 12, 15155010, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(343, '2020-09-04', '17:05:01', 29, 15155010, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(344, '2020-09-04', '17:05:01', 11, 15155010, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(346, '2020-09-04', '17:10:39', 3256, 80366769, 20601359, 'Transtec LED Luster Blue (Pin) each', 50, 0, 1, 'pending', 'admin'),
(347, '2020-09-04', '17:17:56', 3268, 75505781, 76457779, 'Transtec Green LED Bulb (Pin) 18 Watt', 410, 0, 1, 'pending', 'admin'),
(348, '2020-09-04', '17:17:56', 3293, 75505781, 9775829, 'Sunlite Super Econo Flash Light each', 220, 0, 1, 'pending', 'admin'),
(349, '2020-09-04', '17:17:56', 4475, 75505781, 65960996, 'Bactrol Liquid Hand Wash Refill - 180 ml', 55, 55, 3, 'pending', 'admin'),
(350, '2020-09-04', '17:20:16', 2619, 50699813, 50926675, 'Huggies Dry Baby Diaper Belt M 6-11 kg 72 pcs', 1399, 0, 3, 'pending', 'admin'),
(351, '2020-09-04', '17:20:16', 2622, 50699813, 74382102, 'Love Baby Super Diaper 5 Junior Belt XL 11-25 kg 48 pcs', 1099, 0, 1, 'pending', 'admin'),
(352, '2020-09-04', '17:20:16', 2624, 50699813, 86014427, 'Bashundhara Baby Diaper Belt ST Series XL 11-25 kg 32 pcs', 699, 0, 1, 'pending', 'admin'),
(353, '2020-09-04', '17:20:16', 2625, 50699813, 73784122, 'MamyPoko Pants Diaper XXL (15-25 kg) 44 pcs', 1699, 1699, 4, 'pending', 'admin'),
(354, '2020-09-04', '17:20:53', 2625, 19077554, 73784122, 'MamyPoko Pants Diaper XXL (15-25 kg) 44 pcs', 1699, 0, 1, 'pending', 'admin'),
(355, '2020-09-04', '17:22:20', 263, 61992605, 57774105, 'BPM Sesame Oil - 100 ml', 60, 0, 1, 'pending', 'admin'),
(356, '2020-09-04', '17:22:20', 271, 61992605, 20594977, 'Pusti Soybean Oil (poly) - 1 ltr', 100, 0, 1, 'pending', 'admin'),
(357, '2020-09-04', '17:22:20', 266, 61992605, 74881451, 'Fresh Soyabean Oil - 8 ltr', 805, 0, 1, 'pending', 'admin'),
(358, '2020-09-04', '17:37:07', 2457, 64212613, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 275, 1, 'pending', 'admin'),
(359, '2020-09-04', '17:37:07', 1678, 64212613, 46255860, 'Chicken Eggs (Layer) 12 pcs', 109, 0, 1, 'pending', 'admin'),
(360, '2020-09-04', '17:37:07', 1680, 64212613, 71547031, 'Duck Eggs (Deshi) Pack 12 pcs', 149, 0, 1, 'pending', 'admin'),
(361, '2020-09-04', '17:37:07', 1681, 64212613, 72406843, 'Organic Chicken Eggs (Deshi) 12 pcs', 199, 0, 1, 'pending', 'admin'),
(362, '2020-09-04', '17:37:07', 1682, 64212613, 3678321, 'Purnava Vitamin E Egg 12 pcs', 160, 0, 1, 'pending', 'admin'),
(363, '2020-09-04', '17:51:38', 3114, 34621730, 40116733, 'Olympic AAA Battery 2 pcs', 24, 0, 1, 'pending', 'admin'),
(364, '2020-09-04', '17:51:38', 2454, 34621730, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(365, '2020-09-04', '17:51:38', 2457, 34621730, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'pending', 'admin'),
(366, '2020-09-04', '17:51:38', 2456, 34621730, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(367, '2020-09-04', '17:51:38', 2459, 34621730, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(368, '2020-09-04', '17:51:38', 2452, 34621730, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(369, '2020-09-04', '17:51:38', 2142, 34621730, 92712323, 'Shalimar Honey Incense Sticks (Agarbatti) each', 20, 0, 1, 'pending', 'admin'),
(370, '2020-09-04', '17:51:38', 2143, 34621730, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 1, 'pending', 'admin'),
(371, '2020-09-04', '17:51:38', 2144, 34621730, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 1, 'pending', 'admin'),
(372, '2020-09-04', '17:51:38', 2148, 34621730, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(373, '2020-09-04', '17:51:38', 2147, 34621730, 88987363, 'Odonil Zipper Jasmine 10 gm', 60, 0, 1, 'pending', 'admin'),
(374, '2020-09-04', '17:51:38', 2145, 34621730, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'pending', 'admin'),
(375, '2020-09-04', '17:51:38', 2156, 34621730, 85855934, 'Godrej Aer Cool Surf Blue Click Gel AC Vent Car Freshener each', 299, 0, 1, 'pending', 'admin'),
(376, '2020-09-04', '17:51:38', 2158, 34621730, 99621131, 'Angelic Fresh Air Freshener Anti Tabaco 300 ml', 215, 0, 1, 'pending', 'admin'),
(377, '2020-09-04', '17:51:38', 9, 34621730, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(378, '2020-09-04', '17:51:38', 12, 34621730, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(379, '2020-09-04', '17:51:38', 6, 34621730, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(380, '2020-09-04', '17:51:38', 10, 34621730, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(381, '2020-09-04', '17:51:38', 29, 34621730, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(382, '2020-09-04', '17:51:38', 14, 34621730, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(383, '2020-09-04', '17:51:38', 13, 34621730, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(384, '2020-09-04', '17:51:38', 7, 34621730, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(385, '2020-09-04', '17:51:38', 15, 34621730, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(397, '2020-09-04', '17:59:35', 2451, 49512003, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(398, '2020-09-04', '17:59:35', 2450, 49512003, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(399, '2020-09-04', '17:59:35', 2449, 49512003, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(400, '2020-09-04', '17:59:35', 2441, 49512003, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(401, '2020-09-04', '17:59:35', 2457, 49512003, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 2, 'pending', 'admin'),
(402, '2020-09-04', '17:59:35', 2458, 49512003, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 2, 'pending', 'admin'),
(403, '2020-09-04', '17:59:35', 2459, 49512003, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 2, 'pending', 'admin'),
(404, '2020-09-04', '17:59:35', 2454, 49512003, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(405, '2020-09-04', '17:59:35', 6, 49512003, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 2, 'pending', 'admin'),
(406, '2020-09-04', '17:59:35', 12, 49512003, 47918662, 'Atop Rice - 1kg', 45, 0, 2, 'pending', 'admin'),
(407, '2020-09-04', '17:59:35', 9, 49512003, 69333818, 'Chinigura Rice - 1kg', 99, 0, 2, 'pending', 'admin'),
(408, '2020-09-04', '17:59:35', 16, 49512003, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 2, 'pending', 'admin'),
(409, '2020-09-04', '17:59:35', 10, 49512003, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 2, 'pending', 'admin'),
(410, '2020-09-04', '17:59:35', 13, 49512003, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 2, 'pending', 'admin'),
(411, '2020-09-04', '17:59:35', 7, 49512003, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 2, 'pending', 'admin'),
(412, '2020-09-04', '17:59:35', 2144, 49512003, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 4, 'pending', 'admin'),
(413, '2020-09-04', '17:59:35', 2143, 49512003, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 3, 'pending', 'admin'),
(414, '2020-09-04', '17:59:35', 2145, 49512003, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'pending', 'admin'),
(415, '2020-09-04', '17:59:35', 2148, 49512003, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(416, '2020-09-04', '18:02:25', 2449, 94427081, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(417, '2020-09-04', '18:02:25', 2450, 94427081, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(418, '2020-09-04', '18:02:25', 2451, 94427081, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(419, '2020-09-04', '18:02:25', 2441, 94427081, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(420, '2020-09-04', '18:02:25', 2452, 94427081, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(421, '2020-09-04', '18:02:25', 2453, 94427081, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin'),
(422, '2020-09-04', '18:02:25', 2454, 94427081, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(423, '2020-09-04', '18:02:25', 2455, 94427081, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(424, '2020-09-04', '18:02:25', 2459, 94427081, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(425, '2020-09-04', '18:02:25', 2458, 94427081, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(426, '2020-09-04', '18:02:25', 2457, 94427081, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'pending', 'admin'),
(427, '2020-09-04', '18:02:25', 2456, 94427081, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(428, '2020-09-04', '18:02:25', 15, 94427081, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(429, '2020-09-04', '18:02:25', 11, 94427081, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(430, '2020-09-04', '18:02:25', 10, 94427081, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(431, '2020-09-04', '18:02:25', 9, 94427081, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(432, '2020-09-04', '18:02:25', 29, 94427081, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(433, '2020-09-04', '18:02:25', 7, 94427081, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(434, '2020-09-04', '18:02:25', 16, 94427081, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(435, '2020-09-04', '18:02:25', 13, 94427081, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(436, '2020-09-04', '18:02:25', 12, 94427081, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(437, '2020-09-04', '18:02:25', 14, 94427081, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(438, '2020-09-04', '18:02:25', 6, 94427081, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(439, '2020-09-04', '18:02:25', 4474, 94427081, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(440, '2020-09-04', '18:02:25', 2149, 94427081, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'pending', 'admin'),
(441, '2020-09-04', '18:03:21', 2453, 5179644, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin');
INSERT INTO `ordered_product_list` (`id`, `date`, `time`, `sku_id`, `order_code`, `product_code`, `product_name`, `current_price`, `prev_price`, `quantity`, `delivery_status`, `action_by`) VALUES
(442, '2020-09-04', '18:03:21', 2454, 5179644, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(443, '2020-09-04', '18:03:21', 2455, 5179644, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(445, '2020-09-04', '18:03:21', 2458, 5179644, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(446, '2020-09-04', '18:03:21', 2457, 5179644, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'pending', 'admin'),
(447, '2020-09-04', '18:03:21', 2456, 5179644, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(449, '2020-09-04', '18:03:21', 7, 5179644, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(450, '2020-09-04', '18:03:21', 14, 5179644, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(451, '2020-09-04', '18:03:21', 13, 5179644, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(452, '2020-09-04', '18:03:21', 11, 5179644, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(453, '2020-09-04', '18:03:21', 9, 5179644, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(454, '2020-09-04', '18:03:21', 15, 5179644, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(455, '2020-09-04', '18:03:21', 10, 5179644, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(456, '2020-09-04', '18:03:21', 16, 5179644, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(457, '2020-09-04', '18:03:21', 12, 5179644, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(458, '2020-09-04', '18:03:21', 29, 5179644, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(459, '2020-09-04', '18:03:21', 6, 5179644, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(460, '2020-09-04', '18:03:21', 2144, 5179644, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 1, 'pending', 'admin'),
(461, '2020-09-04', '18:03:21', 2150, 5179644, 95781296, 'Spring Air Freshener Lemon Fresh 300 ml', 215, 0, 2, 'pending', 'admin'),
(462, '2020-09-04', '18:03:21', 2143, 5179644, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 1, 'pending', 'admin'),
(463, '2020-09-04', '18:03:21', 2148, 5179644, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(464, '2020-09-04', '18:03:21', 2152, 5179644, 5570527, 'Fay Air Freshener Lime 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(465, '2020-09-04', '18:03:21', 2147, 5179644, 88987363, 'Odonil Zipper Jasmine 10 gm', 60, 0, 1, 'pending', 'admin'),
(466, '2020-09-04', '18:03:21', 2141, 5179644, 2134070, 'Odonil Natural Air Freshner Lavender Meadows 50 gm', 45, 0, 1, 'pending', 'admin'),
(467, '2020-09-04', '18:03:21', 2142, 5179644, 92712323, 'Shalimar Honey Incense Sticks (Agarbatti) each', 20, 0, 1, 'pending', 'admin'),
(468, '2020-09-04', '18:03:21', 2145, 5179644, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 1, 'pending', 'admin'),
(469, '2020-09-04', '18:03:21', 2149, 5179644, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'pending', 'admin'),
(470, '2020-09-04', '19:18:54', 2449, 72135749, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'delivered', 'admin'),
(471, '2020-09-04', '19:18:54', 2450, 72135749, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'delivered', 'admin'),
(472, '2020-09-04', '19:18:54', 2451, 72135749, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'delivered', 'admin'),
(473, '2020-09-04', '19:18:54', 2454, 72135749, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'delivered', 'admin'),
(474, '2020-09-04', '19:18:54', 2453, 72135749, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'delivered', 'admin'),
(475, '2020-09-04', '19:18:54', 2452, 72135749, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'delivered', 'admin'),
(476, '2020-09-04', '19:18:54', 2456, 72135749, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'delivered', 'admin'),
(477, '2020-09-04', '19:18:54', 2457, 72135749, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'delivered', 'admin'),
(478, '2020-09-04', '19:18:54', 2458, 72135749, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'delivered', 'admin'),
(479, '2020-09-04', '19:18:54', 2459, 72135749, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'delivered', 'admin'),
(480, '2020-09-04', '19:18:54', 7, 72135749, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'delivered', 'admin'),
(481, '2020-09-04', '19:18:54', 6, 72135749, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'delivered', 'admin'),
(482, '2020-09-04', '19:18:54', 16, 72135749, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'delivered', 'admin'),
(483, '2020-09-04', '19:18:54', 29, 72135749, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'delivered', 'admin'),
(484, '2020-09-04', '19:18:54', 15, 72135749, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'delivered', 'admin'),
(485, '2020-09-04', '19:18:54', 10, 72135749, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'delivered', 'admin'),
(486, '2020-09-04', '19:18:54', 14, 72135749, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'delivered', 'admin'),
(487, '2020-09-04', '19:18:54', 13, 72135749, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'delivered', 'admin'),
(488, '2020-09-04', '19:18:54', 11, 72135749, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'delivered', 'admin'),
(489, '2020-09-04', '19:18:54', 9, 72135749, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'delivered', 'admin'),
(490, '2020-09-04', '19:18:54', 12, 72135749, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'delivered', 'admin'),
(491, '2020-09-04', '19:18:54', 4474, 72135749, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'delivered', 'admin'),
(492, '2020-09-04', '19:18:54', 2150, 72135749, 95781296, 'Spring Air Freshener Lemon Fresh 300 ml', 215, 0, 2, 'delivered', 'admin'),
(493, '2020-09-04', '19:18:54', 2149, 72135749, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'delivered', 'admin'),
(494, '2020-09-04', '19:18:54', 2144, 72135749, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 1, 'delivered', 'admin'),
(495, '2020-09-04', '19:18:54', 2142, 72135749, 92712323, 'Shalimar Honey Incense Sticks (Agarbatti) each', 20, 0, 1, 'delivered', 'admin'),
(496, '2020-09-04', '19:18:54', 2145, 72135749, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'delivered', 'admin'),
(497, '2020-09-04', '19:18:54', 2141, 72135749, 2134070, 'Odonil Natural Air Freshner Lavender Meadows 50 gm', 45, 0, 2, 'delivered', 'admin'),
(498, '2020-09-04', '19:18:54', 2148, 72135749, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'delivered', 'admin'),
(499, '2020-09-04', '19:18:54', 2147, 72135749, 88987363, 'Odonil Zipper Jasmine 10 gm', 60, 0, 1, 'delivered', 'admin'),
(500, '2020-09-04', '19:18:54', 2152, 72135749, 5570527, 'Fay Air Freshener Lime 3 in 1 300 ml', 220, 0, 1, 'delivered', 'admin'),
(501, '2020-09-04', '19:18:54', 2143, 72135749, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 1, 'delivered', 'admin'),
(502, '2020-09-04', '18:05:46', 2441, 1043213, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(503, '2020-09-04', '18:05:46', 2451, 1043213, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(504, '2020-09-04', '18:05:46', 2449, 1043213, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(505, '2020-09-04', '18:05:46', 2450, 1043213, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(506, '2020-09-04', '18:05:46', 2452, 1043213, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(507, '2020-09-04', '18:05:46', 2455, 1043213, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(508, '2020-09-04', '18:05:46', 2459, 1043213, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(509, '2020-09-04', '18:05:46', 2458, 1043213, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(510, '2020-09-04', '18:05:46', 2457, 1043213, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'pending', 'admin'),
(511, '2020-09-04', '18:05:46', 2456, 1043213, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(512, '2020-09-04', '18:05:46', 14, 1043213, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(513, '2020-09-04', '18:05:46', 4474, 1043213, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(514, '2020-09-04', '18:05:46', 13, 1043213, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(515, '2020-09-04', '18:05:46', 7, 1043213, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(516, '2020-09-04', '18:05:46', 11, 1043213, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(517, '2020-09-04', '18:05:46', 15, 1043213, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(518, '2020-09-04', '18:05:46', 16, 1043213, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(519, '2020-09-04', '18:05:46', 9, 1043213, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(520, '2020-09-04', '18:05:46', 10, 1043213, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(521, '2020-09-04', '18:05:46', 12, 1043213, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(522, '2020-09-04', '18:05:46', 6, 1043213, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(523, '2020-09-04', '18:05:46', 29, 1043213, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(524, '2020-09-04', '18:05:46', 2143, 1043213, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 1, 'pending', 'admin'),
(525, '2020-09-04', '18:05:46', 2145, 1043213, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'pending', 'admin'),
(526, '2020-09-04', '18:05:46', 2152, 1043213, 5570527, 'Fay Air Freshener Lime 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(527, '2020-09-04', '18:05:46', 2147, 1043213, 88987363, 'Odonil Zipper Jasmine 10 gm', 60, 0, 1, 'pending', 'admin'),
(528, '2020-09-04', '18:05:46', 2149, 1043213, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'pending', 'admin'),
(529, '2020-09-04', '18:05:46', 2144, 1043213, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 1, 'pending', 'admin'),
(530, '2020-09-04', '18:05:46', 2148, 1043213, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(532, '2020-09-09', '12:18:05', 16, 10835254, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'cancelled', 'admin'),
(563, '2020-09-04', '19:23:46', 1669, 5179644, 93466262, 'Goodlife Mozzarella Cheese 200 gm', 150, 0, 1, 'pending', 'admin'),
(564, '2020-09-04', '19:24:33', 3145, 5179644, 43160121, 'Fresh Good Day Ball Pen 12 pcs', 72, 0, 1, 'pending', 'admin'),
(566, '2020-09-04', '19:27:22', 3310, 75970585, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 1, 'pending', 'admin'),
(570, '2020-09-09', '11:56:29', 16, 83092000, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'cancelled', 'admin'),
(578, '2020-09-07', '11:54:07', 2441, 10939860, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(579, '2020-09-07', '11:54:07', 2449, 10939860, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(580, '2020-09-07', '11:54:59', 2441, 99662153, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(581, '2020-09-07', '11:54:59', 2449, 99662153, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(582, '2020-09-09', '11:31:31', 2441, 65881266, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'cancelled', 'admin'),
(586, '2020-09-07', '12:02:11', 2455, 52032071, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(587, '2020-09-07', '12:02:11', 2454, 52032071, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(588, '2020-09-07', '12:02:11', 2453, 52032071, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin'),
(589, '2020-09-07', '12:02:11', 2452, 52032071, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(590, '2020-09-07', '12:02:11', 2441, 52032071, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(591, '2020-09-07', '12:02:11', 2449, 52032071, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(592, '2020-09-07', '12:02:11', 2450, 52032071, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(593, '2020-09-07', '12:02:12', 2451, 52032071, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(594, '2020-09-07', '12:02:12', 2459, 52032071, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(595, '2020-09-07', '12:02:12', 2458, 52032071, 36004412, 'Purnava Mosquito Repellent Spray 75 ml', 175, 0, 1, 'pending', 'admin'),
(596, '2020-09-07', '12:08:30', 2441, 6894949, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'pending', 'admin'),
(597, '2020-09-07', '12:08:30', 2449, 6894949, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(598, '2020-09-07', '12:08:30', 2450, 6894949, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(599, '2020-09-07', '12:08:30', 2451, 6894949, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(600, '2020-09-07', '12:08:30', 2455, 6894949, 12291318, 'ACI All Out Ultra Mosquito Liquid Vaporizer Refill 45 ml', 100, 0, 1, 'pending', 'admin'),
(601, '2020-09-07', '12:08:30', 2454, 6894949, 72073923, 'Godrej Good Knight Xpress System Liquid Vapouriser Cartridge 35 ml', 135, 0, 1, 'pending', 'admin'),
(602, '2020-09-07', '12:08:30', 2453, 6894949, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin'),
(603, '2020-09-07', '12:08:30', 2452, 6894949, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(604, '2020-09-07', '12:08:30', 2456, 6894949, 40329674, 'Elephant King Jumbo Violet Mosquito Coil 10 pcs', 50, 0, 1, 'pending', 'admin'),
(605, '2020-09-07', '12:08:30', 2457, 6894949, 72730225, 'Saba Vegetable Washing Liquid 125 ml', 275, 0, 1, 'pending', 'admin'),
(606, '2020-09-07', '12:08:30', 2459, 6894949, 31393847, 'Godrej Good Knight Power Active Machine   Refill', 149, 0, 1, 'pending', 'admin'),
(607, '2020-09-07', '12:08:30', 11, 6894949, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(608, '2020-09-07', '12:08:30', 15, 6894949, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(609, '2020-09-07', '12:08:30', 4474, 6894949, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(610, '2020-09-07', '12:08:30', 12, 6894949, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(611, '2020-09-07', '12:08:30', 10, 6894949, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(612, '2020-09-07', '12:08:30', 6, 6894949, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(613, '2020-09-07', '12:08:30', 16, 6894949, 38079285, 'Aarong Chinigura Rice - 2 kg', 245, 0, 1, 'pending', 'admin'),
(614, '2020-09-07', '12:08:30', 13, 6894949, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(615, '2020-09-07', '12:08:30', 4476, 6894949, 59706702, 'Onion (Local) 1 kg', 50, 0, 1, 'pending', 'admin'),
(616, '2020-09-07', '12:08:30', 7, 6894949, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(617, '2020-09-07', '12:08:30', 9, 6894949, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(618, '2020-09-07', '12:08:30', 14, 6894949, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(619, '2020-09-07', '12:08:30', 29, 6894949, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(620, '2020-09-07', '12:08:30', 2149, 6894949, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'pending', 'admin'),
(621, '2020-09-07', '12:08:30', 2148, 6894949, 4562281, 'Fay Air Freshener Jasmine 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(622, '2020-09-07', '12:08:30', 2150, 6894949, 95781296, 'Spring Air Freshener Lemon Fresh 300 ml', 215, 0, 2, 'pending', 'admin'),
(623, '2020-09-07', '12:08:30', 2141, 6894949, 2134070, 'Odonil Natural Air Freshner Lavender Meadows 50 gm', 45, 0, 1, 'pending', 'admin'),
(624, '2020-09-07', '12:08:30', 2145, 6894949, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'pending', 'admin'),
(625, '2020-09-07', '12:08:30', 2144, 6894949, 26052884, 'Odonil Zipper Lavender 10 gm', 60, 0, 1, 'pending', 'admin'),
(626, '2020-09-07', '12:08:30', 2142, 6894949, 92712323, 'Shalimar Honey Incense Sticks (Agarbatti) each', 20, 0, 1, 'pending', 'admin'),
(627, '2020-09-07', '12:08:30', 2143, 6894949, 69915334, 'Odonil Natural Air Freshner Mystic Rose 50 gm', 45, 0, 1, 'pending', 'admin'),
(628, '2020-09-07', '12:08:30', 2147, 6894949, 88987363, 'Odonil Zipper Jasmine 10 gm', 60, 0, 1, 'pending', 'admin'),
(629, '2020-09-07', '12:08:30', 2152, 6894949, 5570527, 'Fay Air Freshener Lime 3 in 1 300 ml', 220, 0, 1, 'pending', 'admin'),
(630, '2020-09-07', '12:08:30', 3117, 6894949, 73172728, 'Energizer Max 1.5V AA Battery 2 pcs', 170, 0, 1, 'pending', 'admin'),
(631, '2020-09-07', '12:08:30', 3123, 6894949, 54350448, 'Sony Charger With Battery BCG34HH4KN each', 1560, 0, 1, 'pending', 'admin'),
(632, '2020-09-07', '12:08:30', 3121, 6894949, 35774382, 'Energizer Rechargeable Machine each', 660, 0, 1, 'pending', 'admin'),
(633, '2020-09-07', '12:08:31', 3115, 6894949, 10260062, 'Olympic Heavy Duty AA Battery 2 pcs', 30, 0, 1, 'pending', 'admin'),
(634, '2020-09-07', '12:08:31', 3118, 6894949, 34713888, 'Sony New Ultra AAA Battery 2 pcs', 90, 0, 1, 'pending', 'admin'),
(637, '2020-09-09', '11:26:56', 2441, 51673635, 10766419, 'Planet Pocket Tissue (10X2 Ply) 8 pcs', 96, 0, 1, 'cancelled', 'admin'),
(651, '2020-09-07', '12:50:34', 2452, 13999509, 16655477, 'Odomos Mosquito Repellent Cream 100 gm', 130, 0, 1, 'pending', 'admin'),
(652, '2020-09-07', '12:50:34', 2453, 13999509, 97772298, 'ACI Cockroach Spray 400 ml', 280, 0, 1, 'pending', 'admin'),
(653, '2020-09-07', '13:51:15', 3353, 4002300, 26134947, 'Women\'s Horlicks Jar 400 gm', 480, 0, 1, 'pending', 'admin'),
(654, '2020-09-07', '13:51:15', 3352, 4002300, 98426376, 'Ensure Diabetes Care Adult Health Drink 400 gm', 940, 0, 1, 'pending', 'admin'),
(655, '2020-09-07', '13:51:15', 3350, 4002300, 72369672, 'Pedia Sure Vanilla Delight 400 gm', 689, 0, 1, 'pending', 'admin'),
(656, '2020-09-07', '13:51:15', 3348, 4002300, 3174878, 'Junior Horlicks Jar 500 gm', 390, 0, 1, 'pending', 'admin'),
(657, '2020-09-07', '13:51:15', 3349, 4002300, 13878034, 'Pedia Sure Vanilla Delight 1 kg', 1568, 0, 1, 'pending', 'admin'),
(658, '2020-09-07', '13:51:15', 3345, 4002300, 83498594, 'Horlicks Standard Jar 250 gm', 190, 0, 1, 'pending', 'admin'),
(659, '2020-09-07', '13:51:15', 3351, 4002300, 75109296, 'Chocolate Horlicks Jar 500 gm', 350, 0, 1, 'pending', 'admin'),
(660, '2020-09-07', '13:51:15', 3344, 4002300, 59223019, 'Horlicks Standard Jar 500 gm', 350, 0, 1, 'pending', 'admin'),
(661, '2020-09-07', '13:51:15', 3346, 4002300, 42292323, 'Horlicks Standard Jar 1000 gm', 645, 0, 1, 'pending', 'admin'),
(662, '2020-09-07', '13:51:15', 7, 4002300, 40731583, 'Nazirshail Rice Premium - 5 kg', 292, 0, 1, 'pending', 'admin'),
(663, '2020-09-07', '13:51:15', 11, 4002300, 48661241, 'Aathash Rice - 5kg', 240, 0, 1, 'pending', 'admin'),
(664, '2020-09-07', '13:51:15', 6, 4002300, 70936736, 'Miniket Rice Premium - 5 kg', 275, 0, 1, 'pending', 'admin'),
(665, '2020-09-07', '13:51:15', 14, 4002300, 17122610, 'Katarivog Rice - 1kg', 95, 0, 1, 'pending', 'admin'),
(666, '2020-09-07', '13:51:15', 10, 4002300, 94767344, 'Miniket Rice Premium - 5kg', 275, 0, 1, 'pending', 'admin'),
(667, '2020-09-07', '13:51:15', 12, 4002300, 47918662, 'Atop Rice - 1kg', 45, 0, 1, 'pending', 'admin'),
(668, '2020-09-07', '13:51:15', 4476, 4002300, 59706702, 'Onion (Local) 1 kg', 50, 0, 1, 'pending', 'admin'),
(669, '2020-09-07', '13:51:15', 13, 4002300, 48213289, 'Rupchanda Chinigura Premium Aromatic Rice - 1kg', 135, 0, 1, 'pending', 'admin'),
(670, '2020-09-07', '13:51:15', 9, 4002300, 69333818, 'Chinigura Rice - 1kg', 99, 0, 1, 'pending', 'admin'),
(671, '2020-09-07', '13:51:16', 15, 4002300, 246784, 'Fresh Chinigura Rice - 1kg', 130, 0, 1, 'pending', 'admin'),
(672, '2020-09-07', '13:51:16', 29, 4002300, 97474007, 'Nescafe Original Coffee (Indonesia) - 200 gm', 499, 0, 1, 'pending', 'admin'),
(673, '2020-09-07', '13:51:16', 4474, 4002300, 18703312, 'Nazirshail Rice Premium - 5kg', 292, 0, 1, 'pending', 'admin'),
(674, '2020-09-07', '13:51:16', 2149, 4002300, 4778612, 'Angelic Fresh Air Freshener Citrus Burst 300 ml', 215, 0, 1, 'pending', 'admin'),
(675, '2020-09-07', '13:51:16', 2145, 4002300, 75416065, 'Odonil Zipper Citrus 10 gm', 60, 0, 2, 'pending', 'admin'),
(676, '2020-09-07', '13:51:16', 2605, 4002300, 9224346, 'Huggies Dry Baby Belt Diaper L 9-14 kg 60 pcs', 1399, 0, 1, 'pending', 'admin'),
(677, '2020-09-07', '13:51:16', 2583, 4002300, 84545090, 'Nannys Baby Diaper Belt 1 New Born 2-5 kg 44 pcs', 999, 0, 1, 'pending', 'admin'),
(678, '2020-09-07', '13:51:16', 2603, 4002300, 5257142, 'Farlin Baby Moisture Anti Rash Wet Wipes Pink (DT-006A) 85 pcs', 415, 0, 1, 'pending', 'admin'),
(679, '2020-09-07', '13:51:16', 2578, 4002300, 47108849, 'Molfix Baby Diaper Belt 1 New Born 2-5 kg 44 pcs', 799, 0, 1, 'pending', 'admin'),
(680, '2020-09-07', '13:51:16', 2579, 4002300, 91319153, 'SUPERMOM Baby Diaper Belt S New Born-8 kg 28 pcs', 549, 0, 1, 'pending', 'admin'),
(681, '2020-09-07', '13:51:16', 2606, 4002300, 28969671, 'Huggies Dry Pants Baby Diaper Pant L 9-14 kg 50 pcs', 1299, 0, 1, 'pending', 'admin'),
(683, '2020-09-09', '11:27:33', 4480, 52032071, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 1, 'pending', 'admin'),
(687, '2020-09-09', '17:28:10', 3, 57000936, 93345059, 'Lifeboy', 32, 0, 1, 'pending', 'admin'),
(689, '2020-09-09', '17:45:49', 4480, 57000936, 3193497, 'Philips Tester 3.5X52 mm', 25, 0, 5, 'pending', 'admin'),
(690, '2020-09-11', '13:39:06', 2449, 26296017, 51527181, 'Super Action Booster Mosquito Coil 10 pcs', 30, 0, 1, 'pending', 'admin'),
(691, '2020-09-11', '13:39:06', 2450, 26296017, 42406445, 'Finis Insect Powder 80 gm', 40, 0, 1, 'pending', 'admin'),
(692, '2020-09-11', '13:39:06', 2451, 26296017, 71649855, 'Finis Insect Powder 100 gm', 40, 0, 1, 'pending', 'admin'),
(693, '2020-09-11', '16:02:24', 3347, 88278397, 37327116, 'Nestle MILO Activ-Go (Chocolate Flavored) Powder Drink Pouch 250 gm', 270, 0, 1, 'pending', 'admin'),
(694, '2020-09-11', '16:02:24', 3351, 88278397, 75109296, 'Chocolate Horlicks Jar 500 gm', 350, 0, 1, 'pending', 'admin'),
(695, '2020-09-11', '16:02:24', 3348, 88278397, 3174878, 'Junior Horlicks Jar 500 gm', 390, 0, 1, 'pending', 'admin'),
(696, '2020-09-11', '16:02:24', 3346, 88278397, 42292323, 'Horlicks Standard Jar 1000 gm', 645, 0, 1, 'pending', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `our_security`
--

CREATE TABLE `our_security` (
  `id` int(11) NOT NULL,
  `link` text NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `our_security`
--

INSERT INTO `our_security` (`id`, `link`, `path`, `created_at`, `uploader_id`, `updated_at`, `status`) VALUES
(1, 'https://www.google.com/', '1604086755.webp', '2020-10-31 01:39:15', 10, '2020-10-31 01:39:15', 1),
(2, 'https://onnorokomshop.com/new-slider?system=NDdfMjg%3D', '1604086722.webp', '2020-10-31 01:38:42', 10, '2020-10-31 01:38:42', 1),
(3, 'https://asthaonline.com/', '1604086736.webp', '2020-10-31 01:38:56', 10, '2020-10-31 01:38:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `price` float(8,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `user_id`, `date`, `time`, `package_name`, `price`) VALUES
(9, 19, '2021-01-10', '10:19:24', 'gold', 150.00),
(8, 18, '2021-01-09', '01:13:30', 'silver', 50.00),
(6, 21, '2021-01-04', '02:06:00', 'gold', 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `package_history`
--

CREATE TABLE `package_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `price` float(8,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package_history`
--

INSERT INTO `package_history` (`id`, `user_id`, `date`, `time`, `package_name`, `price`) VALUES
(3, 18, '2020-12-30', '03:05:25', 'silver', 50.00),
(4, 18, '2020-12-30', '03:05:54', 'gold', 150.00),
(5, 19, '2021-01-01', '19:30:16', 'gold', 150.00),
(7, 21, '2021-01-04', '01:58:31', 'bronze', 25.00),
(8, 21, '2021-01-04', '02:03:45', 'silver', 50.00),
(9, 21, '2021-01-04', '02:06:00', 'gold', 150.00),
(10, 22, '2021-01-04', '17:18:39', 'gold', 150.00),
(11, 18, '2021-01-09', '01:13:01', 'bronze', 25.00),
(12, 18, '2021-01-09', '01:13:30', 'silver', 50.00),
(13, 19, '2021-01-10', '10:19:24', 'gold', 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wallet_name` varchar(255) NOT NULL,
  `amount` varchar(25) NOT NULL,
  `trx_id` varchar(255) DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(60) DEFAULT 'pending'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `user_id`, `wallet_name`, `amount`, `trx_id`, `datetime`, `status`) VALUES
(15, 10, 'Block Chain', '0.8', 'sdfsdfs fds fdsf dsf dsfsdfs', '2020-11-07 17:33:09', 'active'),
(16, 10, 'coinme.png', '1', 'sdfsdfs fds fdsf dsf dsfsdfs', '2020-11-07 17:46:50', 'active'),
(17, 13, 'Onnorokomshop', '0.1', 'ewerre', '2020-11-08 04:26:15', 'active'),
(18, 13, 'Bitcoin', '0.1', 'ewerre', '2020-11-08 04:32:49', 'active'),
(19, 13, 'Bitcoin', '0.1', 'ewerre', '2020-11-08 04:34:57', 'active'),
(20, 13, 'Onnorokomshop', '0.1', 'PDF', '2020-11-08 04:39:53', 'active'),
(21, 13, 'Block Chain', '0.1', '11/8/2020', '2020-11-08 05:02:08', 'active'),
(22, 13, 'Block Chain', '0.1', 'ghggh', '2020-11-08 05:07:55', 'active'),
(23, 15, 'Bitcoin', '0.1', 'minerfee0.15 22/11/2020', '2020-11-21 15:05:03', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `recharge_history`
--

CREATE TABLE `recharge_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `amount` float(8,2) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_getway` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recharge_history`
--

INSERT INTO `recharge_history` (`id`, `user_id`, `date`, `time`, `amount`, `trx_id`, `status`, `payment_getway`) VALUES
(1, 18, '2020-12-28', '14:28:43', 10.00, 'IOSDUFOSDILFSDF454/S8F4SF54', 1, 'btc'),
(3, 18, '2020-12-29', '03:37:38', 150.00, 'dsffsdfsdfsd', 1, 'btc'),
(4, 19, '2021-01-01', '19:28:01', 150.00, 'Kkyfvkllfdr', 1, 'btc'),
(5, 21, '2021-01-04', '01:47:48', 200.00, 'sdfd dfsdfsdfs', 1, 'btc'),
(6, 22, '2021-01-04', '17:18:05', 150.00, 'Fgjkscsc', 1, 'btc'),
(7, 19, '2021-01-10', '10:18:32', 200.00, 'Vjd', 1, 'btc'),
(8, 19, '2021-01-10', '10:22:07', 500.00, 'Dvdj', 1, 'btc'),
(9, 19, '2021-01-10', '10:22:08', 500.00, 'Dvdj', 0, 'btc');

-- --------------------------------------------------------

--
-- Table structure for table `refferal_bonus`
--

CREATE TABLE `refferal_bonus` (
  `id` int(11) NOT NULL,
  `id_of_referral_code_owner` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `bonus_amount` float(8,2) NOT NULL,
  `activation_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '(0/1) this status indicate that, this refferar_user buy a package to activate account, if activate then this amount should transferable to main balance',
  `main_balance_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '(0/1) this status indicate that, this amount already added to main balace or not',
  `id_of_who_use_refferal_code` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refferal_bonus`
--

INSERT INTO `refferal_bonus` (`id`, `id_of_referral_code_owner`, `date`, `time`, `bonus_amount`, `activation_status`, `main_balance_status`, `id_of_who_use_refferal_code`) VALUES
(1, 19, '2021-01-04', '17:19:31', 2.00, 1, 1, 21),
(2, 18, '2021-01-04', '02:03:30', 1.00, 1, 1, 19),
(3, 18, '2021-01-04', '02:03:32', 2.00, 1, 1, 21),
(4, 19, '2021-01-04', '17:19:28', 20.00, 1, 1, 21);

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
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) UNSIGNED NOT NULL,
  `uploader_id` int(11) DEFAULT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sounds_like` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(191) DEFAULT NULL,
  `route_name` varchar(191) DEFAULT NULL,
  `selector` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `has_sub_menu` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=not available, 1=available',
  `has_option_menu` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=not available, 1=available',
  `position` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_aside_menus`
--

INSERT INTO `system_aside_menus` (`id`, `name`, `route_name`, `selector`, `icon`, `has_sub_menu`, `has_option_menu`, `position`, `status`) VALUES
(44, 'Settings', NULL, 'theme_settings_menu', 'settings1.svg', 1, 1, 12, 1),
(71, 'Home', 'admin.dashboard', NULL, 'tree1.svg', 0, 0, 0, 1),
(73, 'Slider', NULL, NULL, 'carousel7.svg', 1, 1, 0, 0),
(74, 'Category', NULL, NULL, 'diagram.svg', 1, 1, 0, 0),
(75, 'Sub-subcategory', NULL, NULL, 'color.svg', 1, 1, 0, 0),
(76, 'Subcategory', NULL, NULL, 'subcategory.svg', 1, 1, 0, 0),
(78, 'Contact Info', NULL, NULL, 'envelope(open).svg', 1, 1, 10, 0),
(79, 'Videos', NULL, NULL, 'camera-fill-black.svg', 1, 1, 2, 0),
(80, 'FAQ', NULL, NULL, 'list1.svg', 1, 1, 8, 0),
(81, 'Users', NULL, NULL, 'user.svg', 1, 1, 0, 0),
(82, 'Cirtificate', NULL, NULL, 'layer.svg', 1, 1, 0, 0),
(83, 'Our security', NULL, NULL, 'settings2.svg', 1, 1, 0, 0),
(84, 'Customer feedback', NULL, NULL, 'diagram.svg', 1, 1, 9, 0),
(85, 'BTC', NULL, NULL, 'huarantee.svg', 1, 1, 4, 0),
(86, 'Wallet', NULL, NULL, 'carousel5.svg', 1, 1, 0, 0),
(87, 'Amount', NULL, NULL, 'mony-2.svg', 1, 1, 0, 0),
(88, 'User Payment', NULL, NULL, 'mony-2-strock.svg', 1, 1, 0, 0),
(89, 'Offer', NULL, NULL, 'color.svg', 1, 1, 6, 0),
(90, 'Country', NULL, NULL, 'tree2.svg', 1, 1, 7, 0),
(91, 'User Recharge', NULL, NULL, 'mony-2-strock.svg', 1, 1, 5, 0),
(92, 'Link Ads', NULL, NULL, 'child.svg', 1, 1, 3, 0),
(93, 'Withdraw Request', NULL, NULL, 'mony-2.svg', 1, 1, 1, 0),
(94, 'Profile', 'admin.admin_view', NULL, 'user.svg', 0, 0, 11, 0),
(95, 'Logout', 'admin.logout', NULL, 'signout.svg', 0, 0, 13, 0),
(96, 'Task List', 'admin.task_list', NULL, 'toggle_bar.svg', 0, 1, 0, 1),
(97, 'Calendar', 'admin.calendar', NULL, 'calander.svg', 0, 1, 0, 1),
(98, 'Campaigns', NULL, NULL, 'layer.svg', 1, 1, 0, 1),
(99, 'Recipients', NULL, NULL, 'users.svg', 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_aside_menu_dropdowns`
--

CREATE TABLE `system_aside_menu_dropdowns` (
  `id` int(11) NOT NULL,
  `aside_menu_id` int(11) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `route_name` varchar(191) DEFAULT NULL,
  `icon` varchar(191) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(106, 74, 'New', 'admin.add_new_category', 'plus-black-bold.svg', 0, 0),
(107, 74, 'List', 'admin.all_category', 'list2.svg', 0, 0),
(108, 74, 'Trash List', 'admin.all_trash_category', 'trash-strock.svg', 0, 0),
(113, 78, 'Contact List', 'admin.contact_us', 'list2.svg', 0, 0),
(114, 79, 'New', 'admin.video', 'plus-black-bold-rounded.svg', 0, 0),
(115, 76, 'New', 'admin.add_new_subcategory', 'plus-black-bold.svg', 0, 0),
(116, 76, 'Subcategory List', 'admin.all_subcategory', 'list2.svg', 0, 0),
(117, 76, 'Subcategory Trast', 'admin.all_trash_subcategory', 'trash-strock.svg', 0, 0),
(118, 80, 'New', 'admin.add_new_news', 'plus-black-bold.svg', 0, 0),
(119, 80, 'List', 'admin.all_news', 'list2.svg', 0, 0),
(120, 80, 'Trash', 'admin.all_trash_news', 'trash-strock.svg', 0, 0),
(121, 81, 'List', 'admin.all_user', 'list2.svg', 0, 0),
(122, 81, 'New', 'admin.add_new_user', 'plus-black-bold.svg', 0, 0),
(123, 81, 'Trash', 'admin.all_trash_user', 'trash-strock.svg', 0, 0),
(124, 78, 'Trash', 'admin.contact_us_all_trash', 'trash-strock.svg', 0, 0),
(125, 82, 'New', 'admin.add_new_cirtificate', 'plus-black-bold.svg', 0, 0),
(126, 82, 'List', 'admin.all_cirtificate', 'list2.svg', 0, 0),
(127, 82, 'Trash', 'admin.all_trash_cirtificate', 'trash-strock.svg', 0, 0),
(128, 83, 'New', 'admin.add_new_our_security', 'plus-black-bold.svg', 0, 0),
(129, 83, 'List', 'admin.all_our_security', 'list2.svg', 0, 0),
(130, 83, 'Trash', 'admin.all_trash_our_security', 'trash-strock.svg', 0, 0),
(131, 84, 'New', 'admin.add_new_customer_feedback', 'plus-black-bold.svg', 0, 0),
(132, 84, 'List', 'admin.all_customer_feedback', 'list2.svg', 0, 0),
(133, 84, 'Trash', 'admin.all_trash_customer_feedback', 'trash-strock.svg', 0, 0),
(134, 85, 'New', 'admin.add_new_btc', 'plus-black-bold.svg', 0, 0),
(135, 85, 'List', 'admin.all_btc', 'list2.svg', 0, 0),
(136, 85, 'Trash', 'admin.all_trash_btc', 'trash-strock.svg', 0, 0),
(137, 86, 'New', 'admin.add_new_wallet', 'plus-black-bold.svg', 0, 0),
(138, 86, 'List', 'admin.all_wallet', 'list2.svg', 0, 0),
(139, 86, 'Trash', 'admin.all_trash_wallet', 'trash-strock.svg', 0, 0),
(140, 87, 'New', 'admin.add_new_amount', 'plus-black-bold.svg', 0, 0),
(141, 87, 'List', 'admin.all_amount', 'list2.svg', 0, 0),
(142, 87, 'Trash', 'admin.all_trash_amount', 'trash-strock.svg', 0, 0),
(143, 88, 'List', 'admin.user_payment_list', 'list2.svg', 0, 0),
(144, 89, 'Modal Offer', 'admin.modal_offer', 'plus-black-bold.svg', 0, 0),
(145, 90, 'New', 'admin.country', 'plus-black-bold.svg', 0, 0),
(146, 91, 'Pending', 'admin.all_user_recharge_pending', 'calendar-clock.svg', 0, 0),
(147, 91, 'Activate', 'admin.all_user_recharge_activate', 'list1.svg', 0, 0),
(148, 92, 'New', 'admin.link_ads', 'plus-black-bold.svg', 0, 0),
(149, 93, 'Pending', 'admin.all_user_withdraw_pending', 'calendar-clock.svg', 0, 0),
(150, 93, 'Complete', 'admin.all_user_withdraw_complete', 'guarantee.svg', 0, 0),
(151, 98, 'New', 'admin.add_new_campaign', 'plus-black-bold.svg', 0, 1),
(152, 99, 'List', 'admin.all_campaign', 'list2.svg', 0, 1),
(153, 98, 'List', 'admin.all_campaign', 'list2.svg', 0, 1),
(154, 98, 'Trash', 'admin.all_trash_campaign', 'trash-strock.svg', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_option_menus`
--

CREATE TABLE `system_option_menus` (
  `id` int(11) NOT NULL,
  `aside_menu_id` int(11) DEFAULT NULL,
  `asidedropdown_menu_id` int(11) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `route_name` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_option_menus`
--

INSERT INTO `system_option_menus` (`id`, `aside_menu_id`, `asidedropdown_menu_id`, `name`, `type`, `route_name`, `position`, `icon`, `status`) VALUES
(117, 73, 104, 'Edit', 'warning', 'admin.update_slider', 0, 'pancil-strok.svg', 0),
(119, 73, 104, 'Trash', 'danger', 'admin.trash_slider', 0, 'trash-strock.svg', 0),
(120, 73, 105, 'Restore', 'success', 'admin.restore_slider', 0, 'undo-black.svg', 0),
(121, 73, 105, 'Delete', 'danger', 'admin.delete_slider', 0, 'close-red.svg', 0),
(123, 74, 107, 'Trash', 'danger', 'admin.trash_category', 0, 'trash-strock.svg', 0),
(124, 74, 108, 'Restore', 'success', 'admin.restore_category', 0, 'undo-black.svg', 0),
(128, 78, 113, 'Delete', 'danger', 'admin.contact_us_delete', 0, 'close-red.svg', 0),
(129, 74, 107, 'Edit', 'warning', 'admin.update_category', 0, 'pancil-strok.svg', 0),
(130, 74, 108, 'Delete', 'danger', 'admin.delete_category', 0, 'close-red.svg', 0),
(131, 76, 116, 'Edit', 'warning', 'admin.update_subcategory', 0, 'pancil-strok.svg', 0),
(132, 76, 116, 'Delete', 'success', 'admin.trash_subcategory', 0, 'trash-strock.svg', 0),
(133, 76, 117, 'Restore', 'success', 'admin.restore_subcategory', 0, 'undo-black.svg', 0),
(134, 76, 117, 'Delete', 'danger', 'admin.delete_subcategory', 0, 'close-red.svg', 0),
(135, 80, 119, 'admin.update_news', 'warning', 'admin.update_news', 0, 'pancil-strok.svg', 0),
(136, 80, 119, 'Trash', 'danger', 'admin.trash_news', 0, 'trash-strock.svg', 0),
(137, 80, 120, 'Restore', 'success', 'admin.restore_news', 0, 'undo-black.svg', 0),
(138, 80, 120, 'Delete', 'danger', 'admin.delete_news', 0, 'close-red.svg', 0),
(139, 81, 121, 'Edit', 'warning', 'admin.update_user', 0, 'pancil-strok.svg', 0),
(140, 81, 121, 'Trash', 'danger', 'admin.trash_user', 0, 'trash-strock.svg', 0),
(141, 81, 123, 'Restore', 'success', 'admin.restore_user', 0, 'undo-black.svg', 0),
(142, 81, 123, 'Delete', 'danger', 'admin.delete_user', 0, 'close-red.svg', 0),
(143, 81, 121, 'Accept Transection', 'success', 'admin.transection_process', 0, 'guarantee.svg', 0),
(144, 78, 113, 'Replay', 'success', 'admin.contact_us_replay', 0, 'list1.svg', 0),
(145, 78, 113, 'Trash', 'danger', 'admin.contact_us_trash', 0, 'trash-strock.svg', 0),
(146, 78, 124, 'Restore', 'success', 'admin.contact_us_restor', 0, 'undo-black.svg', 0),
(147, 78, 124, 'Delete', 'danger', 'admin.contact_us_delete', 0, 'close-red.svg', 0),
(148, 82, 126, 'Edit', 'warning', 'admin.update_cirtificate', 0, 'pancil-strok.svg', 0),
(149, 82, 126, 'Trash', 'danger', 'admin.trash_cirtificate', 0, 'trash-strock.svg', 0),
(150, 82, 127, 'Restore', 'success', 'admin.restore_cirtificate', 0, 'undo-black.svg', 0),
(151, 82, 127, 'Delete', 'danger', 'admin.delete_cirtificate', 0, 'close-red.svg', 0),
(152, 83, 129, 'Edit', 'warning', 'admin.update_our_security', 0, 'pancil-strok.svg', 0),
(153, 83, 129, 'Trash', 'danger', 'admin.trash_our_security', 0, 'trash-strock.svg', 0),
(154, 83, 130, 'Restore', 'success', 'admin.restore_our_security', 0, 'undo-black.svg', 0),
(155, 83, 130, 'Delete', 'danger', 'admin.delete_our_security', 0, 'close-red.svg', 0),
(156, 84, 132, 'Edit', 'warning', 'admin.update_customer_feedback', 0, 'pancil-strok.svg', 0),
(157, 84, 132, 'Trash', 'danger', 'admin.trash_customer_feedback', 0, 'trash-strock.svg', 0),
(158, 84, 133, 'Restore', 'success', 'admin.restore_customer_feedback', 0, 'undo-black.svg', 0),
(159, 84, 133, 'Delete', 'danger', 'admin.delete_customer_feedback', 0, 'close-red.svg', 0),
(160, 85, 135, 'Edit', 'warning', 'admin.update_btc', 0, 'pancil-strok.svg', 0),
(161, 85, 135, 'Trash', 'danger', 'admin.trash_btc', 0, 'trash-strock.svg', 0),
(162, 85, 136, 'Restore', 'success', 'admin.restore_btc', 0, 'undo-black.svg', 0),
(163, 85, 136, 'Delete', 'danger', 'admin.delete_btc', 0, 'close-red.svg', 0),
(164, 86, 138, 'Edit', 'warning', 'admin.update_wallet', 0, 'pancil-strok.svg', 0),
(165, 86, 138, 'Trash', 'danger', 'admin.trash_wallet', 0, 'trash-strock.svg', 0),
(166, 86, 139, 'Restor', 'success', 'admin.restore_wallet', 0, 'undo-black.svg', 0),
(167, 86, 139, 'Delete', 'danger', 'admin.delete_wallet', 0, 'close-red.svg', 0),
(168, 87, 141, 'Edit', 'warning', 'admin.update_amount', 0, 'pancil-strok.svg', 0),
(169, 87, 141, 'Trash', 'danger', 'admin.trash_amount', 0, 'trash-strock.svg', 0),
(170, 87, 142, 'Restore', 'success', 'admin.restore_amount', 0, 'undo-black.svg', 0),
(171, 87, 142, 'Delete', 'danger', 'admin.delete_amount', 0, 'close-red.svg', 0),
(172, 88, 143, 'Approve Payment', 'success', 'admin.user_payment_approve', 0, 'guarantee.svg', 0),
(173, 88, 143, 'Delete', 'danger', 'admin.contact_us_delete', 0, 'close-red.svg', 0),
(174, 90, 145, 'Delete', 'danger', 'admin.country_delete', 0, 'close-red.svg', 0),
(175, 91, 146, 'Pending To Activate', 'success', 'admin.all_user_recharge_pending_to_activate', 0, 'guarantee.svg', 0),
(176, 91, 146, 'Delete', 'danger', 'admin.delete_user_recharge', 0, 'close-red.svg', 0),
(177, 91, 147, 'Send To Pending', 'warning', 'admin.all_user_recharge_activate_to_pending', 0, 'undo-black.svg', 0),
(178, 92, 148, 'Delete', 'danger', 'admin.link_ads_delete', 0, 'close-red.svg', 0),
(179, 93, 149, 'Change To Complete', 'success', 'admin.all_user_withdraw_pending_to_complete', 0, 'guarantee.svg', 0),
(181, 98, 153, 'Edit', 'warning', 'admin.update_campaign', 0, 'pancil-strok.svg', 1),
(182, 98, 153, 'Trash', 'danger', 'admin.trash_campaign', 0, 'trash-strock.svg', 1),
(183, 98, 154, 'Restore', 'success', 'admin.restore_campaign', 0, 'undo-black.svg', 1),
(184, 98, 154, 'Delete', 'danger', 'admin.delete_campaign', 0, 'close-red.svg', 1),
(185, 98, 153, 'View', 'success', 'admin.view', 0, 'eye(open).svg', 1);

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
(13, 'site_name', 'Demo Project', 1),
(14, 'header_text', 'mediasheba.com', 1),
(15, 'footer_text', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Earum optio officia hic quae harum numquam nihil vitae accusantium provident beatae!', 1),
(16, 'header_logo', 'public/backend/img/logo/header_logo_6463084_1608219532000.png', 1),
(17, 'footer_logo', 'public/backend/img/logo/footer_logo_3623076_1608219532000.png', 1),
(18, 'favicon', 'public/backend/img/logo/favicon_7159228_1607183296000.png', 1),
(19, 'console_disabling', 'no', 1),
(20, 'language', 'bn', 1),
(21, 'soft_type', 'whole_sale', 1),
(22, 'soft_mode', 'light', 1),
(23, 'notification_limit', '10', 1),
(24, 'expiration_before', '8', 1),
(25, 'email', 'support@demo.com', 1),
(26, 'phone', '+13156446454', 1),
(27, 'about_us', 'Mediasheba.com এ সবাইকে স্বাগতম। আমরা যে সকল সেবা সমূহ প্রদান করে থাকিঃ\r\n ১★সাংস্কৃতিক অনুষ্ঠানের জন্য সকল ধরনের সিঙ্গার ও মিউজিসিয়ান হায়ার করতে পারবেন।\r\n২★আপনার পছন্দের  ব্যান্ড দিয়ে শো করাতে চাইলে পুরো সেটাপ হায়ার করতে পারবেন।\r\n৩★মৌলিক গান,কভার গান, থিম সং, বিজ্ঞাপনের গান ছাড়াও পুরো  এ্যালবামের জন্য কম্পোজার হায়ার করতে পারবেন।\r\n৫★আপনার অনুষ্ঠান আরও সুন্দর্য্য মন্ডিত করার জন্য মর্ডান ও ক্লাসিকাল নৃত্য শিল্পী হায়ার করতে পারবেন।\r\n৬★ফ্লিম,শর্টফ্লিম,বিজ্ঞাপন ও গানের মডেলিং এর জন্য অভিনেতা ও অভিনেত্রী হায়ার করতে পারেন।\r\n৭★অনুষ্ঠানের আরো সুন্দর্য বাড়াতে কমেডিয়ান ও উপস্থাপক হায়ার করতে পারেন। \r\n৮★ কোন শুটিং অথবা অনুষ্ঠানের ভিডিও ধারনের জন্য ফটোগ্রাফার অথবা ভিডিও-গ্রাফার হায়ার করতে পারেন। \r\n৯★অনুষ্ঠানে Dj বা সাউন্ড সিস্টেম এবং আলোক সজ্জা বা লাইটিং সিস্টেম হায়ার করতে পারেন।\r\n১০★এছাড়া ও ডেকারেশন, বাবুর্চি ব্যান্ডপার্টি ফুল ওয়ালি,  বিউটিশিয়ান, কাজী, সার্ফম্যান, লেবার হায়ার করতে পারবেন।\r\n১১★সকল ধরনের মিউজিক ও নাচের ইনস্ট্রুমেন্ট ক্রয় করতে পারবেন।\r\n১২★নাচ গান, বাদ্যযন্ত ও আর্টের শিক্ষক পাওয়া যায়। সুর দরিয়া সংগীত একাডেমির মাধ্যমে প্রশিক্ষন দেওয়া হয়।\r\n১৩★নাটের গুরু ব্যান্ডে এর পুরে সেটাপ এর মাধ্যমে সকল ধরনের সংস্কৃতির অনুষ্ঠান করা হয়।যেমনঃ- বিয়ে,গায়েহলুদ, স্কুল - কলেজের প্রোগ্রাম, পিকনিকের অনুষ্ঠান, জাতীয় প্রোগ্রাম জন্মদিন, ছাড়াও বিভিন্ন বাজেটে সকল ধরনের কনসার্ট করা হয়।\r\n১৪★আপনি চাইলে পুরো ইভেন্ট আমাদের মাধ্যমে সম্পন্ন করতে পারবেন।', 1),
(28, 'services', 'Mediasheba.com এ সবাইকে স্বাগতম। আমরা যে সকল সেবা সমূহ প্রদান করে থাকিঃ\r\n ১★সাংস্কৃতিক অনুষ্ঠানের জন্য সকল ধরনের সিঙ্গার ও মিউজিসিয়ান হায়ার করতে পারবেন।\r\n২★আপনার পছন্দের  ব্যান্ড দিয়ে শো করাতে চাইলে পুরো সেটাপ হায়ার করতে পারবেন।\r\n৩★মৌলিক গান,কভার গান, থিম সং, বিজ্ঞাপনের গান ছাড়াও পুরো  এ্যালবামের জন্য কম্পোজার হায়ার করতে পারবেন।\r\n৫★আপনার অনুষ্ঠান আরও সুন্দর্য্য মন্ডিত করার জন্য মর্ডান ও ক্লাসিকাল নৃত্য শিল্পী হায়ার করতে পারবেন।\r\n৬★ফ্লিম,শর্টফ্লিম,বিজ্ঞাপন ও গানের মডেলিং এর জন্য অভিনেতা ও অভিনেত্রী হায়ার করতে পারেন।\r\n৭★অনুষ্ঠানের আরো সুন্দর্য বাড়াতে কমেডিয়ান ও উপস্থাপক হায়ার করতে পারেন। \r\n৮★ কোন শুটিং অথবা অনুষ্ঠানের ভিডিও ধারনের জন্য ফটোগ্রাফার অথবা ভিডিও-গ্রাফার হায়ার করতে পারেন। \r\n৯★অনুষ্ঠানে Dj বা সাউন্ড সিস্টেম এবং আলোক সজ্জা বা লাইটিং সিস্টেম হায়ার করতে পারেন।\r\n১০★এছাড়া ও ডেকারেশন, বাবুর্চি ব্যান্ডপার্টি ফুল ওয়ালি,  বিউটিশিয়ান, কাজী, সার্ফম্যান, লেবার হায়ার করতে পারবেন।\r\n১১★সকল ধরনের মিউজিক ও নাচের ইনস্ট্রুমেন্ট ক্রয় করতে পারবেন।\r\n১২★নাচ গান, বাদ্যযন্ত ও আর্টের শিক্ষক পাওয়া যায়। সুর দরিয়া সংগীত একাডেমির মাধ্যমে প্রশিক্ষন দেওয়া হয়।\r\n১৩★নাটের গুরু ব্যান্ডে এর পুরে সেটাপ এর মাধ্যমে সকল ধরনের সংস্কৃতির অনুষ্ঠান করা হয়।যেমনঃ- বিয়ে,গায়েহলুদ, স্কুল - কলেজের প্রোগ্রাম, পিকনিকের অনুষ্ঠান, জাতীয় প্রোগ্রাম জন্মদিন, ছাড়াও বিভিন্ন বাজেটে সকল ধরনের কনসার্ট করা হয়।\r\n১৪★আপনি চাইলে পুরো ইভেন্ট আমাদের মাধ্যমে সম্পন্ন করতে পারবেন।', 1),
(29, 'address', 'Street : 868  Friendship Lane  City: New York  Zip Code: 10001', 1),
(30, 'contact_text', 'My Lorem ipsum, dolor sit amet consectetur adipisicing elit. Earum optio officia hic quae harum numquam nihil vitae accusantium provident beatae!', 1),
(31, 'about_text', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 1);

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
  `video_code` varchar(200) NOT NULL,
  `details` text NOT NULL,
  `cpc` float(8,2) NOT NULL DEFAULT 0.25,
  `hit_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_code`, `details`, `cpc`, `hit_count`) VALUES
(2, 'vE-LbePvbBE', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0.25, 0),
(3, '3HgiET60Yyo', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0.25, 0),
(4, 'Ka2PxvMuHKM', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0.25, 0),
(5, 'zTFCb9K-4YI', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0.25, 0),
(6, 'ilAKF4jS3ZM', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0.25, 0),
(7, 's9leVG_STAA', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 0.25, 0),
(8, 'F22rI8jpaV4', 'fsdfsdfsdf', 0.25, 3),
(9, '_VnzAVywNwc', 'sdfs d fsd fsd fs', 0.30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) UNSIGNED NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `logo_img_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_history`
--

CREATE TABLE `withdraw_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `withdraw_amount` float(8,2) NOT NULL,
  `withdraw_type` varchar(50) NOT NULL,
  `wallet_address` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending' COMMENT 'pending|approved'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `withdraw_history`
--

INSERT INTO `withdraw_history` (`id`, `user_id`, `date`, `time`, `withdraw_amount`, `withdraw_type`, `wallet_address`, `status`) VALUES
(3, 18, '2021-01-09', '01:15:00', 40.00, 'regular', '', 'pending'),
(2, 18, '2021-01-03', '04:08:50', 100.00, 'regular', '', 'complete'),
(4, 19, '2021-01-10', '10:20:22', 100.00, 'instant', '', 'pending'),
(5, 18, '2021-01-10', '12:13:48', 50.00, 'regular', 'coinbase@gmail.com', 'complete');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
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
-- Indexes for table `ads_earning`
--
ALTER TABLE `ads_earning`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads_earning_history`
--
ALTER TABLE `ads_earning_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads_hit_count`
--
ALTER TABLE `ads_hit_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amount`
--
ALTER TABLE `amount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploader_id` (`uploader_id`);

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
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
-- Indexes for table `btcs`
--
ALTER TABLE `btcs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploader_id` (`uploader_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`sounds_like`(191)),
  ADD KEY `uploader_id` (`uploader_id`);

--
-- Indexes for table `cirtificates`
--
ALTER TABLE `cirtificates`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link_ads`
--
ALTER TABLE `link_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modal_offer`
--
ALTER TABLE `modal_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`description`(191)),
  ADD KEY `uploader_id` (`uploader_id`);

--
-- Indexes for table `our_security`
--
ALTER TABLE `our_security`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_history`
--
ALTER TABLE `package_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recharge_history`
--
ALTER TABLE `recharge_history`
  ADD KEY `id` (`id`);

--
-- Indexes for table `refferal_bonus`
--
ALTER TABLE `refferal_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
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
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploader_id` (`uploader_id`);

--
-- Indexes for table `withdraw_history`
--
ALTER TABLE `withdraw_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `admin_meta`
--
ALTER TABLE `admin_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_privileges`
--
ALTER TABLE `admin_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ads_earning`
--
ALTER TABLE `ads_earning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ads_earning_history`
--
ALTER TABLE `ads_earning_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ads_hit_count`
--
ALTER TABLE `ads_hit_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `amount`
--
ALTER TABLE `amount`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `btcs`
--
ALTER TABLE `btcs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cirtificates`
--
ALTER TABLE `cirtificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_feedbacks`
--
ALTER TABLE `customer_feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `link_ads`
--
ALTER TABLE `link_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `modal_offer`
--
ALTER TABLE `modal_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `our_security`
--
ALTER TABLE `our_security`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `package_history`
--
ALTER TABLE `package_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `recharge_history`
--
ALTER TABLE `recharge_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `refferal_bonus`
--
ALTER TABLE `refferal_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriber_meta`
--
ALTER TABLE `subscriber_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_aside_menus`
--
ALTER TABLE `system_aside_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `system_aside_menu_dropdowns`
--
ALTER TABLE `system_aside_menu_dropdowns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `system_option_menus`
--
ALTER TABLE `system_option_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `system_theme_settings`
--
ALTER TABLE `system_theme_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `withdraw_history`
--
ALTER TABLE `withdraw_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
