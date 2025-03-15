#!/bin/bash

# Verifica se o comando digitado foi encontrado
LAST_CMD="$1"

# Se o comando foi encontrado, não faz nada
if [[ -z "$LAST_CMD" ]]; then
    exit 0
fi

# Exibe o comando que foi digitado errado com cor personalizada
echo -e "\033[0;31m[Erro]\033[0m O comando \033[41m$LAST_CMD\033[0m não foi encontrado."