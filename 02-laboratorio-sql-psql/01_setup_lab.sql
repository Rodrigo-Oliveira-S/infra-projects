-- Prepara uma tabela de exemplo para o laboratorio de leitura
CREATE TABLE IF NOT EXISTS clientes (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE,
    criado_em TIMESTAMP DEFAULT NOW()
);

INSERT INTO clientes (nome, email) VALUES
    ('Ana Silva', 'ana.silva@empresa.local'),
    ('Bruno Costa', 'bruno.costa@empresa.local'),
    ('Carla Mendes', 'carla.mendes@empresa.local')
ON CONFLICT (email) DO NOTHING;

-- Atualiza as estatisticas para que pg_stat_user_tables reflita a tabela imediatamente
ANALYZE clientes;