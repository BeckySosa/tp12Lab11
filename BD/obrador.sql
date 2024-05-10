-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2024 a las 22:34:36
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `obrador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `dni` bigint(20) NOT NULL,
  `apellido` varchar(58) NOT NULL,
  `nombre` varchar(58) NOT NULL,
  `acceso` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `dni`, `apellido`, `nombre`, `acceso`, `estado`) VALUES
(1, 11111111, 'Federer', 'Roger', 2, 0),
(2, 22222222, 'Nadal', 'Rafael', 3, 1),
(3, 33333333, 'Djokovic', 'Novak', 2, 1),
(4, 34578932, 'Eliseo', 'Avaca', 3, 1),
(5, 23456456, 'Nando', 'Aguero', 2, 1),
(6, 12356986, 'Gerardo', 'Moya', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

CREATE TABLE `herramienta` (
  `idHerramienta` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `herramienta`
--

INSERT INTO `herramienta` (`idHerramienta`, `nombre`, `descripcion`, `stock`, `estado`) VALUES
(1, 'Martillo', 'Stanley', 5, 0),
(2, 'Cinta', 'CrossMaster', 8, 1),
(3, 'Escuadra', 'Bremen', 10, 1),
(4, 'Taladro', 'Maquita', 15, 1),
(5, 'Lijadora', 'Bosh', 4, 1),
(6, 'Amoladora', 'Black Decker', 10, 1),
(7, 'Pala', 'Ancha', 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `idMovimiento` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idHerramienta` int(11) NOT NULL,
  `fechaP` date NOT NULL,
  `fechaD` date DEFAULT NULL,
  `cantidadRet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`idMovimiento`, `idEmpleado`, `idHerramienta`, `fechaP`, `fechaD`, `cantidadRet`) VALUES
(1, 1, 1, '2024-04-10', NULL, 1),
(2, 1, 2, '2024-04-05', NULL, 1),
(3, 2, 3, '2024-04-07', NULL, 1),
(4, 2, 4, '2024-04-03', NULL, 1),
(5, 3, 5, '2024-04-01', NULL, 1),
(6, 3, 1, '2024-04-01', NULL, 1),
(7, 1, 1, '2024-04-10', '2024-04-11', -1),
(8, 1, 2, '2024-04-05', '2024-04-06', -1),
(9, 2, 3, '2024-04-07', '2024-04-08', -1),
(10, 2, 4, '2024-04-03', '2024-04-04', -1),
(11, 3, 5, '2024-04-01', '2024-04-02', -1),
(12, 3, 1, '2024-04-01', '2024-04-02', -1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`idHerramienta`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`idMovimiento`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idHerramienta` (`idHerramienta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  MODIFY `idHerramienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `idMovimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`idHerramienta`) REFERENCES `herramienta` (`idHerramienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
