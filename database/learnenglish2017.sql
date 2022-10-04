-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 01, 2018 at 10:58 PM
-- Server version: 5.5.31
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learneng_learnenglish2017`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `user` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `question_id` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`question_id`, `name`, `date`, `content`) VALUES
('Q4', 'tu', '2017-11-15 17:43:45', 'dam'),
('Q4', 'tu', '2017-11-15 17:44:30', 'shit'),
('Q1', 'tu', '2017-12-17 01:21:37', 'OK'),
('Q1', 'tu', '2017-12-21 02:02:15', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `icon`) VALUES
('CA1', 'Conversation', 'https://i.imgur.com/fUFvsZh.jpg'),
('CA2', 'Job', 'https://i.imgur.com/qfg92BB.jpg'),
('CA3', 'Food/Drink', 'https://i.imgur.com/dFkUg0F.jpg'),
('CA4', 'Sport', 'https://i.imgur.com/hhIeHm5.jpg'),
('CA5', 'Animal', 'https://i.imgur.com/HEci07M.jpg'),
('CA6', 'Certificate', 'https://i.imgur.com/MQpBxSt.jpg'),
('CA7', 'Travel', 'https://i.imgur.com/ukqdkGU.jpg'),
('CA8', 'Basis', 'https://i.imgur.com/52pUF3E.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `rating` FLOAT DEFAULT 0 NOT NULL,
  `progress` int(11) DEFAULT 0 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `category_id`, `course_name`, `price`, `description`, `icon`, `link`, `tag`, `created_at`) VALUES
('CO1', 'CA8', 'English for Beginner', 0, 'This is a beginning course is designed to develop listening and oral communication skills and build the confidence of beginning-level students. Regular small-group and individual speaking and listening practice help students feel confident in discussing activities such as travel, money, and health. The lessons are based on realistic conversations and task-based listening sections.', 'https://i.imgur.com/ohNZGEX.jpg', 't3cdNkLo4aY', 'easy, poor, bad', '2017-10-28'),
('CO10', 'CA2', 'English for Information Technology', 0, 'This amazing best-seller course for Information Technology teaches students language skills in the context of computing and information technology. The course uses a range of authentic reading texts, listening material and structured tasks. Interviews with real IT professionals provide an authentic context and the comprehensive glossary develops students vocabulary.', 'https://i.imgur.com/YnCIasM.jpg', 'U6hwaIXpy5Y', 'medium, good, excellent', '2017-12-18'),
('CO11', 'CA3', 'Food & Drinks Vocabulary with Pictures 1', 0, 'Learning English vocabulary with pictures and audio. Learn and practise using English words for food and drink, useful expressions eating out and dining in cafes, bars and restaurants, and food idioms.', 'https://i.imgur.com/okaLMHl.jpg', 'A3eL1ZKbebY', 'average, good, easy', '2017-12-18'),
('CO12', 'CA3', 'Food & Drinks Vocabulary with Pictures 2', 0, 'Food and drink vocabulary is a main staple of language learning. The names of foods in English might seem quite daunting as there are so many. As we all need to eat food, learning the names for the foods is a great idea as this is something common to every language. In this course we explore useful English food and drink vocabulary and traditional meals, mealtimes and foods in the UK.', 'https://i.imgur.com/364CkhA.jpg', 'bHJXsHf4Q6E', 'average, good, easy', '2017-12-18'),
('CO13', 'CA4', 'BBC Talking Sport', 0, 'Our sport course gives students the opportunity of experiencing different kinds of sport whilst immersing in the English Language. The choice of sports offered in this programme include football, squash, golf, tennis, windsurfing, scuba diving and swimming. Offered at all levels of English, English and Sport is a sure way of learning and staying active.', 'https://i.imgur.com/ubM3ujo.jpg', '2zqo2NnNwHc', 'excellent, good, advanced', '2017-12-18'),
('CO14', 'CA4', 'Sport Vocabulary', 0, 'This course is about sport and its place in society. It develops speaking and writing skills and the use of context-specific vocabulary and idiomatic language. The students own experiences and opinions form the basis of all discussions and written work.', 'https://i.imgur.com/IE1JQhm.jpg', 'XEZWNRs5RMU', 'medium, average, good', '2017-12-18'),
('CO2', 'CA8', 'English for Elementary', 0, 'This is a elementary course is designed to develop listening and oral communication skills and build the confidence of elementary-level students. Regular small-group and individual speaking and listening practice help students feel confident in discussing activities such as travel, money, and health. The lessons are based on realistic conversations and task-based listening sections.', 'https://i.imgur.com/OzLpJug.jpg', 'sv3_1JIaIiw', 'poor, medium, bad', '2017-10-28'),
('CO3', 'CA8', 'English for Intermediate', 0, 'This intermediate-level course develops students linguistic understanding at an intermediate level by focusing on the language functions required for everyday life activities. Regular speaking and listening practice helps students feel confident in activities such as shopping, ordering in a restaurant, and arranging to meet a friend. The lessons are based on realistic conversations and task-based listening sections.', 'https://i.imgur.com/zHkzwkR.jpg', '_yfBFwCxPWw', 'average, good, medium', '2017-10-28'),
('CO4', 'CA8', 'English for Advanced', 0, 'This academic preparation course is designed for advanced level students.  In this course, students learn strategies for listening, note-taking, and discussing topics in academic settings.  Students listen to authentic lectures and learn how to organize and synthesize information efficiently.  Students also learn strategies for improving discussion skills and improving listening comprehension.', 'https://i.imgur.com/h7AwktD.jpg', 'DrSC_iAsnfc', 'excellent, good', '2017-10-28'),
('CO5', 'CA1', 'Daily English Conversation', 0, 'Communicate in short routine conversations about needs and familiar day-to-day topics. Ask and respond to simple and familiar questions. Describe a situation, tell a simple story, and describe the process of obtaining basic goods and/or services using a variety of short sentences. Read a simple 2-3 paragraph passage about daily life and experience. Write simple descriptions of events, stories, future plans, or other familiar topics. Effectively communicate in writing ideas and information about personal experience and everyday needs.', 'https://i.imgur.com/afkIgQh.jpg', 'sGbG1yOtvSk', 'easy, poor, bad', '2017-10-28'),
('CO6', 'CA1', 'Short English Conversation', 0, 'This is an introductory intermediate-level course to the reading and writing of short stories. Students read short stories that expand their vocabulary and serve as guides for when they write their own short stories. Students learn about the writing process and the elements of short stories, such as plot, setting, and character development.', 'https://i.imgur.com/C5mkLqU.jpg', 'NV3HFugHGHg', 'medium, poor, average ', '2017-10-28'),
('CO7', 'CA1', 'Advanced English Conversation', 0, 'This advanced-level course is designed for the academic preparation of advanced students. In this course, students learn about various parts of speech and their uses in informal conversation, as well as in formal writing. Students show understanding and mastery of materials by completing speaking, listening and writing exercises from the textbook and by completing occasional writing samples.', 'https://i.imgur.com/L3B7ScL.jpg', 'vBkqn0RpbUk', 'good, excellent', '2017-10-28'),
('CO8', 'CA2', 'English at Work', 0, 'Are you looking for work. Do you want a job? Would you want to work at Tip Top Trading? Watch this new animated course and learn some of the language and etiquette that you need, not just to get a job but to be the top dog, big boss, head honcho, big wig....', 'https://i.imgur.com/2aVYW6t.jpg', 'KN2jyw6D1ak', 'average, good, excellent', '2017-12-18'),
('CO9', 'CA2', 'Job Interviews in America', 0, 'Learn how to prepare for a job interview in America. Study common questions and practice and prepare you answers for a successful job interview. Make sure to practice for interviews. There is a lot of thing you can do to be prepared for your job interviews.', 'https://i.imgur.com/8zyrPtG.jpg', 'yBtMwyQFXwA', 'average, good, excellent', '2017-12-18');

-- --------------------------------------------------------

--
-- Table structure for table `first_quiz_questions`
--

CREATE TABLE IF NOT EXISTS `first_quiz_questions` (
  `quiz_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `optionA` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `optionB` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `optionC` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `first_quiz_questions`
