-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2017 at 01:21 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `biddetails`
--

CREATE TABLE `biddetails` (
  `id` int(10) NOT NULL,
  `bidId` int(10) NOT NULL,
  `bookId` int(10) NOT NULL,
  `startingPrice` int(10) NOT NULL,
  `highestBid` int(10) NOT NULL,
  `biddersId` int(10) NOT NULL,
  `bidDateStart` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bidDateEnd` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bidId` int(10) NOT NULL,
  `biddersId` int(10) NOT NULL,
  `bidPrice` double(100,2) NOT NULL,
  `bidDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookId` int(10) NOT NULL,
  `isbn` bigint(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `authors` varchar(100) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `publishedDate` varchar(100) DEFAULT NULL,
  `pageCount` int(10) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `ratingsCount` int(10) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `currentImage` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `forSale` int(10) DEFAULT NULL,
  `forBid` int(10) DEFAULT NULL,
  `forRent` int(10) DEFAULT NULL,
  `forBarter` int(10) DEFAULT NULL,
  `salePrice` int(100) DEFAULT NULL,
  `bidPrice` int(10) DEFAULT NULL,
  `rentPrice` int(10) DEFAULT NULL,
  `bidTimeDuration` int(10) DEFAULT NULL,
  `bookStatus` int(10) DEFAULT NULL,
  `uploadersID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookId`, `isbn`, `title`, `authors`, `publisher`, `publishedDate`, `pageCount`, `category`, `ratingsCount`, `image`, `currentImage`, `description`, `forSale`, `forBid`, `forRent`, `forBarter`, `salePrice`, `bidPrice`, `rentPrice`, `bidTimeDuration`, `bookStatus`, `uploadersID`) VALUES
(1, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, 'Science Fiction', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 1, 0, 0, 0, 400, NULL, NULL, NULL, 1, 1),
(2, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, 'Science Fiction', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(3, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 1, 0, 1, 0, 400, NULL, 200, NULL, 1, 1),
(4, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 1, 0, 0, NULL, 300, NULL, 2, 1, 1),
(5, 9780545010221, 'Harry Potter and the Deathly Hallows', 'J. K. Rowling', 'Arthur a Levine', '2007', 759, 'Science Fiction', 2892, 'http://books.google.com/books/content?id=GZAoAQAAIAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 'The magnificent final book in J. K. Rowling''s seven-part saga comes to readers July 21, 2007. You''ll find out July 21!', 0, 0, 1, 0, NULL, NULL, 200, NULL, 1, 1),
(6, 9780545010221, 'Harry Potter and the Deathly Hallows', 'J. K. Rowling', 'Arthur a Levine', '2007', 759, 'Science Fiction', 2801, 'http://books.google.com/books/content?id=JHEkAQAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 'The magnificent final book in J. K. Rowling''s seven-part saga comes to readers July 21, 2007. You''ll find out July 21!', 0, 0, 0, 1, NULL, NULL, NULL, NULL, 1, 1),
(7, 9780062024039, 'Divergent', 'Veronica Roth', 'Katherine Tegen Books', '2012-02-28', 576, 'Science Fiction', 74, 'http://books.google.com/books/content?id=-TUinwEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 'Paperback features over fifty pages of bonus materials, including a sneak peek of Insurgent, an author Q&amp;A, a discussion guide, a Divergent playlist, faction manifestos, and more! In Beatrice Prior''s dystopian Chicago world, society is divided into five factions, each dedicated to the cultivation of a particular virtue—Candor (the honest), Abnegation (the selfless), Dauntless (the brave), Amity (the peaceful), and Erudite (the intelligent). On an appointed day of every year, all sixteen-year', 0, 0, 1, 0, NULL, NULL, 200, NULL, 1, 1),
(8, 9780062024039, 'Divergent', 'Veronica Roth', 'Katherine Tegen Books', '2012-02-28', 576, 'Science Fiction', 74, 'http://books.google.com/books/content?id=-TUinwEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 'Paperback features over fifty pages of bonus materials, including a sneak peek of Insurgent, an author Q&amp;A, a discussion guide, a Divergent playlist, faction manifestos, and more! In Beatrice Prior''s dystopian Chicago world, society is divided into five factions, each dedicated to the cultivation of a particular virtue—Candor (the honest), Abnegation (the selfless), Dauntless (the brave), Amity (the peaceful), and Erudite (the intelligent). On an appointed day of every year, all sixteen-year', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(9, 9780545010221, 'Harry Potter and the Deathly Hallows', 'J. K. Rowling', 'Arthur a Levine', '2007', 759, 'Science Fiction', 2892, 'http://books.google.com/books/content?id=GZAoAQAAIAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api', NULL, 'The magnificent final book in J. K. Rowling''s seven-part saga comes to readers July 21, 2007. You''ll find out July 21!', 0, 0, 0, 1, NULL, NULL, NULL, NULL, 1, 1),
(11, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(12, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(13, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(14, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(15, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(16, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(17, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(18, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(19, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(20, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(21, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, 'Science Fiction', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(22, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(23, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1),
(24, 9780439023528, 'The Hunger Games', 'Suzanne Collins', 'Scholastic Inc.', '2008', 374, '', 2468, 'http://books.google.com/books/content?id=hlb_sM1AN0gC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', NULL, 'In a future North America, where the rulers of Panem maintain control through an annual televised survival competition pitting young people from each of the twelve districts against one another, sixteen-year-old Katniss''s skills are put to the test when she voluntarily takes her younger sister''s place.', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentId` int(10) NOT NULL,
  `userComment` varchar(255) DEFAULT NULL,
  `commenter` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `user_id` int(10) NOT NULL,
  `provider_user_id` varchar(100) DEFAULT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `social_accounts`
--

INSERT INTO `social_accounts` (`user_id`, `provider_user_id`, `provider`, `updated_at`, `created_at`) VALUES
(1, '2025369037690023', 'facebook', '2017-02-04 08:04:15', '2017-02-04 08:04:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `updated_at`, `created_at`) VALUES
(1, 'Jesse', NULL, 'https://graph.facebook.com/v2.2/2025369037690023/picture?type=large', '2017-02-04 08:04:14', '2017-02-04 08:04:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biddetails`
--
ALTER TABLE `biddetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bidId`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookId`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentId`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `biddetails`
--
ALTER TABLE `biddetails`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bidId` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentId` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
