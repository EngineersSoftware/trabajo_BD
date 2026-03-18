USE `jardineria_staging`;

-- 1. Carga Oficinas
INSERT INTO stg_oficina (id_oficina, descripcion, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2)
SELECT id_oficina, descripcion, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2 FROM jardineria.oficina;

-- 2. Carga Empleados
INSERT INTO stg_empleado (id_empleado, nombre, apellido1, apellido2, extension, email, id_oficina, id_jefe, puesto)
SELECT id_empleado, nombre, apellido1, apellido2, extension, email, id_oficina, id_jefe, puesto FROM jardineria.empleado;

-- 3. Carga Categorías
INSERT INTO stg_categoria_producto (id_categoria, desc_Categoria, descripcion_texto, descripcion_html, imagen)
SELECT id_categoria, desc_Categoria, descripcion_texto, descripcion_html, imagen FROM jardineria.categoria_producto;

-- 4. Carga Clientes (Con Hash para auditoría)
INSERT INTO stg_cliente (id_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, id_empleado_rep_ventas, limite_credito, stg_hash_fila)
SELECT id_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, id_empleado_rep_ventas, limite_credito,
MD5(CONCAT(id_cliente, nombre_cliente, telefono)) FROM jardineria.cliente;

-- 5. Carga Productos
INSERT INTO stg_producto (id_producto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor)
SELECT id_producto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor FROM jardineria.producto;

-- 6. Carga Pedidos
INSERT INTO stg_pedido (id_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, id_cliente)
SELECT id_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, id_cliente FROM jardineria.pedido;

-- 7. Carga Detalle de Pedidos
INSERT INTO stg_detalle_pedido (id_pedido, id_producto, cantidad, precio_unidad, numero_linea)
SELECT id_pedido, id_producto, cantidad, precio_unidad, numero_linea FROM jardineria.detalle_pedido;

-- 8. Carga Pagos
INSERT INTO stg_pago (id_cliente, forma_pago, id_transaccion, fecha_pago, total)
SELECT id_cliente, forma_pago, id_transaccion, fecha_pago, total FROM jardineria.pago;