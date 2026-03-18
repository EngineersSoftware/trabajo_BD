CREATE DATABASE IF NOT EXISTS `jardineria_staging`;
USE `jardineria_staging`;


CREATE TABLE IF NOT EXISTS `stg_oficina` (
  `id_oficina` INT,
  `descripcion` VARCHAR(10),
  `ciudad` VARCHAR(30),
  `pais` VARCHAR(50),
  `region` VARCHAR(50),
  `codigo_postal` VARCHAR(10),
  `telefono` VARCHAR(20),
  `linea_direccion1` VARCHAR(50),
  `linea_direccion2` VARCHAR(50),
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `stg_empleado` (
  `id_empleado` INT,
  `nombre` VARCHAR(50),
  `apellido1` VARCHAR(50),
  `apellido2` VARCHAR(50),
  `extension` VARCHAR(10),
  `email` VARCHAR(100),
  `id_oficina` INT,
  `id_jefe` INT,
  `puesto` VARCHAR(50),
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `stg_categoria_producto` (
  `id_categoria` INT,
  `desc_Categoria` VARCHAR(50),
  `descripcion_texto` TEXT,
  `descripcion_html` TEXT,
  `imagen` VARCHAR(256),
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `stg_cliente` (
  `id_cliente` INT,
  `nombre_cliente` VARCHAR(50),
  `nombre_contacto` VARCHAR(30),
  `apellido_contacto` VARCHAR(30),
  `telefono` VARCHAR(15),
  `fax` VARCHAR(15),
  `linea_direccion1` VARCHAR(50),
  `linea_direccion2` VARCHAR(50),
  `ciudad` VARCHAR(50),
  `region` VARCHAR(50),
  `pais` VARCHAR(50),
  `codigo_postal` VARCHAR(10),
  `id_empleado_rep_ventas` INT,
  `limite_credito` DECIMAL(15,2),
  `stg_hash_fila` VARCHAR(64),
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `stg_producto` (
  `id_producto` VARCHAR(15),
  `nombre` VARCHAR(70),
  `Categoria` INT,
  `dimensiones` VARCHAR(25),
  `proveedor` VARCHAR(50),
  `descripcion` TEXT,
  `cantidad_en_stock` SMALLINT,
  `precio_venta` DECIMAL(15,2),
  `precio_proveedor` DECIMAL(15,2),
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `stg_pedido` (
  `id_pedido` INT,
  `fecha_pedido` DATE,
  `fecha_esperada` DATE,
  `fecha_entrega` DATE,
  `estado` VARCHAR(15),
  `comentarios` TEXT,
  `id_cliente` INT,
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `stg_detalle_pedido` (
  `id_pedido` INT,
  `id_producto` VARCHAR(15),
  `cantidad` INT,
  `precio_unidad` DECIMAL(15,2),
  `numero_linea` SMALLINT,
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `stg_pago` (
  `id_cliente` INT,
  `forma_pago` VARCHAR(40),
  `id_transaccion` VARCHAR(50),
  `fecha_pago` DATE,
  `total` DECIMAL(15,2),
  `stg_fecha_carga` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;