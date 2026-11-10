-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2026 at 01:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sushi_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama_kategori`, `slug`) VALUES
(1, 'Appetizer', 'appetizer'),
(2, 'Sashimi', 'sashimi'),
(3, 'Gunkan', 'gunkan'),
(4, 'Makimono', 'makimono'),
(5, 'Nigiri', 'nigiri'),
(6, 'Rice & Noodle', 'rice-noodle'),
(7, 'Fried', 'fried'),
(8, 'Grill', 'grill'),
(9, 'Drink & Dessert', 'drink-dessert');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `gambar` varchar(255) DEFAULT 'default-sushi.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `category_id`, `nama_menu`, `deskripsi`, `harga`, `gambar`, `created_at`) VALUES
(1, 1, 'Edamame ', 'kacang kedelai rebus', 35.00, 'edamame.jpg', '2026-08-27 11:37:10'),
(3, 2, 'Aburi Salmon Sashimi', 'A fresh delicious half broiled salmon sashimi', 55.00, 'sashimi.jpg', '2026-09-01 10:27:05'),
(4, 3, 'Spicy Lobster Salad', 'Spicy fresh lobster salad wrapped in nori', 37.00, 'gunkan.jpg', '2026-09-01 10:35:56'),
(5, 4, 'Karaage Roll', 'Chicken karaage with fish floss and spicy sauce', 50.00, 'makimono.jpg', '2026-09-01 10:38:02'),
(6, 5, 'Tamago Mentai', 'Half broiled omelete nigiri sushi with cod roe', 35.00, 'nigiri.jpg', '2026-09-01 10:39:59'),
(7, 6, 'Curry Udon', 'Excellent soup noodle with beef curry', 79.00, 'rice & noodle.jpg', '2026-09-01 10:44:36'),
(8, 7, 'Tempura Moriawase', 'Fried tempura with fried seaweed and delicious sauce', 71.00, 'fried.jpg', '2026-09-01 10:48:08'),
(9, 8, 'Shitake Gyubara', 'Rolled beef & shitake mushroom grilled with sweet shoyu & cod roe mayo skewer', 42.00, 'grill.jpg', '2026-09-01 10:52:05'),
(10, 9, 'Matcha Ice Cream', 'Amazing matcha ice cream freshly made with grinded green tea leaves', 34.00, 'drink & dessert.jpg', '2026-09-01 10:55:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
