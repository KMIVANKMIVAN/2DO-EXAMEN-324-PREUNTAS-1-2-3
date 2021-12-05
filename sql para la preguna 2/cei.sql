-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-11-2021 a las 20:44:12
-- Versión del servidor: 8.0.18
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cei`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flujocondicionante`
--

CREATE TABLE `flujocondicionante` (
  `proceso` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Si` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `No` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `flujocondicionante`
--

INSERT INTO `flujocondicionante` (`proceso`, `Si`, `No`) VALUES
('P3', 'P5', 'P4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flujoproceso`
--

CREATE TABLE `flujoproceso` (
  `flujo` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `proceso` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rol` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `procesosiguiente` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `formulario` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `flujoproceso`
--

INSERT INTO `flujoproceso` (`flujo`, `proceso`, `tipo`, `rol`, `procesosiguiente`, `formulario`) VALUES
('F1', 'P1', 'I', 'Postulante', 'P2', 'presentacionDoc'),
('F1', 'P2', 'P', 'Comite', 'P3', 'revisionDoc'),
('F1', 'P3', 'C', 'Comite', 'P5', 'estaHabilitado'),
('F1', 'P5', 'P', 'Comite', 'P6', 'presentarCandidato'),
('F1', 'P6', 'F', 'Comite', NULL, 'elecciones'),
('F2', 'P1', 'I', 'Postulante', 'P2', 'presentacionDoc'),
('F2', 'P2', 'P', 'Comite', 'P3', 'revisionDoc'),
('F2', 'P3', 'C', 'Comite', 'P5', 'estaHabilitado'),
('F2', 'P5', 'P', 'Comite', 'P6', 'presentarCandidato'),
('F2', 'P6', 'F', 'Comite', NULL, 'elecciones'),
('F3', 'P1', 'I', 'Postulante', 'P2', 'presentacionDoc'),
('F3', 'P2', 'P', 'Comite', 'P3', 'revisionDoc'),
('F3', 'P3', 'C', 'Comite', 'P4', 'estaInabilitado'),
('F3', 'P4', 'F', 'Comite', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulante`
--

CREATE TABLE `postulante` (
  `postulante` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contrasenia` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rol` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `postulante`
--

INSERT INTO `postulante` (`postulante`, `contrasenia`, `rol`) VALUES
('frente IP', '8433318', 'Postulante'),
('frente GIT', '8433318', 'Postulante'),
('frente WOR', '8433318', 'Postulante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento`
--

CREATE TABLE `seguimiento` (
  `notramite` int(11) DEFAULT NULL,
  `postulante` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `flujo` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `proceso` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fechainicio` datetime DEFAULT NULL,
  `fechafin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguimiento`
--

INSERT INTO `seguimiento` (`notramite`, `postulante`, `flujo`, `proceso`, `fechainicio`, `fechafin`) VALUES
(100, 'frente IP', 'F1', 'P1', '2021-10-13 10:00:00', '2021-10-13 12:00:00'),
(100, 'frente IP', 'F1', 'P2', '2021-10-13 12:00:00', '2021-10-13 13:00:00'),
(100, 'frente IP', 'F1', 'P3', '2021-10-13 13:00:00', '2021-10-13 14:00:00'),
(100, 'frente IP', 'F1', 'P5', '2021-10-13 14:00:00', '2021-10-13 15:00:00'),
(100, 'frente IP', 'F1', 'P6', '2021-10-30 10:00:00', '2021-10-30 15:00:00'),
(200, 'frente GIT', 'F2', 'P1', '2021-10-13 10:00:00', '2021-10-13 12:00:00'),
(200, 'frente GIT', 'F2', 'P2', '2021-10-13 12:00:00', '2021-10-13 13:00:00'),
(200, 'frente GIT', 'F2', 'P3', '2021-10-13 13:00:00', '2021-10-13 14:00:00'),
(200, 'frente GIT', 'F2', 'P5', '2021-10-13 14:00:00', '2021-10-13 15:00:00'),
(200, 'frente GIT', 'F2', 'P6', '2021-10-30 10:00:00', '2021-10-30 15:00:00'),
(300, 'frente WOR', 'F3', 'P1', '2021-10-13 10:00:00', '2021-10-13 12:00:00'),
(300, 'frente WOR', 'F3', 'P2', '2021-10-13 12:00:00', '2021-10-13 13:00:00'),
(300, 'frente WOR', 'F3', 'P3', '2021-10-13 13:00:00', '2021-10-13 14:00:00'),
(300, 'frente WOR', 'F3', 'P4', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
