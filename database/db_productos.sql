-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2022 a las 15:07:01
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_productos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `tipo_producto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `tipo_producto`) VALUES
(1, 'Frutos secos'),
(2, 'Condimentos'),
(3, 'Harina'),
(4, 'Cereales'),
(5, 'Reposteria'),
(6, 'Legumbres'),
(7, 'Semillas'),
(11, 'Frescos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_productos`
--

CREATE TABLE `lista_productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(200) NOT NULL,
  `precio` int(11) NOT NULL,
  `id_categoria` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lista_productos`
--

INSERT INTO `lista_productos` (`id_producto`, `nombre_producto`, `precio`, `id_categoria`) VALUES
(1, 'Adobo para pizza x 100 grs.', 71, 2),
(2, 'Ajo en polvo x 100 grs.', 82, 2),
(3, 'Condimento para arroz x 100 grs.', 75, 2),
(4, 'Orégano x 100 grs.', 84, 2),
(5, 'Pimentón x 100 grs.', 82, 2),
(6, 'Provenzal x 100 grs.', 95, 2),
(7, 'Chia x 100 grs.', 120, 7),
(8, 'Girasol pelado entero x 100 grs.', 80, 7),
(9, 'Lino x 100 grs.', 47, 7),
(10, 'Almendras x 100 grs.', 180, 1),
(11, 'Ciruela bombón x 100 grs.', 180, 1),
(12, 'Granola clásica x 100 grs.', 60, 1),
(13, 'Granola tropical x 100 grs.', 95, 1),
(14, 'Nueces peladas mariposa', 256, 1),
(15, 'Harina de Algarroba x 100 grs.', 53, 3),
(16, 'Harina de Almendras x 100 grs.', 224, 3),
(17, 'Harina de Arroz x 500 grs.', 183, 3),
(18, 'Harina de Coco x 500 grs.', 580, 3),
(19, 'Harina de soja x 500 grs.', 149, 3),
(20, 'Bolitas de chocolate x 300 grs.', 220, 4),
(21, 'Copos azucarados x 300 grs.', 210, 4),
(22, 'Copos naturales x 300 grs.', 180, 4),
(23, 'Aritos frutales x 300 grs.', 230, 4),
(24, 'Azúcar impalpable x 500 grs.', 172, 5),
(25, 'Azúcar negra x 500 grs.', 165, 5),
(26, 'Coco rallado x 500 grs.', 871, 5),
(27, 'Polvo para hornear x 100 grs.', 90, 5),
(28, 'Arroz integral x 500 grs.', 90, 6),
(29, 'Garbanzos x 500 grs.', 125, 6),
(30, 'Porotos Alubia x 500 grs.', 110, 6),
(31, 'Porotos Negros x 500 grs.', 175, 6),
(45, 'Mix frutos secos x 100grs', 210, 4),
(48, 'Pasas de uvas x 100 grs.', 54, 1),
(53, 'Canela molida x 100 grs.', 240, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `name`, `email`, `password`) VALUES
(1, 'Florencia', 'florenciabz@gmail.com', '$2a$12$M3/GzKRUUb0z9T6S/Cc0Qe7mrgtMrn8uXtgNjRyNDAdOlcmq21VAy');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `lista_productos`
--
ALTER TABLE `lista_productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `lista_productos`
--
ALTER TABLE `lista_productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lista_productos`
--
ALTER TABLE `lista_productos`
  ADD CONSTRAINT `lista_productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
