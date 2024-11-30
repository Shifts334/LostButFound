-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2024 at 01:43 PM
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
-- Database: `lostfound`
--

-- --------------------------------------------------------

--
-- Table structure for table `claim_requests`
--

CREATE TABLE `claim_requests` (
  `claim_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `status` enum('pending','approved','removed') DEFAULT 'pending',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `found_item`
--

CREATE TABLE `found_item` (
  `item_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `date_found` date NOT NULL,
  `time_found` time NOT NULL,
  `location_found` varchar(255) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `status` enum('Unclaimed','Claimed','Resolved') DEFAULT 'Unclaimed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `item_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `found_item`
--

INSERT INTO `found_item` (`item_id`, `user_id`, `title`, `description`, `date_found`, `time_found`, `location_found`, `category`, `status`, `created_at`, `updated_at`, `item_img`) VALUES
(1, NULL, 'Blue Tumbler', 'A blue tumbler with a sticker on it', '2024-07-08', '12:05:00', 'Bunzel Canteen', 'Tumbler', 'Unclaimed', '2024-11-08 12:31:04', '2024-11-09 12:57:58', 'src/assets/user_uploads/Blue_Tumbler.png'),
(2, NULL, 'Apple AirPods', 'White AirPods in a case', '2024-06-18', '13:05:00', 'Library', 'Electronics', 'Claimed', '2024-11-08 12:31:04', '2024-11-09 12:57:58', 'src/assets/user_uploads/Apple_AirPods.png'),
(3, NULL, 'Black Wallet', 'A leather wallet with some cards', '2024-07-09', '14:10:00', 'Bus Stop', 'Wallet', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Black_Wallet.png'),
(4, NULL, 'Red Notebook', 'Spiral notebook with notes', '2024-07-11', '09:15:00', 'Classroom B1', 'Stationery', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Red_Notebook.png'),
(5, NULL, 'Water Bottle', 'Transparent plastic bottle', '2024-07-12', '11:00:00', 'Gym', 'Bottle', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/waterbottle.jpg'),
(6, NULL, 'Laptop Charger', 'Dell laptop charger', '2024-07-13', '15:30:00', 'Computer Lab', 'Electronics', 'Claimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/laptopcharger.jpg'),
(7, NULL, 'Sunglasses', 'Black Ray-Ban sunglasses', '2024-07-15', '13:20:00', 'Cafeteria', 'Accessories', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Sunglasses.png'),
(8, NULL, 'Umbrella', 'Red umbrella with logo', '2024-07-17', '08:45:00', 'Library Entrance', 'Accessories', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Umbrella.png'),
(9, NULL, 'Calculator', 'Casio scientific calculator', '2024-07-18', '10:30:00', 'Exam Hall', 'Electronics', 'Resolved', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Calculator.png'),
(10, NULL, 'Set of Keys', 'Three keys on a metal keychain', '2024-07-20', '16:10:00', 'Locker Room', 'Keys', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Set_of_Keys.png'),
(11, NULL, 'Earphones', 'Wired earphones', '2024-07-21', '17:50:00', 'Library', 'Electronics', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Earphones.png'),
(12, NULL, 'Textbook', 'Math textbook - Calculus 101', '2024-07-23', '12:25:00', 'Classroom A3', 'Books', 'Claimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Textbook.png'),
(13, NULL, 'Jacket', 'Blue hoodie', '2024-07-24', '13:15:00', 'Cafeteria', 'Clothing', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Jacket.png'),
(14, NULL, 'Smartphone', 'Black iPhone with a cracked screen', '2024-07-26', '19:00:00', 'Lecture Hall', 'Electronics', 'Resolved', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Smartphone.png'),
(15, NULL, 'Pencil Case', 'Black pencil case with markers', '2024-07-28', '11:30:00', 'Library', 'Stationery', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/pencilcase.jpg'),
(16, NULL, 'Watch', 'Silver wristwatch', '2024-07-29', '14:00:00', 'Gym Locker', 'Accessories', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Watch.png'),
(17, NULL, 'Badge', 'ID badge with no name', '2024-07-30', '09:20:00', 'Library Desk', 'Identification', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/badge.jpg'),
(18, NULL, 'Sketchbook', 'Large sketchbook', '2024-08-01', '15:45:00', 'Art Room', 'Books', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Sketchbook.png'),
(19, NULL, 'Laptop', 'HP laptop in a black case', '2024-08-02', '16:50:00', 'Library', 'Electronics', 'Claimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Laptop.png'),
(20, NULL, 'Backpack', 'Black backpack with a laptop compartment', '2024-08-04', '08:30:00', 'Bus Station', 'Bags', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Backpack.png'),
(21, NULL, 'Bike Helmet', 'White helmet', '2024-08-05', '17:30:00', 'Gym Entrance', 'Sports', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Bike_Helmet.png'),
(22, NULL, 'Notebook', 'Physics notebook', '2024-08-06', '12:40:00', 'Classroom B2', 'Stationery', 'Claimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/notebook.jpg'),
(23, NULL, 'Camera', 'Canon DSLR camera', '2024-08-08', '10:15:00', 'Library', 'Electronics', 'Resolved', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Camera.png'),
(24, NULL, 'Water Bottle', 'Green bottle with stickers', '2024-08-09', '18:15:00', 'Cafeteria', 'Bottle', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/waterbottle.jpg'),
(25, NULL, 'Tablet', 'Samsung tablet with a cracked screen', '2024-08-11', '13:00:00', 'Classroom C3', 'Electronics', 'Claimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Tablet.png'),
(26, NULL, 'Gym Bag', 'Blue duffel bag', '2024-08-12', '08:20:00', 'Gym', 'Bags', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Gym_Bag.png'),
(27, NULL, 'Notebook', 'Spiral notebook with blue cover', '2024-08-14', '09:00:00', 'Lecture Hall', 'Stationery', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/notebook.jpg'),
(28, NULL, 'Calculator', 'TI-84 Plus calculator', '2024-08-15', '10:30:00', 'Exam Hall', 'Electronics', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Calculator.png'),
(29, NULL, 'Laptop Charger', 'MacBook charger', '2024-08-17', '15:20:00', 'Library', 'Electronics', 'Claimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/laptopcharger.jpg'),
(30, NULL, 'Phone Charger', 'Android USB-C charger', '2024-08-18', '16:00:00', 'Cafeteria', 'Electronics', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Phone_Charger.png'),
(31, NULL, 'Headphones', 'Over-ear Bluetooth headphones', '2024-08-20', '18:30:00', 'Gym', 'Electronics', 'Resolved', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Headphones.png'),
(32, NULL, 'Cap', 'Red baseball cap', '2024-08-21', '11:10:00', 'Library', 'Accessories', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Cap.png'),
(33, NULL, 'Textbook', 'Biology textbook', '2024-08-23', '14:00:00', 'Classroom B3', 'Books', 'Claimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Textbook.png'),
(34, NULL, 'Bracelet', 'Silver bracelet', '2024-08-24', '13:45:00', 'Gym', 'Accessories', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Bracelet.png'),
(35, NULL, 'Umbrella', 'Black umbrella with a floral pattern', '2024-08-25', '09:30:00', 'Library Entrance', 'Accessories', 'Claimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Umbrella.png'),
(36, NULL, 'Jacket', 'Green rain jacket', '2024-08-27', '08:10:00', 'Cafeteria', 'Clothing', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Jacket.png'),
(37, NULL, 'Keys', 'Bunch of keys with keychain', '2024-08-28', '12:25:00', 'Library', 'Keys', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Keys.png'),
(38, NULL, 'Phone Case', 'Blue silicone phone case', '2024-08-30', '11:45:00', 'Lecture Hall', 'Accessories', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Phone_Case.png'),
(39, NULL, 'Laptop', 'Lenovo laptop in a gray case', '2024-09-01', '15:00:00', 'Library', 'Electronics', 'Claimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Laptop.png'),
(40, NULL, 'Gloves', 'Pair of black gloves', '2024-09-03', '10:20:00', 'Gym', 'Clothing', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 12:57:58', 'src/assets/user_uploads/Gloves.png'),
(41, NULL, 'Thermos', 'Gray thermos with initials', '2024-09-04', '12:50:00', 'Cafeteria', 'Bottle', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/thermos.jpg'),
(42, NULL, 'Purse', 'Small leather purse', '2024-09-05', '16:00:00', 'Library', 'Accessories', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/purse.jpg'),
(43, NULL, 'Laptop Charger', 'Asus laptop charger', '2024-09-07', '14:35:00', 'Library', 'Electronics', 'Claimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/laptopcharger.jpg'),
(44, NULL, 'Pencil Case', 'Pink pencil case', '2024-09-09', '13:45:00', 'Library', 'Stationery', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/pencilcase.jpg'),
(45, NULL, 'Bike Lock', 'Cable bike lock', '2024-09-11', '08:00:00', 'Gym', 'Accessories', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/bikelock.jpg'),
(46, NULL, 'Socks', 'Pair of striped socks', '2024-09-13', '15:30:00', 'Gym Locker', 'Clothing', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/socks.jpg'),
(47, NULL, 'Badge', 'Student ID badge', '2024-09-15', '10:00:00', 'Library Desk', 'Identification', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/badge.jpg'),
(48, NULL, 'Phone', 'White Android phone with a pink case', '2024-09-16', '17:30:00', 'Library', 'Electronics', 'Resolved', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/phone.jpg'),
(49, NULL, 'Notebook', 'Red notebook with college logo', '2024-09-18', '12:20:00', 'Lecture Hall', 'Stationery', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/notebook.jpg'),
(50, NULL, 'Water Bottle', 'Blue water bottle with stickers', '2024-09-20', '11:15:00', 'Gym', 'Bottle', 'Unclaimed', '2024-11-09 07:27:31', '2024-11-09 13:07:28', 'src/assets/user_uploads/waterbottle.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `created_at`, `updated_at`, `role`) VALUES
(1, 'user1', 'hashed_password1', 'user1@example.com', '2024-11-08 12:30:57', '2024-11-08 12:30:57', 'admin'),
(2, 'user2', 'hashed_password2', 'user2@example.com', '2024-11-08 12:30:57', '2024-11-08 12:30:57', 'admin'),
(3, 'user3', 'hashed_password3', 'user3@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(4, 'user4', 'hashed_password4', 'user4@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(5, 'user5', 'hashed_password5', 'user5@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(6, 'user6', 'hashed_password6', 'user6@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(7, 'user7', 'hashed_password7', 'user7@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(8, 'user8', 'hashed_password8', 'user8@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(9, 'user9', 'hashed_password9', 'user9@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(10, 'user10', 'hashed_password10', 'user10@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(11, 'user11', 'hashed_password11', 'user11@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(12, 'user12', 'hashed_password12', 'user12@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(13, 'user13', 'hashed_password13', 'user13@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(14, 'user14', 'hashed_password14', 'user14@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(15, 'user15', 'hashed_password15', 'user15@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(16, 'user16', 'hashed_password16', 'user16@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(17, 'user17', 'hashed_password17', 'user17@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(18, 'user18', 'hashed_password18', 'user18@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(19, 'user19', 'hashed_password19', 'user19@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(20, 'user20', 'hashed_password20', 'user20@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(21, 'user21', 'hashed_password21', 'user21@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(22, 'user22', 'hashed_password22', 'user22@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(23, 'user23', 'hashed_password23', 'user23@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(24, 'user24', 'hashed_password24', 'user24@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(25, 'user25', 'hashed_password25', 'user25@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(26, 'user26', 'hashed_password26', 'user26@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(27, 'user27', 'hashed_password27', 'user27@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(28, 'user28', 'hashed_password28', 'user28@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(29, 'user29', 'hashed_password29', 'user29@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(30, 'user30', 'hashed_password30', 'user30@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(31, 'user31', 'hashed_password31', 'user31@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(32, 'user32', 'hashed_password32', 'user32@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(33, 'user33', 'hashed_password33', 'user33@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(34, 'user34', 'hashed_password34', 'user34@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(35, 'user35', 'hashed_password35', 'user35@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(36, 'user36', 'hashed_password36', 'user36@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(37, 'user37', 'hashed_password37', 'user37@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(38, 'user38', 'hashed_password38', 'user38@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(39, 'user39', 'hashed_password39', 'user39@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(40, 'user40', 'hashed_password40', 'user40@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(41, 'user41', 'hashed_password41', 'user41@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(42, 'user42', 'hashed_password42', 'user42@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(43, 'user43', 'hashed_password43', 'user43@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(44, 'user44', 'hashed_password44', 'user44@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(45, 'user45', 'hashed_password45', 'user45@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(46, 'user46', 'hashed_password46', 'user46@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(47, 'user47', 'hashed_password47', 'user47@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(48, 'user48', 'hashed_password48', 'user48@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(49, 'user49', 'hashed_password49', 'user49@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin'),
(50, 'user50', 'hashed_password50', 'user50@example.com', '2024-11-09 07:27:31', '2024-11-09 07:27:31', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `claim_requests`
--
ALTER TABLE `claim_requests`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `found_item`
--
ALTER TABLE `found_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_found_item_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `claim_requests`
--
ALTER TABLE `claim_requests`
  MODIFY `claim_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `found_item`
--
ALTER TABLE `found_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `claim_requests`
--
ALTER TABLE `claim_requests`
  ADD CONSTRAINT `claim_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `claim_requests_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `found_item` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `found_item`
--
ALTER TABLE `found_item`
  ADD CONSTRAINT `fk_found_item_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
