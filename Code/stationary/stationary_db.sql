-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2024 at 07:20 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `stationary_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=89 ;

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
(25, 'Can add customer_reg', 7, 'add_customer_reg'),
(26, 'Can change customer_reg', 7, 'change_customer_reg'),
(27, 'Can delete customer_reg', 7, 'delete_customer_reg'),
(28, 'Can view customer_reg', 7, 'view_customer_reg'),
(29, 'Can add staff_reg', 8, 'add_staff_reg'),
(30, 'Can change staff_reg', 8, 'change_staff_reg'),
(31, 'Can delete staff_reg', 8, 'delete_staff_reg'),
(32, 'Can view staff_reg', 8, 'view_staff_reg'),
(33, 'Can add category', 9, 'add_category'),
(34, 'Can change category', 9, 'change_category'),
(35, 'Can delete category', 9, 'delete_category'),
(36, 'Can view category', 9, 'view_category'),
(37, 'Can add subcategory', 10, 'add_subcategory'),
(38, 'Can change subcategory', 10, 'change_subcategory'),
(39, 'Can delete subcategory', 10, 'delete_subcategory'),
(40, 'Can view subcategory', 10, 'view_subcategory'),
(41, 'Can add vendor', 11, 'add_vendor'),
(42, 'Can change vendor', 11, 'change_vendor'),
(43, 'Can delete vendor', 11, 'delete_vendor'),
(44, 'Can view vendor', 11, 'view_vendor'),
(45, 'Can add items_tbl', 12, 'add_items_tbl'),
(46, 'Can change items_tbl', 12, 'change_items_tbl'),
(47, 'Can delete items_tbl', 12, 'delete_items_tbl'),
(48, 'Can view items_tbl', 12, 'view_items_tbl'),
(49, 'Can add purchase_master', 13, 'add_purchase_master'),
(50, 'Can change purchase_master', 13, 'change_purchase_master'),
(51, 'Can delete purchase_master', 13, 'delete_purchase_master'),
(52, 'Can view purchase_master', 13, 'view_purchase_master'),
(53, 'Can add purchase_child', 14, 'add_purchase_child'),
(54, 'Can change purchase_child', 14, 'change_purchase_child'),
(55, 'Can delete purchase_child', 14, 'delete_purchase_child'),
(56, 'Can view purchase_child', 14, 'view_purchase_child'),
(57, 'Can add cart_child', 15, 'add_cart_child'),
(58, 'Can change cart_child', 15, 'change_cart_child'),
(59, 'Can delete cart_child', 15, 'delete_cart_child'),
(60, 'Can view cart_child', 15, 'view_cart_child'),
(61, 'Can add cart_master', 16, 'add_cart_master'),
(62, 'Can change cart_master', 16, 'change_cart_master'),
(63, 'Can delete cart_master', 16, 'delete_cart_master'),
(64, 'Can view cart_master', 16, 'view_cart_master'),
(65, 'Can add card', 17, 'add_card'),
(66, 'Can change card', 17, 'change_card'),
(67, 'Can delete card', 17, 'delete_card'),
(68, 'Can view card', 17, 'view_card'),
(69, 'Can add tbl_payment', 18, 'add_tbl_payment'),
(70, 'Can change tbl_payment', 18, 'change_tbl_payment'),
(71, 'Can delete tbl_payment', 18, 'delete_tbl_payment'),
(72, 'Can view tbl_payment', 18, 'view_tbl_payment'),
(73, 'Can add tbl_courier', 19, 'add_tbl_courier'),
(74, 'Can change tbl_courier', 19, 'change_tbl_courier'),
(75, 'Can delete tbl_courier', 19, 'delete_tbl_courier'),
(76, 'Can view tbl_courier', 19, 'view_tbl_courier'),
(77, 'Can add tbl_cassign', 20, 'add_tbl_cassign'),
(78, 'Can change tbl_cassign', 20, 'change_tbl_cassign'),
(79, 'Can delete tbl_cassign', 20, 'delete_tbl_cassign'),
(80, 'Can view tbl_cassign', 20, 'view_tbl_cassign'),
(81, 'Can add tbl_delivery', 21, 'add_tbl_delivery'),
(82, 'Can change tbl_delivery', 21, 'change_tbl_delivery'),
(83, 'Can delete tbl_delivery', 21, 'delete_tbl_delivery'),
(84, 'Can view tbl_delivery', 21, 'view_tbl_delivery'),
(85, 'Can add tbl_login', 22, 'add_tbl_login'),
(86, 'Can change tbl_login', 22, 'change_tbl_login'),
(87, 'Can delete tbl_login', 22, 'delete_tbl_login'),
(88, 'Can view tbl_login', 22, 'view_tbl_login');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(17, 'stationary', 'card'),
(15, 'stationary', 'cart_child'),
(16, 'stationary', 'cart_master'),
(9, 'stationary', 'category'),
(7, 'stationary', 'customer_reg'),
(12, 'stationary', 'items_tbl'),
(14, 'stationary', 'purchase_child'),
(13, 'stationary', 'purchase_master'),
(8, 'stationary', 'staff_reg'),
(10, 'stationary', 'subcategory'),
(20, 'stationary', 'tbl_cassign'),
(19, 'stationary', 'tbl_courier'),
(21, 'stationary', 'tbl_delivery'),
(22, 'stationary', 'tbl_login'),
(18, 'stationary', 'tbl_payment'),
(11, 'stationary', 'vendor');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-01-08 04:37:38.573754'),
(2, 'auth', '0001_initial', '2024-01-08 04:37:39.485051'),
(3, 'admin', '0001_initial', '2024-01-08 04:37:39.669771'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-01-08 04:37:39.685752'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-08 04:37:39.698702'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-01-08 04:37:39.760193'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-01-08 04:37:39.778963'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-01-08 04:37:39.811120'),
(9, 'auth', '0004_alter_user_username_opts', '2024-01-08 04:37:39.825529'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-01-08 04:37:39.843847'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-01-08 04:37:39.858825'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-01-08 04:37:39.863075'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-01-08 04:37:39.878326'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-01-08 04:37:39.911898'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-01-08 04:37:39.946277'),
(16, 'auth', '0011_update_proxy_permissions', '2024-01-08 04:37:39.958013'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-01-08 04:37:39.978144'),
(18, 'sessions', '0001_initial', '2024-01-08 04:37:40.096520'),
(19, 'stationary', '0001_initial', '2024-01-08 04:37:40.189455'),
(20, 'stationary', '0002_staff_reg', '2024-01-08 05:56:23.352476'),
(21, 'stationary', '0003_category', '2024-01-19 09:17:07.523138'),
(22, 'stationary', '0004_subcategory', '2024-01-19 09:33:47.046835'),
(23, 'stationary', '0005_auto_20240119_1609', '2024-01-19 10:39:39.885089'),
(24, 'stationary', '0006_vendor', '2024-01-19 12:02:16.504287'),
(25, 'stationary', '0007_items_tbl', '2024-01-23 05:24:43.345246'),
(26, 'stationary', '0008_purchase_master', '2024-02-01 11:14:49.690686'),
(27, 'stationary', '0009_auto_20240201_2255', '2024-02-01 17:26:03.251810'),
(28, 'stationary', '0010_cart_child_cart_master', '2024-02-02 10:04:53.534347'),
(29, 'stationary', '0011_alter_items_tbl_item_stock', '2024-02-05 08:29:14.979883'),
(30, 'stationary', '0012_auto_20240206_1136', '2024-02-06 06:06:44.551303'),
(31, 'stationary', '0013_alter_cart_child_cart_qty', '2024-02-06 06:13:06.866525'),
(32, 'stationary', '0014_card', '2024-02-07 12:15:02.894150'),
(33, 'stationary', '0015_tbl_payment', '2024-02-07 16:56:06.604828'),
(34, 'stationary', '0016_tbl_courier', '2024-02-08 03:58:15.060815'),
(35, 'stationary', '0017_tbl_cassign', '2024-02-08 12:09:51.301329'),
(36, 'stationary', '0018_tbl_payment_status', '2024-02-09 06:54:52.769154'),
(37, 'stationary', '0019_tbl_cassign_status', '2024-02-09 09:09:21.083423'),
(38, 'stationary', '0020_tbl_delivery', '2024-02-09 11:37:23.699152'),
(39, 'stationary', '0021_tbl_login', '2024-02-20 03:35:23.769782');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2w0oou4z6wyeh9u6sxidv586t9h3ogg5', 'eyJzaWQiOjEsInNuYW1lIjoiRGF2b29kIiwic2VtYWlsIjoiZEBnbWFpbC5jb20ifQ:1rSEdk:jzjGivXAe0G2wuMdAlWh4JaX3tBAWRNX5-a9mHlS0eE', '2024-02-06 11:08:24.258302'),
('3g283zbi7qx40a32dbqlrkwl9mvqzp1q', 'eyJzaWQiOjEsInNuYW1lIjoiRGF2b29kIiwic2VtYWlsIjoiZEBnbWFpbC5jb20ifQ:1rZ9NJ:423M1k-LpHYnZ8K1oQEouUz-a3N9KVoSHi6frocmq40', '2024-02-25 12:56:01.658891'),
('5ntqldjw6cpmx2nbzs6c1oyw3dj799qq', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1rPaNg:EEEVWQh7Ey6p8FG8LzjDyZwHKCKKdP0TZDsg4BkCow4', '2024-01-30 03:44:52.170366'),
('5zdptkyzc35bln4m03x0d0hsqjimbxfv', 'e30:1rMkEv:Yd9h_YkMnEwAK7rav0u4ilWTgyHjpYwFuGGAV8VXnws', '2024-01-22 07:40:05.785642'),
('858syvmcr2ad9b0ldpnzzwtei403f5yw', 'eyJzaWQiOjEsInNuYW1lIjoiRGF2b29kIiwic2VtYWlsIjoiZEBnbWFpbC5jb20ifQ:1rZ2UZ:EzeT9euk-p7Ouwv1kiiuulgKOFya9mZH4dNPFWUyD90', '2024-02-25 05:35:03.265216'),
('8q1kji8bncydj4tuiikug7c4pgqhg8o3', 'eyJzaWQiOjEsInNuYW1lIjoiRGF2b29kIiwic2VtYWlsIjoiZEBnbWFpbC5jb20ifQ:1rN9sp:5Jsnlgiu-dnrSVHeUK0LIHnAL2tRm7ykNifXpid29gA', '2024-01-23 11:02:59.149491'),
('c379g7xsshodpizs352g15cc1a8yxfz4', 'eyJzaWQiOjEsInNuYW1lIjoiRGF2b29kIiwic2VtYWlsIjoiZEBnbWFpbC5jb20ifQ:1rQmzd:nSyJFabZsdc_djRKnYetThAYZdfTVn-xmwncu4XG3bo', '2024-02-02 11:25:01.223500'),
('f1hbq5sgi1qjkbwzq5fl1rx4zurb2uop', 'eyJjdWlkIjozLCJjdW5hbWUiOiJBbm4iLCJjdWVtYWlsIjoiYUBnYW1pbC5jb20iLCJjYXJ0dG90YWxpdGVtIjoyfQ:1rXekv:mAsnlPjkVYVKn3Epz9XImDBHarijaYchyiPcm8LDC-c', '2024-02-21 10:02:13.900318'),
('g3uhp5yc5cv3mnn8305r0zh22xw4a2lt', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1rh4dW:nRTSGNUWYXUahDhrvL4kj9E89uhEedDRN3JszM7uMmI', '2024-03-18 09:29:30.068544'),
('ie16bf16tr6x4iwvqlhvx3jz3om98xpb', 'e30:1rYmNd:VBCfyheOkZ21rrR_IFA9sH71hLDzZzd9awZbeMrMjtI', '2024-02-24 12:22:49.686004'),
('j0j4imh6kgntp7mskfg0x2m0ysgvsc5k', 'e30:1rcguS:taM3e3mOHA4gc_OePd6Xt76Zf1-p9U0VKfXk4iQNzuU', '2024-03-06 07:20:52.287390'),
('kgy5huc1sb2vssvwwokfue1wvsozh18c', 'e30:1rh5Cl:sET8VWuSfdjJ0ijj3Bem9IoPE1Al24PbEwfbSmFUdnQ', '2024-03-18 10:05:55.233849'),
('lhdykoovi8cm745gcmdo34mzvw1i87yu', 'e30:1rjY0c:iRcTsBEixNW4YFDpprR9By7tQXz48ZtaF_DkZGUHKLQ', '2024-03-25 05:15:34.861144'),
('lmjj1xbk7597wcq61i3uwr8d1e4kceb2', 'e30:1rjY7Z:GJDF_FauwqR-VtfkB6iOYcRhbeKMA8woiSgICnF0vWM', '2024-03-25 05:22:45.334531'),
('mtku3bq37h5915zq1g1keotmqsaur62s', 'eyJzaWQiOjEsInNuYW1lIjoiRGF2b29kIiwic2VtYWlsIjoiZEBnbWFpbC5jb20ifQ:1rY1rl:Y2PsBL1NJdYCsgAuJmMBtejc775f96vCyCvrWVsDr-c', '2024-02-22 10:42:49.179629'),
('ng7ooborvf5tugjp1vmdst3g6i0u8dpf', 'eyJzaWQiOjEsInNuYW1lIjoiRGF2b29kIiwic2VtYWlsIjoiZEBnbWFpbC5jb20ifQ:1rZ5Ov:H17v9o-kZ3n5n_lMmPdhKaPeD2V-7KFzGdkvCwjCv8w', '2024-02-25 08:41:25.993409'),
('npzdqxxxsgua27kcxpj4fnpijmn10b32', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1rh6GJ:gARPfDe_aYKCKrGWT1EDKIYKRMsruQPOtds4H7jw8LM', '2024-03-18 11:13:39.675226'),
('o1eqecezl2i9yuunwubnw6aoe0qshv90', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1rV7td:H4c9dU8ZJmTOjaNW1dK0bcabiBRU0SfOTV2cNXg1Zjw', '2024-02-14 10:32:45.018951'),
('q4tvprfdj6xsnxr5ifrh01zn8zz6ar5x', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1rYeQc:-kw9PXPU6C6U2DaoU4PuifuyCsW6ckIbmVqQ4GcKuKI', '2024-02-24 03:53:22.990890'),
('qyo6iqq75j8i2s8fmewh88o5tp5xuawd', 'eyJzaWQiOjEsInNuYW1lIjoiRGF2b29kIiwic2VtYWlsIjoiZEBnbWFpbC5jb20ifQ:1rUL8K:cCcAqLWHYP4kNzb3aZZ3WI-G6o8AWa2HtlTcRx98Rrs', '2024-02-12 06:28:40.132468'),
('rsfwub92hgo1kt816bf4r4k17kyc06a9', 'e30:1rTa74:uATMgC5lTCJbko9qwgU6Me25UaIJ05duvSDDSmGnBlY', '2024-02-10 04:16:14.880214'),
('rx6edr9ovam4h3xr78v37mr3sqgv0ucq', 'eyJzaWQiOjEsInNuYW1lIjoiRGF2b29kIiwic2VtYWlsIjoiZEBnbWFpbC5jb20ifQ:1rUNhw:5JzFbmRdSz_mDAqLH0wHTZyu2GD5kad9f7WO3W9UOW4', '2024-02-12 09:13:36.455934'),
('thea4wbrkymtd4ywslw7yk3p29ofz14g', '.eJyrVsrJT8_MK0lJLUnMzFGyUkpMyc3Mc0jPBfL0kvNzlXQgIjAZpVoAy3IRew:1rUf0m:ap_TkryxmPSt6SYiUiFlcqfpBFI8mULE13IC2rUDEWg', '2024-02-13 03:42:12.628925');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_card`
--

