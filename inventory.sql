-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2024 at 06:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `token_created_at` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `username`, `password`, `reset_token`, `token_created_at`) VALUES
(3, 'admin1', 'admin@gmail.com', 'admin1', '$2y$10$welTSHzvMGl8kFkfgBbDC.nx1vqmMkfrVUTZWY0hv/GJVjEvXIRPK', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_pengajuan`
--

CREATE TABLE `admin_pengajuan` (
  `id_pengajuan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `ruangan` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_pengajuan`
--

INSERT INTO `admin_pengajuan` (`id_pengajuan`, `nama`, `jabatan`, `ruangan`, `username`, `password`) VALUES
(3, 'admin2', 'kabag', 'produksi', 'admin2', '$2y$10$EKpOb/Cl1OPCZN70g8pxpOUt1uC6IfTbfuP6YXDI0r9yhrfsLNfI.');

-- --------------------------------------------------------

--
-- Table structure for table `admin_ruangan`
--

CREATE TABLE `admin_ruangan` (
  `id_ruangan` int(11) NOT NULL,
  `ruangan` varchar(500) NOT NULL,
  `penanggungjawab` varchar(500) NOT NULL,
  `jabatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_ruangan`
--

INSERT INTO `admin_ruangan` (`id_ruangan`, `ruangan`, `penanggungjawab`, `jabatan`) VALUES
(1, 'Loby', 'Sutino, S.E', ''),
(2, 'Aula', 'Sutino, S.E', ''),
(3, 'Vicon', 'Sutino, S.E', ''),
(4, 'Laktasi', 'Sutino, S.E', ''),
(5, 'Mushola', 'Sutino, S.E', ''),
(6, 'Arsip', 'Sutino, S.E', ''),
(7, 'produksi', 'Eny Tristanti, SST, M.E', ''),
(8, 'distribusi', 'Susiawati Kristiarini, SST', ''),
(9, 'Pengolahan IPDS', 'Agus Widodo SST., M.Si', ''),
(10, 'PST', 'Nopriansyah SST, M.Si', ''),
(11, 'Madya', 'Nova Moestafa SST, M.Si', ''),
(12, 'Umum', 'Juniar S.E', ''),
(13, 'Keuangan', 'Gafur S.ST., M.Si', ''),
(14, 'Kabag Umum', 'Marini Syafitri SST', ''),
(15, 'Sekretaris', 'Marini Syafitri SST', ''),
(16, 'Kepala BPS Provinsi Jambi', 'Marini Syafitri SST', ''),
(17, 'SDM/PBJ', 'Sunandar, S.E., M.Si.', ''),
(18, 'Sosial/Neraca', 'Sisilia Nurteta, SST, M.Si', '');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `kd_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `satuan` varchar(50) NOT NULL,
  `stok` int(11) DEFAULT 0,
  `harga_satuan` int(11) NOT NULL DEFAULT 0,
  `id_harga_pengajuan` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `kd_barang`, `nama_barang`, `kategori`, `satuan`, `stok`, `harga_satuan`, `id_harga_pengajuan`) VALUES
