-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2022 at 02:13 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_management_system`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `backupProc` ()   BEGIN
 DECLARE done INT DEFAULT 0;
 DECLARE u_ID, u_pass INTEGER;
 DECLARE u_name, u_email, u_type VARCHAR(20);
 DECLARE cur CURSOR FOR SELECT * FROM userdata;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
 OPEN cur;
 label: LOOP
 FETCH cur INTO u_ID, u_name, u_email, u_pass, u_type ;
 INSERT INTO backup_user VALUES(u_ID, u_name, u_email, u_pass, u_type);
 IF done = 1 THEN LEAVE label;
 END IF;
 END LOOP;
 CLOSE cur;
 END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `number_of_branch` (`c` VARCHAR(255)) RETURNS INT(11) DETERMINISTIC BEGIN
    DECLARE a int;
    
    SELECT count(id) into a
	FROM book
    where branch = c;
    
	RETURN a;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(110) NOT NULL,
  `password` varchar(110) NOT NULL,
  `type` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `type`) VALUES
(1, '123@gmail.com', '123', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `backup_user`
--

CREATE TABLE `backup_user` (
  `b_id` int(11) DEFAULT NULL,
  `b_name` varchar(100) DEFAULT NULL,
  `b_email` varchar(40) DEFAULT NULL,
  `b_pass` int(11) DEFAULT NULL,
  `b_type` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `backup_user`
--

INSERT INTO `backup_user` (`b_id`, `b_name`, `b_email`, `b_pass`, `b_type`) VALUES
(3, 'Friday', '1221@gmail.com', 1221, 'student'),
(4, 'Edith', '1441@gmail.com', 1441, 'student'),
(5, 'Vision', '2306@gmail.com', 2306, 'student'),
(6, 'Tony Stark', '232@gmail.com', 232, 'teacher'),
(7, 'Steve Rogers', '111@gmail.com', 111, 'teacher'),
(8, 'Natasha Romanoff', '404@gmail.com', 404, 'teacher'),
(8, 'Natasha Romanoff', '404@gmail.com', 404, 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `bookpic` varchar(110) NOT NULL,
  `bookname` varchar(110) NOT NULL,
  `bookdetail` varchar(110) NOT NULL,
  `bookaudor` varchar(110) NOT NULL,
  `bookpub` varchar(110) NOT NULL,
  `branch` varchar(110) NOT NULL,
  `bookprice` int(11) NOT NULL,
  `bookquantity` int(11) NOT NULL,
  `bookava` int(11) NOT NULL,
  `bookrent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `bookpic`, `bookname`, `bookdetail`, `bookaudor`, `bookpub`, `branch`, `bookprice`, `bookquantity`, `bookava`, `bookrent`) VALUES