CREATE TABLE IF NOT EXISTS `stationary_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_holder` varchar(150) NOT NULL,
  `card_no` varchar(150) NOT NULL,
  `exp_date` varchar(150) NOT NULL,
  `cvv` varchar(150) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stationary_card_customer_id_1862693f_fk_stationar` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stationary_card`
--

INSERT INTO `stationary_card` (`id`, `card_holder`, `card_no`, `exp_date`, `cvv`, `customer_id`) VALUES
(1, 'Jerin', '3453453453453555', '2034-05-04', '453', 1),
(2, 'Jerin 1', '2837987982525444', '2043-02-04', '244', 1),
(3, 'sam', '8797867487263487', '2034-03-23', '234', 2),
(4, 'Ann', '7368726385267289', '2044-04-23', '234', 3);

-- --------------------------------------------------------

--
-- Table structure for table `stationary_cart_child`
--

CREATE TABLE IF NOT EXISTS `stationary_cart_child` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cart_master_id` varchar(150) NOT NULL,
  `item_id` varchar(150) NOT NULL,
  `cart_qty` int(10) unsigned NOT NULL,
  `cart_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `stationary_cart_child`
--

INSERT INTO `stationary_cart_child` (`id`, `cart_master_id`, `item_id`, `cart_qty`, `cart_price`) VALUES
(1, '1', '1', 3, '165.00'),
(2, '1', '2', 3, '90.00'),
(3, '1', '6', 4, '80.00'),
(4, '2', '1', 1, '55.00'),
(5, '2', '5', 1, '110.00'),
(6, '3', '2', 1, '30.00'),
(7, '3', '4', 1, '20.00'),
(8, '4', '1', 3, '165.00'),
(9, '4', '3', 2, '70.00'),
(10, '5', '6', 2, '40.00'),
(11, '5', '2', 2, '60.00'),
(13, '6', '2', 3, '90.00');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_cart_master`
--

CREATE TABLE IF NOT EXISTS `stationary_cart_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customert_id` varchar(150) NOT NULL,
  `cart_tot_amt` decimal(10,2) NOT NULL,
  `cart_status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `stationary_cart_master`
