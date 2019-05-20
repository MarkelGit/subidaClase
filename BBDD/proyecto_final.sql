-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2019 a las 08:59:46
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_final`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `allCategorias` ()  NO SQL
SELECT * FROM categoria$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `allProductos` ()  NO SQL
SELECT * FROM producto$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `allSubcategorias` ()  NO SQL
SELECT * from subcategoria$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productosByIdCategoria` (IN `id` INT)  NO SQL
SELECT producto.* FROM `producto` JOIN subcategoria ON producto.id_subcategoria=subcategoria.id_subcategoria WHERE subcategoria.id_categoria=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productosByIdProducto` (IN `id` INT)  NO SQL
SELECT * from producto WHERE id_producto=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `productosByIdSubcategoria` (IN `id` INT)  NO SQL
SELECT * FROM producto WHERE id_subcategoria=id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Comic'),
(2, 'Manga');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `nombre_cliente` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_cliente` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `direccion_cliente` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_tarjeta` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `caducidad_tarjeta` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `cvc_tarjeta` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_compra` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `precio_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `nombre_cliente`, `apellido_cliente`, `direccion_cliente`, `numero_tarjeta`, `caducidad_tarjeta`, `cvc_tarjeta`, `fecha_compra`, `precio_total`) VALUES
(1, 'Paco', 'Sanz', 'calle falsa 123', '12324324323', '07/05/2022', '3213', '07/05/2019', 140.25),
(2, 'Markel', 'Rodriguez', 'calle falsa 123', '21312343', '07/05/2022', '2222', '07/05/2019', 182.2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuera_stock`
--

