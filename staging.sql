CREATE DATABASE IF NOT EXISTS `jardineria_staging`;
USE `jardineria_staging`;

-- ---------------------------------------------------------
-- TABLA: stg_oficina (Geografía y Sedes)
-- ---------------------------------------------------------
DROP TABLE IF EXISTS `stg_oficina`;
CREATE TABLE `stg_oficina` (
  `descripcion` VARCHAR(255),
  `ciudad` VARCHAR(100),
  `pais` VARCHAR(100),
  `region` VARCHAR(100),
  `codigo_postal` VARCHAR(20),
  `telefono` VARCHAR(50),
  `linea_direccion1` VARCHAR(255),
  `linea_direccion2` VARCHAR(255),
  -- Metadatos de Control
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `stg_fuente` VARCHAR(50) DEFAULT 'jardineria_original'
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- TABLA: stg_empleado (Jerarquía y Personal)
-- ---------------------------------------------------------
DROP TABLE IF EXISTS `stg_empleado`;
CREATE TABLE `stg_empleado` (
  `id_empleado` INT, -- Se mantiene el ID original como referencia
  `nombre` VARCHAR(100),
  `apellido1` VARCHAR(100),
  `apellido2` VARCHAR(100),
  `extension` VARCHAR(20),
  `email` VARCHAR(150),
  `id_oficina` INT,
  `id_jefe` INT,
  `puesto` VARCHAR(100),
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- TABLA: stg_cliente (Crédito y Ventas)
-- ---------------------------------------------------------
DROP TABLE IF EXISTS `stg_cliente`;
CREATE TABLE `stg_cliente` (
  `id_cliente` INT,
  `nombre_cliente` VARCHAR(255),
  `nombre_contacto` VARCHAR(150),
  `apellido_contacto` VARCHAR(150),
  `telefono` VARCHAR(50),
  `fax` VARCHAR(50),
  `linea_direccion1` VARCHAR(255),
  `linea_direccion2` VARCHAR(255),
  `ciudad` VARCHAR(100),
  `region` VARCHAR(100),
  `pais` VARCHAR(100),
  `codigo_postal` VARCHAR(50),
  `id_empleado_rep_ventas` INT,
  `limite_credito` DECIMAL(15,2),
  -- Auditoría para detectar duplicados como 'Lasas S.A.'
  `stg_hash_fila` VARCHAR(64), 
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ---------------------------------------------------------
-- TABLA: stg_pedido (Transacciones)
-- ---------------------------------------------------------
DROP TABLE IF EXISTS `stg_pedido`;
CREATE TABLE `stg_pedido` (
  `id_pedido` INT,
  `fecha_pedido` VARCHAR(50),   -- Texto para evitar errores de formato en ingesta
  `fecha_esperada` VARCHAR(50),
  `fecha_entrega` VARCHAR(50),
  `estado` VARCHAR(50),
  `comentarios` TEXT,
  `id_cliente` INT,
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;