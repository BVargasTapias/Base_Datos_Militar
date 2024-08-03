-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-08-2024 a las 04:18:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base_militar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañias`
--

CREATE TABLE `compañias` (
  `id_com` int(11) NOT NULL,
  `act_com` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles`
--

CREATE TABLE `cuarteles` (
  `id_cua` int(11) NOT NULL,
  `nom_cua` varchar(30) DEFAULT NULL,
  `ubi_cua` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpos_ejercito`
--

CREATE TABLE `cuerpos_ejercito` (
  `id_cue` int(11) NOT NULL,
  `den_sol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuertel_compañia`
--

CREATE TABLE `cuertel_compañia` (
  `id_cua` int(11) DEFAULT NULL,
  `id_com` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_ser` int(11) NOT NULL,
  `act_ser` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_soldado`
--

CREATE TABLE `servicio_soldado` (
  `id_sol` int(11) DEFAULT NULL,
  `id_ser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado`
--

CREATE TABLE `soldado` (
  `id_sol` int(11) NOT NULL,
  `nom_sol` varchar(30) DEFAULT NULL,
  `ape_sol` varchar(30) DEFAULT NULL,
  `id_cuartel1` int(11) DEFAULT NULL,
  `id_cuerpo` int(11) DEFAULT NULL,
  `id_compañia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compañias`
--
ALTER TABLE `compañias`
  ADD PRIMARY KEY (`id_com`);

--
-- Indices de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  ADD PRIMARY KEY (`id_cua`);

--
-- Indices de la tabla `cuerpos_ejercito`
--
ALTER TABLE `cuerpos_ejercito`
  ADD PRIMARY KEY (`id_cue`);

--
-- Indices de la tabla `cuertel_compañia`
--
ALTER TABLE `cuertel_compañia`
  ADD KEY `fk_id_seis` (`id_cua`),
  ADD KEY `fk_id_siete` (`id_com`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_ser`);

--
-- Indices de la tabla `servicio_soldado`
--
ALTER TABLE `servicio_soldado`
  ADD KEY `fk_id_cuatro` (`id_sol`),
  ADD KEY `fk_id_cinco` (`id_ser`);

--
-- Indices de la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD PRIMARY KEY (`id_sol`),
  ADD KEY `fk_id_uno` (`id_cuartel1`),
  ADD KEY `fk_id_dos` (`id_cuerpo`),
  ADD KEY `fk_id_tres` (`id_compañia`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuertel_compañia`
--
ALTER TABLE `cuertel_compañia`
  ADD CONSTRAINT `fk_id_seis` FOREIGN KEY (`id_cua`) REFERENCES `cuarteles` (`id_cua`),
  ADD CONSTRAINT `fk_id_siete` FOREIGN KEY (`id_com`) REFERENCES `compañias` (`id_com`);

--
-- Filtros para la tabla `servicio_soldado`
--
ALTER TABLE `servicio_soldado`
  ADD CONSTRAINT `fk_id_cinco` FOREIGN KEY (`id_ser`) REFERENCES `servicio` (`id_ser`),
  ADD CONSTRAINT `fk_id_cuatro` FOREIGN KEY (`id_sol`) REFERENCES `soldado` (`id_sol`);

--
-- Filtros para la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD CONSTRAINT `fk_id_dos` FOREIGN KEY (`id_cuerpo`) REFERENCES `cuerpos_ejercito` (`id_cue`),
  ADD CONSTRAINT `fk_id_tres` FOREIGN KEY (`id_compañia`) REFERENCES `compañias` (`id_com`),
  ADD CONSTRAINT `fk_id_uno` FOREIGN KEY (`id_cuartel1`) REFERENCES `cuarteles` (`id_cua`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
