-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-12-2018 a las 05:43:46
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `puntodeventa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `id_articulo` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `precio_venta` int(11) NOT NULL,
  `precio_costo` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `cod_tipo_articulo` int(11) NOT NULL,
  `cod_proveedor` varchar(20) NOT NULL,
  `fecha_ingreso` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id_articulo`, `descripcion`, `precio_venta`, `precio_costo`, `stock`, `cod_tipo_articulo`, `cod_proveedor`, `fecha_ingreso`) VALUES
(13, 'Casco', 800, 500, 14, 3, '8586', '2018-12-1'),
(15, 'lata', 222, 221, 18, 3, '1233333', '2018-12-5'),
(16, 'llanta', 100, 100, 4, 1, '1233333', '2018-12-19'),
(17, 'guantes', 100, 80, 4, 1, '1233333', '2018-12-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `Codigo_ciudad` int(11) NOT NULL,
  `Nombre_ciudad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`Codigo_ciudad`, `Nombre_ciudad`) VALUES
(1, 'Veracruz'),
(2, 'México'),
(3, 'CDMX'),
(4, 'Tlaxcala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Documento` varchar(15) NOT NULL,
  `cod_tipo_documento` int(11) NOT NULL,
  `Nombres` varchar(30) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `Direccion` varchar(20) DEFAULT NULL,
  `cod_ciudad` int(11) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Documento`, `cod_tipo_documento`, `Nombres`, `Apellidos`, `Direccion`, `cod_ciudad`, `Telefono`) VALUES
('000', 1, 'rrr', 'rrr', 'rrr', 1, '123123123'),
('123', 1, 'qwe', 'qwe', 'qwe', 1, '123'),
('2121', 1, 'nombre de prueba', 'prueba', 'calle desconocida', 1, '12334545673'),
('5656', 2, 'test', 'test', 'test', 1, '123'),
('666', 1, 'Chango', 'Marango', 'Cualquiera 23', 1, '98798798'),
('8585', 1, 'nombre de prueba', 'prueba', 'direccion de prueba', 1, '312654987');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `cod_factura` varchar(20) NOT NULL,
  `cod_articulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`cod_factura`, `cod_articulo`, `cantidad`, `total`) VALUES
('FACT-10107899', 17, 1, '100'),
('FACT-101091066', 13, 1, '800'),
('FACT-67108106', 13, 1, '800'),
('FACT-689986', 15, 1, '222'),
('FACT-6976910', 13, 2, '1600'),
('FACT-6976910', 15, 2, '444'),
('FACT-766796', 16, 1, '100'),
('FACT-798768', 13, 1, '800'),
('FACT-798768', 15, 1, '222'),
('FACT-886769', 13, 1, '800'),
('FACT-969967', 13, 1, '800'),
('FACT-996798', 13, 2, '1600');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `cod_detallefactura` varchar(20) NOT NULL,
  `cod_detallearticulo` int(11) NOT NULL,
  `Motivo` varchar(15) NOT NULL,
  `Fecha_devolucion` varchar(10) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `Nnm_factura` varchar(20) NOT NULL,
  `cod_cliente` varchar(15) NOT NULL,
  `Nombre_empleado` varchar(30) NOT NULL,
  `Fecha_facturacion` varchar(15) NOT NULL,
  `cod_formapago` int(11) NOT NULL,
  `total_factura` decimal(10,0) DEFAULT NULL,
  `IVA` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`Nnm_factura`, `cod_cliente`, `Nombre_empleado`, `Fecha_facturacion`, `cod_formapago`, `total_factura`, `IVA`) VALUES
('FACT-10107899', '000', '', '19/12/2018', 1, '100', '19'),
('FACT-101091066', '000', '', '19/12/2018', 3, '800', '128'),
('FACT-1097978', '2121', 'vendedor1', '25/11/2018', 1, '120000', '19200'),
('FACT-67108106', '000', '', '19/12/2018', 1, '800', '128'),
('FACT-689986', '000', '', '19/12/2018', 1, NULL, NULL),
('FACT-6976910', '000', '', '19/12/2018', 1, '2044', '327'),
('FACT-766796', '000', '', '19/12/2018', 1, NULL, NULL),
('FACT-787688', '8585', 'vendedor1', '25/11/2018', 1, '150000', '24000'),
('FACT-798768', '123', '', '19/12/2018', 1, '1022', '164'),
('FACT-886769', '000', '', '19/12/2018', 1, '800', '128'),
('FACT-89101079', '2121', 'puto', '28/11/2018', 1, NULL, NULL),
('FACT-91071086', '000', '', '19/12/2018', 1, NULL, NULL),
('FACT-969967', '000', '', '19/12/2018', 1, '800', '128'),
('FACT-996798', '000', '', '19/12/2018', 1, '1600', '256');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_de_pago`
--

CREATE TABLE `forma_de_pago` (
  `id_formapago` int(11) NOT NULL,
  `Descripcion_formapago` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `forma_de_pago`
--

INSERT INTO `forma_de_pago` (`id_formapago`, `Descripcion_formapago`) VALUES
(1, 'EFECTIVO'),
(2, 'TARJETA DE CREDITO'),
(3, 'PAGO COMBINADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `No_documento` varchar(20) NOT NULL,
  `cod_tipo_documento` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Nombre_comercial` varchar(20) NOT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `cod_ciudad` int(11) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`No_documento`, `cod_tipo_documento`, `Nombre`, `Apellido`, `Nombre_comercial`, `direccion`, `cod_ciudad`, `Telefono`) VALUES
