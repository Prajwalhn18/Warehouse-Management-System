-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2021 at 08:47 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehousedatabasesystem`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`` PROCEDURE `get_products` ()  BEGIN
SELECT *FROM products;
END$$

CREATE DEFINER=`` PROCEDURE `update_stock` (IN `I_product_id` MEDIUMINT(9))  NO SQL
UPDATE products set stock=stock-new.no_of_item where product_id=I_product_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dproducts`
--

CREATE TABLE `dproducts` (
  `id` int(11) NOT NULL,
  `dproductname` varchar(20) NOT NULL,
  `dproductdescription` text NOT NULL,
  `ditem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dproducts`
--

INSERT INTO `dproducts` (`id`, `dproductname`, `dproductdescription`, `ditem`) VALUES
(1, 'santoor', 'soap', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` mediumint(11) NOT NULL,
  `buyer_id` char(50) DEFAULT NULL,
  `product_id` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `buyer_id`, `product_id`) VALUES
(11, 'arjun', 43),
(12, 'arjun', 43),
(23, 'prajwalhn', 47),
(24, 'prajwalhn', 50);

-- --------------------------------------------------------

--
-- Table structure for table `pickup`
--

CREATE TABLE `pickup` (
  `id` int(11) NOT NULL,
  `product_id` mediumint(9) NOT NULL,
  `name` varchar(20) NOT NULL,
  `location` varchar(1) NOT NULL,
  `no_of_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pickup`
--

INSERT INTO `pickup` (`id`, `product_id`, `name`, `location`, `no_of_item`) VALUES
(12, 49, 'multivitamin', 'a', 10),
(13, 49, 'multivitamin', 'z', 10),
(14, 44, 'book', 'B', 10);

-- --------------------------------------------------------

--
-- Table structure for table `productlog`
--

CREATE TABLE `productlog` (
  `product_id` mediumint(9) NOT NULL,
  `Added_by` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productlog`
--

INSERT INTO `productlog` (`product_id`, `Added_by`, `stock`, `added_on`) VALUES
(47, 'arjun', 100, '2020-12-25 13:13:02'),
(48, 'arjun', 200, '2020-12-25 14:02:36'),
(49, 'prajwalhn', 100, '2020-12-27 10:15:21'),
(50, 'prajwalhn', 350, '2020-12-28 13:17:19'),
(51, 'prajwalhn', 5000, '2021-01-02 17:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` mediumint(9) NOT NULL,
  `product_name` char(50) DEFAULT NULL,
  `user_id` char(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `category` char(50) DEFAULT NULL,
  `img_url` char(200) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `user_id`, `price`, `category`, `img_url`, `description`, `status`, `stock`) VALUES
(43, 'Lifebuoy', 'arjun', 40, 'furniture', '/uploads/uploadedImage-1608700752871.jpg', 'Soap-100123', 0, 390),
(44, 'Book', 'arjun', 500, 'books', '/uploads/uploadedImage-1608705509010.jpg', '12435', 0, 190),
(46, 'Samsung', 'arjun', 17000, 'electronics', '/uploads/uploadedImage-1608744007140.jpg', 'Samsung is best phone in the current market with 64 MP camera', 0, 290),
(47, 'boya mic', 'arjun', 1500, 'electronics', '/uploads/uploadedImage-1608901982009.jpg', 'microphone ', 0, 90),
(48, 'Axe', 'arjun', 450, 'healthcare', '/uploads/uploadedImage-1608904956434.jpg', 'deodrant ', 0, 190),
(49, 'Multivitamin', 'prajwalhn', 400, 'healthcare', '/uploads/uploadedImage-1609064121747.jpg', 'Multivitamin for men', 1, 90),
(50, 'steamer', 'prajwalhn', 2000, 'electronics', '/uploads/uploadedImage-1609161439123.jpg', 'Steamer', 0, 340);

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `after_prodcut_log` AFTER INSERT ON `products` FOR EACH ROW insert into productlog values(new.product_id,new.user_id,new.stock,now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `productsadd`
-- (See below for the actual view)
--
CREATE TABLE `productsadd` (
`buyer_id` char(50)
,`product_id` mediumint(9)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` char(50) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `address`, `phone`, `password`) VALUES
('arjun', 'abcd', 'banglore', '11223334445', 'coolm');

-- --------------------------------------------------------

--
-- Structure for view `productsadd`
--
DROP TABLE IF EXISTS `productsadd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `productsadd`  AS SELECT `orders`.`buyer_id` AS `buyer_id`, `orders`.`product_id` AS `product_id` FROM `orders` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dproducts`
--
ALTER TABLE `dproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `pickup`
--
ALTER TABLE `pickup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `user_id_fk` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dproducts`
--
ALTER TABLE `dproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` mediumint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `pickup`
--
ALTER TABLE `pickup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `pickup`
--
ALTER TABLE `pickup`
  ADD CONSTRAINT `pickup_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
