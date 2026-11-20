-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2026 at 03:36 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scholarship_monitoring_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_records`
--

CREATE TABLE `academic_records` (
  `record_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `semester` varchar(30) NOT NULL,
  `school_year` varchar(20) NOT NULL,
  `general_average` decimal(5,0) NOT NULL,
  `academic_status` enum('good_standing','probation','at_risk','') NOT NULL DEFAULT 'good_standing',
  `remarks` text NOT NULL,
  `recorded_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `academic_records`
--

INSERT INTO `academic_records` (`record_id`, `student_id`, `semester`, `school_year`, `general_average`, `academic_status`, `remarks`, `recorded_by`) VALUES
(1, 1, '1st Semester', '2026-2027', 95, 'good_standing', 'test academic record', 1007);

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `scholarship_id` int(11) NOT NULL,
  `application_date` date NOT NULL,
  `school_year` varchar(20) NOT NULL,
  `application_status` enum('pending','under_review','approved','rejected') NOT NULL DEFAULT 'pending',
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_id`, `student_id`, `scholarship_id`, `application_date`, `school_year`, `application_status`, `remarks`) VALUES
(1, 1, 3, '2026-11-20', '2026-2027', 'under_review', 'your application is currently being review');

-- --------------------------------------------------------

--
-- Table structure for table `application_documents`
--

