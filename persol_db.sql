-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 28, 2025 lúc 04:18 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `persol_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_code` varchar(50) DEFAULT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_code`, `brand_name`, `brand_logo`, `created_at`, `updated_at`) VALUES
(1, 'RAYBAN', 'Ray-Ban', 'rayban_logo.png', '2025-10-22 18:00:07', '2025-10-22 18:00:07'),
(2, 'OAKLEY', 'Oakley', 'oakley_logo.png', '2025-10-22 18:00:07', '2025-10-22 18:00:07'),
(3, 'PERSOL', 'Persol', 'persol_logo.png', '2025-10-22 17:59:27', '2025-10-22 18:00:07'),
(4, 'OAKLEYRX', 'Oakley Rx', NULL, '2025-10-22 18:11:19', '2025-10-22 18:11:19'),
(5, 'GUCCI', 'Gucci', 'gucci_logo.png', '2025-10-22 17:59:27', '2025-10-22 18:00:07'),
(6, 'PRADA', 'Prada', 'prada_logo.png', '2025-10-22 18:00:07', '2025-10-22 18:00:07'),
(7, 'VERSACE', 'Versace', 'versace_logo.png', '2025-10-22 18:00:07', '2025-10-22 18:00:07'),
(8, 'TOMFORD', 'Tom Ford', 'tomford_logo.png', '2025-10-22 18:00:07', '2025-10-22 18:00:07'),
(9, 'WARBY', 'Warby Parker', 'warby_logo.png', '2025-10-22 18:00:07', '2025-10-22 18:00:07'),
(10, 'MAUIJIM', 'Maui Jim', 'mauijim_logo.png', '2025-10-22 18:00:07', '2025-10-22 18:00:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_code` varchar(50) DEFAULT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_code`, `category_name`, `category_description`, `created_at`, `updated_at`) VALUES
(1, 'SUN', 'Kính râm (Sunglasses)', NULL, '2025-10-22 18:07:20', '2025-10-22 18:07:20'),
(2, 'FRAMES', 'Gọng kính (Frames)', NULL, '2025-10-22 18:07:20', '2025-10-22 18:07:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`customer_id`, `user_id`, `customer_code`, `created_at`, `updated_at`) VALUES
(1, 2, 'CUS_000002', '2025-10-22 18:17:44', '2025-10-22 18:17:44'),
(3, 4, 'CUS_000004', '2025-10-27 11:17:44', '2025-10-27 11:17:44'),
(4, 5, 'CUS_000005', '2025-10-27 21:07:23', '2025-10-27 21:07:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_code` varchar(50) DEFAULT NULL,
  `order_status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `total_amount` decimal(10,2) NOT NULL,
  `shipping_address` text DEFAULT NULL,
  `billing_address` text DEFAULT NULL,
  `shipping_method` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `payment_status` enum('pending','paid','failed') DEFAULT 'pending',
  `recipient_name` varchar(255) DEFAULT NULL,
  `recipient_number` varchar(20) DEFAULT NULL,
  `order_notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `stock_status` enum('in_stock','out_of_stock','on_order') DEFAULT 'in_stock',
  `main_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `brand_id`, `category_id`, `type_id`, `product_name`, `product_description`, `Price`, `stock_quantity`, `stock_status`, `main_image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'Classic Aviator Gold', 'Gold metal frame, classic green G-15 lenses.', 48.00, 559, 'in_stock', '15.jpg', '2025-10-27 12:20:31', '2025-10-27 21:06:52'),
