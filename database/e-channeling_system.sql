-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2024 at 01:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-channeling_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_NIC` varchar(15) DEFAULT NULL,
  `channeling_schedule_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_NIC`, `channeling_schedule_id`, `appointment_date`, `appointment_time`, `status`) VALUES
(39, '123456788', 9, '2024-07-17', '11:24:00', 'Confirmed'),
(40, '123456788', 11, '2024-07-18', '08:33:00', 'Confirmed'),
(41, '123456788', 6, '2024-07-23', '22:14:00', 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `channeling_schedule`
--

CREATE TABLE `channeling_schedule` (
  `id` int(11) NOT NULL,
  `doctor_id` varchar(50) NOT NULL,
  `channeling_date` date NOT NULL,
  `time` varchar(20) NOT NULL,
  `max_patients` int(11) NOT NULL,
  `current_patients` int(11) DEFAULT 0,
  `appointment` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `channeling_schedule`
--

INSERT INTO `channeling_schedule` (`id`, `doctor_id`, `channeling_date`, `time`, `max_patients`, `current_patients`, `appointment`) VALUES
(1, 'D001', '2024-07-18', '22:30', 22, 13, 0),
(5, 'D002', '2024-07-19', '22:00', 11, 7, 0),
(6, 'D002', '2024-07-23', '21:00', 21, 5, 0),
(9, 'D003', '2024-07-17', '20:30', 11, 6, 0),
(11, 'D003', '2024-07-18', '08:30', 21, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `userID` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `specialization` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`userID`, `name`, `password`, `phone`, `specialization`) VALUES
('D001', 'Dr. Tharaka Rupasinghe', '123@', '123-456-7890', 'Cardiology'),
('D002', 'Dr. Dilshan Rupasinghe', '123', '123-456-7890', 'Neurology'),
('D003', 'Dr. Sugandhi Rupasinghe', '12345', '123-456-7890', 'Pediatrics');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `NIC` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`NIC`, `name`, `password`, `phone`, `Address`, `email`) VALUES
('123456786', 'Sampath Dilshan ', '12345', '123-456-7890', NULL, 'example1@mail.com'),
('123456787', 'Kamal Ranasinghe', '12345', '123-456-7890', NULL, 'example2@mail.com'),
('123456788', 'Nesitha Kumara', '123@', '123-456-7890', NULL, 'example3@mail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD UNIQUE KEY `unique_patient_schedule` (`patient_NIC`,`channeling_schedule_id`),
  ADD KEY `channeling_schedule_id` (`channeling_schedule_id`);

--
-- Indexes for table `channeling_schedule`
--
ALTER TABLE `channeling_schedule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_unique_schedule` (`doctor_id`,`channeling_date`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`NIC`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `channeling_schedule`
--
ALTER TABLE `channeling_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_NIC`) REFERENCES `patients` (`NIC`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`channeling_schedule_id`) REFERENCES `channeling_schedule` (`id`);

--
-- Constraints for table `channeling_schedule`
--
ALTER TABLE `channeling_schedule`
  ADD CONSTRAINT `channeling_schedule_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