--

INSERT INTO `stationary_cart_master` (`id`, `customert_id`, `cart_tot_amt`, `cart_status`) VALUES
(1, '1', '335.00', 'Deactive'),
(2, '3', '165.00', 'Deactive'),
(3, '2', '50.00', 'Deactive'),
(4, '2', '235.00', 'Deactive'),
(5, '1', '100.00', 'Deactive'),
(6, '1', '90.00', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_category`
--

CREATE TABLE IF NOT EXISTS `stationary_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `stationary_category`
--

INSERT INTO `stationary_category` (`id`, `category_name`) VALUES
(4, 'File'),
(5, 'Book'),
(8, 'Pen'),
(9, 'Pappers');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_customer_reg`
--

CREATE TABLE IF NOT EXISTS `stationary_customer_reg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fname` varchar(150) NOT NULL,
  `lname` varchar(150) NOT NULL,
  `district` varchar(150) NOT NULL,
  `street` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `dob` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stationary_customer_reg`
--

INSERT INTO `stationary_customer_reg` (`id`, `fname`, `lname`, `district`, `street`, `phone`, `gender`, `dob`, `email`, `password`) VALUES
(1, 'Jerin', 'J', 'Pathanamthitta', 'Konni', '9654273492', 'male', '1998-03-23', 'j@gmail.com', '123'),
(2, 'sam', 's', 'Pathanamthitta', 'Konni', '9645345637', 'male', '1987-09-08', 's@gmail.com', '123'),
(3, 'Ann', 'K', 'Kollam', 'Kollam', '9645345637', 'female', '1998-12-12', 'a@gamil.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_items_tbl`
--

CREATE TABLE IF NOT EXISTS `stationary_items_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_id` varchar(150) NOT NULL,
  `subcat_id` varchar(150) NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `item_desc` varchar(150) NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `item_status` varchar(150) NOT NULL,
  `item_brand` varchar(150) NOT NULL,
  `item_image` varchar(150) NOT NULL,
  `item_stock` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `stationary_items_tbl`
--

INSERT INTO `stationary_items_tbl` (`id`, `cat_id`, `subcat_id`, `item_name`, `item_desc`, `item_price`, `item_status`, `item_brand`, `item_image`, `item_stock`) VALUES
(1, '4', '5', 'Normal File', 'Normal Papper File', '55.00', 'Available', 'Star', '1.jpg', '14.00'),
(2, '5', '7', 'Plain Book', 'Plain A4 size Book', '30.00', 'Available', 'Classmates', '23.jpg', '26.00'),
(3, '5', '16', 'Ruled Book', 'Ruled Books', '35.00', 'Available', 'Classmates', '23_gdCWdSx.jpg', '34.00'),
(4, '8', '12', 'Black Pen', 'Cello Gripper Black Pen', '20.00', 'Available', 'Cello', '41SEuM4iUPL.jpg', '98.00'),
(5, '9', '14', 'A4 Papper', 'A4 Papper Set', '110.00', 'Available', 'TNLP', 'white-a4-copier-paper-pack-copy-BYA27NF-600.jpg', '0.00'),
(6, '8', '13', 'Blue Pen', 'Cello Gripper Blue Pen', '20.00', 'Available', 'Cello', '41SEuM4iUPL_jxsp2bw.jpg', '93.00');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_purchase_child`
--

CREATE TABLE IF NOT EXISTS `stationary_purchase_child` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pur_master_id` varchar(150) NOT NULL,
  `item_id` varchar(150) NOT NULL,
  `pur_qty` varchar(150) NOT NULL,
  `unit_price` varchar(150) NOT NULL,
  `stock` varchar(150) NOT NULL,
  `sell_price` varchar(150) NOT NULL,
  `tot_price` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `stationary_purchase_child`
--

INSERT INTO `stationary_purchase_child` (`id`, `pur_master_id`, `item_id`, `pur_qty`, `unit_price`, `stock`, `sell_price`, `tot_price`) VALUES
(1, '1', '1', '30.0', '50.0', '30', '55', '1500.0'),
(2, '1', '2', '40.0', '20.0', '40', '30', '800.0'),
(4, '1', '5', '2.0', '100.0', '2', '110', '200.0'),
(5, '2', '3', '40.0', '30.0', '40', '35', '1200.0'),
(6, '2', '4', '100.0', '15.0', '100', '20', '1500.0'),
(7, '2', '6', '100.0', '15.0', '100', '20', '1500.0'),
(8, '2', '5', '2.0', '100.0', '2', '110', '200.0');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_purchase_master`
--

CREATE TABLE IF NOT EXISTS `stationary_purchase_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(150) NOT NULL,
  `vendor_id` varchar(150) NOT NULL,
  `pur_date` varchar(150) NOT NULL,
  `pur_tot_amt` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stationary_purchase_master`
--

INSERT INTO `stationary_purchase_master` (`id`, `staff_id`, `vendor_id`, `pur_date`, `pur_tot_amt`) VALUES
(1, '1', '1', '2024-02-02', '2500.0'),
(2, '1', '4', '2024-02-01', '5000'),
(3, '1', '4', '2024-03-04', '5000');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_staff_reg`
--

CREATE TABLE IF NOT EXISTS `stationary_staff_reg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fname` varchar(150) NOT NULL,
  `lname` varchar(150) NOT NULL,
  `district` varchar(150) NOT NULL,
  `street` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `dob` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stationary_staff_reg`
--

INSERT INTO `stationary_staff_reg` (`id`, `fname`, `lname`, `district`, `street`, `phone`, `gender`, `dob`, `email`, `password`) VALUES
(1, 'Davood', 'd', 'Ernakulam', 'Kochi', '9856746573', 'Male', '1997-02-04', 'd@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_subcategory`
--

CREATE TABLE IF NOT EXISTS `stationary_subcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subcat_name` varchar(150) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stationary_subcatego_category_id_04996462_fk_stationar` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `stationary_subcategory`
--

INSERT INTO `stationary_subcategory` (`id`, `subcat_name`, `category_id`) VALUES
(5, 'Normal', 4),
(7, 'Plain Book', 5),
(12, 'Black', 8),
(13, 'Blue', 8),
(14, 'A4', 9),
(15, 'A3', 9),
(16, 'Ruled', 5);

-- --------------------------------------------------------

--
-- Table structure for table `stationary_tbl_cassign`
--

CREATE TABLE IF NOT EXISTS `stationary_tbl_cassign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `courier_id` varchar(150) NOT NULL,
  `cassign_date` varchar(150) NOT NULL,
  `cart_master_id` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `stationary_tbl_cassign`
--

INSERT INTO `stationary_tbl_cassign` (`id`, `courier_id`, `cassign_date`, `cart_master_id`, `status`) VALUES
(1, '3', '2024-02-09', '1', 'rejected'),
(2, '3', '2024-02-09', '2', 'delivered'),
(3, '2', '2024-02-10', '1', 'delivered'),
(4, '3', '2024-02-09', '4', 'delivered'),
(5, '3', '2024-03-04', '3', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_tbl_courier`
--

CREATE TABLE IF NOT EXISTS `stationary_tbl_courier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(150) NOT NULL,
  `co_name` varchar(150) NOT NULL,
  `co_city` varchar(150) NOT NULL,
  `co_dist` varchar(150) NOT NULL,
  `co_pin` varchar(150) NOT NULL,
  `co_street` varchar(150) NOT NULL,
  `co_phone` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `co_status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stationary_tbl_courier`
--

INSERT INTO `stationary_tbl_courier` (`id`, `staff_id`, `co_name`, `co_city`, `co_dist`, `co_pin`, `co_street`, `co_phone`, `email`, `password`, `co_status`) VALUES
(2, 'admin', 'Speed Courier', 'Konni', 'Pathanamthitta', '689792', 'Konni', '8756774887', 'sc@gmail.com', '123', 'Active'),
(3, 'admin', 'DCLL', 'Kochi', 'Ernakulam', '679878', 'Palarivattom', '8756774887', 'dc@gmail.com', '123', 'Active'),
(4, 'admin', 'Fast Trackz', 'Punalur', 'Kollam', '234234', 'Punalur', '8783767367', 'ft@gmail.com', '123', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_tbl_delivery`
--

CREATE TABLE IF NOT EXISTS `stationary_tbl_delivery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cassign_id` varchar(150) NOT NULL,
  `del_date` varchar(150) NOT NULL,
  `cart_master_id` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stationary_tbl_delivery`
--

INSERT INTO `stationary_tbl_delivery` (`id`, `cassign_id`, `del_date`, `cart_master_id`) VALUES
(1, '2', '2024-02-09', '2'),
(2, '4', '2024-02-11', '4'),
(3, '3', '2024-02-10', '1'),
(4, '3', '2024-02-10', '1');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_tbl_login`
--

CREATE TABLE IF NOT EXISTS `stationary_tbl_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `user_type` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stationary_tbl_login`
--

INSERT INTO `stationary_tbl_login` (`id`, `email`, `password`, `user_type`) VALUES
(1, 'j@gmail.com', '123', 'customer'),
(2, 'd@gmail.com', '123', 'staff'),
(3, 's@gmail.com', '123', 'customer'),
(4, 'a@gmail.com', '123', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_tbl_payment`
--

CREATE TABLE IF NOT EXISTS `stationary_tbl_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cart_master_id` varchar(150) NOT NULL,
  `card_id` varchar(150) NOT NULL,
  `pay_date` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `stationary_tbl_payment`
--

INSERT INTO `stationary_tbl_payment` (`id`, `cart_master_id`, `card_id`, `pay_date`, `status`) VALUES
(1, '1', '2', '2024-02-07', 'Assigned'),
(2, '3', '3', '2024-02-07', 'Assigned'),
(3, '2', '4', '2024-02-07', 'Assigned'),
(4, '4', '3', '2024-02-08', 'Assigned'),
(5, '5', '1', '2024-03-04', 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `stationary_vendor`
--

CREATE TABLE IF NOT EXISTS `stationary_vendor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `district` varchar(150) NOT NULL,
  `street` varchar(150) NOT NULL,
  `phone` varchar(150) NOT NULL,
  `state` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `staff_id` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `stationary_vendor`
--

INSERT INTO `stationary_vendor` (`id`, `name`, `district`, `street`, `phone`, `state`, `email`, `staff_id`) VALUES
(1, 'Star Enterprices', 'Pathanamthitta', 'Konni', '9654273492', 'Kerala', 'sabu@gmail.com', '1'),
(4, 'Bob Mart', 'Kollam', 'Kollam', '9645345637', 'Kerala', 'b@gmail.com', '1'),
(5, 'Sam Stores', 'Kollam', 'Kollam', '9645345637', 'Tamil Nadu', 'bs@gmail.com', 'admin');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

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
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `stationary_card`
--
ALTER TABLE `stationary_card`
  ADD CONSTRAINT `stationary_card_customer_id_1862693f_fk_stationar` FOREIGN KEY (`customer_id`) REFERENCES `stationary_customer_reg` (`id`);

--
-- Constraints for table `stationary_subcategory`
--
ALTER TABLE `stationary_subcategory`
  ADD CONSTRAINT `stationary_subcatego_category_id_04996462_fk_stationar` FOREIGN KEY (`category_id`) REFERENCES `stationary_category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
