-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2019 a las 16:41:11
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
(4, 2, 2, 2, 1, 2, '21:39:45 11-10-2019');

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
(1, 'Usuario', 'Creando Usuario con id: 3', '2019-10-11 08:10:17', '2019-10-12 01:30:17', '2019-10-12 01:30:17');

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
(5, 'alta');

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
(1, 'oficial', 1),
(2, 'comisario', 1),
(4, 'yo', 0),
(6, 'tenient', 0),
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
(48, '2019_10_11_193725_create_audit_admin_table', 1);

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
(1, 'motor', 2, 'motor para tacoma', 'Patrulla', 'tacoma', 1),
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
(22, 2);

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
(6, 'fff55556', 2, 1, 1, 2, 1),
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
(1, 'Admin', 'admin@admin.com', 1, NULL, '$2y$10$iGIs9vT1KvnMf1aph4uFHuO0ebEnXr/tu6AemWTZanW13a7Gjb0Ua', NULL, '2019-10-11 13:40:35', '2019-10-13 03:34:40', NULL, '2019-10-13 03:34:40'),
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
(22, 'Cassidy Dietrich III', 'gutkowski.annabelle@example.net', 1, '2019-10-11 17:10:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'e2vPvj93e9', '2019-10-11 22:10:05', '2019-10-11 22:10:05', NULL, '2019-09-05 22:10:03');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `audit_admin`
--
ALTER TABLE `audit_admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mando`
--
ALTER TABLE `mando`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
