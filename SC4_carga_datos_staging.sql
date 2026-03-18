USE `jardineria_staging`;

-- Carga de Oficinas
INSERT INTO `stg_oficina` (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2)
SELECT codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2 
FROM `jardineria`.`oficina`;

-- Carga de Empleados
INSERT INTO `stg_empleado` (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto)
SELECT codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto 
FROM `jardineria`.`empleado`;

-- Carga de Clientes con generación de Hash de auditoría
INSERT INTO `stg_cliente` (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, 
linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito, stg_hash_fila)
SELECT 
    codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, 
    linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito,
    MD5(CONCAT(COALESCE(nombre_cliente,''), COALESCE(telefono,''), COALESCE(ciudad,'')))
FROM `jardineria`.`cliente`;

-- Carga de Pedidos
INSERT INTO `stg_pedido` (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente)
SELECT codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente 
FROM `jardineria`.`pedido`;