CREATE DATABASE IF NOT EXISTS `jardineria_staging`;
USE `jardineria_staging`;


DROP TABLE IF EXISTS `stg_oficina`;
CREATE TABLE `stg_oficina` (
  `codigo_oficina` VARCHAR(10),
  `ciudad` VARCHAR(30),
  `pais` VARCHAR(50),
  `region` VARCHAR(50),
  `codigo_postal` VARCHAR(10),
  `telefono` VARCHAR(20),
  `linea_direccion1` VARCHAR(50),
  `linea_direccion2` VARCHAR(50),
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `stg_empleado`;
CREATE TABLE `stg_empleado` (
  `codigo_empleado` INT,
  `nombre` VARCHAR(50),
  `apellido1` VARCHAR(50),
  `apellido2` VARCHAR(50),
  `extension` VARCHAR(10),
  `email` VARCHAR(100),
  `codigo_oficina` VARCHAR(10),
  `codigo_jefe` INT,
  `puesto` VARCHAR(50),
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `stg_cliente`;
CREATE TABLE `stg_cliente` (
  `codigo_cliente` INT,
  `nombre_cliente` VARCHAR(50),
  `nombre_contacto` VARCHAR(30),
  `apellido_contacto` VARCHAR(30),
  `telefono` VARCHAR(20),
  `fax` VARCHAR(20),
  `linea_direccion1` VARCHAR(50),
  `linea_direccion2` VARCHAR(50),
  `ciudad` VARCHAR(50),
  `region` VARCHAR(50),
  `pais` VARCHAR(50),
  `codigo_postal` VARCHAR(10),
  `codigo_empleado_rep_ventas` INT,
  `limite_credito` DECIMAL(15,2),
  `stg_hash_fila` VARCHAR(64), 
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `stg_pedido`;
CREATE TABLE `stg_pedido` (
  `codigo_pedido` INT,
  `fecha_pedido` DATE,
  `fecha_esperada` DATE,
  `fecha_entrega` DATE,
  `estado` VARCHAR(15),
  `comentarios` TEXT,
  `codigo_cliente` INT,
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;