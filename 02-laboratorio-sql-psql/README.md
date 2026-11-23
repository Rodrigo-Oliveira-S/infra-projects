# Projeto 02 — Laboratório de SQL Básico e `psql`

[![02 - Laboratório de SQL Básico e psql](https://github.com/Rodrigo-Oliveira-S/infra-projects/actions/workflows/02-laboratorio-sql-psql.yml/badge.svg)](https://github.com/Rodrigo-Oliveira-S/infra-projects/actions/workflows/02-laboratorio-sql-psql.yml)

**Ambiente:** PostgreSQL 16 + Cliente `psql` + GitHub Actions

## Objetivo

Automatizar a validação de scripts SQL de inspeção e diagnóstico em PostgreSQL, cobrindo listagem de bancos, schemas, roles e estruturas de tabelas via metacomandos `psql`, além de consultas de leitura em catálogos do sistema e medição de armazenamento sem operações destrutivas[cite: 7].

## Estrutura do Projeto

```text
.
├── 02-laboratorio-sql-psql/
│   ├── 01_setup_lab.sql       # Criação da estrutura base e carga inicial de dados
│   ├── 02_queries_lab.sql     # Metacomandos psql e consultas de diagnóstico
│   └── README.md              # Documentação do projeto
└── .github/workflows/
    └── 02-laboratorio-sql-psql.yml  # Pipeline CI com service container PostgreSQL 16
```

## Operações Validadas

| Categoria | Comandos / Visões | Finalidade |
| :--- | :--- | :--- |
| Sessão e Versão | `version()`, `current_database()`, `current_user`, `now()` | Confirma versão da instância, banco ativo e usuário conectado. |
| Metacomandos `psql` | `\l`, `\dn`, `\du`, `\dt`, `\d+` | Lista bancos, schemas, usuários/roles, tabelas e detalhes de colunas. |
| Catálogos do Sistema | `pg_database`, `information_schema.tables`, `pg_user` | Consulta metadados de bases, tabelas e contas cadastradas. |
| Armazenamento | `pg_database_size()`, `pg_total_relation_size()`, `pg_size_pretty()` | Mede o espaço ocupado pelos bancos e tabelas em formato legível. |

## Como Executar

### 1. Localmente (Ubuntu Server / Container com PostgreSQL)

```bash
psql -h localhost -U postgres -d laboratorio_db -v ON_ERROR_STOP=1 -f 01_setup_lab.sql
psql -h localhost -U postgres -d laboratorio_db -v ON_ERROR_STOP=1 -f 02_queries_lab.sql
```

### 2. Via GitHub Actions

O workflow é acionado automaticamente em `push` ou `pull_request` que alterem arquivos dentro de `02-laboratorio-sql-psql/`, levantando um container `postgres:16` isolado e validando todos os comandos com `ON_ERROR_STOP=1`.