CREATE TABLE `application_documents` (
  `document_id` int(11) NOT NULL,
  `application_id` int(11) DEFAULT NULL,
  `requirement_id` int(11) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `submission_status` enum('missing','submitted','verified','rejected') NOT NULL DEFAULT 'missing',
  `submitted_at` datetime NOT NULL DEFAULT current_timestamp(),
  `verified_by` int(11) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `application_documents`
--

INSERT INTO `application_documents` (`document_id`, `application_id`, `requirement_id`, `file_path`, `submission_status`, `submitted_at`, `verified_by`, `verified_at`, `remarks`) VALUES
(1, 1, 1, 'uploads/documents/8301852bd67ed2191cb8c8df3084d2bc.png', 'submitted', '2026-11-20 09:56:15', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `disbursements`
--

CREATE TABLE `disbursements` (
  `disbursement_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `disbursement_date` date NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `disbursement_status` enum('pending','released','cancelled') NOT NULL DEFAULT 'pending',
  `remarks` text DEFAULT NULL,
  `recorded_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mock_data`
--

CREATE TABLE `mock_data` (
  `COL 1` varchar(3) DEFAULT NULL,
  `COL 2` varchar(10) DEFAULT NULL,
  `COL 3` varchar(30) DEFAULT NULL,
  `COL 4` varchar(100) DEFAULT NULL,
  `COL 5` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mock_data`
--

INSERT INTO `mock_data` (`COL 1`, `COL 2`, `COL 3`, `COL 4`, `COL 5`) VALUES
('id', 'full_name', 'email', 'username', 'password_hash'),
('1', 'Artus', 'agosforth0@photobucket.com', 'varius ut blandit non interdum in ante vestibulum', '$2a$04$KvXkLbmN1vLa0ZMguUOSNufJwe4RijlwRX.sARz94z3tMwTVaAkWe'),
('2', 'Vernice', 'vcisco1@webmd.com', 'dolor quis odio consequat varius integer ac leo', '$2a$04$0o92ov12uLHYdm12ZKfFf.yPYkYg5uiIfhcUw/9lVen8qBle0mohC'),
('3', 'Stephanie', 'sspatoni2@domainmarket.com', 'quisque erat eros viverra eget congue', '$2a$04$F91Lbz.haO.Ueka/dDobv.LLhD9twDbdw0BUT/6SZJC0p3gh/LlK.'),
('4', 'Maisey', 'mhanley3@yolasite.com', 'nisl duis ac nibh fusce', '$2a$04$VY7BZaCS9wV1siHthM3MS.YW2PcwPl7XQCFC39F43BS1QC2e9CCna'),
('5', 'Douglass', 'dmorse4@squidoo.com', 'dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum', '$2a$04$7u..hjwWksfosoyiDW2ZiOK6ugyarOM.qkB.vlIgub8W1clpaUcpm'),
('6', 'Donelle', 'dwrey5@123-reg.co.uk', 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus', '$2a$04$suTtgHK4Q3i5tgY6MtmAJeKGX..n5sMN7k/dz8YhuOIEwY/U58m7y'),
('7', 'Brandtr', 'btodeo6@spiegel.de', 'sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac', '$2a$04$nGjPjQFIigAlKNId1a8vyOwQhjLb3N3vq5ZJ/6OtC/qdZWltHHtbW'),
('8', 'Walliw', 'wtaylorson7@blogtalkradio.com', 'a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate', '$2a$04$CU.OXNnAR.XcHqqzhYOHqezJg1I4FRwrDUe17WVtDl3hoHE.eGNlm'),
('9', 'Katherine', 'ksaladino8@google.fr', 'pellentesque ultrices mattis odio donec vitae nisi nam', '$2a$04$kxLCobBBhYop9d92gIr2DOvUdzZ4xCDBESl0ueiGrIecWeM84Iqf6'),
('10', 'Carey', 'cbrame9@latimes.com', 'consequat morbi a ipsum integer a nibh in quis justo maecenas', '$2a$04$AOXPlgJSXxApBO3inp2oJegZiU6F5oNSs3Pra4TqiH7jVoc0QakD.'),
('11', 'Ellyn', 'eshrubsalla@mozilla.org', 'lobortis ligula sit amet eleifend pede libero quis orci nullam', '$2a$04$agLDzdacrX6jx8B.yWsXmeD08zpNzfA7ErpjdKg7FMhslIQhOyBiK'),
('12', 'Molly', 'mscottib@ucla.edu', 'at nibh in hac habitasse platea dictumst aliquam', '$2a$04$3pYu0k69BF2MFCY4RVONjusGi.1gC7h36JzrSLbRmVA5NM3eHLIyi'),
('13', 'Denys', 'dbonnierc@ameblo.jp', 'vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit', '$2a$04$SzkTfH6jmlo11rxoQxbio.ap8LOXq9mzh8ZdUR5RFqE0zdJFrfk0e'),
('14', 'Alister', 'adunlead@histats.com', 'vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', '$2a$04$vtlWKswPTxivMiaGPl9eieJiHT0X6D0WIOgmPINTo1wggxrJpZMgK'),
('15', 'Dona', 'dbuxcye@indiegogo.com', 'non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede', '$2a$04$2leb0cuqYD0OaxavqW.ktuuGTAETBoZnXiKLUCbgrOcBBGBse9Coe'),
('16', 'Vince', 'vmardlinf@goodreads.com', 'quam turpis adipiscing lorem vitae', '$2a$04$iTRyRAtESSSoBFt2v5wMDuZlu88ZOoS1ZEZsEOv8/5WPQOVALrnLm'),
('17', 'Gerik', 'gbennerg@deviantart.com', 'pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse', '$2a$04$/Ax1aniNxNd4s/YCi0k0Puq4ZDJKXo3T7jZcSv4AI3PbpFjuxAp5G'),
('18', 'Antoinette', 'ahawsh@twitter.com', 'suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas', '$2a$04$iqzPtKevhyt/SSvS611X6.MX2cA8k7XQ1sxUvPuO5CFdRIfDcAIiS'),
('19', 'Lynea', 'lbrisbanei@java.com', 'non mi integer ac neque', '$2a$04$bpazZIxKJ.NEw1.L0ig2jeYGJWgew3rFYNWVctlGf8mSSfTsykKX.'),
('20', 'Ingrim', 'ifrickej@shareasale.com', 'praesent lectus vestibulum quam sapien varius ut blandit non', '$2a$04$x0/4arY6CzA1gUGf5FGiXuPs2hPKnsRlb30vS7Uf/hRjTThcW/jHW'),
('21', 'Tonia', 'tbuntingk@google.co.jp', 'nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi', '$2a$04$h.jrLGtTR7Ylz2N0vLSU7O0P0YfTepx86Vn/D/gpJCQpVYTs/A.ne'),
('22', 'Khalil', 'kbiddlecombel@yelp.com', 'nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla', '$2a$04$Gxg5P0wmO7nEgtCFlkyiKOjQtoEe9v01eV.Jwz3NeupC7Rxu6CIRi'),
('23', 'Eve', 'efilonm@craigslist.org', 'duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit', '$2a$04$DV7hBWXrgfDLQ0fkh/8eQe/BoFp6wVuj7c214zeH560BRtHgp/HgG'),
('24', 'Addy', 'acerseyn@myspace.com', 'diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna', '$2a$04$I6DF8lYKbAtG7zsFRP6nH.SrfWwfiUrDM9Qi3p2Fzz9OLuyuFz9.6'),
('25', 'Davine', 'ddaultono@zdnet.com', 'condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget', '$2a$04$xLYxL6iYwy/MeYBQdRSjteqTDzkF0hVoW2qShkubVcdNmEH66gOve'),
('26', 'Aggy', 'aginglep@tinypic.com', 'et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc', '$2a$04$3Uoc/XzHMfwfDNljsyv2BOQdbgNRz6vRxqNiPwyc3jYBEL/ZyoojC'),
('27', 'Hunfredo', 'hcossarq@psu.edu', 'consequat morbi a ipsum integer', '$2a$04$fpVXSpnONXs6vym0Y0QvX.UG7MKgc1xpEGPS9ulTJKLUOlTNJgaRK'),
('28', 'Kincaid', 'kraithmillr@freewebs.com', 'faucibus orci luctus et ultrices posuere cubilia curae nulla', '$2a$04$KL.hf1zspuH10A3bebuj2upbpdofolvvGf3V5ukbENCvsE52inMdW'),
('29', 'Hammad', 'htomass@simplemachines.org', 'felis donec semper sapien a libero nam dui', '$2a$04$XyHe4hVb5tDn/Cuq/ZL4c.UvA/RhTKLpfgz1yuZCNUwZIp.oW1uUK'),
('30', 'Aggie', 'aglentwortht@fema.gov', 'in quis justo maecenas rhoncus', '$2a$04$XXkb6164hV.HsWenqwzOouXd4E8w1Sh8dwsmXYFkSE.2UZe40F/4W'),
('31', 'Shir', 'skebbellu@abc.net.au', 'nulla sed vel enim sit amet nunc viverra dapibus', '$2a$04$2ZKqQ/7zhukMLaFGeDSXne4qFaiAsfJJeLVH.tpgCkgdV3rvFYo4y'),
('32', 'Raynor', 'rmacfaulv@yahoo.com', 'magna at nunc commodo placerat', '$2a$04$fP.rukKoUOpGq8gdebA/q.V2EXDPphRHq2ZEx1Gtxd8Q5/Bl.jpdK'),
('33', 'Ara', 'ajoblinw@google.ru', 'molestie hendrerit at vulputate vitae nisl aenean lectus', '$2a$04$FvuDEo2.CBSXxx3rUcs50eX0WHuiokH3XZZFnrBQQF6hhIH4FxFBu'),
('34', 'Daryl', 'dtregalex@yelp.com', 'consectetuer eget rutrum at lorem integer tincidunt', '$2a$04$a77uvd1iX.8qJppN5METruS.QW1/nUGoTmYY47MrjQdpeezURIs0W'),
('35', 'Grethel', 'gwitherdeny@usgs.gov', 'et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat', '$2a$04$gTFPyHXbWcLZyvF5kOt3LeJAC9O/7LC1wL7RnPJHuWOhfFdJReZQ6'),
('36', 'Cordelia', 'ccuttsz@nasa.gov', 'a pede posuere nonummy integer non', '$2a$04$SlCc2TpfoRKhozqi.In0FuZXCvnBZz/aKsPzTF8k0uNDLdqSXXBhW'),
('37', 'Jasper', 'jamberger10@accuweather.com', 'ac neque duis bibendum morbi non quam nec', '$2a$04$IuxOtPdsWSxUW1hEOpRYOO81prBHRaIPzxQA0d5bp8s3Gh9tLtUAe'),
('38', 'Darcey', 'dganiclef11@statcounter.com', 'suscipit ligula in lacus curabitur at ipsum', '$2a$04$2EbQScQERh3FqUDgYsJNXe3lK8d6IFeHeRvTFfGEx2Pm8f9tWTQBu'),
('39', 'Krystalle', 'kikins12@rediff.com', 'dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien', '$2a$04$J4Gn/ioBt5FVQ8h7cPvNLuzsSbJ8sKqbF6LXBz75wqS42.6fipUlC'),
('40', 'Stephani', 'spietron13@cmu.edu', 'lacus at turpis donec posuere metus vitae ipsum aliquam non', '$2a$04$MIFgiyLN6kbwR2M0SHS8DeQxaQ2iYFo7vhlGhXc.7qTOL5b1N0Cqu'),
('41', 'Estella', 'ecamilletti14@msu.edu', 'nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et', '$2a$04$lXUkn4E4JMwEc36teIleTeB2eDylZyFyCZHZtdljh7rYQGt5LsjBy'),
('42', 'Kittie', 'klarman15@addtoany.com', 'non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede', '$2a$04$VHy8Jsx6IDRdwNwNQt6bmOXlT23LVp3VCPI6t5nETwiH6wIsTu.ui'),
('43', 'Jorey', 'jarnefield16@reuters.com', 'pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie', '$2a$04$MgbVoBIbB4b0HVa0Gof24eWQWzKVYzyv9UviB.1CjrRe/MarKhWHC'),
('44', 'Kalil', 'kscaice17@bbb.org', 'in hac habitasse platea dictumst aliquam', '$2a$04$tsFOvCI3ALC3VSk1Q.1uSuB2DK0Jtf7Ng3FZr5Dd12yeuT.ZSU2YW'),
('45', 'Charlot', 'cizzatt18@techcrunch.com', 'curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut', '$2a$04$Su4s398xC.e7kM564i6QyuXYRS6dVdTYik8th1TIuMZXil3d9wsWK'),
('46', 'Thorin', 'tculbert19@sohu.com', 'curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor', '$2a$04$xBpirkADF2lNg.5oBlsAIurBQX9ykieVPfjDP4MlikspKSIi/aoQC'),
('47', 'Paula', 'pmacgall1a@ed.gov', 'quisque ut erat curabitur gravida nisi at', '$2a$04$tYmHsC3Ee04QQfcdi8eeK.mcRi6SQMMqvrnpMdJsdaekA2DrV6Q0y'),
('48', 'Reese', 'rhoolaghan1b@4shared.com', 'vestibulum ante ipsum primis in faucibus orci luctus et', '$2a$04$xDloG1VdfKfaFK37ri606OSu8fjSM7/P2KihrjDWA2VnGww1QGLe6'),
('49', 'Amabelle', 'alubeck1c@businesswire.com', 'ut rhoncus aliquet pulvinar sed nisl nunc', '$2a$04$RnU2OWbCZNRrNrkGqgSmaua9y3Z9At9GHp8AXb3cGV5jQeFjZNki2'),
('50', 'Bette-ann', 'bsteed1d@techcrunch.com', 'pellentesque ultrices phasellus id sapien in sapien iaculis congue', '$2a$04$Z8OHCUeFMu.eR/Rx.cfJ2eiPzXJCdGbjzb7zskeMVMFUIba4cUKB6'),
('51', 'Waldon', 'wpither1e@cnet.com', 'quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante', '$2a$04$oE3cMiWMzDlXghWauOgljuuxTrfoY50jjk1bmOYfiDmNYnCjZ9h8C'),
('52', 'Bondie', 'bbendix1f@163.com', 'vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus', '$2a$04$8rjNl/KBtVO2X101o/DvOuGxunHS6r.XBiGJpvBDEA5gEnFMeabrS'),
('53', 'Darcey', 'dmacdougal1g@furl.net', 'vitae nisi nam ultrices libero non', '$2a$04$02iRCCfbZ/Gcgbuos7i2auRjAvrL.UnTPluM8Q4h3hqolLJKRzqRu'),
('54', 'Starlin', 'smegroff1h@microsoft.com', 'morbi non lectus aliquam sit amet diam', '$2a$04$x1mEVv8mykVB69eRgatzj.fs40a8j72C/7S6y3YQN1.0pg3YvcVd.'),
('55', 'Derrik', 'dmccraine1i@archive.org', 'eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci', '$2a$04$r3FgN8utOztfQiKjyQmNK.OrxQQfUKrWDryQA86fgtDNSh.1VmQzi'),
('56', 'Ema', 'efirpo1j@acquirethisname.com', 'eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit', '$2a$04$UZdOvJcGNSs42kd6jn1zDeSX8FgTXdO.Cif89WafOnwV0hPyawEHS'),
('57', 'My', 'mmcleary1k@flickr.com', 'fusce consequat nulla nisl nunc nisl duis bibendum felis', '$2a$04$tSj9UAiBZiO5ZR7x3rZq7uk3WWtBY/bZW0faTyhzcjYVKIBWDCqYi'),
('58', 'Cart', 'csharnock1l@eepurl.com', 'aenean auctor gravida sem praesent id massa id', '$2a$04$Cj9HnIoti9rQiFEbP.6N6eVhEwMEEV2iAPJkUfFSYNopDM448QHQu'),
('59', 'Erl', 'ewhitfield1m@drupal.org', 'rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis', '$2a$04$w18M4JtHwXXbkOxjKGVHPuhSQxhkSmv2JwNptjLxQLgNK05.8U/wK'),
('60', 'Winslow', 'wfisher1n@vistaprint.com', 'ante vestibulum ante ipsum primis in faucibus orci', '$2a$04$fgcmTiyZMcR/wqw49Rs16uZJBvAwoW7IyLRbVhRJxxyZEEpFg8zgG'),
('61', 'Hadleigh', 'hlangfield1o@yelp.com', 'vestibulum ante ipsum primis in faucibus orci luctus', '$2a$04$neAv4c5U6MEwPTUPY6jowuCN6ryJLz5q1Ao25LD6UuM5UjKqbkfuq'),
('62', 'Viv', 'vrothermel1p@narod.ru', 'congue vivamus metus arcu adipiscing molestie', '$2a$04$C496B1.yO/PknWxPdYOCxuEq7kJ08HloOB0xx8n4vfd.Lph2HtgYi'),
('63', 'Agatha', 'aandriveaux1q@dell.com', 'cras pellentesque volutpat dui maecenas tristique est et', '$2a$04$qSx2UhKycKIqsYrAryA65.X/YX.KX9JlNIMDHuamMg5nM3ixJHVBa'),
('64', 'Esmaria', 'emckernan1r@chronoengine.com', 'sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut', '$2a$04$eGnGmjWfZKVUqKVI8gJTUecEYySdpvTKDzmKnB90ON9AA9sZ1vN2C'),
('65', 'Lewie', 'lflaherty1s@mac.com', 'duis ac nibh fusce lacus purus', '$2a$04$PbD.vsBppbGEvJfG045TB.oH8k/xd5Y.OqLqnTWZWDAJfmcnIPfoe'),
('66', 'Gus', 'gbraznell1t@shinystat.com', 'mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere', '$2a$04$XjEHj.1WRu6EfKgLPSBURu3VKxwt1Ex3NNBW.BP05rJPAu5LgJcIO'),
('67', 'Lewiss', 'lkinneir1u@newsvine.com', 'consectetuer adipiscing elit proin risus praesent lectus vestibulum', '$2a$04$VjeWnEFtzbIjKYZVA6CLFeTe6LV4dEIvcvW/EfpjkRDXXn/8Ra3ja'),
('68', 'Wendie', 'wjosovich1v@desdev.cn', 'rutrum ac lobortis vel dapibus at diam nam tristique tortor', '$2a$04$rIuP3Jzp0WRSZ5inC9NuwOpA4T8QYUBE.BwSQ8vHNsNapQf1MTF4y'),
('69', 'Amber', 'aklaggeman1w@imageshack.us', 'proin risus praesent lectus vestibulum quam sapien varius ut blandit non', '$2a$04$8.kDxzug13tM8hNdRPFpSehNIfRAuN3SEsrBbWLw/hJIY1C6Tmq0K'),
('70', 'Melodee', 'mstanex1x@cnn.com', 'lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit', '$2a$04$flXeGeDKoLMzx3VHNpPsh.VMR0pvbtKdlDSGFHj.CsWLEXH/c8FtS'),
('71', 'Rafaello', 'rchoppin1y@photobucket.com', 'morbi porttitor lorem id ligula', '$2a$04$Tq1H12JkRyo3jBGqI05/AeLfLg1Y6P0apshq0mbX8L1tUtfcT7PZy'),
('72', 'Carley', 'cpaddick1z@tripod.com', 'leo odio porttitor id consequat in consequat', '$2a$04$EgrklvVr8npuc/iGTUOokuBfjXAM2ELy2Q/b26uxc8vQk6u1Kfpj2'),
('73', 'Rinaldo', 'rbayly20@jiathis.com', 'in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla', '$2a$04$0dJPI2usy6fW8wQBfVRcdO.sGX02WmHkHRRfOpdZdv9xrXPGrTMEO'),
('74', 'Tamar', 'tstockwell21@loc.gov', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', '$2a$04$ckDqWRYovCsJAUPmj/CzvOJHsARn3RKTMwA5ypuHppEZdfyjumWpi'),
('75', 'Romonda', 'rstrutt22@linkedin.com', 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris', '$2a$04$gjJc9RWklgi/iviiUtg6m.Y4t115uC5QZ82odeWikDeGZ8ltBh/Tm'),
('76', 'Koren', 'kcurry23@youtube.com', 'pede justo lacinia eget tincidunt eget tempus vel', '$2a$04$ehRcrPajMw4sZUUXWxnrieiHr6K8DQvD2devW63tWVynb8om7.zmS'),
('77', 'Mikel', 'mglanders24@mail.ru', 'eget semper rutrum nulla nunc purus phasellus in felis donec', '$2a$04$3kMMpSks89Dr8quiFBIiguemciXm75pPxZ1Urq4a7S5oCwq3misSC'),
('78', 'Dillie', 'ddeplacido25@amazon.com', 'at dolor quis odio consequat varius integer ac', '$2a$04$hDSE8/0iTBTg8hLAUSATduZ/4yF9S0f/RGclhr0liJXRgEa3fSQoi'),
('79', 'Maisey', 'mbarrim26@people.com.cn', 'blandit nam nulla integer pede justo lacinia eget', '$2a$04$X/9B/Fstcc1EG0tJq8OL1.n1CROv3.I3gs1mNhwmE.qw7NGQpPrp.'),
('80', 'Melisandra', 'mbuckingham27@surveymonkey.com', 'ligula pellentesque ultrices phasellus id sapien', '$2a$04$qXYc/ljiDZiDU/2Evauw6e8/dCFQbnUvQnffVx.LkpGk6DWVA3h9i'),
('81', 'Celina', 'cgolledge28@thetimes.co.uk', 'hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam', '$2a$04$GKVibizuOzgq1GX4nsEBYuZmBXL0YzWigXsKke65LvK6R1My2QgVK'),
('82', 'Denyse', 'drosettini29@dyndns.org', 'id consequat in consequat ut nulla sed accumsan felis ut at dolor', '$2a$04$1QV/uKXsyJd0ml4TsjHgiu2zMtjMbTICjyKk.33q5.rVeLBSE5kF2'),
('83', 'Spence', 'sprestwich2a@ebay.co.uk', 'risus dapibus augue vel accumsan tellus nisi eu orci', '$2a$04$iiGZQ3Z1Uxg50yJtMxwdZOle4Jwna/E7dv0BbvBrq/ncKpsqdGLx2'),
('84', 'Pernell', 'pshedd2b@i2i.jp', 'luctus nec molestie sed justo pellentesque viverra', '$2a$04$oMU7KTuaYFPzaio.u.fWCuT3H905QF2YGx9zbAHgscUVueldriIk2'),
('85', 'Curr', 'cgellert2c@springer.com', 'non mattis pulvinar nulla pede', '$2a$04$LkUGqTagOPKmFwWxPMXn6.2MCHj8o1ZtJSuwbWrONJjNsdJyTgCrO'),
('86', 'Virginie', 'vmcginny2d@wikispaces.com', 'sit amet lobortis sapien sapien non mi integer ac neque', '$2a$04$Hk686nQq8Yaij5BzmypXUuRCQ7xoV8PbnTP6..hpI5kL/A89G8m4m'),
('87', 'Keven', 'kchallen2e@sciencedaily.com', 'integer non velit donec diam neque vestibulum eget vulputate', '$2a$04$fANuI/dXS5Afjhpy2hl/MuEnRmv8bxYdRR.9rcjogRKYcbytbJI6C'),
('88', 'Gleda', 'gsommerton2f@digg.com', 'libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a', '$2a$04$kHJZslqKFteTw/Msvgj7MOBLE8/y9el2H0SZOZjnIbxcfMLKmrmHC'),
('89', 'Jacquelyn', 'jselvey2g@japanpost.jp', 'erat volutpat in congue etiam justo etiam pretium iaculis justo in', '$2a$04$MfVhhx1LJFuttVhIAjRUmOnaDGFPXtoCKZPlM5loItO67jag5cvAG'),
('90', 'Muffin', 'mcamis2h@hud.gov', 'nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi', '$2a$04$pS06YnLJBK/j3w0SSaKIwem5w5c8OqOW2WFy6YeMvezVtDZ0AkCu6'),
('91', 'Pavla', 'pfawdrie2i@acquirethisname.com', 'justo eu massa donec dapibus duis at velit eu est congue elementum', '$2a$04$UL1jM4LD1iMpyKLScQaDCexyl46quW3NVErcxt9D6B26/wA2wv752'),
('92', 'Arlena', 'ahellin2j@mail.ru', 'vehicula consequat morbi a ipsum integer a nibh in quis justo', '$2a$04$YBEwnrsDirCp50Pkwpzw2u7G/ySAqWPmnpoR27Ox4PXJmxOLcX2Oq'),
('93', 'Brander', 'bstoffers2k@google.fr', 'velit donec diam neque vestibulum eget vulputate ut', '$2a$04$k.Vadw6O85CEoqDoeOAyf.5RQCVdcecsObfx0qHRwt8F7lRjpphdy'),
('94', 'Romy', 'rbeagan2l@salon.com', 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non', '$2a$04$xEh8AswMGeJP.XF1CvABCeHe3LTugtdZm/D6j7DD2A1xrQI6DO4.e'),
('95', 'Harlen', 'hstaggs2m@xinhuanet.com', 'primis in faucibus orci luctus', '$2a$04$nWgFDfAN6Tsu9HfuoS5OFOykCCpwp8k3WZ1vZaGQlZF4ckDcWdeM2'),
('96', 'Ram', 'rbentham2n@weather.com', 'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in', '$2a$04$/F.vSgBPJb3.sbT4FjPzW.gb32mN02OJZjmQT3kV/FQaCxQHl1zHa'),
('97', 'Bobinette', 'brainy2o@facebook.com', 'odio justo sollicitudin ut suscipit a feugiat', '$2a$04$SDyo4IMZc.y4.hwoc8Lxge.PuGjquuBnn3zowLIUiRBJWr7k5EZUO'),
('98', 'Keriann', 'ktreadgold2p@chron.com', 'elementum ligula vehicula consequat morbi a ipsum integer', '$2a$04$LcL05xyhcX1k50RFrTmg5uPv3JY0ovZyG//fZN.hrzk5WzkAe8e5C'),
('99', 'Evita', 'eevequot2q@studiopress.com', 'convallis nunc proin at turpis a pede posuere nonummy', '$2a$04$VGsABMp/DQQl9K/ztjG3rOrngLh1EmQ.1mz/mevppiR1nt00Bub7i'),
('100', 'Milty', 'mfrewer2r@trellian.com', 'sollicitudin mi sit amet lobortis sapien sapien non mi integer ac', '$2a$04$5lNNVWd9P0vc8DHHiQIRMeg8q0gJs8J7NFKjok4.Sc8kEkt3O6nA.');

-- --------------------------------------------------------

--
-- Table structure for table `monitoring_logs`
--

CREATE TABLE `monitoring_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_type` varchar(100) NOT NULL,
  `activity_description` text NOT NULL,
  `activity_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monitoring_logs`
--

INSERT INTO `monitoring_logs` (`log_id`, `user_id`, `activity_type`, `activity_description`, `activity_date`) VALUES
(1, 1007, 'Application Status Updated', 'Admin updated application ID 1 to status: under_review', '2026-11-20 02:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `scholarships`
--

CREATE TABLE `scholarships` (
  `scholarship_id` int(11) NOT NULL,
  `scholarship_name` varchar(100) NOT NULL,
  `scholarship_type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `eligibility` text NOT NULL,
  `application_start` date NOT NULL,
  `application_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `scholarships`
--

INSERT INTO `scholarships` (`scholarship_id`, `scholarship_name`, `scholarship_type`, `description`, `amount`, `eligibility`, `application_start`, `application_end`) VALUES
(1, 'Academic Excellence Scholarship', 'Merit Base', 'Financial assistance for students with excellent academic performance', 10000.00, 'Must maintain good academic standing and meet the school\'s scholarship requirements.', '2026-11-20', '2026-12-20'),
(3, 'tulong dunong', 'Merit Base', 'financial assistance', 7500.00, 'poor households', '2026-11-20', '2026-12-20');

-- --------------------------------------------------------

--
-- Table structure for table `scholarship_requirements`
--

CREATE TABLE `scholarship_requirements` (
  `requirement_id` int(11) NOT NULL,
  `scholarship_id` int(11) NOT NULL,
  `requirement_name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `scholarship_requirements`
--

INSERT INTO `scholarship_requirements` (`requirement_id`, `scholarship_id`, `requirement_name`, `description`) VALUES
(1, 3, 'certificate of registration', 'A document showing the student\'s current enrollment. burat');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `student_number` varchar(30) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `year_level` int(11) DEFAULT NULL,
  `school_year` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `user_id`, `student_number`, `first_name`, `last_name`, `middle_name`, `gender`, `birth_date`, `contact_number`, `address`, `course`, `year_level`, `school_year`) VALUES
(1, 1006, '202411234', 'Angel', 'Javinez', NULL, 'Female', '2006-06-22', '09394678063', 'hilltop', 'cs', 3, '2026-2027');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','staff','student') NOT NULL DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `username`, `password_hash`, `role`) VALUES
(1006, 'Angel Javinez', 'johnrielcabezas@gmail.com', 'nighuu', '$2y$12$be5WxPGZAHFUK1vPTMAbZObrlza9m34sbRgubggJ6wV41ZbzwYKBy', 'student'),
(1007, 'princess javinez', 'princessjavinez@gmail.com', 'princess', '$2y$12$kdgSffy5oBFOg9W5.4ahm.Vd/5cUdBjE1EClGZQ7.I3shHe3lLVOu', 'admin'),
(1008, 'caleena j', 'caleena@gmail.com', 'calee', '$2y$12$gxw75hEbCGJCpIqxb3Ziv.dz6jjwsXqg0hqytCbvUnz4Dv6pmdSfO', 'staff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_records`
--
ALTER TABLE `academic_records`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`application_id`);

--
-- Indexes for table `application_documents`
--
ALTER TABLE `application_documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `disbursements`
--
ALTER TABLE `disbursements`
  ADD PRIMARY KEY (`disbursement_id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `monitoring_logs`
--
ALTER TABLE `monitoring_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`scholarship_id`);

--
-- Indexes for table `scholarship_requirements`
--
ALTER TABLE `scholarship_requirements`
  ADD PRIMARY KEY (`requirement_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `student_number` (`student_number`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_records`
--
ALTER TABLE `academic_records`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `application_documents`
--
ALTER TABLE `application_documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `disbursements`
--
ALTER TABLE `disbursements`
  MODIFY `disbursement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `monitoring_logs`
--
ALTER TABLE `monitoring_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `scholarship_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `scholarship_requirements`
--
ALTER TABLE `scholarship_requirements`
  MODIFY `requirement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_records`
--
ALTER TABLE `academic_records`
  ADD CONSTRAINT `academic_records_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
