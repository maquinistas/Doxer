-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2022 at 12:55 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doxer`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add booking', 7, 'add_booking'),
(26, 'Can change booking', 7, 'change_booking'),
(27, 'Can delete booking', 7, 'delete_booking'),
(28, 'Can view booking', 7, 'view_booking'),
(29, 'Can add car_name', 8, 'add_car_name'),
(30, 'Can change car_name', 8, 'change_car_name'),
(31, 'Can delete car_name', 8, 'delete_car_name'),
(32, 'Can view car_name', 8, 'view_car_name'),
(33, 'Can add cities', 9, 'add_cities'),
(34, 'Can change cities', 9, 'change_cities'),
(35, 'Can delete cities', 9, 'delete_cities'),
(36, 'Can view cities', 9, 'view_cities'),
(37, 'Can add driver', 10, 'add_driver'),
(38, 'Can change driver', 10, 'change_driver'),
(39, 'Can delete driver', 10, 'delete_driver'),
(40, 'Can view driver', 10, 'view_driver'),
(41, 'Can add passanger', 11, 'add_passanger'),
(42, 'Can change passanger', 11, 'change_passanger'),
(43, 'Can delete passanger', 11, 'delete_passanger'),
(44, 'Can view passanger', 11, 'view_passanger'),
(45, 'Can add ride', 12, 'add_ride'),
(46, 'Can change ride', 12, 'change_ride'),
(47, 'Can delete ride', 12, 'delete_ride'),
(48, 'Can view ride', 12, 'view_ride'),
(49, 'Can add vehical_brand', 13, 'add_vehical_brand'),
(50, 'Can change vehical_brand', 13, 'change_vehical_brand'),
(51, 'Can delete vehical_brand', 13, 'delete_vehical_brand'),
(52, 'Can view vehical_brand', 13, 'view_vehical_brand'),
(53, 'Can add vehicle', 14, 'add_vehicle'),
(54, 'Can change vehicle', 14, 'change_vehicle'),
(55, 'Can delete vehicle', 14, 'delete_vehicle'),
(56, 'Can view vehicle', 14, 'view_vehicle'),
(57, 'Can add trip', 15, 'add_trip'),
(58, 'Can change trip', 15, 'change_trip'),
(59, 'Can delete trip', 15, 'delete_trip'),
(60, 'Can view trip', 15, 'view_trip'),
(61, 'Can add search_ history', 16, 'add_search_history'),
(62, 'Can change search_ history', 16, 'change_search_history'),
(63, 'Can delete search_ history', 16, 'delete_search_history'),
(64, 'Can view search_ history', 16, 'view_search_history'),
(65, 'Can add ride_pin', 17, 'add_ride_pin'),
(66, 'Can change ride_pin', 17, 'change_ride_pin'),
(67, 'Can delete ride_pin', 17, 'delete_ride_pin'),
(68, 'Can view ride_pin', 17, 'view_ride_pin'),
(69, 'Can add passenger_ report', 18, 'add_passenger_report'),
(70, 'Can change passenger_ report', 18, 'change_passenger_report'),
(71, 'Can delete passenger_ report', 18, 'delete_passenger_report'),
(72, 'Can view passenger_ report', 18, 'view_passenger_report'),
(73, 'Can add passenger_ rating', 19, 'add_passenger_rating'),
(74, 'Can change passenger_ rating', 19, 'change_passenger_rating'),
(75, 'Can delete passenger_ rating', 19, 'delete_passenger_rating'),
(76, 'Can view passenger_ rating', 19, 'view_passenger_rating'),
(77, 'Can add id_proofe', 20, 'add_id_proofe'),
(78, 'Can change id_proofe', 20, 'change_id_proofe'),
(79, 'Can delete id_proofe', 20, 'delete_id_proofe'),
(80, 'Can view id_proofe', 20, 'view_id_proofe'),
(81, 'Can add drivers_ rating', 21, 'add_drivers_rating'),
(82, 'Can change drivers_ rating', 21, 'change_drivers_rating'),
(83, 'Can delete drivers_ rating', 21, 'delete_drivers_rating'),
(84, 'Can view drivers_ rating', 21, 'view_drivers_rating'),
(85, 'Can add driver_ report', 22, 'add_driver_report'),
(86, 'Can change driver_ report', 22, 'change_driver_report'),
(87, 'Can delete driver_ report', 22, 'delete_driver_report'),
(88, 'Can view driver_ report', 22, 'view_driver_report'),
(89, 'Can add booking_pin', 23, 'add_booking_pin'),
(90, 'Can change booking_pin', 23, 'change_booking_pin'),
(91, 'Can delete booking_pin', 23, 'delete_booking_pin'),
(92, 'Can view booking_pin', 23, 'view_booking_pin'),
(93, 'Can add admin_credentials', 24, 'add_admin_credentials'),
(94, 'Can change admin_credentials', 24, 'change_admin_credentials'),
(95, 'Can delete admin_credentials', 24, 'delete_admin_credentials'),
(96, 'Can view admin_credentials', 24, 'view_admin_credentials'),
(97, 'Can add cars_data', 25, 'add_cars_data'),
(98, 'Can change cars_data', 25, 'change_cars_data'),
(99, 'Can delete cars_data', 25, 'delete_cars_data'),
(100, 'Can view cars_data', 25, 'view_cars_data'),
(101, 'Can add india car database by teoalida full specs sample', 26, 'add_indiacardatabasebyteoalidafullspecssample'),
(102, 'Can change india car database by teoalida full specs sample', 26, 'change_indiacardatabasebyteoalidafullspecssample'),
(103, 'Can delete india car database by teoalida full specs sample', 26, 'delete_indiacardatabasebyteoalidafullspecssample'),
(104, 'Can view india car database by teoalida full specs sample', 26, 'view_indiacardatabasebyteoalidafullspecssample'),
(105, 'Can add car_data', 27, 'add_car_data'),
(106, 'Can change car_data', 27, 'change_car_data'),
(107, 'Can delete car_data', 27, 'delete_car_data'),
(108, 'Can view car_data', 27, 'view_car_data'),
(109, 'Can add car_ details', 28, 'add_car_details'),
(110, 'Can change car_ details', 28, 'change_car_details'),
(111, 'Can delete car_ details', 28, 'delete_car_details'),
(112, 'Can view car_ details', 28, 'view_car_details');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$QXHrOwJClOkgnDIVQ0EBjz$jglXnSFnpZ3WZW5IWwoGcu2IbfANHmcTttCE+vawmk4=', '2022-04-14 10:08:36.742298', 1, 'djangoadmin', '', '', 'admin@mailinator.com', 1, 1, '2022-03-16 10:05:27.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-03-16 11:09:41.393051', '1', 'name', 2, '[{\"changed\": {\"fields\": [\"Active ac with otp\", \"Gender\"]}}]', 10, 1),
(2, '2022-03-16 11:16:49.702728', '1', 'TEST', 1, '[{\"added\": {}}]', 13, 1),
(3, '2022-03-16 11:17:02.097960', '1', 'TEST CAR', 1, '[{\"added\": {}}]', 8, 1),
(4, '2022-03-16 11:17:54.535092', '2', 'hardik \'s TEST TEST CAR', 1, '[{\"added\": {}}]', 14, 1),
(5, '2022-03-16 11:18:05.264929', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(6, '2022-03-16 11:24:19.135075', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(7, '2022-03-16 11:52:11.930877', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Capacity\"]}}]', 12, 1),
(8, '2022-03-16 11:52:26.756324', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Seats\"]}}]', 12, 1),
(9, '2022-03-16 11:56:10.298969', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Seats\"]}}]', 12, 1),
(10, '2022-03-16 11:58:44.165808', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Capacity\"]}}]', 12, 1),
(11, '2022-03-16 11:59:38.121773', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Seats\"]}}]', 12, 1),
(12, '2022-03-16 12:01:01.234425', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Capacity\"]}}]', 12, 1),
(13, '2022-03-16 12:07:32.475437', '1', 'Ride_pin object (1)', 1, '[{\"added\": {}}]', 17, 1),
(14, '2022-03-16 12:24:44.464516', '2', 'Ride object (2)', 2, '[{\"changed\": {\"fields\": [\"Capacity\"]}}]', 12, 1),
(15, '2022-03-16 12:27:40.429935', '2', 'Ride object (2)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(16, '2022-03-16 12:27:45.246624', '1', 'Ride object (1)', 2, '[]', 12, 1),
(17, '2022-03-16 12:29:21.653779', '2', 'Ride object (2)', 2, '[]', 12, 1),
(18, '2022-03-16 12:29:27.405923', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(19, '2022-03-16 12:30:25.671549', '2', 'Ride_pin object (2)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(20, '2022-03-16 12:30:30.367850', '2', 'Ride_pin object (2)', 2, '[]', 17, 1),
(21, '2022-03-16 12:30:37.903237', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Mine ride\"]}}]', 17, 1),
(22, '2022-03-16 12:30:45.382522', '2', 'Ride_pin object (2)', 2, '[{\"changed\": {\"fields\": [\"Mine ride\"]}}]', 17, 1),
(23, '2022-03-16 12:31:47.606788', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"PickUp\", \"PickUp latitude\", \"PickUp longitude\", \"Dropout\", \"Dropout latitude\", \"Dropout longitude\"]}}]', 12, 1),
(24, '2022-03-16 12:31:54.759691', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(25, '2022-03-16 12:54:41.148244', '1', 'Ride object (1)', 2, '[]', 12, 1),
(26, '2022-03-16 12:55:47.875662', '2', 'Ride object (2)', 2, '[{\"changed\": {\"fields\": [\"Capacity\"]}}]', 12, 1),
(27, '2022-03-16 13:44:27.993202', '3', 'Ride object (3)', 2, '[{\"changed\": {\"fields\": [\"Capacity\"]}}]', 12, 1),
(28, '2022-03-16 14:00:37.901343', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(29, '2022-03-17 04:51:20.614085', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Trip status\"]}}]', 12, 1),
(30, '2022-03-17 04:52:57.475405', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(31, '2022-03-17 04:53:26.146586', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(32, '2022-03-17 04:54:39.938464', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(33, '2022-03-17 05:33:14.802827', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Pas status\"]}}]', 17, 1),
(34, '2022-03-17 05:50:18.316533', '2', '8980940836', 3, '', 11, 1),
(35, '2022-03-17 07:18:17.282093', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(36, '2022-03-17 07:55:54.595792', '3', 'Nikhil Patil', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Username\", \"Gender\"]}}]', 11, 1),
(37, '2022-03-17 11:14:44.301361', '1', 'name', 3, '', 10, 1),
(38, '2022-03-17 11:14:58.994076', '8', 'hr test', 3, '', 10, 1),
(39, '2022-03-17 11:14:59.016190', '9', 'driver 1', 3, '', 10, 1),
(40, '2022-03-17 12:15:07.254768', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(41, '2022-03-17 12:41:28.294339', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Car longitude\"]}}]', 12, 1),
(42, '2022-03-21 04:20:02.619427', '7', 'Ride_pin object (7)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(43, '2022-03-21 04:23:11.056101', '13', 'Ride object (13)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(44, '2022-03-21 04:23:33.344160', '7', 'Ride_pin object (7)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(45, '2022-03-21 04:24:26.150952', '8', 'Ride_pin object (8)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(46, '2022-03-21 04:24:42.717874', '8', 'Ride_pin object (8)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(47, '2022-03-21 04:24:50.256871', '7', 'Ride_pin object (7)', 2, '[]', 17, 1),
(48, '2022-03-21 04:34:13.287712', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(49, '2022-03-21 04:34:34.526275', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(50, '2022-03-21 04:35:01.423294', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(51, '2022-03-21 05:18:50.135383', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\", \"Status\"]}}]', 12, 1),
(52, '2022-03-21 05:19:02.629946', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(53, '2022-03-21 05:19:53.715952', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(54, '2022-03-21 05:31:48.981207', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(55, '2022-03-21 05:55:39.924648', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(56, '2022-03-21 05:58:43.978845', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(57, '2022-03-21 05:59:54.719105', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(58, '2022-03-21 06:02:34.200819', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(59, '2022-03-21 06:07:56.522730', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\"]}}]', 12, 1),
(60, '2022-03-21 06:08:07.433306', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(61, '2022-03-21 06:11:05.874373', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\"]}}]', 12, 1),
(62, '2022-03-21 06:11:41.482663', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(63, '2022-03-21 06:14:04.820736', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(64, '2022-03-21 06:45:16.508544', '1', 'Ride_pin object (1)', 2, '[]', 17, 1),
(65, '2022-03-21 06:47:02.026446', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(66, '2022-03-21 06:48:33.758605', '15', 'dt1', 2, '[{\"changed\": {\"fields\": [\"Active ac with otp\", \"Gender\"]}}]', 10, 1),
(67, '2022-03-21 06:48:57.336363', '15', 'dt1', 2, '[{\"changed\": {\"fields\": [\"Active ac with otp\"]}}]', 10, 1),
(68, '2022-03-21 06:56:38.997006', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(69, '2022-03-21 06:56:39.002538', '2', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(70, '2022-03-21 07:37:13.248135', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(71, '2022-03-21 07:40:04.889702', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(72, '2022-03-21 07:40:49.587490', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(73, '2022-03-21 07:56:04.308003', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(74, '2022-03-21 09:11:54.267506', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(75, '2022-03-21 09:12:09.458793', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(76, '2022-03-21 09:14:07.567289', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(77, '2022-03-21 09:46:50.243145', '10', 'Ride_pin object (10)', 3, '', 17, 1),
(78, '2022-03-21 09:51:13.134481', '11', 'Ride_pin object (11)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(79, '2022-03-21 09:51:33.381713', '11', 'Ride_pin object (11)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(80, '2022-03-21 10:12:03.024834', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(81, '2022-03-21 10:13:31.275034', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(82, '2022-03-21 10:16:56.349748', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(83, '2022-03-21 10:23:42.282198', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(84, '2022-03-21 10:23:59.618221', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(85, '2022-03-21 10:24:15.549240', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(86, '2022-03-21 10:27:44.116312', '11', 'Ride_pin object (11)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(87, '2022-03-21 10:29:43.667670', '15', 'Ride object (15)', 2, '[{\"changed\": {\"fields\": [\"PickUp\", \"PickUp latitude\", \"PickUp longitude\", \"Dropout\", \"Dropout latitude\", \"Dropout longitude\"]}}]', 12, 1),
(88, '2022-03-21 10:30:58.436081', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(89, '2022-03-21 10:36:48.393256', '3', 'hardik', 2, '[{\"changed\": {\"fields\": [\"Active ac with otp\", \"Gender\"]}}]', 10, 1),
(90, '2022-03-21 10:37:15.630048', '3', 'hardik', 2, '[{\"changed\": {\"fields\": [\"Pro image\"]}}]', 10, 1),
(91, '2022-03-21 10:41:37.884850', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(92, '2022-03-21 10:43:17.637307', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(93, '2022-03-21 10:57:16.460923', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(94, '2022-03-21 10:59:15.441960', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(95, '2022-03-21 10:59:35.739830', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(96, '2022-03-21 11:07:11.531110', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(97, '2022-03-21 11:08:34.147513', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(98, '2022-03-21 11:19:01.292081', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(99, '2022-03-21 12:02:16.206469', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(100, '2022-03-21 12:02:16.213795', '2', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(101, '2022-03-21 12:02:16.218335', '3', 'hiii \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(102, '2022-03-21 13:43:15.255730', '11', 'Ride_pin object (11)', 3, '', 17, 1),
(103, '2022-03-21 13:53:27.215972', '13', 'Ride object (13)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(104, '2022-03-21 13:54:23.219209', '13', 'Ride object (13)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(105, '2022-03-22 10:41:59.983917', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(106, '2022-03-22 10:41:59.996723', '2', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(107, '2022-03-22 10:44:07.187126', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(108, '2022-03-22 10:44:07.192086', '3', 'hiii \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(109, '2022-03-22 10:44:34.860533', '3', 'hiii \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(110, '2022-03-22 10:45:58.046458', '2', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(111, '2022-03-22 10:46:14.540554', '2', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(112, '2022-03-22 10:46:47.708324', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(113, '2022-03-22 10:48:17.940860', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(114, '2022-03-22 10:48:17.945867', '2', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(115, '2022-03-22 10:50:50.628152', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(116, '2022-03-22 10:50:50.634470', '3', 'hiii \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(117, '2022-03-22 10:52:00.646004', '2', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(118, '2022-03-22 10:52:00.650989', '3', 'hiii \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(119, '2022-03-22 10:52:46.796962', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(120, '2022-03-22 10:52:46.801951', '3', 'hiii \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(121, '2022-03-22 10:53:39.308906', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(122, '2022-03-22 10:53:39.313339', '2', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(123, '2022-03-22 10:55:24.746785', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(124, '2022-03-22 10:57:38.166238', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(125, '2022-03-22 10:57:38.171224', '2', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(126, '2022-03-22 10:58:38.263628', '1', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(127, '2022-03-22 11:02:43.094022', '13', 'Ride object (13)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(128, '2022-03-22 11:04:00.408151', '13', 'Ride object (13)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(129, '2022-03-22 12:35:42.452736', '8', 'khushbu vyas', 2, '[{\"changed\": {\"fields\": [\"Active ac with otp\", \"Gender\"]}}]', 11, 1),
(130, '2022-03-23 05:19:11.550963', '12', 'Ride_pin object (12)', 1, '[{\"added\": {}}]', 17, 1),
(131, '2022-03-23 05:26:40.371806', '12', 'Ride_pin object (12)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(132, '2022-03-23 06:15:39.450382', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(133, '2022-03-23 06:15:48.854019', '2', 'Ride object (2)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(134, '2022-03-23 06:16:06.916544', '17', 'Ride object (17)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(135, '2022-03-23 07:40:55.569797', '1', 'name \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Driverid\", \"Reg num\"]}}]', 14, 1),
(136, '2022-03-23 07:40:59.616427', '1', 'name \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(137, '2022-03-23 07:41:05.713421', '2', 'hii \'s TEST TEST CAR', 2, '[]', 14, 1),
(138, '2022-03-23 07:41:14.406303', '3', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Driverid\", \"Reg num\"]}}]', 14, 1),
(139, '2022-03-23 07:41:20.282421', '4', 'hardik \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Driverid\", \"Reg num\"]}}]', 14, 1),
(140, '2022-03-23 07:41:26.185981', '5', '6036 hardik sapariya \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Driverid\"]}}]', 14, 1),
(141, '2022-03-23 07:41:35.938667', '6', 'driver1 \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Driverid\", \"Reg num\"]}}]', 14, 1),
(142, '2022-03-23 07:45:07.102148', '5', '6036 hardik sapariya \'s TEST TEST CAR', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(143, '2022-03-23 12:24:36.172503', '17', 'Ride object (17)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\", \"Trip status\"]}}]', 12, 1),
(144, '2022-03-23 13:31:34.806686', '17', 'Ride object (17)', 2, '[{\"changed\": {\"fields\": [\"Dropout latitude\", \"Dropout longitude\"]}}]', 12, 1),
(145, '2022-03-23 13:31:51.169417', '17', 'Ride object (17)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(146, '2022-03-23 13:32:59.730415', '8', 'Ride_pin object (8)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(147, '2022-03-23 13:39:23.837945', '17', 'Ride object (17)', 2, '[{\"changed\": {\"fields\": [\"Dropout latitude\", \"Dropout longitude\"]}}]', 12, 1),
(148, '2022-03-23 13:40:12.036505', '8', 'Ride_pin object (8)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(149, '2022-03-23 13:41:07.882444', '8', 'Ride_pin object (8)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(150, '2022-03-23 13:41:22.938441', '8', 'Ride object (8)', 2, '[{\"changed\": {\"fields\": [\"Pickup address1\", \"Pickup address2\", \"Dropout address1\"]}}]', 12, 1),
(151, '2022-03-23 13:42:00.785450', '12', 'Ride_pin object (12)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(152, '2022-03-23 13:47:26.793471', '15', 'Ride object (15)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(153, '2022-03-23 13:59:22.976126', '18', 'Ride object (18)', 2, '[{\"changed\": {\"fields\": [\"Dropout longitude\", \"Pickup address1\"]}}]', 12, 1),
(154, '2022-03-23 14:00:00.674326', '18', 'Ride object (18)', 2, '[{\"changed\": {\"fields\": [\"PickUp longitude\", \"Dropout latitude\"]}}]', 12, 1),
(155, '2022-03-24 04:27:05.195451', '15', 'Ride object (15)', 3, '', 12, 1),
(156, '2022-03-24 04:27:50.211509', '15', 'Ride_pin object (15)', 2, '[]', 17, 1),
(157, '2022-03-24 04:28:06.321281', '14', 'Ride_pin object (14)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(158, '2022-03-24 04:28:41.588224', '1', 'Ride object (1)', 3, '', 12, 1),
(159, '2022-03-24 04:28:41.589889', '2', 'Ride object (2)', 3, '', 12, 1),
(160, '2022-03-24 04:28:41.591207', '3', 'Ride object (3)', 3, '', 12, 1),
(161, '2022-03-24 04:28:41.592476', '4', 'Ride object (4)', 3, '', 12, 1),
(162, '2022-03-24 04:28:41.593644', '5', 'Ride object (5)', 3, '', 12, 1),
(163, '2022-03-24 04:28:41.594670', '6', 'Ride object (6)', 3, '', 12, 1),
(164, '2022-03-24 04:28:41.595697', '7', 'Ride object (7)', 3, '', 12, 1),
(165, '2022-03-24 04:28:41.596351', '8', 'Ride object (8)', 3, '', 12, 1),
(166, '2022-03-24 04:28:41.597351', '9', 'Ride object (9)', 3, '', 12, 1),
(167, '2022-03-24 04:28:41.598348', '10', 'Ride object (10)', 3, '', 12, 1),
(168, '2022-03-24 04:28:41.600076', '11', 'Ride object (11)', 3, '', 12, 1),
(169, '2022-03-24 04:28:41.601287', '12', 'Ride object (12)', 3, '', 12, 1),
(170, '2022-03-24 04:28:41.602390', '13', 'Ride object (13)', 3, '', 12, 1),
(171, '2022-03-24 04:28:41.603387', '14', 'Ride object (14)', 3, '', 12, 1),
(172, '2022-03-24 04:28:41.604351', '16', 'Ride object (16)', 3, '', 12, 1),
(173, '2022-03-24 04:28:56.970255', '15', 'Ride_pin object (15)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(174, '2022-03-24 04:29:03.143252', '14', 'Ride_pin object (14)', 2, '[]', 17, 1),
(175, '2022-03-24 04:29:11.521726', '14', 'Ride_pin object (14)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(176, '2022-03-24 04:29:40.617562', '17', 'Ride object (17)', 3, '', 12, 1),
(177, '2022-03-24 04:29:40.619614', '18', 'Ride object (18)', 3, '', 12, 1),
(178, '2022-03-24 04:56:23.133766', '19', 'Ride object (19)', 2, '[{\"changed\": {\"fields\": [\"Pickup address2\", \"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(179, '2022-03-24 04:57:27.525115', '19', 'Ride object (19)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(180, '2022-03-24 06:10:17.927189', '19', 'Ride object (19)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(181, '2022-03-24 06:13:07.677895', '19', 'Ride object (19)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(182, '2022-03-24 06:44:00.790715', '16', 'Ride_pin object (16)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(183, '2022-03-24 07:53:13.832749', '21', 'Ride object (21)', 2, '[{\"changed\": {\"fields\": [\"Car\"]}}]', 12, 1),
(184, '2022-03-24 08:01:19.492610', '21', 'Ride object (21)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(185, '2022-03-24 08:01:45.219634', '21', 'Ride object (21)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(186, '2022-03-24 08:02:03.683563', '21', 'Ride object (21)', 2, '[{\"changed\": {\"fields\": [\"Car longitude\"]}}]', 12, 1),
(187, '2022-03-24 09:16:21.044344', '17', 'Ride_pin object (17)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(188, '2022-03-24 09:16:59.104534', '16', 'Ride_pin object (16)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(189, '2022-03-24 09:18:04.192661', '17', 'Ride_pin object (17)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(190, '2022-03-24 09:18:09.518173', '16', 'Ride_pin object (16)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(191, '2022-03-24 09:21:51.161141', '16', 'Ride_pin object (16)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(192, '2022-03-24 09:21:56.623606', '17', 'Ride_pin object (17)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(193, '2022-03-24 09:22:58.607640', '21', 'Ride object (21)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(194, '2022-03-24 09:25:07.532506', '15', 'dt1', 2, '[{\"changed\": {\"fields\": [\"Contact no\", \"Gender\"]}}]', 10, 1),
(195, '2022-03-24 09:57:02.102792', '19', 'Ride object (19)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(196, '2022-03-24 09:57:14.803659', '21', 'Ride object (21)', 2, '[{\"changed\": {\"fields\": [\"Status\", \"Trip status\"]}}]', 12, 1),
(197, '2022-03-24 09:57:22.982555', '19', 'Ride object (19)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(198, '2022-03-24 09:57:22.986117', '20', 'Ride object (20)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(199, '2022-03-24 10:45:02.375829', '2', 'BMW', 1, '[{\"added\": {}}]', 13, 1),
(200, '2022-03-24 10:45:04.206496', '3', 'SUZUKI', 1, '[{\"added\": {}}]', 13, 1),
(201, '2022-03-24 10:45:06.527570', '4', 'Honda', 1, '[{\"added\": {}}]', 13, 1),
(202, '2022-03-24 10:45:09.629166', '5', 'Hundai', 1, '[{\"added\": {}}]', 13, 1),
(203, '2022-03-24 10:45:12.316773', '6', 'Mahendra', 1, '[{\"added\": {}}]', 13, 1),
(204, '2022-03-24 10:45:21.440264', '2', 'Thar', 1, '[{\"added\": {}}]', 8, 1),
(205, '2022-03-24 10:45:25.269998', '3', 'XUV 500', 1, '[{\"added\": {}}]', 8, 1),
(206, '2022-03-24 10:45:28.824760', '4', 'BOLERO', 1, '[{\"added\": {}}]', 8, 1),
(207, '2022-03-24 10:45:33.262278', '5', 'Scorpio', 1, '[{\"added\": {}}]', 8, 1),
(208, '2022-03-24 10:45:37.182389', '6', 'Swift', 1, '[{\"added\": {}}]', 8, 1),
(209, '2022-03-24 10:45:42.713658', '7', 'Ertiga', 1, '[{\"added\": {}}]', 8, 1),
(210, '2022-03-24 10:45:52.930022', '8', 'EECO', 1, '[{\"added\": {}}]', 8, 1),
(211, '2022-03-24 10:46:05.104205', '9', 'CIVIC', 1, '[{\"added\": {}}]', 8, 1),
(212, '2022-03-24 10:46:21.161025', '10', 'Grand i10', 1, '[{\"added\": {}}]', 8, 1),
(213, '2022-03-24 10:46:32.753282', '11', 'Grand i20', 1, '[{\"added\": {}}]', 8, 1),
(214, '2022-03-24 11:16:25.493423', '1', 'TEST', 2, '[{\"changed\": {\"fields\": [\"Cars\"]}}]', 8, 1),
(215, '2022-03-24 11:17:22.397655', '1', 'MV', 2, '[{\"changed\": {\"fields\": [\"Brand\"]}}]', 13, 1),
(216, '2022-03-24 12:25:42.355676', '20', 'Ride object (20)', 2, '[{\"changed\": {\"fields\": [\"Dropout\", \"Trip status\"]}}]', 12, 1),
(217, '2022-03-24 13:51:18.456731', '18', 'Ride_pin object (18)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(218, '2022-03-24 13:51:26.645396', '18', 'Ride_pin object (18)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(219, '2022-03-24 13:52:48.808204', '1', 'volkswagen', 2, '[{\"changed\": {\"fields\": [\"Brand\"]}}]', 13, 1),
(220, '2022-03-24 13:52:59.134300', '1', 'POLO', 2, '[{\"changed\": {\"fields\": [\"Cars\"]}}]', 8, 1),
(221, '2022-03-24 13:53:15.804654', '1', 'Volkswagen', 2, '[{\"changed\": {\"fields\": [\"Brand\"]}}]', 13, 1),
(222, '2022-03-24 13:56:05.832654', '19', 'Ride object (19)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(223, '2022-03-24 13:56:25.750023', '19', 'Ride object (19)', 2, '[{\"changed\": {\"fields\": [\"Ride type\"]}}]', 12, 1),
(224, '2022-03-24 14:01:16.331359', '20', 'Ride object (20)', 2, '[]', 12, 1),
(225, '2022-03-24 14:01:25.083386', '20', 'Ride object (20)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(226, '2022-03-24 14:01:46.252858', '17', 'Ride_pin object (17)', 2, '[{\"changed\": {\"fields\": [\"Getride\", \"Status\"]}}]', 17, 1),
(227, '2022-03-24 14:02:44.876275', '20', 'Ride object (20)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(228, '2022-03-24 14:08:17.947572', '26', 'Ride object (26)', 2, '[]', 12, 1),
(229, '2022-03-24 14:08:31.282386', '19', 'Ride_pin object (19)', 2, '[]', 17, 1),
(230, '2022-03-24 14:08:37.187887', '18', 'Ride_pin object (18)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(231, '2022-03-24 14:08:42.338145', '17', 'Ride_pin object (17)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(232, '2022-03-24 14:08:50.435883', '16', 'Ride_pin object (16)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(233, '2022-03-24 14:12:37.347061', '20', 'Ride object (20)', 2, '[{\"changed\": {\"fields\": [\"Ride type\"]}}]', 12, 1),
(234, '2022-03-25 06:12:37.795688', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(235, '2022-03-25 06:13:07.304467', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(236, '2022-03-25 06:20:41.541199', '19', 'Ride_pin object (19)', 3, '', 17, 1),
(237, '2022-03-25 06:20:41.543193', '18', 'Ride_pin object (18)', 3, '', 17, 1),
(238, '2022-03-25 06:20:41.544190', '17', 'Ride_pin object (17)', 3, '', 17, 1),
(239, '2022-03-25 06:20:41.545187', '16', 'Ride_pin object (16)', 3, '', 17, 1),
(240, '2022-03-25 06:42:25.323853', '2', 'hardik \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Vehicle color\"]}}]', 14, 1),
(241, '2022-03-25 07:31:36.463977', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(242, '2022-03-25 07:39:08.432140', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(243, '2022-03-25 07:39:16.622207', '20', 'Ride_pin object (20)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(244, '2022-03-25 07:39:21.932224', '20', 'Ride_pin object (20)', 2, '[]', 17, 1),
(245, '2022-03-25 07:47:44.737279', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(246, '2022-03-25 07:47:50.886637', '20', 'Ride_pin object (20)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(247, '2022-03-25 10:10:29.862377', '3', 'Nikhil Patil', 2, '[{\"changed\": {\"fields\": [\"Ntk\"]}}]', 11, 1),
(248, '2022-03-25 12:57:05.677399', '29', 'Ride object (29)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(249, '2022-03-25 12:59:13.698426', '29', 'Ride object (29)', 2, '[{\"changed\": {\"fields\": [\"PickUp\", \"Trip status\"]}}]', 12, 1),
(250, '2022-03-25 13:02:03.557929', '28', 'Ride object (28)', 2, '[{\"changed\": {\"fields\": [\"Pickup address1\", \"Dropout address2\", \"Trip status\"]}}]', 12, 1),
(251, '2022-03-25 13:02:10.962350', '29', 'Ride object (29)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(252, '2022-03-25 13:23:44.725660', '29', 'Ride object (29)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(253, '2022-03-25 13:26:43.642938', '28', 'Ride object (28)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(254, '2022-03-25 13:28:35.108238', '28', 'Ride object (28)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(255, '2022-03-25 13:28:48.387393', '23', 'Ride_pin object (23)', 2, '[{\"changed\": {\"fields\": [\"PickUp\", \"Status\"]}}]', 17, 1),
(256, '2022-03-25 13:29:05.799391', '23', 'Ride_pin object (23)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(257, '2022-03-25 13:29:53.013787', '23', 'Ride_pin object (23)', 2, '[]', 17, 1),
(258, '2022-03-25 13:30:57.586789', '22', 'Ride_pin object (22)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(259, '2022-03-25 13:41:01.721103', '29', 'Ride object (29)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(260, '2022-03-28 05:10:06.062743', '2', 'name', 2, '[{\"changed\": {\"fields\": [\"Active ac with otp\", \"Gender\"]}}]', 10, 1),
(261, '2022-03-28 05:13:27.736254', '2', 'name', 2, '[{\"changed\": {\"fields\": [\"Image1\", \"Image2\"]}}]', 10, 1),
(262, '2022-03-28 05:17:18.172954', '1', 'Drivers_Rating object (1)', 1, '[{\"added\": {}}]', 21, 1),
(263, '2022-03-28 06:29:35.495223', '1', 'hello', 2, '[{\"changed\": {\"fields\": [\"Image1\", \"Image2\"]}}]', 11, 1),
(264, '2022-03-28 06:30:13.524530', '6', 'hi', 2, '[{\"changed\": {\"fields\": [\"Image1\", \"Image2\", \"Gender\"]}}]', 11, 1),
(265, '2022-03-28 06:30:53.803568', '3', 'Nikhil Patil', 2, '[{\"changed\": {\"fields\": [\"Image1\", \"Image2\", \"Active ac with otp\"]}}]', 11, 1),
(266, '2022-03-28 06:35:50.324116', '1', 'hello', 2, '[{\"changed\": {\"fields\": [\"Image1\", \"Image2\"]}}]', 11, 1),
(267, '2022-03-28 07:07:30.974803', '1', 'Booking object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 7, 1),
(268, '2022-03-28 07:15:06.937203', '2', 'Booking object (2)', 2, '[{\"changed\": {\"fields\": [\"Ride type\"]}}]', 7, 1),
(269, '2022-03-28 07:15:32.463971', '2', 'Booking object (2)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 7, 1),
(270, '2022-03-28 07:23:22.374343', '6', 'hardik-> Requested To ---hello---', 3, '', 23, 1),
(271, '2022-03-28 07:23:22.376339', '5', 'dhujnn-> Requested To ---Khushbu---', 3, '', 23, 1),
(272, '2022-03-28 07:23:22.377156', '4', 'dhujnn-> Requested To ---Khushbu---', 3, '', 23, 1),
(273, '2022-03-28 07:23:22.379155', '3', 'hardik-> Requested To ---hello---', 3, '', 23, 1),
(274, '2022-03-28 07:23:22.380151', '2', 'driver1-> Requested To ---hardik sapariya---', 3, '', 23, 1),
(275, '2022-03-28 07:23:22.382146', '1', 'driver1-> Requested To ---hardik sapariya---', 3, '', 23, 1),
(276, '2022-03-28 07:23:45.883553', '3', 'Booking object (3)', 3, '', 7, 1),
(277, '2022-03-28 07:23:45.886545', '4', 'Booking object (4)', 3, '', 7, 1),
(278, '2022-03-28 07:51:24.114354', '7', 'hardik-> Requested To ---hello---', 2, '[{\"changed\": {\"fields\": [\"Getbooking\"]}}]', 23, 1),
(279, '2022-03-28 07:51:33.968506', '7', 'hardik-> Requested To ---hardik sapariya---', 2, '[{\"changed\": {\"fields\": [\"Getbooking\"]}}]', 23, 1),
(280, '2022-03-28 07:54:11.414628', '7', 'hardik-> Requested To ---hardik sapariya---', 3, '', 23, 1),
(281, '2022-03-28 07:54:18.390069', '1', 'Booking object (1)', 2, '[]', 7, 1),
(282, '2022-03-28 07:54:23.890487', '2', 'Booking object (2)', 2, '[]', 7, 1),
(283, '2022-03-28 07:54:29.533897', '5', 'Booking object (5)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 7, 1),
(284, '2022-03-28 07:54:37.550035', '6', 'Booking object (6)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 7, 1),
(285, '2022-03-28 08:00:57.091302', '8', 'hardik-> Requested To ---hello---', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 23, 1),
(286, '2022-03-28 08:01:07.063632', '8', 'hardik-> Requested To ---hello---', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 23, 1),
(287, '2022-03-28 08:51:19.011694', '2', 'name', 2, '[{\"changed\": {\"fields\": [\"Image2\"]}}]', 10, 1),
(288, '2022-03-28 08:51:36.892291', '2', 'name', 2, '[{\"changed\": {\"fields\": [\"Image2\"]}}]', 10, 1),
(289, '2022-03-28 08:51:51.240657', '2', 'name', 2, '[{\"changed\": {\"fields\": [\"Image1\"]}}]', 10, 1),
(290, '2022-03-28 08:58:11.976345', '2', 'name', 2, '[{\"changed\": {\"fields\": [\"Image2\"]}}]', 10, 1),
(291, '2022-03-28 09:33:03.159870', '21', 'niks', 2, '[{\"changed\": {\"fields\": [\"Email or num\", \"Email\", \"Gender\"]}}]', 11, 1),
(292, '2022-03-28 09:33:11.798986', '21', 'niks', 3, '', 11, 1),
(293, '2022-03-28 11:13:12.049591', '21', 'test driver', 2, '[{\"changed\": {\"fields\": [\"Gender\"]}}]', 10, 1),
(294, '2022-03-28 11:15:29.941452', '21', 'test driver', 3, '', 10, 1),
(295, '2022-03-28 11:25:51.466051', '1', 'Drivers_Rating object (1)', 2, '[{\"changed\": {\"fields\": [\"Mine\"]}}]', 21, 1),
(296, '2022-03-28 11:26:10.258322', '1', 'Drivers_Rating object (1)', 3, '', 21, 1),
(297, '2022-03-28 12:16:52.317680', '31', 'Ride object (31)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(298, '2022-03-28 12:53:18.445399', '26', 'Ride_pin object (26)', 2, '[{\"changed\": {\"fields\": [\"Fees\"]}}]', 17, 1),
(299, '2022-03-28 12:54:20.951532', '26', 'Ride_pin object (26)', 2, '[{\"changed\": {\"fields\": [\"For parcel\"]}}]', 17, 1),
(300, '2022-03-28 13:33:29.775336', '33', 'Ride object (33)', 2, '[{\"changed\": {\"fields\": [\"PickUp\", \"Pickup address2\", \"Trip status\"]}}]', 12, 1),
(301, '2022-03-28 13:45:00.702699', '27', 'Ride_pin object (27)', 2, '[{\"changed\": {\"fields\": [\"For passenger\", \"PickUp\"]}}]', 17, 1),
(302, '2022-03-28 13:46:23.399775', '27', 'Ride_pin object (27)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(303, '2022-03-28 13:46:34.370158', '27', 'Ride_pin object (27)', 3, '', 17, 1),
(304, '2022-03-28 13:46:34.373150', '26', 'Ride_pin object (26)', 3, '', 17, 1),
(305, '2022-03-28 13:46:34.375145', '25', 'Ride_pin object (25)', 3, '', 17, 1),
(306, '2022-03-28 13:46:34.377140', '24', 'Ride_pin object (24)', 3, '', 17, 1),
(307, '2022-03-28 13:46:34.379134', '23', 'Ride_pin object (23)', 3, '', 17, 1),
(308, '2022-03-28 13:46:34.381129', '22', 'Ride_pin object (22)', 3, '', 17, 1),
(309, '2022-03-28 13:46:34.382127', '21', 'Ride_pin object (21)', 3, '', 17, 1),
(310, '2022-03-28 13:46:34.383124', '20', 'Ride_pin object (20)', 3, '', 17, 1),
(311, '2022-03-28 13:53:26.695446', '29', 'Ride_pin object (29)', 3, '', 17, 1),
(312, '2022-03-28 13:54:13.420877', '30', 'Ride_pin object (30)', 3, '', 17, 1),
(313, '2022-03-29 06:35:02.771985', '12', 'series 7', 1, '[{\"added\": {}}]', 8, 1),
(314, '2022-03-29 06:56:00.117815', '23', 'testdr', 3, '', 10, 1),
(315, '2022-03-29 10:01:59.818633', '38', 'Ride object (38)', 2, '[{\"changed\": {\"fields\": [\"PickUp\", \"Dropout\"]}}]', 12, 1),
(316, '2022-03-29 10:13:16.395534', '40', '40 -- niks -- visnager  -- mehsana -- C', 2, '[{\"changed\": {\"fields\": [\"Passengerid\", \"PickUp\", \"Status\", \"Pas status\"]}}]', 17, 1),
(317, '2022-03-29 10:13:21.837020', '39', '39 -- hardik -- ahmedabad  -- panjab -- C', 2, '[{\"changed\": {\"fields\": [\"Passengerid\", \"PickUp\"]}}]', 17, 1),
(318, '2022-03-29 10:13:32.500308', '38', '38 -- hardik -- ahmedabad  -- panjab -- C', 2, '[{\"changed\": {\"fields\": [\"Passengerid\", \"PickUp\"]}}]', 17, 1),
(319, '2022-03-29 11:17:46.683178', '40', 'Ride object (40)', 2, '[{\"changed\": {\"fields\": [\"Ride type\"]}}]', 12, 1),
(320, '2022-03-29 12:37:07.912600', '45', '45 -- None -- Kolkata  -- Delhi -- C', 3, '', 17, 1),
(321, '2022-03-29 12:39:10.814837', '46', '46 -- None -- Kolkata  -- Delhi -- C', 3, '', 17, 1),
(322, '2022-03-29 12:41:12.709128', '47', '47 -- None -- Kolkata  -- Delhi -- C', 3, '', 17, 1),
(323, '2022-03-29 12:57:13.685867', '44', '44 -- test passenger  -- goa -- mumbai -- T', 3, '', 17, 1),
(324, '2022-03-29 12:57:13.692880', '43', '43 -- test passenger  -- goa -- mumbai -- C', 3, '', 17, 1),
(325, '2022-03-29 13:03:22.803146', '48', '48 -- test passenger  -- Kolkata  -- Delhi -- C', 2, '[{\"changed\": {\"fields\": [\"PickUp\", \"Status\"]}}]', 17, 1),
(326, '2022-03-29 13:13:41.004991', '48', '48 -- test passenger  -- Kolkata  -- Delhi -- C', 2, '[{\"changed\": {\"fields\": [\"Ride type\", \"Ride date\", \"Ride time\", \"Pickup address1\", \"Pickup address2\", \"Dropout address1\", \"Dropout address2\", \"For parcel\", \"Fees\"]}}]', 17, 1),
(327, '2022-03-29 13:18:09.443319', '48', 'Ride_pin object (48)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(328, '2022-03-29 13:42:34.462498', '48', 'Ride_pin object (48)', 2, '[{\"changed\": {\"fields\": [\"Fees\"]}}]', 17, 1),
(329, '2022-03-29 13:43:08.991158', '39', 'Ride_pin object (39)', 2, '[{\"changed\": {\"fields\": [\"Getdriver\"]}}]', 17, 1),
(330, '2022-03-29 13:43:13.857526', '38', 'Ride_pin object (38)', 2, '[{\"changed\": {\"fields\": [\"Getdriver\"]}}]', 17, 1),
(331, '2022-03-29 13:43:17.936643', '32', 'Ride_pin object (32)', 2, '[{\"changed\": {\"fields\": [\"Getdriver\"]}}]', 17, 1),
(332, '2022-03-29 13:57:30.269015', '51', 'Ride_pin object (51)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(333, '2022-03-29 14:04:34.711235', '52', 'Ride_pin object (52)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(334, '2022-03-30 05:23:34.877912', '49', 'Ride_pin object (49)', 2, '[{\"changed\": {\"fields\": [\"Getride1\"]}}]', 17, 1),
(335, '2022-03-30 05:23:42.898007', '48', 'Ride_pin object (48)', 2, '[{\"changed\": {\"fields\": [\"Getride1\"]}}]', 17, 1),
(336, '2022-03-30 05:24:15.552959', '49', 'Ride_pin object (49)', 2, '[{\"changed\": {\"fields\": [\"Getride1\"]}}]', 17, 1),
(337, '2022-03-30 05:24:29.441957', '48', 'Ride_pin object (48)', 2, '[{\"changed\": {\"fields\": [\"Getride1\"]}}]', 17, 1),
(338, '2022-03-30 05:25:19.685756', '48', 'Ride_pin object (48)', 2, '[{\"changed\": {\"fields\": [\"Getride1\"]}}]', 17, 1),
(339, '2022-03-30 05:43:08.372833', '54', 'Ride object (54)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(340, '2022-03-30 05:54:00.767577', '34', 'Ride object (34)', 3, '', 12, 1),
(341, '2022-03-30 05:54:00.769600', '35', 'Ride object (35)', 3, '', 12, 1),
(342, '2022-03-30 05:54:00.770510', '36', 'Ride object (36)', 3, '', 12, 1),
(343, '2022-03-30 05:54:00.771583', '37', 'Ride object (37)', 3, '', 12, 1),
(344, '2022-03-30 05:54:00.772589', '38', 'Ride object (38)', 3, '', 12, 1),
(345, '2022-03-30 05:54:00.774867', '39', 'Ride object (39)', 3, '', 12, 1),
(346, '2022-03-30 05:54:00.776197', '40', 'Ride object (40)', 3, '', 12, 1),
(347, '2022-03-30 05:54:00.777392', '41', 'Ride object (41)', 3, '', 12, 1),
(348, '2022-03-30 05:54:00.778112', '42', 'Ride object (42)', 3, '', 12, 1),
(349, '2022-03-30 05:54:00.778764', '43', 'Ride object (43)', 3, '', 12, 1),
(350, '2022-03-30 05:54:00.779536', '44', 'Ride object (44)', 3, '', 12, 1),
(351, '2022-03-30 05:54:00.780543', '45', 'Ride object (45)', 3, '', 12, 1),
(352, '2022-03-30 05:54:00.780543', '46', 'Ride object (46)', 3, '', 12, 1),
(353, '2022-03-30 05:54:00.782351', '47', 'Ride object (47)', 3, '', 12, 1),
(354, '2022-03-30 05:54:00.783542', '48', 'Ride object (48)', 3, '', 12, 1),
(355, '2022-03-30 05:54:11.691688', '49', 'Ride object (49)', 3, '', 12, 1),
(356, '2022-03-30 05:54:11.693567', '50', 'Ride object (50)', 3, '', 12, 1),
(357, '2022-03-30 05:54:11.694574', '51', 'Ride object (51)', 3, '', 12, 1),
(358, '2022-03-30 05:54:11.695565', '52', 'Ride object (52)', 3, '', 12, 1),
(359, '2022-03-30 05:54:11.697285', '53', 'Ride object (53)', 3, '', 12, 1),
(360, '2022-03-30 05:54:11.698394', '54', 'Ride object (54)', 3, '', 12, 1),
(361, '2022-03-30 05:54:18.375141', '19', 'Ride object (19)', 3, '', 12, 1),
(362, '2022-03-30 05:54:18.377259', '20', 'Ride object (20)', 3, '', 12, 1),
(363, '2022-03-30 05:54:18.378258', '21', 'Ride object (21)', 3, '', 12, 1),
(364, '2022-03-30 05:54:18.379460', '22', 'Ride object (22)', 3, '', 12, 1),
(365, '2022-03-30 05:54:18.380719', '23', 'Ride object (23)', 3, '', 12, 1),
(366, '2022-03-30 05:54:18.381819', '24', 'Ride object (24)', 3, '', 12, 1),
(367, '2022-03-30 05:54:18.382874', '25', 'Ride object (25)', 3, '', 12, 1),
(368, '2022-03-30 05:54:18.383546', '26', 'Ride object (26)', 3, '', 12, 1),
(369, '2022-03-30 05:54:18.384545', '27', 'Ride object (27)', 3, '', 12, 1),
(370, '2022-03-30 05:54:18.385543', '28', 'Ride object (28)', 3, '', 12, 1),
(371, '2022-03-30 05:54:18.386932', '29', 'Ride object (29)', 3, '', 12, 1),
(372, '2022-03-30 05:54:18.387727', '30', 'Ride object (30)', 3, '', 12, 1),
(373, '2022-03-30 05:54:18.388458', '31', 'Ride object (31)', 3, '', 12, 1),
(374, '2022-03-30 05:54:18.389515', '32', 'Ride object (32)', 3, '', 12, 1),
(375, '2022-03-30 05:54:18.390282', '33', 'Ride object (33)', 3, '', 12, 1),
(376, '2022-03-30 06:03:04.356407', '55', 'Ride object (55)', 2, '[{\"changed\": {\"fields\": [\"Pickup address2\", \"Status\"]}}]', 12, 1),
(377, '2022-03-30 06:29:39.839875', '59', 'Ride_pin object (59)', 2, '[{\"changed\": {\"fields\": [\"As user\"]}}]', 17, 1),
(378, '2022-03-30 06:36:19.553871', '57', 'Ride object (57)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(379, '2022-03-30 06:53:05.341286', '57', 'Ride object (57)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(380, '2022-03-30 07:01:22.340461', '56', 'Ride object (56)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(381, '2022-03-30 07:11:25.632558', '57', 'Ride object (57)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(382, '2022-03-30 07:13:13.840219', '57', 'Ride_pin object (57)', 2, '[{\"changed\": {\"fields\": [\"Ride type\", \"For passenger\", \"For parcel\", \"Pas status\"]}}]', 17, 1),
(383, '2022-03-30 07:14:30.163298', '57', 'Ride_pin object (57)', 2, '[{\"changed\": {\"fields\": [\"For passenger\", \"For parcel\", \"Pas status\"]}}]', 17, 1),
(384, '2022-03-30 07:17:59.564947', '58', 'Ride_pin object (58)', 3, '', 17, 1),
(385, '2022-03-30 07:17:59.566942', '57', 'Ride_pin object (57)', 3, '', 17, 1),
(386, '2022-03-30 07:17:59.568937', '56', 'Ride_pin object (56)', 3, '', 17, 1),
(387, '2022-03-30 07:17:59.571929', '55', 'Ride_pin object (55)', 3, '', 17, 1),
(388, '2022-03-30 07:17:59.572927', '54', 'Ride_pin object (54)', 3, '', 17, 1),
(389, '2022-03-30 07:17:59.573924', '53', 'Ride_pin object (53)', 3, '', 17, 1),
(390, '2022-03-30 07:18:19.638890', '55', 'Ride object (55)', 2, '[{\"changed\": {\"fields\": [\"Max seats\"]}}]', 12, 1),
(391, '2022-03-30 07:36:30.860600', '59', 'Ride_pin object (59)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(392, '2022-03-30 07:41:20.416658', '59', 'Ride_pin object (59)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(393, '2022-03-30 08:04:02.255732', '6', 'Passenger_Rating object (6)', 1, '[{\"added\": {}}]', 19, 1),
(394, '2022-03-30 08:11:06.198953', '59', 'Ride object (59)', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 12, 1),
(395, '2022-03-30 08:15:51.267571', '59', 'Ride object (59)', 2, '[{\"changed\": {\"fields\": [\"Date\", \"Max seats\", \"Trip status\"]}}]', 12, 1),
(396, '2022-03-30 08:16:30.229539', '64', 'Ride_pin object (64)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(397, '2022-03-30 08:21:43.344255', '59', 'Ride object (59)', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 12, 1),
(398, '2022-03-30 09:29:35.153017', '4', 'Drivers_Rating object (4)', 1, '[{\"added\": {}}]', 21, 1),
(399, '2022-03-30 09:47:28.355986', '62', 'Ride_pin object (62)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(400, '2022-03-30 09:48:10.295408', '60', 'Ride_pin object (60)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(401, '2022-03-30 09:48:21.112394', '61', 'Ride_pin object (61)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(402, '2022-03-30 09:48:36.417773', '62', 'Ride_pin object (62)', 2, '[]', 17, 1),
(403, '2022-03-30 09:48:43.642367', '64', 'Ride_pin object (64)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(404, '2022-03-30 09:50:25.195528', '63', 'Ride_pin object (63)', 2, '[{\"changed\": {\"fields\": [\"Offer price\"]}}]', 17, 1),
(405, '2022-03-30 10:52:14.603794', '28', 'nikhil ahirarao', 3, '', 10, 1),
(406, '2022-03-30 11:04:12.842273', '61', 'Ride_pin object (61)', 2, '[{\"changed\": {\"fields\": [\"Getride1\"]}}]', 17, 1),
(407, '2022-03-30 11:50:30.077409', '65', 'Ride_pin object (65)', 2, '[]', 17, 1),
(408, '2022-03-30 12:23:21.285815', '4', 'Drivers_Rating object (4)', 2, '[]', 21, 1),
(409, '2022-03-30 12:23:27.254809', '6', 'Passenger_Rating object (6)', 2, '[{\"changed\": {\"fields\": [\"Driverid\"]}}]', 19, 1),
(410, '2022-03-30 12:30:45.449488', '4', 'Drivers_Rating object (4)', 2, '[{\"changed\": {\"fields\": [\"Passengerid\"]}}]', 21, 1),
(411, '2022-03-30 12:30:59.099122', '4', 'Drivers_Rating object (4)', 2, '[]', 21, 1),
(412, '2022-03-30 13:45:31.678492', '63', 'Ride object (63)', 2, '[]', 12, 1),
(413, '2022-04-01 06:56:42.722206', '3', 'hardik', 2, '[{\"changed\": {\"fields\": [\"Pro image\", \"Image1\", \"Image2\", \"Gender\"]}}]', 10, 1),
(414, '2022-04-01 06:59:35.075305', '6', '6036 hardik sapariya', 2, '[{\"changed\": {\"fields\": [\"Pro image\", \"Image1\", \"Image2\", \"Gender\"]}}]', 10, 1),
(415, '2022-04-01 12:15:47.857222', '62', 'Ride_pin object (62)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(416, '2022-04-01 12:20:53.819433', '62', 'Ride_pin object (62)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(417, '2022-04-01 12:22:10.394364', '62', 'Ride_pin object (62)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(418, '2022-04-01 12:24:17.239330', '62', 'Ride_pin object (62)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(419, '2022-04-04 05:17:32.349256', '55', 'Ride object (55)', 3, '', 12, 1),
(420, '2022-04-04 05:17:32.351340', '56', 'Ride object (56)', 3, '', 12, 1),
(421, '2022-04-04 05:17:32.353149', '57', 'Ride object (57)', 3, '', 12, 1),
(422, '2022-04-04 05:17:32.354418', '58', 'Ride object (58)', 3, '', 12, 1),
(423, '2022-04-04 05:17:32.355588', '59', 'Ride object (59)', 3, '', 12, 1),
(424, '2022-04-04 05:17:32.356839', '60', 'Ride object (60)', 3, '', 12, 1),
(425, '2022-04-04 05:17:32.357949', '61', 'Ride object (61)', 3, '', 12, 1),
(426, '2022-04-04 05:17:32.358948', '62', 'Ride object (62)', 3, '', 12, 1),
(427, '2022-04-04 05:17:32.360077', '63', 'Ride object (63)', 3, '', 12, 1),
(428, '2022-04-04 05:17:32.361100', '64', 'Ride object (64)', 3, '', 12, 1),
(429, '2022-04-04 05:58:40.583613', '65', 'Ride object (65)', 3, '', 12, 1),
(430, '2022-04-04 06:14:53.348127', '68', 'Ride_pin object (68)', 3, '', 17, 1),
(431, '2022-04-04 06:14:53.351292', '67', 'Ride_pin object (67)', 3, '', 17, 1),
(432, '2022-04-04 06:44:03.852170', '69', 'Ride object (69)', 1, '[{\"added\": {}}]', 12, 1),
(433, '2022-04-04 06:46:40.094495', '69', 'Ride_pin object (69)', 1, '[{\"added\": {}}]', 17, 1),
(434, '2022-04-04 07:19:01.549390', '69', 'Ride object (69)', 2, '[]', 12, 1),
(435, '2022-04-04 07:19:14.206559', '69', 'Ride object (69)', 2, '[]', 12, 1),
(436, '2022-04-04 07:19:29.933996', '69', 'Ride object (69)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(437, '2022-04-04 07:20:57.487166', '69', 'Ride object (69)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(438, '2022-04-04 07:23:51.383841', '66', 'Ride object (66)', 2, '[{\"changed\": {\"fields\": [\"Publish\"]}}]', 12, 1),
(439, '2022-04-04 07:24:00.624180', '67', 'Ride object (67)', 2, '[{\"changed\": {\"fields\": [\"Publish\"]}}]', 12, 1),
(440, '2022-04-04 07:24:06.626894', '68', 'Ride object (68)', 2, '[{\"changed\": {\"fields\": [\"Publish\"]}}]', 12, 1),
(441, '2022-04-04 07:32:29.060859', '69', 'Ride object (69)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(442, '2022-04-04 07:34:59.749877', '69', 'Ride object (69)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(443, '2022-04-04 07:49:20.070092', '69', 'Ride object (69)', 2, '[{\"changed\": {\"fields\": [\"As user\"]}}]', 12, 1),
(444, '2022-04-04 07:49:40.153048', '69', 'Ride object (69)', 2, '[{\"changed\": {\"fields\": [\"As user\"]}}]', 12, 1),
(445, '2022-04-04 07:53:18.106975', '69', 'Ride object (69)', 2, '[{\"changed\": {\"fields\": [\"As user\"]}}]', 12, 1),
(446, '2022-04-04 07:53:26.902972', '69', 'Ride_pin object (69)', 2, '[{\"changed\": {\"fields\": [\"As user\"]}}]', 17, 1),
(447, '2022-04-04 09:45:28.263873', '68', 'Ride object (68)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(448, '2022-04-04 11:45:08.639321', '71', 'Ride_pin object (71)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(449, '2022-04-04 12:35:48.849114', '73', 'Ride_pin object (73)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(450, '2022-04-04 12:36:53.247594', '72', 'Ride_pin object (72)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(451, '2022-04-04 12:46:26.731455', '2', 'nikhil patil \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Driverid\"]}}]', 14, 1),
(452, '2022-04-04 12:47:53.798578', '100', 'Ride object (100)', 2, '[{\"changed\": {\"fields\": [\"Publish\"]}}]', 12, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(453, '2022-04-04 12:49:24.416368', '100', 'Ride object (100)', 2, '[{\"changed\": {\"fields\": [\"Publish\"]}}]', 12, 1),
(454, '2022-04-04 13:01:13.876662', '101', 'Ride object (101)', 2, '[{\"changed\": {\"fields\": [\"PickUp\"]}}]', 12, 1),
(455, '2022-04-05 06:38:42.252891', '102', 'Ride object (102)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(456, '2022-04-05 06:42:11.172959', '102', 'Ride object (102)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(457, '2022-04-05 06:42:40.217233', '1', 'name \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(458, '2022-04-05 06:42:40.221710', '2', 'nikhil patil \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(459, '2022-04-05 06:42:40.226561', '3', 'hardik \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(460, '2022-04-05 06:42:40.232927', '4', 'hardik \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(461, '2022-04-05 06:42:40.236138', '5', '6036 hardik sapariya \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(462, '2022-04-05 06:42:40.240979', '6', 'driver1 \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(463, '2022-04-05 06:42:40.244978', '7', 'dhujnn \'s Mahendra Scorpio', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(464, '2022-04-05 06:42:40.249506', '8', 'dhujnn \'s Mahendra Scorpio', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(465, '2022-04-05 06:42:40.254144', '9', 'dhujnn \'s Mahendra XUV 500', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(466, '2022-04-05 06:42:40.258136', '10', 'dhujnn \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(467, '2022-04-05 06:42:40.262069', '12', 'hardik \'s SUZUKI Swift', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(468, '2022-04-05 06:46:34.166966', '102', 'Ride object (102)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(469, '2022-04-05 06:53:15.337695', '1', 'name \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(470, '2022-04-05 06:53:15.343036', '2', 'nikhil patil \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(471, '2022-04-05 06:53:15.346286', '3', 'hardik \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(472, '2022-04-05 06:53:15.351108', '4', 'hardik \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(473, '2022-04-05 06:53:15.356408', '5', '6036 hardik sapariya \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(474, '2022-04-05 06:53:15.359996', '6', 'driver1 \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(475, '2022-04-05 06:53:15.364303', '7', 'dhujnn \'s Mahendra Scorpio', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(476, '2022-04-05 06:53:15.368658', '9', 'dhujnn \'s Mahendra XUV 500', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(477, '2022-04-05 06:53:15.373409', '10', 'dhujnn \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(478, '2022-04-05 06:53:15.377119', '11', 'name \'s SUZUKI Swift', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(479, '2022-04-05 06:53:15.381197', '12', 'hardik \'s SUZUKI Swift', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(480, '2022-04-05 06:54:16.766777', '1', 'name \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(481, '2022-04-05 06:54:16.771505', '2', 'nikhil patil \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(482, '2022-04-05 06:54:16.776009', '6', 'driver1 \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(483, '2022-04-05 06:55:40.902677', '10', 'dhujnn \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(484, '2022-04-05 06:55:40.907087', '11', 'name \'s SUZUKI Swift', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(485, '2022-04-05 07:52:07.851461', '3', 'Ride_pin object (3)', 3, '', 17, 1),
(486, '2022-04-05 08:00:21.283407', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(487, '2022-04-05 08:01:04.751585', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(488, '2022-04-05 08:02:36.042314', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(489, '2022-04-05 08:03:43.730482', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(490, '2022-04-05 08:04:16.770253', '4', 'Ride_pin object (4)', 2, '[{\"changed\": {\"fields\": [\"Getdriver\"]}}]', 17, 1),
(491, '2022-04-05 08:04:30.088858', '4', 'Ride_pin object (4)', 2, '[{\"changed\": {\"fields\": [\"Getdriver\"]}}]', 17, 1),
(492, '2022-04-05 08:05:20.081983', '4', 'Ride_pin object (4)', 2, '[{\"changed\": {\"fields\": [\"Getdriver\"]}}]', 17, 1),
(493, '2022-04-05 08:05:52.694692', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(494, '2022-04-05 08:07:42.453260', '5', 'Ride_pin object (5)', 2, '[{\"changed\": {\"fields\": [\"Car\"]}}]', 17, 1),
(495, '2022-04-05 08:07:52.560058', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Car\"]}}]', 17, 1),
(496, '2022-04-05 08:08:02.474234', '1', 'Ride_pin object (1)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(497, '2022-04-05 10:42:47.965491', '22', 'driver hs \'s Honda CIVIC', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(498, '2022-04-05 10:50:54.427451', '5', 'Ride object (5)', 2, '[]', 12, 1),
(499, '2022-04-05 10:51:04.099853', '4', 'Ride object (4)', 2, '[{\"changed\": {\"fields\": [\"Pickup address2\", \"Trip status\"]}}]', 12, 1),
(500, '2022-04-05 11:29:15.290208', '7', 'Ride_pin object (7)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(501, '2022-04-05 11:45:33.598260', '7', 'Ride_pin object (7)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(502, '2022-04-05 12:17:44.560832', '9', 'Ride_pin object (9)', 2, '[]', 17, 1),
(503, '2022-04-05 12:18:09.591042', '2', 'nikhil patil \'s Volkswagen POLO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(504, '2022-04-05 12:18:16.820094', '8', 'Ride_pin object (8)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(505, '2022-04-05 12:41:42.993731', '6', 'Ride object (6)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(506, '2022-04-05 12:42:07.009850', '11', 'Ride_pin object (11)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(507, '2022-04-05 12:42:12.372146', '6', 'Ride object (6)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(508, '2022-04-05 12:42:32.496802', '11', 'Ride_pin object (11)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(509, '2022-04-05 12:42:54.488624', '11', 'Ride_pin object (11)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(510, '2022-04-05 12:44:56.250680', '11', 'Ride_pin object (11)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(511, '2022-04-05 12:47:09.875372', '11', 'Ride_pin object (11)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(512, '2022-04-05 12:49:48.830547', '11', 'Ride_pin object (11)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(513, '2022-04-05 12:50:13.240424', '11', 'Ride_pin object (11)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 17, 1),
(514, '2022-04-05 12:50:17.096115', '6', 'Ride object (6)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(515, '2022-04-05 12:51:13.283585', '11', 'Ride_pin object (11)', 2, '[]', 17, 1),
(516, '2022-04-05 12:58:10.800330', '7', 'Ride_pin object (7)', 3, '', 17, 1),
(517, '2022-04-05 12:58:10.802847', '5', 'Ride_pin object (5)', 3, '', 17, 1),
(518, '2022-04-05 12:58:10.803847', '4', 'Ride_pin object (4)', 3, '', 17, 1),
(519, '2022-04-05 13:37:35.909147', '5', 'Ride object (5)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(520, '2022-04-06 05:07:12.889853', '16', 'hardik \'s SUZUKI EECO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(521, '2022-04-06 05:07:45.278202', '13', 'hardik \'s SUZUKI Swift', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(522, '2022-04-06 05:07:45.283497', '15', 'hardik \'s SUZUKI Swift', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(523, '2022-04-06 06:24:01.930048', '2', 'Ride_pin object (2)', 3, '', 17, 1),
(524, '2022-04-06 06:51:56.464564', '1', 'Ride object (1)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\"]}}]', 12, 1),
(525, '2022-04-06 09:15:47.257887', '5', 'Ride_pin object (5)', 2, '[]', 17, 1),
(526, '2022-04-06 09:16:34.178750', '2', 'Ride object (2)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(527, '2022-04-06 13:35:07.068706', '9', 'Ride_pin object (9)', 2, '[]', 17, 1),
(528, '2022-04-06 13:35:29.183850', '9', 'Ride object (9)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(529, '2022-04-07 04:38:45.597775', '1', 'driver hs \'s Hundai Grand i20', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(530, '2022-04-07 04:38:45.605063', '2', 'Nikhil patil \'s SUZUKI EECO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(531, '2022-04-07 04:38:45.610594', '3', 'hardik \'s Mahendra Scorpio', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(532, '2022-04-07 04:38:45.614313', '4', 'Driver nikhil \'s Mahendra Thar', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(533, '2022-04-07 04:38:45.618927', '5', 'Jack \'s BMW series 7', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(534, '2022-04-07 04:40:02.778519', '1', 'driver hs \'s Hundai Grand i20', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(535, '2022-04-07 04:40:02.783532', '2', 'Nikhil patil \'s SUZUKI EECO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(536, '2022-04-07 04:40:02.786908', '3', 'hardik \'s Mahendra Scorpio', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(537, '2022-04-07 04:40:02.790984', '4', 'Driver nikhil \'s Mahendra Thar', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(538, '2022-04-07 04:42:31.013327', '1', 'driver hs \'s Hundai Grand i20', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(539, '2022-04-07 04:42:31.021278', '2', 'Nikhil patil \'s SUZUKI EECO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(540, '2022-04-07 04:43:33.738776', '1', 'driver hs \'s Hundai Grand i20', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(541, '2022-04-07 04:43:33.744095', '4', 'Driver nikhil \'s Mahendra Thar', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(542, '2022-04-07 04:45:36.090085', '1', 'driver hs \'s Hundai Grand i20', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(543, '2022-04-07 04:45:36.094194', '2', 'Nikhil patil \'s SUZUKI EECO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(544, '2022-04-07 04:45:36.099752', '3', 'hardik \'s Mahendra Scorpio', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(545, '2022-04-07 04:45:36.103247', '4', 'Driver nikhil \'s Mahendra Thar', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(546, '2022-04-07 04:47:18.695638', '1', 'driver hs \'s Hundai Grand i20', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(547, '2022-04-07 04:49:40.647952', '1', 'driver hs \'s Hundai Grand i20', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(548, '2022-04-07 04:51:45.313838', '2', 'Nikhil patil \'s SUZUKI EECO', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(549, '2022-04-07 04:51:45.318509', '3', 'hardik \'s Mahendra Scorpio', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(550, '2022-04-07 04:51:45.321756', '4', 'Driver nikhil \'s Mahendra Thar', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(551, '2022-04-07 04:51:45.326393', '5', 'Jack \'s BMW series 7', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(552, '2022-04-07 04:52:53.816440', '4', 'Driver nikhil \'s Mahendra Thar', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(553, '2022-04-07 05:30:47.695529', '29', 'Nikhil patil', 2, '[{\"changed\": {\"fields\": [\"Gender\"]}}]', 10, 1),
(554, '2022-04-07 05:31:05.709189', '29', 'Nikhil patil', 2, '[{\"changed\": {\"fields\": [\"Pro image\"]}}]', 10, 1),
(555, '2022-04-07 05:55:57.161858', '1', 'Cities object (1)', 1, '[{\"added\": {}}]', 9, 1),
(556, '2022-04-07 05:56:03.085826', '2', 'Cities object (2)', 1, '[{\"added\": {}}]', 9, 1),
(557, '2022-04-07 05:56:13.888120', '3', 'Cities object (3)', 1, '[{\"added\": {}}]', 9, 1),
(558, '2022-04-07 05:56:21.244155', '4', 'Cities object (4)', 1, '[{\"added\": {}}]', 9, 1),
(559, '2022-04-07 05:56:26.407197', '5', 'Cities object (5)', 1, '[{\"added\": {}}]', 9, 1),
(560, '2022-04-07 05:56:32.060951', '6', 'Cities object (6)', 1, '[{\"added\": {}}]', 9, 1),
(561, '2022-04-07 05:56:35.717947', '7', 'Cities object (7)', 1, '[{\"added\": {}}]', 9, 1),
(562, '2022-04-07 05:56:43.539701', '8', 'Cities object (8)', 1, '[{\"added\": {}}]', 9, 1),
(563, '2022-04-07 05:56:52.172723', '9', 'Cities object (9)', 1, '[{\"added\": {}}]', 9, 1),
(564, '2022-04-07 09:05:39.696367', '5', 'Ride_pin object (5)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(565, '2022-04-07 09:41:37.951203', '23', 'Ride object (23)', 2, '[{\"changed\": {\"fields\": [\"Publish\"]}}]', 12, 1),
(566, '2022-04-07 09:41:43.097549', '22', 'Ride object (22)', 2, '[]', 12, 1),
(567, '2022-04-07 09:44:06.608242', '15', 'Ride object (15)', 2, '[]', 12, 1),
(568, '2022-04-07 11:07:39.677019', '14', 'Ride object (14)', 2, '[{\"changed\": {\"fields\": [\"Publish\"]}}]', 12, 1),
(569, '2022-04-07 11:17:37.843103', '11', 'Ride object (11)', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 12, 1),
(570, '2022-04-07 11:18:36.706836', '14', 'Ride object (14)', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 12, 1),
(571, '2022-04-08 04:42:00.358462', '2', 'Ride object (2)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(572, '2022-04-08 04:42:35.227827', '4', 'Ride object (4)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(573, '2022-04-08 04:42:59.702269', '6', 'Ride_pin object (6)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(574, '2022-04-08 04:43:11.853044', '6', 'Ride_pin object (6)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(575, '2022-04-08 04:43:24.738426', '4', 'Ride object (4)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(576, '2022-04-08 04:44:11.312991', '2', 'Ride object (2)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(577, '2022-04-08 04:44:55.381489', '5', 'Ride_pin object (5)', 2, '[{\"changed\": {\"fields\": [\"Pas status\"]}}]', 17, 1),
(578, '2022-04-08 05:37:52.855162', '1', 'dirver \'s Mahendra Thar', 1, '[{\"added\": {}}]', 14, 1),
(579, '2022-04-08 05:38:14.703920', '1', 'dirver \'s Mahendra Thar', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(580, '2022-04-08 05:39:19.683509', '7', 'TATA', 1, '[{\"added\": {}}]', 13, 1),
(581, '2022-04-08 05:39:26.203889', '13', 'Nexon Ev', 1, '[{\"added\": {}}]', 8, 1),
(582, '2022-04-08 05:44:26.392743', '1', 'dirver \'s Mahendra Thar', 3, '', 14, 1),
(583, '2022-04-08 09:34:07.111095', '1', 'dirver', 3, '', 10, 1),
(584, '2022-04-08 09:34:22.323975', '1', 'passenger', 3, '', 11, 1),
(585, '2022-04-08 11:02:18.946446', '12', 'Driver \'s TATA Nexon Ev', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(586, '2022-04-08 11:02:53.302610', '12', 'Driver \'s Mahendra BOLERO', 2, '[{\"changed\": {\"fields\": [\"Vehical variant\"]}}]', 14, 1),
(587, '2022-04-08 11:12:01.654178', '4', 'Ride object (4)', 2, '[{\"changed\": {\"fields\": [\"PickUp\", \"Publish\"]}}]', 12, 1),
(588, '2022-04-11 04:29:29.088231', '3', 'Ride_pin object (3)', 3, '', 17, 1),
(589, '2022-04-11 04:48:50.779745', '13', 'Ride object (13)', 2, '[{\"changed\": {\"fields\": [\"Publish\"]}}]', 12, 1),
(590, '2022-04-11 04:54:26.341545', '13', 'Ride object (13)', 2, '[]', 12, 1),
(591, '2022-04-11 07:22:41.880271', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 12, 1),
(592, '2022-04-11 08:16:30.918554', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Time\"]}}]', 12, 1),
(593, '2022-04-11 08:16:56.097826', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Time\"]}}]', 12, 1),
(594, '2022-04-11 09:45:33.886305', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(595, '2022-04-11 10:12:32.173769', '14', 'Driver test \'s Honda CIVIC', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(596, '2022-04-11 10:12:32.184694', '8', 'hardik \'s SUZUKI Ertiga', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(597, '2022-04-11 11:48:44.537855', '31', 'Ride object (31)', 2, '[{\"changed\": {\"fields\": [\"PickUp\", \"Dropout\"]}}]', 12, 1),
(598, '2022-04-11 11:58:07.268296', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Ride time\"]}}]', 12, 1),
(599, '2022-04-11 11:58:21.267265', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(600, '2022-04-11 12:57:25.185650', '31', 'Ride object (31)', 2, '[{\"changed\": {\"fields\": [\"Ride time\"]}}]', 12, 1),
(601, '2022-04-11 12:57:46.291036', '31', 'Ride object (31)', 2, '[]', 12, 1),
(602, '2022-04-11 13:13:20.104603', '31', 'Ride object (31)', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 12, 1),
(603, '2022-04-11 13:14:48.551589', '31', 'Ride object (31)', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 12, 1),
(604, '2022-04-11 13:23:27.418948', '31', 'Ride object (31)', 2, '[{\"changed\": {\"fields\": [\"Ride time\"]}}]', 12, 1),
(605, '2022-04-11 13:23:49.925547', '30', 'Ride object (30)', 2, '[{\"changed\": {\"fields\": [\"Add information\", \"Ride time\"]}}]', 12, 1),
(606, '2022-04-11 13:57:17.387342', '6', 'Ride object (6)', 2, '[{\"changed\": {\"fields\": [\"PickUp\", \"Dropout address2\", \"Date\"]}}]', 12, 1),
(607, '2022-04-11 14:00:23.335146', '31', 'Ride object (31)', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 12, 1),
(608, '2022-04-11 14:00:45.163060', '31', 'Ride object (31)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(609, '2022-04-11 14:01:47.048410', '32', 'Ride object (32)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(610, '2022-04-11 14:01:47.052398', '29', 'Ride object (29)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(611, '2022-04-11 14:01:47.056388', '28', 'Ride object (28)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(612, '2022-04-11 14:01:47.059379', '27', 'Ride object (27)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(613, '2022-04-11 14:01:47.062371', '26', 'Ride object (26)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(614, '2022-04-11 14:01:47.064366', '25', 'Ride object (25)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(615, '2022-04-11 14:01:47.068367', '24', 'Ride object (24)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(616, '2022-04-11 14:01:47.070349', '22', 'Ride object (22)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(617, '2022-04-11 14:01:47.072344', '21', 'Ride object (21)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(618, '2022-04-11 14:01:47.075336', '20', 'Ride object (20)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(619, '2022-04-11 14:01:47.078329', '19', 'Ride object (19)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(620, '2022-04-11 14:01:47.080323', '18', 'Ride object (18)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(621, '2022-04-11 14:02:02.525499', '31', 'Ride object (31)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(622, '2022-04-11 14:02:30.665362', '31', 'Ride object (31)', 2, '[{\"changed\": {\"fields\": [\"Date\", \"Trip status\"]}}]', 12, 1),
(623, '2022-04-12 05:16:22.365106', '33', 'Ride object (33)', 2, '[{\"changed\": {\"fields\": [\"Publish\"]}}]', 12, 1),
(624, '2022-04-12 05:40:05.177542', '36', 'Ride object (36)', 2, '[{\"changed\": {\"fields\": [\"Route\"]}}]', 12, 1),
(625, '2022-04-12 06:03:30.490995', '7', 'Ride_pin object (7)', 2, '[{\"changed\": {\"fields\": [\"Getride\"]}}]', 17, 1),
(626, '2022-04-12 06:11:19.857425', '1', 'Passenger_Rating object (1)', 1, '[{\"added\": {}}]', 19, 1),
(627, '2022-04-12 06:13:55.403348', '6', 'tests', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Gender\"]}}]', 11, 1),
(628, '2022-04-12 06:14:08.300427', '1', 'Passenger_Rating object (1)', 2, '[{\"changed\": {\"fields\": [\"Mine\"]}}]', 19, 1),
(629, '2022-04-12 06:14:54.890014', '1', 'Passenger_Rating object (1)', 2, '[{\"changed\": {\"fields\": [\"Driverid\"]}}]', 19, 1),
(630, '2022-04-12 07:26:20.351617', '36', 'Ride object (36)', 3, '', 12, 1),
(631, '2022-04-12 07:26:20.370997', '35', 'Ride object (35)', 3, '', 12, 1),
(632, '2022-04-12 07:26:20.373400', '34', 'Ride object (34)', 3, '', 12, 1),
(633, '2022-04-12 07:26:20.374401', '33', 'Ride object (33)', 3, '', 12, 1),
(634, '2022-04-12 07:26:20.375822', '32', 'Ride object (32)', 3, '', 12, 1),
(635, '2022-04-12 07:26:20.378016', '31', 'Ride object (31)', 3, '', 12, 1),
(636, '2022-04-12 07:26:20.379987', '29', 'Ride object (29)', 3, '', 12, 1),
(637, '2022-04-12 07:26:20.381987', '27', 'Ride object (27)', 3, '', 12, 1),
(638, '2022-04-12 07:26:20.382985', '26', 'Ride object (26)', 3, '', 12, 1),
(639, '2022-04-12 07:26:20.383789', '25', 'Ride object (25)', 3, '', 12, 1),
(640, '2022-04-12 07:26:20.385622', '24', 'Ride object (24)', 3, '', 12, 1),
(641, '2022-04-12 07:26:20.386659', '23', 'Ride object (23)', 3, '', 12, 1),
(642, '2022-04-12 07:26:20.388287', '22', 'Ride object (22)', 3, '', 12, 1),
(643, '2022-04-12 07:26:20.389943', '21', 'Ride object (21)', 3, '', 12, 1),
(644, '2022-04-12 07:26:20.392129', '20', 'Ride object (20)', 3, '', 12, 1),
(645, '2022-04-12 07:26:26.567371', '19', 'Ride object (19)', 3, '', 12, 1),
(646, '2022-04-12 07:26:26.591549', '18', 'Ride object (18)', 3, '', 12, 1),
(647, '2022-04-12 07:26:26.592815', '17', 'Ride object (17)', 3, '', 12, 1),
(648, '2022-04-12 07:26:26.594110', '16', 'Ride object (16)', 3, '', 12, 1),
(649, '2022-04-12 07:26:26.595341', '15', 'Ride object (15)', 3, '', 12, 1),
(650, '2022-04-12 07:26:26.596457', '14', 'Ride object (14)', 3, '', 12, 1),
(651, '2022-04-12 07:26:26.597664', '13', 'Ride object (13)', 3, '', 12, 1),
(652, '2022-04-12 07:26:26.598680', '12', 'Ride object (12)', 3, '', 12, 1),
(653, '2022-04-12 07:26:26.599681', '11', 'Ride object (11)', 3, '', 12, 1),
(654, '2022-04-12 07:26:26.601319', '10', 'Ride object (10)', 3, '', 12, 1),
(655, '2022-04-12 07:26:26.602494', '9', 'Ride object (9)', 3, '', 12, 1),
(656, '2022-04-12 07:26:26.603443', '8', 'Ride object (8)', 3, '', 12, 1),
(657, '2022-04-12 07:26:26.604498', '7', 'Ride object (7)', 3, '', 12, 1),
(658, '2022-04-12 07:26:26.605596', '6', 'Ride object (6)', 3, '', 12, 1),
(659, '2022-04-12 07:26:26.607039', '5', 'Ride object (5)', 3, '', 12, 1),
(660, '2022-04-12 07:26:31.690669', '4', 'Ride object (4)', 3, '', 12, 1),
(661, '2022-04-12 07:26:31.692666', '3', 'Ride object (3)', 3, '', 12, 1),
(662, '2022-04-12 07:43:31.379879', '37', 'Ride object (37)', 2, '[{\"changed\": {\"fields\": [\"Max seats\", \"Create at\"]}}]', 12, 1),
(663, '2022-04-12 07:44:09.636046', '37', 'Ride object (37)', 2, '[{\"changed\": {\"fields\": [\"Ride time\", \"Create at\"]}}]', 12, 1),
(664, '2022-04-12 08:00:32.595999', '37', 'Ride object (37)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(665, '2022-04-12 08:00:48.694146', '37', 'Ride object (37)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(666, '2022-04-12 08:02:53.762230', '37', 'Ride object (37)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(667, '2022-04-12 08:05:02.722492', '37', 'Ride object (37)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(668, '2022-04-12 08:10:23.748041', '37', 'Ride object (37)', 2, '[{\"changed\": {\"fields\": [\"Ride time\"]}}]', 12, 1),
(669, '2022-04-12 08:56:10.882274', '37', 'Ride object (37)', 2, '[{\"changed\": {\"fields\": [\"Ride time\"]}}]', 12, 1),
(670, '2022-04-12 09:32:23.205203', '38', 'Ride object (38)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\", \"Trip status\"]}}]', 12, 1),
(671, '2022-04-12 09:32:37.592234', '38', 'Ride object (38)', 2, '[{\"changed\": {\"fields\": [\"Car latitude\", \"Car longitude\", \"Trip status\"]}}]', 12, 1),
(672, '2022-04-12 10:41:05.925848', '41', 'Ride object (41)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(673, '2022-04-12 10:41:49.819259', '41', 'Ride object (41)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(674, '2022-04-13 05:08:01.179442', '8', 'nikhil driver', 2, '[{\"changed\": {\"fields\": [\"Contact no\", \"Gender\"]}}]', 10, 1),
(675, '2022-04-13 05:11:15.042522', '9', 'hardik', 3, '', 10, 1),
(676, '2022-04-13 05:11:15.044516', '8', 'nikhil driver', 3, '', 10, 1),
(677, '2022-04-13 05:11:15.045513', '7', 'Driver test', 3, '', 10, 1),
(678, '2022-04-13 05:11:15.047507', '6', 'driver test', 3, '', 10, 1),
(679, '2022-04-13 05:11:15.050500', '5', 'testd', 3, '', 10, 1),
(680, '2022-04-13 05:11:15.051497', '4', 'Driver', 3, '', 10, 1),
(681, '2022-04-13 05:11:15.053492', '3', 'jiii', 3, '', 10, 1),
(682, '2022-04-13 05:11:15.054490', '2', 'hardik', 3, '', 10, 1),
(683, '2022-04-13 05:11:22.414544', '10', 'nikhil', 3, '', 11, 1),
(684, '2022-04-13 05:11:22.416540', '9', 'testing pasosenger', 3, '', 11, 1),
(685, '2022-04-13 05:11:22.417538', '8', 'hardik passenger', 3, '', 11, 1),
(686, '2022-04-13 05:11:22.419571', '7', 'Testpassenger', 3, '', 11, 1),
(687, '2022-04-13 05:11:22.420529', '6', 'tests', 3, '', 11, 1),
(688, '2022-04-13 05:11:22.421526', '5', 'test pass', 3, '', 11, 1),
(689, '2022-04-13 05:11:22.422524', '4', 'passenger', 3, '', 11, 1),
(690, '2022-04-13 05:11:22.423521', '3', 'test', 3, '', 11, 1),
(691, '2022-04-13 05:11:22.424518', '2', 'hardik passenger', 3, '', 11, 1),
(692, '2022-04-13 05:36:14.484561', '11', 'nikhil', 2, '[{\"changed\": {\"fields\": [\"DeviceId\", \"Gender\"]}}]', 10, 1),
(693, '2022-04-13 05:36:18.275491', '11', 'nikhil', 2, '[]', 10, 1),
(694, '2022-04-13 05:44:18.307683', '10', 'firstdriver', 2, '[{\"changed\": {\"fields\": [\"DeviceId\", \"Gender\"]}}]', 10, 1),
(695, '2022-04-13 09:35:21.293044', '26', 'Ride_pin object (26)', 1, '[{\"added\": {}}]', 17, 1),
(696, '2022-04-13 10:32:56.447024', '26', 'Ride_pin object (26)', 3, '', 17, 1),
(697, '2022-04-13 11:35:18.660692', '27', 'Ride_pin object (27)', 1, '[{\"added\": {}}]', 17, 1),
(698, '2022-04-13 11:36:20.662226', '27', 'Ride_pin object (27)', 2, '[{\"changed\": {\"fields\": [\"PickUp\", \"Dropout\"]}}]', 17, 1),
(699, '2022-04-13 13:21:36.111672', '1', 'Mahendra', 1, '[{\"added\": {}}]', 13, 1),
(700, '2022-04-13 13:21:38.411934', '2', 'TATA', 1, '[{\"added\": {}}]', 13, 1),
(701, '2022-04-13 13:21:42.925016', '3', 'BMW', 1, '[{\"added\": {}}]', 13, 1),
(702, '2022-04-13 13:21:49.643537', '4', 'SUZUKI', 1, '[{\"added\": {}}]', 13, 1),
(703, '2022-04-13 13:21:59.252876', '1', 'Thar', 1, '[{\"added\": {}}]', 8, 1),
(704, '2022-04-13 13:22:02.933369', '2', 'Nexon Ev', 1, '[{\"added\": {}}]', 8, 1),
(705, '2022-04-13 13:22:10.583029', '3', 'Bolero', 1, '[{\"added\": {}}]', 8, 1),
(706, '2022-04-13 13:22:20.718967', '4', 'Scorpio', 1, '[{\"added\": {}}]', 8, 1),
(707, '2022-04-13 13:22:34.390013', '5', 'Swift', 1, '[{\"added\": {}}]', 8, 1),
(708, '2022-04-13 13:22:48.982114', '6', 'Series 7', 1, '[{\"added\": {}}]', 8, 1),
(709, '2022-04-14 05:26:50.597390', '2', 'second passenger ', 3, '', 11, 1),
(710, '2022-04-14 05:26:50.600254', '1', 'ptest', 3, '', 11, 1),
(711, '2022-04-14 05:27:27.678363', '3', 'hiii', 3, '', 10, 1),
(712, '2022-04-14 05:27:27.680466', '2', 'secondtest', 3, '', 10, 1),
(713, '2022-04-14 05:27:27.681879', '1', 'testd', 3, '', 10, 1),
(714, '2022-04-14 05:43:07.737855', '2', 'Ride object (2)', 2, '[{\"changed\": {\"fields\": [\"Time\", \"Ride time\"]}}]', 12, 1),
(715, '2022-04-14 05:43:13.324415', '2', 'Ride object (2)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(716, '2022-04-14 05:46:04.061762', '2', 'Ride object (2)', 2, '[{\"changed\": {\"fields\": [\"Time\", \"Ride time\"]}}]', 12, 1),
(717, '2022-04-14 06:44:43.722393', '3', 'first passenger', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Pro image\", \"Gender\"]}}]', 11, 1),
(718, '2022-04-14 07:13:17.336857', '6', 'Ride object (6)', 2, '[{\"changed\": {\"fields\": [\"Publish\"]}}]', 12, 1),
(719, '2022-04-14 07:29:51.349797', '4', 'Car_Details object (4)', 3, '', 28, 1),
(720, '2022-04-14 07:29:51.353774', '3', 'Car_Details object (3)', 3, '', 28, 1),
(721, '2022-04-14 07:29:51.354770', '2', 'Car_Details object (2)', 3, '', 28, 1),
(722, '2022-04-14 07:29:51.356765', '1', 'Car_Details object (1)', 3, '', 28, 1),
(723, '2022-04-14 07:30:10.666837', '109', 'Car_Details object (109)', 3, '', 28, 1),
(724, '2022-04-14 07:30:10.667834', '5', 'Car_Details object (5)', 3, '', 28, 1),
(725, '2022-04-14 07:39:24.118793', '7', 'Ride object (7)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(726, '2022-04-14 07:40:04.242940', '7', 'Ride object (7)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1),
(727, '2022-04-14 07:41:56.956083', '7', 'Ride object (7)', 2, '[{\"changed\": {\"fields\": [\"Ride time\"]}}]', 12, 1),
(728, '2022-04-14 07:42:23.339599', '7', 'Ride object (7)', 2, '[{\"changed\": {\"fields\": [\"Ride time\"]}}]', 12, 1),
(729, '2022-04-14 07:42:45.288117', '7', 'Ride object (7)', 2, '[{\"changed\": {\"fields\": [\"Ride time\"]}}]', 12, 1),
(730, '2022-04-14 10:02:28.688057', '2', 'doxersadmin', 3, '', 4, 1),
(731, '2022-04-14 10:02:47.364622', '1', 'djangoadmin', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 4, 1),
(732, '2022-04-14 10:23:58.830544', '13', 'Ride object (13)', 2, '[]', 12, 1),
(733, '2022-04-14 10:52:15.527029', '12', 'Ride_pin object (12)', 2, '[]', 17, 1),
(734, '2022-04-14 10:53:33.991019', '15', 'Ride object (15)', 2, '[{\"changed\": {\"fields\": [\"Trip status\"]}}]', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'doxer', 'booking'),
(23, 'doxer', 'booking_pin'),
(28, 'doxer', 'car_details'),
(8, 'doxer', 'car_name'),
(9, 'doxer', 'cities'),
(10, 'doxer', 'driver'),
(21, 'doxer', 'drivers_rating'),
(22, 'doxer', 'driver_report'),
(20, 'doxer', 'id_proofe'),
(11, 'doxer', 'passanger'),
(19, 'doxer', 'passenger_rating'),
(18, 'doxer', 'passenger_report'),
(12, 'doxer', 'ride'),
(17, 'doxer', 'ride_pin'),
(16, 'doxer', 'search_history'),
(15, 'doxer', 'trip'),
(13, 'doxer', 'vehical_brand'),
(14, 'doxer', 'vehicle'),
(24, 'doxer_admin', 'admin_credentials'),
(25, 'doxer_admin', 'cars_data'),
(27, 'doxer_admin', 'car_data'),
(26, 'doxer_admin', 'indiacardatabasebyteoalidafullspecssample'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-03-16 10:04:48.792127'),
(2, 'auth', '0001_initial', '2022-03-16 10:04:49.276901'),
(3, 'admin', '0001_initial', '2022-03-16 10:04:49.379983'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-03-16 10:04:49.386964'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-03-16 10:04:49.393020'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-03-16 10:04:49.435924'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-03-16 10:04:49.473945'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-03-16 10:04:49.485913'),
(9, 'auth', '0004_alter_user_username_opts', '2022-03-16 10:04:49.492785'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-03-16 10:04:49.571342'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-03-16 10:04:49.576177'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-03-16 10:04:49.584433'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-03-16 10:04:49.596400'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-03-16 10:04:49.610971'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-03-16 10:04:49.622940'),
(16, 'auth', '0011_update_proxy_permissions', '2022-03-16 10:04:49.632493'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-03-16 10:04:49.645953'),
(18, 'doxer', '0001_initial', '2022-03-16 10:04:51.278290'),
(19, 'doxer_admin', '0001_initial', '2022-03-16 10:04:51.296243'),
(20, 'sessions', '0001_initial', '2022-03-16 10:04:51.337216'),
(21, 'doxer', '0002_auto_20220317_1027', '2022-03-17 04:58:26.664128'),
(22, 'doxer', '0003_auto_20220317_1209', '2022-03-17 06:39:50.243108'),
(23, 'doxer', '0004_auto_20220317_1533', '2022-03-17 10:03:15.732930'),
(24, 'doxer', '0005_ride_traveling_time', '2022-03-21 09:06:52.851661'),
(25, 'doxer', '0006_ride_max_parcel', '2022-03-24 09:59:00.332453'),
(26, 'doxer', '0007_alter_ride_pin_for_parcel', '2022-03-24 10:05:05.829598'),
(27, 'doxer', '0008_delete_cities', '2022-03-24 10:07:57.040561'),
(28, 'doxer', '0009_alter_drivers_rating_tri', '2022-03-25 07:46:33.264005'),
(29, 'doxer', '0010_booking_time', '2022-03-25 13:14:23.953873'),
(30, 'doxer', '0011_auto_20220325_1918', '2022-03-25 13:48:58.943536'),
(31, 'doxer', '0012_auto_20220325_1924', '2022-03-25 13:54:38.154674'),
(32, 'doxer', '0013_auto_20220328_1034', '2022-03-28 05:04:32.625714'),
(33, 'doxer', '0014_auto_20220328_1153', '2022-03-28 06:23:31.212435'),
(34, 'doxer', '0015_auto_20220328_1154', '2022-03-28 06:24:05.491421'),
(35, 'doxer', '0016_auto_20220328_1154', '2022-03-28 06:24:14.544517'),
(36, 'doxer', '0017_auto_20220328_1201', '2022-03-28 06:31:46.077865'),
(37, 'doxer', '0018_auto_20220328_1201', '2022-03-28 06:31:59.777089'),
(38, 'doxer', '0019_auto_20220328_1830', '2022-03-28 13:00:45.911831'),
(39, 'doxer', '0020_ride_as_user', '2022-03-29 10:59:04.574020'),
(40, 'doxer', '0021_ride_getpassenger', '2022-03-29 11:02:46.232638'),
(41, 'doxer', '0022_auto_20220329_1647', '2022-03-29 11:17:41.400699'),
(42, 'doxer', '0023_auto_20220329_1650', '2022-03-29 11:20:46.175933'),
(43, 'doxer', '0024_auto_20220329_1654', '2022-03-29 11:24:26.953681'),
(44, 'doxer', '0025_ride_pin_offer_price', '2022-03-29 12:18:55.516299'),
(45, 'doxer', '0026_auto_20220329_1922', '2022-03-29 13:52:21.674882'),
(46, 'doxer', '0027_delete_id_proofe', '2022-03-29 13:53:39.276614'),
(47, 'doxer', '0028_auto_20220330_1049', '2022-03-30 05:19:52.652196'),
(48, 'doxer', '0029_ride_pin_as_user', '2022-03-30 06:29:23.327041'),
(49, 'doxer', '0030_ride_dtime', '2022-03-30 10:39:26.271131'),
(50, 'doxer', '0031_auto_20220404_1113', '2022-04-04 05:43:23.355452'),
(51, 'doxer', '0032_remove_ride_traveling_time', '2022-04-04 06:59:17.023800'),
(52, 'doxer', '0033_ride_publish', '2022-04-04 07:06:11.873559'),
(53, 'doxer', '0034_auto_20220404_1313', '2022-04-04 07:43:30.684544'),
(54, 'doxer', '0035_ride_route', '2022-04-05 05:13:02.432133'),
(55, 'doxer', '0036_ride_pin_car', '2022-04-05 06:58:00.363911'),
(56, 'doxer', '0037_auto_20220405_1241', '2022-04-05 07:11:19.181207'),
(57, 'doxer', '0038_driver_report_drivers_rating_passenger_rating_passenger_report_ride_ride_pin_search_history', '2022-04-05 07:12:04.056107'),
(58, 'doxer', '0039_auto_20220405_1255', '2022-04-05 07:25:13.130984'),
(59, 'doxer', '0040_auto_20220406_1047', '2022-04-06 05:17:12.519989'),
(60, 'doxer', '0041_auto_20220406_1047', '2022-04-06 05:17:59.501290'),
(61, 'doxer', '0042_cities', '2022-04-07 05:55:18.783774'),
(62, 'doxer', '0043_auto_20220408_1022', '2022-04-08 04:52:42.432216'),
(63, 'doxer', '0002_auto_20220408_1043', '2022-04-08 05:13:51.121477'),
(64, 'doxer', '0003_auto_20220408_1044', '2022-04-08 05:14:12.629893'),
(65, 'doxer', '0004_alter_ride_publish', '2022-04-11 11:29:39.443674'),
(66, 'doxer', '0005_ride_ride_time', '2022-04-11 11:30:48.864003'),
(67, 'doxer', '0006_alter_ride_ride_time', '2022-04-11 13:22:42.978213'),
(68, 'doxer', '0007_auto_20220412_1205', '2022-04-12 06:35:53.647991'),
(69, 'doxer', '0008_driver_report_drivers_rating_passenger_rating_passenger_report', '2022-04-12 06:36:18.733758'),
(70, 'doxer', '0009_alter_ride_ride_time', '2022-04-12 07:34:32.618671'),
(71, 'doxer', '0010_auto_20220412_1848', '2022-04-12 13:18:14.097993'),
(72, 'doxer', '0011_auto_20220413_1838', '2022-04-13 13:08:54.118502'),
(73, 'doxer', '0012_initial', '2022-04-13 13:09:21.148210'),
(74, 'doxer_admin', '0002_cars_data', '2022-04-14 04:48:46.082685'),
(75, 'doxer_admin', '0003_alter_cars_data_options', '2022-04-14 04:52:05.010536'),
(76, 'doxer_admin', '0004_delete_cars_data', '2022-04-14 04:53:23.902410'),
(77, 'doxer_admin', '0005_indiacardatabasebyteoalidafullspecssample', '2022-04-14 04:57:07.229221'),
(78, 'doxer_admin', '0006_delete_indiacardatabasebyteoalidafullspecssample', '2022-04-14 05:00:01.834222'),
(79, 'doxer_admin', '0007_car_data', '2022-04-14 05:02:29.656614'),
(80, 'doxer_admin', '0008_auto_20220414_1033', '2022-04-14 05:03:08.117771'),
(81, 'doxer_admin', '0009_auto_20220414_1033', '2022-04-14 05:03:21.316026'),
(82, 'doxer_admin', '0010_auto_20220414_1033', '2022-04-14 05:03:41.027556'),
(83, 'doxer_admin', '0011_auto_20220414_1034', '2022-04-14 05:04:18.592756'),
(84, 'doxer_admin', '0012_auto_20220414_1034', '2022-04-14 05:04:35.692807'),
(85, 'doxer_admin', '0013_auto_20220414_1034', '2022-04-14 05:04:48.338920'),
(86, 'doxer_admin', '0014_auto_20220414_1035', '2022-04-14 05:05:04.248830'),
(87, 'doxer_admin', '0015_auto_20220414_1035', '2022-04-14 05:05:17.167586'),
(88, 'doxer_admin', '0016_auto_20220414_1035', '2022-04-14 05:05:32.933950'),
(89, 'doxer_admin', '0002_car_data', '2022-04-14 05:10:39.035943'),
(90, 'doxer', '0013_car_data', '2022-04-14 05:22:37.357993'),
(91, 'doxer', '0013_car_details', '2022-04-14 05:25:25.201141'),
(92, 'doxer', '0014_remove_car_details_source_url', '2022-04-14 05:29:52.257501'),
(93, 'doxer', '0015_alter_passanger_pro_image', '2022-04-14 06:43:57.737539'),
(94, 'doxer', '0016_auto_20220414_1555', '2022-04-14 10:25:30.684877'),
(95, 'doxer', '0017_remove_ride_km', '2022-04-14 10:54:21.086929');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('008efq2i7oul6696af5c7aoshx4t8zqz', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MjMxNjQzLjI0MDkwMzZ9:1nc0UN:fISCOb0CeNh0ofc5RV7Tbsj_CGJEuKaHdhbadxuhukw', '2022-04-20 07:54:03.257621'),
('0gipkt6fy2218yongxhnenfzvjk7505l', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ4MDI5MDQ2LjYwMTU5OTV9:1nWxde:EFy84SdApKxt_xQxXVCtBAusOlXloq-dfyGtf88W-DA', '2022-04-06 09:50:46.630674'),
('0vd88z7ex3c814abdkitsh8ndmkaj88k', '.eJxVjEsSgyAQBe_COkU5hgF0mX3OQMEwRvLBlOAqlbtHU27cvu5-H5Gi6NuTcIVLSVN2Kafqanpxqf71dqIHrazSBk0rEdBqwNX2Sx3dUnh2Wy9AHLbg6cF5A_Hu822SNOU6pyA3Re60yOsU-XnZ3cPB6Mu41mjY6jN3oDAMRIwqRNsFiDh48qHRrMlYiKYhapSK-CctIK8S6yC-P5mxSMo:1nYoIP:La9nPB1Hvrda-4wKKco-BwuW0dIxCNUHqazMreQMUeI', '2022-04-11 12:16:29.140004'),
('1rvbiwmnppogedywdaubeshz4ihhxqx8', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5NzYyNTA5LjcxMzg3MjR9:1neEaj:amJhyrVzc1j5Z_Wydqbn3BEEDyNf00rLuBJkE5HkK14', '2022-04-26 11:21:49.731896'),
('2ud2rhrjzlzro7qmzv1gyg1tv3cei7ug', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5NzYyNzM5LjQxNDg3MzR9:1neEeR:PAxjttbKTm_o9YZAAIMl5nJhRv0DO6jYzR-yfE0Z7vU', '2022-04-26 11:25:39.430860'),
('333uvsnosbqo3ekj9puk1gvesyvbb1rm', '.eJxVjDsOwyAQBe9CHSFwWMAu0-cMCJZ1TD4QGVxFuXvsyI3bNzPvw1JkQ3dirlKtqWSXcmqupRfV5l9vxwapVW_A9lpwC1aAtqvtlza5pdLstp5JdtiCxwflDcS7z7fCseQ2p8A3he-08muJ9Lzs7uFg8nVaazBk9Zl6qSCMiAQqRNsHGWH06IPQpNFYGY1AFEpF-JNOAq0S6cC-P6N5SNg:1neF19:Cz6AHnhG4p2S2Xww43hW2nkf-UAKAl_IktnxlrybExY', '2022-04-26 11:49:07.801375'),
('3vczxlrt6sf4ughb92l10kujbyyoinii', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MTY2MjgyLjQ0MTIxMzF9:1nbjUA:1cQpbizQF0imfgTvTJ7Mh1JYox9V52nO_D1gqG4chBM', '2022-04-19 13:44:42.457696'),
('3vxlf10pl26md8hod7j8v3ekkjzwamiu', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ3OTU4MTU5LjcyODIyNDV9:1nWfCJ:FneNCOqEX4KLjRXnD7WFOg5Oc8niADbSOb-3-6jWLHg', '2022-04-05 14:09:19.747634'),
('4sc3rzb14d0ghoarcafh5ctqvqc7jfjc', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDgyMDY1MjAuMDA0MDg1LCJpZCI6Mn0:1nXhoy:Bv5PiWlGy00hgA2xEKrFbwOx6gOciWlaB0c1ScR4clM', '2022-04-08 11:09:32.007074'),
('51nlv67fqqvwe9b8qlha58xjem541r3g', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5ODUxNzcxLjM1MDYzOTZ9:1neboR:pFYv5r7vkaQ2hPpd76lr_WobL31OUnFsUfDFPm0kotc', '2022-04-27 12:09:31.428253'),
('5agrsldrtny7zgtzhsx422indjwk44ub', '.eJxVjLsSgyAUBf-FOsOA8rRMn29g4HKNJBEyglUm_x7N2Nie3T0fkiIZugtxFWtNJbuUU3MtzVibn9-ODFwJq4XRnaK9tdz0m-zXNrm14uL2nHBy2oKHJ-YdxIfP90Kh5LakQHeFHrTSW4n4uh7u6WDyddpqqdGoHi0XMowAKEWIxgYe5ejBB6ZQgTY8agbAhIjyTzoucZNQBfL9AW2VSKA:1neB1O:Dz3_rzzx2kTAuIY5O_WddzQiAMSoRNQYQUvtIAtbzg4', '2022-04-26 07:33:06.475863'),
('5chjvf186fds1ifypidz94zuh1pmt05z', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5ODM0MTYxLjg3Mzc1ODZ9:1neXEQ:UyKA8ixz9vj2s4pHIpAM46ZVzzHd_XpUa7WblQv5UnM', '2022-04-27 07:16:02.911986'),
('5uutd4s2c4q06h1qhgposyjsikc0tvq5', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MjM3NzcyLjU5MTQxNX0:1nc25E:SRKZIcU1cn-ycuIJhdjFUqb4dYfomfLpH_fEhcp85qc', '2022-04-20 09:36:12.606058'),
('62lr8bae24tdgc6zumwzj6fgzfdp1mom', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDc5NTU1NzQuMjA1ODkzM30:1nWeWc:oOnXf9iRXXYm_UGbOkoVO_UdkgVdOrHR1-FRnYVrAzY', '2022-04-05 13:26:14.218864'),
('6j07wpbjh5kbrkibeq0qadjgnzfgb2va', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MTM0MTk2LjE0NzkxM30:1nbb8e:bsNCDlsttamO9RwRxUCfOaTlpdr44tcbUZib2fHpfMQ', '2022-04-19 04:49:56.177945'),
('71u92d91bca8w0mx9fg1tvj1rh5051gn', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MDYzNzc5Ljk1MTcxNTV9:1nbIot:373mSKsqSR4OBwWnl5sdxT8yJNr3SjIERDOr4O5bc6M', '2022-04-18 09:16:19.969429'),
('7660w99l4yu78ltmins1lfqu7yiu6lm2', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDg5NzMwNDcuNjk1NDU0OH0:1neFD6:v_mYxCpXp77zlQHAHehN6uWcYx1YiZ1dwuWUU-ierJ8', '2022-04-26 12:01:28.952681'),
('98jot8w5oyumiprutck1k0eq0tdq50qv', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MDYzODc0LjQyMzUwNzd9:1nbIqQ:BtWsAtT_KhQA0KaxLzx8psAqpeT0jQWvwCTi3X4tmH0', '2022-04-18 09:17:54.439153'),
('9hnn4oc2zuv4bqorhkm11mevj4r7ii7q', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MzIyMjI1LjEyNzg2MjJ9:1ncO3N:BfaGCK5bvo5Jn8kMLls1vxfJQ-XlotAoJn6iuPTmHaw', '2022-04-21 09:03:45.143829'),
('9mrlutgh6ba14qlswn7l4tf79s1ripl6', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MTY2NDQ1LjYzMzk3OTN9:1nbjWn:ZsLbQtxaCouAe4TivjH_xjcch56gsgDBQizyRirnpMo', '2022-04-19 13:47:25.650177'),
('a696niao26xv1iz17e2q2q4fn1cobx13', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDgwMjkwMzcuOTA4NjM5NywiaWQiOjJ9:1nWxdY:WDHBw3TBOcLNKR5FljTpdPwDp_yOtqDg7CQu04FXuBM', '2022-04-06 09:50:40.503456'),
('ai6dnjzxq402ug1xjwz0o0wukdpfjs85', '.eJxVjssOwiAURP-FtSFQHoUu3fsNBC63FrVgCl0Z_93WdNPtnDOT-RBXsdZUsks5NdfSjLX5-e3IwLW0RjIhBNVMWmHVhTi_tsmtFReXIhkIJ6cseHhi3kF8-HwvFEpuSwp0V-hBK72ViK_r4Z4GJl-nra16NFqg5VKFEQCVDNHYwKMaPfjANGroDY89A2BSRvUnHVe4SajDNrrf674_HFdIxg:1neaJA:003YsGAEh92AIiq8yXDqCmeBnhC-xAUZht1NLow0EME', '2022-04-27 10:33:08.005800'),
('bgjjufgqurdnkdhs8vimpwwqa9czw4km', '.eJxVjLsSgyAUBf-FOsOA8rRMn29g4HKNJBEyglUm_x7N2Nie3T0fkiIZugtxFWtNJbuUU3MtzVibn9-ODFwJa5m1hlFtO953arP92ia3Vlzc3hNOTlvw8MS8g_jw-V4olNyWFOiu0INWeisRX9fDPR1Mvk5bLTUa1aPlQoYRAKUI0djAoxw9-MAUKtCGR80AmBBR_knHJW4SqkC-P5ytSM4:1nerRi:cEVqQEKZNlXZzmRWlLm6vs1zlVxjgrQ3epj2c4ZQVHY', '2022-04-28 04:51:06.339165'),
('blb696bulxr2bkwu0zvmf3zq7bbprkgx', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDc1MTU3NTAuNDE0MDUsImlkIjoyfQ:1nWWvo:DS67D-ioXjdv2tdhkFOCC_H3GKh4VLhKIZeEP8powFk', '2022-04-05 05:19:44.776402'),
('bqlxgkj646glt021n3fq6p8gjosjarb0', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ3OTIzNjQ0LjE3MzE1ODZ9:1nWWDc:92kbgCrg5sZAs2voHQ5SKQ6jVEewE8i0DwUCN4yvnGQ', '2022-04-05 04:34:04.197399'),
('c2z6yfczl3v5o6450eds3juepswxp3g8', '.eJxVjLsSgyAUBf-FOsOAvMQyfb6Bgcs1kkTICFaZ_Hs0Y2N7dvd8SIpk6C7EVaw1lexSTs21NGNtfn47MnAtrbBCdZIaw4RhZrP92ia3Vlzc3hNOTlvw8MS8g_jw-V4olNyWFOiu0INWeisRX9fDPR1Mvk5brQz2WqDlUoURAJUMsbeBRzV68IFp1GB6Hg0DYFJG9ScdV7hJqAP5_gCW5UjG:1nerzz:jU2p9uh1Zmk2f9n9RxjQuByImbu0yglA3jBHh_3ZblU', '2022-04-28 05:26:31.085830'),
('d0a9c6fbzkvkzy58rdrrrs0o1drghoih', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MTU2ODkzLjI4Njc3NDl9:1nbh2j:1IxhJv4Dn7Zo3Txx-U4gC3FI70ejj6muiJGm0cNor1A', '2022-04-19 11:08:13.302409'),
('d0c326weyi9nxrf144qec4akik5q2ekk', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MzEwMzk5Ljc1OTgzOH0:1ncKyd:5yvpJpUBO770VvfeYkFwq2HC12lnBEQIePemfNZQekc', '2022-04-21 05:46:39.774160'),
('d1pn4krl6zmz633atlkdsugn5kuwn895', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ3OTU3ODQ0LjUxMDI3MjN9:1nWf7E:URvr-Of6xam93IY-u4pekyIaVqWC1OnVOEgDL-Rnzwc', '2022-04-05 14:04:04.539954'),
('d1s4dffi7itoyeneids874sehhdantsz', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ3OTI2NDU1LjM3MTMwODh9:1nWWwx:RtNcyiVIZvv98aq-33eq5TGBnXh9FA88vRGtN8Zwv0g', '2022-04-05 05:20:55.386260'),
('d88xtvvsupd4j2wh7zr6rc739hn4mj22', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ4MDMzMjgyLjY0NDY4NH0:1nWyjy:oFFDNedrMrc1iiHmDkELWCfW0X7HNoWPldmTkguQFss', '2022-04-06 11:01:22.664892'),
('dkyj6m9smtlq6tsbyrx7wq8e93dgdtx4', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MzEwMzU4LjQwOTIxOX0:1ncKxy:R2KljgFSRZ8UtmhkVgmnZt7re9hBOhiEuCvpmN3qJJo', '2022-04-21 05:45:58.426368'),
('e54pg10x0p1b24rfgzsxhgptd2qrqb3n', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5ODI1NjE1LjEzMTA2OH0:1neV0Z:L0fsvdh1pNFN4D0PJpJ4owXn4tTVjHAGVm2jyaafu90', '2022-04-27 04:53:35.251929'),
('ef93s4qz8iu16tmx0qo3xp9hopdrjmad', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDc5NTgxNTIuMDg2MTUzNywiaWQiOjJ9:1nWfCD:hVYe2wzsXEC2Y1YFk4odCG7wqyH5TkRURtHhqp9wltk', '2022-04-05 14:09:13.409039'),
('ezzymyutuo9tu340cdwwonsa2vyr1pl8', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5ODU2NTk2LjE4OTM1MTN9:1ned4G:gsH5-Mhj7k7f3DXsOkhLssu96PjZ7WWHekP101qMWKY', '2022-04-27 13:29:56.199169'),
('fmgewetfa4jgmmrj4c1jvle54ta1kbqq', '.eJxVjDsOwyAQBe9CHSFwWD4u0-cMCJZ1TD44MriKcvfYkRu3b2beh-XE-u7EfKVa81R8Lrn5ll9UW3i9PeulVs5CJ4ThxlkHWq92WNrol0qz33om2WGLAR9UNpDuodwmjlNpc458U_hOK79OiZ6X3T0cjKGOaw2GrD6TkwrigEigYrIuygRDwBCFJo3GymQEolAqwZ90EmiVSEf2_QGhEUjV:1nebsR:3Wxrc6Ix6xRJgSOFMd_BaqKSS2n-Ulh8HYuJpPv1oG4', '2022-04-27 12:13:39.902296'),
('gbamzpnmqdl856r8fwnkos8clfxoz539', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5ODUxODE5LjIzNzM3MDN9:1nebpD:YIP3bEdyWc05c2XiFLNnxjt_XVyt0ZbCg7qr_KsbEbc', '2022-04-27 12:10:19.253410'),
('htvzpbfclvdwgh74jj1c2qmdjbbholl3', '.eJxVjEsSgyAQBe_COkU5hkF0mX3OQMEwRvKBlOAqlbtHU27cvu5-HxGDGNqTsIVLiTnZmGK1Nb64VPd6WzGAVj1oxBYlajBGbbZb6mSXwrPdegHisHlHD04bCHeXbllSTnWOXm6K3GmR1xz4edndw8HkyrTW2LHRZ-5BoR-JGJUPpvcQcHTkfKNZU2cgdA1Ro1TAP2kBeZVYe_H9AZd5SMc:1nbjKu:rBKqMKR4qYl8tHDlYwXUKgl32I6RBhafRXNewVIc2UM', '2022-04-19 13:35:08.425258'),
('iwolyaagpxnsgqw8nlz1aiqc9sesvm7k', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDc0NDE1NDkuODE5MzEzLCJpZCI6Mn0:1nWIhn:HYKaUKE3-g1A7-OE2sumwsG4jveVPGeg1-BJcjA7fzU', '2022-04-04 14:08:19.710906'),
('jvsp33koqtdig9ahy21h0gdvnw6ebszs', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MjI3NTcxLjE4NzczMTd9:1nbzQh:h7WgQQK08M0hVJWVTXpxIran2Q84Blo1fLKhyqk7M6s', '2022-04-20 06:46:11.205682'),
('jxt9e17lgjxwgsanzqbfcxrdvs27qnoa', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ4MDM3MTM1LjQ3NzI5MzN9:1nWzk7:NqgykD1YS7qphpA0DOyxdoE9E-TRYxq6dKqOjBfM7XQ', '2022-04-06 12:05:35.492852'),
('k9ic0yl7erfeiu61o5yalx6a1qt0a407', '.eJxVjDsOgzAQBe_iGlks8Q_K9DmDZa-X4CTYETZVlLsHIhramXnvw2yhUmJONqZYbY0zlermt2UDKKGNAqOBS9MJgIbFwIauYdatdbJrocXuhAE7Me_wSWkX4eHSPXPMqS7R8z3hhy38lgO9rkd7Ophcmba11GTUhXoQ0o-IJIUPpvcQ5OjQ-VaRQm0g6BaxFSLIv-lA0haR8uz7A3o-SI8:1nWGjc:nlzGCXNLbBFvFY_LTYdbDtawErUFMDUMLBycflZEpPs', '2022-04-04 12:02:04.235257'),
('l9ryjq78okqngojf6or0p39sshj647dw', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ4MDI5ODc5Ljc5MTUyNTF9:1nWxr5:S5NHQwygS3WylUfGcKCgywSkCOmYA0w-OVHbvV_RmmY', '2022-04-06 10:04:39.823256'),
('liu1swydxgd52dz16pqysimmkrk9b627', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5ODQxNDU4LjQxMTg2ODZ9:1neZ86:Cl5qXrr5gHFve5eSaYWfh6uPHxZuxz6-H-DfDhWXuRg', '2022-04-27 09:17:38.427122'),
('m2kow1c08sw4antle27y6f6qc1r227ik', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDc5NTg1NjUuNTczNzY1fQ:1nWfIr:TNAuh4QaRunBouSrph4lpZkvTgTK9f7NFeM_Wtb8AIk', '2022-04-05 14:16:05.583338'),
('m7g428stjzac7e4d1xajhtnw4u8z3sxp', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDc5NTc4MzIuNDUyMzc5N30:1nWf72:APhNcG-sF7ff-DlzDnc4ALey2QIUadwgGnSl5oTjGdo', '2022-04-05 14:03:52.514874'),
('mjp1tv2a9xcu78j5qfbei7ftoq089hds', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ3OTQ5ODM0LjYwNDQyMTZ9:1nWd22:IEiT-F_0-x823yVdya9tJqusiQKVN_nVnPj_YnPMeEk', '2022-04-05 11:50:34.623603'),
('nf58pmx9yfdgj85kbyfjtj9y120k8yxx', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ3OTU4MTY1LjI3NjExNzZ9:1nWfCP:n8h86ris5qm2T1-b091uvCJNYo4nJbNjZlvTe9nkOMI', '2022-04-05 14:09:25.291826'),
('nxnm5dltz8hxdbwm7nwoultdmr4usnci', '.eJxVjssOwiAURP-FtSHQ8ihduvcbCFxuLWrBFLoy_rvUdNPtnDOT-RBbsJSYk40pVlvjgqW65W3JyJUwpmd64LQXXDN1IdZtdbZbwdXGQEbCySnzDp6YdhAeLt0zhZzqGj3dFXrQQm854Ot6uKeB2ZW5taXGQfVouJB-AkApfBiM50FODpxnChW0W0EzACZEkH_ScYlNQuXb6H6v-_4A5thIjg:1newNK:qtJMdMwBgDp-ET_8Opavivvsxl2OjCzWF5JOLyqf4BA', '2022-04-28 10:06:54.072574'),
('o5g5w98iu9gxw1mysi78dgogaap6ow7j', '.eJxVjLsSgyAUBf-F2mHA8LRMn29g4HKNJBEyglUm_x7N2Nju7jkf4irWmkp2KafmWpqxNj-_HRm4EtZI0WtLGTPyIkRHUiRD3xHn1za5teLidkI4ObHg4Yl5F_Hh871QKLktKdA9oYet9FYivq5HezqYfJ22tdRo1AUtFzKMAChFiMYGHuXowQemUIE2PGoGwISI8m96LnGLUAXy_QGwoEjI:1necvv:Lj7K-lOgFQBfg_jdoSlagJEDIDnSDObtKnLGc5psN1M', '2022-04-27 13:21:19.212277'),
('omlm1yd77j46nbuw4quyaj6s8sgs056m', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDkzMDkxNjQuOTk5NjgzNCwiaWQiOjJ9:1ncKg7:pfFwpCae5fUziCIEehxJzlgyU6S49vqlELjgwXW-gbo', '2022-04-21 05:27:31.631267'),
('owvs47imli81iqx4uf2ymsrerhikemfy', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MjIzMjQwLjM1MDIyNjZ9:1nbyIq:uVE0BHGDEQaPz_cJaiA5sMFHQSZtrFeDV0FZwfRIUqU', '2022-04-20 05:34:00.370351'),
('pdqm0d9mpa47adg7czbvfhdp63x5j7qb', '.eJxVjjsOwyAQRO9CHSFw2AW7TJ8zID7rmHwgMriKcvfYkRu3896M5sNspVpTyTbl1GxLL6rNvd6WDRKV7sHoTnCNEgHwxKxb2mSXSrNNkQ1MskPmXXhQ3kC8u3wrPJTc5uT5pvCdVn4tkZ6X3T0MTK5Oaxs0GTxTLxX4MQQC5aPpvYwwuuC8QMKgjYxahCCUivAnnQRaJUK_jm73uu8PIlpIzg:1nWucG:WMsxsfeMeqF2srL9RhT51PgfSO_S70v1YipaTApjypA', '2022-04-06 06:37:08.049438'),
('qbit1xxj621nzrvc9obnmn4eg8cqddyk', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MzIxNzU0LjE4MDg3NjN9:1ncNvm:Y4a1ORVuk8iOs5K2i30DnRFyN1_ppaNg68fN0AwFLKA', '2022-04-21 08:55:54.374099'),
('qeyiata13usgifjmrl6o3rxa3ct635ru', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDc5NTgxNzUuNjIzODE2M30:1nWfCq:pb8a1q_b7qJZXFhAb5UhS2J0MesmTQIElsQeWZqMHx8', '2022-04-05 14:09:52.455316'),
('qkf7swtd52c4yqwwr1rhkkeba02zcyx9', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5ODMwMzU3LjAwNTM0M30:1neWF3:aqOKYrUyEfGxaXSiz5kkF1fuynJyUS8zmVvbec8aozg', '2022-04-27 06:12:37.018972'),
('r3lgsrky20idejlfgftsz2vm30dp8kkn', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5NzYyMzgyLjk4NDgwNDl9:1neEYg:lEjQGapzmND_5neGqZugrz_OxgGE2l5B-9Qz_lIm2s8', '2022-04-26 11:19:42.999804'),
('r7rfbbig06ggs4r0wntndra75yem81la', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDc5NTcwMTguNTMzMzA1Mn0:1nWetu:C_lmIp_rHGWJzGCdMGSMnzyabzGkvUcyKI96fQsATVA', '2022-04-05 13:50:18.641836'),
('rczt1cshymseawg80jzkxsk3vr6fifmx', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5ODM1MDA3LjU5MjIyOTR9:1neXS3:JpWwqirmONnnR6XIXiifnTUSIKtwJ9OwYXIVjpPjQAw', '2022-04-27 07:30:07.608627'),
('rfp150crr2gfg5bmmarcjeh2t11vz14k', '.eJxVj0EOwiAURO_CuiGAQGmX7j0Dgc-vRS2YQlfGu1tMF7qd92aSeRHrtjrbreBqYyAj4aT7zbyDO6YGws2la6aQU12jp02hBy30kgM-zof7NzC7Mu9t1aPRJxy4VH4CQCV9MIPnQU0OnGcaNfSGh54BMCmD-hLBFe4Sat9GC5YSc7IxxWprXLBUtzwtGbmWhkkh-oGejBHGdKR9Ee8PWDtImQ:1nXFmb:f6J4AlfoKs1n7720Q5SiiUmk0t__WGODsjRPRnEmf3s', '2022-04-07 05:13:13.124942'),
('riomqojdfga18i78uu69hmftai6aj9fp', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDc4NzAxMjIuODYzODE5NCwiaWQiOjJ9:1nWXEq:Y3FY0NbBSGJ_cc_lP2iTASFm6RLxAvRiGAvD52A2jWo', '2022-04-05 05:39:24.738308'),
('rqm131l9a83sabmogyv6mzom4wk8kpdg', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ4MDM3MTk5LjQ0NTAxMzN9:1nWzl9:oEmsrfUrSwQtyw3H7HMueaj4G88gdMbXJJswUeccoMM', '2022-04-06 12:06:39.459937'),
('rw6qxnzx96t8m9p6sh7zxlldn20w2ak6', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MTY1OTU5LjU3ODU4N30:1nbjOx:l0mtJlw7jOVwbx0upkJ41t6mcDja7TIi4sjgLT5IAFI', '2022-04-19 13:39:19.594574'),
('scmgylsgapinfup8igb6kvbxhoyjmjg8', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDk3NjQ5MTUuODA3MDI4M30:1neFGZ:nl-hlgDnOxMhf_P2CgWWX1OQbNdYVBZXCBteI0qSjVg', '2022-04-26 12:05:03.433661'),
('sn30ivehdcvmutjtuc7regvbbrdojw88', '.eJxVj8sOwiAURP-FdUNK5dmle7-BwOXWohZMoSvjv1tMF7qdc2aSeRHrtjrbreBqYyAjYaT7zbyDO6YGws2la6aQU12jp02hBy30kgM-zof7NzC7Mu9toVDLExrGhZ8AUHAftPEsiMmB871ECUqzoHqAnvMgvmRgAncJpW-jBUuJOdmYYrU1LliqW56WjExyowUzg6SaGa0V70g7M7w_oXZI2Q:1nebqz:Al7Qec_JcY5vwWAdtcTF0WtzzqKrTye2Kz5D00bwSyc', '2022-04-27 12:12:09.054521'),
('twhxl696nqxe3xz8r7zk78pgrt261hgx', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MTY3NjM3LjM3OTQxfQ:1nbjq1:UokoDJu-L0DP2CRfe0g3e7PkLbFTjnCBYd7ZjWo_rDc', '2022-04-19 14:07:17.397063'),
('u1vo3i6s9ky7m9wt669oti6997ezuyou', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDk5MzEwNTMuOTg2ODEyOCwiaWQiOjJ9:1newVu:_ECpTAedmu7fjRKkbfj45Qcl7BAbFLmtmJGF-jDk6-k', '2022-04-28 10:15:46.184313'),
('uxlfp5mvjnexxofgaj81ocyvqe8cg73n', '.eJxVjzkOwyAURO9CbSG-zWaX6XMGxPIdkwUig6sod4-JXCTtvDcjzYsYu9XFbAVXEwOZCJDuN3PW3zA1EK42XTL1OdU1OtoUetBCzzng_XS4fwOLLcveFgq1HHAELtzsPQrugh4dBDFbbx2TKL3SEBTznnEexJf0IHCXULo2WrCUmJOJKVZT4wNLtY-nIRNIrvgoBgYUBhBS8460M_37A5_ESL0:1nWeLB:txHP-S0b0PFXysD3_FRezM087HAmPHWLhw3EYeujtpc', '2022-04-05 13:14:25.429080'),
('vgftaookk3vpa9ln1wnem6fin8fy86zn', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDc5NTc5ODYuMjM0MzYwN30:1nWf9W:kHEbeedFBamk0DoKzVkx4CI0VcVDaefnF5q8MlN_IwI', '2022-04-05 14:06:26.240426'),
('vmb4fsi94chqfifs6c5z9ydwkqgaw5lp', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MjM3NTM3LjczNTAyNjh9:1nc21R:Q124pmDr2XQrs-_RSCsTpVNdoJP8tilCT-U5w13Z4Ko', '2022-04-20 09:32:17.749700'),
('wfocbp7qfvqmzx2ocryr4n9cmwjrwfjl', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MzEwNDM3LjIzMjE4NDZ9:1ncKzF:Klzv23BphWr5bDEjNPeD4WOk6fX62pNogBNqL9H7Hvw', '2022-04-21 05:47:17.248811'),
('x9ulynpmb233246bhf9kkhbglazqcq8b', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5MjE5NjIwLjMyNjM4MTJ9:1nbxMS:GuSPMRp2hPCJ6m9p2V6IdlXkqDMLrPfqsyErY8UewS4', '2022-04-20 04:33:40.342817'),
('xpzzggcjwuyimve3grc4h13jxyzaseez', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ4MDM1NjYwLjIyNzU2MDh9:1nWzMK:GFr4-4VCbu-PG_fgQsvVphtuQrfF_dqQ-tbqNW6P1Qc', '2022-04-06 11:41:00.251379'),
('yiduvj0ymx8swyoj3hs14d2ni9p4aggg', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ4Nzk2MDcwLjM2NDE3OTh9:1naBB0:0rn8rfpYTdRdLnVRq0mL5afD3K0oce0cYyzkPeo_11I', '2022-04-15 06:54:30.378288'),
('ym866b5cyryr6xytu1o7s0o03n554yug', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5Njc0MDQ4LjY0NzMwMTJ9:1ndrZw:Mxdr5NjyoYb63rscYN9kxBtieAF3AgMb26X0TxNSJjc', '2022-04-25 10:47:28.706581'),
('zfukxsinmy5bzblhxovbpysaweouo0v1', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NDkyMTk1NDcuOTk4MDA5MiwiaWQiOjJ9:1nebqA:Hs1u4wdLkbxc7tKQODayu247wTGbTxeLUdzCyhIua_E', '2022-04-27 12:11:18.453952'),
('zmjgh15je2zq24awn3l09e40t5rsttpm', 'eyJpZCI6MiwiX3Nlc3Npb25faW5pdF90aW1lc3RhbXBfIjoxNjQ5NzYyMzI2LjI2NDY5MzV9:1neEXm:UVT8g-9c2vlCWm5caF1W_Ew0CiQFYOFAxriDc-tfSMQ', '2022-04-26 11:18:46.307370'),
('zqugc44l1t6caazrvwrne4v0mmvd8oh1', '.eJxVjLsSgyAUBf-FOsOA8rRMn29g4HKNJBEyglUm_x7N2Nie3T0fkiIZugtxFWtNJbuUU3MtzVibn9-ODFwJw3qllaC9sZ3t9Wb7tU1urbi4vSecnLbg4Yl5B_Hh871QKLktKdBdoQet9FYivq6HezqYfJ22Wmo0qkfLhQwjAEoRorGBRzl68IEpVKANj5oBMCGi_JOOS9wkVIF8f5ziSM8:1nWzzL:SYsBZyuWwfgPPA1QLEl823ZdkEImSY-8Rut6nANiZJM', '2022-04-06 12:21:19.294244');

-- --------------------------------------------------------

--
-- Table structure for table `doxer_admin_admin_credentials`
--

CREATE TABLE `doxer_admin_admin_credentials` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doxer_admin_admin_credentials`
--

