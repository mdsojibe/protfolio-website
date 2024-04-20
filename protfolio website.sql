-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 20, 2024 at 03:57 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int DEFAULT NULL,
  `comments` int DEFAULT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `description`, `likes`, `comments`, `button_text`, `button_url`, `button_target`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, '[\"1\"]', 'sdfadsfasfssfff', '<p>sdfafdsfasdfdsafsafsadfdsafsd<br></p>', 120, 20, 'Read More..', '#', '_self', '2194389181710690140.png', '1', '2024-03-17 09:17:54', '2024-03-17 09:42:20'),
(2, '[\"1\",\"2\"]', 'Project Title', '<p>asfasdfsafadsfdsfsd<br></p>', 120, 125, 'Read More..', '#', '_self', '12082445241710688734.jpg', '1', '2024-03-17 09:18:54', '2024-03-17 09:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=publish, 2=pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TV & Audios', 'tv-audios', '1', '2024-02-21 03:59:02', '2024-02-21 03:59:02'),
(2, 'Dslr Camera', 'dslr-camera', '1', '2024-02-21 03:59:16', '2024-02-21 03:59:16'),
(4, 'pizzas', 'pizzas', '1', '2024-02-21 09:59:39', '2024-02-21 09:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_sections`
--

CREATE TABLE `frontend_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `section_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=publish , 2=pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontend_sections`
--

INSERT INTO `frontend_sections` (`id`, `section_name`, `data`, `status`, `created_at`, `updated_at`) VALUES
(1, 'hero_section', '{\"hello_text\":\"hello text\",\"title\":\"Hero section\",\"designation\":\"UI\\/UX Designer\",\"hire_button_target\":\"_self\",\"hire_button_url\":\"#\",\"hire_button_text\":\"HIRE ME\",\"cv_button_target\":\"_blank\",\"cv_button_url\":\"#\",\"cv_button_text\":\"DOWNLOAD CV\",\"social_share\":\"[{\\\"social_icon\\\":\\\"<i class=\\\\\\\"ti-facebook\\\\\\\"><\\\\\\/i>\\\",\\\"socail_url\\\":\\\"#\\\",\\\"socail_target\\\":\\\"_blank\\\"},{\\\"social_icon\\\":\\\"<i class=\\\\\\\"ti-google\\\\\\\"><\\\\\\/i>\\\",\\\"socail_url\\\":\\\"#\\\",\\\"socail_target\\\":\\\"_blank\\\"},{\\\"social_icon\\\":\\\"<i class=\\\\\\\"ti-github\\\\\\\"><\\\\\\/i>\\\",\\\"socail_url\\\":\\\"#\\\",\\\"socail_target\\\":\\\"_blank\\\"},{\\\"social_icon\\\":\\\"<i class=\\\\\\\"ti-twitter\\\\\\\"><\\\\\\/i>\\\",\\\"socail_url\\\":\\\"#\\\",\\\"socail_target\\\":\\\"_blank\\\"}]\",\"image\":\"14561487421708284177.svg\"}', '1', '2024-02-09 11:12:50', '2024-02-18 13:22:57'),
(2, 'counter_section', '{\"number\":\"124\",\"title\":\"Happy Clients\"}', '1', '2024-02-19 12:20:35', '2024-02-19 12:20:35'),
(3, 'counter_section', '{\"number\":\"456\",\"title\":\"Project Completed\"}', '1', '2024-02-19 12:20:53', '2024-02-19 12:20:53'),
(4, 'counter_section', '{\"number\":\"789\",\"title\":\"Awards Won\"}', '1', '2024-02-19 12:21:08', '2024-02-19 12:21:08'),
(5, 'about_section', '{\"title\":\"James Smith\",\"sub_title\":\"UI\\/UX Designer\",\"description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident, \\r\\npariatur, aperiam aut autem voluptas odit. Odio ducimus delectus totam \\r\\nsed aliquam sequi praesentium mollitia, illum repudiandae quidem quod, \\r\\nmagni magnam.<\\/p>\\r\\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing \\r\\nelit. Enim, eius, nam. Quo praesentium qui temporibus voluptatum, \\r\\nfacilis aliquid eligendi fugiat beatae neque inventore non. Laborum \\r\\nrepellendus consequatur ullam voluptatum asperiores.<\\/p><p><\\/p>\",\"button_text\":\"DOWNLOAD CV\",\"button_target\":\"_blank\",\"button_url\":\"#\",\"image\":\"6828617801708443030.jpg\"}', '1', '2024-02-20 09:30:30', '2024-02-20 09:30:30'),
(6, 'service_section', '{\"service_icon\":\"<i class=\\\"icon ti-crown\\\"><\\/i>\",\"title\":\"UI\\/UX Design\"}', '1', '2024-02-20 10:10:32', '2024-02-20 10:10:32'),
(7, 'service_section', '{\"service_icon\":\"<i class=\\\"icon ti-desktop\\\"><\\/i>\",\"title\":\"Web Design\"}', '1', '2024-02-20 10:11:28', '2024-02-20 10:11:28'),
(8, 'service_section', '{\"service_icon\":\"<i class=\\\"icon ti-mobile\\\"><\\/i>\",\"title\":\"App Design\"}', '1', '2024-02-20 10:11:44', '2024-02-20 10:11:44'),
(9, 'service_section', '{\"service_icon\":\"<i class=\\\"icon ti-bar-chart\\\"><\\/i>\",\"title\":\"SEO\"}', '1', '2024-02-20 10:11:58', '2024-02-20 10:11:58'),
(10, 'choose_section', '{\"number\":\"60\",\"title\":\"Photoshop\"}', '1', '2024-02-20 12:35:35', '2024-02-20 12:35:35'),
(11, 'choose_section', '{\"number\":\"90\",\"title\":\"Web Design\"}', '1', '2024-02-20 12:36:06', '2024-02-20 12:36:06'),
(12, 'choose_section', '{\"number\":\"20\",\"title\":\"App Design\"}', '1', '2024-02-20 12:36:40', '2024-02-20 12:36:40'),
(13, 'choose_section', '{\"number\":\"80\",\"title\":\"SEO\"}', '1', '2024-02-20 12:38:03', '2024-02-20 12:38:03'),
(14, 'portfolio_section', '{\"title\":\"Project Title\",\"site_url\":\"http:\\/\\/127.0.0.1:8000\\/\",\"image\":\"5805349041708500100.jpg\"}', '1', '2024-02-21 01:21:40', '2024-02-21 01:21:40'),
(15, 'portfolio_section', '{\"title\":\"Project Title\",\"site_url\":\"http:\\/\\/127.0.0.1:8000\\/\",\"image\":\"4615383961708500123.jpg\"}', '1', '2024-02-21 01:22:03', '2024-02-21 01:22:03'),
(16, 'portfolio_section', '{\"title\":\"Project Title\",\"site_url\":\"http:\\/\\/127.0.0.1:8000\\/\",\"image\":\"4819709591708500205.jpg\"}', '1', '2024-02-21 01:23:25', '2024-02-21 01:23:25'),
(17, 'portfolio_section', '{\"title\":\"Project Title\",\"site_url\":\"http:\\/\\/127.0.0.1:8000\\/\",\"image\":\"15399570481708500254.jpg\"}', '1', '2024-02-21 01:24:14', '2024-02-21 01:24:14'),
(18, 'portfolio_section', '{\"title\":\"Project Title\",\"site_url\":\"http:\\/\\/127.0.0.1:8000\\/\",\"image\":\"296470361708500286.jpg\"}', '1', '2024-02-21 01:24:46', '2024-02-21 01:24:46'),
(19, 'portfolio_section', '{\"title\":\"Project Title\",\"site_url\":\"http:\\/\\/127.0.0.1:8000\\/\",\"image\":\"6836728831708500303.jpg\"}', '1', '2024-02-21 01:25:03', '2024-02-21 01:25:03'),
(20, 'testmonial_section', '{\"testmonial_name\":\"Emma Re\",\"designation\":\"Graphic Designer\",\"description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam nostrum voluptates in enim vel amet?<\\/p>\",\"image\":\"6972622781708501381.jpg\"}', '1', '2024-02-21 01:43:01', '2024-02-21 01:43:01'),
(21, 'testmonial_section', '{\"testmonial_name\":\"James Bert\",\"designation\":\"Web Designer\",\"description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam nostrum voluptates in enim vel amet?<\\/p>\",\"image\":\"9772477191708501425.jpg\"}', '1', '2024-02-21 01:43:45', '2024-02-21 01:43:45'),
(22, 'testmonial_section', '{\"testmonial_name\":\"Michael Abra\",\"designation\":\"Web Developer\",\"description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam nostrum voluptates in enim vel amet?<\\/p>\",\"image\":\"8170395221708501456.jpg\"}', '1', '2024-02-21 01:44:16', '2024-02-21 01:44:16'),
(23, 'blog_section', '{\"category\":\"1\",\"title\":\"Designe for Everyone\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut ad vel \\r\\ndolorum, iusto velit, minima? Voluptas nemo harum impedit nisi.\",\"button_url\":\"#\",\"button_text\":\"Read More..\",\"button_target\":\"_blank\",\"image\":\"16021504411708531128.jpg\"}', '1', '2024-02-21 09:23:11', '2024-02-21 09:58:48'),
(24, 'blog_section', '{\"category\":\"2\",\"title\":\"Web Layouts\",\"description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut ad vel \\r\\ndolorum, iusto velit, minima? Voluptas nemo harum impedit nisi.<\\/p>\",\"button_url\":\"#\",\"button_text\":\"Read More..\",\"button_target\":\"_blank\",\"image\":\"251972341708531210.jpg\"}', '1', '2024-02-21 10:00:10', '2024-02-21 10:00:10'),
(25, 'blog_section', '{\"category\":\"4\",\"title\":\"Bootstrap Framework\",\"description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut ad vel \\r\\ndolorum, iusto velit, minima? Voluptas nemo harum impedit nisi.<\\/p>\",\"button_url\":\"#\",\"button_text\":\"Read More..\",\"button_target\":\"_blank\",\"image\":\"13248968231708531241.jpg\"}', '1', '2024-02-21 10:00:41', '2024-02-21 10:00:41'),
(26, 'hireme_section', '{\"title\":\"Hire Me For Your Project\",\"description\":\"<p>Accusantium labore nostrum similique quisquam.<\\/p>\",\"button_text\":\"Hire Me!\",\"button_target\":\"_blank\",\"button_url\":\"#\"}', '1', '2024-02-21 11:05:35', '2024-02-21 11:05:35'),
(27, 'mapaddress_section', '{\"subtitle\":\"Available 24\\/7\",\"title\":\"Get In Touch\",\"location_title\":\"Location\",\"address\":\"12345 Fake ST NoWhere AB Country\",\"number_title\":\"Phone Number\",\"number\":\"(123) 456-7890\",\"email_title\":\"Email Address\",\"email\":\"info@website.com\",\"map_url\":\"https:\\/\\/snazzymaps.com\\/embed\\/61257\"}', '1', '2024-02-22 12:00:29', '2024-02-22 12:15:12');

-- --------------------------------------------------------

--
-- Table structure for table `home_page_common_titles`
--

CREATE TABLE `home_page_common_titles` (
  `id` bigint UNSIGNED NOT NULL,
  `section_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=publish, 2=pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_page_common_titles`
--

INSERT INTO `home_page_common_titles` (`id`, `section_name`, `data`, `status`, `created_at`, `updated_at`) VALUES
(1, 'single_page_title', '{\"service_sub_title\":\"Service\",\"whychoose_sub_title\":\"Skills\",\"portfolio_sub_title\":\"Portfolio\",\"testmonial_sub_title\":\"Testmonial\",\"blogs_sub_title\":\"My Blogs\",\"contact_sub_title\":\"Contact\",\"service_title\":\"What I Do\",\"whychoose_title\":\"Why Choose me\",\"portfolio_title\":\"Check My Wonderful Works\",\"testmonial_title\":\"What People Say About Me\",\"blogs_title\":\"Latest News\",\"contact_title\":\"Get In Touch With Me\",\"service_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In alias dignissimos. <br> rerum commodi corrupti, temporibus non quam.<\\/p>\",\"whychoose_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In alias dignissimos. <br> rerum commodi corrupti, temporibus non quam.<\\/p>\",\"portfolio_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In alias dignissimos. <br> rerum commodi corrupti, temporibus non quam.<\\/p>\",\"testmonial_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In alias dignissimos. <br> rerum commodi corrupti, temporibus non quam.<\\/p>\",\"blogs_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In alias dignissimos. <br> rerum commodi corrupti, temporibus non quam.<\\/p>\",\"contact_description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In alias dignissimos. <br> rerum commodi corrupti, temporibus non quam.<\\/p>\"}', '1', '2024-02-18 12:09:36', '2024-02-18 12:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_roles_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2023_10_13_155605_create_modules_table', 1),
(8, '2023_10_13_155657_create_permissions_table', 1),
(9, '2023_10_13_155811_create_permission_role_table', 1),
(10, '2024_01_24_062109_create_frontend_sections_table', 1),
(11, '2024_01_24_191033_create_home_page_common_titles_table', 1),
(12, '2024_01_30_074154_create_categories_table', 1),
(23, '2024_02_10_174423_create_settings_table', 2),
(28, '2024_03_06_175754_create_blogs_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard Manage', '2024-02-09 11:11:26', '2024-02-09 11:11:26'),
(2, 'Role Manage', '2024-02-09 11:11:26', '2024-02-09 11:11:26'),
(3, 'User Manage', '2024-02-09 11:11:26', '2024-02-09 11:11:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `module_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dashboard Access', 'app.dashboard', '2024-02-09 11:11:26', '2024-02-09 11:11:26'),
(2, 2, 'Role Access', 'app.roles.index', '2024-02-09 11:11:26', '2024-02-09 11:11:26'),
(3, 2, 'Role Create', 'app.roles.create', '2024-02-09 11:11:26', '2024-02-09 11:11:26'),
(4, 2, 'Role Edit', 'app.roles.edit', '2024-02-09 11:11:26', '2024-02-09 11:11:26'),
(5, 2, 'Role Delete', 'app.roles.delete', '2024-02-09 11:11:26', '2024-02-09 11:11:26'),
(6, 3, 'User Access', 'app.users.index', '2024-02-09 11:11:26', '2024-02-09 11:11:26'),
(7, 3, 'User Create', 'app.users.create', '2024-02-09 11:11:26', '2024-02-09 11:11:26'),
(8, 3, 'User Edit', 'app.users.edit', '2024-02-09 11:11:26', '2024-02-09 11:11:26'),
(9, 3, 'User Delete', 'app.users.delete', '2024-02-09 11:11:26', '2024-02-09 11:11:26');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(9, 9, 1, NULL, NULL),
(10, 1, 2, NULL, NULL),
(11, 2, 2, NULL, NULL),
(12, 3, 2, NULL, NULL),
(13, 4, 2, NULL, NULL),
(14, 5, 2, NULL, NULL),
(15, 6, 2, NULL, NULL),
(16, 7, 2, NULL, NULL),
(17, 8, 2, NULL, NULL),
(18, 9, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super-admin', NULL, '2024-02-09 11:11:26', '2024-02-09 11:11:26'),
(2, 'Admin', 'admin', NULL, '2024-02-09 11:11:27', '2024-02-09 11:11:27'),
(3, 'Client', 'client', NULL, '2024-02-09 11:11:27', '2024-02-09 11:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `values` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `values`, `created_at`, `updated_at`) VALUES
(1, 'footer_copyright', 'Copyright 2024 © DevCRUD', '2024-03-06 09:57:27', '2024-03-06 09:57:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super Admin', 'super@gmail.com', '2024-02-09 11:11:27', '$2y$10$EtuXaiBkQjJnkZehe693ZeECQJV/M5Q5QkdwRxWbZ2WxEVNNuyAra', NULL, NULL, '2024-02-09 11:11:27', '2024-02-09 11:11:27'),
(2, 2, 'Admin', 'admin@gmail.com', '2024-02-09 11:11:27', '$2y$10$8kfUf2iKiWx..W.3iqtA0OQWzh5gmNbnky/JARvVR2Y2EK5S8PLw.', NULL, 'BqLbz2S9mXFcvo3Qyp0Y12Bg1CdviSzjz4m6xTBeKPW4y2vkghcckcmYpYYP', '2024-02-09 11:11:27', '2024-02-09 11:11:27'),
(3, 3, 'Client', 'client@gmail.com', NULL, '$2y$10$mGwfgMba1ZVQtyx8LIEpyu/gUJY3YA0UjfJwVLjg233ANRKT8ykFO', NULL, NULL, '2024-02-09 11:11:27', '2024-02-09 11:11:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_title_unique` (`title`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `frontend_sections`
--
ALTER TABLE `frontend_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_page_common_titles`
--
ALTER TABLE `home_page_common_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontend_sections`
--
ALTER TABLE `frontend_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `home_page_common_titles`
--
ALTER TABLE `home_page_common_titles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
