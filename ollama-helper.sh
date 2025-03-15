#!/bin/bash

# Verifica se o comando digitado foi encontrado
LAST_CMD="$1"

# Se o comando foi encontrado, não faz nada
if [[ -z "$LAST_CMD" ]]; then
    exit 0
fi

# Exibe o comando que foi digitado errado com cor personalizada
echo -e "\033[0;31m[Erro]\033[0m O comando \033[41m$LAST_CMD\033[0m não foi encontrado."

# Define a entrada que será passada para o modelo Ollama
PROMPT="O seguinte comando falhou no terminal:
---
$LAST_CMD
---
Mensagem de erro: zsh: command not found: $LAST_CMD
Explique o erro e sugira uma correção."

# Chama o Ollama via linha de comando e exibe a resposta
echo -e "\033[0;33m[Ollama AI]\033[0m Analisando erro..."
ollama run llama3.2 "$PROMPT"