INSERT INTO `doxer_admin_admin_credentials` (`id`, `username`, `password`) VALUES
(1, 'admin@gmail.com', 'pbkdf2_sha256$260000$nmTl4SvUJyWNl44n3HbWRk$MfuaOM2wHvH7bF8lrx/2BEsFkJzNcYIzVT13AKa6JvU='),
(2, 'Admin', 'pbkdf2_sha256$260000$Wy5ekBhCWXapxAFAoe2IqQ$iPbi8BU2NyVnHLWoHw0EA6/BC5nC3MPn3NJjHUfzwK8='),
(3, 'Admin', 'pbkdf2_sha256$260000$bq4YOW4ygJ19BGv76FA4i4$Qzb4IvyxO25mICV1T0Qa/+BgOnFeZIr+cQh+QrQFU/I=');

-- --------------------------------------------------------

--
-- Table structure for table `doxer_car_details`
--

CREATE TABLE `doxer_car_details` (
  `id` int(11) NOT NULL,
  `Make` varchar(9) DEFAULT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `Version` varchar(29) DEFAULT NULL,
  `Notes` varchar(12) DEFAULT NULL,
  `Image URL` varchar(1061) DEFAULT NULL,
  `Key Seating Capacity` varchar(8) DEFAULT NULL,
  `Seating Capacity` varchar(8) DEFAULT NULL,
  `No of Seating Rows` varchar(6) DEFAULT NULL,
  `Bootspace` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doxer_car_details`
--

INSERT INTO `doxer_car_details` (`id`, `Make`, `Model`, `Version`, `Notes`, `Image URL`, `Key Seating Capacity`, `Seating Capacity`, `No of Seating Rows`, `Bootspace`) VALUES
(6, 'BMW', '3 Series', '330i Sport', '', 'https://imgd.aeplcdn.com/664x374/cw/ec/37067/BMW-3-Series-Exterior-167583.jpg?wm=0&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '480 litres'),
(7, 'BMW', '3 Series', '320d Sport', '', 'https://imgd.aeplcdn.com/664x374/cw/ec/37067/BMW-3-Series-Exterior-167583.jpg?wm=0&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '480 litres'),
(8, 'BMW', '3 Series', '320d Luxury Edition', '', 'https://imgd.aeplcdn.com/664x374/cw/ec/37067/BMW-3-Series-Exterior-167583.jpg?wm=0&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '480 litres'),
(9, 'BMW', '3 Series', '320d Luxury Line', '', 'https://imgd.aeplcdn.com/664x374/cw/ec/37067/BMW-3-Series-Exterior-167583.jpg?wm=0&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '480 litres'),
(10, 'BMW', '3 Series', '330i M Sport', '', 'https://imgd.aeplcdn.com/664x374/cw/ec/37067/BMW-3-Series-Exterior-167583.jpg?wm=0&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '480 litres'),
(11, 'BMW', '3 Series [2016-2019]', '320i Prestige', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/20231/BMW-3-Series-Right-Front-Three-Quarter-86766.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(12, 'BMW', '3 Series [2016-2019]', '320d Prestige', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/20231/BMW-3-Series-Right-Front-Three-Quarter-86766.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(13, 'BMW', '3 Series [2016-2019]', '320d Sport Line [2016-2018]', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/20231/BMW-3-Series-Right-Front-Three-Quarter-86766.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(14, 'BMW', '3 Series [2016-2019]', '320d Edition Sport', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/20231/BMW-3-Series-Right-Front-Three-Quarter-86766.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(15, 'BMW', '3 Series [2016-2019]', '320d Sport Shadow Edition', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/20231/BMW-3-Series-Right-Front-Three-Quarter-86766.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(16, 'BMW', '3 Series [2016-2019]', '330i Sport Line', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/20231/BMW-3-Series-Right-Front-Three-Quarter-86766.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(17, 'BMW', '3 Series [2016-2019]', '320i Luxury Line', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/20231/BMW-3-Series-Right-Front-Three-Quarter-86766.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(18, 'BMW', '3 Series [2016-2019]', '320d Luxury Line', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/20231/BMW-3-Series-Right-Front-Three-Quarter-86766.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(19, 'BMW', '3 Series [2016-2019]', '320d M Sport', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/20231/BMW-3-Series-Right-Front-Three-Quarter-86766.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(20, 'BMW', '3 Series [2016-2019]', '330i M Sport Edition', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/20231/BMW-3-Series-Right-Front-Three-Quarter-86766.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(21, 'BMW', '3 Series [2016-2019]', '330i M Sport Shadow Edition', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/20231/BMW-3-Series-Right-Front-Three-Quarter-86766.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(22, 'BMW', '3 Series GT', '330i M Sport Shadow Edition', '', 'https://imgd.aeplcdn.com/664x374/cw/ec/18273/BMW-3-Series-GT-Right-Front-Three-Quarter-82155.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '520 litres'),
(23, 'BMW', 'M3 [2018-2019]', 'Sedan', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/33171/BMW-M3-Exterior-119388.jpg?wm=0&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '480 litres'),
(24, 'Chevrolet', 'Sail', '1.2 Base', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/19/8D/14609/img/m/Chevrolet-Sail-Front-view-32242_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '370 litres'),
(25, 'Chevrolet', 'Sail', '1.2 LS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/19/8D/14609/img/m/Chevrolet-Sail-Front-view-32242_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '370 litres'),
(26, 'Chevrolet', 'Sail', '1.3 Base', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/19/8D/14609/img/m/Chevrolet-Sail-Front-view-32242_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '370 litres'),
(27, 'Chevrolet', 'Sail', '1.2 LS ABS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/19/8D/14609/img/m/Chevrolet-Sail-Front-view-32242_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '370 litres'),
(28, 'Chevrolet', 'Sail', '1.3 LS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/19/8D/14609/img/m/Chevrolet-Sail-Front-view-32242_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '370 litres'),
(29, 'Chevrolet', 'Sail', '1.2 LT ABS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/19/8D/14609/img/m/Chevrolet-Sail-Front-view-32242_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '370 litres'),
(30, 'Chevrolet', 'Sail', '1.3 LS ABS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/19/8D/14609/img/m/Chevrolet-Sail-Front-view-32242_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '370 litres'),
(31, 'Chevrolet', 'Sail', '1.3 LT ABS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/19/8D/14609/img/m/Chevrolet-Sail-Front-view-32242_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '370 litres'),
(32, 'Chevrolet', 'Sail Hatchback', '1.2 Base', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/76/29/18223/img/m/Chevrolet-Sail-Hatchback-Right-Front-Three-Quarter-49910_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '248 litres'),
(33, 'Chevrolet', 'Sail Hatchback', '1.2 LS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/76/29/18223/img/m/Chevrolet-Sail-Hatchback-Right-Front-Three-Quarter-49910_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '248 litres'),
(34, 'Chevrolet', 'Sail Hatchback', '1.2 LS ABS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/76/29/18223/img/m/Chevrolet-Sail-Hatchback-Right-Front-Three-Quarter-49910_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '248 litres'),
(35, 'Chevrolet', 'Sail Hatchback', '1.3 Base', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/76/29/18223/img/m/Chevrolet-Sail-Hatchback-Right-Front-Three-Quarter-49910_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '248 litres'),
(36, 'Chevrolet', 'Sail Hatchback', '1.2 LT ABS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/76/29/18223/img/m/Chevrolet-Sail-Hatchback-Right-Front-Three-Quarter-49910_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '248 litres'),
(37, 'Chevrolet', 'Sail Hatchback', '1.3 LS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/76/29/18223/img/m/Chevrolet-Sail-Hatchback-Right-Front-Three-Quarter-49910_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '248 litres'),
(38, 'Chevrolet', 'Sail Hatchback', '1.3 LS ABS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/76/29/18223/img/m/Chevrolet-Sail-Hatchback-Right-Front-Three-Quarter-49910_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '248 litres'),
(39, 'Chevrolet', 'Sail Hatchback', '1.3 LT ABS', 'discontinued', 'https://imgd.aeplcdn.com/664x374/ec/76/29/18223/img/m/Chevrolet-Sail-Hatchback-Right-Front-Three-Quarter-49910_ol.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '248 litres'),
(40, 'Tata', 'Nexon', 'XE', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(41, 'Tata', 'Nexon', 'XM', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(42, 'Tata', 'Nexon', 'XM (S)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(43, 'Tata', 'Nexon', 'XMA', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(44, 'Tata', 'Nexon', 'XE Diesel', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(45, 'Tata', 'Nexon', 'XZ', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(46, 'Tata', 'Nexon', 'XMA (S)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(47, 'Tata', 'Nexon', 'XM Diesel', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(48, 'Tata', 'Nexon', 'XZ Plus', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(49, 'Tata', 'Nexon', 'XM (S) Diesel', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(50, 'Tata', 'Nexon', 'XMA Diesel', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(51, 'Tata', 'Nexon', 'XZ Plus Dual Tone', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(52, 'Tata', 'Nexon', 'XZ Diesel', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres');
INSERT INTO `doxer_car_details` (`id`, `Make`, `Model`, `Version`, `Notes`, `Image URL`, `Key Seating Capacity`, `Seating Capacity`, `No of Seating Rows`, `Bootspace`) VALUES
(53, 'Tata', 'Nexon', 'XZA Plus', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(54, 'Tata', 'Nexon', 'XZ Plus (S)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(55, 'Tata', 'Nexon', 'XMA (S) Diesel', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(56, 'Tata', 'Nexon', 'XZA Plus Dual Tone', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(57, 'Tata', 'Nexon', 'XZ Plus Dual Tone (S)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(58, 'Tata', 'Nexon', 'XZ Plus (O)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(59, 'Tata', 'Nexon', 'XZ Plus (O) Dual Tone', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(60, 'Tata', 'Nexon', 'XZA Plus (S)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(61, 'Tata', 'Nexon', 'XZ Plus Diesel', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(62, 'Tata', 'Nexon', 'XZA Plus Dual Tone (S)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(63, 'Tata', 'Nexon', 'XZA Plus (O)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(64, 'Tata', 'Nexon', 'XZ Plus Diesel Dual Tone', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(65, 'Tata', 'Nexon', 'XZA Plus (O) Dual Tone', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(66, 'Tata', 'Nexon', 'XZ Plus Diesel (S)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(67, 'Tata', 'Nexon', 'XZA Plus Diesel', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(68, 'Tata', 'Nexon', 'XZ Plus Diesel Dual Tone (S)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(69, 'Tata', 'Nexon', 'XZA Plus Diesel Dual Tone', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(70, 'Tata', 'Nexon', 'XZ Plus (O) Diesel', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(71, 'Tata', 'Nexon', 'XZ Plus (O) Diesel Dual Tone', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(72, 'Tata', 'Nexon', 'XZA Plus Diesel (S)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(73, 'Tata', 'Nexon', 'XZA Plus Diesel Dual Tone (S)', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(74, 'Tata', 'Nexon', 'XZA Plus (O) Diesel', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(75, 'Tata', 'Nexon', 'XZA Plus (O) Diesel Dual Tone', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/41645/tata-nexon-right-front-three-quarter3.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(76, 'Tata', 'Nexon [2017-2020]', 'XE', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(77, 'Tata', 'Nexon [2017-2020]', 'KRAZ Petrol', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(78, 'Tata', 'Nexon [2017-2020]', 'XM', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(79, 'Tata', 'Nexon [2017-2020]', 'KRAZ MT Petrol', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(80, 'Tata', 'Nexon [2017-2020]', 'KRAZ Plus Petrol', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(81, 'Tata', 'Nexon [2017-2020]', 'XE Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(82, 'Tata', 'Nexon [2017-2020]', 'XT [2017-2019]', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(83, 'Tata', 'Nexon [2017-2020]', 'XT', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(84, 'Tata', 'Nexon [2017-2020]', 'XMA Petrol', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(85, 'Tata', 'Nexon [2017-2020]', 'KRAZ Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(86, 'Tata', 'Nexon [2017-2020]', 'XT Plus', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(87, 'Tata', 'Nexon [2017-2020]', 'KRAZ Plus AMT Petrol', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(88, 'Tata', 'Nexon [2017-2020]', 'XM Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(89, 'Tata', 'Nexon [2017-2020]', 'XZ', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(90, 'Tata', 'Nexon [2017-2020]', 'KRAZ Plus Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(91, 'Tata', 'Nexon [2017-2020]', 'KRAZ MT Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(92, 'Tata', 'Nexon [2017-2020]', 'XT Diesel [2017-2019]', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(93, 'Tata', 'Nexon [2017-2020]', 'XT Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(94, 'Tata', 'Nexon [2017-2020]', 'XT Plus Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(95, 'Tata', 'Nexon [2017-2020]', 'XMA Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(96, 'Tata', 'Nexon [2017-2020]', 'XZ Plus', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres');
INSERT INTO `doxer_car_details` (`id`, `Make`, `Model`, `Version`, `Notes`, `Image URL`, `Key Seating Capacity`, `Seating Capacity`, `No of Seating Rows`, `Bootspace`) VALUES
(97, 'Tata', 'Nexon [2017-2020]', 'KRAZ Plus AMT Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(98, 'Tata', 'Nexon [2017-2020]', 'XZ Plus Dual Tone', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(99, 'Tata', 'Nexon [2017-2020]', 'XZ Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(100, 'Tata', 'Nexon [2017-2020]', 'XZA Plus Petrol', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(101, 'Tata', 'Nexon [2017-2020]', 'XZA Plus Petrol Dual Tone', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(102, 'Tata', 'Nexon [2017-2020]', 'XZ Plus Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(103, 'Tata', 'Nexon [2017-2020]', 'XZ Plus Diesel Dual Tone', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(104, 'Tata', 'Nexon [2017-2020]', 'XZA Plus Diesel', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(105, 'Tata', 'Nexon [2017-2020]', 'XZA Plus Diesel Dual Tone', 'discontinued', 'https://imgd.aeplcdn.com/664x374/cw/ec/16868/Tata-Nexon-Right-Front-Three-Quarter-107996.jpg?v=201711021421&amp;q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '', '5 Person', '2 Rows', '350 litres'),
(106, 'Tata', 'Nexon EV', 'XM', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/42611/tata-nexon-ev-right-front-three-quarter6.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(107, 'Tata', 'Nexon EV', 'XZ Plus', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/42611/tata-nexon-ev-right-front-three-quarter6.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres'),
(108, 'Tata', 'Nexon EV', 'XZ Plus LUX', '', 'https://imgd.aeplcdn.com/664x374/n/cw/ec/42611/tata-nexon-ev-right-front-three-quarter6.jpeg?q=85;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;https://imgd.aeplcdn.com/0x0/statics/grey.gif;', '5 Seater', '5 Person', '2 Rows', '350 litres');

-- --------------------------------------------------------

--
-- Table structure for table `doxer_car_name`
--

CREATE TABLE `doxer_car_name` (
  `id` bigint(20) NOT NULL,
  `cars` varchar(255) NOT NULL,
  `brand_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doxer_car_name`
--

INSERT INTO `doxer_car_name` (`id`, `cars`, `brand_id`) VALUES
(1, 'Thar', 1),
(2, 'Nexon Ev', 2),
(3, 'Bolero', 1),
(4, 'Scorpio', 1),
(5, 'Swift', 4),
(6, 'Series 7', 3);

-- --------------------------------------------------------

--
-- Table structure for table `doxer_cities`
--

CREATE TABLE `doxer_cities` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doxer_driver`
--

CREATE TABLE `doxer_driver` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `DeviceId` varchar(255) DEFAULT NULL,
  `pro_image` varchar(255) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `img_status` varchar(255) NOT NULL,
  `active_ac_with_otp` varchar(10) NOT NULL,
  `email_or_num` varchar(60) NOT NULL,
  `email` varchar(40) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `fare_per_km` double NOT NULL,
  `dob` date DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `bio` varchar(255) NOT NULL,
  `otp` varchar(4) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cpassword` varchar(255) NOT NULL,
  `ntk` varchar(255) DEFAULT NULL,
  `status` varchar(25) NOT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doxer_driver`
--

INSERT INTO `doxer_driver` (`id`, `name`, `DeviceId`, `pro_image`, `image1`, `image2`, `img_status`, `active_ac_with_otp`, `email_or_num`, `email`, `contact_no`, `gender`, `fare_per_km`, `dob`, `city`, `bio`, `otp`, `password`, `cpassword`, `ntk`, `status`, `create_at`, `update_at`) VALUES
(4, 'Driverd', '1ff62917d0b86e96', 'Drivers/Image.jpg', 'Drivers_documents/idproof.png', 'Drivers_documents/idproof.png', '0', '1', '4456765678', 'yfy@gxg.com', '4456765678', 'male', 50, NULL, 'Ahmedabad', '', '0488', 'pbkdf2_sha256$260000$9wKGnu925um9YIhx0dOhTY$YdbNPEzOz7K/ojNz5xOE3RYYzzpvkiI921dfUzuu4TQ=', '123456', 'cdaoNsRVTPetC_4H-CaOOZ:APA91bHA37r7Juhohdeti8_OW5Kj98Y9oa8iTzK5ltfCIjHLtuYeKXTFJDlzUIu3IUZNWmORklO4B69FtciuQME3qQTvG3PHsSv1z3ZuUawcnlwkPO9-Mzy9ACvC7R5V18bJ1SGT6tot', 'Active', '2022-04-14 11:00:20.000000', '2022-04-14 11:00:20.000000'),
(5, 'hardik', '549a196ad8a691c7', 'Drivers/Image.jpg', 'Drivers_documents/idproof.png', 'Drivers_documents/idproof.png', '0', '1', 'hardiksapariya15@gmail.com', 'hardiksapariya15@gmail.com', '', '', 2, NULL, '', '', '8683', 'pbkdf2_sha256$260000$dTAXIwdpKxcaZ7XrfqCwUP$C7++nSh0ocsoq+bnDQrp1tBgfwp/q/ZaBUSga9pSUrg=', '12345678', 'fl0IOhFGTx-y7y_lJNG4kJ:APA91bGpzWWW1qOikR4HvtuPv9fkACEXXPBqFSi2hJB_YtGWDHvavxoQzWc-Jr3gIEkQr8KfHlRL8cBB_AWMs8Q8j7WDq2ggIe_6taXRxH3-Sz68zdEooz8oZJmtu8nvsql8yZ2ASi9V', 'Active', '2022-04-14 15:47:21.000000', '2022-04-14 15:47:21.000000'),
(6, 'hiii', '7d6007e5ccd855b6', 'Drivers/Image.jpg', 'Drivers_documents/idproof.png', 'Drivers_documents/idproof.png', '0', '1', '3693693693', '', '3693693693', '', 4, NULL, '', '', '6463', 'pbkdf2_sha256$260000$V2SDaYjUQCCrVWVrTLluUF$Es/mOAEi1gS2OcxLnEJzXPVy55A2T4EXrctIJKQwCEg=', '123456', 'fl0IOhFGTx-y7y_lJNG4kJ:APA91bGpzWWW1qOikR4HvtuPv9fkACEXXPBqFSi2hJB_YtGWDHvavxoQzWc-Jr3gIEkQr8KfHlRL8cBB_AWMs8Q8j7WDq2ggIe_6taXRxH3-Sz68zdEooz8oZJmtu8nvsql8yZ2ASi9V', 'Active', '2022-04-14 16:05:53.000000', '2022-04-14 16:05:53.000000'),
(7, 'hiii', '549a196ad8a691c7', 'Drivers/Image.jpg', 'Drivers_documents/idproof.png', 'Drivers_documents/idproof.png', '0', '1', '1717171717', '', '1717171717', '', 2, NULL, '', '', '3548', 'pbkdf2_sha256$260000$VUH2ZBFQ8t0fAzbzZdJMIZ$UyNdoOuJpKd4QS0/QOOHuPhjI8o2V4ns4xJ3n5sqXaM=', '890890', 'cdaoNsRVTPetC_4H-CaOOZ:APA91bHA37r7Juhohdeti8_OW5Kj98Y9oa8iTzK5ltfCIjHLtuYeKXTFJDlzUIu3IUZNWmORklO4B69FtciuQME3qQTvG3PHsSv1z3ZuUawcnlwkPO9-Mzy9ACvC7R5V18bJ1SGT6tot', 'Active', '2022-04-14 16:14:36.000000', '2022-04-14 16:14:36.000000');

-- --------------------------------------------------------

--
-- Table structure for table `doxer_drivers_rating`
--

CREATE TABLE `doxer_drivers_rating` (
  `id` bigint(20) NOT NULL,
  `rates` varchar(5) DEFAULT NULL,
  `review` longtext NOT NULL,
  `create` date DEFAULT NULL,
  `mine_id` bigint(20) NOT NULL,
  `passengerid_id` bigint(20) DEFAULT NULL,
  `tri_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doxer_drivers_rating`
--

INSERT INTO `doxer_drivers_rating` (`id`, `rates`, `review`, `create`, `mine_id`, `passengerid_id`, `tri_id`) VALUES
(2, '4', 'kbxfxjfx', '2022-04-14', 4, 3, 7),
(3, '4', 'uvxfxuxufcugc\n', '2022-04-14', 4, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `doxer_driver_report`
--

CREATE TABLE `doxer_driver_report` (
  `id` bigint(20) NOT NULL,
  `report_text` longtext NOT NULL,
  `create` date DEFAULT NULL,
  `mine_id` bigint(20) NOT NULL,
  `passengerid_id` bigint(20) DEFAULT NULL,
  `tri_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doxer_passanger`
--

CREATE TABLE `doxer_passanger` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `DeviceId` varchar(255) DEFAULT NULL,
  `pro_image` varchar(255) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `img_status` varchar(255) NOT NULL,
  `active_ac_with_otp` varchar(10) NOT NULL,
  `email_or_num` varchar(60) NOT NULL,
  `email` varchar(40) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `bio` varchar(255) NOT NULL,
  `otp` varchar(4) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cpassword` varchar(255) NOT NULL,
  `ntk` varchar(255) DEFAULT NULL,
  `status` varchar(25) NOT NULL,
  `create` datetime(6) NOT NULL,
  `update` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doxer_passanger`
--

INSERT INTO `doxer_passanger` (`id`, `name`, `DeviceId`, `pro_image`, `image1`, `image2`, `img_status`, `active_ac_with_otp`, `email_or_num`, `email`, `contact_no`, `gender`, `dob`, `city`, `bio`, `otp`, `password`, `cpassword`, `ntk`, `status`, `create`, `update`) VALUES
(3, 'first passenger', '549a196ad8a691c7', 'Passenger/Image_YFTrViJ.png', 'Passengers_documents/idproof.png', 'Passengers_documents/idproof.png', '0', '1', '5678897890', '', '5678897890', 'M', NULL, '', '', '1149', 'pbkdf2_sha256$260000$xIFy5ARbzakihNvK0XMTyr$Ek2fZzW4uqgO3wfXIgb3NvNPqRu/kawMjV/AglCa3/o=', '123456', 'fl0IOhFGTx-y7y_lJNG4kJ:APA91bEv0yjHvlo4rlY47yF7NwhQ65nTPYQLNQiVkNXwTtAy88cXAMbufQ-pPH7RHmm_U4t9GGL0RJ53DbgjXF5Da18kPVuQy4BWBipHujFVn6DAttoUnr1bj_yRrOirx1jtHs8ikdb8', 'Active', '2022-04-14 10:59:03.000000', '2022-04-14 10:59:03.000000'),
(4, 'hardikkk', '549a196ad8a691c7', 'Passenger/Image.png', 'Passengers_documents/idproof.png', 'Passengers_documents/idproof.png', '0', '1', '8080808090', '', '8080808090', '', NULL, '', '', '1669', 'pbkdf2_sha256$260000$13PzjKArbY7ztRrnA47uhS$6yAL9uVGq0VdzCmSdI714hqGl6KClbZ0Cu5MA+Mrf2k=', '80808080', 'cdaoNsRVTPetC_4H-CaOOZ:APA91bHA37r7Juhohdeti8_OW5Kj98Y9oa8iTzK5ltfCIjHLtuYeKXTFJDlzUIu3IUZNWmORklO4B69FtciuQME3qQTvG3PHsSv1z3ZuUawcnlwkPO9-Mzy9ACvC7R5V18bJ1SGT6tot', 'Active', '2022-04-14 12:54:24.000000', '2022-04-14 12:54:24.000000'),
(5, 'nikhil', '549a196ad8a691c7', 'Passenger/Image.png', 'Passengers_documents/idproof.png', 'Passengers_documents/idproof.png', '0', '1', 'hardiksapariya15@gmail.com', 'hardiksapariya15@gmail.com', '', '', NULL, '', '', '4023', 'pbkdf2_sha256$260000$EY65kdGb9u9AC6aBFcqFjh$yjnPem6/vt2QuswqfZnd4RHI/YUx87zLHh5R2T9U+qg=', '12345678', 'fl0IOhFGTx-y7y_lJNG4kJ:APA91bGpzWWW1qOikR4HvtuPv9fkACEXXPBqFSi2hJB_YtGWDHvavxoQzWc-Jr3gIEkQr8KfHlRL8cBB_AWMs8Q8j7WDq2ggIe_6taXRxH3-Sz68zdEooz8oZJmtu8nvsql8yZ2ASi9V', 'Active', '2022-04-14 15:54:06.000000', '2022-04-14 15:54:06.000000'),
(6, 'hii', '7d6007e5ccd855b6', 'Passenger/Image.png', 'Passengers_documents/idproof.png', 'Passengers_documents/idproof.png', '0', '1', '9090909090', '', '9090909090', '', NULL, '', '', '9315', 'pbkdf2_sha256$260000$PkfMPywsprOYGswfrI4pJl$QAPuUv2EpGT9vf4Q2UXh1Ywsf+TBHhjM+CmG5NeiaeM=', '9090909090', 'fl0IOhFGTx-y7y_lJNG4kJ:APA91bGpzWWW1qOikR4HvtuPv9fkACEXXPBqFSi2hJB_YtGWDHvavxoQzWc-Jr3gIEkQr8KfHlRL8cBB_AWMs8Q8j7WDq2ggIe_6taXRxH3-Sz68zdEooz8oZJmtu8nvsql8yZ2ASi9V', 'Active', '2022-04-14 16:23:39.000000', '2022-04-14 16:23:39.000000');

-- --------------------------------------------------------

--
-- Table structure for table `doxer_passenger_rating`
--

CREATE TABLE `doxer_passenger_rating` (
  `id` bigint(20) NOT NULL,
  `rates` varchar(2) NOT NULL,
  `review` longtext NOT NULL,
  `create` date DEFAULT NULL,
  `driverid_id` bigint(20) DEFAULT NULL,
  `mine_id` bigint(20) NOT NULL,
  `tri_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doxer_passenger_rating`
--

INSERT INTO `doxer_passenger_rating` (`id`, `rates`, `review`, `create`, `driverid_id`, `mine_id`, `tri_id`) VALUES
(2, '4', 'jvhuv', '2022-04-14', 4, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `doxer_passenger_report`
--

CREATE TABLE `doxer_passenger_report` (
  `id` bigint(20) NOT NULL,
  `report_text` longtext NOT NULL,
  `create` date DEFAULT NULL,
  `driverid_id` bigint(20) DEFAULT NULL,
  `mine_id` bigint(20) NOT NULL,
  `tri_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doxer_passenger_report`
--

INSERT INTO `doxer_passenger_report` (`id`, `report_text`, `create`, `driverid_id`, `mine_id`, `tri_id`) VALUES
(1, 'test', '2022-04-14', 4, 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `doxer_ride`
--

CREATE TABLE `doxer_ride` (
  `id` bigint(20) NOT NULL,
  `as_user` varchar(255) DEFAULT NULL,
  `ride_type` varchar(20) NOT NULL,
  `route` longtext DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  `pickUp` varchar(255) DEFAULT NULL,
  `pickUp_latitude` varchar(255) NOT NULL,
  `pickUp_longitude` varchar(255) NOT NULL,
  `dropout` varchar(255) DEFAULT NULL,
  `dropout_latitude` varchar(255) NOT NULL,
  `dropout_longitude` varchar(255) NOT NULL,
  `pickup_address1` varchar(255) NOT NULL,
  `pickup_address2` varchar(255) NOT NULL,
  `dropout_address1` varchar(255) NOT NULL,
  `dropout_address2` varchar(255) NOT NULL,
  `car_latitude` varchar(255) NOT NULL,
  `car_longitude` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `dtime` varchar(255) DEFAULT NULL,
  `seats` varchar(25) NOT NULL,
  `fees` double DEFAULT NULL,
  `Max_seats` bigint(20) NOT NULL,
  `Max_parcel` bigint(20) NOT NULL,
  `add_information` longtext NOT NULL,
  `map_date` varchar(255) DEFAULT NULL,
  `publish` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `trip_status` varchar(20) NOT NULL,
  `ride_time` datetime(6) DEFAULT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `car_id` bigint(20) DEFAULT NULL,
  `getdriver_id` bigint(20) DEFAULT NULL,
  `getpassenger_id` bigint(20) DEFAULT NULL,
  `per_km` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doxer_ride`
--

INSERT INTO `doxer_ride` (`id`, `as_user`, `ride_type`, `route`, `capacity`, `pickUp`, `pickUp_latitude`, `pickUp_longitude`, `dropout`, `dropout_latitude`, `dropout_longitude`, `pickup_address1`, `pickup_address2`, `dropout_address1`, `dropout_address2`, `car_latitude`, `car_longitude`, `date`, `time`, `dtime`, `seats`, `fees`, `Max_seats`, `Max_parcel`, `add_information`, `map_date`, `publish`, `status`, `trip_status`, `ride_time`, `create_at`, `update_at`, `car_id`, `getdriver_id`, `getpassenger_id`, `per_km`) VALUES
(2, 'Driver', 'C', '[\'ahmedabad\', \'ankleshwar\', \' bharuch\', \' karjan\', \'surat\']', '50', 'ahmedabad', '23.022505', '72.5713621', 'surat', '21.170240099999997', '72.83106070000001', 'Ahmedabad, Gujarat, India', '', 'Surat, Gujarat, India', '', '23.11379759106785', '72.54106096923351', '2022-04-14', '11:30 AM', '01:30 AM', '2', 2630, 2, 0, 'hfxzjfdjfdjtditdjgdig', '4 hours 46 mins', '1', '0', 'O', '2022-04-14 11:30:00.000000', '2022-04-14 11:06:23.000000', '2022-04-14 11:06:23.000000', 3, 4, NULL, ''),
(3, 'Driver', 'C', '[\'ahmedabad\', \'maninagar\', \' barejadi\', \' kaniz\', \'vadodara\']', '0', 'ahmedabad', '23.022505', '72.5713621', 'vadodara', '22.3071588', '73.1812187', 'Ahmedabad, Gujarat, India', '', 'Vadodara, Gujarat, India', '', '23.022505', '72.5713621', '2022-04-14', '12:59 AM', '05:30 AM', '2', 2220, 1, 0, 'udhejsussshsududududjd', '2 hours 2 mins', '1', '0', 'P', '2022-04-14 00:59:00.000000', '2022-04-14 11:16:58.000000', '2022-04-14 11:16:58.000000', 3, 4, NULL, ''),
(4, 'Passenger', 'C', NULL, '0', 'ahmedabad', '23.022505', '72.5713621', 'visnagar', '23.702377499999997', '72.5425606', '', '', '', '', '23.022505', '72.5713621', '2022-04-14', NULL, '1 hour 59 mins', '1', NULL, 0, 0, '', NULL, '1', '1', 'P', NULL, '2022-04-14 12:05:39.000000', '2022-04-14 12:05:39.000000', NULL, NULL, 3, ''),
(5, 'Passenger', 'C', NULL, '0', 'ahmedabad', '23.0523843', '72.5337182', 'visnagar', '23.702377499999997', '72.5425606', '', '', '', '', '23.0523843', '72.5337182', '2022-04-15', NULL, '1 hour 53 mins', '1', NULL, 0, 0, '', NULL, '1', '0', 'P', NULL, '2022-04-14 12:18:05.000000', '2022-04-14 12:18:05.000000', NULL, NULL, 3, ''),
(6, 'Driver', 'C', '[\'ahmedabad\', \'ahmedabad\', \'vadodara\']', '5', 'ahmedabad', '23.022505', '72.5713621', 'vadodara', '22.3071588', '73.1812187', 'Ahmedabad, Gujarat, India', '', 'Vadodara, Gujarat, India', '', '23.022505', '72.5713621', '2022-04-14', '02:36 PM', '05:36 PM', '4', 5050, 4, 0, 'jgcgxig', NULL, '1', '0', 'P', '2022-04-14 12:40:00.000000', '2022-04-14 12:41:22.000000', '2022-04-14 12:41:22.000000', 3, 4, NULL, ''),
(7, 'Driver', 'C', '[\'mehsana\', \'ahmedabad\', \'ahmedabad\']', '5', 'mehsana', '23.5879607', '72.36932519999999', 'ahmedabad', '23.022505', '72.5713621', 'Mehsana, Gujarat, India', '', 'Ahmedabad, Gujarat, India', '', '23.5879607', '72.36932519999999', '2022-04-14', '12:46 PM', '07:46 PM', '4', 466.875, 2, 0, 'fhiyfxyfxf', '1 hour 37 mins', '1', '0', 'E', '2022-04-14 12:45:00.000000', '2022-04-14 12:46:28.000000', '2022-04-14 12:46:28.000000', 3, 4, NULL, ''),
(8, 'Driver', 'T', '[\'visnagar\', \'Ahmedabad\', \'mehsana\']', '50', 'visnagar', '23.702377499999997', '72.5425606', 'mehsana', '23.5879607', '72.36932519999999', 'Visnagar, Gujarat 384315, India', '', 'Mehsana, Gujarat, India', '', '23.702377499999997', '72.5425606', '2022-04-14', '02:30 PM', '04:32 PM', '0', 50, 0, 0, 'ghgohfohcohoghvo', NULL, '1', '0', 'E', '2022-04-14 14:30:00.000000', '2022-04-14 13:32:53.000000', '2022-04-14 13:32:53.000000', NULL, 4, NULL, ''),
(9, 'Driver', 'C', '[\'gandhinagar\', \'tarapur\', \'adalaj\']', '2', 'gandhinagar', '23.2156354', '72.63694149999999', 'adalaj', '23.1667043', '72.58095', 'Gandhinagar, Gujarat, India', '', 'Adalaj, Gujarat 382421, India', '', '23.2156354', '72.63694149999999', '2022-04-14', '03:34 PM', '06:34 PM', '2', 16, 2, 0, 'jgxxigxigxigic', NULL, '0', '0', 'P', '2022-04-14 15:34:00.000000', '2022-04-14 13:35:20.000000', '2022-04-14 13:35:20.000000', 3, 4, NULL, ''),
(10, 'Driver', 'C', '[\'gandhinagar\', \'adalaj\', \'ahmedabad\']', '50', 'gandhinagar', '23.2156354', '72.63694149999999', 'ahmedabad', '23.022505', '72.5713621', 'Gandhinagar, Gujarat, India', '', 'Ahmedabad, Gujarat, India', '', '23.2156354', '72.63694149999999', '2022-04-14', '03:36 PM', '08:37 PM', '2', 685, 2, 0, 'hcxhfzfz', '42 mins', '1', '0', 'P', '2022-04-14 15:36:00.000000', '2022-04-14 13:37:33.000000', '2022-04-14 13:37:33.000000', 3, 4, NULL, ''),
(12, 'Passenger', 'C', NULL, '0', 'visnagar', '23.702377499999997', '72.5425606', 'mehsana', '23.5879607', '72.36932519999999', '', '', '', '', '23.702377499999997', '72.5425606', '2022-04-14', NULL, '43 mins', '1', NULL, 0, 0, '', NULL, '1', '0', 'P', NULL, '2022-04-14 14:42:42.000000', '2022-04-14 14:42:42.000000', NULL, NULL, 3, ''),
(13, 'Driver', 'C', '[\'surat\', \'ahmedabad\', \'rajkot\']', '2', 'surat', '21.170240099999997', '72.83106070000001', 'rajkot', '22.3038945', '70.80215989999999', 'Surat, Gujarat, India', '', 'Rajkot, Gujarat, India', '', '23.114070924930274', '72.54171123728156', '2022-04-14', '03:52 PM', '03:53 PM', '2', 442, 1, 0, 'hii', '8 hours 1 min', '1', '0', 'O', '2022-04-14 15:52:00.000000', '2022-04-14 15:53:38.000000', '2022-04-14 15:53:38.000000', 4, 5, NULL, ''),
(14, 'Driver', 'C', '[\'mumbai\', \'ahmedabad\', \'rajkot\']', '0', 'mumbai', '19.0759837', '72.8776559', 'rajkot', '22.3038945', '70.80215989999999', 'Mumbai, Maharashtra, India', '', 'Rajkot, Gujarat, India', '', '23.114070924930274', '72.54171123728156', '2022-04-14', '04:06 PM', '04:06 PM', '4', 699, 2, 0, 'vhdjd', '12 hours 31 mins', '1', '0', 'O', '2022-04-14 15:55:00.000000', '2022-04-14 16:10:10.000000', '2022-04-14 16:10:10.000000', 5, 6, NULL, '4'),
(15, 'Driver', 'C', '[\'rajkot\', \'ahmedabad\', \'surat\']', '2', 'rajkot', '22.3038945', '70.80215989999999', 'surat', '21.170240099999997', '72.83106070000001', 'Rajkot, Gujarat, India', '', 'Surat, Gujarat, India', '', '23.11391749419272', '72.54164317622781', '2022-04-14', '04:16 PM', '10:16 PM', '2', 438, 0, 0, 'hi', '8 hours 8 mins', '1', '1', 'O', '2022-04-14 16:16:00.000000', '2022-04-14 16:17:05.000000', '2022-04-14 16:17:05.000000', 6, 7, NULL, '2');

-- --------------------------------------------------------

--
-- Table structure for table `doxer_ride_pin`
--

CREATE TABLE `doxer_ride_pin` (
  `id` bigint(20) NOT NULL,
  `as_user` varchar(255) DEFAULT NULL,
  `ride_type` varchar(25) DEFAULT NULL,
  `ride_date` date DEFAULT NULL,
  `ride_time` varchar(255) NOT NULL,
  `offer_price` varchar(255) DEFAULT NULL,
  `pickup_address1` varchar(255) NOT NULL,
  `pickup_address2` varchar(255) NOT NULL,
  `dropout_address1` varchar(255) NOT NULL,
  `dropout_address2` varchar(255) NOT NULL,
  `for_passenger` bigint(20) NOT NULL,
  `for_parcel` bigint(20) NOT NULL,
  `pickUp` varchar(255) DEFAULT NULL,
  `pickUp_latitude` varchar(255) NOT NULL,
  `pickUp_longitude` varchar(255) NOT NULL,
  `dropout` varchar(255) DEFAULT NULL,
  `dropout_latitude` varchar(255) NOT NULL,
  `dropout_longitude` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `pas_status` varchar(20) NOT NULL,
  `fees` double DEFAULT NULL,
  `today` date DEFAULT NULL,
  `request_date` datetime(6) NOT NULL,
  `car_id` bigint(20) DEFAULT NULL,
  `getdriver_id` bigint(20) DEFAULT NULL,
  `getride_id` bigint(20) DEFAULT NULL,
  `getride1_id` bigint(20) DEFAULT NULL,
  `passengerid_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doxer_ride_pin`
--

INSERT INTO `doxer_ride_pin` (`id`, `as_user`, `ride_type`, `ride_date`, `ride_time`, `offer_price`, `pickup_address1`, `pickup_address2`, `dropout_address1`, `dropout_address2`, `for_passenger`, `for_parcel`, `pickUp`, `pickUp_latitude`, `pickUp_longitude`, `dropout`, `dropout_latitude`, `dropout_longitude`, `status`, `pas_status`, `fees`, `today`, `request_date`, `car_id`, `getdriver_id`, `getride_id`, `getride1_id`, `passengerid_id`) VALUES
(4, 'Passenger_bid', 'C', '2022-04-14', '11:30 AM', NULL, '', '', '', '', 1, 0, 'Ahmedabad', '23.022505', '72.5713621', 'Surat', '21.170240099999997', '72.83106070000001', '0', 'W', 2630, NULL, '2022-04-14 11:11:25.000000', 3, 4, 2, NULL, 3),
(5, 'Passenger_bid', 'C', '2022-04-14', '12:59 AM', NULL, '', '', '', '', 1, 0, 'Ahmedabad', '23.022505', '72.5713621', 'Vadodara', '22.3071588', '73.1812187', '1', 'W', 2220, NULL, '2022-04-14 11:34:01.000000', 3, 4, 3, NULL, 3),
(6, 'Driver_bid', 'C', '2022-04-14', '1 hour 59 mins', '160', '', '', '', '', 0, 0, 'ahmedabad', '', '', 'visnagar', '', '', '1', 'W', 160, NULL, '2022-04-14 12:10:12.000000', 3, 4, 4, 4, 3),
(7, 'Passenger_bid', 'C', '2022-04-14', '12:46 PM', NULL, '', '', '', '', 1, 0, 'Mehsana', '23.5879607', '72.36932519999999', 'Ahmedabad', '23.022505', '72.5713621', '1', 'E', 466.875, '2022-04-14', '2022-04-14 12:49:02.000000', 3, 4, 7, NULL, 3),
(8, 'Passenger_bid', 'C', '2022-04-14', '12:46 PM', NULL, '', '', '', '', 1, 0, 'Mehsana', '23.5879607', '72.36932519999999', 'Ahmedabad', '23.022505', '72.5713621', '1', 'E', 466.875, '2022-04-14', '2022-04-14 12:55:19.000000', 3, 4, 7, NULL, 4),
(9, 'Passenger_bid', 'T', '2022-04-14', '02:30 PM', NULL, '', '', '', '', 0, 1, 'Visnagar', '23.702377499999997', '72.5425606', 'Mehsana', '23.5879607', '72.36932519999999', '1', 'E', 50, '2022-04-14', '2022-04-14 15:02:58.000000', NULL, 4, 8, NULL, 3),
(10, 'Passenger_bid', 'C', '2022-04-14', '03:52 PM', NULL, '', '', '', '', 1, 0, 'Surat', '21.170240099999997', '72.83106070000001', 'Rajkot', '22.3038945', '70.80215989999999', '1', 'O', 442, NULL, '2022-04-14 15:54:45.000000', 4, 5, 13, NULL, 5),
(11, 'Passenger_bid', 'C', '2022-04-14', '04:06 PM', NULL, '', '', '', '', 2, 0, 'Mumbai', '19.0759837', '72.8776559', 'Rajkot', '22.3038945', '70.80215989999999', '1', 'O', 208.83809375, NULL, '2022-04-14 16:10:37.000000', 5, 6, 14, NULL, 5),
(12, 'Passenger_bid', 'C', '2022-04-14', '04:16 PM', NULL, '', '', '', '', 1, 0, 'Rajkot', '22.3038945', '70.80215989999999', 'Surat', '21.170240099999997', '72.83106070000001', '1', 'O', 122.2793203125, NULL, '2022-04-14 16:18:22.000000', 6, 7, 15, NULL, 5),
(13, 'Passenger_bid', 'C', '2022-04-14', '04:16 PM', NULL, '', '', '', '', 1, 0, 'Rajkot', '22.3038945', '70.80215989999999', 'Surat', '21.170240099999997', '72.83106070000001', '1', 'O', 122.2793203125, NULL, '2022-04-14 16:24:06.000000', 6, 7, 15, NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `doxer_search_history`
--

CREATE TABLE `doxer_search_history` (
  `id` bigint(20) NOT NULL,
  `pick` varchar(255) NOT NULL,
  `drop` varchar(255) NOT NULL,
  `pick_lat` varchar(255) NOT NULL,
  `pick_lng` varchar(255) NOT NULL,
  `drop_lat` varchar(255) NOT NULL,
  `drop_lng` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `create` date DEFAULT NULL,
  `driverid_id` bigint(20) DEFAULT NULL,
  `passengerid_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doxer_vehical_brand`
--

CREATE TABLE `doxer_vehical_brand` (
  `id` bigint(20) NOT NULL,
  `brand` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doxer_vehical_brand`
--

INSERT INTO `doxer_vehical_brand` (`id`, `brand`) VALUES
(1, 'Mahendra'),
(2, 'TATA'),
(3, 'BMW'),
(4, 'SUZUKI');

-- --------------------------------------------------------

--
-- Table structure for table `doxer_vehicle`
--

CREATE TABLE `doxer_vehicle` (
  `id` bigint(20) NOT NULL,
  `reg_num` varchar(12) NOT NULL,
  `vehicle_color` varchar(255) NOT NULL,
  `status` varchar(25) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `driverid_id` bigint(20) DEFAULT NULL,
  `vehical_variant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doxer_vehicle`
--

INSERT INTO `doxer_vehicle` (`id`, `reg_num`, `vehicle_color`, `status`, `created`, `updated`, `driverid_id`, `vehical_variant_id`) VALUES
(3, '6768', 'black ', '1', '2022-04-14 11:01:08.000000', '2022-04-14 11:01:26.000000', 4, 1),
(4, 'GJ-18-Z-7500', 'white', '1', '2022-04-14 15:48:02.000000', '2022-04-14 15:52:29.000000', 5, 2),
(5, 'gj08hj8908', 'white', '1', '2022-04-14 16:06:20.000000', '2022-04-14 16:06:25.000000', 6, 2),
(6, 'GJ-18-Z-7509', 'white', '1', '2022-04-14 16:15:02.000000', '2022-04-14 16:15:05.000000', 7, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `doxer_admin_admin_credentials`
--
ALTER TABLE `doxer_admin_admin_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doxer_car_details`
--
ALTER TABLE `doxer_car_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doxer_car_name`
--
ALTER TABLE `doxer_car_name`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doxer_car_name_brand_id_5a97381e_fk_doxer_vehical_brand_id` (`brand_id`);

--
-- Indexes for table `doxer_cities`
--
ALTER TABLE `doxer_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doxer_driver`
--
ALTER TABLE `doxer_driver`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doxer_drivers_rating`
--
ALTER TABLE `doxer_drivers_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doxer_drivers_rating_mine_id_dc5aa7bd_fk_doxer_driver_id` (`mine_id`),
  ADD KEY `doxer_drivers_rating_passengerid_id_078c408c_fk_doxer_pas` (`passengerid_id`),
  ADD KEY `doxer_drivers_rating_tri_id_6bc11391_fk_doxer_ride_id` (`tri_id`);

--
-- Indexes for table `doxer_driver_report`
--
ALTER TABLE `doxer_driver_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doxer_driver_report_mine_id_1a7a5d7f_fk_doxer_driver_id` (`mine_id`),
  ADD KEY `doxer_driver_report_passengerid_id_802b6adb_fk_doxer_pas` (`passengerid_id`),
  ADD KEY `doxer_driver_report_tri_id_40f3d97f_fk_doxer_ride_id` (`tri_id`);

--
-- Indexes for table `doxer_passanger`
--
ALTER TABLE `doxer_passanger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doxer_passenger_rating`
--
ALTER TABLE `doxer_passenger_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doxer_passenger_rating_driverid_id_03d37816_fk_doxer_driver_id` (`driverid_id`),
  ADD KEY `doxer_passenger_rating_mine_id_facc0bce_fk_doxer_passanger_id` (`mine_id`),
  ADD KEY `doxer_passenger_rating_tri_id_3f1c47d5_fk_doxer_ride_pin_id` (`tri_id`);

--
-- Indexes for table `doxer_passenger_report`
--
ALTER TABLE `doxer_passenger_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doxer_passenger_report_driverid_id_1f876b5f_fk_doxer_driver_id` (`driverid_id`),
  ADD KEY `doxer_passenger_report_mine_id_c16eebdc_fk_doxer_passanger_id` (`mine_id`),
  ADD KEY `doxer_passenger_report_tri_id_b6eae4ac_fk_doxer_ride_pin_id` (`tri_id`);

--
-- Indexes for table `doxer_ride`
--
ALTER TABLE `doxer_ride`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doxer_ride_car_id_a5d1e2ac_fk_doxer_vehicle_id` (`car_id`),
  ADD KEY `doxer_ride_getdriver_id_f8cb4948_fk_doxer_driver_id` (`getdriver_id`),
  ADD KEY `doxer_ride_getpassenger_id_92d1c182_fk_doxer_passanger_id` (`getpassenger_id`);

--
-- Indexes for table `doxer_ride_pin`
--
ALTER TABLE `doxer_ride_pin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doxer_ride_pin_car_id_9eb5fbf9_fk_doxer_vehicle_id` (`car_id`),
  ADD KEY `doxer_ride_pin_getdriver_id_6a07286d_fk_doxer_driver_id` (`getdriver_id`),
  ADD KEY `doxer_ride_pin_getride_id_04641743_fk_doxer_ride_id` (`getride_id`),
  ADD KEY `doxer_ride_pin_getride1_id_332692ac_fk_doxer_ride_id` (`getride1_id`),
  ADD KEY `doxer_ride_pin_passengerid_id_6eb91391_fk_doxer_passanger_id` (`passengerid_id`);

--
-- Indexes for table `doxer_search_history`
--
ALTER TABLE `doxer_search_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doxer_search_history_driverid_id_617c9bed_fk_doxer_driver_id` (`driverid_id`),
  ADD KEY `doxer_search_history_passengerid_id_8f67b14e_fk_doxer_pas` (`passengerid_id`);

--
-- Indexes for table `doxer_vehical_brand`
--
ALTER TABLE `doxer_vehical_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doxer_vehicle`
--
ALTER TABLE `doxer_vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doxer_vehicle_driverid_id_c64d3464_fk_doxer_driver_id` (`driverid_id`),
  ADD KEY `doxer_vehicle_vehical_variant_id_d5f7ccae_fk_doxer_car_name_id` (`vehical_variant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=735;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `doxer_admin_admin_credentials`
--
ALTER TABLE `doxer_admin_admin_credentials`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doxer_car_details`
--
ALTER TABLE `doxer_car_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `doxer_car_name`
--
ALTER TABLE `doxer_car_name`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doxer_cities`
--
ALTER TABLE `doxer_cities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doxer_driver`
--
ALTER TABLE `doxer_driver`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doxer_drivers_rating`
--
ALTER TABLE `doxer_drivers_rating`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doxer_driver_report`
--
ALTER TABLE `doxer_driver_report`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doxer_passanger`
--
ALTER TABLE `doxer_passanger`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doxer_passenger_rating`
--
ALTER TABLE `doxer_passenger_rating`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doxer_passenger_report`
--
ALTER TABLE `doxer_passenger_report`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doxer_ride`
--
ALTER TABLE `doxer_ride`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `doxer_ride_pin`
--
ALTER TABLE `doxer_ride_pin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `doxer_search_history`
--
ALTER TABLE `doxer_search_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doxer_vehical_brand`
--
ALTER TABLE `doxer_vehical_brand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doxer_vehicle`
--
ALTER TABLE `doxer_vehicle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `doxer_car_name`
--
ALTER TABLE `doxer_car_name`
  ADD CONSTRAINT `doxer_car_name_brand_id_5a97381e_fk_doxer_vehical_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `doxer_vehical_brand` (`id`);

--
-- Constraints for table `doxer_drivers_rating`
--
ALTER TABLE `doxer_drivers_rating`
  ADD CONSTRAINT `doxer_drivers_rating_mine_id_dc5aa7bd_fk_doxer_driver_id` FOREIGN KEY (`mine_id`) REFERENCES `doxer_driver` (`id`),
  ADD CONSTRAINT `doxer_drivers_rating_passengerid_id_078c408c_fk_doxer_pas` FOREIGN KEY (`passengerid_id`) REFERENCES `doxer_passanger` (`id`),
  ADD CONSTRAINT `doxer_drivers_rating_tri_id_6bc11391_fk_doxer_ride_id` FOREIGN KEY (`tri_id`) REFERENCES `doxer_ride` (`id`);

--
-- Constraints for table `doxer_driver_report`
--
ALTER TABLE `doxer_driver_report`
  ADD CONSTRAINT `doxer_driver_report_mine_id_1a7a5d7f_fk_doxer_driver_id` FOREIGN KEY (`mine_id`) REFERENCES `doxer_driver` (`id`),
  ADD CONSTRAINT `doxer_driver_report_passengerid_id_802b6adb_fk_doxer_pas` FOREIGN KEY (`passengerid_id`) REFERENCES `doxer_passanger` (`id`),
  ADD CONSTRAINT `doxer_driver_report_tri_id_40f3d97f_fk_doxer_ride_id` FOREIGN KEY (`tri_id`) REFERENCES `doxer_ride` (`id`);

--
-- Constraints for table `doxer_passenger_rating`
--
ALTER TABLE `doxer_passenger_rating`
  ADD CONSTRAINT `doxer_passenger_rating_driverid_id_03d37816_fk_doxer_driver_id` FOREIGN KEY (`driverid_id`) REFERENCES `doxer_driver` (`id`),
  ADD CONSTRAINT `doxer_passenger_rating_mine_id_facc0bce_fk_doxer_passanger_id` FOREIGN KEY (`mine_id`) REFERENCES `doxer_passanger` (`id`),
  ADD CONSTRAINT `doxer_passenger_rating_tri_id_3f1c47d5_fk_doxer_ride_pin_id` FOREIGN KEY (`tri_id`) REFERENCES `doxer_ride_pin` (`id`);

--
-- Constraints for table `doxer_passenger_report`
--
ALTER TABLE `doxer_passenger_report`
  ADD CONSTRAINT `doxer_passenger_report_driverid_id_1f876b5f_fk_doxer_driver_id` FOREIGN KEY (`driverid_id`) REFERENCES `doxer_driver` (`id`),
  ADD CONSTRAINT `doxer_passenger_report_mine_id_c16eebdc_fk_doxer_passanger_id` FOREIGN KEY (`mine_id`) REFERENCES `doxer_passanger` (`id`),
  ADD CONSTRAINT `doxer_passenger_report_tri_id_b6eae4ac_fk_doxer_ride_pin_id` FOREIGN KEY (`tri_id`) REFERENCES `doxer_ride_pin` (`id`);

--
-- Constraints for table `doxer_ride`
--
ALTER TABLE `doxer_ride`
  ADD CONSTRAINT `doxer_ride_car_id_a5d1e2ac_fk_doxer_vehicle_id` FOREIGN KEY (`car_id`) REFERENCES `doxer_vehicle` (`id`),
  ADD CONSTRAINT `doxer_ride_getdriver_id_f8cb4948_fk_doxer_driver_id` FOREIGN KEY (`getdriver_id`) REFERENCES `doxer_driver` (`id`),
  ADD CONSTRAINT `doxer_ride_getpassenger_id_92d1c182_fk_doxer_passanger_id` FOREIGN KEY (`getpassenger_id`) REFERENCES `doxer_passanger` (`id`);

--
-- Constraints for table `doxer_ride_pin`
--
ALTER TABLE `doxer_ride_pin`
  ADD CONSTRAINT `doxer_ride_pin_car_id_9eb5fbf9_fk_doxer_vehicle_id` FOREIGN KEY (`car_id`) REFERENCES `doxer_vehicle` (`id`),
  ADD CONSTRAINT `doxer_ride_pin_getdriver_id_6a07286d_fk_doxer_driver_id` FOREIGN KEY (`getdriver_id`) REFERENCES `doxer_driver` (`id`),
  ADD CONSTRAINT `doxer_ride_pin_getride1_id_332692ac_fk_doxer_ride_id` FOREIGN KEY (`getride1_id`) REFERENCES `doxer_ride` (`id`),
  ADD CONSTRAINT `doxer_ride_pin_getride_id_04641743_fk_doxer_ride_id` FOREIGN KEY (`getride_id`) REFERENCES `doxer_ride` (`id`),
  ADD CONSTRAINT `doxer_ride_pin_passengerid_id_6eb91391_fk_doxer_passanger_id` FOREIGN KEY (`passengerid_id`) REFERENCES `doxer_passanger` (`id`);

--
-- Constraints for table `doxer_search_history`
--
ALTER TABLE `doxer_search_history`
  ADD CONSTRAINT `doxer_search_history_driverid_id_617c9bed_fk_doxer_driver_id` FOREIGN KEY (`driverid_id`) REFERENCES `doxer_driver` (`id`),
  ADD CONSTRAINT `doxer_search_history_passengerid_id_8f67b14e_fk_doxer_pas` FOREIGN KEY (`passengerid_id`) REFERENCES `doxer_passanger` (`id`);

--
-- Constraints for table `doxer_vehicle`
--
ALTER TABLE `doxer_vehicle`
  ADD CONSTRAINT `doxer_vehicle_driverid_id_c64d3464_fk_doxer_driver_id` FOREIGN KEY (`driverid_id`) REFERENCES `doxer_driver` (`id`),
  ADD CONSTRAINT `doxer_vehicle_vehical_variant_id_d5f7ccae_fk_doxer_car_name_id` FOREIGN KEY (`vehical_variant_id`) REFERENCES `doxer_car_name` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
