#!/bin/bash

# Verifica se o comando digitado foi encontrado
LAST_CMD="$1"

# Se o comando foi encontrado, não faz nada
if [[ -z "$LAST_CMD" ]]; then
    exit 0
fi

# Exibe o comando que foi digitado errado com cor personalizada
echo -e "\033[0;31m[Erro]\033[0m O comando \033[41m$LAST_CMD\033[0m não foi encontrado."

# Exibe o "pesquisando o comando..." com pontos piscando
echo -e -n "\033[0;36m[Ollama Search]\033[0m pesquisando o comando"
for i in {1..3}; do
    sleep 0.5
    echo -n "."
done

# Define o prompt com base no comando inválido
PROMPT="zsh: command not found: $LAST_CMD"

# Chama a API do Ollama via curl e pega a resposta
RESPONSE=$(curl -s -X POST http://localhost:11434/api/generate \
    -H "Content-Type: application/json" \
    -d '{
        "model": "llama3.2:latest",
        "prompt": "'"$PROMPT"'",
        "stream": false,
        "temperature": 0.3,
        "system": "Você é um assistente de terminal do macOS (neste caso o ZSH). Sua função é receber o comando que esta errado e retornar uma explicação, dica, ou solução em no maximo 300 caracteres.",
        "context": []
    }' | jq -r '.response')

# Limpa a linha de "pesquisando o comando..." antes de exibir a resposta
echo -e "\033[K"

# Exibe a resposta do Ollama
echo -e "\033[0;33m[Ollama AI]\033[0m $RESPONSE"