--

INSERT INTO `first_quiz_questions` (`quiz_id`, `content`, `optionA`, `optionB`, `optionC`, `answer`) VALUES
(1, 'Your new motorbike looks amazing. You can ____ if you like.', 'fill it out', 'try it out', 'rub it out', 'try it out'),
(2, 'Susan had lunch with ____ yesterday. They went to a new Italian restaurant in town.', 'a friend of her own', 'a friend of she', 'a friend of hers', 'a friend of hers'),
(4, 'If you are looking for ____ on where to visit while you are here, please ask our staff at reception.', 'informations', 'an information', 'information', 'information'),
(5, 'I ____ go to David''s wedding in May. I''ll be on holiday.', 'couldn''t', 'won''t be able to', 'mustn''t', 'won''t be able to'),
(6, '____ Trisha to the party, but I forgot.', 'I was going to invite', 'I''m going to invite', 'I shall invite', 'I was going to invite'),
(7, '____ the director of his own company, my brother has to work very hard.', 'Being', 'He was', 'Having been', 'Being'),
(8, 'Don''t talk to him while you''re still angry. Wait until you''ve ____', 'cut down', 'calmed down', 'slowed down', 'calmed down'),
(9, 'That must be a good book. You ____ it since 9 o''clock this morning.', 'have read', 'have been reading', 'read', 'have been reading'),
(10, 'The party ___ until late into the night.', 'went on', 'kept on', 'got on', 'went on'),
(11, 'Jane and Thomas went to the theatre and saw ____ play last night.', 'a quite exciting', 'quite an exciting', 'pretty an exciting', 'quite an exciting'),
(12, '____ I have lived all my life, is over two hundred years old.', 'This house, where', 'This house where', 'This house which', 'This house, where'),
(13, 'A friend is going to the market. You need some fruit, so you ask him: ''Do you think you ____ get me a kilo of oranges and some bananas, please?''', 'can', 'could', 'may', 'could'),
(14, 'The only survivor of the traffic accident was ____ who was taken to the hospital.', 'injured woman', 'an injured', 'an injured woman', 'an injured woman'),
(15, 'Do you have ____ tomato juice?', 'many', 'any', 'a few', 'any'),
(16, 'Have you seen my ____ bag?', 'small brown leather', 'leather small brown', 'brown leather small', 'small brown leather'),
(17, 'A diamond necklace ____ to a famous actress was stolen from a hotel room last night.', 'belonged', 'belongs', 'belonging', 'belonging'),
(18, '____ it was made with very little money, the film was extremely successful.', 'Despite', 'Despite the fact that', 'In spite of', 'Despite the fact that'),
(19, '____ after your dog while you''re on holiday next week?', 'Who looks', 'Who''s looking', 'Who will have looked', 'Who''s looking'),
(20, 'When I looked outside I noticed there were lots of birds ____ the garden.', 'in', 'at', 'on', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `first_quiz_results`
--

CREATE TABLE IF NOT EXISTS `first_quiz_results` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) DEFAULT NULL,
  `rank` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `first_quiz_results`
