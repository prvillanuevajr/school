-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2020 at 11:33 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `professor_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`id`, `professor_id`, `name`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 5, 'Mathematics', '7:00', '9:00', '2020-08-16 07:29:41', NULL),
(2, 5, 'Science', '9:00', '11:00', '2020-08-16 07:29:41', NULL),
(3, 5, 'English', '9:00', '10:30', '2020-08-16 07:30:52', NULL),
(4, 5, 'Agriculture', '11:00', '13:00', '2020-08-16 07:30:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lecture_user`
--

CREATE TABLE `lecture_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lecture_user`
--

INSERT INTO `lecture_user` (`id`, `student_id`, `lecture_id`, `created_at`, `updated_at`) VALUES
(20, 11, 3, NULL, NULL),
(22, 11, 2, NULL, NULL),
(23, 27, 2, NULL, NULL),
(24, 27, 4, NULL, NULL),
(25, 27, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2020_08_16_020857_create_lectures_table', 1),
(11, '2020_08_16_022049_create_lecture_user_table', 1),
(12, '2020_08_16_023428_create_roles_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'student', '2020-08-16 02:47:56', NULL),
(2, 'teacher', '2020-08-16 02:47:56', NULL),
(3, 'registrar', '2020-08-16 02:48:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 3,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 3, 'Presmelito', 'Villanueva', 'prvillanuevajr@gmail.com', NULL, '$2y$10$oXO5G0Eum1He3.sC0Rc4huFOwLYTJIe2ZHSwh3kbQtvJJa4CnJlw.', NULL, '2020-08-15 18:50:54', '2020-08-15 18:50:54'),
(2, 3, 'Julianne', 'Schmeler', 'erika.boyle@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RWf7nSU5VG', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(4, 3, 'Eryn', 'Rolfson', 'rogers.kohler@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '23NCj9tuAJ', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(5, 2, 'Reed', 'Schmidt', 'mhahn@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mTdyxbOewt', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(6, 2, 'Allene', 'Rutherford', 'streich.mikel@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'e3s2dAeAji', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(7, 3, 'Sonia', 'Gerlach', 'sierra09@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7uXjq1vS7L', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(9, 3, 'Zelda', 'Lebsack', 'kirstin12@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Oo3E2SAhEj', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(10, 2, 'Maci', 'Schmidt', 'zakary81@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vuilQlefL8', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(11, 1, 'Ganare', 'Kabuyawka', 'hiller.alexa@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jjaWUzV7u7', '2020-08-15 19:13:49', '2020-08-15 23:24:30'),
(12, 2, 'Jacquelyn', 'Dibbert', 'mario.collier@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zbk2t3o2Fb', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(13, 3, 'Katelin', 'Waters', 'hane.berenice@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mWj6zosMQA', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(14, 2, 'Mabelle', 'Wintheiser', 'nsimonis@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4uWq0rRLmv', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(15, 2, 'Josh', 'Fay', 'langworth.lawson@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tpzyKU6kws', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(16, 2, 'Chasity', 'Kohler', 'runolfsson.malcolm@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vjSnwlCELI', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(17, 3, 'Hailee', 'Lynch', 'ebailey@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '91LGrwHyTd', '2020-08-15 19:13:49', '2020-08-15 19:13:49'),
(20, 1, 'Shane', 'Kozey', 'gwilliamson@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8JGRb2xQA1', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(21, 2, 'Arden', 'Schmeler', 'fbartell@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YA0FFYbDjk', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(22, 2, 'Americo', 'Collins', 'hayes.rae@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XAffd7C0sH', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(23, 3, 'Dewitt', 'Ward', 'immanuel24@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HVcwajsr4l', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(24, 3, 'Jeffry', 'Carter', 'zemlak.soledad@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6Qca3W0NHz', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(25, 1, 'Darien', 'Walsh', 'earnestine43@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'iEYSpGUrwf', '2020-08-15 19:13:50', '2020-08-15 23:04:35'),
(26, 2, 'Casimer', 'Vandervort', 'tlarkin@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZuHH5zVSve', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(27, 1, 'Fidel', 'Jacobs', 'ewell.green@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'VZ14nIBZhn', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(28, 1, 'Kenyatta', 'Koch', 'ntorp@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'r1mt06zq3r', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(29, 1, 'Marianna', 'Barrows', 'bartoletti.roger@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'W2x8VflImK', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(30, 3, 'Merle', 'Davis', 'fkeeling@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nNKgq2oMBD', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(31, 2, 'Breanna', 'Brown', 'chaya.kohler@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IW44jlNNjo', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(32, 3, 'Dallas', 'Trantow', 'runte.geo@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nCS1FqUcBt', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(33, 1, 'Hobart', 'Hackett', 'marisol.okon@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3QfK414csy', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(35, 3, 'Theresia', 'Stamm', 'srodriguez@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PlhyfqyNH6', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(36, 3, 'Casimer', 'Reinger', 'treutel.constantin@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Tbb3Z28gqG', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(37, 1, 'Karolann', 'Gorczany', 'jamel15@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'AAMn4SxTtX', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(38, 2, 'Zackery', 'Friesen', 'summer.roob@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DK18a7jdbC', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(39, 2, 'Lola', 'Rau', 'adaniel@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'G4u8aHPolz', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(40, 1, 'Deanna', 'Grimes', 'weimann.randi@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'grIwALOT26', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(41, 2, 'Leila', 'Hill', 'jast.jerod@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sU7CQiLPvv', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(42, 3, 'Evalyn', 'Tromp', 'ocorkery@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DI7e0HypJJ', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(43, 1, 'Jennie', 'Quitzon', 'evangeline81@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZII5VKQBrn', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(44, 1, 'Ashleigh', 'Zboncak', 'tomas.jacobs@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '339e75bYDo', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(45, 2, 'Cristian', 'Mohr', 'fprohaska@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0azuESzYko', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(46, 2, 'Carmel', 'Metz', 'uoconner@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5RboFuXjK2', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(47, 3, 'Nicolette', 'Cole', 'flarkin@example.org', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yFgWU4N2z1', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(48, 1, 'Dorris', 'Jakubowski', 'xjast@example.com', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'S2WQrC2OoC', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(49, 2, 'Jamel', 'Kuhic', 'beaulah.johnston@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XyYpmR2g0t', '2020-08-15 19:13:50', '2020-08-15 19:13:50'),
(51, 2, 'Benedict', 'Koelpin', 'alessia35@example.net', '2020-08-15 19:13:49', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0nculfR2PK', '2020-08-15 19:13:50', '2020-08-15 19:13:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lectures_professor_id_foreign` (`professor_id`);

--
-- Indexes for table `lecture_user`
--
ALTER TABLE `lecture_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lecture_user_student_id_foreign` (`student_id`),
  ADD KEY `lecture_user_lecture_id_foreign` (`lecture_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lecture_user`
--
ALTER TABLE `lecture_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lectures`
--
ALTER TABLE `lectures`
  ADD CONSTRAINT `lectures_professor_id_foreign` FOREIGN KEY (`professor_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lecture_user`
--
ALTER TABLE `lecture_user`
  ADD CONSTRAINT `lecture_user_lecture_id_foreign` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`id`),
  ADD CONSTRAINT `lecture_user_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
