

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agrishop`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `category` enum('selling','buying') NOT NULL,
  `description` text NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) DEFAULT 0,
  `comments` int(11) DEFAULT 0,
  `shares` int(11) DEFAULT 0,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `username`, `category`, `description`, `file_path`, `created_at`, `likes`, `comments`, `shares`, `location`) VALUES
(1, 'User1', 'buying', 'awds', 'uploads/2x2241.jpg', '2025-02-11 15:14:21', 0, 0, 0, ''),
(3, 'User1', 'buying', 'awdadasdadasdasdas', 'uploads/Untitled-1.jpg', '2025-02-11 15:48:11', 0, 0, 0, ''),
(4, 'xmond', 'buying', 'qweqweqweqwe', 'uploads/2x2241.jpg', '2025-02-11 16:06:22', 0, 0, 0, ''),
(7, 'reggie', 'buying', 'buyinggg ako neto', 'uploads/formal.png', '2025-02-11 16:22:31', 0, 0, 0, ''),
(8, '', 'buying', '123', 'uploads/123123123.jpg', '2025-02-13 14:44:52', 0, 0, 0, 'Location not available'),
(9, '', 'buying', '13123123', 'uploads/123123123.jpg', '2025-02-13 14:45:14', 0, 0, 0, 'Location not available'),
(10, '', 'buying', '1ssdfaw', 'uploads/berto.jpg', '2025-02-13 14:46:32', 0, 0, 0, 'Location not available'),
(11, 'xmond', 'buying', 'buying talong', 'uploads/berto.jpg', '2025-02-13 14:48:30', 0, 0, 0, ''),
(12, 'mond', 'buying', 'buying ako nito mga nigga', 'uploads/emp2.JPG', '2025-02-13 15:14:18', 0, 0, 0, ''),
(13, 'xmond', 'buying', 'buying this seed', 'uploads/eggplant.jpg', '2025-02-28 12:12:47', 0, 0, 0, ''),
(14, 'xmond', 'buying', 'buyingggg ng okra seed', 'uploads/okra seed.jpg', '2025-02-28 13:57:18', 0, 0, 0, ''),
(15, 'xmond', 'selling', 'Sell this okra seed', 'uploads/okra seed.jpg', '2025-02-28 14:43:58', 0, 0, 0, ''),
(16, 'xmond', 'buying', 'buying akoooo talong yung mura lang', 'uploads/eggplant.jpg', '2025-03-02 16:20:11', 0, 0, 0, ''),
(17, 'xmond', 'buying', 'buying ulit ng okra seed', 'uploads/okra seed.jpg', '2025-03-02 16:27:22', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('like','comment','share') NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_pic` varchar(255) DEFAULT 'uploads/default.png',
  `img` varchar(255) NOT NULL DEFAULT 'uploads/default.png',
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `password`, `profile_pic`, `img`, `status`, `created_at`, `province`, `city`) VALUES
(1, 'raymond', '', '$2y$10$fIteB6CFtCxExYNo.pK.6ObWJm6Vun0hjiL1GNC25La5bBFL.jGem', 'uploads/default.png', 'uploads/default.png', 'active', '2025-02-11 15:39:31', NULL, NULL),
(3, 'xmond', 'Raymond Esparagoza', '$2y$10$.utDXoeYNat2SHElUlAcgOOiwHETNjVTFChcGY71RG77oIw8aYLsO', 'uploads/default.png', 'uploads/default.png', 'active', '2025-02-11 16:05:59', NULL, NULL),
(4, 'aaa', 'wqe', '$2y$10$H9RXDfQQPUAHz9002hy15uQ99b1qBH4d5Vwu3NlWuOEqSXfoQuwLG', 'uploads/default.png', 'uploads/default.png', 'active', '2025-02-11 16:17:04', NULL, NULL),
(5, 'reggie', 'Reggie Hallare', '$2y$10$YrR9n/nU9rPgyWGBAw2BMO80cSh.XFBDXfIptxpu633Sa.QbW5KwS', 'uploads/default.png', 'uploads/default.png', 'active', '2025-02-11 16:22:03', NULL, NULL),
(7, 'mond', 'Raymond Esparagoza', '$2y$10$qrIS1RqD6SWZ658dFbEL5uG2O79c/qjgylVE7e/DWrLZLIsqbPRaq', 'uploads/default.png', 'uploads/default.png', 'active', '2025-02-13 15:13:43', 'Zambales', 'Olongapo City'),
(9, 'xxmond', 'Raymond Esparagoza1', '$2y$10$fHhuoYI8O9HSHykemprpm.Vna3G1olMVWMaaHbi2QoAn9WbVE/n4S', 'uploads/default.png', 'uploads/default.png', 'active', '2025-02-16 12:52:06', 'Zambales', 'Olongapo City');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reactions`
--
ALTER TABLE `reactions`
  ADD CONSTRAINT `reactions_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
