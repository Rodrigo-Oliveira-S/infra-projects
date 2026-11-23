# 01 - Checklist Automatizado de Saúde do Servidor

## Objetivo

Automatizar a rotina inicial de verificação de saúde de um servidor Linux, coletando evidências de identificação, processamento, memória, armazenamento, interfaces de rede e resolução DNS sem realizar alterações no sistema.

## Estrutura do Projeto

```text
.
├── 01-checklist-saude-servidor/
│   ├── check_server.sh    # Script Bash de diagnóstico e coleta de evidências
│   └── README.md          # Documentação do projeto
└── .github/workflows/
    └── 01-checklist-saude-servidor.yml  # Pipeline manual (workflow_dispatch)
```

## Comandos Utilizados

| Bloco | Comandos | Finalidade |
| :--- | :--- | :--- |
| Identificação | `hostname`, `uname -a` | Identifica o nome do host e a versão do kernel Linux em execução. |
| Carga e Uptime | `uptime` | Verifica há quanto tempo o sistema está ativo e o *load average*. |
| Processador | `lscpu` | Exibe arquitetura, modelo da CPU e quantidade de núcleos disponíveis. |
| Memória | `free -h` | Consulta o consumo de memória RAM e área de Swap em formato legível. |
| Disco | `df -h` | Verifica o espaço total, utilizado e disponível nos pontos de montagem. |
| Rede | `ip addr` | Lista interfaces de rede, endereços MAC e endereços IPv4/IPv6. |
| DNS | `dig` / `getent hosts` | Valida a resolução de nomes de domínio com *fallback* para ambientes minimalistas. |

## Como Executar

### 1. Localmente

```bash
chmod +x check_server.sh
./check_server.sh
```

*(Caso o comando `dig` não esteja instalado em imagens minimalistas, instale o pacote `dnsutils` via `apt install -y dnsutils` ou utilize o fallback nativo com `getent hosts`).*

### 2. Via GitHub Actions

1. Acesse a aba **Actions** do repositório.
2. Selecione **01 - Checklist de Saúde do Servidor**.
3. Clique em **Run workflow** para disparar a coleta sob demanda.
4. Ao final da execução, baixe o arquivo `relatorio-saude-servidor.txt` na seção **Artifacts**.