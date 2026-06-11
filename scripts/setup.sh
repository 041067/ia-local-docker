#!/bin/bash

echo "Verificando Docker..."

if ! docker info > /dev/null 2>&1; then
  echo "Docker nao esta em execucao."
  echo "Abra o Docker Desktop e execute o script novamente."
  exit 1
fi

echo "Subindo containers..."

docker compose up -d

echo "Aguardando Ollama iniciar..."

sleep 15

echo "Instalando modelos..."

models=(
  "qwen2.5-coder:1.5b"
  "llama3.2:3b"
  "qwen2.5:3b"
  "deepseek-r1:1.5b"
)

for model in "${models[@]}"; do
  echo "Instalando modelo: $model"
  docker compose exec ollama ollama pull "$model"
done

echo "Verificando modelos instalados..."

docker compose exec ollama ollama list

echo "Instalacao concluida!"
echo "Acesse: http://localhost:3000"