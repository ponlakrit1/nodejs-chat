-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2020 at 07:29 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pttms`
--
CREATE DATABASE IF NOT EXISTS `pttms` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `pttms`;

-- --------------------------------------------------------

--
-- Table structure for table `chat_doctor_history`
--

CREATE TABLE `chat_doctor_history` (
  `history_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `old_user_id` int(11) DEFAULT NULL,
  `new_user_id` int(11) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chat_doctor_history`
--

INSERT INTO `chat_doctor_history` (`history_id`, `patient_id`, `old_user_id`, `new_user_id`, `active_flag`) VALUES
(1, 1, 5, 10, 0),
(2, 1, 10, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat_room`
--

CREATE TABLE `chat_room` (
  `chat_no` int(11) NOT NULL,
  `chat_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id_display` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `patient_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_id_display` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `recent_message` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `active_flag` tinyint(1) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chat_room`
--

INSERT INTO `chat_room` (`chat_no`, `chat_name`, `user_id`, `user_id_display`, `patient_id`, `patient_id_display`, `message_data`, `recent_message`, `active_flag`, `update_date`) VALUES
(1, '1_12', '12', 'นาย พลกฤต แก้วมูล', '1', 'นาง สายสวาท มั่งมูล', '[{\"chatroom\":\"1970_12\",\"username\":\"1\",\"message\":\"hi hi\",\"messageDate\":\"15-08-2020 12:49\"},{\"chatroom\":\"1970_12\",\"username\":\"1\",\"message\":\"are you there ?\",\"messageDate\":\"15-08-2020 12:49\"},{\"chatroom\":\"1970_12\",\"username\":\"12\",\"message\":\"yes!\",\"messageDate\":\"15-08-2020 12:50\"},{\"chatroom\":\"1970_12\",\"username\":\"12\",\"message\":\"test message 123\",\"messageDate\":\"15-08-2020 01:34\"},{\"chatroom\":\"1970_12\",\"username\":\"1\",\"message\":\"55555\",\"messageDate\":\"19-08-2020 10:06\"}]', '55555', 1, '2020-08-19 15:06:06'),
(2, '2_12', '12', 'นาย พลกฤต แก้วมูล', '2', 'นาง นฎกร ขันแก้ววงศ์', '', '', 1, '2020-08-07 17:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `painpoint_id` int(11) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ข้อมูลโรค';

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`id`, `type_id`, `painpoint_id`, `name`, `status`) VALUES
(2, 1, NULL, 'Angina', 1),
(3, 3, NULL, 'Head injury', 1),
(4, 3, NULL, 'Cerebral artery hemorrhage', 1),
(5, 1, NULL, 'Aneurysm', 1),
(6, 2, 1, 'TMJ dysfunction', 1),
(7, 2, 2, 'Impingement syndrome', 1),
(8, 2, 3, 'Tennis elbow', 1),
(9, 2, 4, 'Other2', 1),
(10, 2, 5, 'Osteoarthritis knee', 1),
(11, 2, 6, 'Trochanteric bursitis', 1),
(12, 2, 7, 'Sacroiliac dysfunction', 1),
(13, 2, 8, 'Ankle sprain', 1),
(14, 2, 9, 'Fracture upper extremities', 1),
(15, 4, NULL, 'Arthrogryposis', 1);

-- --------------------------------------------------------

--
-- Table structure for table `history_chat`
--

CREATE TABLE `history_chat` (
  `id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `group_chat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indi_chest`
--

CREATE TABLE `indi_chest` (
  `record_id` int(11) NOT NULL,
  `mwt6_o2` int(11) DEFAULT NULL,
  `mwt6_hr` int(11) DEFAULT NULL,
  `mwt6_distance` int(11) DEFAULT NULL,
  `mwt6_note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vital_blood` int(11) DEFAULT NULL,
  `vital_hr` int(11) DEFAULT NULL,
  `vital_res` int(11) DEFAULT NULL,
  `vital_o2` int(11) DEFAULT NULL,
  `tpag` int(11) DEFAULT NULL,
  `copd` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Indicators Chest';

--
-- Dumping data for table `indi_chest`
--

INSERT INTO `indi_chest` (`record_id`, `mwt6_o2`, `mwt6_hr`, `mwt6_distance`, `mwt6_note`, `vital_blood`, `vital_hr`, `vital_res`, `vital_o2`, `tpag`, `copd`) VALUES
(32, 85, 95, 31, NULL, 143, 90, 213, 24, 53, 35),
(33, 88, 24, 42, NULL, 8, 7, 9, 7, 9, 9),
(34, 34, 25, 25, NULL, 12, 1212, 2, 32, 26, 53),
(37, 70, 120, 15, NULL, 50, 20, 80, 70, 100, 20),
(38, 22, 22, 22, NULL, 2, 88, 88, 45, 60, 70),
(42, 70, 100, 10, NULL, 50, 100, 80, 100, 100, 100),
(43, 80, 110, 20, NULL, 129, 129, 100, 100, 90, 130),
(47, 5, 150, 5, 'ไม่มี', 161, 101, 20, 95, 50, 410),
(58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `indi_neuro`
--

CREATE TABLE `indi_neuro` (
  `record_id` int(11) NOT NULL,
  `barthel` int(11) DEFAULT NULL,
  `mwt10_o2` int(11) DEFAULT NULL,
  `mwt10_hr` int(11) DEFAULT NULL,
  `mwt10_time` int(11) DEFAULT NULL,
  `berg` int(11) DEFAULT NULL,
  `mas` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Indicators Neuro';

--
-- Dumping data for table `indi_neuro`
--

INSERT INTO `indi_neuro` (`record_id`, `barthel`, `mwt10_o2`, `mwt10_hr`, `mwt10_time`, `berg`, `mas`) VALUES
(35, 13, 80, 100, 10, 29, '2 3 3 2 6 5 4 3'),
(36, 12, 80, 80, 8, 42, '6 5 6 4 4 6 5 2'),
(39, 15, 80, 88, 15, 33, '5 5 5 6 2 4 3 3'),
(45, 13, 120, 100, 5, 32, '3 5 3 6 6 6 4 2'),
(46, 14, 100, 100, 6, 23, '4 5 3 6 3 4 4 6'),
(48, 14, 50, 100, 52, 43, '1 4 6 6 4 5 3 1'),
(50, 18, 12, 13, 14, 45, '6 4 5 6 5 2 3 5'),
(54, 1, NULL, NULL, NULL, 0, '0 3 0 0 0 0 0 0'),
(55, 1, NULL, NULL, NULL, 2, '0 0 0 0 0 0 0 0');

-- --------------------------------------------------------

--
-- Table structure for table `indi_ortho`
--

CREATE TABLE `indi_ortho` (
  `record_id` int(11) NOT NULL,
  `pain_scale` int(11) DEFAULT NULL,
  `mmt_tl` int(11) DEFAULT NULL COMMENT 'MMT Top Left',
  `mmt_tr` int(11) DEFAULT NULL COMMENT 'Top Right',
  `mmt_bl` int(11) DEFAULT NULL COMMENT 'Bottom Left',
  `mmt_br` int(11) DEFAULT NULL COMMENT 'Bottom Right',
  `mmt_note` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rom_area` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rom_lr` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Left or Right',
  `rom_direction_1` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rom_degree_1` int(11) DEFAULT NULL,
  `rom_direction_2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rom_degree_2` int(11) DEFAULT NULL,
  `rom_direction_3` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rom_degree_3` int(11) DEFAULT NULL,
  `rom_direction_4` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rom_degree_4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Indicators Ortho';

--
-- Dumping data for table `indi_ortho`
--

INSERT INTO `indi_ortho` (`record_id`, `pain_scale`, `mmt_tl`, `mmt_tr`, `mmt_bl`, `mmt_br`, `mmt_note`, `rom_area`, `rom_lr`, `rom_direction_1`, `rom_degree_1`, `rom_direction_2`, `rom_degree_2`, `rom_direction_3`, `rom_degree_3`, `rom_direction_4`, `rom_degree_4`) VALUES
(40, 6, 3, 0, 0, 0, NULL, 'Elbow', 'left', 'Flexion', 35, 'Adduction', 40, NULL, NULL, NULL, NULL),
(41, 8, 0, 2, 0, 3, NULL, 'Hip', 'right', 'Flexion', 15, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 5, 2, 3, 4, 5, NULL, 'Hip', 'right', 'Adduction', 5, 'Abduction', 5, NULL, NULL, NULL, NULL),
(57, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mapping_group_chat`
--

CREATE TABLE `mapping_group_chat` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapping_group_chat`
--

INSERT INTO `mapping_group_chat` (`id`, `patient_id`, `user_id`, `code`, `created_date`) VALUES
(1, '3', '2', 'dvtaczz54', '2020-04-28 23:49:03'),
(2, '3', '1', '9vzvqqa05', '2020-04-29 16:09:19'),
(3, '3', '1', '9rhjfqzzo', '2020-04-29 16:13:54'),
(4, '3', '1', 'iunk3g7dl', '2020-04-29 16:14:16'),
(5, '3', '1', 'gj1c68q1o', '2020-04-29 16:16:21'),
(6, '3', '1', 'sisncqunu', '2020-04-29 16:32:37'),
(7, '1', '1', '1cdh1wj8o', '2020-04-29 17:45:41'),
(8, '1', '1', '8bg05xoq4', '2020-04-29 17:47:23'),
(9, '8', '1', 'z1og4epkv', '2020-04-29 17:47:58'),
(10, '8', '1', 'untdq87du', '2020-05-10 21:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `pain_point`
--

CREATE TABLE `pain_point` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='บริเวณที่เจ็บปวด สำหรับบางประเภทโรค';

--
-- Dumping data for table `pain_point`
--

INSERT INTO `pain_point` (`id`, `type_id`, `name`, `status`) VALUES
(1, 2, 'Neck pain', 1),
(2, 2, 'Shoulder pain', 1),
(3, 2, 'Elbow', 1),
(4, 2, 'Upper and lower back', 1),
(5, 2, 'Knee', 1),
(6, 2, 'Hip', 1),
(7, 2, 'Pelvic', 1),
(8, 2, 'Ankle/Foot', 1),
(9, 2, 'Other', 0);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `HN` int(10) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` datetime NOT NULL,
  `phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `updated_date` datetime NOT NULL,
  `last_record_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='สำหรับเก็บข้อมูลประวัติผู้ป่วย';

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `HN`, `title`, `firstname`, `lastname`, `birthdate`, `phone`, `address`, `updated_date`, `last_record_id`) VALUES
(1, 1970, 'นาง', 'สายสวาท', 'มั่งมูล', '1996-02-14 00:00:00', '0812345678', '10/3', '2020-04-29 17:47:23', 57),
(2, 1074, 'นาง', 'นฎกร', 'ขันแก้ววงศ์', '1962-09-15 00:00:00', '0812345671', '10/6666', '2019-12-03 22:45:02', 22),
(3, 1671, 'นาง', 'มัณฑนา', 'นราดิศร', '1990-09-03 00:00:00', '0812354689', '1231/212', '2020-04-29 16:32:37', 55),
(4, 2235, 'นาย', 'สุภาพ', 'คำขาว', '1980-09-05 00:00:00', '0813156422', '18/1', '0000-00-00 00:00:00', NULL),
(6, 9999, 'นาย', 'ชวิน', 'อิง', '1997-07-06 00:00:00', '0869282562', '10/3 หมู่ ๅ', '2019-11-10 16:31:51', 15),
(7, 7885, 'นาย', 'พงค์ศักดิ์', 'มานะ', '1979-06-01 00:00:00', '0886255212', '225', '2020-03-25 14:16:52', 39),
(8, 2543, 'นาย', 'อภิชาติ', 'จันทร์เพ็ญศรี', '1998-01-04 00:00:00', '0826348120', 'เชียงราย', '2020-05-10 21:11:01', 59),
(9, 2537, 'Mr.', 'John', 'Arno', '1994-08-02 00:00:00', '0987654321', 'Chiangrai', '2020-04-14 18:22:55', 46),
(10, 55, 'นาย', 'น', 'น', '2020-04-02 00:00:00', '0852541236', 'bangkok', '2020-04-22 15:11:36', 49);

-- --------------------------------------------------------

--
-- Table structure for table `patient_record`
--

CREATE TABLE `patient_record` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `patient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `disease_id` int(11) NOT NULL,
  `s_text` tinytext COLLATE utf8_unicode_ci,
  `o_text` tinytext COLLATE utf8_unicode_ci,
  `a_text` tinytext COLLATE utf8_unicode_ci,
  `p_text` tinytext COLLATE utf8_unicode_ci,
  `cost` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `evaluate_score` int(11) DEFAULT NULL,
  `evaluate_note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='บันทึกอาการผู้ป่วยแต่ละครั้ง';

--
-- Dumping data for table `patient_record`
--

INSERT INTO `patient_record` (`id`, `date`, `patient_id`, `user_id`, `disease_id`, `s_text`, `o_text`, `a_text`, `p_text`, `cost`, `note`, `evaluate_score`, `evaluate_note`) VALUES
(16, '2019-11-03 06:29:59', 7, 3, 5, 'อาการใจสั่น', 'ร่างกายปกติ', 'ไม่แพ้ยา', 'ควรใช้ยา A', 1025, NULL, NULL, NULL),
(17, '2019-11-11 06:32:33', 7, 1, 9, 'ปกติ', 'ปกติ', 'ไม่ต้องใช้ยา', 'นัดหมายครั้งหน้า', 521, NULL, NULL, NULL),
(18, '2019-11-02 23:52:44', 7, 2, 5, 'a', 's', 'a', 'd', 11, NULL, NULL, NULL),
(19, '2019-11-08 23:58:27', 7, 2, 2, 'a', 's', 'w', 'e', 12, NULL, NULL, NULL),
(20, '2019-11-24 00:00:34', 7, 2, 5, 's', 'a', 'd', 'e', 123, NULL, NULL, NULL),
(21, '2019-11-26 15:24:17', 7, 3, 3, 'Test', 'Test', 'Test', 'Test', 450, 'หลังหัก', NULL, NULL),
(22, '2019-12-03 22:41:32', 2, 4, 5, 'รู้สึกปวดที่แผลผ่าตัด \"เมื่อคืนน้อยไม่ค่อยหลับเนื่องจากเกิดอาการปวด\" ', 'ผู้รับบริการหลังผ่าตัด 5 วัน\nชีพจร 88 ครั้ง/นาที', 'แบบแผนการนอนเปลี่ยนแปลงเนื่องจากปวดแผล', 'ให้การพยาบาลอย่างนุ่มนวด ปรับสิ่งแวดล้อมให้ผ่อนคลายเหมาะแก่การนอนหลับ', 200, NULL, NULL, NULL),
(23, '2019-12-03 22:45:38', 3, 4, 2, 'รู้สึกปวดที่ข้อมือและข้อต่อ \"เมื่อคืนน้อยไม่ค่อยหลับเนื่องจากเกิดอาการปวด\" \n', 'ผู้รับบริการยกของหนักมาเป็นเวลา 3 วันก่อนเข้ารับบริการ', 'เปลี่ยนแปลงแบบแผนการนอนเนื่องจากปวดตามข้อ', 'ให้ยุติการยกของหนัก ติดตามอาการตลอด 7 วัน', 500, NULL, NULL, NULL),
(24, '2019-12-03 23:16:25', 3, 1, 5, 'ปวดบริเวณหลังคอเป็นระยะเวลาหลายวัน', 'ผู้รับบริการเปลี่ยนหมอนใบใหม่นอนไม่ถนัด', 'เปลี่ยนแปลงรูปแบบการนอน', 'ให้เปลี่ยนรูปแบบการนอน หอผ้ามาหนุนคอ', 300, NULL, NULL, NULL),
(25, '2019-12-04 09:39:13', 8, 3, 9, 'รู้สึกปวดที่แผลผ่าตัด เมื่อคืนนอนไม่ค่อยหลับ ปวดบางทีต้องลุกนั่งงอตัวไว้', 'ผู้รับบริการหลังผ่าตัด 1 วัน มีแผลผ่าตัด Midline line ไม่มี discharge ซึม', 'แบบแผนการนอนเปลี่ยนแปลง นอนไม่หลับเนื่องจากปวดแผลผ่าตัด', 'ให้การพยาบาลอย่างนุ่มนวล ให้ยาระงับปวดตามแผนการรักษา', 600, 'ผู้ป่วยหลังผ่าตัด', NULL, NULL),
(26, '2019-12-04 10:04:17', 8, 3, 3, 'ปวดบริเวณหลังคอเป็นระยะเวลาหลายวัน', 'ผู้รับบริการเปลี่ยนหมอนใบใหม่นอนไม่ถนัด', 'เปลี่ยนแปลงรูปแบบการนอน', 'ให้เปลี่ยนรูปแบบการนอน หอผ้ามาหนุนคอ', 600, NULL, NULL, NULL),
(27, '2019-12-04 10:34:53', 8, 3, 3, 'Test', 'Test', 'Test', 'Test', 500, NULL, NULL, NULL),
(28, '2020-02-05 14:09:21', 8, 3, 3, 'rty', 'rwtr', 'ytwret', 'retwrtw', 600, NULL, NULL, NULL),
(29, '2020-02-14 15:15:10', 8, 3, 6, 'rfsdf', 'dfssf', 'svfs', 'vsds', 8000, NULL, NULL, NULL),
(30, '2020-02-14 15:36:55', 8, 3, 3, 'df', 'gdg', 'ge', 'df', 700, NULL, NULL, NULL),
(31, '2020-02-24 21:48:52', 8, 1, 4, 's', 'a', 's', 's', 123, 'ระวังข้อมือขวา', NULL, NULL),
(32, '2020-03-09 20:24:30', 8, 1, 5, 'saa', 'e', 'a', 'q', 315, NULL, NULL, NULL),
(33, '2020-03-10 19:23:04', 8, 1, 5, 'n', ',', 'm', 'k', 323, NULL, NULL, NULL),
(34, '2020-03-12 11:36:47', 8, 1, 5, 's', 's', 's', 's', 123, NULL, 4, 'ออกกำลังกายให้มากขึ้น'),
(35, '2020-03-12 16:35:49', 9, 3, 3, 'Test', 'Test', 'Test', 'Test', 1000, NULL, 3, 'อย่าเดินเร็วมากนะครับ หมอเป็นห่วง'),
(36, '2020-03-16 10:07:24', 9, 3, 3, 'test', 'test', 'test', 'test', 700, NULL, 3, 'ออกกำลังกายเยอะๆนะ'),
(37, '2020-03-20 11:47:44', 9, 3, 2, 'test', 'test', 'test', 'test', 500, 'ปวดหัว', 1, 'อาการแย่มากๆ'),
(38, '2020-03-04 14:12:48', 2, 12, 2, 'a', 'a', 'a', 'a', 100, NULL, 4, '555555'),
(39, '2020-03-25 14:15:26', 2, 12, 3, 'test', 'a', 'a', 'p_text', 90, NULL, 5, NULL),
(40, '2020-03-25 14:17:06', 1, 12, 8, 'a', 'a', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'a', 70, NULL, 4, '5555555'),
(41, '2020-04-02 09:11:44', 1, 1, 8, 'S', 'O', 'A', 'P', 150, NULL, 4, NULL),
(42, '2020-04-02 09:14:13', 9, 3, 2, 'ทดสอบ', 'ทดสอบ', 'ทดสอบ', 'ทดสอบ', 700, NULL, 5, 'อาการดีขึ้นมากครับ'),
(43, '2020-04-02 13:42:12', 9, 3, 2, 'Test', 'Test', 'Test', 'Test', 1000, 'ผู้ป้วยผ่าตัดใหม่', 4, 'ทดสอบ'),
(44, '2020-04-11 22:26:47', 9, 5, 15, '-', '-', '-', '-', 500, '-', 4, 'ดีมั้ก'),
(45, '2020-04-14 14:17:06', 9, 3, 3, 'Test', 'Test', 'Test', 'Test', 700, NULL, 4, 'ออกกำลังกายเยอะๆนะ'),
(46, '2020-04-14 18:17:42', 9, 3, 3, 't', 't', 't', 'tt', 1000, '', 5, 'ทดสอบ'),
(47, '2020-04-21 18:07:31', 3, 5, 5, '-', '-', '-', '-', 10, NULL, 5, NULL),
(48, '2020-04-22 12:15:47', 3, 5, 3, '-', '-', '-', '-', 500, NULL, 6, NULL),
(49, '2020-04-22 14:03:25', 10, 5, 8, '-', '-', '-', '-', 500, NULL, 5, NULL),
(50, '2020-04-28 23:47:59', 3, 2, 3, 'd', 'd', 'd', 'd', 123, NULL, 6, NULL),
(51, '2020-04-29 16:08:47', 3, 1, 3, 'w', 'q', 'w', 'e', 123, NULL, 5, NULL),
(52, '2020-04-29 16:08:47', 3, 1, 3, 'w', 'q', 'w', 'e', 123, NULL, 5, NULL),
(53, '2020-04-29 16:08:47', 3, 1, 3, 'w', 'q', 'w', 'e', 123, NULL, 5, NULL),
(54, '2020-04-29 16:08:47', 3, 1, 3, 'w', 'q', 'w', 'e', 123, NULL, 5, NULL),
(55, '2020-04-29 16:16:45', 3, 1, 3, 'e', 'e', 'e', 'e', 13, NULL, 7, NULL),
(56, '2020-04-29 17:45:14', 1, 1, 8, 'e', 'e', 'e', 'e', 123, NULL, 6, NULL),
(57, '2020-04-29 17:47:04', 1, 1, 8, 's', 'q', 'a', 'e', 333, NULL, 6, NULL),
(58, '2020-04-29 17:47:37', 8, 1, 5, 'dw', 'e', 'e', 'e', 31, NULL, 5, NULL),
(59, '2020-05-10 21:10:39', 8, 1, 5, NULL, NULL, NULL, NULL, 12, NULL, 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `record_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางนัดหมาย';

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `date`, `record_id`) VALUES
(6, '2020-06-26 06:33:55', 17),
(7, '2019-11-22 23:54:40', 18),
(8, '2019-11-22 23:58:48', 19),
(9, '2019-11-27 00:00:59', 20),
(10, '2019-11-30 14:00:00', 21),
(11, '2019-12-04 10:00:00', 22),
(12, '2019-12-03 22:47:31', 23),
(13, '2019-12-06 00:00:00', 24),
(14, '2019-12-26 08:30:00', 25),
(15, '2020-02-08 08:00:00', 26),
(16, '2019-12-28 09:00:00', 27),
(17, '2020-02-21 11:00:00', 28),
(18, '2020-02-21 11:00:00', 29),
(19, '2020-02-26 14:23:00', 30),
(20, '2020-02-26 08:20:00', 31),
(21, '2020-03-18 08:00:00', 32),
(22, '2020-03-12 08:00:00', 33),
(23, '2020-03-31 00:00:00', 35),
(24, '2020-03-30 10:00:00', 36),
(25, '2020-04-06 09:00:00', 37),
(26, '2020-04-10 08:00:00', 41),
(27, '2020-04-16 00:00:00', 42),
(28, '2020-04-30 11:00:00', 43),
(29, '2020-04-22 08:05:00', 44),
(30, '2020-04-30 09:00:00', 57),
(31, '2020-04-27 08:00:00', 46);

-- --------------------------------------------------------

--
-- Table structure for table `therapy`
--

CREATE TABLE `therapy` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `frequency` tinytext COLLATE utf8_unicode_ci,
  `intensity` tinytext COLLATE utf8_unicode_ci,
  `time` tinytext COLLATE utf8_unicode_ci,
  `type` tinytext COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ข้อมูลการทำกายภาพบำบัดที่บ้าน';

--
-- Dumping data for table `therapy`
--

INSERT INTO `therapy` (`id`, `name`, `link`, `detail`, `frequency`, `intensity`, `time`, `type`, `status`) VALUES
(1, 'กายภาพบำบัดผู้ป่วยติดเตียง', 'https://www.youtube.com/watch?v=VRh5OyhLvLQ', 'ท่ากายภาพบำบัดสำหรับผู้ป่วยติดเตียง', '3-5 ครั้งต่อสัปดาห์', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียด', 1),
(2, 'ออกกำลังกายแก้ปวดหลัง', 'https://www.youtube.com/watch?v=Sf_zlwYT3sE', 'ปวดเอว หมอนรองกระดูกทับเส้นประสาท เป็นโรคยอดฮิตของคลินิกเราเลยครับ ตามคลิปเป็นท่าออกกำลังกายง่ายๆ ผู้ป่วยสามารถทำเองที่บ้านได้เพื่อลดอาการปวดหลัง ปวดเอวได้ โดยผู้ป่วยควรทำอย่างสม่ำเสมอและถูกวิธีจะช่วยให้การรักษาได้ผลเร็วขึ้นครับ\nปวดคอ ปวดไหล่ ไหล่ติด ปวดเข่า ปวดหลัง ปวดเอว หมอนรองกระดูกกดทับเส้นประสาท รักษาได้ด้วยกายภาพบำบัด จัดกระดูก ทางเลือกใหม่ของการรักษา \"ไม่ฉีดยา ไม่ผ่าตัด\" ปรึกษาเราสิครับ', '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล', 1),
(3, 'กายภาพเพิ่มความแข็งแรง', 'https://www.youtube.com/watch?v=gV8z5Hpb-sc', 'ท่ากายภาพเพิ่มความแข็งแรง', '2 ครั้งต่อสัปดาห์', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `therapy_exercise`
--

CREATE TABLE `therapy_exercise` (
  `id` int(11) NOT NULL,
  `tp_id` int(11) NOT NULL,
  `joint` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `therapy_exercise`
--

INSERT INTO `therapy_exercise` (`id`, `tp_id`, `joint`, `time`) VALUES
(3, 39, '[{\"score\":0.966004490852356,\"part\":\"nose\",\"x\":0.4469323456287384,\"y\":0.20975077152252197},{\"score\":0.9449368119239807,\"part\":\"leftEye\",\"x\":0.4537048935890198,\"y\":0.20145870745182037},{\"score\":0.9546583294868469,\"part\":\"rightEye\",\"x\":0.43623074889183044,\"y\":0.19980256259441376},{\"score\":0.6251619458198547,\"part\":\"leftEar\",\"x\":0.46609944105148315,\"y\":0.21058174967765808},{\"score\":0.841844379901886,\"part\":\"rightEar\",\"x\":0.4197671711444855,\"y\":0.2073301374912262},{\"score\":0.9899086952209473,\"part\":\"leftShoulder\",\"x\":0.4886588156223297,\"y\":0.24199964106082916},{\"score\":0.9867128729820251,\"part\":\"rightShoulder\",\"x\":0.3945179283618927,\"y\":0.253132164478302},{\"score\":0.9197520613670349,\"part\":\"leftElbow\",\"x\":0.5467125177383423,\"y\":0.2533644735813141},{\"score\":0.916425347328186,\"part\":\"rightElbow\",\"x\":0.32360410690307617,\"y\":0.23771199584007263},{\"score\":0.510854184627533,\"part\":\"leftWrist\",\"x\":0.6075173020362854,\"y\":0.256784051656723},{\"score\":0.31690487265586853,\"part\":\"rightWrist\",\"x\":0.27229735255241394,\"y\":0.24405409395694733},{\"score\":0.9921932220458984,\"part\":\"leftHip\",\"x\":0.5035410523414612,\"y\":0.3500528335571289},{\"score\":0.9974006414413452,\"part\":\"rightHip\",\"x\":0.4247724413871765,\"y\":0.3624703586101532},{\"score\":0.9414516091346741,\"part\":\"leftKnee\",\"x\":0.5819442868232727,\"y\":0.4372367560863495},{\"score\":0.977408766746521,\"part\":\"rightKnee\",\"x\":0.43052902817726135,\"y\":0.47079554200172424},{\"score\":0.7748646140098572,\"part\":\"leftAnkle\",\"x\":0.6738555431365967,\"y\":0.5273860692977905},{\"score\":0.8969082832336426,\"part\":\"rightAnkle\",\"x\":0.44402751326560974,\"y\":0.5516552329063416},{\"score\":0.9873713850975037,\"part\":\"nose\",\"x\":0.413528174161911,\"y\":0.2225322127342224},{\"score\":0.960503339767456,\"part\":\"leftEye\",\"x\":0.42150816321372986,\"y\":0.21614646911621094},{\"score\":0.9756090641021729,\"part\":\"rightEye\",\"x\":0.4016166627407074,\"y\":0.21914872527122498},{\"score\":0.6838582754135132,\"part\":\"leftEar\",\"x\":0.43726691603660583,\"y\":0.22110801935195923},{\"score\":0.7683984041213989,\"part\":\"rightEar\",\"x\":0.3865281641483307,\"y\":0.2253303825855255},{\"score\":0.9919024705886841,\"part\":\"leftShoulder\",\"x\":0.45469412207603455,\"y\":0.25595393776893616},{\"score\":0.9849321842193604,\"part\":\"rightShoulder\",\"x\":0.3674014210700989,\"y\":0.25781315565109253},{\"score\":0.8758215308189392,\"part\":\"leftElbow\",\"x\":0.5049126744270325,\"y\":0.2693536579608917},{\"score\":0.7848195433616638,\"part\":\"rightElbow\",\"x\":0.3266170918941498,\"y\":0.265906423330307},{\"score\":0.9383324980735779,\"part\":\"leftWrist\",\"x\":0.5269564390182495,\"y\":0.2769538462162018},{\"score\":0.33318018913269043,\"part\":\"rightWrist\",\"x\":0.31902647018432617,\"y\":0.27510225772857666},{\"score\":0.9929587244987488,\"part\":\"leftHip\",\"x\":0.4674649238586426,\"y\":0.3627415895462036},{\"score\":0.998386800289154,\"part\":\"rightHip\",\"x\":0.39527779817581177,\"y\":0.3752482533454895},{\"score\":0.7378824353218079,\"part\":\"leftKnee\",\"x\":0.5436888337135315,\"y\":0.4081277847290039},{\"score\":0.9651931524276733,\"part\":\"rightKnee\",\"x\":0.3935229778289795,\"y\":0.4547070264816284},{\"score\":0.5484806299209595,\"part\":\"leftAnkle\",\"x\":0.6269736886024475,\"y\":0.5128841996192932},{\"score\":0.896641194820404,\"part\":\"rightAnkle\",\"x\":0.411447137594223,\"y\":0.5527580976486206},{\"score\":0.9918909668922424,\"part\":\"nose\",\"x\":0.4081014394760132,\"y\":0.2239958494901657},{\"score\":0.9741234183311462,\"part\":\"leftEye\",\"x\":0.41256895661354065,\"y\":0.21933729946613312},{\"score\":0.9781333208084106,\"part\":\"rightEye\",\"x\":0.39757654070854187,\"y\":0.21842843294143677},{\"score\":0.6788531541824341,\"part\":\"leftEar\",\"x\":0.4274384379386902,\"y\":0.21500715613365173},{\"score\":0.7315439581871033,\"part\":\"rightEar\",\"x\":0.38234731554985046,\"y\":0.22430813312530518},{\"score\":0.980885922908783,\"part\":\"leftShoulder\",\"x\":0.4441685378551483,\"y\":0.2618308961391449},{\"score\":0.9929038882255554,\"part\":\"rightShoulder\",\"x\":0.3623855412006378,\"y\":0.2613620162010193},{\"score\":0.8559033870697021,\"part\":\"leftElbow\",\"x\":0.5086362361907959,\"y\":0.2795940041542053},{\"score\":0.8494195938110352,\"part\":\"rightElbow\",\"x\":0.31379643082618713,\"y\":0.2684383690357208},{\"score\":0.9186362624168396,\"part\":\"leftWrist\",\"x\":0.5353680849075317,\"y\":0.27954068779945374},{\"score\":0.44660258293151855,\"part\":\"rightWrist\",\"x\":0.2994803488254547,\"y\":0.27051129937171936},{\"score\":0.9876419901847839,\"part\":\"leftHip\",\"x\":0.46074578166007996,\"y\":0.36425790190696716},{\"score\":0.998652994632721,\"part\":\"rightHip\",\"x\":0.3898681402206421,\"y\":0.3785247206687927},{\"score\":0.5541520118713379,\"part\":\"leftKnee\",\"x\":0.5369992256164551,\"y\":0.4102171063423157},{\"score\":0.9864753484725952,\"part\":\"rightKnee\",\"x\":0.39252910017967224,\"y\":0.47740328311920166},{\"score\":0.4211339056491852,\"part\":\"leftAnkle\",\"x\":0.6069450378417969,\"y\":0.5164088606834412},{\"score\":0.8818228244781494,\"part\":\"rightAnkle\",\"x\":0.4072197675704956,\"y\":0.5726999640464783},{\"score\":0.9840991497039795,\"part\":\"nose\",\"x\":0.40616002678871155,\"y\":0.23205922544002533},{\"score\":0.9768111705780029,\"part\":\"leftEye\",\"x\":0.414433091878891,\"y\":0.2228383868932724},{\"score\":0.986858069896698,\"part\":\"rightEye\",\"x\":0.3971289098262787,\"y\":0.22252994775772095},{\"score\":0.8110578656196594,\"part\":\"leftEar\",\"x\":0.4292519688606262,\"y\":0.2200344353914261},{\"score\":0.7397043704986572,\"part\":\"rightEar\",\"x\":0.38207370042800903,\"y\":0.2241230010986328},{\"score\":0.9751519560813904,\"part\":\"leftShoulder\",\"x\":0.4499973654747009,\"y\":0.2608780264854431},{\"score\":0.975009024143219,\"part\":\"rightShoulder\",\"x\":0.3615182042121887,\"y\":0.25370660424232483},{\"score\":0.7207930088043213,\"part\":\"leftElbow\",\"x\":0.529736340045929,\"y\":0.27170529961586},{\"score\":0.7643400430679321,\"part\":\"rightElbow\",\"x\":0.3192703425884247,\"y\":0.27524450421333313},{\"score\":0.9341297149658203,\"part\":\"leftWrist\",\"x\":0.5324792861938477,\"y\":0.27534377574920654},{\"score\":0.3472636044025421,\"part\":\"rightWrist\",\"x\":0.3055284917354584,\"y\":0.2742135226726532},{\"score\":0.9879649877548218,\"part\":\"leftHip\",\"x\":0.4647185206413269,\"y\":0.3657267987728119},{\"score\":0.99784916639328,\"part\":\"rightHip\",\"x\":0.3890450894832611,\"y\":0.38102713227272034},{\"score\":0.6744865775108337,\"part\":\"leftKnee\",\"x\":0.5443466901779175,\"y\":0.4243972599506378},{\"score\":0.9461240768432617,\"part\":\"rightKnee\",\"x\":0.397719144821167,\"y\":0.4848348796367645},{\"score\":0.5226620435714722,\"part\":\"leftAnkle\",\"x\":0.621606171131134,\"y\":0.5174816250801086},{\"score\":0.8148654699325562,\"part\":\"rightAnkle\",\"x\":0.40182214975357056,\"y\":0.5624232292175293},{\"score\":0.9913791418075562,\"part\":\"nose\",\"x\":0.4117303490638733,\"y\":0.22969016432762146},{\"score\":0.976088285446167,\"part\":\"leftEye\",\"x\":0.42151787877082825,\"y\":0.21805475652217865},{\"score\":0.9868642091751099,\"part\":\"rightEye\",\"x\":0.4019133746623993,\"y\":0.22335055470466614},{\"score\":0.7152984738349915,\"part\":\"leftEar\",\"x\":0.43713080883026123,\"y\":0.222085103392601},{\"score\":0.724113941192627,\"part\":\"rightEar\",\"x\":0.3883415758609772,\"y\":0.22984515130519867},{\"score\":0.9563918709754944,\"part\":\"leftShoulder\",\"x\":0.44707468152046204,\"y\":0.24646899104118347},{\"score\":0.9819765090942383,\"part\":\"rightShoulder\",\"x\":0.3630486726760864,\"y\":0.25603461265563965},{\"score\":0.7882824540138245,\"part\":\"leftElbow\",\"x\":0.5012509822845459,\"y\":0.27879902720451355},{\"score\":0.7948399186134338,\"part\":\"rightElbow\",\"x\":0.3121604025363922,\"y\":0.2820369303226471},{\"score\":0.9629458785057068,\"part\":\"leftWrist\",\"x\":0.5200086236000061,\"y\":0.2846989035606384},{\"score\":0.7205105423927307,\"part\":\"rightWrist\",\"x\":0.27763915061950684,\"y\":0.2755165100097656},{\"score\":0.9920073747634888,\"part\":\"leftHip\",\"x\":0.46391817927360535,\"y\":0.36176836490631104},{\"score\":0.9981986284255981,\"part\":\"rightHip\",\"x\":0.39162153005599976,\"y\":0.37926289439201355},{\"score\":0.4960345923900604,\"part\":\"leftKnee\",\"x\":0.5413816571235657,\"y\":0.42107725143432617},{\"score\":0.9721139669418335,\"part\":\"rightKnee\",\"x\":0.3980252742767334,\"y\":0.4680861234664917},{\"score\":0.3331794738769531,\"part\":\"leftAnkle\",\"x\":0.6193287372589111,\"y\":0.5145906209945679},{\"score\":0.8640167713165283,\"part\":\"rightAnkle\",\"x\":0.40667715668678284,\"y\":0.5619810819625854},{\"score\":0.9940264821052551,\"part\":\"nose\",\"x\":0.40664124488830566,\"y\":0.2236795574426651},{\"score\":0.9758332371711731,\"part\":\"leftEye\",\"x\":0.412510484457016,\"y\":0.2147749960422516},{\"score\":0.9849939942359924,\"part\":\"rightEye\",\"x\":0.3948606550693512,\"y\":0.21718785166740417},{\"score\":0.6698257327079773,\"part\":\"leftEar\",\"x\":0.4213680624961853,\"y\":0.21800847351551056},{\"score\":0.7821416854858398,\"part\":\"rightEar\",\"x\":0.3777853548526764,\"y\":0.22156432271003723},{\"score\":0.9931473135948181,\"part\":\"leftShoulder\",\"x\":0.44608086347579956,\"y\":0.25832897424697876},{\"score\":0.975944459438324,\"part\":\"rightShoulder\",\"x\":0.3572092056274414,\"y\":0.2554069459438324},{\"score\":0.8932570219039917,\"part\":\"leftElbow\",\"x\":0.5094187259674072,\"y\":0.2795771360397339},{\"score\":0.9214925169944763,\"part\":\"rightElbow\",\"x\":0.2924022972583771,\"y\":0.273125022649765},{\"score\":0.9038227796554565,\"part\":\"leftWrist\",\"x\":0.5340707302093506,\"y\":0.28224819898605347},{\"score\":0.5396651029586792,\"part\":\"rightWrist\",\"x\":0.2928646206855774,\"y\":0.26383987069129944},{\"score\":0.9875029921531677,\"part\":\"leftHip\",\"x\":0.4526762366294861,\"y\":0.36879780888557434},{\"score\":0.9989294409751892,\"part\":\"rightHip\",\"x\":0.38684481382369995,\"y\":0.38578367233276367},{\"score\":0.7985901236534119,\"part\":\"leftKnee\",\"x\":0.5311399102210999,\"y\":0.41130530834198},{\"score\":0.9891127347946167,\"part\":\"rightKnee\",\"x\":0.3926883637905121,\"y\":0.4780194163322449},{\"score\":0.4834519624710083,\"part\":\"leftAnkle\",\"x\":0.6000393629074097,\"y\":0.5160325169563293},{\"score\":0.9510902762413025,\"part\":\"rightAnkle\",\"x\":0.3950038552284241,\"y\":0.5801292657852173},\"2020-08-07 23:18:04.765997\"]', '2020-08-07 23:31:31');
INSERT INTO `therapy_exercise` (`id`, `tp_id`, `joint`, `time`) VALUES
(11, 39, '[{\"score\":0.957468569278717,\"part\":\"nose\",\"x\":0.541395366191864,\"y\":0.2090679109096527},{\"score\":0.934902012348175,\"part\":\"leftEye\",\"x\":0.5471833944320679,\"y\":0.19922024011611938},{\"score\":0.9477971196174622,\"part\":\"rightEye\",\"x\":0.5305392146110535,\"y\":0.1982230842113495},{\"score\":0.64137202501297,\"part\":\"leftEar\",\"x\":0.5584481954574585,\"y\":0.2084193080663681},{\"score\":0.8546451330184937,\"part\":\"rightEar\",\"x\":0.511741578578949,\"y\":0.20388488471508026},{\"score\":0.9936420321464539,\"part\":\"leftShoulder\",\"x\":0.5848928093910217,\"y\":0.23583783209323883},{\"score\":0.9893990755081177,\"part\":\"rightShoulder\",\"x\":0.4828845262527466,\"y\":0.25062039494514465},{\"score\":0.9245638847351074,\"part\":\"leftElbow\",\"x\":0.6637228727340698,\"y\":0.25105923414230347},{\"score\":0.933347761631012,\"part\":\"rightElbow\",\"x\":0.4172365963459015,\"y\":0.25067389011383057},{\"score\":0.3981338143348694,\"part\":\"leftWrist\",\"x\":0.6930665969848633,\"y\":0.2593504786491394},{\"score\":0.2580355703830719,\"part\":\"rightWrist\",\"x\":0.36814916133880615,\"y\":0.25789952278137207},{\"score\":0.9826639890670776,\"part\":\"leftHip\",\"x\":0.5903263688087463,\"y\":0.3590812683105469},{\"score\":0.9968737959861755,\"part\":\"rightHip\",\"x\":0.5150578618049622,\"y\":0.3691999316215515},{\"score\":0.8575291037559509,\"part\":\"leftKnee\",\"x\":0.6759433746337891,\"y\":0.45306429266929626},{\"score\":0.9589740633964539,\"part\":\"rightKnee\",\"x\":0.5085411071777344,\"y\":0.46304887533187866},{\"score\":0.89206862449646,\"part\":\"leftAnkle\",\"x\":0.7473108768463135,\"y\":0.5397610068321228},{\"score\":0.9419155120849609,\"part\":\"rightAnkle\",\"x\":0.520967423915863,\"y\":0.5533962249755859},{\"score\":0.9876927137374878,\"part\":\"nose\",\"x\":0.4790862798690796,\"y\":0.21912160515785217},{\"score\":0.9334577322006226,\"part\":\"leftEye\",\"x\":0.48756837844848633,\"y\":0.2091919332742691},{\"score\":0.9716284275054932,\"part\":\"rightEye\",\"x\":0.4649955630302429,\"y\":0.20980055630207062},{\"score\":0.6203367114067078,\"part\":\"leftEar\",\"x\":0.49981626868247986,\"y\":0.20892931520938873},{\"score\":0.9157554507255554,\"part\":\"rightEar\",\"x\":0.4432215988636017,\"y\":0.21908600628376007},{\"score\":0.9879184365272522,\"part\":\"leftShoulder\",\"x\":0.5192716717720032,\"y\":0.2515489161014557},{\"score\":0.976390540599823,\"part\":\"rightShoulder\",\"x\":0.41692018508911133,\"y\":0.2538878321647644},{\"score\":0.8356140851974487,\"part\":\"leftElbow\",\"x\":0.59661865234375,\"y\":0.26143771409988403},{\"score\":0.6963281035423279,\"part\":\"rightElbow\",\"x\":0.3620075285434723,\"y\":0.25444042682647705},{\"score\":0.5075191855430603,\"part\":\"leftWrist\",\"x\":0.6664107441902161,\"y\":0.2592298984527588},{\"score\":0.1907362937927246,\"part\":\"rightWrist\",\"x\":0.33340156078338623,\"y\":0.2632623314857483},{\"score\":0.9846257567405701,\"part\":\"leftHip\",\"x\":0.5288131237030029,\"y\":0.3596576750278473},{\"score\":0.9944573640823364,\"part\":\"rightHip\",\"x\":0.4477893114089966,\"y\":0.3798966109752655},{\"score\":0.8052060604095459,\"part\":\"leftKnee\",\"x\":0.5893740653991699,\"y\":0.42427822947502136},{\"score\":0.9642969965934753,\"part\":\"rightKnee\",\"x\":0.4509637653827667,\"y\":0.4760504364967346},{\"score\":0.8252251148223877,\"part\":\"leftAnkle\",\"x\":0.6842635273933411,\"y\":0.5249699354171753},{\"score\":0.8863720297813416,\"part\":\"rightAnkle\",\"x\":0.4644157886505127,\"y\":0.5645883679389954},{\"score\":0.9957990646362305,\"part\":\"nose\",\"x\":0.4711940884590149,\"y\":0.21864409744739532},{\"score\":0.9744017124176025,\"part\":\"leftEye\",\"x\":0.4815264642238617,\"y\":0.21331042051315308},{\"score\":0.9870476126670837,\"part\":\"rightEye\",\"x\":0.46044373512268066,\"y\":0.2119438350200653},{\"score\":0.79607754945755,\"part\":\"leftEar\",\"x\":0.49247869849205017,\"y\":0.21783119440078735},{\"score\":0.9143416285514832,\"part\":\"rightEar\",\"x\":0.44037926197052,\"y\":0.21905352175235748},{\"score\":0.9930927753448486,\"part\":\"leftShoulder\",\"x\":0.5096144676208496,\"y\":0.24611882865428925},{\"score\":0.9925294518470764,\"part\":\"rightShoulder\",\"x\":0.41423487663269043,\"y\":0.25485050678253174},{\"score\":0.884458065032959,\"part\":\"leftElbow\",\"x\":0.5755804777145386,\"y\":0.2725835144519806},{\"score\":0.774817168712616,\"part\":\"rightElbow\",\"x\":0.36523696780204773,\"y\":0.2733432650566101},{\"score\":0.8847723007202148,\"part\":\"leftWrist\",\"x\":0.5878387093544006,\"y\":0.26791805028915405},{\"score\":0.43688011169433594,\"part\":\"rightWrist\",\"x\":0.38442739844322205,\"y\":0.2625342309474945},{\"score\":0.989393949508667,\"part\":\"leftHip\",\"x\":0.5209734439849854,\"y\":0.3649580776691437},{\"score\":0.9977500438690186,\"part\":\"rightHip\",\"x\":0.44106176495552063,\"y\":0.3772329092025757},{\"score\":0.744207501411438,\"part\":\"leftKnee\",\"x\":0.5993601083755493,\"y\":0.4188597798347473},{\"score\":0.9666064977645874,\"part\":\"rightKnee\",\"x\":0.44791093468666077,\"y\":0.4768817126750946},{\"score\":0.6571476459503174,\"part\":\"leftAnkle\",\"x\":0.6744601130485535,\"y\":0.5242441296577454},{\"score\":0.9324280023574829,\"part\":\"rightAnkle\",\"x\":0.4494940936565399,\"y\":0.5758669972419739},{\"score\":0.9871168732643127,\"part\":\"nose\",\"x\":0.4592410922050476,\"y\":0.2347351461648941},{\"score\":0.9662674069404602,\"part\":\"leftEye\",\"x\":0.4685216546058655,\"y\":0.22240278124809265},{\"score\":0.9788159132003784,\"part\":\"rightEye\",\"x\":0.44756558537483215,\"y\":0.22708696126937866},{\"score\":0.6867460012435913,\"part\":\"leftEar\",\"x\":0.48406556248664856,\"y\":0.22712428867816925},{\"score\":0.718204915523529,\"part\":\"rightEar\",\"x\":0.43335720896720886,\"y\":0.2320050448179245},{\"score\":0.9952205419540405,\"part\":\"leftShoulder\",\"x\":0.503445029258728,\"y\":0.2592032551765442},{\"score\":0.9941757917404175,\"part\":\"rightShoulder\",\"x\":0.4094260334968567,\"y\":0.2697221040725708},{\"score\":0.855725109577179,\"part\":\"leftElbow\",\"x\":0.5600189566612244,\"y\":0.28120407462120056},{\"score\":0.8528055548667908,\"part\":\"rightElbow\",\"x\":0.34141209721565247,\"y\":0.2767391502857208},{\"score\":0.7863455414772034,\"part\":\"leftWrist\",\"x\":0.5967838168144226,\"y\":0.2843742370605469},{\"score\":0.3924522399902344,\"part\":\"rightWrist\",\"x\":0.3048447370529175,\"y\":0.2789330780506134},{\"score\":0.9935527443885803,\"part\":\"leftHip\",\"x\":0.5133258700370789,\"y\":0.3823149502277374},{\"score\":0.9948882460594177,\"part\":\"rightHip\",\"x\":0.4368332326412201,\"y\":0.3965553343296051},{\"score\":0.8516682982444763,\"part\":\"leftKnee\",\"x\":0.6081116199493408,\"y\":0.4494009017944336},{\"score\":0.9682098627090454,\"part\":\"rightKnee\",\"x\":0.4435221552848816,\"y\":0.48802387714385986},{\"score\":0.6222476959228516,\"part\":\"leftAnkle\",\"x\":0.6644570827484131,\"y\":0.5454273819923401},{\"score\":0.9374707937240601,\"part\":\"rightAnkle\",\"x\":0.44230589270591736,\"y\":0.5788397789001465},{\"score\":0.9935293197631836,\"part\":\"nose\",\"x\":0.46660733222961426,\"y\":0.22970734536647797},{\"score\":0.9838093519210815,\"part\":\"leftEye\",\"x\":0.47516992688179016,\"y\":0.21682888269424438},{\"score\":0.9824528098106384,\"part\":\"rightEye\",\"x\":0.45475438237190247,\"y\":0.2196996510028839},{\"score\":0.8017563223838806,\"part\":\"leftEar\",\"x\":0.4923163652420044,\"y\":0.22093820571899414},{\"score\":0.8814288377761841,\"part\":\"rightEar\",\"x\":0.43929407000541687,\"y\":0.23028019070625305},{\"score\":0.9769587516784668,\"part\":\"leftShoulder\",\"x\":0.5002005100250244,\"y\":0.25270166993141174},{\"score\":0.9961365461349487,\"part\":\"rightShoulder\",\"x\":0.41126683354377747,\"y\":0.26791971921920776},{\"score\":0.9157481789588928,\"part\":\"leftElbow\",\"x\":0.5791252255439758,\"y\":0.26743924617767334},{\"score\":0.9228255748748779,\"part\":\"rightElbow\",\"x\":0.34216561913490295,\"y\":0.27136334776878357},{\"score\":0.9153009653091431,\"part\":\"leftWrist\",\"x\":0.6080008745193481,\"y\":0.2718982696533203},{\"score\":0.2984965145587921,\"part\":\"rightWrist\",\"x\":0.3316732943058014,\"y\":0.2646706998348236},{\"score\":0.9937947988510132,\"part\":\"leftHip\",\"x\":0.5214999914169312,\"y\":0.3716513514518738},{\"score\":0.9960586428642273,\"part\":\"rightHip\",\"x\":0.4394873082637787,\"y\":0.39231663942337036},{\"score\":0.9473215937614441,\"part\":\"leftKnee\",\"x\":0.598847508430481,\"y\":0.43849310278892517},{\"score\":0.9770584106445312,\"part\":\"rightKnee\",\"x\":0.44312262535095215,\"y\":0.47629228234291077},{\"score\":0.7817395925521851,\"part\":\"leftAnkle\",\"x\":0.6776795983314514,\"y\":0.5529316067695618},{\"score\":0.9585199356079102,\"part\":\"rightAnkle\",\"x\":0.44726765155792236,\"y\":0.5861689448356628},{\"score\":0.9940410852432251,\"part\":\"nose\",\"x\":0.4574545919895172,\"y\":0.23332479596138},{\"score\":0.9878708124160767,\"part\":\"leftEye\",\"x\":0.46684178709983826,\"y\":0.2223513275384903},{\"score\":0.9929285645484924,\"part\":\"rightEye\",\"x\":0.4472046494483948,\"y\":0.22512812912464142},{\"score\":0.7662529945373535,\"part\":\"leftEar\",\"x\":0.48126378655433655,\"y\":0.2263120859861374},{\"score\":0.7777310013771057,\"part\":\"rightEar\",\"x\":0.4328925311565399,\"y\":0.23083274066448212},{\"score\":0.9548158645629883,\"part\":\"leftShoulder\",\"x\":0.4984700083732605,\"y\":0.2580465078353882},{\"score\":0.9949852824211121,\"part\":\"rightShoulder\",\"x\":0.4098394513130188,\"y\":0.2642965018749237},{\"score\":0.7717412710189819,\"part\":\"leftElbow\",\"x\":0.5569412112236023,\"y\":0.27965736389160156},{\"score\":0.8230841159820557,\"part\":\"rightElbow\",\"x\":0.36129236221313477,\"y\":0.26576313376426697},{\"score\":0.9006486535072327,\"part\":\"leftWrist\",\"x\":0.5862909555435181,\"y\":0.28110331296920776},{\"score\":0.6609405279159546,\"part\":\"rightWrist\",\"x\":0.3265904188156128,\"y\":0.27564772963523865},{\"score\":0.996482253074646,\"part\":\"leftHip\",\"x\":0.5125582218170166,\"y\":0.3787667155265808},{\"score\":0.9982077479362488,\"part\":\"rightHip\",\"x\":0.43472710251808167,\"y\":0.39117124676704407},{\"score\":0.9383119940757751,\"part\":\"leftKnee\",\"x\":0.5913181900978088,\"y\":0.4313294291496277},{\"score\":0.9880836606025696,\"part\":\"rightKnee\",\"x\":0.4322233200073242,\"y\":0.4781869351863861},{\"score\":0.7340905070304871,\"part\":\"leftAnkle\",\"x\":0.6615797877311707,\"y\":0.542532742023468},{\"score\":0.9618473649024963,\"part\":\"rightAnkle\",\"x\":0.4331408739089966,\"y\":0.5665364861488342},{\"score\":0.9856582283973694,\"part\":\"nose\",\"x\":0.4527370035648346,\"y\":0.23233027756214142},{\"score\":0.9675524830818176,\"part\":\"leftEye\",\"x\":0.46292534470558167,\"y\":0.22218793630599976},{\"score\":0.98477703332901,\"part\":\"rightEye\",\"x\":0.4443725347518921,\"y\":0.22420014441013336},{\"score\":0.6905237436294556,\"part\":\"leftEar\",\"x\":0.47842171788215637,\"y\":0.2284906953573227},{\"score\":0.7453794479370117,\"part\":\"rightEar\",\"x\":0.42835673689842224,\"y\":0.23196211457252502},{\"score\":0.9604751467704773,\"part\":\"leftShoulder\",\"x\":0.4969443380832672,\"y\":0.2610016465187073},{\"score\":0.9929879307746887,\"part\":\"rightShoulder\",\"x\":0.4079909920692444,\"y\":0.27021273970603943},{\"score\":0.7870412468910217,\"part\":\"leftElbow\",\"x\":0.5536232590675354,\"y\":0.28147658705711365},{\"score\":0.774136483669281,\"part\":\"rightElbow\",\"x\":0.3489399552345276,\"y\":0.2768734097480774},{\"score\":0.9264965653419495,\"part\":\"leftWrist\",\"x\":0.5874417424201965,\"y\":0.283836305141449},{\"score\":0.4494909644126892,\"part\":\"rightWrist\",\"x\":0.29466769099235535,\"y\":0.28164640069007874},{\"score\":0.9920172691345215,\"part\":\"leftHip\",\"x\":0.5053028464317322,\"y\":0.38707491755485535},{\"score\":0.9957007765769958,\"part\":\"rightHip\",\"x\":0.4331226348876953,\"y\":0.40193238854408264},{\"score\":0.8898999094963074,\"part\":\"leftKnee\",\"x\":0.5834260582923889,\"y\":0.45919692516326904},{\"score\":0.9887459874153137,\"part\":\"rightKnee\",\"x\":0.43094369769096375,\"y\":0.4730507731437683},{\"score\":0.40855076909065247,\"part\":\"leftAnkle\",\"x\":0.6562666296958923,\"y\":0.5474188923835754},{\"score\":0.9704467058181763,\"part\":\"rightAnkle\",\"x\":0.443730890750885,\"y\":0.5617124438285828},{\"score\":0.9932608008384705,\"part\":\"nose\",\"x\":0.4505973756313324,\"y\":0.23899711668491364},{\"score\":0.9837904572486877,\"part\":\"leftEye\",\"x\":0.46347615122795105,\"y\":0.2268984466791153},{\"score\":0.9912269711494446,\"part\":\"rightEye\",\"x\":0.441471129655838,\"y\":0.22901122272014618},{\"score\":0.7626691460609436,\"part\":\"leftEar\",\"x\":0.4816843867301941,\"y\":0.2311382293701172},{\"score\":0.7479304075241089,\"part\":\"rightEar\",\"x\":0.4275323748588562,\"y\":0.23522669076919556},{\"score\":0.9939880967140198,\"part\":\"leftShoulder\",\"x\":0.5034048557281494,\"y\":0.26528558135032654},{\"score\":0.9913839101791382,\"part\":\"rightShoulder\",\"x\":0.4036872088909149,\"y\":0.27925190329551697},{\"score\":0.7595576643943787,\"part\":\"leftElbow\",\"x\":0.556198239326477,\"y\":0.27921873331069946},{\"score\":0.7956948280334473,\"part\":\"rightElbow\",\"x\":0.337465763092041,\"y\":0.28056827187538147},{\"score\":0.7631843686103821,\"part\":\"leftWrist\",\"x\":0.5791530013084412,\"y\":0.28111642599105835},{\"score\":0.33758482336997986,\"part\":\"rightWrist\",\"x\":0.29693803191185,\"y\":0.2775241434574127},{\"score\":0.9919127821922302,\"part\":\"leftHip\",\"x\":0.5066108107566833,\"y\":0.3910045325756073},{\"score\":0.9964809417724609,\"part\":\"rightHip\",\"x\":0.43160280585289,\"y\":0.40477392077445984},{\"score\":0.7311869263648987,\"part\":\"leftKnee\",\"x\":0.5792234539985657,\"y\":0.46087411046028137},{\"score\":0.9818732738494873,\"part\":\"rightKnee\",\"x\":0.4330734610557556,\"y\":0.4769221842288971},{\"score\":0.2839033007621765,\"part\":\"leftAnkle\",\"x\":0.6568564772605896,\"y\":0.5468423366546631},{\"score\":0.9763093590736389,\"part\":\"rightAnkle\",\"x\":0.4465128779411316,\"y\":0.5789687633514404},{\"score\":0.9924107193946838,\"part\":\"nose\",\"x\":0.45010724663734436,\"y\":0.23965753614902496},{\"score\":0.9738227725028992,\"part\":\"leftEye\",\"x\":0.46576300263404846,\"y\":0.2276250422000885},{\"score\":0.992167055606842,\"part\":\"rightEye\",\"x\":0.44126924872398376,\"y\":0.2291841208934784},{\"score\":0.6774887442588806,\"part\":\"leftEar\",\"x\":0.4830821752548218,\"y\":0.23507001996040344},{\"score\":0.80275958776474,\"part\":\"rightEar\",\"x\":0.42929720878601074,\"y\":0.23779910802841187},{\"score\":0.992220938205719,\"part\":\"leftShoulder\",\"x\":0.5009629726409912,\"y\":0.27204322814941406},{\"score\":0.9929443001747131,\"part\":\"rightShoulder\",\"x\":0.405948668718338,\"y\":0.28737929463386536},{\"score\":0.48525696992874146,\"part\":\"leftElbow\",\"x\":0.5544752478599548,\"y\":0.2856980860233307},{\"score\":0.8999297022819519,\"part\":\"rightElbow\",\"x\":0.33776548504829407,\"y\":0.2737657427787781},{\"score\":0.9182358980178833,\"part\":\"leftWrist\",\"x\":0.5814698934555054,\"y\":0.2887698709964752},{\"score\":0.767717182636261,\"part\":\"rightWrist\",\"x\":0.26138928532600403,\"y\":0.27877622842788696},{\"score\":0.988627552986145,\"part\":\"leftHip\",\"x\":0.51446932554245,\"y\":0.386192262172699},{\"score\":0.994697630405426,\"part\":\"rightHip\",\"x\":0.43629035353660583,\"y\":0.40647974610328674},{\"score\":0.7080845832824707,\"part\":\"leftKnee\",\"x\":0.5972918272018433,\"y\":0.4485560655593872},{\"score\":0.969755232334137,\"part\":\"rightKnee\",\"x\":0.4397372007369995,\"y\":0.48027700185775757},{\"score\":0.6571606397628784,\"part\":\"leftAnkle\",\"x\":0.6570957899093628,\"y\":0.5345964431762695},{\"score\":0.9724377393722534,\"part\":\"rightAnkle\",\"x\":0.43415266275405884,\"y\":0.5861403942108154},{\"score\":0.9931861758232117,\"part\":\"nose\",\"x\":0.45468059182167053,\"y\":0.23902203142642975},{\"score\":0.9803112149238586,\"part\":\"leftEye\",\"x\":0.4658968448638916,\"y\":0.2286156415939331},{\"score\":0.9956262111663818,\"part\":\"rightEye\",\"x\":0.4427313506603241,\"y\":0.23030352592468262},{\"score\":0.6703312993049622,\"part\":\"leftEar\",\"x\":0.4810127317905426,\"y\":0.23456622660160065},{\"score\":0.8668285608291626,\"part\":\"rightEar\",\"x\":0.42691102623939514,\"y\":0.23840010166168213},{\"score\":0.9958515763282776,\"part\":\"leftShoulder\",\"x\":0.5006089210510254,\"y\":0.271232932806015},{\"score\":0.995499312877655,\"part\":\"rightShoulder\",\"x\":0.40429502725601196,\"y\":0.2864460349082947},{\"score\":0.8117228746414185,\"part\":\"leftElbow\",\"x\":0.5545335412025452,\"y\":0.28527751564979553},{\"score\":0.7310676574707031,\"part\":\"rightElbow\",\"x\":0.3428940176963806,\"y\":0.28577902913093567},{\"score\":0.893740713596344,\"part\":\"leftWrist\",\"x\":0.5823670029640198,\"y\":0.28668591380119324},{\"score\":0.5334612727165222,\"part\":\"rightWrist\",\"x\":0.2845451831817627,\"y\":0.284662127494812},{\"score\":0.9936831593513489,\"part\":\"leftHip\",\"x\":0.5107553601264954,\"y\":0.3893187344074249},{\"score\":0.996201753616333,\"part\":\"rightHip\",\"x\":0.4332228899002075,\"y\":0.406764417886734},{\"score\":0.8649606704711914,\"part\":\"leftKnee\",\"x\":0.5732781291007996,\"y\":0.4352354109287262},{\"score\":0.9903355240821838,\"part\":\"rightKnee\",\"x\":0.43564897775650024,\"y\":0.478458434343338},{\"score\":0.7265604734420776,\"part\":\"leftAnkle\",\"x\":0.6487574577331543,\"y\":0.5251392126083374},{\"score\":0.9774627685546875,\"part\":\"rightAnkle\",\"x\":0.44378331303596497,\"y\":0.5781018137931824},{\"score\":0.9816218018531799,\"part\":\"nose\",\"x\":0.45294374227523804,\"y\":0.24625039100646973},{\"score\":0.9300347566604614,\"part\":\"leftEye\",\"x\":0.4634801149368286,\"y\":0.23897220194339752},{\"score\":0.9831952452659607,\"part\":\"rightEye\",\"x\":0.4427054226398468,\"y\":0.23778796195983887},{\"score\":0.4622616171836853,\"part\":\"leftEar\",\"x\":0.47588351368904114,\"y\":0.24305492639541626},{\"score\":0.8666223287582397,\"part\":\"rightEar\",\"x\":0.4237731695175171,\"y\":0.24293483793735504},{\"score\":0.9827683568000793,\"part\":\"leftShoulder\",\"x\":0.49701988697052,\"y\":0.2721995413303375},{\"score\":0.9921457171440125,\"part\":\"rightShoulder\",\"x\":0.40556585788726807,\"y\":0.2865080237388611},{\"score\":0.7961785197257996,\"part\":\"leftElbow\",\"x\":0.5475527048110962,\"y\":0.28460562229156494},{\"score\":0.3863910734653473,\"part\":\"rightElbow\",\"x\":0.35860419273376465,\"y\":0.29401257634162903},{\"score\":0.8675195574760437,\"part\":\"leftWrist\",\"x\":0.582956850528717,\"y\":0.2950184643268585},{\"score\":0.30053651332855225,\"part\":\"rightWrist\",\"x\":0.33819544315338135,\"y\":0.29294171929359436},{\"score\":0.986971914768219,\"part\":\"leftHip\",\"x\":0.49749502539634705,\"y\":0.3956788182258606},{\"score\":0.9974507689476013,\"part\":\"rightHip\",\"x\":0.4251467287540436,\"y\":0.39834269881248474},{\"score\":0.9121388792991638,\"part\":\"leftKnee\",\"x\":0.5630133748054504,\"y\":0.42548418045043945},{\"score\":0.9818681478500366,\"part\":\"rightKnee\",\"x\":0.43060731887817383,\"y\":0.4858707785606384},{\"score\":0.6020220518112183,\"part\":\"leftAnkle\",\"x\":0.6446584463119507,\"y\":0.5221874117851257},{\"score\":0.9694253206253052,\"part\":\"rightAnkle\",\"x\":0.43912050127983093,\"y\":0.5819383859634399},{\"score\":0.9840899109840393,\"part\":\"nose\",\"x\":0.4453698992729187,\"y\":0.2476087361574173},{\"score\":0.9606080651283264,\"part\":\"leftEye\",\"x\":0.4561614990234375,\"y\":0.24037885665893555},{\"score\":0.9787265062332153,\"part\":\"rightEye\",\"x\":0.4351796805858612,\"y\":0.23800507187843323},{\"score\":0.6458064913749695,\"part\":\"leftEar\",\"x\":0.4725382626056671,\"y\":0.2491331249475479},{\"score\":0.8395154476165771,\"part\":\"rightEar\",\"x\":0.4167346954345703,\"y\":0.24438267946243286},{\"score\":0.990166425704956,\"part\":\"leftShoulder\",\"x\":0.49425196647644043,\"y\":0.27545443177223206},{\"score\":0.9874441027641296,\"part\":\"rightShoulder\",\"x\":0.3942459523677826,\"y\":0.2847307324409485},{\"score\":0.8398160934448242,\"part\":\"leftElbow\",\"x\":0.5532241463661194,\"y\":0.2871510088443756},{\"score\":0.8136759400367737,\"part\":\"rightElbow\",\"x\":0.33944329619407654,\"y\":0.27447670698165894},{\"score\":0.8689295649528503,\"part\":\"leftWrist\",\"x\":0.576082706451416,\"y\":0.28432705998420715},{\"score\":0.3355761170387268,\"part\":\"rightWrist\",\"x\":0.33309295773506165,\"y\":0.27689310908317566},{\"score\":0.9939770698547363,\"part\":\"leftHip\",\"x\":0.4896763265132904,\"y\":0.3905871510505676},{\"score\":0.9962710738182068,\"part\":\"rightHip\",\"x\":0.4235643446445465,\"y\":0.3955816626548767},{\"score\":0.746803879737854,\"part\":\"leftKnee\",\"x\":0.5517597794532776,\"y\":0.43300068378448486},{\"score\":0.9790263772010803,\"part\":\"rightKnee\",\"x\":0.41965726017951965,\"y\":0.49653661251068115},{\"score\":0.6575360298156738,\"part\":\"leftAnkle\",\"x\":0.6366411447525024,\"y\":0.5207369923591614},{\"score\":0.8743785619735718,\"part\":\"rightAnkle\",\"x\":0.4327966272830963,\"y\":0.5990022420883179},{\"score\":0.989385187625885,\"part\":\"nose\",\"x\":0.4521002173423767,\"y\":0.25006869435310364},{\"score\":0.9693474173545837,\"part\":\"leftEye\",\"x\":0.4619314968585968,\"y\":0.24162012338638306},{\"score\":0.9916142225265503,\"part\":\"rightEye\",\"x\":0.439947247505188,\"y\":0.23990090191364288},{\"score\":0.5058652758598328,\"part\":\"leftEar\",\"x\":0.474741131067276,\"y\":0.24701349437236786},{\"score\":0.8818022608757019,\"part\":\"rightEar\",\"x\":0.42199280858039856,\"y\":0.24661795794963837},{\"score\":0.9931175708770752,\"part\":\"leftShoulder\",\"x\":0.4962766766548157,\"y\":0.27986955642700195},{\"score\":0.9904346466064453,\"part\":\"rightShoulder\",\"x\":0.40046972036361694,\"y\":0.29295551776885986},{\"score\":0.8061338067054749,\"part\":\"leftElbow\",\"x\":0.5604479312896729,\"y\":0.2857913374900818},{\"score\":0.8396939635276794,\"part\":\"rightElbow\",\"x\":0.36482715606689453,\"y\":0.31215474009513855},{\"score\":0.8025079369544983,\"part\":\"leftWrist\",\"x\":0.5603652596473694,\"y\":0.29562243819236755},{\"score\":0.5931028127670288,\"part\":\"rightWrist\",\"x\":0.3722340762615204,\"y\":0.3296290636062622},{\"score\":0.9960600733757019,\"part\":\"leftHip\",\"x\":0.49282851815223694,\"y\":0.39830338954925537},{\"score\":0.9979100823402405,\"part\":\"rightHip\",\"x\":0.42465639114379883,\"y\":0.4005298614501953},{\"score\":0.8381914496421814,\"part\":\"leftKnee\",\"x\":0.5817719101905823,\"y\":0.4595678746700287},{\"score\":0.9828329086303711,\"part\":\"rightKnee\",\"x\":0.424368292093277,\"y\":0.4967319071292877},{\"score\":0.5745092034339905,\"part\":\"leftAnkle\",\"x\":0.6458254456520081,\"y\":0.5360366702079773},{\"score\":0.9134223461151123,\"part\":\"rightAnkle\",\"x\":0.43361592292785645,\"y\":0.5946120619773865},{\"score\":0.9852758646011353,\"part\":\"nose\",\"x\":0.4534834325313568,\"y\":0.25189244747161865},{\"score\":0.9560443162918091,\"part\":\"leftEye\",\"x\":0.4646192491054535,\"y\":0.24609553813934326},{\"score\":0.9889889359474182,\"part\":\"rightEye\",\"x\":0.4392161965370178,\"y\":0.24308869242668152},{\"score\":0.552627682685852,\"part\":\"leftEar\",\"x\":0.4769589602947235,\"y\":0.25381559133529663},{\"score\":0.8126559257507324,\"part\":\"rightEar\",\"x\":0.42195722460746765,\"y\":0.25151923298835754},{\"score\":0.9833980202674866,\"part\":\"leftShoulder\",\"x\":0.49828100204467773,\"y\":0.28569892048835754},{\"score\":0.9885300397872925,\"part\":\"rightShoulder\",\"x\":0.40177708864212036,\"y\":0.295339971780777},{\"score\":0.6496440768241882,\"part\":\"leftElbow\",\"x\":0.554797351360321,\"y\":0.2943251430988312},{\"score\":0.7462043762207031,\"part\":\"rightElbow\",\"x\":0.341282457113266,\"y\":0.30326470732688904},{\"score\":0.8166612982749939,\"part\":\"leftWrist\",\"x\":0.5842867493629456,\"y\":0.3058873414993286},{\"score\":0.22361551225185394,\"part\":\"rightWrist\",\"x\":0.3515510857105255,\"y\":0.30093756318092346},{\"score\":0.9899100661277771,\"part\":\"leftHip\",\"x\":0.49628567695617676,\"y\":0.4017200767993927},{\"score\":0.997637152671814,\"part\":\"rightHip\",\"x\":0.42519181966781616,\"y\":0.4021243751049042},{\"score\":0.7252526879310608,\"part\":\"leftKnee\",\"x\":0.5785315632820129,\"y\":0.4582880437374115},{\"score\":0.9806557297706604,\"part\":\"rightKnee\",\"x\":0.4280568063259125,\"y\":0.4998127222061157},{\"score\":0.7373412251472473,\"part\":\"leftAnkle\",\"x\":0.6421892046928406,\"y\":0.5382290482521057},{\"score\":0.9282160997390747,\"part\":\"rightAnkle\",\"x\":0.4383886754512787,\"y\":0.6007491946220398},{\"score\":0.9881188869476318,\"part\":\"nose\",\"x\":0.45009589195251465,\"y\":0.2580016851425171},{\"score\":0.9684141278266907,\"part\":\"leftEye\",\"x\":0.46126022934913635,\"y\":0.24878570437431335},{\"score\":0.9820399880409241,\"part\":\"rightEye\",\"x\":0.43778035044670105,\"y\":0.2468140572309494},{\"score\":0.6033717393875122,\"part\":\"leftEar\",\"x\":0.4769419729709625,\"y\":0.2561965882778168},{\"score\":0.7297924757003784,\"part\":\"rightEar\",\"x\":0.42011481523513794,\"y\":0.2547321319580078},{\"score\":0.9789702296257019,\"part\":\"leftShoulder\",\"x\":0.49606573581695557,\"y\":0.29666846990585327},{\"score\":0.9812687039375305,\"part\":\"rightShoulder\",\"x\":0.40143465995788574,\"y\":0.30234673619270325},{\"score\":0.7649009823799133,\"part\":\"leftElbow\",\"x\":0.5346747636795044,\"y\":0.31286823749542236},{\"score\":0.6096357703208923,\"part\":\"rightElbow\",\"x\":0.34770387411117554,\"y\":0.3085460662841797},{\"score\":0.5652142763137817,\"part\":\"leftWrist\",\"x\":0.5727323293685913,\"y\":0.32008469104766846},{\"score\":0.40643200278282166,\"part\":\"rightWrist\",\"x\":0.33359211683273315,\"y\":0.30451658368110657},{\"score\":0.98536616563797,\"part\":\"leftHip\",\"x\":0.4969540238380432,\"y\":0.40327176451683044},{\"score\":0.9979462027549744,\"part\":\"rightHip\",\"x\":0.4279809594154358,\"y\":0.4110414385795593},{\"score\":0.6530569195747375,\"part\":\"leftKnee\",\"x\":0.5826379656791687,\"y\":0.4615902304649353},{\"score\":0.9893288016319275,\"part\":\"rightKnee\",\"x\":0.42734208703041077,\"y\":0.5048930644989014},{\"score\":0.3660924434661865,\"part\":\"leftAnkle\",\"x\":0.6461603045463562,\"y\":0.5476166009902954},{\"score\":0.9515956044197083,\"part\":\"rightAnkle\",\"x\":0.43768051266670227,\"y\":0.5916258692741394},{\"score\":0.9794110655784607,\"part\":\"nose\",\"x\":0.4503823220729828,\"y\":0.25948014855384827},{\"score\":0.9342427253723145,\"part\":\"leftEye\",\"x\":0.46148383617401123,\"y\":0.24973776936531067},{\"score\":0.9619655609130859,\"part\":\"rightEye\",\"x\":0.44086503982543945,\"y\":0.2482190877199173},{\"score\":0.5815469622612,\"part\":\"leftEar\",\"x\":0.4774690270423889,\"y\":0.25694021582603455},{\"score\":0.6775360703468323,\"part\":\"rightEar\",\"x\":0.42428892850875854,\"y\":0.25600817799568176},{\"score\":0.975209653377533,\"part\":\"leftShoulder\",\"x\":0.5021592974662781,\"y\":0.2879771292209625},{\"score\":0.9869781136512756,\"part\":\"rightShoulder\",\"x\":0.40597715973854065,\"y\":0.3023681640625},{\"score\":0.5669001340866089,\"part\":\"leftElbow\",\"x\":0.5488314032554626,\"y\":0.30136311054229736},{\"score\":0.41783207654953003,\"part\":\"rightElbow\",\"x\":0.3597486913204193,\"y\":0.29474082589149475},{\"score\":0.7938277125358582,\"part\":\"leftWrist\",\"x\":0.576392412185669,\"y\":0.3021242618560791},{\"score\":0.1877850741147995,\"part\":\"rightWrist\",\"x\":0.3275708258152008,\"y\":0.3024587631225586},{\"score\":0.9913358092308044,\"part\":\"leftHip\",\"x\":0.5047268271446228,\"y\":0.40305837988853455},{\"score\":0.9978771209716797,\"part\":\"rightHip\",\"x\":0.4277805685997009,\"y\":0.4062241017818451},{\"score\":0.8509854078292847,\"part\":\"leftKnee\",\"x\":0.5810937881469727,\"y\":0.45882880687713623},{\"score\":0.9820979833602905,\"part\":\"rightKnee\",\"x\":0.42913374304771423,\"y\":0.506033182144165},{\"score\":0.767212986946106,\"part\":\"leftAnkle\",\"x\":0.6445471048355103,\"y\":0.54513019323349},{\"score\":0.9288716912269592,\"part\":\"rightAnkle\",\"x\":0.44258829951286316,\"y\":0.5976301431655884},{\"score\":0.9896318912506104,\"part\":\"nose\",\"x\":0.4497872292995453,\"y\":0.26096630096435547},{\"score\":0.9730104804039001,\"part\":\"leftEye\",\"x\":0.4620915651321411,\"y\":0.2511492669582367},{\"score\":0.9813085794448853,\"part\":\"rightEye\",\"x\":0.4397575259208679,\"y\":0.24880100786685944},{\"score\":0.728829562664032,\"part\":\"leftEar\",\"x\":0.4815281331539154,\"y\":0.2554588317871094},{\"score\":0.6701968908309937,\"part\":\"rightEar\",\"x\":0.4262787997722626,\"y\":0.2559661567211151},{\"score\":0.9881139993667603,\"part\":\"leftShoulder\",\"x\":0.4988301992416382,\"y\":0.28512459993362427},{\"score\":0.9912689924240112,\"part\":\"rightShoulder\",\"x\":0.4077568054199219,\"y\":0.29622286558151245},{\"score\":0.930962324142456,\"part\":\"leftElbow\",\"x\":0.5649680495262146,\"y\":0.3054582178592682},{\"score\":0.8527884483337402,\"part\":\"rightElbow\",\"x\":0.35331737995147705,\"y\":0.2864569425582886},{\"score\":0.7802416682243347,\"part\":\"leftWrist\",\"x\":0.5903247594833374,\"y\":0.3158315420150757},{\"score\":0.21132472157478333,\"part\":\"rightWrist\",\"x\":0.3428322672843933,\"y\":0.3019370138645172},{\"score\":0.9841117262840271,\"part\":\"leftHip\",\"x\":0.5026370286941528,\"y\":0.4040488004684448},{\"score\":0.9986542463302612,\"part\":\"rightHip\",\"x\":0.43239259719848633,\"y\":0.41142144799232483},{\"score\":0.8182156682014465,\"part\":\"leftKnee\",\"x\":0.5844990015029907,\"y\":0.45771414041519165},{\"score\":0.9916327595710754,\"part\":\"rightKnee\",\"x\":0.4310586154460907,\"y\":0.5185517072677612},{\"score\":0.48063504695892334,\"part\":\"leftAnkle\",\"x\":0.6457550525665283,\"y\":0.5467339754104614},{\"score\":0.9526546597480774,\"part\":\"rightAnkle\",\"x\":0.4398161768913269,\"y\":0.6033380627632141},{\"score\":0.9866002202033997,\"part\":\"nose\",\"x\":0.4547094702720642,\"y\":0.25636929273605347},{\"score\":0.9629965424537659,\"part\":\"leftEye\",\"x\":0.4642737805843353,\"y\":0.24990147352218628},{\"score\":0.9885469079017639,\"part\":\"rightEye\",\"x\":0.4412756562232971,\"y\":0.24809400737285614},{\"score\":0.5551019906997681,\"part\":\"leftEar\",\"x\":0.4792288839817047,\"y\":0.25570207834243774},{\"score\":0.8127490282058716,\"part\":\"rightEar\",\"x\":0.42438265681266785,\"y\":0.2562845051288605},{\"score\":0.9865172505378723,\"part\":\"leftShoulder\",\"x\":0.4948343336582184,\"y\":0.28519195318222046},{\"score\":0.9875620603561401,\"part\":\"rightShoulder\",\"x\":0.40547728538513184,\"y\":0.29951077699661255},{\"score\":0.8766061663627625,\"part\":\"leftElbow\",\"x\":0.5472853779792786,\"y\":0.3026716709136963},{\"score\":0.7786310911178589,\"part\":\"rightElbow\",\"x\":0.3507682979106903,\"y\":0.2874908149242401},{\"score\":0.7273328304290771,\"part\":\"leftWrist\",\"x\":0.5714786052703857,\"y\":0.30586591362953186},{\"score\":0.2677376866340637,\"part\":\"rightWrist\",\"x\":0.3348909914493561,\"y\":0.3009479343891144},{\"score\":0.9651513695716858,\"part\":\"leftHip\",\"x\":0.4979178011417389,\"y\":0.40421062707901},{\"score\":0.9987251162528992,\"part\":\"rightHip\",\"x\":0.4296839237213135,\"y\":0.4091576337814331},{\"score\":0.8537665605545044,\"part\":\"leftKnee\",\"x\":0.5766890645027161,\"y\":0.4608556926250458},{\"score\":0.9814170598983765,\"part\":\"rightKnee\",\"x\":0.43191292881965637,\"y\":0.5043732523918152},{\"score\":0.46949443221092224,\"part\":\"leftAnkle\",\"x\":0.6477603912353516,\"y\":0.5533077120780945},{\"score\":0.9474352598190308,\"part\":\"rightAnkle\",\"x\":0.43659508228302,\"y\":0.6002255082130432},{\"score\":0.9929736256599426,\"part\":\"nose\",\"x\":0.45600420236587524,\"y\":0.255571186542511},{\"score\":0.98122239112854,\"part\":\"leftEye\",\"x\":0.467242956161499,\"y\":0.24792174994945526},{\"score\":0.995564341545105,\"part\":\"rightEye\",\"x\":0.4448792338371277,\"y\":0.24631093442440033},{\"score\":0.6387621164321899,\"part\":\"leftEar\",\"x\":0.4826437532901764,\"y\":0.25197118520736694},{\"score\":0.8830654621124268,\"part\":\"rightEar\",\"x\":0.4268278181552887,\"y\":0.2541501224040985},{\"score\":0.9944950342178345,\"part\":\"leftShoulder\",\"x\":0.4995952546596527,\"y\":0.2778211534023285},{\"score\":0.9901471734046936,\"part\":\"rightShoulder\",\"x\":0.40213242173194885,\"y\":0.29530835151672363},{\"score\":0.828589677810669,\"part\":\"leftElbow\",\"x\":0.5512216091156006,\"y\":0.2990604341030121},{\"score\":0.9344828724861145,\"part\":\"rightElbow\",\"x\":0.3346640467643738,\"y\":0.2998466193675995},{\"score\":0.8810603022575378,\"part\":\"leftWrist\",\"x\":0.5681838989257812,\"y\":0.30486300587654114},{\"score\":0.8197543621063232,\"part\":\"rightWrist\",\"x\":0.26707923412323,\"y\":0.30584269762039185},{\"score\":0.9922778010368347,\"part\":\"leftHip\",\"x\":0.4989788830280304,\"y\":0.4032522141933441},{\"score\":0.9980031251907349,\"part\":\"rightHip\",\"x\":0.42922064661979675,\"y\":0.40896421670913696},{\"score\":0.805743932723999,\"part\":\"leftKnee\",\"x\":0.5632123947143555,\"y\":0.4404323101043701},{\"score\":0.979111909866333,\"part\":\"rightKnee\",\"x\":0.4294857382774353,\"y\":0.5026764273643494},{\"score\":0.6481959223747253,\"part\":\"leftAnkle\",\"x\":0.6441308856010437,\"y\":0.5376142263412476},{\"score\":0.9429976940155029,\"part\":\"rightAnkle\",\"x\":0.44000008702278137,\"y\":0.6010543704032898},{\"score\":0.9824607372283936,\"part\":\"nose\",\"x\":0.45005887746810913,\"y\":0.25898465514183044},{\"score\":0.9440245628356934,\"part\":\"leftEye\",\"x\":0.46337631344795227,\"y\":0.24948173761367798},{\"score\":0.9706045389175415,\"part\":\"rightEye\",\"x\":0.4401020109653473,\"y\":0.24688129127025604},{\"score\":0.6013190150260925,\"part\":\"leftEar\",\"x\":0.4797665774822235,\"y\":0.25584378838539124},{\"score\":0.7019199132919312,\"part\":\"rightEar\",\"x\":0.4253438115119934,\"y\":0.2548297941684723},{\"score\":0.981471836566925,\"part\":\"leftShoulder\",\"x\":0.4978228807449341,\"y\":0.2891937494277954},{\"score\":0.9841560125350952,\"part\":\"rightShoulder\",\"x\":0.40482449531555176,\"y\":0.3006850779056549},{\"score\":0.8370388150215149,\"part\":\"leftElbow\",\"x\":0.5644610524177551,\"y\":0.2936117649078369},{\"score\":0.5555303692817688,\"part\":\"rightElbow\",\"x\":0.36068230867385864,\"y\":0.2934110760688782},{\"score\":0.8379955887794495,\"part\":\"leftWrist\",\"x\":0.5748664736747742,\"y\":0.3030332922935486},{\"score\":0.19890712201595306,\"part\":\"rightWrist\",\"x\":0.3294219374656677,\"y\":0.3037179708480835},{\"score\":0.9753198027610779,\"part\":\"leftHip\",\"x\":0.4967043697834015,\"y\":0.4051816463470459},{\"score\":0.9982081651687622,\"part\":\"rightHip\",\"x\":0.4289972186088562,\"y\":0.4072558879852295},{\"score\":0.8314790725708008,\"part\":\"leftKnee\",\"x\":0.5790450572967529,\"y\":0.4540013074874878},{\"score\":0.9853665232658386,\"part\":\"rightKnee\",\"x\":0.4325306713581085,\"y\":0.5053914785385132},{\"score\":0.5471219420433044,\"part\":\"leftAnkle\",\"x\":0.6458638310432434,\"y\":0.5462654829025269},{\"score\":0.9468055367469788,\"part\":\"rightAnkle\",\"x\":0.44026055932044983,\"y\":0.5976260304450989},{\"score\":0.9782162308692932,\"part\":\"nose\",\"x\":0.4519524872303009,\"y\":0.25951358675956726},{\"score\":0.9428813457489014,\"part\":\"leftEye\",\"x\":0.4615190029144287,\"y\":0.251689076423645},{\"score\":0.982581615447998,\"part\":\"rightEye\",\"x\":0.4433688819408417,\"y\":0.24820028245449066},{\"score\":0.5159215927124023,\"part\":\"leftEar\",\"x\":0.47230616211891174,\"y\":0.25873976945877075},{\"score\":0.8550251126289368,\"part\":\"rightEar\",\"x\":0.4225699305534363,\"y\":0.25659438967704773},{\"score\":0.9883604049682617,\"part\":\"leftShoulder\",\"x\":0.49049779772758484,\"y\":0.2949710190296173},{\"score\":0.9897310733795166,\"part\":\"rightShoulder\",\"x\":0.3947737514972687,\"y\":0.29976534843444824},{\"score\":0.7124334573745728,\"part\":\"leftElbow\",\"x\":0.537907063961029,\"y\":0.29754555225372314},{\"score\":0.9365792870521545,\"part\":\"rightElbow\",\"x\":0.3227708339691162,\"y\":0.30531731247901917},{\"score\":0.8881804943084717,\"part\":\"leftWrist\",\"x\":0.574509859085083,\"y\":0.3004375696182251},{\"score\":0.24470438063144684,\"part\":\"rightWrist\",\"x\":0.26113733649253845,\"y\":0.318049818277359},{\"score\":0.9638146758079529,\"part\":\"leftHip\",\"x\":0.4950277507305145,\"y\":0.40815430879592896},{\"score\":0.9980658888816833,\"part\":\"rightHip\",\"x\":0.4299422800540924,\"y\":0.414076566696167},{\"score\":0.8124400973320007,\"part\":\"leftKnee\",\"x\":0.57389235496521,\"y\":0.4728744924068451},{\"score\":0.9796103239059448,\"part\":\"rightKnee\",\"x\":0.4297182857990265,\"y\":0.5164510011672974},{\"score\":0.4726755917072296,\"part\":\"leftAnkle\",\"x\":0.6464585661888123,\"y\":0.5507625341415405},{\"score\":0.9444997310638428,\"part\":\"rightAnkle\",\"x\":0.43387144804000854,\"y\":0.5989764332771301},{\"score\":0.9838243126869202,\"part\":\"nose\",\"x\":0.45110639929771423,\"y\":0.2607150673866272},{\"score\":0.9670363068580627,\"part\":\"leftEye\",\"x\":0.4585534930229187,\"y\":0.25259512662887573},{\"score\":0.9799785017967224,\"part\":\"rightEye\",\"x\":0.43987515568733215,\"y\":0.25057661533355713},{\"score\":0.636005699634552,\"part\":\"leftEar\",\"x\":0.47273269295692444,\"y\":0.2602550983428955},{\"score\":0.8080129027366638,\"part\":\"rightEar\",\"x\":0.42225924134254456,\"y\":0.2577371597290039},{\"score\":0.9942718744277954,\"part\":\"leftShoulder\",\"x\":0.49175024032592773,\"y\":0.3007926642894745},{\"score\":0.9870439767837524,\"part\":\"rightShoulder\",\"x\":0.39988192915916443,\"y\":0.3061848282814026},{\"score\":0.8647842407226562,\"part\":\"leftElbow\",\"x\":0.5416592359542847,\"y\":0.3145280182361603},{\"score\":0.890186607837677,\"part\":\"rightElbow\",\"x\":0.3300209045410156,\"y\":0.3138951361179352},{\"score\":0.8842343688011169,\"part\":\"leftWrist\",\"x\":0.5737059712409973,\"y\":0.3130565285682678},{\"score\":0.514561653137207,\"part\":\"rightWrist\",\"x\":0.3491002321243286,\"y\":0.30816829204559326},{\"score\":0.9834575653076172,\"part\":\"leftHip\",\"x\":0.49724042415618896,\"y\":0.40563008189201355},{\"score\":0.9981991648674011,\"part\":\"rightHip\",\"x\":0.4226505756378174,\"y\":0.4141188859939575},{\"score\":0.9023187160491943,\"part\":\"leftKnee\",\"x\":0.5689237713813782,\"y\":0.46849119663238525},{\"score\":0.9886150360107422,\"part\":\"rightKnee\",\"x\":0.42820537090301514,\"y\":0.5271232724189758},{\"score\":0.5422484278678894,\"part\":\"leftAnkle\",\"x\":0.6453697085380554,\"y\":0.5551040172576904},{\"score\":0.8908254504203796,\"part\":\"rightAnkle\",\"x\":0.43064042925834656,\"y\":0.6022211909294128},{\"score\":0.9781036376953125,\"part\":\"nose\",\"x\":0.4491416811943054,\"y\":0.2596644163131714},{\"score\":0.9376830458641052,\"part\":\"leftEye\",\"x\":0.4588945508003235,\"y\":0.25188207626342773},{\"score\":0.9759162664413452,\"part\":\"rightEye\",\"x\":0.4434131681919098,\"y\":0.25033167004585266},{\"score\":0.531510055065155,\"part\":\"leftEar\",\"x\":0.47030457854270935,\"y\":0.2583583891391754},{\"score\":0.8557117581367493,\"part\":\"rightEar\",\"x\":0.42413127422332764,\"y\":0.25846853852272034},{\"score\":0.9948485493659973,\"part\":\"leftShoulder\",\"x\":0.4877915680408478,\"y\":0.30004093050956726},{\"score\":0.9883964657783508,\"part\":\"rightShoulder\",\"x\":0.40551459789276123,\"y\":0.3049885630607605},{\"score\":0.8582342863082886,\"part\":\"leftElbow\",\"x\":0.5440537333488464,\"y\":0.3129677176475525},{\"score\":0.6645439863204956,\"part\":\"rightElbow\",\"x\":0.3666857182979584,\"y\":0.3137223422527313},{\"score\":0.8682236671447754,\"part\":\"leftWrist\",\"x\":0.5565320253372192,\"y\":0.31090646982192993},{\"score\":0.2916155457496643,\"part\":\"rightWrist\",\"x\":0.37593308091163635,\"y\":0.3133404850959778},{\"score\":0.9831246137619019,\"part\":\"leftHip\",\"x\":0.49777597188949585,\"y\":0.40153729915618896},{\"score\":0.9987034201622009,\"part\":\"rightHip\",\"x\":0.4249100387096405,\"y\":0.4189993441104889},{\"score\":0.8826443552970886,\"part\":\"leftKnee\",\"x\":0.5721086263656616,\"y\":0.46251872181892395},{\"score\":0.9836732745170593,\"part\":\"rightKnee\",\"x\":0.4280337989330292,\"y\":0.518343985080719},{\"score\":0.7066308856010437,\"part\":\"leftAnkle\",\"x\":0.6527778506278992,\"y\":0.5614932179450989},{\"score\":0.9209258556365967,\"part\":\"rightAnkle\",\"x\":0.4318866729736328,\"y\":0.5991265177726746},{\"score\":0.9793184995651245,\"part\":\"nose\",\"x\":0.446622759103775,\"y\":0.26147305965423584},{\"score\":0.9489432573318481,\"part\":\"leftEye\",\"x\":0.45736879110336304,\"y\":0.2530066967010498},{\"score\":0.9705173373222351,\"part\":\"rightEye\",\"x\":0.4384366273880005,\"y\":0.25102463364601135},{\"score\":0.5758169293403625,\"part\":\"leftEar\",\"x\":0.4719867706298828,\"y\":0.2606498599052429},{\"score\":0.7633709907531738,\"part\":\"rightEar\",\"x\":0.41895169019699097,\"y\":0.26091790199279785},{\"score\":0.9924556016921997,\"part\":\"leftShoulder\",\"x\":0.49015894532203674,\"y\":0.30244898796081543},{\"score\":0.979518711566925,\"part\":\"rightShoulder\",\"x\":0.4059842526912689,\"y\":0.2971033751964569},{\"score\":0.8205966949462891,\"part\":\"leftElbow\",\"x\":0.5441648960113525,\"y\":0.31809481978416443},{\"score\":0.7833162546157837,\"part\":\"rightElbow\",\"x\":0.35036030411720276,\"y\":0.31859686970710754},{\"score\":0.8251912593841553,\"part\":\"leftWrist\",\"x\":0.5833206176757812,\"y\":0.31374049186706543},{\"score\":0.2867393493652344,\"part\":\"rightWrist\",\"x\":0.34761232137680054,\"y\":0.31071236729621887},{\"score\":0.971571683883667,\"part\":\"leftHip\",\"x\":0.49489957094192505,\"y\":0.406337708234787},{\"score\":0.9975932836532593,\"part\":\"rightHip\",\"x\":0.4214853346347809,\"y\":0.42073190212249756},{\"score\":0.7796316742897034,\"part\":\"leftKnee\",\"x\":0.5556409955024719,\"y\":0.45840534567832947},{\"score\":0.9615119099617004,\"part\":\"rightKnee\",\"x\":0.42551758885383606,\"y\":0.523510754108429},{\"score\":0.8275291919708252,\"part\":\"leftAnkle\",\"x\":0.6381431818008423,\"y\":0.5524773597717285},{\"score\":0.9134820103645325,\"part\":\"rightAnkle\",\"x\":0.4281989634037018,\"y\":0.5914880037307739},{\"score\":0.9831151366233826,\"part\":\"nose\",\"x\":0.4559326767921448,\"y\":0.25892505049705505},{\"score\":0.9695301651954651,\"part\":\"leftEye\",\"x\":0.4653112590312958,\"y\":0.2559393644332886},{\"score\":0.986214816570282,\"part\":\"rightEye\",\"x\":0.44611597061157227,\"y\":0.2508569061756134},{\"score\":0.5961778163909912,\"part\":\"leftEar\",\"x\":0.47645071148872375,\"y\":0.25440531969070435},{\"score\":0.8045186400413513,\"part\":\"rightEar\",\"x\":0.4294643998146057,\"y\":0.26059505343437195},{\"score\":0.987223744392395,\"part\":\"leftShoulder\",\"x\":0.49582546949386597,\"y\":0.29830995202064514},{\"score\":0.9883465766906738,\"part\":\"rightShoulder\",\"x\":0.40565192699432373,\"y\":0.3055178225040436},{\"score\":0.8139641284942627,\"part\":\"leftElbow\",\"x\":0.5486902594566345,\"y\":0.30755743384361267},{\"score\":0.930663526058197,\"part\":\"rightElbow\",\"x\":0.33845317363739014,\"y\":0.30702829360961914},{\"score\":0.8679814338684082,\"part\":\"leftWrist\",\"x\":0.5716704726219177,\"y\":0.31915345788002014},{\"score\":0.6290971636772156,\"part\":\"rightWrist\",\"x\":0.3214656114578247,\"y\":0.30283281207084656},{\"score\":0.9861658811569214,\"part\":\"leftHip\",\"x\":0.503805935382843,\"y\":0.41375070810317993},{\"score\":0.9984620213508606,\"part\":\"rightHip\",\"x\":0.4297267198562622,\"y\":0.420791894197464},{\"score\":0.7809841632843018,\"part\":\"leftKnee\",\"x\":0.5832358598709106,\"y\":0.466604620218277},{\"score\":0.984650194644928,\"part\":\"rightKnee\",\"x\":0.43251627683639526,\"y\":0.5125309228897095},{\"score\":0.6079613566398621,\"part\":\"leftAnkle\",\"x\":0.647687554359436,\"y\":0.5522396564483643},{\"score\":0.9656424522399902,\"part\":\"rightAnkle\",\"x\":0.43822070956230164,\"y\":0.5943422913551331},{\"score\":0.9795771241188049,\"part\":\"nose\",\"x\":0.44721686840057373,\"y\":0.26685234904289246},{\"score\":0.9706013798713684,\"part\":\"leftEye\",\"x\":0.4593111574649811,\"y\":0.2586395740509033},{\"score\":0.9807716012001038,\"part\":\"rightEye\",\"x\":0.44104093313217163,\"y\":0.25641176104545593},{\"score\":0.7382314205169678,\"part\":\"leftEar\",\"x\":0.47337260842323303,\"y\":0.2642619013786316},{\"score\":0.8001182079315186,\"part\":\"rightEar\",\"x\":0.4197064936161041,\"y\":0.2643701732158661},{\"score\":0.985672116279602,\"part\":\"leftShoulder\",\"x\":0.5005296468734741,\"y\":0.29512959718704224},{\"score\":0.9851809740066528,\"part\":\"rightShoulder\",\"x\":0.4008859097957611,\"y\":0.30506232380867004},{\"score\":0.8294646739959717,\"part\":\"leftElbow\",\"x\":0.5598976016044617,\"y\":0.31294479966163635},{\"score\":0.9077931046485901,\"part\":\"rightElbow\",\"x\":0.31205472350120544,\"y\":0.31061187386512756},{\"score\":0.6545348763465881,\"part\":\"leftWrist\",\"x\":0.5930122137069702,\"y\":0.3064453899860382},{\"score\":0.07494484633207321,\"part\":\"rightWrist\",\"x\":0.26709648966789246,\"y\":0.32286539673805237},{\"score\":0.9675281047821045,\"part\":\"leftHip\",\"x\":0.5005839467048645,\"y\":0.40604594349861145},{\"score\":0.9984449744224548,\"part\":\"rightHip\",\"x\":0.4292997419834137,\"y\":0.41637077927589417},{\"score\":0.8047917485237122,\"part\":\"leftKnee\",\"x\":0.5697348713874817,\"y\":0.47355514764785767},{\"score\":0.9861618280410767,\"part\":\"rightKnee\",\"x\":0.4287511110305786,\"y\":0.5207477807998657},{\"score\":0.7198203206062317,\"part\":\"leftAnkle\",\"x\":0.6370375156402588,\"y\":0.5585799217224121},{\"score\":0.9160103797912598,\"part\":\"rightAnkle\",\"x\":0.4328171908855438,\"y\":0.5982463359832764},{\"score\":0.937653660774231,\"part\":\"nose\",\"x\":0.4470234215259552,\"y\":0.2641267776489258},{\"score\":0.9289820790290833,\"part\":\"leftEye\",\"x\":0.4573967456817627,\"y\":0.2603912949562073},{\"score\":0.9183744788169861,\"part\":\"rightEye\",\"x\":0.4422649145126343,\"y\":0.2566576302051544},{\"score\":0.5069156289100647,\"part\":\"leftEar\",\"x\":0.4661320149898529,\"y\":0.26555967330932617},{\"score\":0.7683690786361694,\"part\":\"rightEar\",\"x\":0.41623446345329285,\"y\":0.26390278339385986},{\"score\":0.9743754267692566,\"part\":\"leftShoulder\",\"x\":0.49428457021713257,\"y\":0.2983345091342926},{\"score\":0.9475272297859192,\"part\":\"rightShoulder\",\"x\":0.399467408657074,\"y\":0.30870774388313293},{\"score\":0.747177243232727,\"part\":\"leftElbow\",\"x\":0.5289204716682434,\"y\":0.3170796036720276},{\"score\":0.5905072689056396,\"part\":\"rightElbow\",\"x\":0.3344103991985321,\"y\":0.30837225914001465},{\"score\":0.8389750719070435,\"part\":\"leftWrist\",\"x\":0.5678233504295349,\"y\":0.3182745575904846},{\"score\":0.20983538031578064,\"part\":\"rightWrist\",\"x\":0.3371969759464264,\"y\":0.2967588007450104},{\"score\":0.9768270254135132,\"part\":\"leftHip\",\"x\":0.49646371603012085,\"y\":0.4127137362957001},{\"score\":0.99775230884552,\"part\":\"rightHip\",\"x\":0.42211252450942993,\"y\":0.4265022575855255},{\"score\":0.6802064180374146,\"part\":\"leftKnee\",\"x\":0.5489308834075928,\"y\":0.4677884578704834},{\"score\":0.9447416663169861,\"part\":\"rightKnee\",\"x\":0.4261508882045746,\"y\":0.5305767059326172},{\"score\":0.6299955248832703,\"part\":\"leftAnkle\",\"x\":0.638773500919342,\"y\":0.5516196489334106},{\"score\":0.8825381994247437,\"part\":\"rightAnkle\",\"x\":0.429303914308548,\"y\":0.5967614054679871},{\"score\":0.9559592604637146,\"part\":\"nose\",\"x\":0.4417441487312317,\"y\":0.2696278989315033},{\"score\":0.9109751582145691,\"part\":\"leftEye\",\"x\":0.4530704915523529,\"y\":0.26269271969795227},{\"score\":0.9351412057876587,\"part\":\"rightEye\",\"x\":0.43665099143981934,\"y\":0.2617167830467224},{\"score\":0.6512655019760132,\"part\":\"leftEar\",\"x\":0.46194222569465637,\"y\":0.26662957668304443},{\"score\":0.7778670787811279,\"part\":\"rightEar\",\"x\":0.4187546968460083,\"y\":0.2681940793991089},{\"score\":0.9809388518333435,\"part\":\"leftShoulder\",\"x\":0.4849342703819275,\"y\":0.3052356541156769},{\"score\":0.9639055728912354,\"part\":\"rightShoulder\",\"x\":0.4003220796585083,\"y\":0.31044459342956543},{\"score\":0.7885035276412964,\"part\":\"leftElbow\",\"x\":0.533387303352356,\"y\":0.3299556076526642},{\"score\":0.8315193057060242,\"part\":\"rightElbow\",\"x\":0.3363843858242035,\"y\":0.3103775680065155},{\"score\":0.8785672783851624,\"part\":\"leftWrist\",\"x\":0.5623655915260315,\"y\":0.31850168108940125},{\"score\":0.231382355093956,\"part\":\"rightWrist\",\"x\":0.34602516889572144,\"y\":0.2935512959957123},{\"score\":0.9835749864578247,\"part\":\"leftHip\",\"x\":0.49783673882484436,\"y\":0.40801313519477844},{\"score\":0.9979549646377563,\"part\":\"rightHip\",\"x\":0.4220156669616699,\"y\":0.4225803017616272},{\"score\":0.7440603971481323,\"part\":\"leftKnee\",\"x\":0.5515855550765991,\"y\":0.47378554940223694},{\"score\":0.9534475803375244,\"part\":\"rightKnee\",\"x\":0.42551860213279724,\"y\":0.5231181979179382},{\"score\":0.6614012718200684,\"part\":\"leftAnkle\",\"x\":0.6446713209152222,\"y\":0.5565803050994873},{\"score\":0.9148446321487427,\"part\":\"rightAnkle\",\"x\":0.4318588674068451,\"y\":0.5994002819061279},{\"score\":0.9155115485191345,\"part\":\"nose\",\"x\":0.4396992027759552,\"y\":0.2679101228713989},{\"score\":0.9012510776519775,\"part\":\"leftEye\",\"x\":0.45199236273765564,\"y\":0.26017647981643677},{\"score\":0.8097364902496338,\"part\":\"rightEye\",\"x\":0.4369222819805145,\"y\":0.2587369382381439},{\"score\":0.6382750272750854,\"part\":\"leftEar\",\"x\":0.462239146232605,\"y\":0.26755431294441223},{\"score\":0.548408031463623,\"part\":\"rightEar\",\"x\":0.4169784188270569,\"y\":0.2676362693309784},{\"score\":0.9615420699119568,\"part\":\"leftShoulder\",\"x\":0.4857398271560669,\"y\":0.3068320155143738},{\"score\":0.9547237753868103,\"part\":\"rightShoulder\",\"x\":0.4004344642162323,\"y\":0.3139048218727112},{\"score\":0.7257827520370483,\"part\":\"leftElbow\",\"x\":0.5301514863967896,\"y\":0.3196994960308075},{\"score\":0.8117907643318176,\"part\":\"rightElbow\",\"x\":0.33396831154823303,\"y\":0.31688234210014343},{\"score\":0.8045250177383423,\"part\":\"leftWrist\",\"x\":0.5641751885414124,\"y\":0.31388604640960693},{\"score\":0.3833490312099457,\"part\":\"rightWrist\",\"x\":0.3403162360191345,\"y\":0.3054189682006836},{\"score\":0.9833899736404419,\"part\":\"leftHip\",\"x\":0.4979606568813324,\"y\":0.4136017858982086},{\"score\":0.9956806302070618,\"part\":\"rightHip\",\"x\":0.4189581274986267,\"y\":0.42136648297309875},{\"score\":0.5599095821380615,\"part\":\"leftKnee\",\"x\":0.5512256026268005,\"y\":0.46635690331459045},{\"score\":0.9431990385055542,\"part\":\"rightKnee\",\"x\":0.4201977252960205,\"y\":0.5168666243553162},{\"score\":0.7305836081504822,\"part\":\"leftAnkle\",\"x\":0.6382924318313599,\"y\":0.5609327554702759},{\"score\":0.9204183220863342,\"part\":\"rightAnkle\",\"x\":0.428596168756485,\"y\":0.5991447567939758},{\"score\":0.9786566495895386,\"part\":\"nose\",\"x\":0.43177151679992676,\"y\":0.2575782239437103},{\"score\":0.9518294930458069,\"part\":\"leftEye\",\"x\":0.44866472482681274,\"y\":0.250806987285614},{\"score\":0.9501031041145325,\"part\":\"rightEye\",\"x\":0.4275888502597809,\"y\":0.2507716715335846},{\"score\":0.6228086948394775,\"part\":\"leftEar\",\"x\":0.4586353302001953,\"y\":0.2556036114692688},{\"score\":0.7403777837753296,\"part\":\"rightEar\",\"x\":0.41018781065940857,\"y\":0.2570032477378845},{\"score\":0.9863002300262451,\"part\":\"leftShoulder\",\"x\":0.48041990399360657,\"y\":0.2962416112422943},{\"score\":0.9894815683364868,\"part\":\"rightShoulder\",\"x\":0.3876522481441498,\"y\":0.29788097739219666},{\"score\":0.7091116309165955,\"part\":\"leftElbow\",\"x\":0.523649275302887,\"y\":0.30448177456855774},{\"score\":0.9069201350212097,\"part\":\"rightElbow\",\"x\":0.2982860803604126,\"y\":0.31652653217315674},{\"score\":0.9108114838600159,\"part\":\"leftWrist\",\"x\":0.5586364269256592,\"y\":0.30936235189437866},{\"score\":0.29201021790504456,\"part\":\"rightWrist\",\"x\":0.2094324678182602,\"y\":0.313605934381485},{\"score\":0.983949601650238,\"part\":\"leftHip\",\"x\":0.4840867221355438,\"y\":0.40928763151168823},{\"score\":0.9968981146812439,\"part\":\"rightHip\",\"x\":0.41509538888931274,\"y\":0.4131670296192169},{\"score\":0.9566779732704163,\"part\":\"leftKnee\",\"x\":0.5679186582565308,\"y\":0.4875871241092682},{\"score\":0.9693856835365295,\"part\":\"rightKnee\",\"x\":0.4150431752204895,\"y\":0.5076636672019958},{\"score\":0.4246790111064911,\"part\":\"leftAnkle\",\"x\":0.6461238861083984,\"y\":0.553464412689209},{\"score\":0.961212694644928,\"part\":\"rightAnkle\",\"x\":0.42372646927833557,\"y\":0.5977248549461365},{\"score\":0.9847988486289978,\"part\":\"nose\",\"x\":0.43497705459594727,\"y\":0.2722037434577942},{\"score\":0.9749971032142639,\"part\":\"leftEye\",\"x\":0.44632434844970703,\"y\":0.2614595293998718},{\"score\":0.9555292725563049,\"part\":\"rightEye\",\"x\":0.4252939224243164,\"y\":0.2639715075492859},{\"score\":0.7307288646697998,\"part\":\"leftEar\",\"x\":0.4600566625595093,\"y\":0.27001726627349854},{\"score\":0.731220543384552,\"part\":\"rightEar\",\"x\":0.4085020422935486,\"y\":0.2669450044631958},{\"score\":0.9854354858398438,\"part\":\"leftShoulder\",\"x\":0.4822883605957031,\"y\":0.30387914180755615},{\"score\":0.9759677052497864,\"part\":\"rightShoulder\",\"x\":0.3925480544567108,\"y\":0.30639466643333435},{\"score\":0.9173603653907776,\"part\":\"leftElbow\",\"x\":0.5381140112876892,\"y\":0.3235829770565033},{\"score\":0.8047852516174316,\"part\":\"rightElbow\",\"x\":0.3456265926361084,\"y\":0.31032440066337585},{\"score\":0.9403627514839172,\"part\":\"leftWrist\",\"x\":0.5633907318115234,\"y\":0.3240897059440613},{\"score\":0.6579496264457703,\"part\":\"rightWrist\",\"x\":0.31601810455322266,\"y\":0.30839142203330994},{\"score\":0.9915722608566284,\"part\":\"leftHip\",\"x\":0.4923366606235504,\"y\":0.4129108786582947},{\"score\":0.9970057606697083,\"part\":\"rightHip\",\"x\":0.4160349667072296,\"y\":0.42788904905319214},{\"score\":0.7655913829803467,\"part\":\"leftKnee\",\"x\":0.5386239290237427,\"y\":0.4673826992511749},{\"score\":0.9632242321968079,\"part\":\"rightKnee\",\"x\":0.4155399203300476,\"y\":0.5133861899375916},{\"score\":0.7282577157020569,\"part\":\"leftAnkle\",\"x\":0.6294808983802795,\"y\":0.5595453381538391},{\"score\":0.9696263074874878,\"part\":\"rightAnkle\",\"x\":0.4251100420951843,\"y\":0.59172523021698},{\"score\":0.9884152412414551,\"part\":\"nose\",\"x\":0.43157777190208435,\"y\":0.2718803584575653},{\"score\":0.9788488149642944,\"part\":\"leftEye\",\"x\":0.4429694712162018,\"y\":0.26913198828697205},{\"score\":0.9612319469451904,\"part\":\"rightEye\",\"x\":0.4202592074871063,\"y\":0.26291292905807495},{\"score\":0.6822422742843628,\"part\":\"leftEar\",\"x\":0.4591938257217407,\"y\":0.27056655287742615},{\"score\":0.7369654178619385,\"part\":\"rightEar\",\"x\":0.4051021635532379,\"y\":0.26828426122665405},{\"score\":0.9760534167289734,\"part\":\"leftShoulder\",\"x\":0.4810047149658203,\"y\":0.30521512031555176},{\"score\":0.9747521877288818,\"part\":\"rightShoulder\",\"x\":0.38619691133499146,\"y\":0.30226680636405945},{\"score\":0.8806647658348083,\"part\":\"leftElbow\",\"x\":0.5347184538841248,\"y\":0.3218461871147156},{\"score\":0.9010893702507019,\"part\":\"rightElbow\",\"x\":0.325669527053833,\"y\":0.31634122133255005},{\"score\":0.918907105922699,\"part\":\"leftWrist\",\"x\":0.558615505695343,\"y\":0.3247937262058258},{\"score\":0.6787634491920471,\"part\":\"rightWrist\",\"x\":0.26695406436920166,\"y\":0.31850194931030273},{\"score\":0.9914050102233887,\"part\":\"leftHip\",\"x\":0.4916415810585022,\"y\":0.4115370213985443},{\"score\":0.9954962134361267,\"part\":\"rightHip\",\"x\":0.41351446509361267,\"y\":0.4281022250652313},{\"score\":0.7672523856163025,\"part\":\"leftKnee\",\"x\":0.5595436692237854,\"y\":0.45671162009239197},{\"score\":0.9645212888717651,\"part\":\"rightKnee\",\"x\":0.4167594611644745,\"y\":0.5255101323127747},{\"score\":0.5574466586112976,\"part\":\"leftAnkle\",\"x\":0.6277824640274048,\"y\":0.5601243376731873},{\"score\":0.94306480884552,\"part\":\"rightAnkle\",\"x\":0.4270578622817993,\"y\":0.5953850746154785},\"2020-08-22 12:13:17.908217\"]', '2020-08-22 12:13:29');
INSERT INTO `therapy_exercise` (`id`, `tp_id`, `joint`, `time`) VALUES
(12, 39, '[{\"score\":0.9788948893547058,\"part\":\"nose\",\"x\":0.4397248327732086,\"y\":0.07040518522262573},{\"score\":0.9494572877883911,\"part\":\"leftEye\",\"x\":0.45418402552604675,\"y\":0.06610232591629028},{\"score\":0.9816601872444153,\"part\":\"rightEye\",\"x\":0.4336787462234497,\"y\":0.0602714940905571},{\"score\":0.8291397094726562,\"part\":\"leftEar\",\"x\":0.47344186902046204,\"y\":0.07563206553459167},{\"score\":0.8607625365257263,\"part\":\"rightEar\",\"x\":0.41134873032569885,\"y\":0.06995922327041626},{\"score\":0.9733070731163025,\"part\":\"leftShoulder\",\"x\":0.5042372941970825,\"y\":0.11311402916908264},{\"score\":0.9857193231582642,\"part\":\"rightShoulder\",\"x\":0.3742799162864685,\"y\":0.11227580904960632},{\"score\":0.9403782486915588,\"part\":\"leftElbow\",\"x\":0.5842404365539551,\"y\":0.12439075857400894},{\"score\":0.7748141884803772,\"part\":\"rightElbow\",\"x\":0.2809184789657593,\"y\":0.13364854454994202},{\"score\":0.23742859065532684,\"part\":\"leftWrist\",\"x\":0.7090633511543274,\"y\":0.12557324767112732},{\"score\":0.03616419434547424,\"part\":\"rightWrist\",\"x\":0.21833178400993347,\"y\":0.11812525987625122},{\"score\":0.992327094078064,\"part\":\"leftHip\",\"x\":0.4919682741165161,\"y\":0.2393016666173935},{\"score\":0.9867827892303467,\"part\":\"rightHip\",\"x\":0.4033445417881012,\"y\":0.2442406713962555},{\"score\":0.9374532103538513,\"part\":\"leftKnee\",\"x\":0.5911113619804382,\"y\":0.3366920053958893},{\"score\":0.8915630578994751,\"part\":\"rightKnee\",\"x\":0.40160584449768066,\"y\":0.3577853739261627},{\"score\":0.8283423781394958,\"part\":\"leftAnkle\",\"x\":0.673263669013977,\"y\":0.44747334718704224},{\"score\":0.8043120503425598,\"part\":\"rightAnkle\",\"x\":0.41104140877723694,\"y\":0.49058061838150024},{\"score\":0.7175622582435608,\"part\":\"nose\",\"x\":0.49593132734298706,\"y\":0.15809021890163422},{\"score\":0.6093533635139465,\"part\":\"leftEye\",\"x\":0.5081080198287964,\"y\":0.15114468336105347},{\"score\":0.8140071034431458,\"part\":\"rightEye\",\"x\":0.49111422896385193,\"y\":0.1496044248342514},{\"score\":0.28335845470428467,\"part\":\"leftEar\",\"x\":0.5199995636940002,\"y\":0.1633405089378357},{\"score\":0.7159413695335388,\"part\":\"rightEar\",\"x\":0.4671606421470642,\"y\":0.15648379921913147},{\"score\":0.783439040184021,\"part\":\"leftShoulder\",\"x\":0.5467298030853271,\"y\":0.19430676102638245},{\"score\":0.9645475149154663,\"part\":\"rightShoulder\",\"x\":0.43498528003692627,\"y\":0.20074008405208588},{\"score\":0.6045134663581848,\"part\":\"leftElbow\",\"x\":0.5919346213340759,\"y\":0.23661033809185028},{\"score\":0.36077168583869934,\"part\":\"rightElbow\",\"x\":0.3451876640319824,\"y\":0.19356444478034973},{\"score\":0.402539998292923,\"part\":\"leftWrist\",\"x\":0.6250813007354736,\"y\":0.21707938611507416},{\"score\":0.15465089678764343,\"part\":\"rightWrist\",\"x\":0.281303733587265,\"y\":0.2081139236688614},{\"score\":0.9878737926483154,\"part\":\"leftHip\",\"x\":0.5452410578727722,\"y\":0.32171422243118286},{\"score\":0.9953793883323669,\"part\":\"rightHip\",\"x\":0.46527910232543945,\"y\":0.3211657702922821},{\"score\":0.9124783873558044,\"part\":\"leftKnee\",\"x\":0.6356228590011597,\"y\":0.42763543128967285},{\"score\":0.9703786373138428,\"part\":\"rightKnee\",\"x\":0.44922757148742676,\"y\":0.4254232347011566},{\"score\":0.712749183177948,\"part\":\"leftAnkle\",\"x\":0.6988076567649841,\"y\":0.5050540566444397},{\"score\":0.9154960513114929,\"part\":\"rightAnkle\",\"x\":0.4548081159591675,\"y\":0.5149510502815247},{\"score\":0.9825464487075806,\"part\":\"nose\",\"x\":0.4735676944255829,\"y\":0.28759074211120605},{\"score\":0.9699633717536926,\"part\":\"leftEye\",\"x\":0.4858177602291107,\"y\":0.27595487236976624},{\"score\":0.9571448564529419,\"part\":\"rightEye\",\"x\":0.4626910388469696,\"y\":0.2756277322769165},{\"score\":0.8305140137672424,\"part\":\"leftEar\",\"x\":0.5074611306190491,\"y\":0.28981199860572815},{\"score\":0.8562635183334351,\"part\":\"rightEar\",\"x\":0.44909921288490295,\"y\":0.2918640971183777},{\"score\":0.9915250539779663,\"part\":\"leftShoulder\",\"x\":0.5170939564704895,\"y\":0.32645124197006226},{\"score\":0.9943280220031738,\"part\":\"rightShoulder\",\"x\":0.41911330819129944,\"y\":0.3275768458843231},{\"score\":0.9278779029846191,\"part\":\"leftElbow\",\"x\":0.575362503528595,\"y\":0.32998746633529663},{\"score\":0.9660028219223022,\"part\":\"rightElbow\",\"x\":0.32776233553886414,\"y\":0.3127776086330414},{\"score\":0.7528688311576843,\"part\":\"leftWrist\",\"x\":0.5995465517044067,\"y\":0.3295035660266876},{\"score\":0.5471040606498718,\"part\":\"rightWrist\",\"x\":0.26278695464134216,\"y\":0.33312976360321045},{\"score\":0.9957035779953003,\"part\":\"leftHip\",\"x\":0.5248069763183594,\"y\":0.4388916790485382},{\"score\":0.9884717464447021,\"part\":\"rightHip\",\"x\":0.44655144214630127,\"y\":0.44636982679367065},{\"score\":0.9239131212234497,\"part\":\"leftKnee\",\"x\":0.5985405445098877,\"y\":0.5216065645217896},{\"score\":0.9749191999435425,\"part\":\"rightKnee\",\"x\":0.4502342641353607,\"y\":0.5387513637542725},{\"score\":0.865959107875824,\"part\":\"leftAnkle\",\"x\":0.6848471164703369,\"y\":0.6055359244346619},{\"score\":0.9017007946968079,\"part\":\"rightAnkle\",\"x\":0.44994017481803894,\"y\":0.6472318768501282},{\"score\":0.9764366149902344,\"part\":\"nose\",\"x\":0.5740660429000854,\"y\":0.20319052040576935},{\"score\":0.919732391834259,\"part\":\"leftEye\",\"x\":0.5847705602645874,\"y\":0.19253674149513245},{\"score\":0.9599562287330627,\"part\":\"rightEye\",\"x\":0.5614821910858154,\"y\":0.19159668684005737},{\"score\":0.5303149223327637,\"part\":\"leftEar\",\"x\":0.5946496725082397,\"y\":0.20638157427310944},{\"score\":0.9309210181236267,\"part\":\"rightEar\",\"x\":0.5413947701454163,\"y\":0.20647305250167847},{\"score\":0.9896467924118042,\"part\":\"leftShoulder\",\"x\":0.6097344756126404,\"y\":0.24604706466197968},{\"score\":0.9934201836585999,\"part\":\"rightShoulder\",\"x\":0.5082820057868958,\"y\":0.2542662024497986},{\"score\":0.8131670355796814,\"part\":\"leftElbow\",\"x\":0.6868549585342407,\"y\":0.2615774869918823},{\"score\":0.9204909801483154,\"part\":\"rightElbow\",\"x\":0.4275778830051422,\"y\":0.24002915620803833},{\"score\":0.8220483064651489,\"part\":\"leftWrist\",\"x\":0.6911522746086121,\"y\":0.2638251781463623},{\"score\":0.4788753092288971,\"part\":\"rightWrist\",\"x\":0.35931363701820374,\"y\":0.25996118783950806},{\"score\":0.9894765019416809,\"part\":\"leftHip\",\"x\":0.6353954672813416,\"y\":0.36051827669143677},{\"score\":0.994373083114624,\"part\":\"rightHip\",\"x\":0.5409253239631653,\"y\":0.3778925836086273},{\"score\":0.9076252579689026,\"part\":\"leftKnee\",\"x\":0.7076683044433594,\"y\":0.4513922929763794},{\"score\":0.9373772144317627,\"part\":\"rightKnee\",\"x\":0.5413141250610352,\"y\":0.46753913164138794},{\"score\":0.6464564800262451,\"part\":\"leftAnkle\",\"x\":0.798061728477478,\"y\":0.5506196618080139},{\"score\":0.8778989911079407,\"part\":\"rightAnkle\",\"x\":0.5546595454216003,\"y\":0.5589068531990051},{\"score\":0.9882532954216003,\"part\":\"nose\",\"x\":0.5313607454299927,\"y\":0.21875600516796112},{\"score\":0.9428487420082092,\"part\":\"leftEye\",\"x\":0.5429176092147827,\"y\":0.20824803411960602},{\"score\":0.9725294709205627,\"part\":\"rightEye\",\"x\":0.5194060802459717,\"y\":0.20721331238746643},{\"score\":0.703889787197113,\"part\":\"leftEar\",\"x\":0.5512959957122803,\"y\":0.21563571691513062},{\"score\":0.8349048495292664,\"part\":\"rightEar\",\"x\":0.49888965487480164,\"y\":0.22006727755069733},{\"score\":0.987002432346344,\"part\":\"leftShoulder\",\"x\":0.5756645202636719,\"y\":0.2508253753185272},{\"score\":0.992578387260437,\"part\":\"rightShoulder\",\"x\":0.46612873673439026,\"y\":0.25437697768211365},{\"score\":0.8828452229499817,\"part\":\"leftElbow\",\"x\":0.6507019996643066,\"y\":0.2615203559398651},{\"score\":0.8967313170433044,\"part\":\"rightElbow\",\"x\":0.38454005122184753,\"y\":0.2678912281990051},{\"score\":0.461128294467926,\"part\":\"leftWrist\",\"x\":0.6992860436439514,\"y\":0.2642363905906677},{\"score\":0.06042451038956642,\"part\":\"rightWrist\",\"x\":0.30814024806022644,\"y\":0.27665555477142334},{\"score\":0.9870337247848511,\"part\":\"leftHip\",\"x\":0.5899686813354492,\"y\":0.37088268995285034},{\"score\":0.9887983202934265,\"part\":\"rightHip\",\"x\":0.5108383297920227,\"y\":0.3866034746170044},{\"score\":0.9083518385887146,\"part\":\"leftKnee\",\"x\":0.6774481534957886,\"y\":0.4719645380973816},{\"score\":0.9418691396713257,\"part\":\"rightKnee\",\"x\":0.49886149168014526,\"y\":0.48018544912338257},{\"score\":0.7030181884765625,\"part\":\"leftAnkle\",\"x\":0.760159969329834,\"y\":0.5576075315475464},{\"score\":0.9084612131118774,\"part\":\"rightAnkle\",\"x\":0.5051323175430298,\"y\":0.5911588072776794},{\"score\":0.9743562340736389,\"part\":\"nose\",\"x\":0.43682608008384705,\"y\":0.28073790669441223},{\"score\":0.9549387097358704,\"part\":\"leftEye\",\"x\":0.44707709550857544,\"y\":0.2678243815898895},{\"score\":0.9609745740890503,\"part\":\"rightEye\",\"x\":0.4282801151275635,\"y\":0.27087199687957764},{\"score\":0.5666974782943726,\"part\":\"leftEar\",\"x\":0.4579722285270691,\"y\":0.2716618478298187},{\"score\":0.8048738837242126,\"part\":\"rightEar\",\"x\":0.4044029712677002,\"y\":0.2708541750907898},{\"score\":0.9835550785064697,\"part\":\"leftShoulder\",\"x\":0.4836879372596741,\"y\":0.30723533034324646},{\"score\":0.9726288914680481,\"part\":\"rightShoulder\",\"x\":0.380804181098938,\"y\":0.3039394021034241},{\"score\":0.959394097328186,\"part\":\"leftElbow\",\"x\":0.5720670819282532,\"y\":0.3144098222255707},{\"score\":0.7103095650672913,\"part\":\"rightElbow\",\"x\":0.3258553147315979,\"y\":0.32440295815467834},{\"score\":0.4727967083454132,\"part\":\"leftWrist\",\"x\":0.6336603164672852,\"y\":0.3111276924610138},{\"score\":0.22665324807167053,\"part\":\"rightWrist\",\"x\":0.3277520537376404,\"y\":0.31123706698417664},{\"score\":0.9841268062591553,\"part\":\"leftHip\",\"x\":0.49135586619377136,\"y\":0.4141239821910858},{\"score\":0.9958970546722412,\"part\":\"rightHip\",\"x\":0.41572386026382446,\"y\":0.42748239636421204},{\"score\":0.7508639693260193,\"part\":\"leftKnee\",\"x\":0.5744025111198425,\"y\":0.5005142092704773},{\"score\":0.9712116718292236,\"part\":\"rightKnee\",\"x\":0.40709787607192993,\"y\":0.5210005640983582},{\"score\":0.5970861911773682,\"part\":\"leftAnkle\",\"x\":0.6546388864517212,\"y\":0.5989850163459778},{\"score\":0.9377444982528687,\"part\":\"rightAnkle\",\"x\":0.420115202665329,\"y\":0.6287257075309753},{\"score\":0.9933107495307922,\"part\":\"nose\",\"x\":0.5063576698303223,\"y\":0.2646344006061554},{\"score\":0.9598726630210876,\"part\":\"leftEye\",\"x\":0.5183594226837158,\"y\":0.25595077872276306},{\"score\":0.9824783205986023,\"part\":\"rightEye\",\"x\":0.4945588707923889,\"y\":0.25506725907325745},{\"score\":0.7092670798301697,\"part\":\"leftEar\",\"x\":0.5373799800872803,\"y\":0.25944361090660095},{\"score\":0.7624887824058533,\"part\":\"rightEar\",\"x\":0.4729852080345154,\"y\":0.2601322531700134},{\"score\":0.9722240567207336,\"part\":\"leftShoulder\",\"x\":0.5591944456100464,\"y\":0.29613158106803894},{\"score\":0.9605786800384521,\"part\":\"rightShoulder\",\"x\":0.45309197902679443,\"y\":0.3071513772010803},{\"score\":0.9296005964279175,\"part\":\"leftElbow\",\"x\":0.6300874948501587,\"y\":0.314347505569458},{\"score\":0.34217432141304016,\"part\":\"rightElbow\",\"x\":0.37819910049438477,\"y\":0.30697768926620483},{\"score\":0.6119804978370667,\"part\":\"leftWrist\",\"x\":0.6717830896377563,\"y\":0.3157418668270111},{\"score\":0.06827522069215775,\"part\":\"rightWrist\",\"x\":0.40220335125923157,\"y\":0.3145253360271454},{\"score\":0.9912373423576355,\"part\":\"leftHip\",\"x\":0.5677824020385742,\"y\":0.4101544916629791},{\"score\":0.996337354183197,\"part\":\"rightHip\",\"x\":0.4796631932258606,\"y\":0.4214772880077362},{\"score\":0.9078282117843628,\"part\":\"leftKnee\",\"x\":0.6519263386726379,\"y\":0.5097354054450989},{\"score\":0.975453794002533,\"part\":\"rightKnee\",\"x\":0.48067590594291687,\"y\":0.5480717420578003},{\"score\":0.8632531762123108,\"part\":\"leftAnkle\",\"x\":0.72666996717453,\"y\":0.6037927865982056},{\"score\":0.8551474809646606,\"part\":\"rightAnkle\",\"x\":0.48279452323913574,\"y\":0.6308363676071167},{\"score\":0.9929294586181641,\"part\":\"nose\",\"x\":0.49806851148605347,\"y\":0.26564115285873413},{\"score\":0.9859774112701416,\"part\":\"leftEye\",\"x\":0.5108086466789246,\"y\":0.2547607421875},{\"score\":0.9938023686408997,\"part\":\"rightEye\",\"x\":0.488212913274765,\"y\":0.25399965047836304},{\"score\":0.7826407551765442,\"part\":\"leftEar\",\"x\":0.5277386903762817,\"y\":0.25733640789985657},{\"score\":0.844115138053894,\"part\":\"rightEar\",\"x\":0.4693514406681061,\"y\":0.25993525981903076},{\"score\":0.9900890588760376,\"part\":\"leftShoulder\",\"x\":0.5503407120704651,\"y\":0.28613361716270447},{\"score\":0.9925169944763184,\"part\":\"rightShoulder\",\"x\":0.4407903254032135,\"y\":0.305993914604187},{\"score\":0.9549357295036316,\"part\":\"leftElbow\",\"x\":0.6231766939163208,\"y\":0.31171196699142456},{\"score\":0.8102592825889587,\"part\":\"rightElbow\",\"x\":0.36921197175979614,\"y\":0.30421212315559387},{\"score\":0.7552057504653931,\"part\":\"leftWrist\",\"x\":0.6433863043785095,\"y\":0.3133898675441742},{\"score\":0.1974617838859558,\"part\":\"rightWrist\",\"x\":0.3346961736679077,\"y\":0.3021026849746704},{\"score\":0.9901281595230103,\"part\":\"leftHip\",\"x\":0.5547881722450256,\"y\":0.4098169207572937},{\"score\":0.9978233575820923,\"part\":\"rightHip\",\"x\":0.47274789214134216,\"y\":0.4193606972694397},{\"score\":0.9202131628990173,\"part\":\"leftKnee\",\"x\":0.6425183415412903,\"y\":0.5011420249938965},{\"score\":0.9631748199462891,\"part\":\"rightKnee\",\"x\":0.4747231602668762,\"y\":0.534248948097229},{\"score\":0.8388910889625549,\"part\":\"leftAnkle\",\"x\":0.7249207496643066,\"y\":0.6021862626075745},{\"score\":0.8607022166252136,\"part\":\"rightAnkle\",\"x\":0.47984084486961365,\"y\":0.618916928768158},{\"score\":0.9676429033279419,\"part\":\"nose\",\"x\":0.4965655505657196,\"y\":0.2395070493221283},{\"score\":0.9267663359642029,\"part\":\"leftEye\",\"x\":0.5054142475128174,\"y\":0.23003365099430084},{\"score\":0.9766762852668762,\"part\":\"rightEye\",\"x\":0.4878077805042267,\"y\":0.23045973479747772},{\"score\":0.5796761512756348,\"part\":\"leftEar\",\"x\":0.5176592469215393,\"y\":0.23574572801589966},{\"score\":0.8453958630561829,\"part\":\"rightEar\",\"x\":0.46654295921325684,\"y\":0.23368051648139954},{\"score\":0.9709466695785522,\"part\":\"leftShoulder\",\"x\":0.5470755100250244,\"y\":0.2706626355648041},{\"score\":0.9845507144927979,\"part\":\"rightShoulder\",\"x\":0.43778109550476074,\"y\":0.2784005403518677},{\"score\":0.9540186524391174,\"part\":\"leftElbow\",\"x\":0.5997058153152466,\"y\":0.27670443058013916},{\"score\":0.6365699172019958,\"part\":\"rightElbow\",\"x\":0.3848491311073303,\"y\":0.2680763304233551},{\"score\":0.6056811809539795,\"part\":\"leftWrist\",\"x\":0.658650279045105,\"y\":0.2721930146217346},{\"score\":0.20934650301933289,\"part\":\"rightWrist\",\"x\":0.4002801775932312,\"y\":0.27327048778533936},{\"score\":0.991321325302124,\"part\":\"leftHip\",\"x\":0.544152557849884,\"y\":0.38819822669029236},{\"score\":0.9938749670982361,\"part\":\"rightHip\",\"x\":0.4711386263370514,\"y\":0.3970659375190735},{\"score\":0.9285197257995605,\"part\":\"leftKnee\",\"x\":0.6408647298812866,\"y\":0.4757660925388336},{\"score\":0.9776685833930969,\"part\":\"rightKnee\",\"x\":0.4656967520713806,\"y\":0.5045203566551208},{\"score\":0.8719995617866516,\"part\":\"leftAnkle\",\"x\":0.7167447209358215,\"y\":0.5785400867462158},{\"score\":0.8940154314041138,\"part\":\"rightAnkle\",\"x\":0.4719483256340027,\"y\":0.6000258922576904},{\"score\":0.9862140417098999,\"part\":\"nose\",\"x\":0.4988784193992615,\"y\":0.23274299502372742},{\"score\":0.9573248624801636,\"part\":\"leftEye\",\"x\":0.5063329339027405,\"y\":0.2232811152935028},{\"score\":0.9844721555709839,\"part\":\"rightEye\",\"x\":0.48562091588974,\"y\":0.22135218977928162},{\"score\":0.644612193107605,\"part\":\"leftEar\",\"x\":0.519065260887146,\"y\":0.23087053000926971},{\"score\":0.8606139421463013,\"part\":\"rightEar\",\"x\":0.46417054533958435,\"y\":0.22837693989276886},{\"score\":0.9426512718200684,\"part\":\"leftShoulder\",\"x\":0.5454280972480774,\"y\":0.2593272030353546},{\"score\":0.9905616044998169,\"part\":\"rightShoulder\",\"x\":0.4368155598640442,\"y\":0.265726774930954},{\"score\":0.9571632146835327,\"part\":\"leftElbow\",\"x\":0.617790937423706,\"y\":0.27437499165534973},{\"score\":0.7082494497299194,\"part\":\"rightElbow\",\"x\":0.355369508266449,\"y\":0.279636025428772},{\"score\":0.06362169981002808,\"part\":\"leftWrist\",\"x\":0.7459930777549744,\"y\":0.2708289623260498},{\"score\":0.3894067108631134,\"part\":\"rightWrist\",\"x\":0.30343520641326904,\"y\":0.26491960883140564},{\"score\":0.990655779838562,\"part\":\"leftHip\",\"x\":0.5425165295600891,\"y\":0.38688212633132935},{\"score\":0.9944711327552795,\"part\":\"rightHip\",\"x\":0.47191622853279114,\"y\":0.4018017649650574},{\"score\":0.9368171095848083,\"part\":\"leftKnee\",\"x\":0.6295651197433472,\"y\":0.4659966826438904},{\"score\":0.9580492973327637,\"part\":\"rightKnee\",\"x\":0.4572386145591736,\"y\":0.4915544092655182},{\"score\":0.8451518416404724,\"part\":\"leftAnkle\",\"x\":0.6987361311912537,\"y\":0.561441957950592},{\"score\":0.9352033138275146,\"part\":\"rightAnkle\",\"x\":0.46483632922172546,\"y\":0.595725953578949},{\"score\":0.9901770353317261,\"part\":\"nose\",\"x\":0.33968567848205566,\"y\":0.26264628767967224},{\"score\":0.9731709361076355,\"part\":\"leftEye\",\"x\":0.35513612627983093,\"y\":0.2549472153186798},{\"score\":0.9729949235916138,\"part\":\"rightEye\",\"x\":0.33391085267066956,\"y\":0.25499221682548523},{\"score\":0.7357621192932129,\"part\":\"leftEar\",\"x\":0.3667151927947998,\"y\":0.2581422030925751},{\"score\":0.7952754497528076,\"part\":\"rightEar\",\"x\":0.3134576082229614,\"y\":0.26099976897239685},{\"score\":0.9874657988548279,\"part\":\"leftShoulder\",\"x\":0.39099401235580444,\"y\":0.29456672072410583},{\"score\":0.991644561290741,\"part\":\"rightShoulder\",\"x\":0.28854605555534363,\"y\":0.30154475569725037},{\"score\":0.7423080205917358,\"part\":\"leftElbow\",\"x\":0.4505314528942108,\"y\":0.29878485202789307},{\"score\":0.9295664429664612,\"part\":\"rightElbow\",\"x\":0.20028480887413025,\"y\":0.30849677324295044},{\"score\":0.8509255051612854,\"part\":\"leftWrist\",\"x\":0.46473458409309387,\"y\":0.3055170774459839},{\"score\":0.10754566639661789,\"part\":\"rightWrist\",\"x\":0.15877126157283783,\"y\":0.33566269278526306},{\"score\":0.957802414894104,\"part\":\"leftHip\",\"x\":0.4029656946659088,\"y\":0.4093196392059326},{\"score\":0.9952114820480347,\"part\":\"rightHip\",\"x\":0.3188466727733612,\"y\":0.4134126305580139},{\"score\":0.8928112983703613,\"part\":\"leftKnee\",\"x\":0.459150105714798,\"y\":0.47991618514060974},{\"score\":0.9629964232444763,\"part\":\"rightKnee\",\"x\":0.3133392930030823,\"y\":0.5116091966629028},{\"score\":0.7844408750534058,\"part\":\"leftAnkle\",\"x\":0.5567417144775391,\"y\":0.5737428069114685},{\"score\":0.951924204826355,\"part\":\"rightAnkle\",\"x\":0.3288363814353943,\"y\":0.6096981763839722},{\"score\":0.9513018131256104,\"part\":\"nose\",\"x\":0.4867234528064728,\"y\":0.2300153374671936},{\"score\":0.8931569457054138,\"part\":\"leftEye\",\"x\":0.49468785524368286,\"y\":0.21830867230892181},{\"score\":0.932513952255249,\"part\":\"rightEye\",\"x\":0.477851927280426,\"y\":0.2207099199295044},{\"score\":0.4671269357204437,\"part\":\"leftEar\",\"x\":0.5022231936454773,\"y\":0.23144185543060303},{\"score\":0.8379968404769897,\"part\":\"rightEar\",\"x\":0.4541185796260834,\"y\":0.22398076951503754},{\"score\":0.9470565319061279,\"part\":\"leftShoulder\",\"x\":0.5180975198745728,\"y\":0.25508201122283936},{\"score\":0.9593396186828613,\"part\":\"rightShoulder\",\"x\":0.4217905104160309,\"y\":0.25453972816467285},{\"score\":0.9039157629013062,\"part\":\"leftElbow\",\"x\":0.5840085744857788,\"y\":0.27065667510032654},{\"score\":0.5606507658958435,\"part\":\"rightElbow\",\"x\":0.3625507652759552,\"y\":0.27302464842796326},{\"score\":0.029138606041669846,\"part\":\"leftWrist\",\"x\":0.7378389835357666,\"y\":0.27238738536834717},{\"score\":0.10742399096488953,\"part\":\"rightWrist\",\"x\":0.3500075936317444,\"y\":0.26305219531059265},{\"score\":0.9908264875411987,\"part\":\"leftHip\",\"x\":0.5302647948265076,\"y\":0.37637588381767273},{\"score\":0.985880434513092,\"part\":\"rightHip\",\"x\":0.4490097463130951,\"y\":0.39006462693214417},{\"score\":0.9387675523757935,\"part\":\"leftKnee\",\"x\":0.620145857334137,\"y\":0.4801478087902069},{\"score\":0.9466171860694885,\"part\":\"rightKnee\",\"x\":0.45219728350639343,\"y\":0.49582886695861816},{\"score\":0.8219438195228577,\"part\":\"leftAnkle\",\"x\":0.694668710231781,\"y\":0.5670613050460815},{\"score\":0.8808907866477966,\"part\":\"rightAnkle\",\"x\":0.45580804347991943,\"y\":0.5815025568008423},\"2020-08-22 12:25:29.135876\"]', '2020-08-22 12:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `therapy_to_patient`
--

CREATE TABLE `therapy_to_patient` (
  `id` int(11) NOT NULL,
  `therapy_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `frequency` tinytext COLLATE utf8_unicode_ci,
  `intensity` tinytext COLLATE utf8_unicode_ci,
  `time` tinytext COLLATE utf8_unicode_ci,
  `type` tinytext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางบันทึกการมอบหมายท่ากายภาพบำบัดให้กับผู้ป่วย';

--
-- Dumping data for table `therapy_to_patient`
--

INSERT INTO `therapy_to_patient` (`id`, `therapy_id`, `record_id`, `frequency`, `intensity`, `time`, `type`) VALUES
(7, 3, 16, '', '', '', ''),
(8, 2, 16, '', '', '', ''),
(9, 1, 17, '', '', '', ''),
(10, 3, 17, '', '', '', ''),
(11, 2, 17, '', '', '', ''),
(12, 3, 18, '', '', '', ''),
(13, 1, 18, '', '', '', ''),
(14, 2, 19, '5 วันต่อสัปดาห์', '60% ของอัตราการเต้นสูงสุดของหัวใจ ', '45 นาที', 'ยืดเหยียด'),
(15, 2, 20, '5 วันต่อสัปดาห์', '60% ของอัตราการเต้นสูงสุดของหัวใจ ', '45 นาที', 'ยืดเหยียด'),
(16, 3, 20, '2 ครั้งต่อสัปดาห์', '1', 'time', NULL),
(17, 2, 21, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(18, 1, 21, '3-5 ครั้งต่อสัปดาห์', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียด'),
(19, 2, 22, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(20, 3, 23, '2 ครั้งต่อสัปดาห์', NULL, NULL, NULL),
(21, 2, 25, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(22, 1, 26, '3-5 ครั้งต่อสัปดาห์', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียด'),
(23, 2, 26, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(24, 1, 27, '3-5 ครั้งต่อสัปดาห์', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียด'),
(25, 1, 28, '3-5 ครั้งต่อสัปดาห์', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียดกล้ามเนื้อ'),
(26, 2, 29, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(27, 1, 29, '3-5 ครั้งต่อสัปดาห์', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียด'),
(28, 1, 30, '', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียด'),
(29, 2, 32, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(30, 2, 33, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(31, 2, 35, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(32, 3, 35, '2 ครั้งต่อสัปดาห์', NULL, NULL, NULL),
(33, 2, 36, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(34, 3, 36, '2 ครั้งต่อสัปดาห์', NULL, NULL, NULL),
(35, 3, 37, '2 ครั้งต่อสัปดาห์', NULL, NULL, NULL),
(36, 1, 37, '3-5 ครั้งต่อสัปดาห์', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียด'),
(37, 2, 37, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(38, 1, 38, '3-5 ครั้งต่อสัปดาห์', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียด'),
(39, 2, 41, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(40, 1, 42, '3-5 ครั้งต่อสัปดาห์', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียด'),
(41, 2, 42, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(42, 1, 43, '3-5 ครั้งต่อสัปดาห์', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียด'),
(43, 2, 43, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(44, 1, 45, '3-5 ครั้งต่อสัปดาห์', 'ตามความเหมาะสมของร่างกาย', 'อย่างน้อย 30 นาที', 'ยืดเหยียด'),
(45, 2, 45, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล'),
(46, 2, 46, '1 ครั้ง/วัน', '2 KG.', '30 นาที', 'ยกดัมเบล'),
(47, 2, 46, '1 ครั้ง/วัน', '3 KG.', '30 นาที', 'ยกดัมเบล');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ข้อมูลวิธีการรักษา';

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`id`, `name`, `status`) VALUES
(1, 'Joint Mobilization&amp;Manipulation', 1),
(2, 'Massage/Acupressure', 1),
(3, 'Stretching', 1),
(4, 'Ultrasound diathermy / US', 1),
(5, 'Short wave diathermy / SWD', 1),
(6, 'Laser diathermy / Laser', 1),
(7, 'Hydrocollator', 1),
(8, 'Paraffin', 1),
(9, 'Cryotherapy', 1),
(10, 'Cervical traction', 1),
(11, 'Pelvic traction', 1),
(12, 'Electrical nerve stimulation / ES', 1),
(13, 'Combined ultrasound and electrical stimulation / Combined ES', 1),
(14, 'Shock wave therapy', 1),
(15, 'Continuous passive motion', 1),
(16, 'Tilt table', 1),
(17, 'Lite gait', 1),
(18, 'Active exercise / General exercise', 1),
(19, 'Passive exercise / ROM exercise', 1),
(20, 'Strengthening exercise', 1),
(21, 'Self-stretching exercise', 1),
(22, 'Specific therapeutic exercise', 1),
(23, 'Home program exercise', 1),
(24, 'Percussion', 1),
(25, 'Coughing', 1),
(26, 'Postural drainage', 1),
(27, 'Breathing exercise', 1),
(28, 'Vibration', 1),
(29, 'Sharking', 1),
(30, 'Chest mobilization', 1),
(31, 'Balance training', 1),
(32, 'Gait training', 1),
(33, 'Ambulation training', 1),
(34, 'Transfer training', 1),
(35, 'ADL training', 1),
(36, 'Gross Motor Developmental training', 1),
(37, 'Cardiac Rehabilitation', 1),
(38, 'Strapping / Tapping', 1),
(39, 'Bandaging training', 1),
(40, 'Pre/Post Natal Physical therapy', 1),
(41, 'การสอนใช้กายอุปกรณ์เทียม / เสริม', 1),
(42, 'Ergonomic evaluation & modification for home/work place', 1);

-- --------------------------------------------------------

--
-- Table structure for table `treatment_to_patient`
--

CREATE TABLE `treatment_to_patient` (
  `id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางบันทึกการมอบหมายท่ากายภาพบำบัดให้กับผู้ป่วย';

--
-- Dumping data for table `treatment_to_patient`
--

INSERT INTO `treatment_to_patient` (`id`, `treatment_id`, `record_id`) VALUES
(1, 30, 21),
(2, 33, 22),
(3, 18, 22),
(4, 18, 23),
(5, 31, 23),
(6, 39, 24),
(7, 31, 25),
(8, 35, 26),
(9, 27, 26),
(10, 10, 27),
(11, 33, 28),
(12, 37, 29),
(13, 31, 30),
(14, 33, 32),
(15, 33, 33),
(16, 27, 35),
(17, 33, 35),
(18, 25, 36),
(19, 33, 37),
(20, 18, 38),
(21, 35, 41),
(22, 35, 42),
(23, 27, 43),
(24, 31, 43),
(25, 33, 45),
(26, 15, 46),
(27, 35, 47),
(28, 33, 47),
(29, 18, 50);

-- --------------------------------------------------------

--
-- Table structure for table `type_disease`
--

CREATE TABLE `type_disease` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `initials` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `has_painpoint` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ข้อมูลประเภทของโรค';

--
-- Dumping data for table `type_disease`
--

INSERT INTO `type_disease` (`id`, `name`, `initials`, `has_painpoint`, `status`) VALUES
(1, 'Cardiopulmonary', 'Chest', 0, 1),
(2, 'Orthopedic', 'Ortho', 1, 1),
(3, 'Neurological', 'Neuro', 0, 1),
(4, 'Pediatric', 'Ped', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ข้อมูลนักการภาพบำบัดและผู้ดูแลระบบ';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `title`, `firstname`, `lastname`, `email`, `password`, `role`, `status`) VALUES
(1, 'นาย', 'ชวิน', 'อิงชาติเจริญพร', '6031302016@lamduan.mfu.ac.th', '$2b$10$YfFA1nCy8XtXUauNjdLnQeAGue.8t1rwz1MvBVze6ICNFUhzVwKv2', 'A', 1),
(2, 'Mr', 'Apichat', 'Chunpensree', '5931302014@lamduan.mfu.ac.th', NULL, 'A', 1),
(3, 'Mr', 'Boontong', 'Jinakan', 'tuboontong@gmail.com', NULL, 'A', 1),
(4, 'นาย', 'พิทักพงษ์', 'พุ่มเจริญ', '5931302024@lamduan.mfu.ac.th', NULL, 'A', 1),
(5, 'นางสาว', 'ภัทราพร', 'ลอยบรรดิษฐ์', '6031302008@lamduan.mfu.ac.th', NULL, 'A', 1),
(6, 'อาจารย์', 'สุรพงษ์', 'อุตมา', 'surapong@mfu.ac.th', NULL, 'A', 1),
(7, 'นางสาว', 'ฉัตรชฎา', 'สุตาลังกา', 'chatchada.sut@mfu.ac.th', NULL, 'M', 1),
(8, 'กภ.', 'วิทยากุล', 'สมชาติ', 'witthayakul.som@mfu.ac.th', NULL, 'A', 1),
(10, 'Mr.', 'Pongsakorn', 'Tatongjai', 'ton@mail.com', '$2b$10$/L3KkZTXD3NmlU7vq/46neAbyQLIg4vaJS5hFx721HDfY0aWS7XYu', 'M', 1),
(11, 'นางสาว', 'วีร์ธิมา', 'นันท์บัญชา', 'weethima.nan@mfu.ac.th', '$2b$10$u7tY4WHbwcYFJHPjLwmmV./ch4HjxswAiGP7/I8jVf/yGNf5sQazu', 'M', 1),
(12, 'นาย', 'พลกฤต', 'แก้วมูล', 'ponlakritz@gmail.com', NULL, 'A', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_doctor_history`
--
ALTER TABLE `chat_doctor_history`
  ADD PRIMARY KEY (`history_id`);

--
-- Indexes for table `chat_room`
--
ALTER TABLE `chat_room`
  ADD PRIMARY KEY (`chat_no`);

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`id`),
  ADD KEY `painpoint_id` (`painpoint_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `history_chat`
--
ALTER TABLE `history_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indi_chest`
--
ALTER TABLE `indi_chest`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `indi_neuro`
--
ALTER TABLE `indi_neuro`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `indi_ortho`
--
ALTER TABLE `indi_ortho`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `mapping_group_chat`
--
ALTER TABLE `mapping_group_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pain_point`
--
ALTER TABLE `pain_point`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_record`
--
ALTER TABLE `patient_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disease_id` (`disease_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_id` (`record_id`);

--
-- Indexes for table `therapy`
--
ALTER TABLE `therapy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `therapy_exercise`
--
ALTER TABLE `therapy_exercise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tp_id` (`tp_id`);

--
-- Indexes for table `therapy_to_patient`
--
ALTER TABLE `therapy_to_patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_id` (`record_id`),
  ADD KEY `therapy_id` (`therapy_id`) USING BTREE;

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treatment_to_patient`
--
ALTER TABLE `treatment_to_patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_id` (`record_id`),
  ADD KEY `therapy_id` (`treatment_id`) USING BTREE;

--
-- Indexes for table `type_disease`
--
ALTER TABLE `type_disease`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_doctor_history`
--
ALTER TABLE `chat_doctor_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat_room`
--
ALTER TABLE `chat_room`
  MODIFY `chat_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `disease`
--
ALTER TABLE `disease`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `history_chat`
--
ALTER TABLE `history_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapping_group_chat`
--
ALTER TABLE `mapping_group_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pain_point`
--
ALTER TABLE `pain_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `patient_record`
--
ALTER TABLE `patient_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `therapy`
--
ALTER TABLE `therapy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `therapy_exercise`
--
ALTER TABLE `therapy_exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `therapy_to_patient`
--
ALTER TABLE `therapy_to_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `treatment_to_patient`
--
ALTER TABLE `treatment_to_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `type_disease`
--
ALTER TABLE `type_disease`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disease`
--
ALTER TABLE `disease`
  ADD CONSTRAINT `disease_ibfk_1` FOREIGN KEY (`painpoint_id`) REFERENCES `pain_point` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `disease_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type_disease` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `pain_point`
--
ALTER TABLE `pain_point`
  ADD CONSTRAINT `pain_point_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type_disease` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `patient_record`
--
ALTER TABLE `patient_record`
  ADD CONSTRAINT `patient_record_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `patient_record_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `patient_record_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `patient_record` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `therapy_exercise`
--
ALTER TABLE `therapy_exercise`
  ADD CONSTRAINT `therapy_exercise_ibfk_1` FOREIGN KEY (`tp_id`) REFERENCES `therapy_to_patient` (`id`);

--
-- Constraints for table `therapy_to_patient`
--
ALTER TABLE `therapy_to_patient`
  ADD CONSTRAINT `therapy_to_patient_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `patient_record` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `therapy_to_patient_ibfk_2` FOREIGN KEY (`therapy_id`) REFERENCES `therapy` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `treatment_to_patient`
--
ALTER TABLE `treatment_to_patient`
  ADD CONSTRAINT `treatment_to_patient_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `patient_record` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `treatment_to_patient_ibfk_2` FOREIGN KEY (`treatment_id`) REFERENCES `treatment` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