(2, 2, 1, NULL, 'Holbrook Matte Black Prizm', 'Lightweight O Matter™ frame, Prizm™ lenses enhance color.', 42.00, 30, 'in_stock', '9.jpg', '2025-10-27 12:20:31', '2025-10-27 12:26:18'),
(3, 1, 2, NULL, 'Wayfarer Black Frame', 'Legendary black acetate frame.', 35.00, 40, 'in_stock', '3.jpg', '2025-10-27 12:20:31', '2025-10-27 12:26:58'),
(4, 2, 2, NULL, 'Metalink Satin Black', 'Lightweight metal frame, modern design.', 39.00, 25, 'in_stock', '7.jpg', '2025-10-27 12:20:31', '2025-10-27 12:28:10'),
(5, 1, 1, NULL, 'Round Metal Legend Gold', 'Round metal frame, retro style.', 46.00, 60, 'in_stock', '11.jpg', '2025-10-27 12:20:31', '2025-10-27 12:29:03'),
(6, 3, 1, NULL, 'Persol 649 Havana Brown', 'Persol icon with the distinctive Meflecto bridge.', 55.00, 15, 'in_stock', '5.jpg', '2025-10-27 12:20:31', '2025-10-27 12:29:51'),
(7, 4, 2, NULL, 'Oakley Crosslink Pitch Grey', 'Versatile frame, suitable for sports.', 37.00, 35, 'in_stock', '14.jpg', '2025-10-27 12:20:31', '2025-10-27 12:30:54'),
(8, 1, 1, NULL, 'Clubmaster Classic Black', 'Unique semi-rimless design.', 43.00, 45, 'in_stock', '2.jpg', '2025-10-27 12:20:31', '2025-10-27 12:31:44'),
(9, 5, 2, NULL, 'Gucci GG0026O Black', 'Premium plastic frame, prominent Gucci logo.', 68.00, 18, 'in_stock', '10.jpg', '2025-10-27 12:20:31', '2025-10-27 12:32:41'),
(10, 3, 1, NULL, 'Persol PO3019S Black', 'Classic Persol pilot style.', 51.00, 22, 'in_stock', '1.jpg', '2025-10-27 12:20:31', '2025-10-27 12:33:02'),
(11, 1, 1, NULL, 'Erika Classic Havana', 'Lightweight round frame, metal bridge.', 39.00, 50, 'in_stock', '17.jpg', '2025-10-27 12:20:31', '2025-10-27 12:33:38'),
(12, 2, 1, NULL, 'Frogskins Lite Matte Black', 'Bottomless rim design, 80s style.', 36.00, 28, 'in_stock', '4.jpg', '2025-10-27 12:20:31', '2025-10-27 12:34:33'),
(13, 4, 2, 2, 'Oakley Socket 5.5 Satin', 'Ultra-lightweight and durable metal frame.', 41.00, 33, 'in_stock', '8.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(14, 5, 1, NULL, 'Gucci GG0516S Havana', 'Oversized sunglasses, luxurious style.', 72.00, 12, 'in_stock', '12.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(15, 1, 2, NULL, 'RB3447V Round Metal Frame', 'Slim round metal frame.', 34.00, 48, 'in_stock', '6.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(16, 3, 2, 1, 'Persol PO3007V Havana', 'Classic square frame, acetate material.', 49.00, 19, 'in_stock', '16.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(17, 2, 1, 2, 'Sutro Lite Sweep Prizm Road', 'Specialized sports glasses for cycling.', 45.00, 20, 'in_stock', '3.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(18, 1, 1, NULL, 'Justin Classic Black Rubber', 'Modern variation of the Wayfarer.', 37.00, 52, 'in_stock', '10.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(19, 4, 2, 3, 'Oakley Holbrook RX Woodgrain', 'Holbrook eyeglass frame, Rx version.', 36.00, 31, 'in_stock', '1.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(20, 5, 2, NULL, 'Gucci GG1011O Transparent Grey', 'Fashionable transparent plastic frame.', 65.00, 14, 'on_order', '9.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(21, 1, 1, 1, 'RB4171 Erika Velvet Black', 'Unique velvet-coated frame.', 41.00, 44, 'in_stock', '13.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(22, 2, 2, 2, 'Oakley Latch Beta Matte Grey', 'Designed with a clip to latch onto your shirt.', 38.00, 26, 'in_stock', '7.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(23, 3, 1, NULL, 'Persol PO3272S Green Lens', 'Square sunglasses, green lenses.', 53.00, 21, 'in_stock', '4.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(24, 1, 2, NULL, 'RB5154 Clubmaster Optics', 'Clubmaster eyeglass frame.', 33.00, 49, 'in_stock', '11.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(25, 4, 1, 3, 'Oakley Clifden Prizm Snow', 'Specialized glasses for mountaineering, skiing.', 49.00, 17, 'in_stock', '15.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(26, 5, 1, NULL, 'Gucci GG0811S Black Gold', 'Large square sunglasses, gold details.', 75.00, 10, 'in_stock', '2.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(27, 1, 1, NULL, 'Hexagonal Flat Lenses Gold', 'Hexagonal frame, modern flat lenses.', 47.00, 58, 'in_stock', '8.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(28, 2, 1, 1, 'Oakley Turbine Rotor Prizm Deep Water', 'Wrap-around sports glasses, fishing lenses.', 43.00, 23, 'in_stock', '17.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(29, 3, 2, 2, 'Persol PO3160V Black', 'Rectangular frame, simple and elegant.', 47.00, 20, 'in_stock', '5.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(30, 1, 2, NULL, 'RB7140 Round Fleck Havana', 'Round frame combining metal and plastic.', 35.00, 42, 'in_stock', '9.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(31, 4, 2, 3, 'Oakley Tie Bar Satin Black', 'Ultra-lightweight Titanium rimless frame.', 48.00, 24, 'in_stock', '14.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(32, 5, 2, NULL, 'Gucci GG0396O Havana', 'Fashionable cat-eye frame.', 66.00, 16, 'in_stock', '1.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(33, 1, 1, 1, 'Aviator Large Metal II Gold', 'Improved version of the Aviator.', 49.00, 53, 'in_stock', '6.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(34, 2, 1, 2, 'Oakley Gascan Matte Black Iridium', 'Angular, aggressive design.', 37.00, 29, 'in_stock', '12.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(35, 3, 1, NULL, 'Persol PO0714 Folding Havana', 'Unique foldable sunglasses.', 58.00, 13, 'out_of_stock', '3.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(36, 1, 2, NULL, 'RB2180 Round Havana', 'Round acetate frame.', 36.00, 46, 'in_stock', '10.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(37, 4, 1, 3, 'Oakley Portal X Prizm Grey', 'Versatile glasses, suitable for many activities.', 40.00, 34, 'in_stock', '16.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(38, 5, 1, NULL, 'Gucci GG0631S Oversized Square', 'Large square glasses, bold style.', 71.00, 11, 'in_stock', '7.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(39, 1, 1, 1, 'Wayfarer Ease Black', 'Thinner and lighter Wayfarer version.', 38.00, 41, 'in_stock', '11.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(40, 2, 2, 2, 'Oakley Pitchman R Carbon', 'Round frame, carbon fiber temples.', 44.00, 27, 'in_stock', '15.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(41, 3, 2, NULL, 'Persol PO3263V Terra Di Siena', 'Eyeglass frame in characteristic earth tone.', 50.00, 18, 'in_stock', '2.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(42, 1, 1, NULL, 'RB3548N Hexagonal Evolve Photochromic', 'Lenses that change color with light.', 51.00, 38, 'in_stock', '8.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(43, 4, 2, 1, 'Oakley Base Plane R Satin Black', 'Minimalist metal frame.', 39.00, 32, 'in_stock', '17.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(44, 5, 2, NULL, 'Gucci GG0407O Gold Metal', 'Gold-plated metal frame.', 69.00, 15, 'in_stock', '4.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(45, 1, 1, 2, 'New Wayfarer Matte Black', 'New version, smaller frame.', 36.00, 47, 'in_stock', '12.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(46, 2, 1, 3, 'Oakley Jawbreaker Prizm Trail', 'Off-road sports glasses.', 47.00, 21, 'in_stock', '1.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(47, 3, 1, NULL, 'Persol PO3210S Madreterra', 'Sunglasses in special earth brown color.', 54.00, 16, 'in_stock', '9.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(48, 1, 2, NULL, 'RB4165 Justin Rubberized Black', 'Rubber-coated frame, youthful.', 34.00, 51, 'in_stock', '13.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(49, 4, 1, 1, 'Oakley EVZero Blades Prizm Sapphire', 'Ultra-lightweight rimless glasses.', 42.00, 25, 'in_stock', '6.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31'),
(50, 5, 1, 2, 'Gucci GG0726S Aviator Style', 'Gucci style aviator glasses.', 73.00, 9, 'on_order', '10.jpg', '2025-10-27 12:20:31', '2025-10-27 12:20:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_document`
--

CREATE TABLE `product_document` (
  `document_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `original_filename` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `file_content` mediumblob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_document`
--

INSERT INTO `product_document` (`document_id`, `product_id`, `original_filename`, `mime_type`, `file_content`, `created_at`) VALUES
(14, 1, 'manual_prod_1.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f647563742031, '2025-10-27 20:48:54'),
(15, 2, 'manual_prod_2.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f647563742032, '2025-10-27 20:48:54'),
(16, 3, 'warranty_prod_3.pdf', 'application/pdf', 0x44756d6d792057617272616e747920436f6e74656e742050726f647563742033, '2025-10-27 20:48:54'),
(17, 4, 'manual_prod_4.txt', 'text/plain', 0x44756d6d79204d616e75616c20546578742050726f647563742034, '2025-10-27 20:48:54'),
(18, 5, 'manual_prod_5.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f647563742035, '2025-10-27 20:48:54'),
(19, 6, 'manual_prod_6.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f647563742036, '2025-10-27 20:48:54'),
(20, 7, 'warranty_prod_7.pdf', 'application/pdf', 0x44756d6d792057617272616e747920436f6e74656e742050726f647563742037, '2025-10-27 20:48:54'),
(21, 8, 'manual_prod_8.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f647563742038, '2025-10-27 20:48:54'),
(22, 9, 'manual_prod_9.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f647563742039, '2025-10-27 20:48:54'),
(23, 10, 'warranty_prod_10.txt', 'text/plain', 0x44756d6d792057617272616e747920546578742050726f64756374203130, '2025-10-27 20:48:54'),
(24, 11, 'manual_prod_11.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203131, '2025-10-27 20:48:54'),
(25, 12, 'manual_prod_12.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203132, '2025-10-27 20:48:54'),
(26, 13, 'warranty_prod_13.pdf', 'application/pdf', 0x44756d6d792057617272616e747920436f6e74656e742050726f64756374203133, '2025-10-27 20:48:54'),
(27, 14, 'manual_prod_14.txt', 'text/plain', 0x44756d6d79204d616e75616c20546578742050726f64756374203134, '2025-10-27 20:48:54'),
(28, 15, 'manual_prod_15.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203135, '2025-10-27 20:48:54'),
(29, 16, 'manual_prod_16.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203136, '2025-10-27 20:48:54'),
(30, 17, 'warranty_prod_17.pdf', 'application/pdf', 0x44756d6d792057617272616e747920436f6e74656e742050726f64756374203137, '2025-10-27 20:48:54'),
(31, 18, 'manual_prod_18.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203138, '2025-10-27 20:48:54'),
(32, 19, 'manual_prod_19.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203139, '2025-10-27 20:48:54'),
(33, 20, 'warranty_prod_20.txt', 'text/plain', 0x44756d6d792057617272616e747920546578742050726f64756374203230, '2025-10-27 20:48:54'),
(34, 21, 'manual_prod_21.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203231, '2025-10-27 20:48:54'),
(35, 22, 'manual_prod_22.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203232, '2025-10-27 20:48:54'),
(36, 23, 'warranty_prod_23.pdf', 'application/pdf', 0x44756d6d792057617272616e747920436f6e74656e742050726f64756374203233, '2025-10-27 20:48:54'),
(37, 24, 'manual_prod_24.txt', 'text/plain', 0x44756d6d79204d616e75616c20546578742050726f64756374203234, '2025-10-27 20:48:54'),
(38, 25, 'manual_prod_25.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203235, '2025-10-27 20:48:54'),
(39, 26, 'manual_prod_26.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203236, '2025-10-27 20:48:54'),
(40, 27, 'warranty_prod_27.pdf', 'application/pdf', 0x44756d6d792057617272616e747920436f6e74656e742050726f64756374203237, '2025-10-27 20:48:54'),
(41, 28, 'manual_prod_28.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203238, '2025-10-27 20:48:54'),
(42, 29, 'manual_prod_29.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203239, '2025-10-27 20:48:54'),
(43, 30, 'warranty_prod_30.txt', 'text/plain', 0x44756d6d792057617272616e747920546578742050726f64756374203330, '2025-10-27 20:48:54'),
(44, 31, 'manual_prod_31.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203331, '2025-10-27 20:48:54'),
(45, 32, 'manual_prod_32.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203332, '2025-10-27 20:48:54'),
(46, 33, 'warranty_prod_33.pdf', 'application/pdf', 0x44756d6d792057617272616e747920436f6e74656e742050726f64756374203333, '2025-10-27 20:48:54'),
(47, 34, 'manual_prod_34.txt', 'text/plain', 0x44756d6d79204d616e75616c20546578742050726f64756374203334, '2025-10-27 20:48:54'),
(48, 35, 'manual_prod_35.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203335, '2025-10-27 20:48:54'),
(49, 36, 'manual_prod_36.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203336, '2025-10-27 20:48:54'),
(50, 37, 'warranty_prod_37.pdf', 'application/pdf', 0x44756d6d792057617272616e747920436f6e74656e742050726f64756374203337, '2025-10-27 20:48:54'),
(51, 38, 'manual_prod_38.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203338, '2025-10-27 20:48:54'),
(52, 39, 'manual_prod_39.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203339, '2025-10-27 20:48:54'),
(53, 40, 'warranty_prod_40.txt', 'text/plain', 0x44756d6d792057617272616e747920546578742050726f64756374203430, '2025-10-27 20:48:54'),
(54, 41, 'manual_prod_41.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203431, '2025-10-27 20:48:54'),
(55, 42, 'manual_prod_42.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203432, '2025-10-27 20:48:54'),
(56, 43, 'warranty_prod_43.pdf', 'application/pdf', 0x44756d6d792057617272616e747920436f6e74656e742050726f64756374203433, '2025-10-27 20:48:54'),
(57, 44, 'manual_prod_44.txt', 'text/plain', 0x44756d6d79204d616e75616c20546578742050726f64756374203434, '2025-10-27 20:48:54'),
(58, 45, 'manual_prod_45.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203435, '2025-10-27 20:48:54'),
(59, 46, 'manual_prod_46.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203436, '2025-10-27 20:48:54'),
(60, 47, 'warranty_prod_47.pdf', 'application/pdf', 0x44756d6d792057617272616e747920436f6e74656e742050726f64756374203437, '2025-10-27 20:48:54'),
(61, 48, 'manual_prod_48.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203438, '2025-10-27 20:48:54'),
(62, 49, 'manual_prod_49.pdf', 'application/pdf', 0x44756d6d79204d616e75616c20436f6e74656e742050726f64756374203439, '2025-10-27 20:48:54'),
(63, 50, 'warranty_prod_50.txt', 'text/plain', 0x44756d6d792057617272616e747920546578742050726f64756374203530, '2025-10-27 20:48:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_specifications`
--

CREATE TABLE `product_specifications` (
  `spec_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `spec_name` varchar(255) NOT NULL,
  `spec_value` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_specifications`
--

INSERT INTO `product_specifications` (`spec_id`, `product_id`, `spec_name`, `spec_value`, `created_at`) VALUES
(37, 1, 'Frame Material', 'Metal', '2025-10-27 20:43:31'),
(38, 1, 'Lens Material', 'Crystal', '2025-10-27 20:43:31'),
(39, 1, 'Lens Color', 'Green G-15', '2025-10-27 20:43:31'),
(40, 1, 'Size', '58mm', '2025-10-27 20:43:31'),
(41, 1, 'UV Protection', '100%', '2025-10-27 20:43:31'),
(42, 2, 'Frame Material', 'O Matter™', '2025-10-27 20:43:31'),
(43, 2, 'Lens Material', 'Plutonite®', '2025-10-27 20:43:31'),
(44, 2, 'Lens Technology', 'Prizm™', '2025-10-27 20:43:31'),
(45, 2, 'Frame Color', 'Matte Black', '2025-10-27 20:43:31'),
(46, 2, 'UV Protection', '100%', '2025-10-27 20:43:31'),
(47, 3, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(48, 3, 'Frame Color', 'Black', '2025-10-27 20:43:31'),
(49, 3, 'Lens Width', '50mm', '2025-10-27 20:43:31'),
(50, 3, 'Bridge Width', '22mm', '2025-10-27 20:43:31'),
(51, 4, 'Frame Material', 'Metal', '2025-10-27 20:43:31'),
(52, 4, 'Frame Color', 'Satin Black', '2025-10-27 20:43:31'),
(53, 4, 'Frame Shape', 'Rectangle', '2025-10-27 20:43:31'),
(54, 4, 'Bridge Type', 'Adjustable Nosepads', '2025-10-27 20:43:31'),
(55, 5, 'Frame Material', 'Metal', '2025-10-27 20:43:31'),
(56, 5, 'Lens Material', 'Crystal', '2025-10-27 20:43:31'),
(57, 5, 'Frame Color', 'Gold', '2025-10-27 20:43:31'),
(58, 5, 'Frame Shape', 'Round', '2025-10-27 20:43:31'),
(59, 5, 'Size', '50mm', '2025-10-27 20:43:31'),
(60, 6, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(61, 6, 'Frame Color', 'Havana', '2025-10-27 20:43:31'),
(62, 6, 'Lens Material', 'Crystal', '2025-10-27 20:43:31'),
(63, 6, 'Bridge Feature', 'Keyhole Bridge + Meflecto', '2025-10-27 20:43:31'),
(64, 6, 'Temple Feature', 'Arrow Hinge', '2025-10-27 20:43:31'),
(65, 7, 'Frame Material', 'O Matter™', '2025-10-27 20:43:31'),
(66, 7, 'Frame Color', 'Grey Smoke', '2025-10-27 20:43:31'),
(67, 7, 'Temple Feature', 'Interchangeable Temples', '2025-10-27 20:43:31'),
(68, 7, 'Grip', 'Unobtainium®', '2025-10-27 20:43:31'),
(69, 8, 'Frame Material', 'Acetate & Metal', '2025-10-27 20:43:31'),
(70, 8, 'Frame Color', 'Black/Gold', '2025-10-27 20:43:31'),
(71, 8, 'Lens Color', 'Green G-15', '2025-10-27 20:43:31'),
(72, 8, 'Style', 'Browline', '2025-10-27 20:43:31'),
(73, 9, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(74, 9, 'Frame Color', 'Black', '2025-10-27 20:43:31'),
(75, 9, 'Style', 'Oversized Square', '2025-10-27 20:43:31'),
(76, 9, 'Hinge', 'Standard', '2025-10-27 20:43:31'),
(77, 10, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(78, 10, 'Frame Color', 'Black', '2025-10-27 20:43:31'),
(79, 10, 'Lens Type', 'Polarized', '2025-10-27 20:43:31'),
(80, 10, 'Temple Feature', 'Arrow Hinge', '2025-10-27 20:43:31'),
(81, 11, 'Frame Material', 'Nylon/Metal', '2025-10-27 20:43:31'),
(82, 11, 'Frame Color', 'Havana', '2025-10-27 20:43:31'),
(83, 11, 'Lens Color', 'Brown Gradient', '2025-10-27 20:43:31'),
(84, 11, 'Frame Shape', 'Round', '2025-10-27 20:43:31'),
(85, 12, 'Frame Material', 'O Matter™', '2025-10-27 20:43:31'),
(86, 12, 'Frame Color', 'Matte Black', '2025-10-27 20:43:31'),
(87, 12, 'Style', 'Semi-Rimless', '2025-10-27 20:43:31'),
(88, 12, 'Lens Technology', 'Standard', '2025-10-27 20:43:31'),
(89, 13, 'Frame Material', 'C-5™ Alloy', '2025-10-27 20:43:31'),
(90, 13, 'Frame Color', 'Satin Black', '2025-10-27 20:43:31'),
(91, 13, 'Temple Feature', 'Unobtainium® Earsocks', '2025-10-27 20:43:31'),
(92, 13, 'Frame Shape', 'Rectangle', '2025-10-27 20:43:31'),
(93, 14, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(94, 14, 'Frame Color', 'Havana', '2025-10-27 20:43:31'),
(95, 14, 'Lens Color', 'Brown', '2025-10-27 20:43:31'),
(96, 14, 'Style', 'Oversized Square', '2025-10-27 20:43:31'),
(97, 14, 'UV Protection', '100%', '2025-10-27 20:43:31'),
(98, 15, 'Frame Material', 'Metal', '2025-10-27 20:43:31'),
(99, 15, 'Frame Color', 'Gold', '2025-10-27 20:43:31'),
(100, 15, 'Frame Shape', 'Round', '2025-10-27 20:43:31'),
(101, 15, 'Bridge Type', 'Adjustable Nosepads', '2025-10-27 20:43:31'),
(102, 16, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(103, 16, 'Frame Color', 'Havana', '2025-10-27 20:43:31'),
(104, 16, 'Frame Shape', 'Square', '2025-10-27 20:43:31'),
(105, 16, 'Temple Feature', 'Arrow Hinge', '2025-10-27 20:43:31'),
(106, 17, 'Frame Material', 'O Matter™', '2025-10-27 20:43:31'),
(107, 17, 'Lens Technology', 'Prizm™ Road', '2025-10-27 20:43:31'),
(108, 17, 'Fit', 'Standard', '2025-10-27 20:43:31'),
(109, 17, 'Sport', 'Cycling', '2025-10-27 20:43:31'),
(110, 18, 'Frame Material', 'Nylon', '2025-10-27 20:43:31'),
(111, 18, 'Frame Color', 'Rubber Black', '2025-10-27 20:43:31'),
(112, 18, 'Lens Color', 'Grey Gradient', '2025-10-27 20:43:31'),
(113, 18, 'Frame Shape', 'Rectangle', '2025-10-27 20:43:31'),
(114, 19, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(115, 19, 'Frame Color', 'Woodgrain', '2025-10-27 20:43:31'),
(116, 19, 'Frame Shape', 'Square', '2025-10-27 20:43:31'),
(117, 19, 'Style', 'Lifestyle', '2025-10-27 20:43:31'),
(118, 20, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(119, 20, 'Frame Color', 'Transparent Grey', '2025-10-27 20:43:31'),
(120, 20, 'Frame Shape', 'Rectangle', '2025-10-27 20:43:31'),
(121, 20, 'Style', 'Fashion', '2025-10-27 20:43:31'),
(122, 21, 'Frame Material', 'Nylon Velvet', '2025-10-27 20:43:31'),
(123, 21, 'Frame Color', 'Black Velvet', '2025-10-27 20:43:31'),
(124, 21, 'Lens Color', 'Grey Gradient', '2025-10-27 20:43:31'),
(125, 21, 'Frame Shape', 'Round', '2025-10-27 20:43:31'),
(126, 22, 'Frame Material', 'O Matter™', '2025-10-27 20:43:31'),
(127, 22, 'Frame Color', 'Matte Grey Ink', '2025-10-27 20:43:31'),
(128, 22, 'Feature', 'Latch Mechanism', '2025-10-27 20:43:31'),
(129, 22, 'Frame Shape', 'Round', '2025-10-27 20:43:31'),
(130, 23, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(131, 23, 'Frame Color', 'Black', '2025-10-27 20:43:31'),
(132, 23, 'Lens Color', 'Green', '2025-10-27 20:43:31'),
(133, 23, 'Frame Shape', 'Square', '2025-10-27 20:43:31'),
(134, 24, 'Frame Material', 'Acetate & Metal', '2025-10-27 20:43:31'),
(135, 24, 'Frame Color', 'Black/Gold', '2025-10-27 20:43:31'),
(136, 24, 'Style', 'Browline', '2025-10-27 20:43:31'),
(137, 24, 'Bridge Type', 'Standard', '2025-10-27 20:43:31'),
(138, 25, 'Frame Material', 'O Matter™', '2025-10-27 20:43:31'),
(139, 25, 'Lens Technology', 'Prizm™ Snow', '2025-10-27 20:43:31'),
(140, 25, 'Features', 'Side Shields, Bridge Blocker, Leash', '2025-10-27 20:43:31'),
(141, 25, 'Sport', 'Mountaineering', '2025-10-27 20:43:31'),
(142, 26, 'Frame Material', 'Metal & Acetate', '2025-10-27 20:43:31'),
(143, 26, 'Frame Color', 'Black/Gold', '2025-10-27 20:43:31'),
(144, 26, 'Lens Color', 'Grey', '2025-10-27 20:43:31'),
(145, 26, 'Style', 'Square', '2025-10-27 20:43:31'),
(146, 27, 'Frame Material', 'Metal', '2025-10-27 20:43:31'),
(147, 27, 'Frame Color', 'Gold', '2025-10-27 20:43:31'),
(148, 27, 'Lens Feature', 'Flat Lenses', '2025-10-27 20:43:31'),
(149, 27, 'Frame Shape', 'Hexagonal', '2025-10-27 20:43:31'),
(150, 28, 'Frame Material', 'O Matter™', '2025-10-27 20:43:31'),
(151, 28, 'Lens Technology', 'Prizm™ Deep Water Polarized', '2025-10-27 20:43:31'),
(152, 28, 'Style', 'Wrap', '2025-10-27 20:43:31'),
(153, 28, 'Sport', 'Water Sports', '2025-10-27 20:43:31'),
(154, 29, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(155, 29, 'Frame Color', 'Black', '2025-10-27 20:43:31'),
(156, 29, 'Frame Shape', 'Rectangle', '2025-10-27 20:43:31'),
(157, 29, 'Temple Feature', 'Arrow Hinge', '2025-10-27 20:43:31'),
(158, 30, 'Frame Material', 'Acetate & Metal', '2025-10-27 20:43:31'),
(159, 30, 'Frame Color', 'Havana Fleck/Gold', '2025-10-27 20:43:31'),
(160, 30, 'Frame Shape', 'Round', '2025-10-27 20:43:31'),
(161, 31, 'Frame Material', 'Titanium', '2025-10-27 20:43:31'),
(162, 31, 'Frame Color', 'Satin Black', '2025-10-27 20:43:31'),
(163, 31, 'Style', 'Rimless', '2025-10-27 20:43:31'),
(164, 31, 'Feature', 'Lightweight', '2025-10-27 20:43:31'),
(165, 32, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(166, 32, 'Frame Color', 'Havana', '2025-10-27 20:43:31'),
(167, 32, 'Frame Shape', 'Cat-Eye', '2025-10-27 20:43:31'),
(168, 32, 'Style', 'Fashion', '2025-10-27 20:43:31'),
(169, 33, 'Frame Material', 'Metal', '2025-10-27 20:43:31'),
(170, 33, 'Frame Color', 'Gold', '2025-10-27 20:43:31'),
(171, 33, 'Lens Material', 'Crystal', '2025-10-27 20:43:31'),
(172, 33, 'Size', '62mm', '2025-10-27 20:43:31'),
(173, 34, 'Frame Material', 'O Matter™', '2025-10-27 20:43:31'),
(174, 34, 'Frame Color', 'Matte Black', '2025-10-27 20:43:31'),
(175, 34, 'Lens Coating', 'Iridium', '2025-10-27 20:43:31'),
(176, 34, 'Style', 'Wrap', '2025-10-27 20:43:31'),
(177, 35, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(178, 35, 'Frame Color', 'Havana', '2025-10-27 20:43:31'),
(179, 35, 'Feature', 'Foldable', '2025-10-27 20:43:31'),
(180, 35, 'Lens Type', 'Crystal', '2025-10-27 20:43:31'),
(181, 36, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(182, 36, 'Frame Color', 'Havana', '2025-10-27 20:43:31'),
(183, 36, 'Frame Shape', 'Round', '2025-10-27 20:43:31'),
(184, 36, 'Bridge Type', 'Keyhole', '2025-10-27 20:43:31'),
(185, 37, 'Frame Material', 'O Matter™', '2025-10-27 20:43:31'),
(186, 37, 'Lens Technology', 'Prizm™ Grey', '2025-10-27 20:43:31'),
(187, 37, 'Style', 'Lifestyle/Sport', '2025-10-27 20:43:31'),
(188, 37, 'Fit', 'Standard', '2025-10-27 20:43:31'),
(189, 38, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(190, 38, 'Frame Color', 'Black', '2025-10-27 20:43:31'),
(191, 38, 'Lens Color', 'Grey', '2025-10-27 20:43:31'),
(192, 38, 'Style', 'Oversized Square', '2025-10-27 20:43:31'),
(193, 39, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(194, 39, 'Frame Color', 'Black', '2025-10-27 20:43:31'),
(195, 39, 'Feature', 'Thinner Frame', '2025-10-27 20:43:31'),
(196, 39, 'Style', 'Wayfarer', '2025-10-27 20:43:31'),
(197, 40, 'Frame Material', 'O Matter™ & Carbon Fiber', '2025-10-27 20:43:31'),
(198, 40, 'Frame Color', 'Satin Black', '2025-10-27 20:43:31'),
(199, 40, 'Frame Shape', 'Round', '2025-10-27 20:43:31'),
(200, 41, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(201, 41, 'Frame Color', 'Terra Di Siena', '2025-10-27 20:43:31'),
(202, 41, 'Frame Shape', 'Rectangle', '2025-10-27 20:43:31'),
(203, 42, 'Frame Material', 'Metal', '2025-10-27 20:43:31'),
(204, 42, 'Frame Color', 'Gold', '2025-10-27 20:43:31'),
(205, 42, 'Lens Feature', 'Photochromic Evolve', '2025-10-27 20:43:31'),
(206, 42, 'Frame Shape', 'Hexagonal', '2025-10-27 20:43:31'),
(207, 43, 'Frame Material', 'Metal', '2025-10-27 20:43:31'),
(208, 43, 'Frame Color', 'Satin Black', '2025-10-27 20:43:31'),
(209, 43, 'Style', 'Minimalist Rectangle', '2025-10-27 20:43:31'),
(210, 44, 'Frame Material', 'Metal', '2025-10-27 20:43:31'),
(211, 44, 'Frame Color', 'Gold', '2025-10-27 20:43:31'),
(212, 44, 'Frame Shape', 'Square', '2025-10-27 20:43:31'),
(213, 44, 'Style', 'Classic', '2025-10-27 20:43:31'),
(214, 45, 'Frame Material', 'Nylon', '2025-10-27 20:43:31'),
(215, 45, 'Frame Color', 'Matte Black', '2025-10-27 20:43:31'),
(216, 45, 'Lens Color', 'Green G-15', '2025-10-27 20:43:31'),
(217, 45, 'Feature', 'Smaller Frame', '2025-10-27 20:43:31'),
(218, 46, 'Frame Material', 'O Matter™', '2025-10-27 20:43:31'),
(219, 46, 'Lens Technology', 'Prizm™ Trail Torch', '2025-10-27 20:43:31'),
(220, 46, 'Feature', 'Switchlock™ Technology', '2025-10-27 20:43:31'),
(221, 46, 'Sport', 'Cycling/Trail', '2025-10-27 20:43:31'),
(222, 47, 'Frame Material', 'Acetate', '2025-10-27 20:43:31'),
(223, 47, 'Frame Color', 'Madreterra', '2025-10-27 20:43:31'),
(224, 47, 'Lens Type', 'Crystal', '2025-10-27 20:43:31'),
(225, 47, 'Frame Shape', 'Square', '2025-10-27 20:43:31'),
(226, 48, 'Frame Material', 'Nylon', '2025-10-27 20:43:31'),
(227, 48, 'Frame Color', 'Rubber Black', '2025-10-27 20:43:31'),
(228, 48, 'Lens Color', 'Grey Gradient', '2025-10-27 20:43:31'),
(229, 48, 'Frame Shape', 'Rectangle', '2025-10-27 20:43:31'),
(230, 49, 'Frame Material', 'O Matter™', '2025-10-27 20:43:31'),
(231, 49, 'Lens Technology', 'Prizm™ Sapphire', '2025-10-27 20:43:31'),
(232, 49, 'Style', 'Rimless Shield', '2025-10-27 20:43:31'),
(233, 49, 'Feature', 'Ultra-Lightweight', '2025-10-27 20:43:31'),
(234, 50, 'Frame Material', 'Metal', '2025-10-27 20:43:31'),
(235, 50, 'Frame Color', 'Gold', '2025-10-27 20:43:31'),
(236, 50, 'Lens Color', 'Brown', '2025-10-27 20:43:31'),
(237, 50, 'Style', 'Aviator', '2025-10-27 20:43:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_types`
--

CREATE TABLE `product_types` (
  `type_id` int(11) NOT NULL,
  `parent_type_id` int(11) DEFAULT NULL,
  `type_code` varchar(50) DEFAULT NULL,
  `type_name` varchar(255) NOT NULL,
  `type_description` text DEFAULT NULL,
  `display_order` int(11) DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_types`
--

INSERT INTO `product_types` (`type_id`, `parent_type_id`, `type_code`, `type_name`, `type_description`, `display_order`, `image_url`, `created_at`, `updated_at`) VALUES
(1, NULL, 'CLASSIC', 'Classic Style', NULL, 1, NULL, '2025-10-22 18:08:38', '2025-10-22 18:08:38'),
(2, NULL, 'SPORT', 'Sport Performance', NULL, 2, NULL, '2025-10-22 18:08:38', '2025-10-22 18:08:38'),
(3, NULL, 'LUXURY', 'Luxury Fashion', NULL, 3, NULL, '2025-10-22 18:08:38', '2025-10-22 18:08:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `site_stats`
--

CREATE TABLE `site_stats` (
  `stat_key` varchar(50) NOT NULL,
  `stat_value` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `site_stats`
--

INSERT INTO `site_stats` (`stat_key`, `stat_value`) VALUES
('visitor_count', 126);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_code` varchar(50) DEFAULT NULL,
  `user_type` enum('admin','customer') NOT NULL DEFAULT 'customer',
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_code`, `user_type`, `email`, `password_hash`, `full_name`, `phone_number`, `date_of_birth`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'admin', 'admin@persol.com', '$2y$10$P8eDYoE3FCmvLoPW7Gh4R.46Q8JhttZ.tBV2/7g0lZ3GBSwpMu87O', 'Admin Persol', NULL, NULL, '2025-10-22 18:22:53', '2025-10-22 18:27:03', NULL),
(2, NULL, 'customer', 'anhtuan@gmail.com', '$2y$10$Z1nvB4U0oFmDBZZ.k.MWpuKnvm1ClLMuJTAgBWKRiM7BgxuQ/IGL6', '2134', NULL, NULL, '2025-10-22 18:17:44', '2025-10-22 18:23:41', NULL),
(4, NULL, 'admin', 'anhtua111n@gmail.com', '$2y$10$Z.N0vHr9qn/y4dRIVdzjse9RRKAFllKoS5hEXKCvUq3OpGRiYATpO', '2134', NULL, NULL, '2025-10-27 11:17:44', '2025-10-27 11:19:06', NULL),
(5, NULL, 'admin', 'admin111@persol.com', '$2y$10$.SsiWAr6OMq2S6jw/m7blOD4WAD7SNzKiD2uK1i0GWFUjzzDpu/fO', 'Admin Persol 111', NULL, NULL, '2025-10-27 21:07:23', '2025-10-28 13:51:17', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_code` (`brand_code`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_code` (`category_code`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `customer_code` (`customer_code`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_code` (`order_code`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Chỉ mục cho bảng `product_document`
--
ALTER TABLE `product_document`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`spec_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `type_code` (`type_code`),
  ADD KEY `parent_type_id` (`parent_type_id`);

--
-- Chỉ mục cho bảng `site_stats`
--
ALTER TABLE `site_stats`
  ADD PRIMARY KEY (`stat_key`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_code` (`user_code`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `product_document`
--
ALTER TABLE `product_document`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `spec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT cho bảng `product_types`
--
ALTER TABLE `product_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `product_types` (`type_id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_document`
--
ALTER TABLE `product_document`
  ADD CONSTRAINT `product_document_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD CONSTRAINT `product_specifications_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_types`
--
ALTER TABLE `product_types`
  ADD CONSTRAINT `product_types_ibfk_1` FOREIGN KEY (`parent_type_id`) REFERENCES `product_types` (`type_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
