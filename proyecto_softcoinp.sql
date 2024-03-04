-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 19-02-2024 a las 17:45:36
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_softcoinp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

DROP TABLE IF EXISTS `acceso`;
CREATE TABLE IF NOT EXISTS `acceso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idPersona` int NOT NULL,
  `fecha_hora_ingreso` date NOT NULL,
  `motivo` varchar(50) NOT NULL,
  `IdPuerta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IdPuerta` (`IdPuerta`),
  KEY `idPersona` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `tipo_de_persona_id` int NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_de_persona_id` (`tipo_de_persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `cedula`, `nombre`, `apellido`, `direccion`, `telefono`, `tipo_de_persona_id`, `correo_electronico`, `cargo`) VALUES
(1, '9739762', 'DUVAN', 'VERA', 'CALLE 27N # 5-00 ARMENIA QUINDIO ', '3156854375', 1, 'vera.duvan3@gmail.com', 'aprendiz SENA '),
(2, '123456789', 'JOSE ', 'RAMIREZ', 'CALLE 1N # 23-45 BOGOTA CUNDINAMARCA', '3101234567', 1, 'joseramirez@gmail.com', 'operario'),
(3, '9876543', 'MARIA', 'FLOREZ', 'CARRERA 15 # 3-02 ARMENIA QUINDIO ', '3109876543', 3, 'mariaflorez@gmail.com', 'emfermera'),
(4, '1094123456', 'JUAN ', 'BARRETO', 'CALLE 19 # 20A-12 PEREIRA RISARLDA', '3151234567', 2, 'juanbarreto@hotmail.com', 'transportador de argos'),
(5, '412345678', 'OLGA ', 'GUZMAN', 'AV.CENTENARIO # 3-180 ARMENIA QUINDIO', '3001234567', 2, 'olgaguzman@yahoo.com', 'asesora comercial argos'),
(6, '9123456', 'JOSE LUIS ', 'DODO', 'CALLE 3 #5-28 COMUNA 3 SANTA MARTA MAGDALENA ', '3103692581', 1, 'josedodo@hotmail.com', 'jefe de recursos humanos ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puerta`
--

DROP TABLE IF EXISTS `puerta`;
CREATE TABLE IF NOT EXISTS `puerta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `puerta`
--

INSERT INTO `puerta` (`id`, `ubicacion`, `descripcion`) VALUES
(1, 'puerta principal ', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

DROP TABLE IF EXISTS `tipo_persona`;
CREATE TABLE IF NOT EXISTS `tipo_persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo_persona`
--

INSERT INTO `tipo_persona` (`id`, `descripcion`) VALUES
(1, 'EMPLEADO'),
(2, 'PROVEEDOR'),
(3, 'VISITANTE');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`IdPuerta`) REFERENCES `puerta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `acceso_ibfk_2` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`tipo_de_persona_id`) REFERENCES `tipo_persona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
