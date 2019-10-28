-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2019 a las 05:56:25
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `poli`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones`
--

CREATE TABLE `asignaciones` (
  `id` int(11) NOT NULL,
  `id_repuesto` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `id_componente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `fecha_asignacion` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignaciones`
--

INSERT INTO `asignaciones` (`id`, `id_repuesto`, `id_unidad`, `id_componente`, `id_usuario`, `cantidad`, `fecha_asignacion`) VALUES
(1, 1, 1, 1, 2, 6, '20:22:56 11-10-2019'),
(2, 1, 1, 1, 2, 2, '07:24:35 13-06-2018'),
(3, 1, 2, 1, 1, 23, '09:27:30 14-06-2018'),
(4, 2, 2, 2, 1, 2, '21:39:45 11-10-2019'),
(8, 1, 1, 1, 1, 1, '2019-10-28 12:10:51');

--
-- Disparadores `asignaciones`
--
DELIMITER $$
CREATE TRIGGER `check_update_event` AFTER INSERT ON `asignaciones` FOR EACH ROW BEGIN
                        UPDATE repuestos SET cantidad = (cantidad - NEW.cantidad) WHERE id=NEW.id_repuesto;
                    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_admin`
--

CREATE TABLE `audit_admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entity` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `audit_admin`
--

