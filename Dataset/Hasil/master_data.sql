-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 28, 2025 at 04:16 PM
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
-- Database: `soal_1`
--

-- --------------------------------------------------------

--
-- Structure for view `master_data`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `master_data`  AS   with `customer_temp` as (select `customer`.`CustomerID` AS `customer_id`,`customer`.`CustomerEmail` AS `customer_email`,`customer`.`CustomerCity` AS `customer_city` from `customer`), `product_temp` as (select `product`.`ProdNumber` AS `product_number`,`product`.`ProdName` AS `product_name`,`product`.`Price` AS `product_price` from `product`), `order_temp` as (select `orders`.`OrderID` AS `order_id`,`orders`.`Date` AS `order_date`,`orders`.`CustomerID` AS `customer_id`,`orders`.`ProdNumber` AS `product_number`,`orders`.`Quantity` AS `order_quantity` from `orders`) select `ot`.`order_date` AS `order_date`,`ct`.`customer_email` AS `customer_email`,`ct`.`customer_city` AS `customer_city`,`pt`.`product_name` AS `product_name`,`pt`.`product_price` AS `product_price`,`ot`.`order_quantity` AS `order_quantity`,(`pt`.`product_price` * `ot`.`order_quantity`) AS `total_price` from ((`order_temp` `ot` join `customer_temp` `ct` on((`ot`.`customer_id` = `ct`.`customer_id`))) join `product_temp` `pt` on((`ot`.`product_number` = `pt`.`product_number`))) order by `ot`.`order_date`  ;

--
-- VIEW `master_data`
-- Data: None
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