CREATE TABLE `fuera_stock` (
  `registro_id` int(11) NOT NULL,
  `registro_nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `registro_precio` double NOT NULL,
  `registro_descripcion` varchar(456) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registro_stock` int(11) NOT NULL,
  `registro_imagen` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `registro_id_subcategoria` int(11) NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `historico` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Disparadores `fuera_stock`
--
DELIMITER $$
CREATE TRIGGER `fuera_stock_AD` AFTER DELETE ON `fuera_stock` FOR EACH ROW INSERT INTO `producto`(`id_producto`, `nombre_producto`, `precio_producto`, `descripcion`, `stock`, `imagen`, `id_subcategoria`) SELECT 					old.registro_id,old.registro_nombre,old.registro_precio,old.registro_descripcion,old.registro_stock,old.registro_imagen,old.registro_id_subcategoria FROM fuera_stock WHERE historico = false OR registro_stock > 0
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `fuera_stock_AU` AFTER UPDATE ON `fuera_stock` FOR EACH ROW INSERT INTO `historico_producto`(`historico_id_producto`, `historico_nombre_producto`, `historico_precio_producto`, `historico_descripcion`, `historico_stock`, `historico_imagen`, `historico_id_subcategoria`, `fecha_eliminacion`) SELECT `registro_id`, `registro_nombre`, `registro_precio`, `registro_descripcion`, `registro_stock`, `registro_imagen`, `registro_id_subcategoria`, `fecha_eliminacion` FROM `fuera_stock` WHERE historico = true
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_producto`
--

CREATE TABLE `historico_producto` (
  `historico_id_producto` int(11) NOT NULL,
  `historico_nombre_producto` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `historico_precio_producto` double NOT NULL,
  `historico_descripcion` varchar(874) COLLATE utf8_unicode_ci DEFAULT NULL,
  `historico_stock` int(11) NOT NULL,
  `historico_imagen` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `historico_id_subcategoria` int(11) NOT NULL,
  `fecha_eliminacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `historico_producto`
--

INSERT INTO `historico_producto` (`historico_id_producto`, `historico_nombre_producto`, `historico_precio_producto`, `historico_descripcion`, `historico_stock`, `historico_imagen`, `historico_id_subcategoria`, `fecha_eliminacion`) VALUES
(5, 'proba', 10, 'hola', 2, 'no', 0, '2019-05-10'),
(6, 'proba', 5, NULL, 2, 'no', 0, '2019-05-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

CREATE TABLE `linea` (
  `id_linea` int(11) NOT NULL,
  `nombre_producto` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_linea` double NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `precio_producto` double NOT NULL,
  `descripcion` varchar(874) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `id_subcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `precio_producto`, `descripcion`, `stock`, `imagen`, `id_subcategoria`) VALUES
(1, 'Akira 01', 22.5, 'En la hostil y caótica megalópolis de Neo Tokyo, Tetsuo y sus compañeros deberán averiguar el enigma de Akira, bajo el cual se esconde el más escalofriante secreto científico. La edición definitiva de una obra maestra del cómic japonés y también mundial- que no debe faltar en la estantería de cualquier aficionado al cómic en general.', 10, 'https://images-na.ssl-images-amazon.com/images/I/51PhfWmsbzL._SX356_BO1,204,203,200_.jpg', 9),
(2, 'El viejo Logan', 20.55, 'El equipo creativo de la monumental Civil War, regresa para narrarte una epopeya apocalíptica protagonizada por Lobezno en el mejor estilo de Mad Max que nos lleva varias décadas hacia el futuro. Nadie sabe qué ocurrió la noche en que los héroes cayeron: Sólo que todos desaparecieron y el mal ha triunfado desde entonces. En el último medio siglo, nadie ha visto al hombre simplemente conocido como Logan. Pero algo le hará salir de las sombras. Su amigo Ojo de Halcón necesita recorrer miles de kilómetros para poner su familia a salvo. Lobezno se prepara para el viaje de su vida…', 2, 'https://cdn.normacomics.com/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/3/1/31240173201_G.jpg', 5),
(3, 'Ole Mortadelo 210. por el Olimpo', 5.5, 'Número 210 de la colección «Olé Mortadelo», la más longeva hasta la actualidad.¡Mortadelo y Filemón, el Súper, Ofelia, Bacterio y los demás miembros de la T.I.A. se convertirán en seres mitológicos! En esta aventura, el proferor Bacterio ha creado un invento que, por error, convierte a todo el que se acerca al artilugio en ser mitológico. Así veremos convertido a Mortadelo en cíclope, al Súper en centauro, a Filemón en fauno o a Ofelia en Sirena, a partir de este hecho viviremos divertidísimas situaciones a lo largo de toda la aventura. Por si esto no fuese ya bastante lío, llega un inspector a la T.I.A. que cree volverse majareta al ver la fauna que corre por el edificio. Se someterá a una cura y, cuando cree haber recuperado el entendimiento, tendrá una monumental sorpresa por culpa de Mortadelo.', 100, 'https://www.totcomic.com/static/bigimgs/130037.jpg', 1),
(4, 'Lobezno en la guerra civil española', 14, 'Una saga diferente a todas las demás. Lobezno viaja en el espacio y en el tiempo, para luchar contra el fascismo en la Guerra Civil Española. Con Gernika como telón de fondo, el mutante de las garras de adamántium se reencuentra con sus peores enemigos.', 5, 'https://imagessl8.casadellibro.com/a/l/t0/18/9788491676218.jpg', 5),
(5, 'Ghost in the Shell 01', 17.3, 'Una historia cyberpunk, protagonizada por Motoko Kusanagi, una cyborg medio humana, miembro de la policía tecnológica. Kusanagi con un cuerpo artificial y un cerebro mejorado por la ciencia realiza proezas sobrehumanas, necesarias en deber policial.', 10, 'https://images-na.ssl-images-amazon.com/images/I/51qmqp1%2BIuL._SX327_BO1,204,203,200_.jpg', 9),
(6, 'Slam Dunk Kanzenban 01', 11.4, 'Slam Dunk vuelve a España en un formato de lujo. Esta edición, denominada kanzenban en Japón, vuelve a recopilar toda la historia en tomos de tamaño más grande, con gran cantidad de páginas a color y detalles extra nunca antes vistos en la edición tradicional. Trata sobre la vida de Hanamichi Sakuragi, un pandillero que se convierte en un gran jugador de baloncesto, sólo para tratar de ligar con una chica de su secundaria. Una compleja historia con ingredientes románticos, cómicos y de autosuperación, en el cual el protagonista poco a poco irá descubriendo que siente cierta pasión por este deporte, más allá de las razones por las que entró inicialmente en el equipo.', 20, 'https://images-na.ssl-images-amazon.com/images/I/51oLORnEkVL._SX346_BO1,204,203,200_.jpg', 7),
(7, 'Ghost in the Shell 02', 19, 'En The Ghost in the Shell, Motoko Kusanagi se unió a una forma de vida autoproclamada inteligente y abandonó la Sección 9 de Seguridad Pública. Esta historia es su continuación y transcurre aproximadamente cuatro años y cinco meses después.', 10, 'https://images-na.ssl-images-amazon.com/images/I/51pB9XFCH4L._SX312_BO1,204,203,200_.jpg', 9),
(8, 'Ex Machina 01', 11.82, 'En 2004, el guionista Brian K. Vaughan (Y, el último hombre, La Cosa del Pantano de Vaughan) y el dibujante Tony Harris (Batman: El Caballero Oscuro - Irresistible) renovaron el género de superhéroes con Ex Machina, una historia que sumerge a los enmascarados en las turbulentas aguas de la política. Tras recibir en pleno rostro la explosión de un artefacto de otra dimensión, el ingeniero Mitchell Hundred adquiere la habilidad de dominar toda clase de maquinaria dedicando sus nuevas habilidades a mejorar la vida de los demás. Tras una breve trayectoria como superhéroe bajo el nombre de la Gran Máquina, se convierte en alcalde electo de la ciudad de Nueva York. A partir de entonces, su vida da un vuelco en una obra espléndida que obtuvo el premio Eisner a la mejor serie en 2005.', 5, 'https://images-na.ssl-images-amazon.com/images/I/51Y3gR4%2BcoL._SX325_BO1,204,203,200_.jpg', 8),
(9, 'Rurouni Kenshin 01', 10, '\"Rurouni Kenshin” narra la historia de un samurái vagabundo de la época Meiji que intenta dejar atrás una carrera de asesino con la que se labró una terrible reputación. Para compensar en lo posible el daño causado, Kenshin pone su espada al servicio de los más débiles, una espada de filo invertido que le permite aplicar su poderosa y devastadora técnica de esgrima sin causar nuevas víctimas. A su alrededor pululan una serie de personajes inolvidables que irán pasando a formar parte de su vida. Todos ellos tienen un denominador común: son gente sin familia ni hogar. ', 10, 'https://images-na.ssl-images-amazon.com/images/I/51%2BnpSp7RsL._SX348_BO1,204,203,200_.jpg', 2),
(10, 'Civil War', 23.75, 'Con The New Avengers Illuminati y Civil War 1-7 ¡La obra maestra que inspiró Capitán América: Civil War en un espectacular volumen integral! El Universo Marvel está cambiando. Es tiempo de elegir: ¿De qué lado estás? Un conflicto que se ha estado gestando durante años estalla al fin, rompiendo en dos a la comunidad superheroica, y enfrentando a amigo contra amigo, hermano contra hermano. Spiderman, Los Vengadores, La Patrulla-X, Los Cuatro Fantásticos... todos se verán afectados. Todos deberán elegir su lugar en la guerra. Nadie está a salvo en la saga que cambió para siempre las reglas del juego.', 15, 'https://images-na.ssl-images-amazon.com/images/I/41nULRHXRNL._SX325_BO1,204,203,200_.jpg', 5);

--
-- Disparadores `producto`
--
DELIMITER $$
CREATE TRIGGER `producto_AD` AFTER DELETE ON `producto` FOR EACH ROW INSERT INTO `fuera_stock`(`registro_id`, `registro_nombre`, `registro_precio`, `registro_descripcion`, `registro_stock`, `registro_imagen`, `fecha_eliminacion`) VALUES (old.id_producto,old.nombre_producto,old.precio_producto,old.descripcion,old.stock,old.imagen, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE `subcategoria` (
  `id_subcategoria` int(11) NOT NULL,
  `nombre_categoria` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `subcategoria`
--

INSERT INTO `subcategoria` (`id_subcategoria`, `nombre_categoria`, `id_categoria`) VALUES
(1, 'Europeo', 1),
(2, 'Shonen', 2),
(3, 'Aventuras', 1),
(4, 'Seinen', 2),
(5, 'Superheroes', 1),
(6, 'Mechas', 2),
(7, 'Spokon', 2),
(8, 'Ciencia ficción', 1),
(9, 'Cyberpunk', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre_categoria` (`nombre_categoria`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `fuera_stock`
--
ALTER TABLE `fuera_stock`
  ADD PRIMARY KEY (`registro_id`);

--
-- Indices de la tabla `historico_producto`
--
ALTER TABLE `historico_producto`
  ADD PRIMARY KEY (`historico_id_producto`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
  ADD PRIMARY KEY (`id_linea`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_factura` (`id_factura`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_subcategoria`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`id_subcategoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `id_linea` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  MODIFY `id_subcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `linea`
--
ALTER TABLE `linea`
  ADD CONSTRAINT `linea_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `linea_ibfk_2` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategoria` (`id_subcategoria`);

--
-- Filtros para la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `subcategoria_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `eliminar_sinStock` ON SCHEDULE EVERY 1 DAY STARTS '2019-05-09 10:07:00' ENDS '2019-08-31 10:07:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM `producto` WHERE stock=0$$

CREATE DEFINER=`root`@`localhost` EVENT `añadir_stock` ON SCHEDULE EVERY 1 DAY STARTS '2019-05-09 10:24:00' ENDS '2019-05-31 10:24:00' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM `fuera_stock` WHERE registro_stock > 0$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