(1, '1010104001', 'Solar', 'ATK', 'Liter', 60, 10000, 12000),
(2, '1010199999', 'R.Acc 74010', 'ATK', 'Pcs', 300, 5000, NULL),
(3, '1010301001', 'PENSIL', 'ATK', 'Lusin', 92, 0, NULL),
(4, '1010301001', 'ISI PENSIL MEKANIK', 'ATK', '-', 100, 10000, 36),
(5, '1010301001', 'SPIDOL KECIL', 'ATK', 'Buah', 3, 10000, 35),
(6, '1010301001', 'STABILO BOSS', 'ATK', 'BUAH', 0, 0, NULL),
(7, '1010301001', 'BALLPOINT', 'ATK', '-', 0, 0, NULL),
(8, '1010301001', 'PENSIL', 'ATK', 'BUAH', 0, 0, NULL),
(9, '1010301001', 'BALLPOINT', 'ATK', 'BUAH', 0, 0, NULL),
(10, '1010301001', 'SPIDOL WHITE BOARD (LUSIN)', 'ATK', 'LUSIN', 0, 0, NULL),
(11, '1010301001', 'PENA BALINER KOTAK', 'ATK', 'KOTAK', 0, 0, NULL),
(12, '1010301001', 'PAPAN ALAS TULIS', 'ATK', 'BUAH', 0, 0, NULL),
(13, '1010301001', 'PENA BIASA', 'ATK', 'LUSIN', 0, 0, NULL),
(14, '1010301001', 'SPIDOL PERMANEN BESAR', 'ATK', 'BUAH', 0, 0, NULL),
(15, '1010301001', 'SPIDOL SP2010', 'ATK', 'LUSIN', 110, 1000, NULL),
(16, '1010301001', 'PENA BERTALI', 'ATK', 'BUAH', 0, 0, NULL),
(17, '1010301001', 'PENSIL 2B PPLS', 'ATK', 'BUAH', 0, 0, NULL),
(18, '1010301001', 'PENGHAPUS PENSIL PPLS', 'ATK', 'BUAH', 0, 0, NULL),
(19, '1010301001', 'BALLPOINT PPLS', 'ATK', 'BUAH', 0, 0, NULL),
(20, '1010301001', 'BLOCK NOTE PPLS', 'ATK', 'BUAH', 0, 0, NULL),
(21, '1010301001', 'PISAU PERUNCING PENSIL PPLS', 'ATK', 'BUAH', 0, 0, NULL),
(22, '1010301001', 'CARBON FOLIO DAITO', 'ATK', 'SET', 0, 0, NULL),
(23, '1010301001', 'PENSIL 2B', '', 'LUSIN', 0, 0, NULL),
(24, '1010301001', 'PENA PILOT', 'ATK', 'LUSIN', 0, 0, NULL),
(25, '1010301001', 'KOTAK CD', 'ATK', 'BUAH', 0, 0, NULL),
(26, '1010301001', 'Pena Snowmen', 'ATK', 'Buah', 0, 0, NULL),
(27, '1010301001', 'Pensil Mekanik', 'ATK', 'Buah', 0, 0, NULL),
(28, '1010301001', 'Pensil 2B PBDT', 'ATK', 'Lusin', 0, 0, NULL),
(29, '1010301001', 'Pena PBDT', 'ATK', 'Lusin', 0, 0, NULL),
(30, '1010301001', 'Peruncing PBDT', 'ATK', 'Box', 0, 0, NULL),
(31, '1010301001', 'BlockNote PBDT', '', 'PCS', 0, 0, NULL),
(32, '1010301001', 'Blocknote Innas PBDT', '', 'buah', 0, 0, NULL),
(33, '1010301001', 'Pena Innas PBDT', '', 'Buah', 0, 0, NULL),
(34, '1010301001', 'Pensil 2B Innas PBDT', '', 'Buah', 0, 0, NULL),
(35, '1010301001', 'Rautan Pensil Innas PBDT', '', 'Buah', 0, 0, NULL),
(36, '1010301001', 'Spidol Gold (SUPAS)', '', 'Buah', 0, 0, NULL),
(37, '1010301001', 'Blocknote (Seminar PBDT)', '', 'Buah', 0, 0, NULL),
(38, '1010301001', 'Ballpoint (Seminar PBDT)', '', 'Buah', 0, 0, NULL),
(39, '1010301001', 'Blocknote (peta BS)', '', 'Buah', 0, 0, NULL),
(40, '1010301001', 'Spidol Snowman (Peta BS)', '', 'Buah', 0, 0, NULL),
(41, '1010301001', 'Pensil 2B (Peta BS)', '', 'Buah', 0, 0, NULL),
(42, '1010301001', 'Peruncing (Peta BS)', '', 'Buah', 0, 0, NULL),
(43, '1010301001', 'Blocknote (dwelling time)', '', 'Buah', 0, 0, NULL),
(44, '1010301001', 'Ballpoint (Dwelling time)', '', 'Buah', 0, 0, NULL),
(45, '1010301001', 'Pensil 2B (Survei Knsumsi)', '', 'Buah', 0, 0, NULL),
(46, '1010301001', 'Peruncing (survei konsumsi)', '', 'Buah', 0, 0, NULL),
(47, '1010301001', 'Pena (survei konsumsi)', '', 'Buah', 0, 0, NULL),
(48, '1010301001', 'Blocknote (survei Knsumsi)', '', 'Buah', 0, 0, NULL),
(49, '1010301001', 'Snow Pena V-6 warna', '', 'pcs', 0, 0, NULL),
(50, '1010301001', 'Snow Pena V-7', '', 'Pcs', 0, 0, NULL),
(51, '1010301001', 'Pena SU Parker', '', '-', 0, 0, NULL),
(52, '1010301001', 'STABILLO (KOTAK LUSIN)', '', 'KOTAK/LUSIN', 0, 0, NULL),
(53, '1010301001', 'PERUNCING PENSIL BESAR PUTAR', '', 'BUAH', 0, 0, NULL),
(54, '1010301001', 'PENA TINTA TIZO (LUSIN)', '', 'LUSIN', 0, 0, NULL),
(55, '1010301001', 'PENA BIASA GREBEL (LUSIN)', '', 'LUSIN', 0, 0, NULL),
(56, '1010301001', 'PENA BALLINER BUAH (PILOT)', '', 'BUAH', 0, 0, NULL),
(57, '1010301001', 'SPIDOL BOARD MARKER (BUAH)', '', 'BUAH', 0, 0, NULL),
(58, '1010301001', 'ISI PENA PARKER BIRU', '', 'BUAH', 0, 0, NULL),
(59, '1010301001', 'ISI PENA PARKER HITAM', '', 'BUAH', 0, 0, NULL),
(60, '1010301001', 'PENA PARKER', '', 'BUAH', 0, 0, NULL),
(61, '1010301001', 'BLOCK NOTE SP2020', '', 'BUAH', 0, 0, NULL),
(62, '1010301001', 'PENA SNOWMAN V-2 (BUAH)', '', 'BUAH', 0, 0, NULL),
(63, '1010301001', 'ARTLINE PENSIL 2B (BUNGKUS)', '', 'BKS', 0, 0, NULL),
(64, '1010301001', 'PENA PILOT HITAM BP-1RT (BUAH)', '', 'BUAH', 0, 0, NULL),
(65, '1010301001', 'PENA PILOT BIRU BP-1RT (BUAH)', '', 'BUAH', 0, 0, NULL),
(66, '1010301001', 'PENA PILOT BP-1RT (LUSIN)', '', 'LUSIN', 0, 0, NULL),
(67, '1010301001', 'PENA GEL KENKO (LUSIN)', '', 'LUSIN', 0, 0, NULL),
(68, '1010301001', 'PENA GEL KENKO ( BUAH)', '', 'BUAH', 0, 0, NULL),
(69, '1010301001', 'PENA PARKER BRUSHED METAL GTRB TB', '', 'PCS', 0, 0, NULL),
(70, '1010301001', 'PENA TINTA DELI S01 (BUAH)', '', 'BUAH', 0, 0, NULL),
(71, '1010301001', 'PENA KENKO KE-100 TJ', '', 'KOTAK/LUSIN', 0, 0, NULL),
(72, '1010301001', 'penatulis', '', '-', 0, 0, NULL),
(73, '1010301001', 'BALLPOINT STANDARD ST009', '', 'LUSIN', 0, 0, NULL),
(74, '1010301001', 'Pena baliner', '', 'Buah', 0, 0, NULL),
(75, '1010301001', 'PENA SNOWMAN BP-7 WARNA/HITAM', '', 'PACK', 0, 0, NULL),
(76, '1010301001', 'PENA BALL', '', 'PCS', 0, 0, NULL),
(77, '1010301001', 'BOLPOINT PESERTA FKP', '', 'PCS', 0, 0, NULL),
(78, '1010301001', 'Pensil Faber Castell 2b', '', 'Buah', 0, 0, NULL),
(79, '1010301001', 'Pena Kenko', '', 'Kotak', 0, 0, NULL),
(80, '1010301001', 'Gel Pen 3572', '', 'Pcs', 0, 0, NULL),
(81, '1010301001', 'Pena Snowman V-2 Warna Hitam', '', 'Pak', 0, 0, NULL),
(82, '1010301001', 'Blocknote', '', 'Pcs', 0, 0, NULL),
(83, '1010301001', 'Pulpen Standart', '', 'Pcs', 0, 0, NULL),
(84, '1010301001', 'Notebook', '', 'Pcs', 0, 0, NULL),
(85, '1010301001', 'Paket Pena dan Notebook', '', 'Pcs', 0, 0, NULL),
(86, '1010301001', 'Kertas A3', '', 'Rim', 0, 0, NULL),
(87, '1010301001', 'Kertas A3', '', 'Rim', 0, 0, NULL),
(88, '1010301001', 'Pena', '', 'Pcs', 0, 0, NULL),
(89, '1010301001', 'Pensil 2B (Pcs)', '', 'Pcs', 0, 0, NULL),
(90, '1010301001', 'Pena (Pcs)', '', 'Pcs', 0, 0, NULL),
(91, '1010301001', 'Pilot Pena BL-5M BK', '', 'Pcs', 0, 0, NULL),
(92, '1010301001', 'Kenko STP-300 SG Stand Pen', '', 'Pcs', 0, 0, NULL),
(93, '1010301001', 'Kenko STP-18SM Stand Pen', '', 'Pcs', 0, 0, NULL),
(94, '1010301001', 'Kenko STP-300SG Stand Pen', '', 'Pcs', 0, 0, NULL),
(95, '1010301001', 'STABILO', '', 'PCS', 0, 0, NULL),
(96, '1010301001', 'PENCIL 2B', '', 'PCS', 0, 0, NULL),
(97, '1010301001', 'KENKO BP KE-200 BLACK/BOX', '', 'BOX', 0, 0, NULL),
(98, '1010301001', 'PENA SNOWMAN S-1 WRN HITAM', '', 'PAK', 0, 0, NULL),
(99, '1010301001', 'PENA STANDART AE-7 WANA HITAM', '', 'PAK', 0, 0, NULL),
(100, '1010301002', 'TINTA PULPEN', '', '-', 0, 0, NULL),
(101, '1010301002', 'TINTA STEMPEL', '', '-', 0, 0, NULL),
(102, '1010301002', 'TINTA NOMORATOR', '', '-', 0, 0, NULL),
(103, '1010301002', 'TINTA', '', 'PCS', 0, 0, NULL),
(104, '1010301002', 'Tinta Remarx 5', '', 'PCS', 0, 0, NULL),
(105, '1010301002', 'TINTA STAMPEL 5 ML', '', 'PCS', 0, 0, NULL),
(106, '1010301002', 'Brother Catridge LC 583 BK', '', 'Qyt', 0, 0, NULL),
(107, '1010301002', 'Brother Catridge LC 583 CY', '', 'Qyt', 0, 0, NULL),
(108, '1010301002', 'Brother Catridge LC 583 YL', '', 'Qyt', 0, 0, NULL),
(109, '1010301002', 'TINTA YAMURA 50CC WRN', 'ATK', 'BOTOL', 0, 0, NULL),
(110, '1010301002', 'TINTA STAMPEL 5W', '', 'PCS', 0, 0, NULL),
(111, '1010301003', 'ROLL OPSS OFFSET', '', '-', 0, 0, NULL),
(112, '1010301003', 'PAPER CLIP', '', 'KOTAK', 0, 0, NULL),
(113, '1010301003', 'BINDER CLIPS', '', '-', 0, 0, NULL),
(114, '1010301003', 'KLIP KERTAS KECIL', '', 'KOTAK', 0, 0, NULL),
(115, '1010301003', 'KLIP KERTAS BESAR', '', 'KOTAK', 0, 0, NULL),
(116, '1010301003', 'JEPIT KERTAS SEDANG', '', 'KOTAK', 0, 0, NULL),
(117, '1010301003', 'JEPIT KERTAS BESAR', '', 'KOTAK', 0, 0, NULL),
(118, '1010301003', 'JEPIT KERTAS KECIL', '', 'KOTAK', 0, 0, NULL),
(119, '1010301003', 'Penjepit Kertas', '', 'Lusin', 0, 0, NULL),
(120, '1010301003', 'PENJEPIT SURAT KECIL', '', 'KOTAK', 0, 0, NULL),
(121, '1010301003', 'PENJEPIT SURAT SEDANG', '', 'KOTAK', 0, 0, NULL),
(122, '1010301003', 'PENJEPIT SURAT BESAR', '', 'KOTAK', 0, 0, NULL),
(123, '1010301003', 'BINDER CLIPS 155', '', 'KOTAK', 0, 0, NULL),
(124, '1010301003', 'BINDER CLIP 111', '', 'KOTAK', 0, 0, NULL),
(125, '1010301003', 'KLIP KERTAS SEDANG', '', 'KOTAK', 0, 0, NULL),
(126, '1010301003', 'BINDER CLIPS 107', '', 'KOTAK', 0, 0, NULL),
(127, '1010301003', 'BINDER CLIPS 260', '', 'KOTAK', 0, 0, NULL),
(128, '1010301003', 'TRIGONAL CLIPS NO.5', '', 'KOTAK', 0, 0, NULL),
(129, '1010301003', 'BINDER CLIPS 105', '', 'KOTAK', 0, 0, NULL),
(130, '1010301003', 'TRIGONAL CLIPS NO 3', '', '-', 0, 0, NULL),
(131, '1010301003', 'JUMBO CLIP NO.5', '', 'KOTAK', 0, 0, NULL),
(132, '1010301003', 'BINDER CLIPS NO.200', '', 'KOTAK', 0, 0, NULL),
(133, '1010301003', 'BINDER CLIPS 107 (PACK)', '', 'PACK', 0, 0, NULL),
(134, '1010301003', 'PENJEPIT KERTAS', '', 'BOX', 0, 0, NULL),
(135, '1010301003', 'Binder Clip (Pcs)', '', 'Pcs', 0, 0, NULL),
(136, '1010301003', 'Binder Klip 200 Montana No. 6 (Pcs)', '', 'Pcs', 0, 0, NULL),
(137, '1010301003', 'Trigonal Klip Montana No. 3 (Pcs)', '', 'Pcs', 0, 0, NULL),
(138, '1010301003', 'Joyko Binder Clip 260 12P', '', 'Pak', 0, 0, NULL),
(139, '1010301003', 'Paper Clips', '', 'Pcs', 0, 0, NULL),
(140, '1010301003', 'Joyko Binder Clip 111 12P', '', 'Pak', 0, 0, NULL),
(141, '1010301003', 'Kenko Clip Binder No. 105', '', 'Box', 0, 0, NULL),
(142, '1010301003', 'PAPER CLIPS (33 MM)', '', 'KOTAK', 0, 0, NULL),
(143, '1010301004', 'KARET PENGHAPUS', '', 'Kotak', 0, 0, NULL),
(144, '1010301004', 'PENGHAPUS WHITE BOARD', '', '-', 0, 0, NULL),
(145, '1010301004', 'TIP EX', '', 'Botol', 0, 0, NULL),
(146, '1010301004', 'PENGHAPUS', '', 'BUAH', 0, 0, NULL),
(147, '1010301004', 'PENGHAPUS PENSIL', '', 'KOTAK', 0, 0, NULL),
(148, '1010301004', 'Penghapus PBDT', '', 'Box', 0, 0, NULL),
(149, '1010301004', 'Penghapus Innas PBDT', '', 'Buah', 0, 0, NULL),
(150, '1010301004', 'Penghapus (Peta BS)', '', 'Buah', 0, 0, NULL),
(151, '1010301004', 'Penghapus (survei knsumsi)', '', 'Buah', 0, 0, NULL),
(152, '1010301004', 'TIP EX KUAS DOBEL', '', 'SET', 0, 0, NULL),
(153, '1010301004', 'Penghapus Pensil  KENKO', '', 'Kotak', 0, 0, NULL),
(154, '1010301004', 'PENGHAPUS PENCIL', '', 'PCS', 0, 0, NULL),
(155, '1010301005', 'BUKU TULIS REGISTER FOLIO', '', 'Buah', 0, 0, NULL),
(156, '1010301005', 'BUKU TULIS REGISTER KWARTO', '', '-', 0, 0, NULL),
(157, '1010301005', 'BLOCK NOTE', '', 'Buah', 0, 0, NULL),
(158, '1010301005', 'BUKU EKSPEDISI', '', 'BLOK', 0, 0, NULL),
(159, '1010301005', 'BUKU AGENDA BIASA', '', 'BUKU', 0, 0, NULL),
(160, '1010301005', 'BUKU MEMO ', '', 'BUKU', 0, 0, NULL),
(161, '1010301005', 'BUKU PANDUAN', '', 'BUKU', 0, 0, NULL),
(162, '1010301005', 'DAFTAR SAK 10-L', '', 'SET', 0, 0, NULL),
(163, '1010301005', 'DAFTAR SAK 10 DSRT', '', 'LEMBAR', 0, 0, NULL),
(164, '1010301005', 'DAFTAR SAK 10-AK', '', 'BUKU', 0, 0, NULL),
(165, '1010301005', 'BUKU PEDOMAN 1 PENCACAH SAK 2010', '', 'BUKU', 0, 0, NULL),
(166, '1010301005', 'BUKU PEDOMAN 2 KOORDINATOR TIM SAK 2010', '', 'BUKU', 0, 0, NULL),
(167, '1010301005', 'KODE KBLI 2005 DAN KBJI 2002', '', 'BUKU', 0, 0, NULL),
(168, '1010301005', 'PENJELASAN SINGKAT SAK 2010', '', 'BUKU', 0, 0, NULL),
(169, '1010301005', 'BUKU KAS KECIL', '', 'BUAH', 0, 0, NULL),
(170, '1010301005', 'BUKU KAS BESAR', '', 'BUAH', 0, 0, NULL),
(171, '1010301005', 'BUKU FOLIO ISI 100', '', 'BUKU', 0, 0, NULL),
(172, '1010301005', 'BUKU FOLIO ISI 300', '', '-', 0, 0, NULL),
(173, '1010301005', 'ST2013-SBI.PCS', '', 'Exemplar', 0, 0, NULL),
(174, '1010301005', 'ST2013-SBI.PMS', '', 'Exemplar', 0, 0, NULL),
(175, '1010301005', 'ST2013-SBK.PCS', '', 'Exemplar', 0, 0, NULL),
(176, '1010301005', 'ST2013-SBK.PMS', '', 'Exemplar', 0, 0, NULL),
(177, '1010301005', 'ST2013-SHR.PCS', '', 'Exemplar', 0, 0, NULL),
(178, '1010301005', 'ST2013-SHR.PMS', '', 'Exemplar', 0, 0, NULL),
(179, '1010301005', 'ST2013-SKB.PCS', '', 'Exemplar', 0, 0, NULL),
(180, '1010301005', 'ST2013-SKB.PMS', '', 'Exemplar', 0, 0, NULL),
(181, '1010301005', 'ST2013-SKH.PCS', '', 'Exemplar', 0, 0, NULL),
(182, '123456', 'bola', 'atk', 'Pcs', 2, 15000, 28),
(186, '10000101', 'Buku', 'atk', 'Lusin', 200, 10000, 30),
(187, '9000001', 'BARANG LAGI', 'ARK', 'Buku', 500, 1000, 29),
(188, '100', 'barang1', 'ATK', 'Lembar', 203, 10000, 32),
(198, '001', 'Barang2', 'ATK', 'Kotak', 105, 50000, 33),
(199, '1001', 'Barang3', 'ATK', 'Pack', 105, 50000, 31),
(200, '98765', 'barang5', 'ATK', 'Exemplar', 100, 6000, 34),
(201, '9001', 'barangg', 'ARK', 'Exemplar', 90, 5000, 0),
(202, '100090', 'bar', 'ARK', 'Lembar', 100, 1000, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang_keluar` int(11) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `harga_pengajuan`
--

CREATE TABLE `harga_pengajuan` (
  `id_harga_pengajuan` int(11) NOT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `harga_pengajuan` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `harga_pengajuan`
--

INSERT INTO `harga_pengajuan` (`id_harga_pengajuan`, `id_barang`, `harga_pengajuan`) VALUES
(1, 5, 30000),
(2, 2, 15000),
(3, 4, 30000),
(4, 1, 30000),
(5, 199, 150000),
(6, 187, 3000),
(7, 188, 30000),
(8, 198, 150000),
(9, 182, 45000),
(10, 186, 30000),
(11, 200, 18000),
(12, 3, 0),
(13, NULL, 11000),
(14, NULL, 11000),
(15, NULL, 11000),
(16, NULL, 5500),
(17, NULL, 11000),
(18, NULL, 16500),
(19, NULL, 1100),
(20, NULL, 11000),
(21, NULL, 55000),
(22, NULL, 55000),
(23, NULL, 6600),
(24, NULL, 13000),
(25, NULL, 13000),
(26, NULL, 13000),
(27, NULL, 6500),
(28, NULL, 19500),
(29, NULL, 1300),
(30, NULL, 13000),
(31, NULL, 65000),
(32, NULL, 13000),
(33, NULL, 65000),
(34, NULL, 7800),
(35, NULL, 15000),
(36, NULL, 15000),
(37, NULL, 7500),
(38, NULL, 15000),
(39, 6, 0),
(40, 7, 0),
(41, 9, 0),
(42, 8, 0),
(43, 10, 0),
(44, 14, 0),
(45, 11, 0),
(46, 13, 0),
(47, 12, 0),
(48, 15, 0),
(49, 16, 0),
(50, 18, 0),
(51, 19, 0),
(52, 22, 0),
(53, 17, 0),
(54, 20, 0),
(55, 24, 0),
(56, 21, 0),
(57, 25, 0),
(58, 23, 0),
(59, 26, 0),
(60, 28, 0),
(61, 29, 0),
(62, 31, 0),
(63, 27, 0),
(64, 30, 0),
(65, 33, 0),
(66, 32, 0),
(67, 37, 0),
(68, 36, 0),
(69, 35, 0),
(70, 34, 0),
(71, 38, 0),
(72, 39, 0),
(73, 44, 0),
(74, 41, 0),
(75, 40, 0),
(76, 43, 0),
(77, 42, 0),
(78, 45, 0),
(79, 46, 0),
(80, 47, 0),
(81, 49, 0),
(82, 48, 0),
(83, 50, 0),
(84, 51, 0),
(85, 53, 0),
(86, 52, 0),
(87, 56, 0),
(88, 54, 0),
(89, 57, 0),
(90, 55, 0),
(91, 59, 0),
(92, 58, 0),
(93, 63, 0),
(94, 60, 0),
(95, 64, 0),
(96, 62, 0),
(97, 61, 0),
(98, 65, 0),
(99, 66, 0),
(100, 67, 0),
(101, 68, 0),
(102, 69, 0),
(103, 70, 0),
(104, 71, 0),
(105, 72, 0),
(106, 73, 0),
(107, 74, 0),
(108, 75, 0),
(109, 76, 0),
(110, 79, 0),
(111, 77, 0),
(112, 78, 0),
(113, 80, 0),
(114, 81, 0),
(115, 82, 0),
(116, 83, 0),
(117, 84, 0),
(118, 87, 0),
(119, 85, 0),
(120, 86, 0),
(121, 88, 0),
(122, 89, 0),
(123, 90, 0),
(124, 93, 0),
(125, 91, 0),
(126, 94, 0),
(127, 92, 0),
(128, 99, 0),
(129, 95, 0),
(130, 96, 0),
(131, 97, 0),
(132, 103, 0),
(133, 105, 0),
(134, 98, 0),
(135, 100, 0),
(136, 104, 0),
(137, 101, 0),
(138, 102, 0),
(139, 106, 0),
(140, 109, 0),
(141, 107, 0),
(142, 108, 0),
(143, 110, 0),
(144, 111, 0),
(145, 112, 0),
(146, 113, 0),
(147, 115, 0),
(148, 114, 0),
(149, 116, 0),
(150, 117, 0),
(151, 122, 0),
(152, 119, 0),
(153, 118, 0),
(154, 120, 0),
(155, 121, 0),
(156, 123, 0),
(157, 125, 0),
(158, 127, 0),
(159, 124, 0),
(160, 126, 0),
(161, 129, 0),
(162, 130, 0),
(163, 128, 0),
(164, 131, 0),
(165, 132, 0),
(166, 133, 0),
(167, 134, 0),
(168, 136, 0),
(169, 135, 0),
(170, 137, 0),
(171, 138, 0),
(172, 139, 0),
(173, 140, 0),
(174, 141, 0),
(175, 142, 0),
(176, 143, 0),
(177, 144, 0),
(178, 146, 0),
(179, 147, 0),
(180, 149, 0),
(181, 145, 0),
(182, 148, 0),
(183, 152, 0),
(184, 154, 0),
(185, 153, 0),
(186, 150, 0),
(187, 151, 0),
(188, 155, 0),
(189, 156, 0),
(190, 157, 0),
(191, 160, 0),
(192, 158, 0),
(193, 159, 0),
(194, 161, 0),
(195, 162, 0),
(196, 163, 0),
(197, 164, 0),
(198, 165, 0),
(199, 166, 0),
(200, 167, 0),
(201, 168, 0),
(202, 170, 0),
(203, 171, 0),
(204, 169, 0),
(205, 174, 0),
(206, 172, 0),
(207, 175, 0),
(208, 173, 0),
(209, 176, 0),
(210, 180, 0),
(211, 178, 0),
(212, 177, 0),
(213, 181, 0),
(214, 179, 0),
(2514, 201, 15000),
(2515, 202, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan`
--

CREATE TABLE `pengajuan` (
  `id_pengajuan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengajuan`
--

INSERT INTO `pengajuan` (`id_pengajuan`, `id_user`, `id_barang`, `tanggal`, `jumlah`, `total_harga`, `id_ruangan`, `status`) VALUES
(21, 21, 187, '2024-07-18', 100, 120000, 1, 'Pending'),
(22, 21, 188, '2024-07-18', 5, 51000, 2, 'Pending'),
(24, 21, 187, '2024-07-18', 10, 12000, 3, 'Approved'),
(25, 21, 198, '2024-07-19', 5, 265000, 4, 'Approved'),
(26, 21, 188, '2024-07-19', 3, 30600, 5, 'Approved'),
(27, 21, 199, '2024-07-19', 5, 255000, 6, 'Approved'),
(28, 21, 1, '2024-07-22', 5, 60000, 7, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `permintaan`
--

CREATE TABLE `permintaan` (
  `id_permintaan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permintaan`
--

INSERT INTO `permintaan` (`id_permintaan`, `id_user`, `id_barang`, `tanggal`, `jumlah`, `id_ruangan`, `status`) VALUES
(90, 21, 1, '2024-07-18', 35, 7, 'Approved'),
(94, 21, 3, '2024-07-18', 4, 7, 'Approved'),
(99, 22, 187, '2024-07-18', 10, 8, 'Approved'),
(100, 22, 3, '2024-07-18', 5, 8, 'Rejected'),
(126, 22, 201, '2024-07-23', 5, 7, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `ruangan` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `jabatan`, `ruangan`, `username`, `password`) VALUES
(20, 'Susis', 'Ahli', 'Loby', 'loby1', '$2y$10$oYrup.JKOPB2TOe8PAGJzeCwzr1LZ.sgUEHyPjGTZoi24dh/dZOSO'),

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `admin_pengajuan`
--
ALTER TABLE `admin_pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`);

--
-- Indexes for table `admin_ruangan`
--
ALTER TABLE `admin_ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `id_harga_pengajuan` (`id_harga_pengajuan`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barang_keluar`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `harga_pengajuan`
--
ALTER TABLE `harga_pengajuan`
  ADD PRIMARY KEY (`id_harga_pengajuan`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`),
  ADD UNIQUE KEY `id_ruangan` (`id_ruangan`);

--
-- Indexes for table `permintaan`
--
ALTER TABLE `permintaan`
  ADD PRIMARY KEY (`id_permintaan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `permintaan_ibfk_3` (`id_ruangan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_pengajuan`
--
ALTER TABLE `admin_pengajuan`
  MODIFY `id_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_ruangan`
--
ALTER TABLE `admin_ruangan`
  MODIFY `id_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id_barang_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id_barang_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `harga_pengajuan`
--
ALTER TABLE `harga_pengajuan`
  MODIFY `id_harga_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2516;

--
-- AUTO_INCREMENT for table `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `id_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `permintaan`
--
ALTER TABLE `permintaan`
  MODIFY `id_permintaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `harga_pengajuan`
--
ALTER TABLE `harga_pengajuan`
  ADD CONSTRAINT `harga_pengajuan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD CONSTRAINT `id_ruangan_ibfk_1` FOREIGN KEY (`id_ruangan`) REFERENCES `admin_ruangan` (`id_ruangan`);

--
-- Constraints for table `permintaan`
--
ALTER TABLE `permintaan`
  ADD CONSTRAINT `permintaan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permintaan_ibfk_3` FOREIGN KEY (`id_ruangan`) REFERENCES `admin_ruangan` (`id_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
