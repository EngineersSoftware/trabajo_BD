-- Cargar Oficinas
INSERT INTO `jardineria_staging`.`stg_oficina` 
(descripcion, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2)
SELECT descripcion, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2 
FROM `jardineria`.`oficina`;

-- Cargar Empleados
INSERT INTO `jardineria_staging`.`stg_empleado` 
(id_empleado, nombre, apellido1, apellido2, extension, email, id_oficina, id_jefe, puesto)
SELECT id_empleado, nombre, apellido1, apellido2, extension, email, id_oficina, id_jefe, puesto 
FROM `jardineria`.`empleado`;

-- Cargar Clientes (Generando Hash para auditoría de duplicados)
INSERT INTO `jardineria_staging`.`stg_cliente` 
(id_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, 
linea_direccion2, ciudad, region, pais, codigo_postal, id_empleado_rep_ventas, limite_credito, stg_hash_fila)
SELECT 
    id_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, 
    linea_direccion2, ciudad, region, pais, codigo_postal, id_empleado_rep_ventas, limite_credito,
    MD5(CONCAT(COALESCE(nombre_cliente,''), COALESCE(telefono,''), COALESCE(linea_direccion1,'')))
FROM `jardineria`.`cliente`;

-- Cargar Pedidos
INSERT INTO `jardineria_staging`.`stg_pedido` 
(id_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, id_cliente)
SELECT id_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, id_cliente 
FROM `jardineria`.`pedido`;