--

INSERT INTO `first_quiz_results` (`email`, `score`, `rank`, `date`) VALUES
('test@gmail.com', 0, 'BAD', '2017-12-28'),
('test@gmail.com', 0, 'BAD', '2017-12-28'),
('test@gmail.com', 2, 'POOR', '2017-12-28'),
('test@gmail.com', 2, 'POOR', '2017-12-28'),
('thanhtutdt96@gmail.com', 6, 'AVERAGE', '2017-12-28'),
('test@gmail.com', 0, 'BAD', '2017-12-28');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE IF NOT EXISTS `lessons` (
  `lesson_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` time NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` FLOAT DEFAULT 0 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`lesson_id`, `lesson_name`, `course_id`, `duration`, `link`, `lesson_number`) VALUES
('L1', 'Greetings', 'CO1', '00:08:45', 't3cdNkLo4aY', 'Lesson 1'),
('L10', 'First Snow Fall', 'CO2', '00:01:07', 'sv3_1JIaIiw', 'Lesson 1'),
('L11', 'Jessica''s First Day of School', 'CO2', '00:01:49', 'S5pNpp4fkLA', 'Lesson 2'),
('L12', 'My Flower Garden', 'CO2', '00:00:59', 'BaUX0mjoAt8', 'Lesson 3'),
('L13', 'Going Camping', 'CO2', '00:01:07', 'IhrNcMX6ed0', 'Lesson 4'),
('L14', 'My House', 'CO2', '00:01:11', 'PEN_PiDv7lI', 'Lesson 5'),
('L15', 'I Want to Dye my Hair Green', 'CO3', '00:02:00', '_yfBFwCxPWw', 'Lesson 1'),
('L16', 'Why Do People Dislike Other People?', 'CO3', '00:01:53', 'VH29bOnDcWE', 'Lesson 2'),
('L17', 'Louis Pasteur', 'CO4', '00:03:15', 'DrSC_iAsnfc', 'Lesson 1'),
('L18', 'Psychology', 'CO4', '00:03:29', 'Vod9kFJacKo', 'Lesson 2'),
('L19', 'Corruption', 'CO4', '00:02:53', '17YqvCRzgsM', 'Lesson 3'),
('L2', 'Introductions', 'CO1', '00:10:10', 'Aas0-1a4dlw', 'Lesson 2'),
('L20', 'Canada : Provinces and Territories', 'CO4', '00:04:20', 'FVtHUmYY6v8', 'Lesson 4'),
('L21', 'Two Great Artists', 'CO4', '00:03:25', '20F1_kOfTrU', 'Lesson 5'),
('L22', 'Where are you from?', 'CO5', '00:00:29', 'sGbG1yOtvSk', 'Lesson 1'),
('L23', 'Do you speak English?', 'CO5', '00:00:26', 'TSuXbuA0T48', 'Lesson 2'),
('L24', 'What''s your name?', 'CO5', '00:00:30', 'BvWVb7Optl8', 'Lesson 3'),
('L25', 'Asking directions', 'CO5', '00:00:50', 'NY7nfbTY2Q0', 'Lesson 4'),
('L26', 'I''m hungry', 'CO5', '00:00:34', 'g3DkoiBXiLE', 'Lesson 5'),
('L27', 'Do you want something to drink?', 'CO5', '00:00:33', 'WK_ZbcO2u54', 'Lesson 6'),
('L28', 'That''s too late', 'CO5', '00:00:40', 'PXXvz11ib0A', 'Lesson 7'),
('L29', 'Choosing a time to meet', 'CO5', '00:00:49', 'uXoVA2vERmM', 'Lesson 8'),
('L3', 'Gratitude', 'CO1', '00:11:39', 'pPDhKs5NiL8', 'Lesson 3'),
('L30', 'Part 1', 'CO6', '00:07:25', 'NV3HFugHGHg', 'Lesson 1'),
('L31', 'Part 2', 'CO6', '00:10:25', 'Mx3JntqOxd0', 'Lesson 2'),
('L32', 'Part 3', 'CO6', '00:10:30', 'PFZYHdd7jDE', 'Lesson 3'),
('L33', 'Part 4', 'CO6', '00:11:59', '_xLsB3aGQhU', 'Lesson 4'),
('L34', 'University Conversation', 'CO7', '00:01:20', 'vBkqn0RpbUk', 'Lesson 1'),
('L35', 'Studying For Exam', 'CO7', '00:01:59', 'H0ziWyTLd_c', 'Lesson 2'),
('L36', 'Roommates', 'CO7', '00:01:23', '_hkIVzHTDek', 'Lesson 3'),
('L37', 'How to prepare for an interview', 'CO8', '00:04:35', 'KN2jyw6D1ak', 'Lesson 1'),
('L38', 'Answering interview questions', 'CO8', '00:03:50', 'sj-dX3fZmq0', 'Lesson 2'),
('L39', 'Making suggestions is easy', 'CO8', '00:04:30', '2zyca6fGo4A', 'Lesson 3'),
('L4', 'Apologies', 'CO1', '00:11:00', 'UIgUKy6TWm4', 'Lesson 4'),
('L40', 'Introduce yourself and make some friends', 'CO8', '00:04:01', '1AmS9h8g3E4', 'Lesson 4'),
('L41', 'Make polite requests', 'CO8', '00:04:01', 'QWBwCoecvkM', 'Lesson 5'),
('L42', 'How to offer help', 'CO8', '00:03:45', 'NzYxS_Xy0oM', 'Lesson 6'),
('L43', 'Saying you''re sorry', 'CO8', '00:04:19', 'J3ovfjbQtnI', 'Lesson 7'),
('L44', 'Saying ''well done!''', 'CO8', '00:04:24', 'HN5akpqjm9Q', 'Lesson 8'),
('L45', 'Checking information', 'CO8', '00:04:15', 'tAR4AJgJIrs', 'Lesson 9'),
('L46', 'Disagreeing', 'CO8', '00:03:58', 'F5h3tLtgVrI', 'Lesson 10'),
('L47', 'How to Interview for a Job Part 1', 'CO9', '00:07:04', 'yBtMwyQFXwA', 'Lesson 1'),
('L48', 'How to Interview for a Job Part 2', 'CO9', '00:07:31', 'iZQnhUYEPoY', 'Lesson 2'),
('L49', 'How to Interview for a Job Part 3', 'CO9', '00:06:40', '3xywXO-VHCg', 'Lesson 3'),
('L5', 'Departure and Farewell', 'CO1', '00:10:00', 'imhMU_VN9XY', 'Lesson 5'),
('L50', 'How to Interview for a Job Part 4', 'CO9', '00:06:43', 'To4IJuHYt94', 'Lesson 4'),
('L51', 'How to Interview for a Job Part 5', 'CO9', '00:16:16', 'OTdFPlXfFj4', 'Lesson 5'),
('L52', 'Talking about smartphone', 'CO10', '00:06:21', 'U6hwaIXpy5Y', 'Lesson 1'),
('L53', 'At the electronic store', 'CO10', '00:06:57', 'bpC-EJXr1IU', 'Lesson 2'),
('L54', 'Talking about information technology', 'CO10', '00:07:53', 'DWuCbTTPrew', 'Lesson 3'),
('L55', 'Talking about computer problems', 'CO10', '00:07:44', 'yhQ6hf-dgyE', 'Lesson 4'),
('L56', 'What is your favorite piece of technology', 'CO10', '00:07:14', 'ki7xzyxDlyk', 'Lesson 5'),
('L57', 'Asking for tips on maintaining your computer', 'CO10', '00:08:35', 'Uy7AnDDsbGo', 'Lesson 6'),
('L58', 'Talking about learning on the internet', 'CO10', '00:09:08', 'TWOD-epBGp0', 'Lesson 7'),
('L59', 'Fruit vocabulary', 'CO11', '00:05:06', 'A3eL1ZKbebY', 'Lesson 1'),
('L6', 'Likes and Dislikes', 'CO1', '00:09:30', 'yqn09mz42Gs', 'Lesson 6'),
('L60', '7 Seafood Words To Say CORRECTLY', 'CO11', '00:02:37', 'Rjqw3GHfbR8', 'Lesson 2'),
('L61', 'Pronounce Drinks Vocabulary CORRECTLY', 'CO11', '00:03:21', 'DbFNDNCxM9o', 'Lesson 3'),
('L62', 'Pronounce Fast Food Words CORRECTLY', 'CO11', '00:04:38', 'aYVJjRx9p_w', 'Lesson 4'),
('L63', '11 Herbs To Say CORRECTLY', 'CO11', '00:05:10', 'x7Rxs0aYC7g', 'Lesson 5'),
('L64', 'Nuts Vocabulary To Pronounce CORRECTLY', 'CO11', '00:03:44', '118T9Ihw3uc', 'Lesson 6'),
('L65', 'Pronounce Berries Vocabulary PERFECTLY', 'CO11', '00:02:52', 'uCdzfYKPvgo', 'Lesson 7'),
('L66', 'Food and Drinks Part 1', 'CO12', '00:14:53', 'bHJXsHf4Q6E', 'Lesson 1'),
('L67', 'Food and Drinks Part 2', 'CO12', '00:07:35', 'GTyw2AC_r9c', 'Lesson 2'),
('L68', 'Vegetables', 'CO12', '00:10:37', 'N_eM5Zs5bxc', 'Lesson 3'),
('L69', 'Fruit and Nuts', 'CO12', '00:15:09', 'CaEhhWaR-74', 'Lesson 4'),
('L7', 'Hopes and Dersies', 'CO1', '00:12:50', 'RIxH5TI1V6I', 'Lesson 7'),
('L70', 'Talking Sport - Usain Bolt', 'CO13', '00:02:06', '2zqo2NnNwHc', 'Lesson 1'),
('L71', 'Talking Sport - Shawn Johnson', 'CO13', '00:02:18', 'b9ldlzCiycE', 'Lesson 2'),
('L72', 'Talking Sport - Merlin Diamond', 'CO13', '00:02:17', 'Ga0svRSvrzc', 'Lesson 3'),
('L73', 'Talking Sport - Jessica Ennis', 'CO13', '00:02:33', 'axaIAQmJCLg', 'Lesson 4'),
('L74', 'Talking Sport - Alistair Brownlee', 'CO13', '00:02:22', 'h1vOT1IYw-U', 'Lesson 5'),
('L75', 'Talking Sport - Physiotherapist', 'CO13', '00:02:43', 'a4jXS33aiqQ', 'Lesson 6'),
('L76', 'FOOTBALL Vocabulary', 'CO14', '00:16:03', 'XEZWNRs5RMU', 'Lesson 1'),
('L77', 'Vocabulary & Expressions for POKER and other card games', 'CO14', '00:12:50', 'r1gfifW5F0U', 'Lesson 2'),
('L8', 'Delights and Surprises', 'CO1', '00:15:30', 'guD2CFC5s7c', 'Lesson 8'),
('L9', 'Advice and Suggestions', 'CO1', '00:14:19', 'aqLU173PDSA', 'Lesson 9');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_quiz_questions`
--

CREATE TABLE IF NOT EXISTS `lesson_quiz_questions` (
  `lesson_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `optionA` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `optionB` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `optionC` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quiz_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_quiz_questions`
--

INSERT INTO `lesson_quiz_questions` (`lesson_id`, `content`, `optionA`, `optionB`, `optionC`, `answer`, `quiz_id`) VALUES
('L1', 'I don''t think he will remember the appointment ____ you remember him.', 'when', 'if', 'unless', 'unless', 1),
('L1', 'I met Sam completely ____. He was coming out of the library as I was going in.', 'by mistake', 'by chance', 'on purpose', 'by chance', 2),
('L1', 'It''s time you ____ those old slippers and got a new pair.', 'handed out', 'threw away', 'turned down', 'threw away', 3),
('L1', 'I felt very tired last night ____ I had to worked very hard yesterday.', 'as', 'when', 'although', 'as', 4),
('L1', '____ lock my bicycle to yours. It''ll be safe then.', 'I''d better to', 'I''d better', 'I needn''t', 'I''d better', 5),
('L1', 'Some people think there is life on ____', 'the Mars', 'Mars', 'on planet Mars', 'Mars', 6),
('L1', 'Plastic ____ in millions of products today.', 'is used', 'was used', 'has used', 'is used', 7),
('L1', 'All the items ____ from the house were found and returned.', 'stolen', 'stealing', 'which stolen', 'stolen', 8),
('L1', 'I like Laura, but I ____ invite her to dinner. I''d be too embarrassed.', 'couldn''t', 'needn''t', 'might not', 'couldn''t', 9),
('L1', 'Ben missed his bus stop because he ____ his friend his new mobile phone.', 'was showing', 'showed', 'shows', 'was showing', 10),
('L2', 'When all the guests had gone we were ____ once again.', 'our own', 'by ours', 'by ourselves', 'by ourselves', 11),
('L2', 'Twenty miles ____ but we completed the walk in just four hours.', 'were very far', 'was a long way', 'are too far', 'was a long way', 12),
('L2', 'Those village folk are poor ____ they always seem so contented.', 'though', 'since', 'yet', 'yet', 13),
('L2', '____ he was not interested in music, he agreed to go to the concert.', 'Though', 'While', 'For', 'Though', 14),
('L2', 'He will show us around himself ____ send someone else.', 'and', 'so', 'or', 'or', 15),
('L2', 'John welcomed his guests ____ offered them drinks.', 'and', 'until', 'as', 'and', 16),
('L2', 'All interviews will take place in ____. Please arrive 15 minutes in advance.', 'Room 2', 'the Room 2', 'a Room 2', 'Room 2', 17),
('L2', 'She had an unpleasant experience ____ she was in Thailand.', 'because', 'while', 'but', 'while', 18),
('L2', '____ he is thin, he is strong.', 'As', 'Though', 'Because', 'Though', 19),
('L2', 'Would you like to come to ____ with me on Sunday?', 'National Gallery', 'the National Gallery', 'a National Gallery', 'the National Gallery', 20);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_quiz_results`
--

CREATE TABLE IF NOT EXISTS `lesson_quiz_results` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` text COLLATE utf8mb4_unicode_ci,
  `rank` text COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_quiz_results`
--

INSERT INTO `lesson_quiz_results` (`email`, `lesson_id`, `score`, `rank`, `date`) VALUES
('thanhtutdt96@gmail.com', 'L1', '5', 'AVERAGE', '2017-12-28');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_number` text COLLATE utf8mb4_unicode_ci,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `course_id`, `lesson_number`, `name`, `date`, `title`, `content`) VALUES
('Q1', 'CO1', 'Lesson 1', 'tu', '2017-11-07 07:16:00', 'Need help', 'Help me pls'),
('Q2', 'CO1', 'Lesson 3', 'an', '2017-11-03 08:21:00', 'So great', 'This lesson is fantastic!'),
('Q3', 'CO1', 'Lesson 2', 'tu', '2017-11-13 23:20:18', 'vvvvvvvv', 'vvvvvvvvvv'),
('Q4', 'CO3', 'Lesson 1', 'tu', '2017-11-15 17:40:10', '', 'vvvvv'),
('Q5', 'CO5', 'Lesson 7', 'tu', '2017-12-22 17:30:38', '', 'ETH'),
('Q6', 'CO13', 'Lesson 1', 'thanhtutdt96', '2017-12-28 15:25:52', 'ask', 'Help me!');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `encrypted_password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `name`, `encrypted_password`, `salt`, `created_at`) VALUES
('thanhtutdt96@gmail.com', 'tu', 'R0W9/CyOxTTIVUw3Jyw2ESJD2AxkMzJmNmE2YTc0', 'd32f6a6a74', '2017-10-11 12:52:16'),
('thienanlk@gmail.com', 'ThiÃªn Ã‚n', 'CTiDh+n9i5bcN4T6un7pQqZiad84ZDMwNjQ2NWE2', '8d306465a6', '2017-12-27 21:45:13'),
('thienanlk@yahoo.com', 'ThiÃªn Ã‚n', 'QjOhLya+sUKgUbDt28QL7euy67pmM2RkMWU2YTM1', 'f3dd1e6a35', '2017-12-27 21:45:33'),
('tui@gmail.com', 'An', '4cWaYwoFmBSLdSRRiJUltxbEbuJkOGFiMzQxMThj', 'd8ab34118c', '2017-12-27 21:47:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_courses`
--

CREATE TABLE IF NOT EXISTS `user_courses` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_courses`
--

INSERT INTO `user_courses` (`email`, `course_id`) VALUES
('an@gmail.com', 'CO3'),
('an@gmail.com', 'CO5'),
('test@gmail.com', 'CO1'),
('test@gmail.com', 'CO2'),
('test@gmail.com', 'CO6'),
('test@gmail.com', 'CO7'),
('thanhtutdt96@gmail.com', 'CO1'),
('thanhtutdt96@gmail.com', 'CO13'),
('thanhtutdt96@gmail.com', 'CO2'),
('thanhtutdt96@gmail.com', 'CO3'),
('thanhtutdt96@gmail.com', 'CO6'),
('thanhtutdt96@gmail.com', 'CO8');

-- --------------------------------------------------------

--
-- Table structure for table `user_favorites`
--

CREATE TABLE IF NOT EXISTS `user_favorites` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_favorites`
--

INSERT INTO `user_favorites` (`email`, `course_id`) VALUES
('an@gmail.com', 'CO3'),
('test@gmail.com', 'CO1'),
('test@gmail.com', 'CO5'),
('test@gmail.com', 'CO7'),
('thanhtutdt96@gmail.com', 'CO2'),
('thanhtutdt96@gmail.com', 'CO5');

-- --------------------------------------------------------

--
-- Table structure for table `watched_lessons`
--

CREATE TABLE IF NOT EXISTS `watched_lessons` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lesson_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `watched_lessons`
--

INSERT INTO `watched_lessons` (`email`, `lesson_id`) VALUES
('test@gmail.com', 'L35'),
('thanhtutdt96@gmail.com', 'L1'),
('thanhtutdt96@gmail.com', 'L10'),
('thanhtutdt96@gmail.com', 'L11'),
('thanhtutdt96@gmail.com', 'L12'),
('thanhtutdt96@gmail.com', 'L2'),
('thanhtutdt96@gmail.com', 'L3'),
('thanhtutdt96@gmail.com', 'L4'),
('thanhtutdt96@gmail.com', 'L5'),
('thanhtutdt96@gmail.com', 'L6'),
('thanhtutdt96@gmail.com', 'L7'),
('thanhtutdt96@gmail.com', 'L70'),
('thanhtutdt96@gmail.com', 'L71'),
('thanhtutdt96@gmail.com', 'L72'),
('thanhtutdt96@gmail.com', 'L73'),
('thanhtutdt96@gmail.com', 'L8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `first_quiz_questions`
--
ALTER TABLE `first_quiz_questions`
  ADD PRIMARY KEY (`quiz_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`lesson_id`);

--
-- Indexes for table `lesson_quiz_questions`
--
ALTER TABLE `lesson_quiz_questions`
  ADD PRIMARY KEY (`quiz_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`email`,`course_id`);

--
-- Indexes for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD PRIMARY KEY (`email`,`course_id`);

--
-- Indexes for table `watched_lessons`
--
ALTER TABLE `watched_lessons`
  ADD PRIMARY KEY (`email`,`lesson_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `first_quiz_questions`
--
ALTER TABLE `first_quiz_questions`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `lesson_quiz_questions`
--
ALTER TABLE `lesson_quiz_questions`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
