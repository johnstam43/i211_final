-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2022 at 05:39 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `i211_final_group4`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category`) VALUES
(123, 'CD'),
(456, 'Video Games'),
(789, 'Movies'),
(101112, 'Videos');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `item_id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `release_date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `language` varchar(55) NOT NULL,
  `parental_advisory` tinyint(1) NOT NULL,
  `stock` mediumint(9) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`item_id`, `title`, `release_date`, `category_id`, `price`, `language`, `parental_advisory`, `stock`, `description`) VALUES
(111, 'Doom: Eternal', '2020-03-20', 456, '60.00', 'ENG', 1, 16, 'Fight Hordes of Demons as the Doom Slayer in Doom Eternal. '),
(112, 'White Album', '1968-11-22', 123, '70.00', 'ENG', 0, 14, 'Album produced by the Beatles'),
(113, 'Straight Outta Compton', '2012-08-19', 123, '60.00', 'ENG', 1, 2, 'Album from the rap band N.W.A'),
(114, 'Avengers Endgame', '2022-04-26', 789, '150.00', 'ENG', 0, 2, 'Ending of the Avengers Infinity Saga'),
(115, 'Death of Stalin', '2018-03-09', 789, '23.00', 'ENG', 1, 4, 'A Dark comedy covering the death of the dictator Joseph Stalin.');

-- --------------------------------------------------------

--
-- Table structure for table `rent_history`
--

CREATE TABLE `rent_history` (
  `rent_id` int(11) NOT NULL,
  `check_out` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `return_date` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rent_history`
--

INSERT INTO `rent_history` (`rent_id`, `check_out`, `return_date`, `user_id`, `inventory_id`) VALUES
(1, '2022-04-04 15:14:06', '2022-04-14 15:00:52', 1, 111),
(2, '2022-04-04 15:14:06', '2022-04-14 15:14:06', 2, 112);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_role` tinyint(4) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`address`)),
  `phone_number` int(13) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `date_of_birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_role`, `username`, `email`, `password`, `address`, `phone_number`, `gender`, `date_of_birth`) VALUES
(1, 11, 'elibules', 'ebules@iu.edu', '000', '{\"street\": \"1111 Main St.\", \"city\": \"Indianapolis\", \"zip\": 46753, \"state\": \"IN\", \"country\": \"United States of America\"}', 1111111, 'male', '2002-04-01'),
(2, 12, 'johnstamatkin', 'jstamatk@iu.edu', '111', '{\"street\": \"1567 Main St.\", \"city\": \"Indianapolis\", \"zip\": 46753, \"state\": \"IN\", \"country\": \"United States of America\"}', 4444444, 'male', '2022-04-01'),
(3, 13, 'zachnewbold', 'znewbold@iu.edu', '222', '{\"street\": \"1234 Boulevard St.\", \"city\": \"Indianapolis\", \"zip\": 46237, \"state\": \"IN\", \"country\": \"United States of America\"}', 222222, 'male', '2001-06-13'),
(4, 14, 'ramonatin', 'tintin@iu.edu', '333', '{\"street\": \"4567 Drive St.\", \"city\": \"Indianapolis\", \"zip\": 46936, \"state\": \"IN\", \"country\": \"United States of America\"}', 55555555, 'female', '2000-01-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `category_id_fk` (`category_id`);

--
-- Indexes for table `rent_history`
--
ALTER TABLE `rent_history`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `inventory_id_fk` (`inventory_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101113;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `rent_history`
--
ALTER TABLE `rent_history`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION;

--
-- Constraints for table `rent_history`
--
ALTER TABLE `rent_history`
  ADD CONSTRAINT `inventory_id_fk` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`item_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `rent_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
