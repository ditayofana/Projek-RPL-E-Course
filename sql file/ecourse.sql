-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 19, 2024 at 06:32 AM
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
-- Database: `ecourse`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int NOT NULL,
  `AdminUserName` varchar(255) DEFAULT NULL,
  `AdminPassword` varchar(255) DEFAULT NULL,
  `AdminEmailId` varchar(255) DEFAULT NULL,
  `userType` int DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `userType`, `CreationDate`, `UpdationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', 'admin@gmail.com', 1, '2021-05-26 18:30:00', '2024-06-05 09:21:17'),
(3, 'subadmin', 'f925916e2754e5e03f75dd58a5733251', 'sudamin@gmail.in', 1, '2021-11-10 18:28:11', '2024-06-05 09:47:38'),
(7, 'intan', '5b2d4484498235e80d61a233a7c04991', 'intan@gmail.com', 0, '2024-06-05 12:06:25', NULL),
(8, 'caca marisya', '827ccb0eea8a706c4c34a16891f84e7b', 'marisya@gmail.com', 0, '2024-06-19 04:15:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `Description` mediumtext,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Is_Active` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 'Matemathics', 'Related to Matematihics', '2021-06-05 18:30:00', '2024-06-05 04:32:27', 1),
(5, 'Physics', 'Entertainment related  News', '2021-06-13 18:30:00', '2024-06-04 12:51:59', 1),
(6, 'Biology', 'Politics', '2021-06-21 18:30:00', '2024-06-04 12:52:04', 1),
(7, 'Chemistry', 'Business', '2021-06-21 18:30:00', '2024-06-04 12:52:18', 1),
(8, 'English', 'COVID-19', '2021-11-07 18:17:28', '2024-06-04 12:52:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int NOT NULL,
  `PageName` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext,
  `Description` longtext,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
(1, 'aboutus', 'About E-Course', '<font color=\"#7b8898\" face=\"Mercury SSm A, Mercury SSm B, Georgia, Times, Times New Roman, Microsoft YaHei New, Microsoft Yahei, å¾®è½¯é›…é»‘, å®‹ä½“, SimSun, STXihei, åŽæ–‡ç»†é»‘, serif\"><span style=\"font-size: 26px;\">Sistem Online Course Berbasis Web adalah platform digital yang menyediakan akses ke berbagai kursus dan materi pembelajaran secara online dengan antarmuka yang ramah pengguna, website ini akan&nbsp; memberikan pengalaman belajar yang interaktif dan fleksibel bagi para pengguna.</span></font><br>', '2021-06-29 18:30:00', '2024-06-05 09:07:10'),
(2, 'contactus', 'Contact Details', '<p><br></p><p><b>Address : UIN-Malang</b></p><p><b>Phone Number : </b>+62 - 877182399</p><p><b>Email -id : ECourseOnline</b>@gmail.com</p>', '2021-06-29 18:30:00', '2024-06-05 08:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `tblposts`
--

CREATE TABLE `tblposts` (
  `id` int NOT NULL,
  `PostTitle` longtext,
  `CategoryId` int DEFAULT NULL,
  `SubCategoryId` int DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Is_Active` int DEFAULT NULL,
  `PostUrl` mediumtext,
  `PostImage` varchar(255) DEFAULT NULL,
  `viewCounter` int DEFAULT NULL,
  `postedBy` varchar(255) DEFAULT NULL,
  `lastUpdatedBy` varchar(255) DEFAULT NULL,
  `PostPdf` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblposts`
--

INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`, `viewCounter`, `postedBy`, `lastUpdatedBy`, `PostPdf`) VALUES
(20, 'Materi 1', 3, 4, '<p>kerjakan latihan soal halaman 20</p>', '2024-06-05 08:30:51', '2024-06-09 09:37:45', 1, 'Materi-1', '4e5183a351935f6b3dc54111592da777jpeg', 18, 'admin', 'subadmin', NULL),
(21, 'Materi 1', 5, 3, '<p>Pertemuan yang akan datang kita membahas materi BAB II</p>', '2024-06-05 09:57:20', '2024-06-05 11:28:31', 1, 'Materi-1', 'ceb0f2ee043e1c26051db9d1d2bda3bdjpeg', 2, 'subadmin', NULL, NULL),
(22, 'Materi 1', 6, 7, 'Pelajari BAB II untuk praktikum selanjutnya', '2024-06-05 09:58:56', '2024-06-05 11:26:50', 1, 'Materi-1', 'f0fd03d1cd03ba2352a830154808f528jpeg', 2, 'subadmin', NULL, NULL),
(23, 'Materi 2', 7, 9, '<p>kerjakan halaman no 12</p>', '2024-06-05 12:07:34', '2024-06-19 04:46:04', 1, 'Materi-2', 'f6b18c55f02dfdaade0537ca989855f7jpeg', 13, 'subadmin', 'subadmin', NULL),
(24, 'Materi 2', 3, 4, '<p>adsasff</p>', '2024-06-09 08:49:46', '2024-06-09 09:03:17', 0, 'Materi-2', '0e1ea6fb2da948dda584d8b3c73eaea3.jpg', NULL, 'subadmin', NULL, NULL),
(25, 'Materi 2', 3, 4, '<p>adsasff</p>', '2024-06-09 08:56:16', '2024-06-09 09:03:15', 0, 'Materi-2', '0e1ea6fb2da948dda584d8b3c73eaea3.jpg', NULL, 'subadmin', NULL, NULL),
(26, 'Materi 11', 8, 10, '<p>srgsgd</p>', '2024-06-09 08:57:05', '2024-06-09 09:03:11', 0, 'Materi-11', '0e1ea6fb2da948dda584d8b3c73eaea3.jpg', 1, 'subadmin', NULL, NULL),
(27, 'Materi 11', 8, 10, '<p>srgsgd</p>', '2024-06-09 09:02:24', '2024-06-09 09:03:10', 0, 'Materi-11', '0e1ea6fb2da948dda584d8b3c73eaea3.jpg', NULL, 'subadmin', NULL, NULL),
(28, 'Materi 11', 8, 10, '<p>ppp</p>', '2024-06-09 09:17:02', '2024-06-09 09:36:45', 0, 'Materi-11', '0e1ea6fb2da948dda584d8b3c73eaea3.jpg', 19, 'subadmin', NULL, 0x64643831373661616666653662346636353632313064376262656462313466322e706466),
(29, 'Materi 11', 8, 10, '<p>ppp</p>', '2024-06-09 09:36:29', '2024-06-09 09:36:39', 0, 'Materi-11', '0e1ea6fb2da948dda584d8b3c73eaea3.jpg', NULL, 'subadmin', NULL, 0x64643831373661616666653662346636353632313064376262656462313466322e706466);

-- --------------------------------------------------------

--
-- Table structure for table `tblregister`
--

CREATE TABLE `tblregister` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `namaLengkap` varchar(200) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblregister`
--

INSERT INTO `tblregister` (`username`, `password`, `email`, `namaLengkap`, `level`) VALUES
('dita', '827ccb0eea8a706c4c34a16891f84e7b', 'ditayofana@gmail.com', 'ditaa', 'Admin'),
('intan', '46a7357b0b816cb9dd56d70d2a385cfd', 'intan@gmail.com', 'intan nur', 'Admin'),
('silvi', '202cb962ac59075b964b07152d234b70', 'silvi@gmail.com', 'lailatul ilmi', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int NOT NULL,
  `CategoryId` int DEFAULT NULL,
  `Subcategory` varchar(255) DEFAULT NULL,
  `SubCatDescription` mediumtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Is_Active` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 5, 'Newton', '--', '2021-06-21 18:30:00', '2024-06-05 11:42:16', 1),
(4, 3, 'Algoritma', '--\r\n\r\n\r\n', '2021-06-29 18:30:00', '2024-06-05 11:37:08', 1),
(5, 3, 'Trigonometri', '--', '2021-06-29 18:30:00', '2024-06-05 11:36:58', 1),
(6, 5, 'Pascal', '--', '2021-06-30 18:30:00', '2024-06-05 11:36:54', 1),
(7, 6, 'Sel', '--', '2021-06-30 18:30:00', '2024-06-05 11:36:51', 1),
(8, 6, 'Genetics', '--', '2021-06-30 18:30:00', '2024-06-05 11:36:49', 1),
(9, 7, 'Elektrolit ', '--', '2021-06-30 18:30:00', '2024-06-05 11:36:46', 1),
(10, 8, 'Tenses', '--', '2021-11-07 18:18:25', '2024-06-05 11:36:43', 1),
(11, 3, 'Diskrit Mathetics', 'Tolong dipelajari selama perkuliahan online', '2024-06-04 12:53:59', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AdminUserName` (`AdminUserName`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `postcatid` (`CategoryId`),
  ADD KEY `postsucatid` (`SubCategoryId`),
  ADD KEY `subadmin` (`postedBy`);

--
-- Indexes for table `tblregister`
--
ALTER TABLE `tblregister`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`),
  ADD KEY `catid` (`CategoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblposts`
--
ALTER TABLE `tblposts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD CONSTRAINT `postcatid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`),
  ADD CONSTRAINT `postsucatid` FOREIGN KEY (`SubCategoryId`) REFERENCES `tblsubcategory` (`SubCategoryId`),
  ADD CONSTRAINT `subadmin` FOREIGN KEY (`postedBy`) REFERENCES `tbladmin` (`AdminUserName`);

--
-- Constraints for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD CONSTRAINT `catid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
