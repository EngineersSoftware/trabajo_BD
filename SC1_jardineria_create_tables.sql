SET NAMES utf8mb4;
SET sql_mode = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS `jardineria`;
CREATE DATABASE `jardineria` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `jardineria`;

CREATE TABLE `oficina` (
  `id_oficina` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(10) NOT NULL,
  `ciudad` VARCHAR(30) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `region` VARCHAR(50) DEFAULT NULL,
  `codigo_postal` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `linea_direccion1` VARCHAR(50) NOT NULL,
  `linea_direccion2` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`id_oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `empleado` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido1` VARCHAR(50) NOT NULL,
  `apellido2` VARCHAR(50) DEFAULT NULL,
  `extension` VARCHAR(10) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `id_oficina` int NOT NULL,
  `id_jefe` INT DEFAULT NULL,
  `puesto` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  FOREIGN KEY (`id_oficina`) REFERENCES `oficina`(`id_oficina`),
  FOREIGN KEY (`id_jefe`) REFERENCES `empleado`(`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categoria_producto` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `desc_Categoria` VARCHAR(50) NOT NULL,
  `descripcion_texto` TEXT,
  `descripcion_html` TEXT,
  `imagen` VARCHAR(256),
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT NOT NULL,
  `nombre_cliente` VARCHAR(50) NOT NULL,
  `nombre_contacto` VARCHAR(30) DEFAULT NULL,
  `apellido_contacto` VARCHAR(30) DEFAULT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `fax` VARCHAR(15) NOT NULL,
  `linea_direccion1` VARCHAR(50) NOT NULL,
  `linea_direccion2` VARCHAR(50) DEFAULT NULL,
  `ciudad` VARCHAR(50) NOT NULL,
  `region` VARCHAR(50) DEFAULT NULL,
  `pais` VARCHAR(50) DEFAULT NULL,
  `codigo_postal` VARCHAR(10) DEFAULT NULL,
  `id_empleado_rep_ventas` INT DEFAULT NULL,
  `limite_credito` DECIMAL(15,2) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  FOREIGN KEY (`id_empleado_rep_ventas`) REFERENCES `empleado`(`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT NOT NULL,
  `fecha_pedido` date NOT NULL,
  `fecha_esperada` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `estado` VARCHAR(15) NOT NULL,
  `comentarios` TEXT,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  FOREIGN KEY (`id_cliente`) REFERENCES `cliente`(`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `producto` (
  `id_producto` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(70) NOT NULL,
  `Categoria` int NOT NULL,
  `dimensiones` VARCHAR(25) DEFAULT NULL,
  `proveedor` VARCHAR(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad_en_stock` SMALLINT NOT NULL,
  `precio_venta` DECIMAL(15,2) NOT NULL,
  `precio_proveedor` DECIMAL(15,2) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  FOREIGN KEY (`Categoria`) REFERENCES `categoria_producto`(`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `detalle_pedido` (
  `id_pedido` INT NOT NULL,
  `id_producto` VARCHAR(15) NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_unidad` DECIMAL(15,2) NOT NULL,
  `numero_linea` SMALLINT NOT NULL,
  PRIMARY KEY (id_pedido, id_producto),
  FOREIGN KEY (`id_pedido`) REFERENCES `pedido`(`id_pedido`),
  FOREIGN KEY (`id_producto`) REFERENCES `producto`(`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pago (
  id_cliente INTEGER NOT NULL,
  forma_pago VARCHAR(40) NOT NULL,
  id_transaccion VARCHAR(50) NOT NULL,
  fecha_pago date NOT NULL,
  total NUMERIC(15,2) NOT NULL,
  PRIMARY KEY (id_cliente, id_transaccion),
  FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
)