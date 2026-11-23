#!/bin/bash

echo "=========================================="
echo "RELATORIO DE SAUDE DO SERVIDOR"
echo "Data/Hora: $(date)"
echo "=========================================="

echo -e "\n[1] IDENTIFICACAO DO SERVIDOR E KERNEL"
hostname
uname -a

echo -e "\n[2] TEMPO DE ATIVIDADE E CARGA"
uptime

echo -e "\n[3] INFORMACOES DE CPU"
lscpu | grep -E "Architecture|Model name|CPU\(s\):"

echo -e "\n[4] MEMORIA RAM E SWAP"
free -h

echo -e "\n[5] ESPACO EM DISCO"
df -h

echo -e "\n[6] INTERFACES DE REDE E IPS"
ip addr

echo -e "\n[7] TESTE DE RESOLUCAO DNS"
if command -v dig &> /dev/null; then
    dig +short google.com
else
    getent hosts google.com | awk '{print $1}'
fi