('1233333', 1, 'qweeee', 'qweeee', 'qweeeeee', 'qweeee', 1, '123333'),
('22', 1, 'tteat', 'teat', 'testttttt', 'teat', 3, '2'),
('2223', 1, 'Fulanito', 'de tal', 'YAMAHA', 'calle desconocida', 1, '123123123123'),
('8586', 2, 'Fernando', 'Fulano', 'Proveedora tal', 'direccion fantasma', 1, '12323453456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_articulo`
--

CREATE TABLE `tipo_articulo` (
  `id_tipoarticulo` int(11) NOT NULL,
  `descripcion_articulo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_articulo`
--

INSERT INTO `tipo_articulo` (`id_tipoarticulo`, `descripcion_articulo`) VALUES
(1, 'Casco'),
(2, 'Refacciones '),
(3, 'Llantas '),
(4, 'Luces  '),
(5, 'Ropa '),
(6, 'Accesorios '),
(7, 'Piezas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_clientes`
--

CREATE TABLE `tipo_clientes` (
  `id_cliente` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_clientes`
--

INSERT INTO `tipo_clientes` (`id_cliente`, `descripcion`) VALUES
(1, 'Cliente Mayoreo'),
(2, 'Cliente Menudeo ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_documento`
--

CREATE TABLE `tipo_de_documento` (
  `id_tipo_documento` int(11) NOT NULL,
  `Descripcion` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_de_documento`
--

INSERT INTO `tipo_de_documento` (`id_tipo_documento`, `Descripcion`) VALUES
(1, 'Tipo 1'),
(2, 'Tipo 2'),
(3, 'Tipo 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuarios`
--

CREATE TABLE `tipo_usuarios` (
  `id` int(15) NOT NULL,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_usuarios`
--

INSERT INTO `tipo_usuarios` (`id`, `nombre`) VALUES
(1, 'Usuario'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` int(15) NOT NULL,
  `usuario` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `id_tipo` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `usuario`, `password`, `nombre`, `id_tipo`) VALUES
(5, 'dis', 'dis', 'dis', 1),
(8, 'administrador', 'admin', 'Fernando', 2),
(9, 'Cajero', 'cajero', 'CAJERO', 1),
(12, 'cajero2', 'caja', 'cajero2', 1),
(13, 'cajero3', 'caja', 'cajero3', 1),
(14, 'cajero5', 'cajero', 'cajero', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`id_articulo`),
  ADD KEY `ref_tipo_articulo_idx` (`cod_tipo_articulo`),
  ADD KEY `ref_prov_art_idx` (`cod_proveedor`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`Codigo_ciudad`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Documento`),
  ADD KEY `cod_tipodocumento_idx` (`cod_tipo_documento`),
  ADD KEY `ref_ciudad_idx` (`cod_ciudad`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`cod_factura`,`cod_articulo`),
  ADD KEY `ref_facturacion_idx` (`cod_factura`),
  ADD KEY `ref_ar_fact_idx` (`cod_articulo`);

--
-- Indices de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`cod_detallefactura`,`cod_detallearticulo`),
  ADD KEY `ref_detallefactu_idx` (`cod_detallefactura`),
  ADD KEY `ref_deta_art_idx` (`cod_detallearticulo`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Nnm_factura`),
  ADD KEY `ref_cli_idx` (`cod_cliente`),
  ADD KEY `ref_formapago_idx` (`cod_formapago`);

--
-- Indices de la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  ADD PRIMARY KEY (`id_formapago`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`No_documento`),
  ADD KEY `ref_prov_ciudad_idx` (`cod_ciudad`),
  ADD KEY `proveedor_ibfk_1` (`cod_tipo_documento`);

--
-- Indices de la tabla `tipo_articulo`
--
ALTER TABLE `tipo_articulo`
  ADD PRIMARY KEY (`id_tipoarticulo`);

--
-- Indices de la tabla `tipo_clientes`
--
ALTER TABLE `tipo_clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `tipo_de_documento`
--
ALTER TABLE `tipo_de_documento`
  ADD PRIMARY KEY (`id_tipo_documento`);

--
-- Indices de la tabla `tipo_usuarios`
--
ALTER TABLE `tipo_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `id_articulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `Codigo_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  MODIFY `id_formapago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_articulo`
--
ALTER TABLE `tipo_articulo`
  MODIFY `id_tipoarticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_clientes`
--
ALTER TABLE `tipo_clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_de_documento`
--
ALTER TABLE `tipo_de_documento`
  MODIFY `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_usuarios`
--
ALTER TABLE `tipo_usuarios`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `ref_prov_art` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedor` (`No_documento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ref_tipo_articulo` FOREIGN KEY (`cod_tipo_articulo`) REFERENCES `tipo_articulo` (`id_tipoarticulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `ref_ciudad` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`Codigo_ciudad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ref_tipo_doc` FOREIGN KEY (`cod_tipo_documento`) REFERENCES `tipo_de_documento` (`id_tipo_documento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `ref_ar_fact` FOREIGN KEY (`cod_articulo`) REFERENCES `articulo` (`id_articulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ref_facturacion` FOREIGN KEY (`cod_factura`) REFERENCES `factura` (`Nnm_factura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `ref_deta_art` FOREIGN KEY (`cod_detallearticulo`) REFERENCES `detalle_factura` (`cod_articulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ref_detallefactu` FOREIGN KEY (`cod_detallefactura`) REFERENCES `detalle_factura` (`cod_factura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `ref_cli` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`Documento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ref_formapago` FOREIGN KEY (`cod_formapago`) REFERENCES `forma_de_pago` (`id_formapago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`cod_tipo_documento`) REFERENCES `tipo_de_documento` (`id_tipo_documento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ref_prov_ciudad` FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`Codigo_ciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
