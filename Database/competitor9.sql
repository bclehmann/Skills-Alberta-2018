-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2018 at 04:09 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `competitor9`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(300) NOT NULL,
  `reading_time` int(11) NOT NULL COMMENT 'minutes',
  `date` date NOT NULL,
  `path` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `author`, `reading_time`, `date`, `path`) VALUES
(1, 'Southern exposure in the North: when Canadian small-caps expand into the U.S.\r\n', 'Samir Taghiyev', 6, '2018-03-14', 'Content/Blog/Blog3.txt'),
(2, 'Enduring themes for volatile times\r\n', 'Rundle', 1, '2018-02-14', 'Content/Blog/Blog4.txt'),
(3, 'The top 15 macro questions to ask before investing in a country\r\n', 'Kara Lilly ', 12, '2018-05-16', 'Content/Blog/Blog1.txt'),
(4, '\"Certified fresh\" lessons from machine learning', 'Siying Li and Kara Lilly', 8, '2018-05-02', 'Content/Blog/Blog2.txt');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`) VALUES
(1, 'Financial Advice'),
(2, 'Mutual Fund');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `blog` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `comment` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `blog`, `username`, `comment`) VALUES
(1, 2, 'blehmann', 'Wow, this is the best investment web site ever, it should get really good marks!!!'),
(2, 1, 'blehmann', 'Wow, I really hope this website gets the gold medal!!!'),
(4, 4, 'blehmann', ' Wow, never seen a website this cool!'),
(5, 2, 'blehmann', ' Really though, the best website I have ever seen!\r\n\r\nP.S. Gold medal would be nice!'),
(6, 2, '', ' '),
(7, 2, '', ' '),
(8, 2, 'dab', ' lit'),
(9, 2, 'awe', ' rwe'),
(10, 2, 'rip', 'da\r\n '),
(11, 2, 'basd', ' qwehdjkasjfdasdlk'),
(12, 2, 'Harvard', 'DUde this guy should get a scholarship ');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `rating` int(11) NOT NULL COMMENT 'Morningstar',
  `manager` varchar(150) NOT NULL,
  `inception_date` date NOT NULL,
  `fund_net_asset_value` float NOT NULL COMMENT 'in million dollars',
  `total_net_asset_value` float NOT NULL COMMENT 'in million dollars',
  `net_asset_value_per_unit` int(11) NOT NULL COMMENT 'in cents',
  `RRSP` tinyint(1) NOT NULL,
  `trading_expense_ratio` float NOT NULL COMMENT 'in %',
  `invests_in` text NOT NULL,
  `investor_suitability` text NOT NULL,
  `investment_strategy` varchar(1000) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `prod_name`, `active`, `rating`, `manager`, `inception_date`, `fund_net_asset_value`, `total_net_asset_value`, `net_asset_value_per_unit`, `RRSP`, `trading_expense_ratio`, `invests_in`, `investor_suitability`, `investment_strategy`, `cat_id`) VALUES
(3, 'Balanced Fund', 1, 3, 'Greg Peterson, CFA', '1988-03-31', 3268, 2540.6, 0, 1, 0.03, 'The Fund invests in Canadian, US, and International equity securities, as well as bonds and other funds managed by Mawer that invest in debentures of government and corporate issues or in those securities directly.', 'Investors seeking long-term growth at medium risk.', 'The Manager\'s traditional equity approach of systematically buying wealth creating companies at a discount to intrinsic value is used to construct the equity part of the portfolio. The fixed income part of the portfolio follows our traditional fixed income approach of focusing on sector allocation, security selection, and trading strategies. For asset mix, the Manager analyzes which combination of asset classes is most likely to offer the most attractive risk/return characteristics within a medium to long-term time frame, and carries out asset mix changes gradually to reduce risk.', 2),
(6, 'Global Bond Fund', 1, 2, 'James Redpath, CFA <br/>\r\nMichael Crofts, CFA, B.Math (Honours) ', '2015-05-28', 263, 11.9, 1045, 1, 0, 'The Fund invests primarily in investment grade government and government related fixed income securities denominated in local and foreign currencies around the world.', 'The Fund is suitable for investors seeking income and global currency, country and yield diversification at a medium risk. ', 'The Fund is broadly diversified across many currencies, countries and yield curves. The research process is focused on identifying and managing risk. Similar to a Central Bank, an emphasis is placed on reserve currencies and countries because they tend to hold their store of value in periods of uncertainty. Within the desired currency and country, securities are selected and actively traded with a focus on positive real returns. The Fund\'s currency positions are unhedged which can increase the resilience of a balanced portfolio through additional diversification.', 2),
(7, 'Canadian Equity Fund', 1, 4, 'Vijay Viswanathan, CFA, MBA <br/>\r\nJim Hall, CFA, MBA ', '1991-06-03', 2814.2, 847.8, 65, 1, 0.01, 'The Fund invests primarily in securities of larger capitalization Canadian companies. Treasury bills or short-term investments, not exceeding three years to maturity, may also be used from time to time.', 'Investors seeking long-term, above average growth who can tolerate equity volatility. Medium to high risk.', 'In order to achieve its investment strategy objectives, the Manager systematically creates a broadly diversified portfolio of wealth-creating companies with excellent management teams bought at discounts to their intrinsic values. The Manager employs a highly disciplined, research-driven, bottom-up process and long-term holding period to allow for investor recognition or corporate growth, and to minimize transaction costs.', 2),
(8, 'Canadian Money Market Fund', 1, 3, 'Michael Crofts, CFA, B.Math (Honours) <br/>\r\nJames Redpath, CFA ', '1988-02-19', 249.6, 34.4, 10, 1, 0, 'This Fund invests in government treasury bills and bonds and corporate obligations maturing in 365 days or less. The Fund will have a dollar weighted average term to maturity of no more than 180 days, subject to certain conditions.', 'Investors seeking income from short term investments. Low risk.\r\n', 'Strategies used to achieve this Fund\'s objective include interest rate anticipation, yield analysis, credit and spread analysis, and taking advantage of supply and demand anomalies.', 2),
(9, 'Emerging Markets Equity Fund', 1, 4, 'Peter Lampert, CFA \r\n', '2017-01-31', 66.7, 34.1, 12, 1, 0.31, 'The Fund invests primarily in equity and equity related securities of companies located or active in emerging market countries. The Fund will diversify through currencies, industries and countries to increase safety, and to increase the growth and liquidity of the investments. Treasury bills or short term investments, not exceeding three years to maturity, may also be used from time to time.\r\n', 'Investors seeking long-term, above average growth who can tolerate significant volatility. High risk.\r\n', 'In order to achieve its investment strategy objectives, the Manager systematically creates a broadly diversified portfolio of wealth-creating companies with excellent management teams bought at discounts to their intrinsic values. The Manager employs a highly disciplined, research-driven, bottom-up process and long-term holding period to allow for investor recognition or corporate growth, and to minimize transaction costs.', 2),
(10, 'Global Equity Fund', 1, 5, 'Paul Moroz, CFA <br/>\r\nJim Hall, CFA, MBA <br/>\r\nChristian Deckart, CFA, Ph.D ', '2009-10-22', 3547.3, 593.2, 27, 1, 0.06, 'The Fund invests in equity securities of companies from around the world. The Manager will allocate capital to the best global opportunities, which may include both large and small capitalization companies. Treasury bills or short-term investments, not exceeding three years to maturity, may also be used from time to time.\r\n', 'Investors seeking long-term above-average growth who can tolerate equity volatility. Medium to high risk.\r\n', 'In order to achieve its investment strategy objectives, the Manager systematically creates a broadly diversified portfolio of wealth-creating companies with excellent management teams bought at discounts to their intrinsic values. The Manager employs a highly disciplined, research-driven, bottom-up process and long-term holding period to allow for investor recognition or corporate growth, and to minimize transaction costs.', 2),
(11, 'Global Small Cap Fund', 1, 5, 'Christian Deckart, CFA, Ph.D <br/>\r\nPaul Moroz, CFA ', '2007-10-02', 2628.4, 772.1, 16, 1, 0.11, 'The Fund invests primarily in equity and equity-related securities of smaller companies around the world with less than $3 billion USD in market cap at time of purchase. The amount invested in any one country will vary depending upon individual company by company opportunities in each area. The Fund will diversify through currencies, industries, and countries to increase safety, and to increase the growth and liquidity of the investments. Treasury bills or short-term investments, not exceeding three years to maturity, may also be used from time to time.\r\n', 'Investors seeking long-term, above average growth who can tolerate equity volatility. High Risk.\r\n', 'In order to achieve its investment strategy objectives, the Manager systematically creates a broadly diversified portfolio of wealth-creating companies with excellent management teams bought at discounts to their intrinsic values. The Manager employs a highly disciplined, research-driven, bottom-up process and long-term holding period to allow for investor recognition or corporate growth, and to minimize transaction costs.', 2),
(12, 'International Equity Fund', 1, 5, 'Raymond Ta, CIM <br/>\r\nDonna Hindenberg, BA, MBA, CIM', '1987-11-06', 6379.2, 980.4, 63, 1, 0.09, 'The Fund invests primarily in equity and equity-related securities of entities outside of Canada and the United States. The amount invested in any one country will vary depending upon individual company by company opportunities in each area. The Fund will diversify through currencies, industries, and countries to increase safety, and to increase the growth and liquidity of the investments. Treasury bills or short-term investments, not exceeding three years to maturity, may also be used from time to time.\r\n', 'Investors seeking long-term, above average growth who can tolerate equity volatility. Medium to high risk.\r\n', 'In order to achieve its investment strategy objectives, the Manager systematically creates a broadly diversified portfolio of wealth-creating companies with excellent management teams bought at discounts to their intrinsic values. The Manager employs a highly disciplined, research-driven, bottom-up process and long-term holding period to allow for investor recognition or corporate growth, and to minimize transaction costs.\r\n', 2),
(13, 'New Canada Fund', 0, 5, 'Jeff Mo, CFA \r\n', '1988-01-08', 1194.8, 211, 74, 1, 0.04, 'The Fund invests primarily in securities of smaller Canadian companies. Treasury bills or short-term investments, not exceeding three years to maturity, may still be used from time to time.\r\n', 'Investors seeking long-term, above average growth who can tolerate significant volatility. High risk.\r\n', 'In order to achieve its investment strategy objectives, the Manager systematically creates a broadly diversified portfolio of wealth-creating companies with excellent management teams bought at discounts to their intrinsic values. The Manager employs a highly disciplined, research-driven, bottom-up process and a long-term holding period to allow for investor recognition or corporate growth, and to minimize transaction costs.', 2),
(14, 'Tax Effective Balanced Fund', 1, 3, 'Craig Senyk, CFA <br/>\r\nTravis Goldfeldt, CFA ', '1988-01-08', 1057.1, 771.7, 35, 1, 0.03, 'The fund may invest up to all of its assets in equity and equity-related securities, treasury bills, short-term notes, debentures and bonds from Canadian, U.S. and international issuers or in other funds managed by Mawer. They can be of any size and from any industry.\r\n', 'Investors seeking long-term growth at medium risk with tax effectiveness.\r\n', 'The Manager’s traditional equity approach of systematically buying wealth creating companies at a discount to intrinsic value is used to construct the equity part of the portfolio. The fixed income part of the portfolio follows our traditional fixed income approach of focusing on sector allocation, security selection, and trading strategies. For asset mix, the Manager analyzes which combination of asset classes is most likely to offer the most attractive risk/return characteristics within a medium to long-term time frame, and carries out asset mix changes gradually to reduce risk. The manager minimizes taxes through the application of a tax overlay strategy, with the objective to minimize taxable distributions.', 2),
(15, 'U.S. Equity Fund', 1, 4, 'Grayson Witcher, CFA, A.B. <br/>\r\nColin Wong, CFA ', '1992-12-10', 2979.7, 373.2, 47, 1, 0.01, 'The Fund invests in equity and equity-related securities of U.S. entities. Treasury bills or short-term investments, not exceeding three years to maturity, may still be used from time to time.\r\n', 'Investors seeking long-term, above average growth who can tolerate equity volatility. Medium to high risk.\r\n', 'In order to achieve its investment strategy objectives, the Manager systematically creates a broadly diversified portfolio of wealth-creating companies with excellent management teams bought at discounts to their intrinsic values. The Manager employs a highly disciplined, research-driven, bottom-up process and long-term holding period to allow for investor recognition or corporate growth, and to minimize transaction costs.', 2),
(16, 'Global Balanced Fund', 1, 3, 'Greg Peterson, CFA ', '2013-07-02', 826.2, 255.3, 15, 1, 0.03, 'The Fund invests primarily in equity and equity-related securities and fixed-income securities from around the world. The Fund may invest in any part of the capital structure in both public and private entities.\r\n', 'Investors seeking long-term growth at medium risk.\r\n', 'A bottom up approach is taken to construct this Fund. The equities are chosen on a global basis and are coupled with the stability of investment grade Canadian and Global bonds. Risk is further managed through extensive diversification across many industries, countries, and currencies.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `roi`
--

CREATE TABLE `roi` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `3_month` float NOT NULL,
  `ytd` float NOT NULL,
  `1_year` float NOT NULL,
  `2_year` float NOT NULL,
  `3_year` float NOT NULL,
  `4_year` float NOT NULL,
  `5_year` float NOT NULL,
  `10_year` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roi`
