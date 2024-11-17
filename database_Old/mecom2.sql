-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2024 at 06:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mecom2`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('admin','vendor','user') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', NULL, '$2y$10$ijweATWB2DWkDkie46haz.dqIW3gMSG/6ISg2qKDVDmUNtdf1bywm', NULL, NULL, NULL, 'admin', 'active', NULL, NULL, NULL),
(2, 'vendor', 'vendor', 'vendor@vendor.com', NULL, '$2y$10$AxVkrINWu5853Jcel0HqWunper6/JClpfr7.eUwYCgzaZnIAVEdBy', NULL, NULL, NULL, 'vendor', 'active', NULL, NULL, NULL),
(3, 'user', 'user', 'user@user.com', NULL, '$2y$10$0WoTvjGjIC/HWnvvwylr5e7yQRqSBpLIcKi1V9A02Mv0kD89o6eR2', NULL, NULL, NULL, 'user', 'active', NULL, NULL, NULL),
(4, 'Scottie Hansen', 'verdie.pouros', 'lupe.strosin@example.com', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/005533?text=eum', '+12315739727', '515 Hamill Track Suite 871\nPort Cruzville, PA 91535', 'vendor', 'inactive', '71CelpRZA1', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(5, 'Providenci Christiansen', 'bill64', 'blanca.bode@example.com', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/0099aa?text=rem', '+1-541-769-9713', '2059 Kirlin Tunnel Suite 195\nRippinport, NC 18685', 'vendor', 'active', '7kAiCdY1Vd', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(6, 'Houston Rempel', 'bvolkman', 'eulalia.rath@example.net', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00dd11?text=optio', '+1 (443) 765-9116', '37013 Arne Drive Apt. 891\nEddiemouth, KY 67012', 'vendor', 'active', 'sf1vI2QViA', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(7, 'Rashawn Crist PhD', 'joan14', 'conroy.demetris@example.net', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/000011?text=cumque', '551.737.2279', '903 Alverta Gateway Suite 931\nBretport, LA 90301-3687', 'user', 'inactive', 'RUraESyawS', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(8, 'Era Schoen', 'gudrun.schneider', 'jennings36@example.org', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00ff22?text=dolorum', '646.866.2231', '863 Lang Trail\nBetteland, NY 34207', 'admin', 'inactive', '9DKFpPFu4C', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(9, 'Alvina Wolf', 'stroman.winnifred', 'rogers32@example.com', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00bbbb?text=eius', '(973) 430-0900', '21856 Madeline Mission\nPort Wava, ID 88586-1320', 'user', 'inactive', 'bkPlhS8nif', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(10, 'Willis Denesik', 'brock60', 'jones.elvis@example.org', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/003300?text=harum', '303.750.9813', '717 Aubree Vista\nWest Rita, UT 81793', 'vendor', 'inactive', 'KjararljhK', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(11, 'Mrs. Francisca Yundt Jr.', 'idare', 'turner.jennifer@example.org', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00ee99?text=illo', '1-917-989-1656', '319 Tamia Way Apt. 081\nSouth Beaulahview, MO 62064', 'user', 'active', 'JZKZIYMQNj', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(12, 'Hayley Purdy MD', 'angelica42', 'mandy.frami@example.org', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00ffee?text=consectetur', '1-816-975-2307', '109 Orn Ramp Apt. 183\nPort Sharon, VA 81862-3340', 'admin', 'active', 'sbV7zMGP6v', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(13, 'Ari Keebler DDS', 'fmayert', 'snikolaus@example.com', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00bb77?text=impedit', '+15408535816', '618 Tristian Highway Apt. 861\nWest Braedenmouth, AK 31564', 'user', 'active', 'G5sjWiaHd3', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(14, 'Hassie Bartoletti', 'stehr.nikko', 'alycia43@example.com', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/004433?text=quos', '262-459-7393', '5269 Eulalia Motorway\nSouth Richardstad, IN 59670-2580', 'vendor', 'active', 'Uw6723UXJP', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(15, 'Verdie Dicki', 'fmoore', 'block.carissa@example.net', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00ccdd?text=eius', '505.729.5698', '416 Ernser Glen Suite 687\nPort Fern, MN 23197-1915', 'user', 'active', 'pvafOqAp9e', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(16, 'Arlo Borer', 'marks.ian', 'schneider.clementina@example.org', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00aa66?text=non', '+1-380-492-5214', '1002 Harry Turnpike\nEulahhaven, KY 16821', 'vendor', 'active', 'biohS5ryuW', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(17, 'Kelli Lind', 'nyasia.padberg', 'ted69@example.org', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00ffff?text=eum', '1-360-664-1458', '24785 Syble Crescent\nAlfredamouth, NH 32714-7740', 'user', 'inactive', 'BMugZSPMLq', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(18, 'Shakira Simonis', 'okuneva.louie', 'veum.luciano@example.org', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/004444?text=ea', '+1.786.827.0192', '124 Jacey Street Suite 294\nVedahaven, IA 44099', 'vendor', 'inactive', 'pHsnsVVK4p', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(19, 'Kaci Bode', 'kuhlman.cornelius', 'harrison17@example.com', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00ee11?text=in', '+1 (225) 402-3908', '457 Raegan Branch\nWeimannbury, MA 07875-0947', 'vendor', 'inactive', 'fKYj6UGDD3', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(20, 'Mr. Jesus Rippin', 'obuckridge', 'khoeger@example.com', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/009944?text=asperiores', '+1-760-634-3577', '5443 Zoe Locks Apt. 871\nRogahnchester, OH 10056-1938', 'admin', 'active', 'Z70pxatFn1', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(21, 'Mariano Stanton', 'trantow.giovanna', 'neva83@example.net', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/002277?text=aut', '+1.909.688.7025', '3282 Nikolaus Alley\nColeberg, OR 96425-4096', 'vendor', 'active', 'v7vbQy9keq', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(22, 'Keeley Douglas DDS', 'ioconnell', 'afarrell@example.org', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/0077dd?text=ut', '(231) 835-1106', '898 Cordelia Tunnel Suite 166\nKatelinmouth, CO 92689', 'user', 'active', 'ht6LVApJBY', '2024-11-14 11:22:33', '2024-11-14 11:22:33'),
(23, 'Brandi Block', 'gutmann.denis', 'connelly.lizzie@example.com', '2024-11-14 11:22:33', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00bbee?text=aliquam', '864.750.2923', '7130 Witting Port\nWest Estebanbury, RI 91146', 'admin', 'active', 'fBD8ofAvQq', '2024-11-14 11:22:33', '2024-11-14 11:22:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