INSERT INTO `audit_admin` (`id`, `entity`, `action`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Usuario', 'Creando Usuario con id: 3', '2019-10-11 08:10:17', '2019-10-12 01:30:17', '2019-10-12 01:30:17'),
(2, 'Usuario', 'Creando Usuario 23', '2019-10-25 05:10:12', '2019-10-25 22:09:12', '2019-10-25 22:09:12'),
(3, 'Usuario', 'Creando Usuario 24', '2019-10-25 05:10:56', '2019-10-25 22:20:56', '2019-10-25 22:20:56'),
(4, 'Usuario', 'Creando Usuario 25', '2019-10-25 05:10:09', '2019-10-25 22:23:09', '2019-10-25 22:23:09'),
(5, 'Usuario', 'Creando Usuario 26', '2019-10-25 05:10:12', '2019-10-25 22:23:12', '2019-10-25 22:23:12'),
(6, 'Usuario', 'Creando Usuario 27', '2019-10-25 06:10:36', '2019-10-25 23:01:36', '2019-10-25 23:01:36'),
(7, 'Usuario', 'Creando Usuario 28', '2019-10-25 06:10:02', '2019-10-25 23:04:02', '2019-10-25 23:04:02'),
(8, 'Usuario', 'Creando Usuario 29', '2019-10-25 06:10:46', '2019-10-25 23:05:46', '2019-10-25 23:05:46'),
(9, 'Usuario', 'Creando Usuario 30', '2019-10-25 06:10:50', '2019-10-25 23:16:50', '2019-10-25 23:16:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `user`, `email`, `action`, `entity`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', 'listando', 'mandos', '2019-10-25 07:10:46', '2019-10-26 00:49:46', '2019-10-26 00:49:46'),
(2, 'Admin', 'admin@admin.com', 'editando', 'mandos', '2019-10-25 07:10:51', '2019-10-26 00:49:51', '2019-10-26 00:49:51'),
(3, 'Admin', 'admin@admin.com', 'listando', 'mandos', '2019-10-25 07:10:51', '2019-10-26 00:49:51', '2019-10-26 00:49:51'),
(4, 'Admin', 'admin@admin.com', 'eliminando', 'mandos', '2019-10-25 07:10:04', '2019-10-26 00:55:04', '2019-10-26 00:55:04'),
(5, 'Admin', 'admin@admin.com', 'listando', 'mandos', '2019-10-25 07:10:04', '2019-10-26 00:55:04', '2019-10-26 00:55:04'),
(6, 'Admin', 'admin@admin.com', 'listando', 'mandos', '2019-10-25 07:10:25', '2019-10-26 00:55:25', '2019-10-26 00:55:25'),
(7, 'Admin', 'admin@admin.com', 'listando', 'mandos', '2019-10-25 08:10:23', '2019-10-26 01:02:23', '2019-10-26 01:02:23'),
(8, 'Admin', 'admin@admin.com', 'creando', 'estados', '2019-10-25 08:10:29', '2019-10-26 01:02:29', '2019-10-26 01:02:29'),
(9, 'Admin', 'admin@admin.com', 'listando', 'estados', '2019-10-25 08:10:29', '2019-10-26 01:02:29', '2019-10-26 01:02:29'),
(10, 'Admin', 'admin@admin.com', 'listando', 'mandos', '2019-10-25 08:10:43', '2019-10-26 01:02:43', '2019-10-26 01:02:43'),
(11, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 08:10:49', '2019-10-26 01:02:49', '2019-10-26 01:02:49'),
(12, 'Admin', 'admin@admin.com', 'Inicio de Sesion.', 'login', '2019-10-25 08:10:29', '2019-10-26 01:18:29', '2019-10-26 01:18:29'),
(13, 'Admin', 'admin@admin.com', 'listando', 'admin', '2019-10-25 08:10:30', '2019-10-26 01:18:30', '2019-10-26 01:18:30'),
(14, 'Admin', 'admin@admin.com', 'listando', 'asignaciones', '2019-10-25 08:10:49', '2019-10-26 01:24:49', '2019-10-26 01:24:49'),
(15, 'Admin', 'admin@admin.com', 'Saliendo del sistema.', 'logout', '2019-10-25 08:10:23', '2019-10-26 01:26:23', '2019-10-26 01:26:23'),
(16, 'Admin', 'admin@admin.com', 'Inicio de Sesion.', 'login', '2019-10-25 08:10:34', '2019-10-26 01:40:34', '2019-10-26 01:40:34'),
(17, 'Admin', 'admin@admin.com', 'Inicio de Sesion.', 'login', '2019-10-25 08:10:15', '2019-10-26 01:41:15', '2019-10-26 01:41:15'),
(18, 'Admin', 'admin@admin.com', 'Inicio de Sesion.', 'login', '2019-10-25 08:10:38', '2019-10-26 01:44:38', '2019-10-26 01:44:38'),
(19, 'Admin', 'admin@admin.com', 'Inicio de Sesion.', 'login', '2019-10-25 08:10:10', '2019-10-26 01:46:10', '2019-10-26 01:46:10'),
(20, 'Admin', 'admin@admin.com', 'listando', 'admin', '2019-10-25 08:10:11', '2019-10-26 01:46:11', '2019-10-26 01:46:11'),
(21, 'Admin', 'admin@admin.com', 'Saliendo del sistema.', 'logout', '2019-10-25 08:10:15', '2019-10-26 01:46:15', '2019-10-26 01:46:15'),
(22, 'Admin', 'admin@admin.com', 'Inicio de Sesion.', 'login', '2019-10-25 08:10:38', '2019-10-26 01:49:38', '2019-10-26 01:49:38'),
(23, 'Admin', 'admin@admin.com', 'listando', 'admin', '2019-10-25 08:10:38', '2019-10-26 01:49:38', '2019-10-26 01:49:38'),
(24, 'Admin', 'admin@admin.com', 'Saliendo del sistema.', 'logout', '2019-10-25 08:10:42', '2019-10-26 01:49:42', '2019-10-26 01:49:42'),
(25, 'Admin', 'admin@admin.com', 'Inicio de Sesion.', 'login', '2019-10-25 08:10:54', '2019-10-26 01:50:54', '2019-10-26 01:50:54'),
(26, 'Admin', 'admin@admin.com', 'listando', 'home', '2019-10-25 08:10:54', '2019-10-26 01:50:54', '2019-10-26 01:50:54'),
(27, 'Admin', 'admin@admin.com', 'listando', 'admin', '2019-10-25 08:10:54', '2019-10-26 01:50:54', '2019-10-26 01:50:54'),
(28, 'Admin', 'admin@admin.com', 'Saliendo del sistema.', 'logout', '2019-10-25 08:10:57', '2019-10-26 01:50:57', '2019-10-26 01:50:57'),
(29, 'Admin', 'admin@admin.com', 'Inicio de Sesion.', 'login', '2019-10-25 10:10:48', '2019-10-26 03:03:48', '2019-10-26 03:03:48'),
(30, 'Admin', 'admin@admin.com', 'listando', 'home', '2019-10-25 10:10:49', '2019-10-26 03:03:49', '2019-10-26 03:03:49'),
(31, 'Admin', 'admin@admin.com', 'listando', 'admin', '2019-10-25 10:10:49', '2019-10-26 03:03:49', '2019-10-26 03:03:49'),
(32, 'Admin', 'admin@admin.com', 'listando', 'mandos', '2019-10-25 10:10:23', '2019-10-26 03:07:23', '2019-10-26 03:07:23'),
(33, 'Admin', 'admin@admin.com', 'listando', 'unidades', '2019-10-25 10:10:25', '2019-10-26 03:07:25', '2019-10-26 03:07:25'),
(34, 'Admin', 'admin@admin.com', 'listando', 'unidades', '2019-10-25 10:10:48', '2019-10-26 03:07:48', '2019-10-26 03:07:48'),
(35, 'Admin', 'admin@admin.com', 'editando', 'unidades', '2019-10-25 10:10:54', '2019-10-26 03:07:54', '2019-10-26 03:07:54'),
(36, 'Admin', 'admin@admin.com', 'listando', 'unidades', '2019-10-25 10:10:55', '2019-10-26 03:07:55', '2019-10-26 03:07:55'),
(37, 'Admin', 'admin@admin.com', 'listando', 'unidades', '2019-10-25 10:10:38', '2019-10-26 03:20:38', '2019-10-26 03:20:38'),
(38, 'Admin', 'admin@admin.com', 'listando', 'unidades', '2019-10-25 10:10:47', '2019-10-26 03:20:47', '2019-10-26 03:20:47'),
(39, 'Admin', 'admin@admin.com', 'listando', 'unidades', '2019-10-25 10:10:08', '2019-10-26 03:22:08', '2019-10-26 03:22:08'),
(40, 'Admin', 'admin@admin.com', 'listando', 'unidades', '2019-10-25 10:10:59', '2019-10-26 03:26:59', '2019-10-26 03:26:59'),
(41, 'Admin', 'admin@admin.com', 'listando', 'unidades', '2019-10-25 10:10:23', '2019-10-26 03:28:23', '2019-10-26 03:28:23'),
(42, 'Admin', 'admin@admin.com', 'listando', 'unidades', '2019-10-25 10:10:33', '2019-10-26 03:28:33', '2019-10-26 03:28:33'),
(43, 'Admin', 'admin@admin.com', 'listando', 'unidades', '2019-10-25 10:10:45', '2019-10-26 03:28:45', '2019-10-26 03:28:45'),
(44, 'Admin', 'admin@admin.com', 'listando', 'bitacora', '2019-10-25 10:10:50', '2019-10-26 03:28:50', '2019-10-26 03:28:50'),
(45, 'Admin', 'admin@admin.com', 'listando', 'bitacora', '2019-10-25 10:10:10', '2019-10-26 03:29:10', '2019-10-26 03:29:10'),
(46, 'Admin', 'admin@admin.com', 'listando', 'modelos', '2019-10-25 10:10:28', '2019-10-26 03:32:28', '2019-10-26 03:32:28'),
(47, 'Admin', 'admin@admin.com', 'listando', 'admin', '2019-10-25 10:10:36', '2019-10-26 03:32:36', '2019-10-26 03:32:36'),
(48, 'Admin', 'admin@admin.com', 'listando', 'bitacora', '2019-10-25 10:10:18', '2019-10-26 03:35:18', '2019-10-26 03:35:18'),
(49, 'Admin', 'admin@admin.com', 'listando', 'unidades', '2019-10-25 10:10:50', '2019-10-26 03:42:50', '2019-10-26 03:42:50'),
(50, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 10:10:56', '2019-10-26 03:42:56', '2019-10-26 03:42:56'),
(51, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 10:10:14', '2019-10-26 03:44:14', '2019-10-26 03:44:14'),
(52, 'Admin', 'admin@admin.com', 'listando', 'admin', '2019-10-25 11:10:02', '2019-10-26 04:04:02', '2019-10-26 04:04:02'),
(53, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:42', '2019-10-26 04:13:42', '2019-10-26 04:13:42'),
(54, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:09', '2019-10-26 04:16:09', '2019-10-26 04:16:09'),
(55, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:48', '2019-10-26 04:16:48', '2019-10-26 04:16:48'),
(56, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:19', '2019-10-26 04:17:19', '2019-10-26 04:17:19'),
(57, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:39', '2019-10-26 04:18:39', '2019-10-26 04:18:39'),
(58, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:00', '2019-10-26 04:20:00', '2019-10-26 04:20:00'),
(59, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:02', '2019-10-26 04:21:02', '2019-10-26 04:21:02'),
(60, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:30', '2019-10-26 04:22:30', '2019-10-26 04:22:30'),
(61, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:46', '2019-10-26 04:23:46', '2019-10-26 04:23:46'),
(62, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:25', '2019-10-26 04:24:25', '2019-10-26 04:24:25'),
(63, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:55', '2019-10-26 04:24:55', '2019-10-26 04:24:55'),
(64, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:52', '2019-10-26 04:25:52', '2019-10-26 04:25:52'),
(65, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:26', '2019-10-26 04:26:26', '2019-10-26 04:26:26'),
(66, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:43', '2019-10-26 04:27:43', '2019-10-26 04:27:43'),
(67, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:36', '2019-10-26 04:28:36', '2019-10-26 04:28:36'),
(68, 'Admin', 'admin@admin.com', 'listando', 'admin', '2019-10-25 11:10:48', '2019-10-26 04:28:48', '2019-10-26 04:28:48'),
(69, 'Admin', 'admin@admin.com', 'listando', 'bitacora', '2019-10-25 11:10:58', '2019-10-26 04:28:58', '2019-10-26 04:28:58'),
(70, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:01', '2019-10-26 04:29:01', '2019-10-26 04:29:01'),
(71, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-25 11:10:24', '2019-10-26 04:30:24', '2019-10-26 04:30:24'),
(72, 'Admin', 'admin@admin.com', 'listando', 'admin', '2019-10-25 11:10:11', '2019-10-26 04:31:11', '2019-10-26 04:31:11'),
(73, 'Admin', 'admin@admin.com', 'listando', 'admin', '2019-10-25 11:10:16', '2019-10-26 04:31:16', '2019-10-26 04:31:16'),
(74, 'Admin', 'admin@admin.com', 'Inicio de Sesion.', 'login', '2019-10-28 12:10:15', '2019-10-28 05:46:15', '2019-10-28 05:46:15'),
(75, 'Admin', 'admin@admin.com', 'listando', 'home', '2019-10-28 12:10:16', '2019-10-28 05:46:16', '2019-10-28 05:46:16'),
(76, 'Admin', 'admin@admin.com', 'listando', 'admin', '2019-10-28 12:10:16', '2019-10-28 05:46:16', '2019-10-28 05:46:16'),
(77, 'Admin', 'admin@admin.com', 'listando', 'bitacora', '2019-10-28 12:10:21', '2019-10-28 05:46:21', '2019-10-28 05:46:21'),
(78, 'Admin', 'admin@admin.com', 'listando', 'asignaciones', '2019-10-28 12:10:28', '2019-10-28 05:46:28', '2019-10-28 05:46:28'),
(79, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-28 12:10:34', '2019-10-28 05:46:34', '2019-10-28 05:46:34'),
(80, 'Admin', 'admin@admin.com', 'listando', 'asignaciones', '2019-10-28 12:10:55', '2019-10-28 05:46:55', '2019-10-28 05:46:55'),
(81, 'Admin', 'admin@admin.com', 'listando', 'asignaciones', '2019-10-28 12:10:58', '2019-10-28 05:46:58', '2019-10-28 05:46:58'),
(82, 'Admin', 'admin@admin.com', 'creando', 'asignaciones', '2019-10-28 12:10:13', '2019-10-28 05:47:13', '2019-10-28 05:47:13'),
(83, 'Admin', 'admin@admin.com', 'creando', 'asignaciones', '2019-10-28 12:10:51', '2019-10-28 05:51:51', '2019-10-28 05:51:51'),
(84, 'Admin', 'admin@admin.com', 'listando', 'repuestos', '2019-10-28 12:10:51', '2019-10-28 05:53:51', '2019-10-28 05:53:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `color` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id`, `color`) VALUES
(1, 'blanco'),
(2, 'negra'),
(3, 'Rojo'),
(5, 'Amarillo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componente`
--

CREATE TABLE `componente` (
  `id` int(11) NOT NULL,
  `nombres` varchar(64) DEFAULT NULL,
  `apellidos` varchar(64) DEFAULT NULL,
  `ci` varchar(32) DEFAULT NULL,
  `serial` varchar(32) DEFAULT NULL,
  `id_mando` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `componente`
--

INSERT INTO `componente` (`id`, `nombres`, `apellidos`, `ci`, `serial`, `id_mando`, `activo`) VALUES
(1, 'juan Jose', 'valdez', '5345', 'retre45', 2, 1),
(2, 'juan', 'mendez', '1234', 'qwer1', 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `estado` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `estado`) VALUES
(1, 'averiado'),
(2, 'espera'),
(3, 'reparacion'),
(4, 'disponible'),
(5, 'alta'),
(7, 'tierni');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mando`
--

CREATE TABLE `mando` (
  `id` int(11) NOT NULL,
  `mando` varchar(32) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mando`
--

INSERT INTO `mando` (`id`, `mando`, `activo`) VALUES
(1, 'oficiala', 1),
(2, 'comisario', 1),
(4, 'yoasdasdsfsd', 0),
(7, 'agente', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(41, '2014_10_12_100000_create_password_resets_table', 1),
(42, '2019_04_16_084008042287_create_1555404008266_permissions_table', 1),
(43, '2019_04_16_084008100873_create_1555404008517_roles_table', 1),
(44, '2019_04_16_084008154662_create_1555404008649_users_table', 1),
(45, '2019_04_16_084008529760_create_1555404008529_permission_role_pivot_table', 1),
(46, '2019_04_16_084008657099_create_1555404008656_role_user_pivot_table', 1),
(47, '2019_04_16_085008124252_add_last_login_at_to_users_table', 1),
(48, '2019_10_11_193725_create_audit_admin_table', 1),
(50, '2019_10_25_182035_create_bitacora_table', 2),
(51, '2019_10_28_003542_create_trigger_calculate_repuesto', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `id` int(11) NOT NULL,
  `modelo` varchar(64) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`id`, `modelo`, `activo`) VALUES
(2, 'tacoma', 1),
(6, 'aaa', 0),
(7, 'dfg', 0),
(8, 'fgh', 0),
(9, 'www', 1),
(10, 'rrr', 0),
(11, 'ffftttt', 1),
(12, 'fordtunner', 1),
(13, 'eeeerrrggg', 0),
(15, 'aaabbb', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `activo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_management_access', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(2, 'permission_create', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(3, 'permission_edit', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(4, 'permission_show', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(5, 'permission_delete', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(6, 'permission_access', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(7, 'role_create', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(8, 'role_edit', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(9, 'role_show', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(10, 'role_delete', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(11, 'role_access', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(12, 'user_create', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(13, 'user_edit', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(14, 'user_show', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(15, 'user_delete', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL),
(16, 'user_access', 1, '2019-04-16 13:40:35', '2019-04-16 13:40:35', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos`
--

CREATE TABLE `repuestos` (
  `id` int(11) NOT NULL,
  `repuesto` varchar(128) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_unidad` varchar(32) DEFAULT NULL,
  `modelo` varchar(64) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `repuestos`
--

INSERT INTO `repuestos` (`id`, `repuesto`, `cantidad`, `descripcion`, `tipo_unidad`, `modelo`, `activo`) VALUES
(1, 'motor', 1, 'motor para tacoma', 'Patrulla', 'tacoma', 1),
(2, 'aa', 422, 'sgsdg', 'Moto', 'tacoma', 0),
(3, 'dsfdsa', 3, 'sfd', 'Patrulla', 'dfg', 1),
(4, 'bugia', 2, 'nadaa', 'Moto', '2', 1),
(5, 'test', 15, 'test', 'Moto', 'tacoma', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `title`, `activo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 1, '2019-04-16 13:40:08', '2019-04-16 13:40:08', NULL),
(2, 'User', 1, '2019-04-16 13:40:08', '2019-04-16 13:40:08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_unidad`
--

CREATE TABLE `tipo_unidad` (
  `id` int(11) NOT NULL,
  `tipo` varchar(32) NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_unidad`
--

INSERT INTO `tipo_unidad` (`id`, `tipo`, `activo`) VALUES
(1, 'Moto', 0),
(2, '2', 0),
(4, 'das', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id` int(11) NOT NULL,
  `placa` varchar(16) DEFAULT NULL,
  `id_modelo` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `id_color` int(11) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `placa`, `id_modelo`, `id_estado`, `id_color`, `id_tipo`, `activo`) VALUES
(1, 'fff555', 2, 2, 2, 2, 1),
(2, 'gfgfsg', 2, 2, 2, 2, 1),
(5, 'fff55556', 2, 1, 1, 1, 1),
(6, 'fff555564', NULL, NULL, NULL, NULL, 1),
(7, '0001', NULL, NULL, NULL, NULL, 1),
(8, '0002', 2, 1, 1, 1, 1),
(9, '004', 2, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `activo`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `last_login_at`) VALUES
(1, 'Admin', 'admin@admin.com', 1, NULL, '$2y$10$iGIs9vT1KvnMf1aph4uFHuO0ebEnXr/tu6AemWTZanW13a7Gjb0Ua', NULL, '2019-10-11 13:40:35', '2019-10-28 05:46:16', NULL, '2019-10-28 05:46:16'),
(2, 'Maria Jose', 'mariajose@gmail.com', 1, NULL, '$2y$10$iGIs9vT1KvnMf1aph4uFHuO0ebEnXr/tu6AemWTZanW13a7Gjb0Ua', NULL, '2019-10-11 13:40:35', '2019-10-11 13:40:35', NULL, NULL),
(3, 'Talon Larsonsdas', 'chand@example.com', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'h38MBFxq1K', '2019-10-11 22:10:03', '2019-10-12 01:30:17', NULL, '2019-09-11 22:10:03'),
(4, 'Osvaldo Hodkiewicz III', 'mfay@example.net', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PiCnvD8rBN', '2019-10-11 22:10:03', '2019-10-11 22:10:03', NULL, '2019-09-11 22:10:03'),
(5, 'Eveline Sauer IV', 'eddie.feeney@example.org', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6Klim5TMmR', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, NULL),
(6, 'Johan Leuschke', 'arden.bernhard@example.net', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lAEgoZ047t', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, '2019-09-09 22:10:03'),
(7, 'Mrs. Arlie Auer IV', 'dave.hane@example.com', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dojmvyOw9D', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, '2019-07-05 22:10:03'),
(8, 'Olga Schowalter Jr.', 'mohr.alanis@example.net', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6Pf1If7bMy', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, NULL),
(9, 'Prof. Linwood Mitchell', 'patricia.stehr@example.net', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9mtBLTA948', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, NULL),
(10, 'Prof. Elta Wiegand', 'theresa.hudson@example.org', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'oN87n7ptUA', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, NULL),
(11, 'Noemi Yost', 'bartell.ena@example.org', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nmKAmk48Gw', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, '2019-09-22 22:10:03'),
(12, 'Dr. Marcella Donnelly III', 'batz.braulio@example.org', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sSGcWYqLj7', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, '2019-10-08 22:10:03'),
(13, 'Gerardo Hane', 'hattie.conroy@example.org', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7c4bDt5Zvp', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, '2019-10-08 22:10:03'),
(14, 'Jettie Becker DVM', 'runte.dahlia@example.net', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PCyrw6gN5I', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, NULL),
(15, 'Bailee Quitzon', 'sschowalter@example.net', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fRuNd5XqEU', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, NULL),
(16, 'Aubree Volkman IV', 'breanne.luettgen@example.net', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'b4Mv9ae4tw', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, '2019-10-06 22:10:03'),
(17, 'Misty Towne', 'elroy.simonis@example.org', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qjcWAeiIQY', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, '2019-08-08 22:10:03'),
(18, 'Kristina Labadie', 'everette.rempel@example.org', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LJUTlBF8zz', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, '2019-09-04 22:10:03'),
(19, 'Aron Marvin Jr.', 'bergnaum.emil@example.com', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BRhN9zWloC', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, '2019-09-30 22:10:03'),
(20, 'Emerald Hansen', 'wolson@example.com', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'I0kAjTyS4Q', '2019-10-11 22:10:04', '2019-10-11 22:10:04', NULL, '2019-09-28 22:10:03'),
(21, 'Johnpaul Friesen', 'javon.botsford@example.org', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zd00978Sf9', '2019-10-11 22:10:05', '2019-10-11 22:10:05', NULL, '2019-08-11 22:10:03'),
(22, 'Cassidy Dietrich III', 'gutkowski.annabelle@example.net', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'e2vPvj93e9', '2019-10-11 22:10:05', '2019-10-11 22:10:05', NULL, '2019-09-05 22:10:03'),
(23, 'asd', 'asd@asd.com', 1, NULL, '$2y$10$VQu3mbpPQtjHw7m8QaR8t..U6bUKQmKjw/j8/QiaC/arjrAC8mAlO', NULL, '2019-10-25 22:09:11', '2019-10-25 22:09:11', NULL, NULL),
(24, 'aaaa', 'aaa@fsaaaafas.com', 1, NULL, '$2y$10$9zPjgYZgAvCvOJReajRIveVU1JiByCx.BDgikArxZut3F46dLl2Ga', NULL, '2019-10-25 22:20:56', '2019-10-25 22:20:56', NULL, NULL),
(25, 'aaaa', 'aaa@fsaaaafas.com', 1, NULL, '$2y$10$c4bpQSAvBrz9pg84eWwYeeUv.Gu8f5mQDNMiY7no.3GZWU7bmY13u', NULL, '2019-10-25 22:23:09', '2019-10-25 22:23:09', NULL, NULL),
(26, 'aaaa', 'aaa@fsaaaafas.com', 1, NULL, '$2y$10$lV9uUBzcOUDLgnSGTUZSPOQkL.d9BlB.pjg6byyXKX6du8czfO7im', NULL, '2019-10-25 22:23:12', '2019-10-25 22:23:12', NULL, NULL),
(27, 'aaaa', 'aaa@asdasda.com', 1, NULL, '$2y$10$Va6KEu5OpBwjkokGdigwbelpnug3.pcnjYMSCWonTQwBZWIJN.4ai', NULL, '2019-10-25 23:01:36', '2019-10-25 23:01:36', NULL, NULL),
(28, 'dasdas', 'dasdas@adsad.com', 1, NULL, '$2y$10$qmTxGDRFbAHi7P6ezqbSi.tsfWZPI8zTiLbjAlVhAoemVegZchJN.', NULL, '2019-10-25 23:04:02', '2019-10-25 23:04:02', NULL, NULL),
(29, 'dasdas', 'dasdasdd@addddsad.com', 1, NULL, '$2y$10$H8nipjng5qg7fPBgPLSfuelzakYhhCroNmhzi2NegOyI8N/p45sXe', NULL, '2019-10-25 23:05:46', '2019-10-25 23:05:46', NULL, NULL),
(30, 'sadasd', 'dasdasdas@gmail.com', 1, NULL, '$2y$10$vFusKb3H/3paq1f3EohKEucvVCirxdgZYrQZWC67EkQeBGSEwDCFi', NULL, '2019-10-25 23:16:50', '2019-10-25 23:16:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(32) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `nombre` varchar(32) DEFAULT NULL,
  `apellido` varchar(32) DEFAULT NULL,
  `correo` varchar(64) DEFAULT NULL,
  `ci` int(11) DEFAULT NULL,
  `token` varchar(256) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `password`, `nombre`, `apellido`, `correo`, `ci`, `token`, `tipo`, `activo`) VALUES
(1, 'chucho', '1234', 'jesus', 'becera', 'bahimer8080@gmail.com', 21416881, NULL, 1, 1),
(2, 'aaa', '1234', 'aaa', 'aaa', 'asd@asd', NULL, NULL, 0, 1),
(3, 'a', '1234', 'a', 'a', 'a', 2, NULL, 0, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_unidad` (`id_unidad`),
  ADD KEY `id_repuesto` (`id_repuesto`),
  ADD KEY `id_componente` (`id_componente`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `audit_admin`
--
ALTER TABLE `audit_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `componente`
--
ALTER TABLE `componente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mando` (`id_mando`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mando`
--
ALTER TABLE `mando`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `permission_role_role_id_foreign` (`role_id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`);

--
-- Indices de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `tipo_unidad`
--
ALTER TABLE `tipo_unidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_modelo` (`id_modelo`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_caracteristica` (`id_color`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `audit_admin`
--
ALTER TABLE `audit_admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `componente`
--
ALTER TABLE `componente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `mando`
--
ALTER TABLE `mando`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_unidad`
--
ALTER TABLE `tipo_unidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`id_repuesto`) REFERENCES `repuestos` (`id`),
  ADD CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`),
  ADD CONSTRAINT `asignaciones_ibfk_3` FOREIGN KEY (`id_componente`) REFERENCES `componente` (`id`),
  ADD CONSTRAINT `asignaciones_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `componente`
--
ALTER TABLE `componente`
  ADD CONSTRAINT `componente_ibfk_1` FOREIGN KEY (`id_mando`) REFERENCES `mando` (`id`);

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD CONSTRAINT `unidades_ibfk_2` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id`),
  ADD CONSTRAINT `unidades_ibfk_3` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `unidades_ibfk_4` FOREIGN KEY (`id_color`) REFERENCES `color` (`id`),
  ADD CONSTRAINT `unidades_ibfk_5` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_unidad` (`id`),
  ADD CONSTRAINT `unidades_ibfk_6` FOREIGN KEY (`id_color`) REFERENCES `color` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
