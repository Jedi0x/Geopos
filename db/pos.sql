-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 06, 2021 at 05:48 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('1dslfjl48co51iqdpm3s7n2rus8ebcbp', '::1', 1628092496, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632383039323439363b69647c733a323a223135223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31313a2261646d696e40652e636f6d223b735f726f6c657c733a333a22725f35223b6c6f67676564696e7c623a313b),
('0an5qdj6fddkod35c4qtjr4egpbj2fh7', '::1', 1628092797, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632383039323739373b69647c733a323a223135223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31313a2261646d696e40652e636f6d223b735f726f6c657c733a333a22725f35223b6c6f67676564696e7c623a313b),
('ot5hndpk0spv56hgk5oluf3m47m0eku5', '::1', 1628092928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632383039323739373b69647c733a323a223135223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31313a2261646d696e40652e636f6d223b735f726f6c657c733a333a22725f35223b6c6f67676564696e7c623a313b),
('44vs86mn51l9ber7snh2d9tms4f8m27v', '::1', 1628271554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632383237313535343b69647c733a323a223135223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31313a2261646d696e40652e636f6d223b735f726f6c657c733a333a22725f35223b6c6f67676564696e7c623a313b),
('egabbkoq63imh7mj0448t2uuneva24ck', '::1', 1628271979, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632383237313834333b69647c733a323a223135223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31313a2261646d696e40652e636f6d223b735f726f6c657c733a333a22725f35223b6c6f67676564696e7c623a313b);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_accounts`
--

DROP TABLE IF EXISTS `geopos_accounts`;
CREATE TABLE IF NOT EXISTS `geopos_accounts` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `acn` varchar(35) NOT NULL,
  `holder` varchar(100) NOT NULL,
  `adate` datetime NOT NULL,
  `lastbal` decimal(16,2) DEFAULT '0.00',
  `code` varchar(30) DEFAULT NULL,
  `loc` int(4) DEFAULT NULL,
  `account_type` enum('Assets','Expenses','Income','Liabilities','Equity','Basic') NOT NULL DEFAULT 'Basic',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acn` (`acn`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_accounts`
--

INSERT INTO `geopos_accounts` (`id`, `acn`, `holder`, `adate`, `lastbal`, `code`, `loc`, `account_type`) VALUES
(1, '123456', 'Sales Account', '2018-01-01 00:00:00', '256.00', 'Default Sales Account', 0, 'Basic');

-- --------------------------------------------------------

--
-- Table structure for table `geopos_attendance`
--

DROP TABLE IF EXISTS `geopos_attendance`;
CREATE TABLE IF NOT EXISTS `geopos_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adate` date NOT NULL,
  `tfrom` time NOT NULL,
  `tto` time NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `actual_hours` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp` (`emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_bank_ac`
--

DROP TABLE IF EXISTS `geopos_bank_ac`;
CREATE TABLE IF NOT EXISTS `geopos_bank_ac` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `acn` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `enable` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_config`
--

DROP TABLE IF EXISTS `geopos_config`;
CREATE TABLE IF NOT EXISTS `geopos_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(3) NOT NULL,
  `val1` varchar(50) NOT NULL,
  `val2` varchar(200) NOT NULL,
  `val3` varchar(100) NOT NULL,
  `val4` varchar(100) NOT NULL,
  `rid` int(11) NOT NULL,
  `other` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_currencies`
--

DROP TABLE IF EXISTS `geopos_currencies`;
CREATE TABLE IF NOT EXISTS `geopos_currencies` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  `symbol` varchar(3) DEFAULT NULL,
  `rate` decimal(10,5) NOT NULL,
  `thous` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `dpoint` char(1) CHARACTER SET latin1 NOT NULL,
  `decim` int(2) NOT NULL,
  `cpos` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_customers`
--

DROP TABLE IF EXISTS `geopos_customers`;
CREATE TABLE IF NOT EXISTS `geopos_customers` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `region` varchar(30) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `postbox` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `picture` varchar(100) NOT NULL DEFAULT 'example.png',
  `gid` int(5) NOT NULL DEFAULT '1',
  `company` varchar(100) DEFAULT NULL,
  `taxid` varchar(100) DEFAULT NULL,
  `name_s` varchar(100) DEFAULT NULL,
  `phone_s` varchar(100) DEFAULT NULL,
  `email_s` varchar(100) DEFAULT NULL,
  `address_s` varchar(100) DEFAULT NULL,
  `city_s` varchar(100) DEFAULT NULL,
  `region_s` varchar(100) DEFAULT NULL,
  `country_s` varchar(100) DEFAULT NULL,
  `postbox_s` varchar(100) DEFAULT NULL,
  `balance` decimal(16,2) DEFAULT '0.00',
  `loc` int(11) DEFAULT '0',
  `docid` varchar(255) DEFAULT NULL,
  `custom1` varchar(255) DEFAULT NULL,
  `discount_c` decimal(16,2) DEFAULT NULL,
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_customers`
--

INSERT INTO `geopos_customers` (`id`, `name`, `phone`, `address`, `city`, `region`, `country`, `postbox`, `email`, `picture`, `gid`, `company`, `taxid`, `name_s`, `phone_s`, `email_s`, `address_s`, `city_s`, `region_s`, `country_s`, `postbox_s`, `balance`, `loc`, `docid`, `custom1`, `discount_c`, `reg_date`) VALUES
(1, 'Walk-in Client', '0987654321', NULL, NULL, NULL, NULL, NULL, 'example@example.com', 'example.png', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.00', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_custom_data`
--

DROP TABLE IF EXISTS `geopos_custom_data`;
CREATE TABLE IF NOT EXISTS `geopos_custom_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `module` int(3) NOT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fid` (`field_id`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_custom_fields`
--

DROP TABLE IF EXISTS `geopos_custom_fields`;
CREATE TABLE IF NOT EXISTS `geopos_custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_module` int(3) NOT NULL,
  `f_type` varchar(30) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `placeholder` varchar(30) DEFAULT NULL,
  `value_data` text NOT NULL,
  `f_view` int(2) NOT NULL,
  `other` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `f_module` (`f_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_cust_group`
--

DROP TABLE IF EXISTS `geopos_cust_group`;
CREATE TABLE IF NOT EXISTS `geopos_cust_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `summary` varchar(250) DEFAULT NULL,
  `disc_rate` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_cust_group`
--

INSERT INTO `geopos_cust_group` (`id`, `title`, `summary`, `disc_rate`) VALUES
(1, 'Default Group', 'Default Group', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_documents`
--

DROP TABLE IF EXISTS `geopos_documents`;
CREATE TABLE IF NOT EXISTS `geopos_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `cdate` date NOT NULL,
  `permission` int(1) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_draft`
--

DROP TABLE IF EXISTS `geopos_draft`;
CREATE TABLE IF NOT EXISTS `geopos_draft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `invoicedate` date NOT NULL,
  `invoiceduedate` date NOT NULL,
  `subtotal` decimal(16,2) DEFAULT '0.00',
  `shipping` decimal(16,2) DEFAULT '0.00',
  `ship_tax` decimal(16,2) DEFAULT NULL,
  `ship_tax_type` enum('incl','excl','off') DEFAULT 'off',
  `discount` decimal(16,2) DEFAULT '0.00',
  `tax` decimal(16,2) DEFAULT '0.00',
  `total` decimal(16,2) DEFAULT '0.00',
  `pmethod` varchar(14) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `status` enum('paid','due','canceled','partial') NOT NULL DEFAULT 'due',
  `csd` int(5) NOT NULL DEFAULT '0',
  `eid` int(4) NOT NULL,
  `pamnt` decimal(16,2) DEFAULT '0.00',
  `items` decimal(10,2) NOT NULL,
  `taxstatus` enum('yes','no','cgst','igst') NOT NULL DEFAULT 'yes',
  `discstatus` tinyint(1) NOT NULL,
  `format_discount` enum('%','flat','bflat','b_p') NOT NULL DEFAULT '%',
  `refer` varchar(20) DEFAULT NULL,
  `term` int(3) NOT NULL,
  `multi` int(4) DEFAULT NULL,
  `i_class` int(1) NOT NULL DEFAULT '0',
  `loc` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `csd` (`csd`),
  KEY `invoice` (`tid`) USING BTREE,
  KEY `i_class` (`i_class`),
  KEY `loc` (`loc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_draft_items`
--

DROP TABLE IF EXISTS `geopos_draft_items`;
CREATE TABLE IF NOT EXISTS `geopos_draft_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `product` varchar(255) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(16,2) DEFAULT '0.00',
  `discount` decimal(16,2) DEFAULT '0.00',
  `subtotal` decimal(16,2) DEFAULT '0.00',
  `totaltax` decimal(16,2) DEFAULT '0.00',
  `totaldiscount` decimal(16,2) DEFAULT '0.00',
  `product_des` text,
  `i_class` int(1) NOT NULL DEFAULT '0',
  `unit` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice` (`tid`),
  KEY `i_class` (`i_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_employees`
--

DROP TABLE IF EXISTS `geopos_employees`;
CREATE TABLE IF NOT EXISTS `geopos_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `postbox` varchar(20) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `phonealt` varchar(15) DEFAULT NULL,
  `picture` varchar(50) NOT NULL DEFAULT 'example.png',
  `sign` varchar(100) DEFAULT 'sign.png',
  `joindate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dept` int(11) DEFAULT NULL,
  `degis` int(11) DEFAULT NULL,
  `salary` decimal(16,2) DEFAULT '0.00',
  `clock` int(1) DEFAULT NULL,
  `clockin` int(11) DEFAULT NULL,
  `clockout` int(11) DEFAULT NULL,
  `c_rate` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_employees`
--

INSERT INTO `geopos_employees` (`id`, `username`, `name`, `address`, `city`, `region`, `country`, `postbox`, `phone`, `phonealt`, `picture`, `sign`, `joindate`, `dept`, `degis`, `salary`, `clock`, `clockin`, `clockout`, `c_rate`) VALUES
(13, 'admin', 'BusinessOwner', 'Test Street', 'Test City', 'Test Region', 'Test Country', '123456', '12345678', '0', 'example.png', 'sign.png', '2021-08-04 20:44:28', NULL, NULL, '0.00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_events`
--

DROP TABLE IF EXISTS `geopos_events`;
CREATE TABLE IF NOT EXISTS `geopos_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `color` varchar(7) NOT NULL DEFAULT '#3a87ad',
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `allDay` varchar(50) NOT NULL DEFAULT 'true',
  `rel` int(2) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rel` (`rel`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_gateways`
--

DROP TABLE IF EXISTS `geopos_gateways`;
CREATE TABLE IF NOT EXISTS `geopos_gateways` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `enable` enum('Yes','No') NOT NULL,
  `key1` varchar(255) NOT NULL,
  `key2` varchar(255) DEFAULT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `dev_mode` enum('true','false') NOT NULL,
  `ord` int(5) NOT NULL,
  `surcharge` decimal(16,2) NOT NULL,
  `extra` varchar(40) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `geopos_gateways`
--

INSERT INTO `geopos_gateways` (`id`, `name`, `enable`, `key1`, `key2`, `currency`, `dev_mode`, `ord`, `surcharge`, `extra`) VALUES
(1, 'Stripe', 'Yes', 'sk_test_secratekey', 'stripe_public_key', 'USD', 'true', 1, '0.00', 'none'),
(2, 'Authorize.Net', 'Yes', 'TRANSACTIONKEY', 'LOGINID', 'AUD', 'true', 2, '0.00', 'none'),
(3, 'Pin Payments', 'Yes', 'TEST', 'none', 'AUD', 'true', 3, '0.00', 'none'),
(4, 'PayPal', 'Yes', 'MyPayPalClientId', 'MyPayPalSecret', 'USD', 'true', 4, '0.00', 'none'),
(5, 'SecurePay', 'Yes', 'ABC0001', 'abc123', 'AUD', 'true', 5, '0.00', 'none'),
(6, '2Checkout', 'Yes', 'Publishable Key', 'Private Key', 'USD', 'true', 6, '0.00', 'seller_id'),
(7, 'PayU Money', 'Yes', 'MERCHANT_KEY', 'MERCHANT_SALT', 'USD', 'true', 7, '0.00', 'none'),
(8, 'RazorPay', 'Yes', 'Key Id', 'Key Secret', 'INR', 'true', 8, '0.00', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `geopos_goals`
--

DROP TABLE IF EXISTS `geopos_goals`;
CREATE TABLE IF NOT EXISTS `geopos_goals` (
  `id` int(1) NOT NULL,
  `income` bigint(20) NOT NULL,
  `expense` bigint(20) NOT NULL,
  `sales` bigint(20) NOT NULL,
  `netincome` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_goals`
--

INSERT INTO `geopos_goals` (`id`, `income`, `expense`, `sales`, `netincome`) VALUES
(1, 999999, 999999, 999999, 999999);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_hrm`
--

DROP TABLE IF EXISTS `geopos_hrm`;
CREATE TABLE IF NOT EXISTS `geopos_hrm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typ` int(2) NOT NULL,
  `rid` int(11) NOT NULL,
  `val1` varchar(255) DEFAULT NULL,
  `val2` varchar(255) DEFAULT NULL,
  `val3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_invoices`
--

DROP TABLE IF EXISTS `geopos_invoices`;
CREATE TABLE IF NOT EXISTS `geopos_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `invoicedate` date NOT NULL,
  `invoiceduedate` date NOT NULL,
  `subtotal` decimal(16,2) DEFAULT '0.00',
  `shipping` decimal(16,2) DEFAULT '0.00',
  `ship_tax` decimal(16,2) DEFAULT NULL,
  `ship_tax_type` enum('incl','excl','off') DEFAULT 'off',
  `discount` decimal(16,2) DEFAULT '0.00',
  `discount_rate` decimal(10,2) DEFAULT '0.00',
  `tax` decimal(16,2) DEFAULT '0.00',
  `total` decimal(16,2) DEFAULT '0.00',
  `pmethod` varchar(14) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `status` enum('paid','due','canceled','partial') NOT NULL DEFAULT 'due',
  `csd` int(5) NOT NULL DEFAULT '0',
  `eid` int(4) NOT NULL,
  `pamnt` decimal(16,2) DEFAULT '0.00',
  `items` decimal(10,2) NOT NULL,
  `taxstatus` enum('yes','no','incl','cgst','igst') NOT NULL DEFAULT 'yes',
  `discstatus` tinyint(1) NOT NULL,
  `format_discount` enum('%','flat','b_p','bflat') NOT NULL DEFAULT '%',
  `refer` varchar(20) DEFAULT NULL,
  `term` int(3) NOT NULL,
  `multi` int(4) DEFAULT NULL,
  `i_class` int(1) NOT NULL DEFAULT '0',
  `loc` int(4) NOT NULL,
  `r_time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `csd` (`csd`),
  KEY `invoice` (`tid`) USING BTREE,
  KEY `i_class` (`i_class`),
  KEY `loc` (`loc`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_invoices`
--

INSERT INTO `geopos_invoices` (`id`, `tid`, `invoicedate`, `invoiceduedate`, `subtotal`, `shipping`, `ship_tax`, `ship_tax_type`, `discount`, `discount_rate`, `tax`, `total`, `pmethod`, `notes`, `status`, `csd`, `eid`, `pamnt`, `items`, `taxstatus`, `discstatus`, `format_discount`, `refer`, `term`, `multi`, `i_class`, `loc`, `r_time`) VALUES
(1, 1001, '2021-08-04', '2021-08-04', '26.00', '0.00', '0.00', 'incl', '0.00', '0.00', '0.00', '26.00', 'Cash', '', 'paid', 1, 13, '26.00', '2.00', 'yes', 1, '%', '', 1, NULL, 1, 0, NULL),
(2, 1002, '2021-08-04', '2021-08-04', '26.00', '0.00', '0.00', 'incl', '0.00', '0.00', '0.00', '26.00', 'Cash', '', 'paid', 1, 13, '26.00', '2.00', 'yes', 1, '%', '', 1, NULL, 1, 0, NULL),
(3, 1003, '2021-08-06', '2021-08-06', '88.00', '0.00', '0.00', 'incl', '0.00', '0.00', '0.00', '88.00', 'Cash', '', 'partial', 1, 13, '70.00', '7.00', 'yes', 1, '%', '', 1, NULL, 1, 0, NULL),
(4, 1004, '2021-08-06', '2021-08-06', '26.00', '0.00', '0.00', 'incl', '0.00', '0.00', '0.00', '26.00', 'Cash', '', 'paid', 1, 13, '26.00', '2.00', 'yes', 1, '%', '', 1, NULL, 1, 0, NULL),
(6, 1005, '2021-08-06', '2021-08-06', '12.00', '0.00', '0.00', 'incl', '0.00', '0.00', '0.00', '12.00', 'Cash', '', 'paid', 1, 13, '12.00', '1.00', 'yes', 1, '%', '', 1, NULL, 1, 0, NULL),
(7, 1006, '2021-08-06', '2021-08-06', '96.00', '0.00', '0.00', 'incl', '0.00', '0.00', '0.00', '96.00', 'Cash', '', 'paid', 1, 13, '96.00', '8.00', 'yes', 1, '%', '', 1, NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_invoice_items`
--

DROP TABLE IF EXISTS `geopos_invoice_items`;
CREATE TABLE IF NOT EXISTS `geopos_invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `product` varchar(255) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(16,2) DEFAULT '0.00',
  `discount` decimal(16,2) DEFAULT '0.00',
  `subtotal` decimal(16,2) DEFAULT '0.00',
  `totaltax` decimal(16,2) DEFAULT '0.00',
  `totaldiscount` decimal(16,2) DEFAULT '0.00',
  `product_des` text,
  `i_class` int(1) NOT NULL DEFAULT '0',
  `unit` varchar(5) DEFAULT NULL,
  `serial` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice` (`tid`),
  KEY `i_class` (`i_class`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_invoice_items`
--

INSERT INTO `geopos_invoice_items` (`id`, `tid`, `pid`, `product`, `code`, `qty`, `price`, `tax`, `discount`, `subtotal`, `totaltax`, `totaldiscount`, `product_des`, `i_class`, `unit`, `serial`) VALUES
(1, 1, 1, 'product 1-1234444', '1234444', '1.00', '12.00', '0.00', '0.00', '12.00', '0.00', '0.00', NULL, 1, '', ''),
(2, 1, 2, 'Product 2-111111', '111111', '1.00', '14.00', '0.00', '0.00', '14.00', '0.00', '0.00', NULL, 1, '', ''),
(3, 2, 1, 'product 1-1234444', '1234444', '1.00', '12.00', '0.00', '0.00', '12.00', '0.00', '0.00', NULL, 1, '', ''),
(4, 2, 2, 'Product 2-111111', '111111', '1.00', '14.00', '0.00', '0.00', '14.00', '0.00', '0.00', NULL, 1, '', ''),
(5, 3, 1, 'product 1-1234444', '1234444', '2.00', '12.00', '0.00', '0.00', '24.00', '0.00', '0.00', NULL, 1, '', ''),
(6, 3, 2, 'Product 2-111111', '111111', '2.00', '14.00', '0.00', '0.00', '28.00', '0.00', '0.00', NULL, 1, '', ''),
(7, 3, 3, 'Product Onex-134566644', '134566644', '3.00', '12.00', '0.00', '0.00', '36.00', '0.00', '0.00', NULL, 1, '', ''),
(8, 4, 1, 'product 1-1234444', '1234444', '1.00', '12.00', '0.00', '0.00', '12.00', '0.00', '0.00', NULL, 1, '', ''),
(9, 4, 2, 'Product 2-111111', '111111', '1.00', '14.00', '0.00', '0.00', '14.00', '0.00', '0.00', NULL, 1, '', ''),
(10, 6, 1, 'product 1-1234444', '1234444', '1.00', '12.00', '0.00', '0.00', '12.00', '0.00', '0.00', NULL, 1, '', ''),
(11, 7, 3, 'Product Onex-134566644', '134566644', '8.00', '12.00', '0.00', '0.00', '96.00', '0.00', '0.00', NULL, 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `geopos_locations`
--

DROP TABLE IF EXISTS `geopos_locations`;
CREATE TABLE IF NOT EXISTS `geopos_locations` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `region` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `postbox` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `taxid` varchar(40) DEFAULT NULL,
  `logo` varchar(50) DEFAULT 'logo.png',
  `cur` int(4) NOT NULL,
  `ware` int(11) DEFAULT '0',
  `ext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_log`
--

DROP TABLE IF EXISTS `geopos_log`;
CREATE TABLE IF NOT EXISTS `geopos_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` mediumtext NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_log`
--

INSERT INTO `geopos_log` (`id`, `note`, `created`, `user`) VALUES
(1, '[Logged In] admin@e.com', '2021-08-04 15:51:06', ''),
(2, '[New Product] -product 1  -Qty-15 ID 1', '2021-08-04 15:52:53', 'admin'),
(3, '[New Product] -Product 2  -Qty-18 ID 2', '2021-08-04 15:53:11', 'admin'),
(4, '[Payment Invoice 1]  Transaction-1 - 26 ', '2021-08-04 15:53:30', 'admin'),
(5, '[Payment Invoice 2]  Transaction-2 - 26 ', '2021-08-04 15:55:29', 'admin'),
(6, '[Logged In] admin@e.com', '2021-08-06 17:34:30', ''),
(7, '[New Product] -Product Onex  -Qty-16 ID 3', '2021-08-06 17:36:00', 'admin'),
(8, '[Payment Invoice 3]  Transaction-3 - 70 ', '2021-08-06 17:39:10', 'admin'),
(9, '[Payment Invoice 4]  Transaction-4 - 26 ', '2021-08-06 17:40:05', 'admin'),
(10, '[Payment Invoice 6]  Transaction-5 - 12 ', '2021-08-06 17:40:36', 'admin'),
(11, '[Logged Out] admin', '2021-08-06 17:44:02', ''),
(12, '[Logged In] admin@e.com', '2021-08-06 17:44:23', ''),
(13, '[Employee ClockIn]  ID 15', '2021-08-06 17:44:54', 'admin'),
(14, '[Payment Invoice 7]  Transaction-6 - 96 ', '2021-08-06 17:46:03', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `geopos_login_attempts`
--

DROP TABLE IF EXISTS `geopos_login_attempts`;
CREATE TABLE IF NOT EXISTS `geopos_login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(39) DEFAULT '0',
  `timestamp` datetime DEFAULT NULL,
  `login_attempts` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_metadata`
--

DROP TABLE IF EXISTS `geopos_metadata`;
CREATE TABLE IF NOT EXISTS `geopos_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(3) NOT NULL,
  `rid` int(11) NOT NULL,
  `col1` varchar(255) DEFAULT NULL,
  `col2` varchar(255) DEFAULT NULL,
  `d_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `geopos_metadata`
--

INSERT INTO `geopos_metadata` (`id`, `type`, `rid`, `col1`, `col2`, `d_date`) VALUES
(1, 9, 1, '-5', NULL, '2021-08-04'),
(2, 9, 2, '-5', NULL, '2021-08-04'),
(3, 9, 3, '-16', NULL, '2021-08-06'),
(4, 9, 4, '-5', NULL, '2021-08-06'),
(5, 9, 5, '0', NULL, '2021-08-06'),
(6, 9, 6, '-2', NULL, '2021-08-06'),
(7, 9, 7, '-16', NULL, '2021-08-06');

-- --------------------------------------------------------

--
-- Table structure for table `geopos_milestones`
--

DROP TABLE IF EXISTS `geopos_milestones`;
CREATE TABLE IF NOT EXISTS `geopos_milestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sdate` date NOT NULL,
  `edate` date NOT NULL,
  `exp` text NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_movers`
--

DROP TABLE IF EXISTS `geopos_movers`;
CREATE TABLE IF NOT EXISTS `geopos_movers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d_type` int(3) NOT NULL,
  `rid1` int(11) NOT NULL,
  `rid2` int(11) NOT NULL,
  `rid3` int(11) NOT NULL,
  `d_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `d_type` (`d_type`,`rid1`,`rid2`,`rid3`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_movers`
--

INSERT INTO `geopos_movers` (`id`, `d_type`, `rid1`, `rid2`, `rid3`, `d_time`, `note`) VALUES
(1, 1, 1, 15, 0, '2021-08-04 15:52:53', 'Stock Initialized'),
(2, 1, 2, 18, 0, '2021-08-04 15:53:11', 'Stock Initialized'),
(3, 1, 3, 16, 0, '2021-08-06 17:36:00', 'Stock Initialized');

-- --------------------------------------------------------

--
-- Table structure for table `geopos_notes`
--

DROP TABLE IF EXISTS `geopos_notes`;
CREATE TABLE IF NOT EXISTS `geopos_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `cdate` date NOT NULL,
  `last_edit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cid` int(11) NOT NULL DEFAULT '0',
  `fid` int(11) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL DEFAULT '0',
  `ntype` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_pms`
--

DROP TABLE IF EXISTS `geopos_pms`;
CREATE TABLE IF NOT EXISTS `geopos_pms` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) UNSIGNED NOT NULL,
  `receiver_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `date_sent` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `pm_deleted_sender` int(1) NOT NULL,
  `pm_deleted_receiver` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `full_index` (`id`,`sender_id`,`receiver_id`,`date_read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_premissions`
--

DROP TABLE IF EXISTS `geopos_premissions`;
CREATE TABLE IF NOT EXISTS `geopos_premissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` enum('Sales','Stock','Crm','Project','Accounts','Miscellaneous','Employees','Assign Project','Customer Profile','Reports','Delete') NOT NULL,
  `r_1` int(1) NOT NULL,
  `r_2` int(1) NOT NULL,
  `r_3` int(1) NOT NULL,
  `r_4` int(1) NOT NULL,
  `r_5` int(1) NOT NULL,
  `r_6` int(1) NOT NULL,
  `r_7` int(1) NOT NULL,
  `r_8` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `geopos_premissions`
--

INSERT INTO `geopos_premissions` (`id`, `module`, `r_1`, `r_2`, `r_3`, `r_4`, `r_5`, `r_6`, `r_7`, `r_8`) VALUES
(1, 'Sales', 0, 1, 1, 1, 1, 0, 0, 0),
(2, 'Stock', 1, 0, 1, 1, 1, 0, 0, 0),
(3, 'Crm', 0, 0, 1, 1, 1, 0, 0, 0),
(4, 'Project', 0, 0, 0, 1, 1, 1, 0, 0),
(5, 'Accounts', 0, 0, 0, 1, 1, 0, 0, 0),
(6, 'Miscellaneous', 0, 0, 0, 1, 1, 0, 0, 0),
(7, 'Assign Project', 0, 1, 0, 0, 1, 0, 0, 0),
(8, 'Customer Profile', 0, 0, 0, 0, 1, 0, 0, 0),
(9, 'Employees', 0, 0, 0, 0, 1, 0, 0, 0),
(10, 'Reports', 0, 0, 0, 1, 1, 0, 0, 0),
(11, 'Delete', 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_products`
--

DROP TABLE IF EXISTS `geopos_products`;
CREATE TABLE IF NOT EXISTS `geopos_products` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pcat` int(3) NOT NULL DEFAULT '1',
  `warehouse` int(11) NOT NULL DEFAULT '1',
  `product_name` varchar(80) NOT NULL,
  `product_code` varchar(30) DEFAULT NULL,
  `product_price` decimal(16,2) DEFAULT '0.00',
  `fproduct_price` decimal(16,2) DEFAULT '0.00',
  `taxrate` decimal(16,2) DEFAULT '0.00',
  `disrate` decimal(16,2) DEFAULT '0.00',
  `qty` decimal(10,2) NOT NULL,
  `product_des` text,
  `alert` int(11) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  `image` varchar(120) DEFAULT 'default.png',
  `barcode` varchar(16) DEFAULT NULL,
  `merge` int(2) NOT NULL,
  `sub` int(11) NOT NULL,
  `vb` int(11) NOT NULL,
  `expiry` date DEFAULT NULL,
  `code_type` varchar(8) DEFAULT 'EAN13',
  `sub_id` int(11) DEFAULT '0',
  `b_id` int(11) DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `pcat` (`pcat`),
  KEY `warehouse` (`warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_products`
--

INSERT INTO `geopos_products` (`pid`, `pcat`, `warehouse`, `product_name`, `product_code`, `product_price`, `fproduct_price`, `taxrate`, `disrate`, `qty`, `product_des`, `alert`, `unit`, `image`, `barcode`, `merge`, `sub`, `vb`, `expiry`, `code_type`, `sub_id`, `b_id`) VALUES
(1, 1, 1, 'product 1', '1234444', '12.00', '14.00', '0.00', '0.00', '9.00', '', 0, '', 'default.png', '597895447895', 0, 0, 0, NULL, 'EAN13', 0, 0),
(2, 1, 1, 'Product 2', '111111', '14.00', '17.00', '0.00', '0.00', '13.00', '', 0, '', 'default.png', '500153141734', 0, 0, 0, NULL, 'EAN13', 0, 0),
(3, 1, 1, 'Product Onex', '134566644', '12.00', '14.00', '0.00', '0.00', '5.00', '', 5, '', 'default.png', '125412029899', 0, 0, 0, NULL, 'EAN13', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_product_cat`
--

DROP TABLE IF EXISTS `geopos_product_cat`;
CREATE TABLE IF NOT EXISTS `geopos_product_cat` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `c_type` int(2) DEFAULT '0',
  `rel_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_product_cat`
--

INSERT INTO `geopos_product_cat` (`id`, `title`, `extra`, `c_type`, `rel_id`) VALUES
(1, 'General', 'General Cat', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_product_serials`
--

DROP TABLE IF EXISTS `geopos_product_serials`;
CREATE TABLE IF NOT EXISTS `geopos_product_serials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `serial` varchar(200) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_projects`
--

DROP TABLE IF EXISTS `geopos_projects`;
CREATE TABLE IF NOT EXISTS `geopos_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` varchar(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('Waiting','Pending','Terminated','Finished','Progress') NOT NULL DEFAULT 'Pending',
  `priority` enum('Low','Medium','High','Urgent') NOT NULL DEFAULT 'Medium',
  `progress` int(3) NOT NULL,
  `cid` int(11) NOT NULL,
  `sdate` date NOT NULL,
  `edate` date NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `phase` varchar(255) DEFAULT NULL,
  `note` text,
  `worth` decimal(16,2) NOT NULL DEFAULT '0.00',
  `ptype` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p_id` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_project_meta`
--

DROP TABLE IF EXISTS `geopos_project_meta`;
CREATE TABLE IF NOT EXISTS `geopos_project_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `meta_key` int(11) NOT NULL,
  `meta_data` varchar(200) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `key3` varchar(20) DEFAULT NULL,
  `key4` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `meta_key` (`meta_key`),
  KEY `key3` (`key3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_promo`
--

DROP TABLE IF EXISTS `geopos_promo`;
CREATE TABLE IF NOT EXISTS `geopos_promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(15) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `valid` date NOT NULL,
  `active` int(1) NOT NULL,
  `note` varchar(100) NOT NULL,
  `reflect` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `available` int(11) NOT NULL,
  `location` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_2` (`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_purchase`
--

DROP TABLE IF EXISTS `geopos_purchase`;
CREATE TABLE IF NOT EXISTS `geopos_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `invoicedate` date NOT NULL,
  `invoiceduedate` date NOT NULL,
  `subtotal` decimal(16,2) DEFAULT '0.00',
  `shipping` decimal(16,2) DEFAULT '0.00',
  `ship_tax` decimal(16,2) DEFAULT NULL,
  `ship_tax_type` enum('incl','excl','off') DEFAULT 'off',
  `discount` decimal(16,2) DEFAULT '0.00',
  `tax` decimal(16,2) DEFAULT '0.00',
  `total` decimal(16,2) DEFAULT '0.00',
  `pmethod` varchar(14) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `status` enum('paid','due','canceled','partial') DEFAULT 'due',
  `csd` int(5) NOT NULL DEFAULT '0',
  `eid` int(4) NOT NULL,
  `pamnt` decimal(16,2) DEFAULT '0.00',
  `items` decimal(10,2) NOT NULL,
  `taxstatus` enum('yes','no','incl','cgst','igst') DEFAULT 'yes',
  `discstatus` tinyint(1) NOT NULL,
  `format_discount` enum('%','flat','b_p','bflat') DEFAULT NULL,
  `refer` varchar(20) DEFAULT NULL,
  `term` int(3) NOT NULL,
  `loc` int(4) NOT NULL,
  `multi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice` (`tid`),
  KEY `eid` (`eid`),
  KEY `csd` (`csd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_purchase_items`
--

DROP TABLE IF EXISTS `geopos_purchase_items`;
CREATE TABLE IF NOT EXISTS `geopos_purchase_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `product` varchar(255) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `qty` decimal(10,2) NOT NULL,
  `price` decimal(16,2) DEFAULT '0.00',
  `tax` decimal(16,2) DEFAULT '0.00',
  `discount` decimal(16,2) DEFAULT '0.00',
  `subtotal` decimal(16,2) DEFAULT '0.00',
  `totaltax` decimal(16,2) DEFAULT '0.00',
  `totaldiscount` decimal(16,2) DEFAULT '0.00',
  `product_des` text,
  `unit` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_quotes`
--

DROP TABLE IF EXISTS `geopos_quotes`;
CREATE TABLE IF NOT EXISTS `geopos_quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `invoicedate` date NOT NULL,
  `invoiceduedate` date NOT NULL,
  `subtotal` decimal(16,2) DEFAULT '0.00',
  `shipping` decimal(16,2) DEFAULT '0.00',
  `ship_tax` decimal(16,2) DEFAULT NULL,
  `ship_tax_type` enum('incl','excl','off') DEFAULT 'off',
  `discount` decimal(16,2) DEFAULT '0.00',
  `tax` decimal(16,2) DEFAULT '0.00',
  `total` decimal(16,2) DEFAULT '0.00',
  `pmethod` varchar(14) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `status` enum('pending','accepted','rejected','customer_approved') DEFAULT 'pending',
  `csd` int(5) NOT NULL DEFAULT '0',
  `eid` int(4) NOT NULL,
  `pamnt` decimal(16,2) NOT NULL,
  `items` decimal(10,2) NOT NULL,
  `taxstatus` enum('yes','no','incl','cgst','igst') DEFAULT 'yes',
  `discstatus` tinyint(1) NOT NULL,
  `format_discount` enum('%','flat','b_p','bflat') DEFAULT '%',
  `refer` varchar(20) DEFAULT NULL,
  `term` int(3) NOT NULL,
  `proposal` text,
  `multi` int(4) DEFAULT NULL,
  `loc` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice` (`tid`),
  KEY `eid` (`eid`),
  KEY `csd` (`csd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_quotes_items`
--

DROP TABLE IF EXISTS `geopos_quotes_items`;
CREATE TABLE IF NOT EXISTS `geopos_quotes_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `product` varchar(255) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `qty` decimal(16,2) NOT NULL,
  `price` decimal(16,2) DEFAULT '0.00',
  `tax` decimal(16,2) DEFAULT '0.00',
  `discount` decimal(16,2) DEFAULT '0.00',
  `subtotal` decimal(16,2) DEFAULT '0.00',
  `totaltax` decimal(16,2) DEFAULT '0.00',
  `totaldiscount` decimal(16,2) DEFAULT '0.00',
  `product_des` text,
  `unit` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_register`
--

DROP TABLE IF EXISTS `geopos_register`;
CREATE TABLE IF NOT EXISTS `geopos_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `o_date` datetime NOT NULL,
  `c_date` datetime NOT NULL,
  `cash` decimal(16,2) NOT NULL,
  `card` decimal(16,2) NOT NULL,
  `bank` decimal(16,2) NOT NULL,
  `cheque` decimal(16,2) NOT NULL,
  `r_change` decimal(16,2) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_register`
--

INSERT INTO `geopos_register` (`id`, `uid`, `o_date`, `c_date`, `cash`, `card`, `bank`, `cheque`, `r_change`, `active`) VALUES
(1, 15, '2021-08-04 15:52:17', '0000-00-00 00:00:00', '30256.00', '30000.00', '30000.00', '30000.00', '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_reports`
--

DROP TABLE IF EXISTS `geopos_reports`;
CREATE TABLE IF NOT EXISTS `geopos_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(10) DEFAULT NULL,
  `year` int(4) NOT NULL,
  `invoices` int(11) NOT NULL,
  `sales` decimal(16,2) DEFAULT '0.00',
  `items` decimal(10,2) NOT NULL,
  `income` decimal(16,2) DEFAULT '0.00',
  `expense` decimal(16,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_restkeys`
--

DROP TABLE IF EXISTS `geopos_restkeys`;
CREATE TABLE IF NOT EXISTS `geopos_restkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) DEFAULT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_smtp`
--

DROP TABLE IF EXISTS `geopos_smtp`;
CREATE TABLE IF NOT EXISTS `geopos_smtp` (
  `id` int(11) NOT NULL,
  `host` varchar(100) NOT NULL,
  `port` int(11) NOT NULL,
  `auth` enum('true','false') NOT NULL,
  `auth_type` enum('none','tls','ssl') NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `sender` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_smtp`
--

INSERT INTO `geopos_smtp` (`id`, `host`, `port`, `auth`, `auth_type`, `username`, `password`, `sender`) VALUES
(1, 'smtp.com', 587, 'true', 'none', 'support@example.com', '123456', 'support@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `geopos_stock_r`
--

DROP TABLE IF EXISTS `geopos_stock_r`;
CREATE TABLE IF NOT EXISTS `geopos_stock_r` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(8) NOT NULL,
  `invoicedate` date NOT NULL,
  `invoiceduedate` date NOT NULL,
  `subtotal` decimal(16,2) DEFAULT '0.00',
  `shipping` decimal(16,2) DEFAULT '0.00',
  `ship_tax` decimal(16,2) DEFAULT NULL,
  `ship_tax_type` enum('incl','excl','off') DEFAULT 'off',
  `discount` decimal(16,2) DEFAULT '0.00',
  `tax` decimal(16,2) DEFAULT '0.00',
  `total` decimal(16,2) DEFAULT '0.00',
  `pmethod` varchar(14) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `status` enum('pending','accepted','rejected','partial','canceled') DEFAULT 'pending',
  `csd` int(5) NOT NULL DEFAULT '0',
  `eid` int(4) NOT NULL,
  `pamnt` decimal(16,2) DEFAULT '0.00',
  `items` decimal(10,0) NOT NULL,
  `taxstatus` enum('yes','no','incl','cgst','igst') DEFAULT 'yes',
  `discstatus` tinyint(1) NOT NULL,
  `format_discount` enum('%','flat','bflat','b_p') DEFAULT NULL,
  `refer` varchar(20) DEFAULT NULL,
  `term` int(3) NOT NULL,
  `loc` int(4) NOT NULL,
  `i_class` int(1) NOT NULL DEFAULT '0',
  `multi` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice` (`tid`),
  KEY `eid` (`eid`),
  KEY `csd` (`csd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_stock_r_items`
--

DROP TABLE IF EXISTS `geopos_stock_r_items`;
CREATE TABLE IF NOT EXISTS `geopos_stock_r_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `product` varchar(255) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `qty` decimal(10,2) NOT NULL,
  `price` decimal(16,2) DEFAULT '0.00',
  `tax` decimal(16,2) DEFAULT '0.00',
  `discount` decimal(16,2) DEFAULT '0.00',
  `subtotal` decimal(16,2) DEFAULT '0.00',
  `totaltax` decimal(16,2) DEFAULT '0.00',
  `totaldiscount` decimal(16,2) DEFAULT '0.00',
  `product_des` text,
  `unit` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice` (`tid`) KEY_BLOCK_SIZE=1024 USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_supplier`
--

DROP TABLE IF EXISTS `geopos_supplier`;
CREATE TABLE IF NOT EXISTS `geopos_supplier` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `region` varchar(30) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `postbox` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `picture` varchar(100) NOT NULL DEFAULT 'example.png',
  `gid` int(5) NOT NULL DEFAULT '1',
  `company` varchar(100) DEFAULT NULL,
  `taxid` varchar(100) DEFAULT NULL,
  `loc` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_system`
--

DROP TABLE IF EXISTS `geopos_system`;
CREATE TABLE IF NOT EXISTS `geopos_system` (
  `id` int(1) NOT NULL,
  `cname` char(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(30) NOT NULL,
  `region` varchar(40) NOT NULL,
  `country` varchar(30) NOT NULL,
  `postbox` varchar(15) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `taxid` varchar(20) NOT NULL,
  `tax` int(11) NOT NULL,
  `currency` varchar(4) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `currency_format` int(1) NOT NULL,
  `prefix` varchar(5) NOT NULL,
  `dformat` int(1) NOT NULL,
  `zone` varchar(25) NOT NULL,
  `logo` varchar(30) NOT NULL,
  `lang` varchar(20) DEFAULT 'english',
  `foundation` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_system`
--

INSERT INTO `geopos_system` (`id`, `cname`, `address`, `city`, `region`, `country`, `postbox`, `phone`, `email`, `taxid`, `tax`, `currency`, `currency_format`, `prefix`, `dformat`, `zone`, `logo`, `lang`, `foundation`) VALUES
(1, 'ABC Company', '412 Example South Street,', 'Los Angeles', 'FL', 'USA', '123', '410-987-89-60', 'support@ultimatekode.com', '23442', -1, '$', 0, 'SRN', 1, 'Etc/Greenwich', 'logo.png', 'english', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_terms`
--

DROP TABLE IF EXISTS `geopos_terms`;
CREATE TABLE IF NOT EXISTS `geopos_terms` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `type` int(1) NOT NULL,
  `terms` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_terms`
--

INSERT INTO `geopos_terms` (`id`, `title`, `type`, `terms`) VALUES
(1, 'Payment On Receipt', 0, '<p>1. 10% discount if payment received within ten days otherwise payment 30 days\r\n            after invoice date<br></p>');

-- --------------------------------------------------------

--
-- Table structure for table `geopos_tickets`
--

DROP TABLE IF EXISTS `geopos_tickets`;
CREATE TABLE IF NOT EXISTS `geopos_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `cid` int(11) NOT NULL,
  `status` enum('Solved','Processing','Waiting') NOT NULL,
  `section` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_tickets_th`
--

DROP TABLE IF EXISTS `geopos_tickets_th`;
CREATE TABLE IF NOT EXISTS `geopos_tickets_th` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `message` text,
  `cid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `cdate` datetime NOT NULL,
  `attach` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `cid` (`cid`),
  KEY `eid` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_todolist`
--

DROP TABLE IF EXISTS `geopos_todolist`;
CREATE TABLE IF NOT EXISTS `geopos_todolist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tdate` date NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` enum('Due','Done','Progress') NOT NULL DEFAULT 'Due',
  `start` date NOT NULL,
  `duedate` date NOT NULL,
  `description` text,
  `eid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `related` int(11) NOT NULL,
  `priority` enum('Low','Medium','High','Urgent') NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_transactions`
--

DROP TABLE IF EXISTS `geopos_transactions`;
CREATE TABLE IF NOT EXISTS `geopos_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acid` int(11) NOT NULL,
  `account` varchar(200) NOT NULL,
  `type` enum('Income','Expense','Transfer') NOT NULL,
  `cat` varchar(200) NOT NULL,
  `debit` decimal(16,2) DEFAULT '0.00',
  `credit` decimal(16,2) DEFAULT '0.00',
  `payer` varchar(200) DEFAULT NULL,
  `payerid` int(11) NOT NULL DEFAULT '0',
  `method` varchar(200) DEFAULT NULL,
  `date` date NOT NULL,
  `tid` int(11) NOT NULL DEFAULT '0',
  `eid` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `ext` int(1) DEFAULT '0',
  `loc` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loc` (`loc`),
  KEY `acid` (`acid`),
  KEY `eid` (`eid`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_transactions`
--

INSERT INTO `geopos_transactions` (`id`, `acid`, `account`, `type`, `cat`, `debit`, `credit`, `payer`, `payerid`, `method`, `date`, `tid`, `eid`, `note`, `ext`, `loc`) VALUES
(1, 1, 'Sales Account', 'Income', 'Sales', '0.00', '26.00', 'Walk-in Client', 1, 'Cash', '2021-08-04', 1, 13, '#1001-Cash', 0, 0),
(2, 1, 'Sales Account', 'Income', 'Sales', '0.00', '26.00', 'Walk-in Client', 1, 'Cash', '2021-08-04', 2, 13, '#1002-Cash', 0, 0),
(3, 1, 'Sales Account', 'Income', 'Sales', '0.00', '70.00', 'Walk-in Client', 1, 'Cash', '2021-08-06', 3, 13, '#1003-Cash', 0, 0),
(4, 1, 'Sales Account', 'Income', 'Sales', '0.00', '26.00', 'Walk-in Client', 1, 'Cash', '2021-08-06', 4, 13, '#1004-Cash', 0, 0),
(5, 1, 'Sales Account', 'Income', 'Sales', '0.00', '12.00', 'Walk-in Client', 1, 'Cash', '2021-08-06', 6, 13, '#1005-Cash', 0, 0),
(6, 1, 'Sales Account', 'Income', 'Sales', '0.00', '96.00', 'Walk-in Client', 1, 'Cash', '2021-08-06', 7, 13, '#1006-Cash', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_trans_cat`
--

DROP TABLE IF EXISTS `geopos_trans_cat`;
CREATE TABLE IF NOT EXISTS `geopos_trans_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_trans_cat`
--

INSERT INTO `geopos_trans_cat` (`id`, `name`) VALUES
(1, 'Income'),
(2, 'Expenses'),
(3, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `geopos_units`
--

DROP TABLE IF EXISTS `geopos_units`;
CREATE TABLE IF NOT EXISTS `geopos_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `code` varchar(5) NOT NULL,
  `type` int(1) NOT NULL,
  `sub` int(1) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geopos_users`
--

DROP TABLE IF EXISTS `geopos_users`;
CREATE TABLE IF NOT EXISTS `geopos_users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `forgot_exp` text,
  `remember_time` datetime DEFAULT NULL,
  `remember_exp` text,
  `verification_code` text,
  `totp_secret` varchar(16) DEFAULT NULL,
  `ip_address` text,
  `roleid` int(1) NOT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `loc` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_users`
--

INSERT INTO `geopos_users` (`id`, `email`, `pass`, `username`, `banned`, `last_login`, `last_activity`, `date_created`, `forgot_exp`, `remember_time`, `remember_exp`, `verification_code`, `totp_secret`, `ip_address`, `roleid`, `picture`, `loc`) VALUES
(15, 'admin@e.com', '196075d3b960128ae4a5cf79596d3d06ed482c5535c813ec0c7dbc2e6be032be', 'admin', 0, '2021-08-06 17:44:23', '2021-08-06 17:44:23', '2021-08-04 15:44:26', NULL, NULL, NULL, '', NULL, '::1', 5, '16280929231564318678.jpeg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `geopos_warehouse`
--

DROP TABLE IF EXISTS `geopos_warehouse`;
CREATE TABLE IF NOT EXISTS `geopos_warehouse` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `loc` int(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geopos_warehouse`
--

INSERT INTO `geopos_warehouse` (`id`, `title`, `extra`, `loc`) VALUES
(1, 'Main WareHouse', 'The Main WareHouse', 0);

-- --------------------------------------------------------

--
-- Table structure for table `univarsal_api`
--

DROP TABLE IF EXISTS `univarsal_api`;
CREATE TABLE IF NOT EXISTS `univarsal_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `key1` varchar(255) DEFAULT NULL,
  `key2` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `other` text,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `univarsal_api`
--

INSERT INTO `univarsal_api` (`id`, `name`, `key1`, `key2`, `url`, `method`, `other`, `active`) VALUES
(1, 'Goo.gl URL Shortner', 'yourkey', '0', '0', '0', '0', 0),
(2, 'Twilio SMS API', 'ac', 'key', '+11234567', '0', '0', 1),
(3, 'Company Support', '1', '1', 'support@gmail.com', NULL, '<p>Your footer</p>', 1),
(4, 'Currency', '.', ',', '2', 'l', NULL, NULL),
(5, 'Exchange', 'key1v', 'key2', 'USD', NULL, NULL, 0),
(6, 'New Invoice Notification', '[{Company}] Invoice #{BillNumber} Generated', NULL, NULL, NULL, '<p>Dear\r\n            Client,\r\n</p><p>We are contacting you in regard to a payment received for invoice # {BillNumber} that has\r\n            been created on your account. You may find the invoice with below link.\r\n\r\nView\r\n            Invoice\r\n{URL}\r\n\r\nWe look forward to conducting future business with you.\r\n\r\nKind\r\n            Regards,\r\nTeam\r\n{CompanyDetails}</p>', NULL),
(7, 'Invoice Payment Reminder', '[{Company}] Invoice #{BillNumber} Payment Reminder', NULL, NULL, NULL, '<p>Dear\r\n            Client,</p><p>We are contacting you in regard to a payment reminder of invoice # {BillNumber} that has been\r\n            created on your account. You may find the invoice with below link. Please pay the balance of {Amount} due by\r\n            {DueDate}.</p><p>\r\n\r\n<b>View Invoice</b></p><p><span style=\"font-size: 1rem;\">{URL}\r\n</span></p><p>\r\n            <span style=\"font-size: 1rem;\">\r\nWe look forward to conducting future business with you.</span></p><p>\r\n            <span style=\"font-size: 1rem;\">\r\n\r\nKind Regards,\r\n</span></p><p><span style=\"font-size: 1rem;\">\r\nTeam\r\n</span>\r\n        </p><p><span style=\"font-size: 1rem;\">\r\n{CompanyDetails}</span></p>', NULL),
(8, 'Invoice Refund Proceeded', '{Company} Invoice #{BillNumber} Refund Proceeded', NULL, NULL, NULL, '<p>Dear\r\n            Client,</p><p>\r\nWe are contacting you in regard to a refund request processed for invoice # {BillNumber}\r\n            that has been created on your account. You may find the invoice with below link. Please pay the balance of\r\n            {Amount} by {DueDate}.\r\n</p><p>\r\nView Invoice\r\n</p><p>{URL}\r\n</p><p>\r\nWe look forward to\r\n            conducting future business with you.\r\n</p><p>\r\nKind Regards,\r\n</p><p>\r\n            \r\nTeam\r\n\r\n{CompanyDetails}</p>', NULL),
(9, 'Invoice payment Received', '{Company} Payment Received for Invoice #{BillNumber}', NULL, NULL, NULL, '<p>\r\n            Dear Client,\r\n</p><p>We are contacting you in regard to a payment received for invoice # {BillNumber} that\r\n            has been created on your account. You can find the invoice with below link.\r\n</p><p>\r\nView Invoice</p>\r\n        <p>\r\n{URL}\r\n</p><p>\r\nWe look forward to conducting future business with you.\r\n</p><p>\r\nKind\r\n            Regards,\r\n</p><p>\r\nTeam\r\n</p><p>\r\n{CompanyDetails}</p>', NULL),
(10, 'Invoice Overdue Notice', '{Company} Invoice #{BillNumber} Generated for you', NULL, NULL, NULL, '<p>Dear\r\n            Client,</p><p>\r\nWe are contacting you in regard to an Overdue Notice for invoice # {BillNumber} that has\r\n            been created on your account. You may find the invoice with below link.\r\nPlease pay the balance of\r\n            {Amount} due by {DueDate}.\r\n</p><p>View Invoice\r\n</p><p>{URL}\r\n</p><p>\r\nWe look forward to\r\n            conducting future business with you.\r\n</p><p>\r\nKind Regards,\r\n</p><p>\r\nTeam</p><p>\r\n            \r\n\r\n{CompanyDetails}</p>', NULL),
(11, 'Quote Proposal', '{Company} Quote #{BillNumber} Generated for you', NULL, NULL, NULL, '<p>Dear Client,</p>\r\n        <p>\r\nWe are contacting you in regard to a new quote # {BillNumber} that has been created on your account. You\r\n            may find the quote with below link.\r\n</p><p>\r\nView Invoice\r\n</p><p>{URL}\r\n</p><p>\r\nWe look forward\r\n            to conducting future business with you.</p><p>\r\n\r\nKind Regards,</p><p>\r\n\r\nTeam</p><p>\r\n            \r\n\r\n{CompanyDetails}</p>', NULL),
(12, 'Purchase Order Request', '{Company} Purchase Order #{BillNumber} Requested', NULL, NULL, NULL, '<p>Dear\r\n            Client,\r\n</p><p>We are contacting you in regard to a new purchase # {BillNumber} that has been requested\r\n            on your account. You may find the order with below link. </p><p>\r\n\r\nView Invoice\r\n</p><p>{URL}</p><p>\r\n            \r\n\r\nWe look forward to conducting future business with you.</p><p>\r\n\r\nKind Regards,\r\n</p><p>\r\n            \r\nTeam</p><p>\r\n\r\n{CompanyDetails}</p>', NULL),
(13, 'Stock Return Mail', '{Company} New purchase return # {BillNumber}', NULL, NULL, NULL, 'Dear Client,\r\n\r\nWe are contacting you in regard to a new purchase return # {BillNumber} that has been requested on your account. You may find the order with below link.\r\n\r\nView Invoice\r\n\r\n{URL}\r\n\r\nWe look forward to conducting future business with you.\r\n\r\nKind Regards,\r\n\r\nTeam\r\n\r\n{CompanyDetails}', NULL),
(14, 'Customer Registration', '{Company}  Customer Registration - {NAME}', NULL, NULL, NULL, 'Dear Customer,\r\nThank You for registration, please confirm the registration by the following URL {REG_URL}\r\nRegards', NULL),
(15, 'Â Customer Password Reset', '{Company} Â Customer Password Reset- {NAME}', NULL, NULL, NULL, 'Dear Customer,\r\nPlease reset the password by the following URL {RESET_URL}\r\nRegards', NULL),
(16, 'Customer Registration by Employee', '{Company} Â Customer Registration - {NAME}', '0', '0', '0', 'Dear Customer,\r\nThank You for registration.\r\nLogin URL: {URL}\r\nLogin Email: {EMAIL}\r\nPassword: {PASSWORD}\r\n\r\nRegards\r\n{CompanyDetails}', 0),
(30, 'New Invoice Notification', NULL, NULL, NULL, NULL, 'Dear Customer, new invoice  # {BillNumber} generated. {URL} Regards', NULL),
(31, 'Invoice Payment Reminder', NULL, NULL, NULL, NULL, 'Dear Customer, Please make payment of invoice  # {BillNumber}. {URL} Regards', NULL),
(32, 'Invoice Refund Proceeded', NULL, NULL, NULL, NULL, 'Dear Customer, Refund generated of invoice # {BillNumber}. {URL} Regards', NULL),
(33, 'Invoice payment Received', NULL, NULL, NULL, NULL, 'Dear Customer, Payment received of invoice # {BillNumber}. {URL} Regards', NULL),
(34, 'Invoice Overdue Notice', NULL, NULL, NULL, NULL, 'Dear Customer, Dear Customer,Payment is overdue of invoice # {BillNumber}. {URL} Regards', NULL),
(35, 'Quote Proposal', NULL, NULL, NULL, NULL, 'Dear Customer, Dear Customer, a quote created for you # {BillNumber}. {URL} Regards', NULL),
(36, 'Purchase Order Request', NULL, NULL, NULL, NULL, 'Dear Customer, Dear, a purchased order for you # {BillNumber}. {URL} Regards', NULL),
(51, 'QT#', 'PO#', 'SUB#', 'SR#', 'TRN#', 'SRN#', 1),
(52, 'ThermalPrint', '0', NULL, NULL, NULL, 'POS#', 0),
(53, 'ConfPort', 'Public Key', '0', 'Private Key', NULL, NULL, 1),
(54, 'online_payment', '1', 'USD', '1', '1', NULL, 1),
(55, 'CronJob', '99293768', 'rec_email', 'email', 'rec_due', 'recemail', NULL),
(56, 'Auto Email SMS', 'email', 'sms', NULL, NULL, NULL, NULL),
(60, 'Warehouse', '1', NULL, NULL, NULL, NULL, NULL),
(61, 'Discount & Shipping', '%', '10.00', 'incl', NULL, '% Discount After TAX', NULL),
(62, 'AutoAttendance', '1', '0', '0', '0', '0', NULL),
(63, 'Zero Stock Billing', '1', '0', '0', '0', '0', 0),
(64, 'FrontEndSection', '0', '0', '0', '0', NULL, 0),
(65, 'Dual Entry', '0', '1', '0', '0', '0', 0),
(66, 'Email Alert', '0', '0', 'sample@email.com', '0', '0', 0),
(67, 'billing_settings', '0', '0', NULL, NULL, NULL, NULL),
(69, 'pos_settings', '1', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `users_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `var_key` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_deleted` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `lang` varchar(25) NOT NULL DEFAULT 'english',
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`users_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `user_id`, `var_key`, `status`, `is_deleted`, `name`, `password`, `email`, `profile_pic`, `user_type`, `cid`, `lang`, `code`) VALUES
(1, '1', NULL, 'active', '0', 'Walk-in Client', '$2y$10$TKfTVltchv/jxZIouy8i8O7rSzVvtdx4Y5wNRodK5RNyTBJkEoIAW', 'example@example.com', NULL, 'Member', 1, 'english', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
