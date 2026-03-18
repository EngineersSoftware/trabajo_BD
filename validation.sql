-- Buscar registros con el mismo contenido (duplicados lógicos)
SELECT stg_hash_fila, COUNT(*) as repeticiones, nombre_cliente
FROM `jardineria_staging`.`stg_cliente`
GROUP BY stg_hash_fila
HAVING repeticiones > 1;