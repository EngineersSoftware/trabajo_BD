# Backup de la Base de Datos Original
mysqldump -u root -p --opt jardineria > backup_jardineria_produccion.sql

# Backup de la Base de Datos Staging (Estructura y Carga actual)
mysqldump -u root -p --opt jardineria_staging > backup_jardineria_staging.sql