--

INSERT INTO `roi` (`id`, `foreign_id`, `3_month`, `ytd`, `1_year`, `2_year`, `3_year`, `4_year`, `5_year`, `10_year`) VALUES
(1, 12, 2.1, 2.1, 16, 11.9, 8.5, 10.9, 12.9, 7.7),
(2, 15, 4.7, 4.7, 12.8, 14, 10, 14.6, 17.7, 11.2),
(3, 10, 2.6, 2.6, 13.9, 12.2, 9.5, 12.1, 15.6, 0),
(4, 11, 1.7, 1.7, 16.9, 14.1, 11.8, 13.2, 19.5, 14.6),
(5, 9, 3.3, 3.3, 16.6, 0, 0, 0, 0, 0),
(6, 7, -3.9, -3.9, 2.4, 8, 5.1, 7.3, 10.4, 8.3),
(7, 13, -3.3, -3.3, -2.1, 8.4, 6.2, 6.1, 13.6, 12),
(8, 16, 2.1, 2.1, 8.9, 7.5, 6, 8.4, 0, 0),
(9, 3, 0.9, 0.9, 7.2, 7.5, 5.6, 8, 10.1, 7.9),
(10, 14, 0.9, 0.9, 7, 7.5, 5.5, 7.9, 10, 7.9),
(12, 6, 4.5, 4.5, 2, 0.2, 0, 0, 0, 0),
(13, 8, 0.1, 0.1, 0.2, 0.1, 0.1, 0.1, 0.2, 0.3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog` (`blog`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `roi`
--
ALTER TABLE `roi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_id` (`foreign_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `roi`
--
ALTER TABLE `roi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`blog`) REFERENCES `blogs` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`);

--
-- Constraints for table `roi`
--
ALTER TABLE `roi`
  ADD CONSTRAINT `roi_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `products` (`prod_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