(1, '7477a929c1e6732a396afa81bde22de9.jpg', 'Harry Potter', 'Fantasy', 'JK Rowling', 'Penguin', 'Novel', 400, 100, 98, 2),
(7, 'download (4).jpg', 'Cress', 'Fantasy', 'Marissa Meyer', 'Westland', 'other', 300, 5, 3, 2),
(8, 'download (1).jpg', 'Catching Fire', 'Adventure', 'Suzanne Collins', 'Penguin', 'Novel', 400, 10, 9, 1),
(9, 'download (3).jpg', 'Deception point', 'Thriller', 'Dan Brown', 'Scholastic', 'Novel', 500, 4, 2, 2),
(10, 'download (2).jpg', 'Maze Runner', 'SciFi', 'James Dashner', 'Westland', 'other', 350, 6, 6, 0),
(11, '81+Eh-enKAL.jpg', 'Mathematics', '12th', 'NCERT', 'CBSE', 'Textbook', 100, 10, 10, 0),
(12, '91u5XFlMazL.jpg', 'Physics', '11th', 'NCERT', 'CBSE', 'Textbook', 150, 3, 3, 0),
(13, 'download (5).jpg', 'Fangirl', 'Adventure', 'Rainbow Rowell', 'Westland', 'Novel', 350, 5, 5, 0),
(14, 'download (6).jpg', 'Six of Crows', 'Adventure', 'Leigh Bardugo', 'Scholastic', 'Novel', 450, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `issuebook`
--

CREATE TABLE `issuebook` (
  `id` int(11) NOT NULL,
  `userid` int(110) NOT NULL,
  `issuename` varchar(110) NOT NULL,
  `issuebook` varchar(110) NOT NULL,
  `issuetype` varchar(110) NOT NULL,
  `issuedays` int(110) NOT NULL,
  `issuedate` date NOT NULL,
  `issuereturn` date NOT NULL,
  `fine` int(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issuebook`
--

INSERT INTO `issuebook` (`id`, `userid`, `issuename`, `issuebook`, `issuetype`, `issuedays`, `issuedate`, `issuereturn`, `fine`) VALUES
(17, 7, 'Steve Rogers', 'Six of Crows', 'teacher', 7, '2022-11-23', '2022-11-30', 0),
(18, 7, 'Steve Rogers', 'Cress', 'teacher', 7, '2022-11-24', '2022-12-01', 0),
(20, 6, 'Tony Stark', 'Cress', 'teacher', 7, '2022-11-26', '2022-12-03', 0);

--
-- Triggers `issuebook`
--
DELIMITER $$
CREATE TRIGGER `issueb` BEFORE INSERT ON `issuebook` FOR EACH ROW BEGIN
	SET NEW.issuereturn = DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `issued` BEFORE INSERT ON `issuebook` FOR EACH ROW BEGIN
	SET NEW.issuedate = CURRENT_DATE;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `max_issue` BEFORE INSERT ON `issuebook` FOR EACH ROW BEGIN
DECLARE error_msg VARCHAR(255);
declare x int;
SET error_msg = ('Cannot issue more than 3 books');
IF (select count(*) from issuebook where userid = new.userid) > 3 THEN
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = error_msg;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `requestbook`
--

CREATE TABLE `requestbook` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `usertype` varchar(25) NOT NULL,
  `bookname` varchar(25) NOT NULL,
  `issuedays` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `requestbook`
--

INSERT INTO `requestbook` (`id`, `userid`, `bookid`, `username`, `usertype`, `bookname`, `issuedays`) VALUES
(8, 3, 8, 'Friday', 'student', 'Catching Fire', '7'),
(9, 4, 9, 'Edith', 'student', 'Deception point', '7');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `id` int(11) NOT NULL,
  `name` varchar(110) NOT NULL,
  `email` varchar(110) NOT NULL,
  `pass` varchar(110) NOT NULL,
  `type` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`id`, `name`, `email`, `pass`, `type`) VALUES
(3, 'Friday', '1221@gmail.com', '1221', 'student'),
(4, 'Edith', '1441@gmail.com', '1441', 'student'),
(5, 'Vision', '2306@gmail.com', '2306', 'student'),
(6, 'Tony Stark', '232@gmail.com', '232', 'teacher'),
(7, 'Steve Rogers', '111@gmail.com', '111', 'teacher'),
(8, 'Natasha Romanoff', '404@gmail.com', '404', 'teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issuebook`
--
ALTER TABLE `issuebook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_fk` (`userid`);

--
-- Indexes for table `requestbook`
--
ALTER TABLE `requestbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_fk_book` (`bookid`),
  ADD KEY `pk_fk_users` (`userid`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `issuebook`
--
ALTER TABLE `issuebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `requestbook`
--
ALTER TABLE `requestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `issuebook`
--
ALTER TABLE `issuebook`
  ADD CONSTRAINT `pk_fk` FOREIGN KEY (`userid`) REFERENCES `userdata` (`id`);

--
-- Constraints for table `requestbook`
--
ALTER TABLE `requestbook`
  ADD CONSTRAINT `pk_fk_users` FOREIGN KEY (`userid`) REFERENCES `userdata` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
