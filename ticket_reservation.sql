-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2023 at 12:40 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiket_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `bioskop`
--

CREATE TABLE `bioskop` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bioskop`
--

INSERT INTO `bioskop` (`id`, `nama`) VALUES
(1, 'XXI'),
(2, 'CGV'),
(3, 'Cinepolis');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `id_bioskop` int(11) NOT NULL,
  `judul` varchar(30) NOT NULL,
  `genre` varchar(30) NOT NULL,
  `ratings` varchar(30) NOT NULL,
  `poster` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `id_bioskop`, `judul`, `genre`, `ratings`, `poster`) VALUES
(1, 1, 'BLACK PANTHER: WAKANDA FOREVER', 'Action . Adventure . Drama', '7.4/10', 'bp.jpeg'),
(2, 1, 'SRI ASIH', 'Action . Sci-Fi', '7.5/10', 'sa.jpeg'),
(3, 1, 'THE MENU', 'Comedy . Horror . Thriller', '7.5/10', 'tm.jpeg'),
(4, 1, 'TEGAR', 'Drama', '7/10', 'tegar.jpeg'),
(5, 2, 'AVENGERS: ENDGAME', 'Action . Adventure . Drama', '8.4/10', 'ae.jpg'),
(6, 2, 'DOCTOR STRANGE IN THE MULTIVER', 'Action . Adventure . Drama', '6.9/10', 'ds.jpg'),
(7, 2, 'SPIDER-MAN: NO WAY HOME', 'Action . Adventure . Fantasy', '8.3/10', 'sm.jpg'),
(8, 2, 'THOR: LOVE AND THUNDER', 'Action . Adventure . Comedy', '6.3/10', 'thor.jpg'),
(9, 3, 'JURASSIC WORLD DOMINION', 'Action . Adventure . Sci-Fi', '5.7/10', 'jw.jpg'),
(10, 3, 'BULLET TRAIN', 'Action . Comedy . Thriller', '7.3/10', 'bt.jpg'),
(11, 3, 'LOKI', 'Action . Adventure . Fantasy', '8.2/10', 'loki.jpg'),
(12, 3, 'INTERSTELLAR', 'Adventure . Drama . Sci-Fi', '8.6/10', 'inter.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tiket_order`
--

CREATE TABLE `tiket_order` (
  `id_order` int(11) NOT NULL,
  `id_film` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_bioskop` int(11) NOT NULL,
  `jumlah_tiket` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` varchar(30) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tiket_order`
--

INSERT INTO `tiket_order` (`id_order`, `id_film`, `id_user`, `id_bioskop`, `jumlah_tiket`, `tanggal`, `waktu`, `total_harga`) VALUES
(5, 4, 1, 1, 2, '2023-05-25', '2:00 PM', 200000),
(6, 5, 1, 2, 3, '2023-05-24', '11:00 AM', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `no_hp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`, `no_hp`) VALUES
(1, 'seva', 'seva', 'seva', '111'),
(2, 'haikal', 'haikal', 'haikal', '2222');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bioskop`
--
ALTER TABLE `bioskop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bioskop` (`id_bioskop`);

--
-- Indexes for table `tiket_order`
--
ALTER TABLE `tiket_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_film` (`id_film`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_bioskop` (`id_bioskop`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bioskop`
--
ALTER TABLE `bioskop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tiket_order`
--
ALTER TABLE `tiket_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_bioskop`) REFERENCES `bioskop` (`id`);

--
-- Constraints for table `tiket_order`
--
ALTER TABLE `tiket_order`
  ADD CONSTRAINT `tiket_order_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `tiket_order_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `tiket_order_ibfk_3` FOREIGN KEY (`id_bioskop`) REFERENCES `bioskop` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
