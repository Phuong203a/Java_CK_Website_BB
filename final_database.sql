-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2023 at 05:53 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(6535) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `sub_category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category`, `description`, `image_url`, `price`, `product_name`, `size`, `sub_category`) VALUES
(1, 'Bánh tráng miệng', '					Thành phần: Sữa tươi, kem sữa, đường, kem thực vật, chất tạo đông gelatine, mứt phúc bồn tử. \n											', '/images/Bánh Pana Cotta.jpg', 25000, 'Bánh Pana Cotta', 'L', 'Panna cotta & Pudding'),
(2, 'Bánh tráng miệng', '\n												Thành phần: Kem sữa, kem thực vật, sữa tươi, đường, trứng gà, chất tạo đông gelatine, sô cô la trắng, bột mỳ, bột trà xanh (1%).Hạn sử dụng: 4 ngày kể từ ngày sản xuấtBảo quản: 2-5 độ\n', '/images/Mousse Trà Xanh.jpg', 31000, 'Mousse Trà Xanh', 'S', 'Bánh mousse'),
(3, 'Bánh tráng miệng', '\n												Thành phần: Kem sữa, kem thực vật, đường, phô mai kem, nước, trứng gà, chanh leo (4,5%), chất tạo đông gelatine, bột mỳ.Hạn sử dụng: 4 ngày kể từ ngày sản xuấtBảo quản; 2-5 độ\n', '/images/Mousse Chanh Leo.jpg', 31000, 'Mousse Chanh Leo', 'S', 'Bánh mousse'),
(4, 'Bánh tráng miệng', '\n												Thành phần: Sữa tươi, sữa chua cái, đường, sữa đặc, kem sữa.\n											', '/images/Sữa Chua.jpg', 13000, 'Sữa Chua', 'M', 'Sữa chua'),
(5, 'Bánh tráng miệng', '\n', '/images/Tiramisu.jpg', 22000, 'Tiramisu', 'M', 'Sữa chua'),
(6, 'Bánh tráng miệng', '\n', '/images/Caramen.jpg', 13000, 'Caramen', 'M', 'Sữa chua'),
(7, 'Bánh tráng miệng', '\n												Thành phần: Bột mỳ, đường, trứng, bơ, cà phê, bột hạnh nhân, rượu Kahlua, kem bơ cà phê, socola ganache, socola trang tríHạn sử dụng: 4 ngày kể từ ngày sản xuấtNhiệt độ: 2-5 độ\n', '/images/Bánh Opera 90G.jpg', 36000, 'Bánh Opera 90G', 'L', 'Bánh miếng'),
(9, 'Bánh tráng miệng', '\n												Thành phần: Phô mai kem, trứng, bột hạnh nhân, cà phê, rượu Kahlua, bơ, kem tươi, cacao, bánh quy, đường, hương vani tổng hợp, chất tạo đông gelatin, nước.Hạn sử dụng: 4 ngày kể từ ngày sản xuấtBảo quản: 2-5 độ\n', '/images/Bánh Tiramisu 90G.jpg', 36000, 'Bánh Tiramisu 90G', 'L', 'Bánh miếng'),
(10, 'Bánh theo mùa', '\n												Thành phần: Bánh gato vani 5 lớp, nhân kem tươi, 1 lớp nhân cocktail hoa quả, trang trí sô cô la, hạnh nhân, lá hương thảo, quả tầm bóp.\n											', '/images/Bánh Kem Christmas Time 8.jpg', 350000, 'Bánh Kem Christmas Time 8', 'M', 'Bánh Kem Noel'),
(11, 'Bánh theo mùa', '\n												Thành Phần: Bánh gato cuộn vani, nhân kem tươi, 1 lớp nhân cocktail hoa quả, trang trí sô cô la, hạnh nhân, lá hương thảo, cam sấy khô.\n											', '/images/Bánh Kem Joy Of Christmas 8.jpg', 350000, 'Bánh Kem Joy Of Christmas 8', 'S', 'Bánh Kem Noel'),
(12, 'Bánh theo mùa', '\n												Thành phần: Bánh gato cuộn vani, nhân kem tươi, 1 lớp nhân cocktail hoa quả, trang trí sô cô la, quả tầm bóp.\n											', '/images/Bánh Kem Yule Log 8.jpg', 350000, 'Bánh Kem Yule Log 8', 'S', 'Bánh Kem Noel'),
(13, 'Bánh theo mùa', '\n												Thành Phần: Bột mỳ, bơ, đường, trứng gà, hạt macca (3,5%), sô cô la chíp trắng, bột làm bánh custard, muối, chất tạo xốp (E500ii, E450i, E341i).\n											', '/images/Bánh Quy Hạt Mắc Ca.jpg', 80000, 'Bánh Quy Hạt Mắc Ca', 'M', 'Bánh quy Tết'),
(14, 'Bánh theo mùa', '\n												Thành phần: Bột mỳ, bơ, đường, trứng gà, hạt dẻ cười (4,4%), bột làm bánh custard, muối, chất tạo xốp (E500ii, E450i, E341i).\n											', '/images/Bánh Quy Hạt Dẻ Cười.jpg', 80000, 'Bánh Quy Hạt Dẻ Cười', 'M', 'Bánh quy Tết'),
(15, 'Bánh theo mùa', '\n												Thành phần: Bột mỳ, bơ, đường, trứng gà, hạt óc chó (5,3%), bột làm bánh custard, muối, chất tạo xốp (E500ii, E450i, E341i).\n											', '/images/Bánh Quy Hạt Óc Chó.jpg', 80000, 'Bánh Quy Hạt Óc Chó', 'S', 'Bánh quy Tết'),
(16, 'Bánh theo mùa', '\n												Thành phần : - Bánh quy hạnh nhân 110g- Bánh quy bơ mứt dâu 120g- Bánh quy sô cô la chip 120g- Bánh quy dừa 110g- Nho khô đen (Black Raisin) 120g\n', '/images/Set Quà Dòng Chảy Hạnh Phúc.jpg', 390000, 'Set Quà Dòng Chảy Hạnh Phúc', 'M', 'Bánh quy Tết'),
(17, 'Bánh theo mùa', '\n												Thành phần:- Bánh quy hạnh nhân 100g- Bánh quy hạt óc chó 100g- Bánh quy hạt macca 100g- Bánh quy hạt dẻ cười 100g\n', '/images/Set Quà Lời Ru Mùa Xuân.jpg', 290000, 'Set Quà Lời Ru Mùa Xuân', 'S', 'Bánh quy Tết'),
(18, 'Bánh theo mùa', '\n												Thành phần:- Bánh quy hạnh nhân 100g- Bánh quy hạt óc chó 100g- Bánh quy hạt macca 100g- Bánh quy hạt dẻ cười 100g- Nam việt quất khô (Dried Cranberries) 120g- Nho khô đen (Black Raisin) 120g- Hồng trà Ceylon (Ceylon black tea) 100g\n', '/images/Set Quà Vũ Khúc Hạt Vàng.jpg', 590000, 'Set Quà Vũ Khúc Hạt Vàng', 'M', 'Bánh quy Tết'),
(19, 'Bánh theo mùa', '\n												Thành phần: Bột mỳ, bơ, đường, trứng gà, yến mạch (6,5%), bột làm bánh custard, muối, chất tạo xốp (E500ii, E450i, E341i).\n											', '/images/Bánh Quy Yến Mạch.jpg', 80000, 'Bánh Quy Yến Mạch', 'L', 'Bánh quy Tết'),
(20, 'Bánh khô', '\n												Thành phần: Bột mỳ, bơ, đường, sữa tươi, sữa bột, trứng gà, vừng trắng, muối, chất tạo xốp (E500ii), men.Hạn sử dụng: 8 ngày kể từ ngày sản xuất\n', '/images/Bánh Sừng Bò Mini.jpg', 36000, 'Bánh Sừng Bò Mini', 'S', 'Bánh sừng bò mini'),
(21, 'Bánh khô', '\n												Thành phần: Bột mì, trứng gà, bơ, đường, đường fructose, bột dừa (7%), hương vani tổng hợp.\n											', '/images/Bánh Quy Dừa.jpg', 42000, 'Bánh Quy Dừa', 'S', 'Bánh quy'),
(22, 'Bánh khô', '\n												Thành phần: Bột mỳ, bơ (306%), đường, trứng, mứt dâu (5,1%).\n											', '/images/Bánh Quy Bơ Mứt Dâu.jpg', 42000, 'Bánh Quy Bơ Mứt Dâu', 'S', 'Bánh quy'),
(23, 'Bánh khô', '\n												Thành phần: Bột mỳ, đường, bơ, sô cô la chíp (12 %), trứng gà, chất tạo xốp (E500ii), muối. \n											', '/images/Bánh Quy Socola Chip.jpg', 42000, 'Bánh Quy Socola Chip', 'S', 'Bánh quy'),
(24, 'Bánh khô', '\n												Thành phần: Bột mỳ, trứng gà, đường, hạnh nhân cắt lát (14%), bơ, sữa bột, chất tạo xốp (E500ii, E450i, E341i), muối, hương vani tổng hợp.\n											', '/images/Bánh Quy Hạnh Nhân.jpg', 42000, 'Bánh Quy Hạnh Nhân', 'L', 'Bánh quy'),
(25, 'Bánh khô', '\n												Thành phần: Trứng, bột mì, đường, muối, hương vinilla\n											', '/images/Bánh Lady Finger.jpg', 42000, 'Bánh Lady Finger', 'L', 'Bánh quy'),
(26, 'Bánh khô', '\n												Thành phần: Bột mì, nước, bơ (17%), kem sữa, đường, rong biển (0.3%), men, muối, bột canh tôm, chất ổn định (E516), chất nhũ hóa (E322i), chất xử lý bột (E300 E1100i)Túi 52gNăng lượng: 507 KcalBảo quản sản phẩm: Nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.Lưu ý: Tiếp xúc với không khí sẽ ảnh hưởng tới độ giòn của sản phẩm, vui lòng đóng kín miệng bao bì sau khi mở.\n', '/images/Bánh Mì Nướng Rong Biển.jpg', 15000, 'Bánh Mì Nướng Rong Biển', 'S', 'Bánh mì nướng'),
(27, 'Bánh khô', '\n												Thành phần: Bột mì, nước, sữa tươi, bơ, đường, đường caramen (9,5%), men, muối, chất ổn định (E516), chất nhũ hóa (E322i), chất xử lý bột (E300 E1100i)Túi 52g Năng lượng: 385,7 KcalBảo quản sản phẩm: Nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.Lưu ý: Tiếp xúc với không khí sẽ ảnh hưởng tới độ giòn của sản phẩm, vui lòng đóng kín miệng bao bì sau khi mở.\n', '/images/Bánh Mì Nướng Caramen.jpg', 15000, 'Bánh Mì Nướng Caramen', 'S', 'Bánh mì nướng'),
(28, 'Bánh khô', '\n												Thành phần: Bột mì, nước, phô mai bột (4%), dầu, thực vật, men, bánh, muối, chất ổn định (E516), chất nhũ hóa (E322i), chất xử lý bột (E300 E1100i)Túi 52g Năng lượng: 405 KcalBảo quản sản phẩm: Nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.Lưu ý: Tiếp xúc với không khí sẽ ảnh hưởng tới độ giòn của sản phẩm, vui lòng đóng kín miệng bao bì sau khi mở.\n', '/images/Bánh Mì Nướng Phô Mai Que.jpg', 15000, 'Bánh Mì Nướng Phô Mai Que', 'M', 'Bánh mì nướng'),
(29, 'Bánh khô', '\n												Thành phần: Bột mì, nước, bơ (17%), kem sữa, tỏi (1,8%), đường, men, muối, chất ổn định (E516), chất nhũ hóa (E322i), chất xử lý bột (E300 E1100i)Túi 52g Năng lượng: 483 KcalBảo quản sản phẩm: Nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.Lưu ý: Tiếp xúc với không khí sẽ ảnh hưởng tới độ giòn của sản phẩm, vui lòng đóng kín miệng bao bì sau khi mở.\n', '/images/Bánh Mì Nướng Bơ Tỏi.jpg', 15000, 'Bánh Mì Nướng Bơ Tỏi', 'L', 'Bánh mì nướng'),
(30, 'Bánh khô', '\n												Thành phần: Bột mì, nước, bơ, kem sữa, sốt pizza (7%), hành tây, đường, phô mai bột, lá kinh giới khô, ớt bột, men, muối, bột canh tôm, chất ổn định (E516), chất nhũ hóa (E322i), chất xử lý bột (E300 E1100i)Túi 52g Năng lượng: 506 KcalBảo quản sản phẩm: Nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.Lưu ý: Tiếp xúc với không khí sẽ ảnh hưởng tới độ giòn của sản phẩm, vui lòng đóng kín miệng bao bì sau khi mở.\n', '/images/Bánh Mì Nướng Sốt Pizza.jpg', 15000, 'Bánh Mì Nướng Sốt Pizza', 'L', 'Bánh mì nướng'),
(31, 'Bánh khô', '\n												Bột hạnh nhân, đường, lòng trắng trứng, sô cô la, sữa tươi, cam vàng, chanh vàng, chanh leo, mứt mơ, mứt dâu, trà bá tước, trà xanh, mè đen, gelatin, quả vani, hương bạc hà, màu thực phẩm.\n											', '/images/Hộp Bánh Macaron.jpg', 99000, 'Hộp Bánh Macaron', 'L', 'Bánh Macaron'),
(32, 'Bánh kem', '\n												Thành phần: Bánh kem tươi cốt bánh 5 lớp chiffon sô cô la chip, kem nhân phô mai, trang trí cam sấy, sô cô la và bông đường bi bạc.\n											', '/images/Bánh Kem Forever Love.jpg', 380000, 'Bánh Kem Forever Love', 'L', 'Bánh sinh nhật'),
(33, 'Bánh kem', '\n												Thành phần:Bánh kem tươi cốt bánh 6 lớp chiffon hoa quả khô, nhân kem tươi, trang trí hoa kem tươi.\n											', '/images/Bánh Kem Pink Floral.jpg', 320000, 'Bánh Kem Pink Floral', 'L', 'Bánh sinh nhật'),
(34, 'Bánh kem', '\n												Thành phần: Bánh kem tươi cốt bánh 3 lớp chiffon phô mai, trang trí hoa quả tươi.\n											', '/images/Bánh Kem Tasty Love.jpg', 150000, 'Bánh Kem Tasty Love', 'L', 'Bánh sinh nhật'),
(35, 'Bánh kem', '\n												Thành phần: Bánh kem tươi cốt bánh 3 lớp chiffon sô cô la chip, kem nhân phô mai, phủ ganat đen và trang trí sô cô la màu.\n											', '/images/Bánh Kem Amazing Chocolate.jpg', 380000, 'Bánh Kem Amazing Chocolate', 'S', 'Bánh sinh nhật'),
(36, 'Bánh kem', '\n												Thành phần: Bánh kem tươi cốt bánh 3 lớp chiffon caramen, trang trí kem tươi.\n											', '/images/Bánh kem Kiss me more.jpg', 150000, 'Bánh kem Kiss me more', 'L', 'Bánh sinh nhật'),
(37, 'Bánh kem', '\n												Bánh mousse dừa, cốt bánh 1 lớp chiffon caramen, mặt bánh phủ jelly caramen và trang trí sô cô la\n											', '/images/Bánh Kem Mousse Hawaii.jpg', 390000, 'Bánh Kem Mousse Hawaii', 'L', 'Bánh sinh nhật'),
(38, 'Bánh kem', '\n												Bánh mousse chanh leo, cốt bánh 1 lớp chiffon phô mai, trang trí socola và mứt chuối.\n											', '/images/Bánh Passion Fruit Mousse.jpg', 390000, 'Bánh Passion Fruit Mousse', 'L', 'Bánh sinh nhật'),
(39, 'Bánh kem', '\n												Bánh kem tươi cốt bánh 4 lớp chiffon phô mai, nhân kem phô mai, trang trí sô cô la màu.\n											', '/images/Bánh Kem Blue Ocean.jpg', 320000, 'Bánh Kem Blue Ocean', 'S', 'Bánh sinh nhật'),
(40, 'Bánh kem', '\n												Bánh kem tươi cốt bánh 4 lớp chiffon phô mai, nhân kem phô mai, trang hoa kem tươi\n											', '/images/Bánh Kem Rosie Love.jpg', 380000, 'Bánh Kem Rosie Love', 'L', 'Bánh sinh nhật'),
(41, 'Bánh kem', '\n												Bánh kem tươi cốt bánh 4 lớp chiffon sô cô la chip, nhân kem tươi, trang trí socola màu.\n											', '/images/Bánh Kem Sweet Love.jpg', 320000, 'Bánh Kem Sweet Love', 'L', 'Bánh sinh nhật'),
(42, 'Bánh kem', '\n												Bánh kem tươi cốt bánh 3 lớp chiffon vani, nhân cocktail hoa quả khô, trang trí kem tươi. \n											', '/images/Bánh Kem Endless Love.jpg', 380000, 'Bánh Kem Endless Love', 'L', 'Bánh sinh nhật'),
(43, 'Bánh kem', '\n												Bánh kem tươi cốt bánh 5 lớp chiffon hoa quả khô hỗn hợp, nhân kem tươi, trang trí hoa kem tươi. \n											', '/images/Bánh kem Flower Of Love.jpg', 320000, 'Bánh kem Flower Of Love', 'S', 'Bánh sinh nhật'),
(44, 'Bánh kem', '\n												Bánh mousse xoài, cốt bánh 1 lớp chiffon phô mai, kem tươi và xoài tươi, mặt bánh trang trí hoa kem tươi.\n											', '/images/Bánh Mousse Mango.jpg', 390000, 'Bánh Mousse Mango', 'M', 'Bánh sinh nhật'),
(45, 'Bánh kem', '\n												Bánh kem tươi cốt bánh 3 lớp, chiffon vani, nhân cocktail hoa quả, trang trí hoa kem tươi.\n											', '/images/Bánh Kem Princess.jpg', 380000, 'Bánh Kem Princess', 'S', 'Bánh sinh nhật'),
(46, 'Bánh kem', '\n												Bánh kem tươi cốt bánh 4 lớp chiffon sô cô la chip, kem nhân phô mai, trang trí sô cô la.\n											', '/images/Bánh Kem Chocolate Love.jpg', 320000, 'Bánh Kem Chocolate Love', 'M', 'Bánh sinh nhật'),
(47, 'Bánh kem', '\n												Thành phần: Bánh kem tươi cốt bánh 3 lớp chiffon caramen, trang trí ganache caramen, macaron và sô cô la.\n											', '/images/Bánh Kem Sweet Heart 4.jpg', 150000, 'Bánh Kem Sweet Heart 4', 'M', 'Bánh sinh nhật'),
(48, 'Bánh kem', '\n												Bánh kem tươi cốt bánh 4 lớp chiffon phô mai, nhân kem phô mai, trang hoa kem tươi\n											', '/images/Bánh Kem LiLy Garden.jpg', 380000, 'Bánh Kem LiLy Garden', 'S', 'Bánh sinh nhật'),
(49, 'Bánh kem', '\n												Thành phần: Bánh kem tươi cốt bánh 3 lớp chiffon sô cô la chip, kem nhân phô mai, phủ ganat và trang trí sô cô la trắng.\n											', '/images/Bánh Kem Chocolate Lover.jpg', 380000, 'Bánh Kem Chocolate Lover', 'S', 'Bánh sinh nhật'),
(50, 'Bánh kem', '\n												Bánh mousse socola, cốt bánh 1 lớp chiffon sô cô la chip, sốt sô cô la phủ mặt bánh, trang trí sô cô la và bi bông đường\n											', '/images/Bánh Mousse Chocolate.jpg', 390000, 'Bánh Mousse Chocolate', 'L', 'Bánh sinh nhật'),
(51, 'Bánh kem', '\n												Thành phần: Bánh kem tươi cốt bánh 4 lớp chiffon hoa quả khô, nhân kem tươi, trang trí sô cô la màu.\n											', '/images/Bánh Kem Romantic.jpg', 320000, 'Bánh Kem Romantic', 'S', 'Bánh sinh nhật'),
(52, 'Bánh kem', '\n												Bánh kem tươi cốt bánh 4 lớp chiffon socola chip, nhân kem tươi, trang trí donut socola và macaron.\n											', '/images/Bánh Kem Chocolate Fruit.jpg', 320000, 'Bánh Kem Chocolate Fruit', 'S', 'Bánh sinh nhật'),
(53, 'Bánh kem', '\n												Thành phần: Bánh kem tươi cốt bánh 3 lớp chiffon phô mai, trang trí kem tươi\n											', '/images/Bánh Kem Love Melody 4.jpg', 150000, 'Bánh Kem Love Melody 4', 'M', 'Bánh sinh nhật'),
(54, 'Bánh kem', '\n												Bánh kem tươi cốt bánh chiffon vani, nhân cocktail hoa quả, trang trí sô cô la.\n											', '/images/Bánh Kem Sweet Cream.jpg', 380000, 'Bánh Kem Sweet Cream', 'L', 'Bánh sinh nhật'),
(55, 'Bánh kem', '\n												Bánh kem tươi cốt bánh chiffon vani, nhân cocktail hoa quả, trang trí bánh cupcake, sô cô la và bông đường bi bạc.\n											', '/images/Bánh Kem Kiss Of Lady.jpg', 380000, 'Bánh Kem Kiss Of Lady', 'L', 'Bánh sinh nhật'),
(56, 'Bánh kem', '\n												Bánh kem tươi cốt bánh chiffon phô mai, kem tươi nhân phô mai, trang trí phụ kiện búp bê thiên thần, sô cô la và bông đường bi bạc\n											', '/images/Bánh kem Pink Angel.jpg', 320000, 'Bánh kem Pink Angel', 'M', 'Bánh cho trẻ em'),
(57, 'Bánh kem', '\n												Bánh kem tươi cốt bánh chiffon phô mai, kem tươi nhân phô mai, trang trí phụ kiện hình Doraemon, sô cô la và bông đường bi bạc\n											', '/images/Bánh Kem Cloudy Doraemon.jpg', 320000, 'Bánh Kem Cloudy Doraemon', 'S', 'Bánh cho trẻ em'),
(58, 'Bánh kem', '\n												Thành phần: Bánh kem tươi cốt bánh 3 lớp vani, 1 lớp nhân mứt xoài, trang trí kem tươi và sô cô la đồng tiền\n											', '/images/Bánh Hoàng Kim.jpg', 320000, 'Bánh Hoàng Kim', 'L', 'Bánh kem đặt trước'),
(59, 'Bánh ngọt', '\n												Thành phần: Trứng gà, bột mỳ, bơ, nước, đường, tinh bột biến tính (E1414), béo thực vật, bột sữa gầy, chất làm dày (E401), hương vani tổng hợp, màu thực phẩm (E160aii)), muối.\n											', '/images/Bánh Su Kem Nhân Vani.jpg', 29000, 'Bánh Su Kem Nhân Vani', 'S', 'Bánh su kem'),
(60, 'Bánh ngọt', '\n												Thành phần: Trứng gà, bột mỳ, bơ, nước, đường, sô cô la, tinh bột biến tính (E1414), béo thực vật, bột sữa gầy, chất làm dày (E401), hương vani tổng hợp, màu thực phẩm (E160aii)), muối.\n											', '/images/Bánh Su Kem Nhân Socola.jpg', 30000, 'Bánh Su Kem Nhân Socola', 'M', 'Bánh su kem'),
(61, 'Bánh ngọt', '\n												Thành phần: Trứng gà, kem sữa, bột mỳ, đường, rượu rum.\n											', '/images/Bánh Cuộn Vani 110G.jpg', 35000, 'Bánh Cuộn Vani 110G', 'M', 'Bánh cuộn'),
(62, 'Bánh ngọt', '\n												Thành phần: Trứng gà, đường, bột mỳ, nho khô (10%), hương vani tổng hợp, bơ, bột làm bánh Tartar, mật ong, siro đường, rượu rum.           \n											', '/images/Bánh Cuộn Nho Miếng.jpg', 23000, 'Bánh Cuộn Nho Miếng', 'M', 'Bánh cuộn'),
(63, 'Bánh ngọt', '\n												Thành phần: Trứng gà, kem sữa, bột mỳ, đường, mật ong, bột trà xanh (1%), rượu rum.      \n											', '/images/Bánh Cuộn Trà Xanh 250 G.jpg', 89000, 'Bánh Cuộn Trà Xanh 250 G', 'L', 'Bánh cuộn'),
(64, 'Bánh ngọt', '\n												Thành phần: Trứng gà, đường, bột mỳ, bột ca cao (2,5%), bơ, bột làm bánh Tartar, mật ong, siro đường, rượu rum.      \n											', '/images/Bánh Cuộn Socola Miếng.jpg', 23000, 'Bánh Cuộn Socola Miếng', 'M', 'Bánh cuộn'),
(65, 'Bánh ngọt', '\n												Thành phần: Trứng gà, kem sữa, bột mỳ, đường, mật ong, bột trà xanh (1%), rượu rum.  \n											', '/images/Bánh Cuộn Trà Xanh 110G.jpg', 35000, 'Bánh Cuộn Trà Xanh 110G', 'M', 'Bánh cuộn'),
(66, 'Bánh ngọt', '\n												Thành phần: Trứng gà, kem sữa, bột mỳ, đường, rượu rum.\n											', '/images/Bánh Cuộn Vani 250G.jpg', 89000, 'Bánh Cuộn Vani 250G', 'L', 'Bánh cuộn'),
(67, 'Bánh ngọt', '\n												Thành phần: Bột mỳ, trứng gà, đường, dầu thực vật, nước, sô cô la chíp (5%), bột sữa whey, dextrose, tinh bột biến tính (E1414), chất tạo xốp (E500ii, E450i, E341i), muối, chất nhũ hóa (E471, E475), chất làm dầy (E412, E466), hương vani tổng hợp, chất xử lý bột (E1100).. \n											', '/images/Bánh Muffin Socola Chip.jpg', 19000, 'Bánh Muffin Socola Chip', 'S', 'Bánh ngọt'),
(68, 'Bánh ngọt', '\n', '/images/Bánh Cheese Cake.jpg', 30000, 'Bánh Cheese Cake', 'M', 'Bánh ngọt'),
(69, 'Bánh ngọt', '\n												Thành phần: Trứng gà, bơ, bột mỳ, đường, vỏ chanh, chất tạo xốp (E500ii), hương vani tổng hợp. \n											', '/images/Bánh Madeleine.jpg', 42000, 'Bánh Madeleine', 'S', 'Bánh ngọt'),
(70, 'Bánh ngọt', '\n												Thành phần: Trứng gà, bột mỳ, đường, sô cô la (14%), bơ, kem sữa (5,6%), bột ca cao (2,5%), chất tạo xốp (E500ii, E450i, E341i).\n											', '/images/Bánh Gato Socola Sữa.jpg', 40000, 'Bánh Gato Socola Sữa', 'L', 'Bánh ngọt'),
(71, 'Bánh ngọt', '\n', '/images/Bánh Trứng Vàng Baby.jpg', 11000, 'Bánh Trứng Vàng Baby', 'S', 'Bánh ngọt'),
(72, 'Bánh ngọt', '\n												Thành phần: Bột mỳ, trứng gà, đường, dầu thực vật, nước, nho khô (9%), bột sữa whey, dextrose, tinh bột biến tính (E1414), chất tạo xốp (E500ii, E450i, E341i), muối, chất nhũ hóa (E471, E475), chất làm dầy (E412, E466), hương vani tổng hợp, chất xử lý bột (E1100).\n											', '/images/Bánh Muffin Vani Nho Đen.jpg', 19000, 'Bánh Muffin Vani Nho Đen', 'S', 'Bánh ngọt'),
(73, 'Bánh ngọt', '\n												Thành phần: Trứng gà, đường, bột mỳ, bột ca cao, hương cà phê tổng hợp, hương vani tổng hợp, bột làm bánh Tartar, bơ, mật ong, siro đường, rượu rum. \n											', '/images/Bánh Chiffon 3 Vị.jpg', 22000, 'Bánh Chiffon 3 Vị', 'S', 'Bánh Chiffon'),
(74, 'Bánh ngọt', '\n												Thành phần: Trứng gà, đường, bột mỳ, bơ, bột làm bánh Tartar, siro đường, hương vani tổng hợp, rượu rum.\n											', '/images/Bánh Chiffon Vani.jpg', 32000, 'Bánh Chiffon Vani', 'M', 'Bánh Chiffon'),
(75, 'Bánh ngọt', '\n												Thành phần: Trứng gà, đường, bột mỳ, bơ, nước, bột trà xanh (1%), bột làm bánh Tartar, mật ong, siro đường, rượu rum.         \n											', '/images/Bánh Chiffon Trà Xanh.jpg', 36000, 'Bánh Chiffon Trà Xanh', 'S', 'Bánh Chiffon'),
(76, 'Bánh mỳ', '\n												Thành phần: Bột mì, nước, men, muối, chất nhũ hóa (471), chất chống oxi hóa (300), enzym: amylaza (1100i).Hạn sử dụng: 30 ngày trong tủ đông\n', '/images/Bánh Mì Mini Baguette.jpg', 10000, 'Bánh Mì Mini Baguette', 'S', 'Bánh mì baguette'),
(77, 'Bánh mỳ', '\n												Bánh mì baguette thơm ngon chuẩn Pháp. Vỏ bánh giòn, ruột mềm, thơm ngậy vị bơ.Thành phần: Bột mỳ, men, muối, nước.\n', '/images/Bánh Mì Baguette.jpg', 11000, 'Bánh Mì Baguette', 'L', 'Bánh mì baguette'),
(78, 'Bánh mỳ', '\n												Bột mì hảo hạng, bột nhân su kem (10%), đường kính trắng, trứng gà, bơ thực vật, dầu thực vật, sữa đặc, sữa bột béo, sữa chua, muối tinh, men làm bánh mỳ, bột làm nở ibis.\n											', '/images/Bánh Mì Nhân Kem Sữa.jpg', 10000, 'Bánh Mì Nhân Kem Sữa', 'L', 'Bánh mì ngọt'),
(79, 'Bánh mỳ', '\n												Bột mì, đường kính trắng, bơ, sữa bột béo tan nhanh, táo khô, trứng gà, dầu thực vật, bột ngô, mạch nha, bột năng, ca cao, muối, men làm bánh mì.\n											', '/images/Bánh Mì Nhân Sô Cô La Táo Đỏ.jpg', 10000, 'Bánh Mì Nhân Sô Cô La Táo Đỏ', 'M', 'Bánh mì ngọt'),
(80, 'Bánh mỳ', '\n												Bột mỳ, sô cô la trắng (24%), nước, hạnh nhân cắt lát (11,3%), đường, cốm màu, trứng gà, bơ, sữa bột, muối tinh, men, chất nhũ hóa (471), chất chống oxi hóa (300), enzym: amylaza (1100i)\n											', '/images/Bánh Donut Socola Trắng Hạnh Nhân 45G.jpg', 20000, 'Bánh Donut Socola Trắng Hạnh Nhân 45G', 'L', 'Bánh mì ngọt'),
(81, 'Bánh mỳ', '\n												Thành phần: Bột mỳ, bơ, sữa bột, đường, trứng gà, men, muối, nước Trang trí: socola, cốm, đường icing\n											', '/images/Bánh Donut Socola Dâu 45G.jpg', 15000, 'Bánh Donut Socola Dâu 45G', 'S', 'Bánh mì ngọt'),
(82, 'Bánh mỳ', '\n												Bột mỳ, đường, bơ, nước, trứng gà, hạt óc chó (5,3%), muối, men, chất ổn định (E516), chất nhũ hóa (E322i), chất xử lý bột (E300 E1100i).\n											', '/images/Bánh Mì Hạt Óc Chó Sốt Kem.jpg', 30000, 'Bánh Mì Hạt Óc Chó Sốt Kem', 'S', 'Bánh mì ngọt'),
(83, 'Bánh mỳ', '\n												Bột mì hảo hạng, bơ thực vât, sô cô la (10%), dầu thực vật, trứng gà, đường kính trắng, men làm bánh, muối tinh, bột làm nở bánh ibis\n											', '/images/Bánh Croissant Sô Cô La.jpg', 15000, 'Bánh Croissant Sô Cô La', 'S', 'Bánh mì ngọt'),
(84, 'Bánh mỳ', '\n												Bột mì, đường kính trắng, hạt sen, dừa tươi, dầu ăn, bơ, nước cốt dừa, trứng gà, sữa bột, bột gạo, mạch nha, muối, men làm bánh mì.\n											', '/images/Bánh Mì Nhân Sen Sữa Dừa.jpg', 10000, 'Bánh Mì Nhân Sen Sữa Dừa', 'S', 'Bánh mì ngọt'),
(85, 'Bánh mỳ', '\n												Bột mỳ, sô cô la trắng (26%), nước, đường, cốm màu, trứng gà, bơ, sữa bột, bột trà xanh (03%), muối tinh, men, chất nhũ hóa (471), chất chống oxi hóa (300), enzym: amylaza (1100i), màu thực phẩm tổng hợp (INS 102, INS 133).\n											', '/images/Bánh Donut Socola Trà Xanh 45G.jpg', 15000, 'Bánh Donut Socola Trà Xanh 45G', 'L', 'Bánh mì ngọt'),
(86, 'Bánh mỳ', '\n												Bột mì hảo hạng, bột nhân su kem (5%), hạt đậu xanh (5%), đường kính trắng, trứng gà, bơ thực vật, dầu thực vật, sữa đặc, sữa bột béo, sữa chua, sorbitol, mạch nha, muối tinh, men làm bánh mỳ, bột gạo, bột làm nở bánh, màu thực phẩm, hương lá dứa\n											', '/images/Bánh Mì Đậu Xanh Lá Dứa.jpg', 10000, 'Bánh Mì Đậu Xanh Lá Dứa', 'S', 'Bánh mì ngọt'),
(87, 'Bánh mỳ', '\n												Thành phần: Bột bánh mỳ tươi (bột mỳ, đường, men, sữa bột, trứng gà, muối, bơ, nước), dừa khô\n											', '/images/Bánh Mì Dừa Hạt Quinoa.jpg', 15000, 'Bánh Mì Dừa Hạt Quinoa', 'S', 'Bánh mì ngọt'),
(88, 'Bánh mỳ', '\n												Thành phần: Bột mỳ, bơ, sữa bột, đường, trứng gà, men, muối, nước Trang trí: socola, cốm, đường tinh\n											', '/images/Bánh Donut Socola.jpg', 15000, 'Bánh Donut Socola', 'S', 'Bánh mì ngọt'),
(89, 'Bánh mỳ', '\n												Thành phần: Vỏ bánh mì kẹp cỡ lớn, chả, sốt bánh mỳ kẹp, dưa góp, rau mùi\n											', '/images/Bánh Mì Kẹp Chả.jpg', 30000, 'Bánh Mì Kẹp Chả', 'L', 'Bánh mì kẹp'),
(90, 'Bánh mỳ', '\n												Thành phần: Bột bánh mỳ gối (bột mỳ, men, muối, bơ, đường, trứng gà, nước), cá ngừ, phô mai, sốt Mayonnaise, trứng gàHạn sử dụng: 02 ngày kể từ ngày sản xuất\n', '/images/Bánh Sandwich Cá Ngừ Phô Mai.jpg', 32000, 'Bánh Sandwich Cá Ngừ Phô Mai', 'L', 'Bánh mì kẹp'),
(91, 'Bánh mỳ', '\n												Thành phần: Vỏ bánh mì kẹp cỡ lớn, pa tê, sốt bánh mỳ kẹp, dưa góp, rau mùi\n											', '/images/Bánh Mì Kẹp Pa Tê.jpg', 30000, 'Bánh Mì Kẹp Pa Tê', 'M', 'Bánh mì kẹp'),
(92, 'Bánh mỳ', '\n												Thành phần: Vỏ bánh mì kẹp cỡ lớn, pa tê, chả, thịt xá xíu, sốt bánh mỳ kẹp, dưa góp, rau mùi\n											', '/images/Bánh Mì Kẹp Thập Cẩm.jpg', 30000, 'Bánh Mì Kẹp Thập Cẩm', 'L', 'Bánh mì kẹp'),
(93, 'Bánh mỳ', '\n												Thành phần: Vỏ bánh mì kẹp cỡ lớn, thịt xá xíu, sốt bánh mỳ kẹp, dưa góp, rau mùi\n											', '/images/Bánh Mì Kẹp Xá Xíu.jpg', 30000, 'Bánh Mì Kẹp Xá Xíu', 'S', 'Bánh mì kẹp'),
(94, 'Bánh mỳ', '\n												Thành phần: Bột bánh mỳ gối (bột mỳ, men, muối, bơ, đường, trứng gà, nước), giăm bông, phomai, sốt Mayonnaise, trứng gà\n											', '/images/Sandwich Giăm Bông Phô Mai.jpg', 32000, 'Sandwich Giăm Bông Phô Mai', 'S', 'Bánh mì kẹp'),
(95, 'Bánh mỳ', '\n												Thành phần: Vỏ bánh mì kẹp cỡ lớn, gà nướng bỏ lò Teriyaki, sốt bánh mỳ kẹp, dưa góp, rau mùi\n											', '/images/Bánh Mì Kẹp Gà Teriyaki.jpg', 30000, 'Bánh Mì Kẹp Gà Teriyaki', 'M', 'Bánh mì kẹp'),
(96, 'Bánh mỳ', '\n												Thành phần: Bột mì, đường, muối, men, bơ anhchor, bột sữa, sữa tươi, trứng, nước, nhân táo.Hạn sử dụng: 02 ngày kể từ ngày sản xuất\n', '/images/Bánh Danish Táo.jpg', 20000, 'Bánh Danish Táo', 'S', 'Bánh cán lớp'),
(97, 'Bánh mỳ', '\n												Thành phần: Bột mỳ, men, muối, đường, trứng, sữa bột, bơ, nướcHạn sử dụng: 2 ngày kể từ ngày sản xuất\n', '/images/Bánh Croissant.jpg', 15000, 'Bánh Croissant', 'M', 'Bánh cán lớp'),
(98, 'Bánh mỳ', '\n												Thành phần: Bột mì, đường, muối, men , bột sữa, trứng gà, sữa tươi, bơ anchor, nước, nho khôHạn sử dụng: 02 ngày kể từ ngày sản xuất\n', '/images/Bánh Danish Nho.jpg', 20000, 'Bánh Danish Nho', 'L', 'Bánh cán lớp'),
(99, 'Bánh mỳ', '\n												Bột mì hảo hạng, thịt ba chỉ xông khói (10%), ruốc heo (8%), đường trắng, bơ thực vật, trứng gà, dầu thực vật, sữa đặc, sữa bột béo, sữa chua, men làm bánh, muối tinh, bột nở bánh ibis.\n											', '/images/Bánh Mì Ruốc Ba Rọi.jpg', 15000, 'Bánh Mì Ruốc Ba Rọi', 'S', 'Bánh mì mặn'),
(100, 'Bánh mỳ', '\n												Bột mì, thịt gà, đường kính trắng, dầu thực vật, bơ, trứng gà, sữa bột, đường nâu, xì dầu, hành, tỏi, bột khoai tây, hành tây, nước tương, muối, tương cà, dầu hào, men làm bánh mì, rượu nấu ăn, dấm trắng, dầu mè, bột ngô, gừng.\n											', '/images/Bánh Mì Nhân Sợi Gà Sốt Teriyaki.jpg', 15000, 'Bánh Mì Nhân Sợi Gà Sốt Teriyaki', 'M', 'Bánh mì mặn'),
(101, 'Bánh mỳ', '\n												Bột bánh burger (bột mỳ, men, đường, muối, trứng, bơ, nước), xúc xích (thịt gà & thịt lợn),phô mai, sốt bơ\n											', '/images/Bánh Mì Xúc Xích Phô Mai.jpg', 26000, 'Bánh Mì Xúc Xích Phô Mai', 'L', 'Bánh mì mặn'),
(102, 'Bánh mỳ', '\n												Bột mì hảo hạng, bơ thực vật, thịt ba chỉ xông khói (10%), dầu thực vật, trứng gà, đường kính trắng, ruốc heo, men làm bánh, muối tinh, bột làm nở bánh ibis.\n											', '/images/Bánh Ngàn Lớp Ba Rọi.jpg', 15000, 'Bánh Ngàn Lớp Ba Rọi', 'L', 'Bánh mì mặn'),
(103, 'Bánh mỳ', '\n												Thành phần; Bột mỳ, đường, dầu thực vật, muối, men, nước, giăm bông, nấm, phomai, rau củ hỗn hợp, sốt cà chua, lá kinh giới khô.Hạn sử dụng: 2 ngày kể từ ngày sản xuất\n', '/images/Bánh Pizza Giăm Bông Nấm.jpg', 29000, 'Bánh Pizza Giăm Bông Nấm', 'L', 'Bánh mì mặn'),
(104, 'Bánh mỳ', '\n												Bột mì hảo hạng, giăm bông (20%), bơ thực vật, dầu thực vật, trứng gà, đường kính trắng, ruốc heo, men làm bánh, muối tinh, bột làm nở bánh ibis\n											', '/images/Bánh Ngàn Lớp Dăm Bông.jpg', 15000, 'Bánh Ngàn Lớp Dăm Bông', 'L', 'Bánh mì mặn'),
(105, 'Bánh mỳ', '\n												Bột mì hảo hạng, xúc xích (15%), đường kính trắng, trứng gà, bơ thực vật, dầu thực vật, ruốc heo, sữa đặc, sữa bột béo, sữa chua, muối tinh, men làm bánh mì, bột làm nở ibis. \n											', '/images/Bánh Mì Xúc Xích Cuộn Thừng.jpg', 15000, 'Bánh Mì Xúc Xích Cuộn Thừng', 'L', 'Bánh mì mặn'),
(106, 'Bánh mỳ', '\n												Thành phần: Bột mỳ, đường, dầu thực vật, muối, men, nước, phomai, ngô ngọt, xúc xích, sốt cà chua, lá kinh giới khô.Hạn sử dụng: 02 ngày kể từ ngày sản xuất\n', '/images/Bánh Pizza Xúc Xích Ngô.jpg', 25000, 'Bánh Pizza Xúc Xích Ngô', 'S', 'Bánh mì mặn'),
(107, 'Bánh mỳ', '\n												Bột mỳ, dầu thực vật, xúc xích (105%), đường, nước, ruốc heo (6,6%), bơ, hành lá, muối, men, chất ổn định (E516), chất nhũ hóa (E322i), chất xử lý bột (E300 E1100i).\n											', '/images/Bánh Mì Xúc Xích Ruốc.jpg', 15000, 'Bánh Mì Xúc Xích Ruốc', 'L', 'Bánh mì mặn'),
(108, 'Bánh mỳ', '\n												Bột mì, ruốc heo (12,5%), dầu thực vật, nước, bơ, đường, trứng gà, sữa tươi, vừng trắng, muối, men, chất ổn định (E516), chất nhũ hóa (E322i), chất xử lý bột (E300 E1100i).\n											', '/images/Bánh Mì Cuộn Ruốc.jpg', 28000, 'Bánh Mì Cuộn Ruốc', 'L', 'Bánh mì mặn'),
(109, 'Bánh mỳ', '\n												Bột mì hảo hạng, trứng gà, dầu thực vật, đường kính trắng, ruốc heo (8%), hương vani, bột nở bánh ibis, muối tinh, bột làm bánh tartar\n											', '/images/Bánh Bông Lan Cuộn Ruốc.jpg', 20000, 'Bánh Bông Lan Cuộn Ruốc', 'L', 'Bánh mì mặn'),
(110, 'Bánh mỳ', '\n												Thành phần: Bột bánh mỳ tươi (bột mỳ, đường, men, sữa bột, trứng gà, muối, bơ, nước), ruốc lợn, sốt Mayonnaise\n											', '/images/Bánh Tươi Ruốc.jpg', 20000, 'Bánh Tươi Ruốc', 'L', 'Bánh mì mặn'),
(111, 'Bánh mỳ', '\n												Xúc xích (50%), bột mì hảo hạng, đường kính trắng, bơ, trứng, sữa đặc, sữa bột béo, sữa chua, men làm bánh mì, muối tinh, bột làm nở bánh ibis, bột ớt không cay.\n											', '/images/Bánh Mì Cuộn Xúc Xích.jpg', 20000, 'Bánh Mì Cuộn Xúc Xích', 'S', 'Bánh mì mặn'),
(112, 'Bánh mỳ', '\n												Bột mỳ, sữa tươi, sữa bột, đường, bơ, men, muối, nước,  ruốc gà cay, sốt Mayonnaise.\n											', '/images/Bánh Tươi Ruốc Gà Cay.jpg', 20000, 'Bánh Tươi Ruốc Gà Cay', 'L', 'Bánh mì mặn'),
(113, 'Bánh mỳ', '\n												Bột mì đen (14.5%), đường, sữa bột, bơ, muối, men, phụ gia bánh mỳ, nước\n											', '/images/Bánh Mì Gối Đen.jpg', 40000, 'Bánh Mì Gối Đen', 'L', 'Bánh mì gối'),
(114, 'Bánh mỳ', '\n												Bột mỳ, nước, ngũ cốc (15%), sữa bột, đường, bơ  men, muối, chất ổn định (E516), chất nhũ hóa (E322i), chất xử lý bột (E300 E1100i).\n											', '/images/Bánh Mì Gối Ngũ Cốc.jpg', 40000, 'Bánh Mì Gối Ngũ Cốc', 'L', 'Bánh mì gối'),
(115, 'Bánh mỳ', '\n												Thành phần: Bột mì, nước, đường kính, nho khô (4%), sữa bột béo (1,4%), bơ, shortening, men, muối, chất bảo quản (282), hương thực phẩm tổng hợp (hương sữa), chất nhũ hóa (471), chất chống oxi hóa (300), enzym: amylaza (1100i).\n											', '/images/Bánh Mì Gối Sữa Nho.jpg', 25000, 'Bánh Mì Gối Sữa Nho', 'L', 'Bánh mì gối'),
(116, 'Bánh mỳ', '\n												Bột mì, men, muối, bơ, đường, sữa bột, trứng gà, nước\n											', '/images/Bánh Mì Gối Trắng.jpg', 30000, 'Bánh Mì Gối Trắng', 'S', 'Bánh mì gối'),
(117, 'Bánh mỳ', '\n												Bột mỳ, nước, bột bánh mỳ nâu (17%), đường, sữa bột, bơ, men, muối, chất ổn định (E516), chất nhũ hóa (E322i), chất xử lý bột (E300 E1100i).\n											', '/images/Bánh Mì Gối Nâu.jpg', 40000, 'Bánh Mì Gối Nâu', 'S', 'Bánh mì gối'),
(118, 'Bánh mỳ', '\n												Thành phần: Bột mì, nước, bột mì nguyên cám (6%),đường kính, bơ, shortening, men, muối, chất bảo quản (282), hương thực phẩm tổng hợp (hương bơ), chất nhũ hóa (471), chất chống oxi hóa (300), enzym: amylaza (1100i).\n											', '/images/Bánh Mì Gối Nguyên Cám.jpg', 25000, 'Bánh Mì Gối Nguyên Cám', 'M', 'Bánh mì gối'),
(119, 'Bánh mỳ', '\n												Thành phần: Bột mì, nước, hạt quinoa (3%),  vừng đen (3%), đường kính, bơ, shortening, men, muối, chất bảo quản (282), hương thực phẩm tổng hợp (hương sữa, hương bơ), chất nhũ hóa (471), chất chống oxi hóa (300), enzym: amylaza (1100i).\n											', '/images/Bánh Mì Gối Hạt Quinoa.jpg', 25000, 'Bánh Mì Gối Hạt Quinoa', 'L', 'Bánh mì gối'),
(120, 'Bánh đông lạnh', '\n												Thành phần: Bột mì, phomai, dứa (20%), dăm bông (15%), bơ, sốt cà chua, hành tây, ớt chuông, đường, men, muối, lá oregano\n											', '/images/Pizza Dăm Bông Dứa.jpg', 55000, 'Pizza Dăm Bông Dứa', 'M', 'Bánh pizza'),
(121, 'Bánh đông lạnh', '\n												Thành phần: Bột mì, phomai, hải sản (tôm 12,5%; mực 12,5%) bơ, sốt cà chua, hành tây, ớt chuông, đường, men, muối, lá oregano.\n											', '/images/Pizza Hải Sản.jpg', 69000, 'Pizza Hải Sản', 'L', 'Bánh pizza'),
(122, 'Bánh đông lạnh', '\n												Thành phần: Bột mì, phô mai khối, gà teriyaki (thịt gà (14%), sốt teriyaki (3%), dầu hào, xì dầu, hạt tiêu), nước, nấm mỡ, sốt pizza (8%), trứng gà, bơ, dầu thực vật, đường kính, muối, men bánh.\n											', '/images/Pizza Gà Teriyaki.jpg', 80000, 'Pizza Gà Teriyaki', 'L', 'Bánh pizza'),
(123, 'Bánh đông lạnh', '\n												Thành phần: Bột mì, phô mai khối, xúc xích tươi (15%), nước, ớt chuông, sốt pizza (8%), trứng gà, bơ, dầu thực vật, đường kính, muối, men bánh, lá mùi tây khô.\n											', '/images/Pizza Xúc Xích Tươi.jpg', 90000, 'Pizza Xúc Xích Tươi', 'S', 'Bánh pizza'),
(124, 'Bánh đông lạnh', '\n												Thành phần: Bột mì, phô mai (40%), bơ, sốt cà chua, hành tây, ớt chuông, đường, men, muối, lá oregano.\n											', '/images/Bánh Pizza Phô Mai Hảo Hạng 220G.jpg', 110000, 'Bánh Pizza Phô Mai Hảo Hạng 220G', 'L', 'Bánh pizza'),
(125, 'Bánh đông lạnh', '\n												Thành phần: Bột mì, phô mai khối, bò bulgogi (thịt bò (11%), sốt bulgogi (2,8%), xì dầu, hạt tiêu), nước, ớt chuông, hành tây, sốt pizza (8%), trứng gà, bơ, dầu thực vật, đường kính, muối, men, lá mùi tây khô.\n											', '/images/Pizza Bò Bulgogi.jpg', 90000, 'Pizza Bò Bulgogi', 'M', 'Bánh pizza'),
(126, 'Bánh đông lạnh', '\n												Thành phần: Mix 2 pizza dăm bông dứa & hải sản\n											', '/images/Pizza Dăm Bông Dứa Và Hải Sản.jpg', 109000, 'Pizza Dăm Bông Dứa Và Hải Sản', 'S', 'Bánh pizza'),
(127, 'Bánh đông lạnh', '\n Thành phần: Bột mỳ, thịt lợn (16%), nước, đường, sữa tươi, bơ, dầu thực vật, bột khoai tây, bột mỳ nguyên cám, dầu hào, nước tương đậu nành, rượu, hành khô, tỏi, hành tươi, xì dầu, muối, men, chất tạo đông gelatine, dầu điều 80g\n', '/images/Bánh Bao Nhân Thịt Xá Xíu 240G.jpg', 36000, 'Bánh Bao Nhân Thịt Xá Xíu 240G', 'L', 'Bánh bao'),
(128, 'Bánh đông lạnh', '\n												Thành phần: Bột mì, sữa tươi (16,5%), đường, nước, shortening, men, muối, chất tạo xốp (E500ii, E450i, E341i), hương sữa tổng hợp.\n											', '/images/Bánh Bao Chay Sữa 220G.jpg', 26000, 'Bánh Bao Chay Sữa 220G', 'L', 'Bánh bao'),
(129, 'Bánh đông lạnh', '\nThành phần: Bột mỳ, sữa tươi (13%), trứng gà (11%), nước, đường bơ, men, muối, màu thực phẩm: màu vàng\n', '/images/Bánh Bao Nhân Trứng Sữa 240G.jpg', 30000, 'Bánh Bao Nhân Trứng Sữa 240G', 'M', 'Bánh bao'),
(130, 'Bánh đông lạnh', '\n												Thành phần: Bột mì, đậu xanh (15%), sữa tươi, đường, nước, bột nếp, đường mạch nha, dầu thực vật, shortening, men, muối, chất tạo xốp (E500ii, E450i, E341i), hương sữa tổng hợp, hương đậu xanh tổng hợp, bột trà xanh.\n											', '/images/Bánh Bao Nhân Đậu Xanh 240G.jpg', 30000, 'Bánh Bao Nhân Đậu Xanh 240G', 'M', 'Bánh bao'),
(131, 'Bánh đông lạnh', '\n												Thành phần: Bột mỳ, thịt lợn (28%), nước, sữa tươi, đường, mộc nhĩ, bơ, miến, hành khô, bột khoai tay, bột ngọt, hạt tiêu, muối, men 80g\n											', '/images/Bánh Bao Nhân Thịt 240G.jpg', 36000, 'Bánh Bao Nhân Thịt', 'S', 'Bánh bao');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopping_cart`
--

INSERT INTO `shopping_cart` (`id`, `user_id`) VALUES
(7, 3),
(8, 4),
(6, 6),
(9, 9),
(10, 14),
(11, 16),
(14, 19),
(15, 20);

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart_product`
--

