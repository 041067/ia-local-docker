Write-Host "Verificando Docker..."

docker info *> $null

if ($LASTEXITCODE -ne 0) {
    Write-Host "Docker Desktop nao esta em execucao."
    Write-Host "Abra o Docker Desktop e execute o script novamente."
    exit 1
}

Write-Host "Subindo containers..."

docker compose up -d

Write-Host "Aguardando Ollama iniciar..."

Start-Sleep -Seconds 15

Write-Host "Instalando modelos..."

$models = @(
    "qwen2.5-coder:1.5b",
    "llama3.2:3b",
    "qwen2.5:3b",
    "deepseek-r1:1.5b"
)

foreach ($model in $models) {
    Write-Host "Instalando modelo: $model"
    docker exec -i ollama ollama pull $model
}

Write-Host "Verificando modelos instalados..."

docker exec -i ollama ollama list

Write-Host "Instalacao concluida!"
Write-Host "Acesse: http://localhost:3000"