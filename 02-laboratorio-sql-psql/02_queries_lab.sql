-- 1. Informacoes basicas da instancia e da sessao atual
SELECT version();
SELECT current_database() AS banco_atual, current_user AS usuario_atual, now() AS data_hora_servidor;

-- 2. Metacomandos essenciais do psql (listagem de objetos)
\l
\dn
\du
\dt
\d+ clientes

-- 3. Consultas de leitura nos catalogos do PostgreSQL
SELECT datname AS banco
FROM pg_database
ORDER BY datname;

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY table_schema, table_name;

SELECT usename AS usuario
FROM pg_user
ORDER BY usename;

-- 4. Consulta de dados e contagem de registros
SELECT *
FROM clientes
LIMIT 10;

SELECT COUNT(*) AS total_clientes
FROM clientes;

-- 5. Consulta de tamanho dos bancos e das tabelas
SELECT
    datname AS banco,
    pg_size_pretty(pg_database_size(datname)) AS tamanho
FROM pg_database
ORDER BY pg_database_size(datname) DESC;

SELECT
    schemaname AS schema,
    relname AS tabela,
    pg_size_pretty(pg_total_relation_size(schemaname || '.' || relname)) AS tamanho_total
FROM pg_stat_user_tables
ORDER BY pg_total_relation_size(schemaname || '.' || relname) DESC
LIMIT 20;