CREATE TABLE `shopping_cart_product` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `total_price` double DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `shopping_cart_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopping_cart_product`
--

INSERT INTO `shopping_cart_product` (`id`, `quantity`, `total_price`, `product_id`, `shopping_cart_id`) VALUES
(0, 1, NULL, 1, 7),
(1, 1, 22000, 1, 9),
(2, 2, 62000, 2, 9),
(103, 1, 31000, 2, 6),
(104, 1, 31000, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart_product_seq`
--

CREATE TABLE `shopping_cart_product_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shopping_cart_product_seq`
--

INSERT INTO `shopping_cart_product_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Table structure for table `sys_orders`
--

CREATE TABLE `sys_orders` (
  `id` bigint(20) NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sys_orders`
--

INSERT INTO `sys_orders` (`id`, `total_price`, `total_quantity`, `user_id`, `address`, `full_name`, `phone`) VALUES
(1, 114000, 5, 14, 'TP.HCM', 'NGuyễn Văn A', '04583737'),
(2, 103000, 4, 14, 'TP.HCM', 'Nguyễn Văn B', '045837376'),
(3, 93000, 3, 14, 'TP.HCM', 'Nguyễn Văn C', '056744345'),
(4, 93000, 3, 14, 'TP.HCM', 'Nguyễn Văn D', '056456446'),
(5, 953000, 6, 14, 'Vũng Tàu', 'Nguyễn Văn E', '05654567'),
(6, 563000, 5, 14, 'Vũng Tàu', 'Nguyễn Thị B', '05564534'),
(7, 563000, 5, 14, 'Vũng Tàu', 'Nguyễn Thị G', '0584564534'),
(8, 563000, 5, 14, 'Vũng Tàu', 'Nguyễn Thị Y', '065464568'),
(9, 78000, 2, 14, 'Đồng Nai', 'Nguyễn Thị U', '0456476878'),
(10, 760000, 2, 14, 'Nhà bè', 'Trần Hợp Kiên', '0965865133'),
(11, 960000, 3, 20, 'Nhà bè', 'Trần Hợp Kiên', '0965865133');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `created_date`, `password`, `username`, `email`, `status`) VALUES
(1, NULL, '$2a$10$gqHrslMttQWSsDSVRTK1OehkkBiXsJ/a4z2OURU./dizwOQu5Lovu', 'admin', NULL, NULL),
(2, NULL, '$2a$10$gqHrslMttQWSsDSVRTK1OehkkBiXsJ/a4z2OURU./dizwOQu5Lovu', 'kienminho', NULL, NULL),
(3, '2023-10-29 07:54:17.000000', '$2a$10$z82Jzy.uBtieuTKQJ5o.l.w4z8.0IACUzaOHJbGqgi4shNdhWcFFy', 'Kienkien', NULL, NULL),
(4, '2023-10-29 07:56:02.000000', '$2a$10$msMDlEpCizZs2ujwy4Bsz.esb3AklrLCUEU1SHLyFYg9U24JQcnIS', 'Dong', NULL, NULL),
(6, '2023-10-29 10:52:02.000000', '$2a$10$pE8bQf7KFj7JnNrtKqmKKu5gMYyWR8USiCyhZDcMSq1q3i52TrtPG', 'Dev', NULL, NULL),
(7, '2023-10-30 14:14:33.000000', '$2a$10$zgrQaxZXjME1NGQVljoO5OckevxZxmDK5OKyvyt/mGqVkiis4SgYi', 'Kienminho', NULL, NULL),
(9, '2023-10-30 15:11:17.000000', '$2a$10$CAhmAlBFNwiMKDcbLpX25ulIZtgejHTABqR9gi/rCTZ/ktuCpckkC', 'Test', NULL, NULL),
(14, '2023-11-01 11:36:59.000000', '$2a$10$ZqdtUSYeICdRPt81MvhcIOpWCUWNv5SdPG4iU7azi1QwVorQw0Cwa', 'Dev2', 'kienlun1100@gmail.com', NULL),
(15, '2023-11-15 03:58:51.000000', '$2a$10$adsZCvBhqpOzUA0dKNOaAer7v2ic41WBVkajJPafFIi.2NshnefDq', 'dev1234', NULL, NULL),
(16, '2023-12-04 13:55:51.000000', '$2a$10$ANm0nxNyR9grYNmECe00XOvdZN.Iby2tSfewJ/7bG1SotMp/4TeTq', 'Dev3', NULL, NULL),
(19, '2023-12-04 15:04:13.000000', '$2a$10$AZqHE4DTfsaBdbbSUEQVduCRUCz7kHTuz7pI4PNNZEg..hWWjAbcK', 'đ', 'admni@gmail.com', b'1'),
(20, '2023-12-05 16:34:51.000000', '$2a$10$ZN4LiTi9GvbLC/vqJGVHg.GEY0GokoRk.hIKeNxq9NOlWq6gFd0VC', 'ronaldo', 'hopkien1609@gmail.com', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(6, 2),
(7, 2),
(9, 2),
(14, 2),
(16, 2),
(19, 2),
(20, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_qx5dh8nhlnh77h8im91vlqwdv` (`user_id`);

--
-- Indexes for table `shopping_cart_product`
--
ALTER TABLE `shopping_cart_product`
  ADD PRIMARY KEY (`id`,`product_id`,`shopping_cart_id`),
  ADD KEY `FKrhdgnliwu0vsv3wka7409p81f` (`product_id`),
  ADD KEY `FKectgy7yh5dy3261o4rei8suxq` (`shopping_cart_id`);

--
-- Indexes for table `sys_orders`
--
ALTER TABLE `sys_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpdvp5w4nxvoe5abgpv0lvyetn` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6w3lq7enh0mgv5r45vabpvxx8` (`created_date`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sys_orders`
--
ALTER TABLE `sys_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `FK254qp5akhuaaj9n5co4jww3fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `shopping_cart_product`
--
ALTER TABLE `shopping_cart_product`
  ADD CONSTRAINT `FKectgy7yh5dy3261o4rei8suxq` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_cart` (`id`),
  ADD CONSTRAINT `FKrhdgnliwu0vsv3wka7409p81f` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `sys_orders`
--
ALTER TABLE `sys_orders`
  ADD CONSTRAINT `FKpdvp5w4nxvoe5abgpv0lvyetn` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
