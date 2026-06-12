# 🚀 IA Local com Docker, Ollama e Open WebUI

Uma solução simples e prática para executar modelos de Inteligência Artificial Generativa localmente utilizando **Docker**, **Ollama** e **Open WebUI**, sem depender de APIs externas ou serviços pagos.

Com este projeto, qualquer desenvolvedor pode criar seu próprio ambiente de IA privada para:

* Assistência de programação;
* Geração de código;
* Criação de conteúdo;
* Estudos e pesquisas;
* Chatbots locais;
* Integração com aplicações próprias;
* Testes de modelos de linguagem (LLMs).

---

## 📸 Interface

![Open WebUI](./docs/open-webui.png)

---

# 📋 Visão Geral

O projeto utiliza dois containers Docker:

| Serviço    | Função                                      |
| ---------- | ------------------------------------------- |
| Ollama     | Responsável por executar os modelos de IA   |
| Open WebUI | Interface web para interação com os modelos |

Arquitetura:

```text
┌─────────────────────┐
│     Open WebUI      │
│   http://:3000      │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│       Ollama        │
│   http://:11434     │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│   Modelos Locais    │
│  Qwen / Llama / etc │
└─────────────────────┘
```

---

# 🎯 Objetivo

Democratizar o acesso a modelos de Inteligência Artificial Generativa através de uma solução simples, gratuita e multiplataforma, permitindo que qualquer desenvolvedor tenha seu próprio "ChatGPT privado" rodando localmente em poucos minutos.

---

# 🛠 Tecnologias Utilizadas

* Docker Desktop;
* Docker Compose;
* Ollama;
* Open WebUI;
* PowerShell (Windows);
* Bash (macOS/Linux);
* WSL2 (Windows).

---

# 🌎 Compatibilidade

Este projeto foi desenvolvido para funcionar em múltiplas plataformas.

## ✅ Testado oficialmente

| Sistema Operacional           | Status                                                       |
| ----------------------------- | ------------------------------------------------------------ |
| Windows 10/11                 | ✅ Testado                                                    |
| macOS (Intel e Apple Silicon) | ✅ Testado                                                    |
| Linux                         | ⚠️ Compatível via Docker Compose (não validado oficialmente) |

A automação é realizada através de scripts específicos para cada ambiente:

* `setup.ps1` → Windows;
* `setup.sh` → macOS/Linux.

---

# 📂 Estrutura do Projeto

```text
IA-LOCAL-DOCKER
│
├── docker-compose.yml
├── README.md
├── .gitignore
│
├── docs
│   └── open-webui.png
│
└── scripts
    ├── setup.ps1
    └── setup.sh
```

---

# 🐳 Instalando o Docker

Antes de executar este projeto, é necessário instalar e configurar corretamente o Docker em seu sistema operacional.

---

# 🪟 Windows

## Requisitos

* Windows 10 (64 bits) ou superior;
* Virtualização habilitada na BIOS;
* WSL2 habilitado.

---

## 1. Instale o WSL2

Abra o PowerShell como Administrador e execute:

```powershell
wsl --install
```

Reinicie o computador quando solicitado.

---

## 2. Verifique a instalação do WSL

Após reiniciar, execute:

```powershell
wsl --status
```

Resultado esperado:

```text
Default Version: 2
```

Caso a versão padrão não seja 2:

```powershell
wsl --set-default-version 2
```

---

## 3. Instale o Docker Desktop

Faça o download:

https://www.docker.com/products/docker-desktop/

Execute o instalador normalmente.

Durante a instalação, mantenha habilitadas as opções:

* ✅ Use WSL 2 instead of Hyper-V;
* ✅ Add shortcut to desktop.

---

## 4. Reinicie o computador

Após a instalação do Docker Desktop, reinicie o Windows.

---

## 5. Abra o Docker Desktop

Na primeira execução, aguarde até aparecer:

```text
Docker Desktop is running
```

---

## 6. Verifique se o Docker está funcionando

Abra o PowerShell e execute:

```powershell
docker --version
```

Exemplo:

```text
Docker version 28.x.x
```

Verifique também:

```powershell
docker compose version
```

Exemplo:

```text
Docker Compose version v2.x.x
```

Por fim:

```powershell
docker info
```

Se retornar informações do Docker, está tudo pronto.

---

## 7. (Opcional) Ajustar recursos do WSL

Para melhorar o desempenho dos modelos de IA, crie o arquivo:

```text
C:\Users\SEU_USUARIO\.wslconfig
```

Exemplo:

```ini
[wsl2]
memory=10GB
processors=8
swap=4GB
```

Depois execute:

```powershell
wsl --shutdown
```

Feche e abra novamente o Docker Desktop.

---

# 🍎 macOS

## Requisitos

* macOS 12 ou superior;
* Processador Intel ou Apple Silicon (M1, M2, M3, M4).

---

## 1. Instale o Docker Desktop

Faça o download:

https://www.docker.com/products/docker-desktop/

Escolha a versão correta para sua arquitetura.

---

## 2. Instale o Docker

Abra o arquivo `.dmg`.

Arraste o Docker para a pasta:

```text
Applications
```

Abra o Docker Desktop.

---

## 3. Conceda permissões

O macOS poderá solicitar permissões administrativas.

Aceite todas as solicitações.

---

## 4. Aguarde o Docker iniciar

Quando o ícone do Docker aparecer ativo na barra superior do macOS, a instalação estará concluída.

---

## 5. Verifique a instalação

Abra o Terminal do macOS ou o terminal integrado do VS Code.

Execute:

```bash
docker --version
```

Exemplo:

```text
Docker version 28.x.x
```

Verifique o Compose:

```bash
docker compose version
```

Exemplo:

```text
Docker Compose version v2.x.x
```

Por fim:

```bash
docker info
```

Se retornar informações do Docker, está tudo funcionando corretamente.

---

# 🧪 Teste Final do Docker

Após concluir a instalação, execute:

```bash
docker run hello-world
```

Resultado esperado:

```text
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

Se esta mensagem aparecer, o Docker está pronto para executar este projeto.

---

# 📥 Instalação do Projeto

## 1. Clonar o Repositório

```bash
git clone URL_DO_REPOSITORIO
cd IA-Local-Docker
```

---

## 2. Verificar se o Docker está em execução

Execute:

```bash
docker info
```

Se o comando retornar informações do Docker, está tudo correto.

---

## 3. Executar a Automação

### Windows

Execute:

```powershell
.\scripts\setup.ps1
```

Caso o PowerShell bloqueie a execução:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\setup.ps1
```

---

### macOS/Linux

Conceda permissão de execução:

```bash
chmod +x scripts/setup.sh
```

Execute:

```bash
./scripts/setup.sh
```

---

# ⚙️ O que os Scripts Fazem?

Os arquivos:

```text
scripts/setup.ps1 (Windows)
scripts/setup.sh (macOS/Linux)
```

executam automaticamente:

### ✅ Verificação do Docker

Confirma se o Docker está em execução.

### ✅ Inicialização dos Containers

Executa:

```bash
docker compose up -d
```

### ✅ Inicialização do Ollama

Aguarda o serviço ficar disponível.

### ✅ Download dos Modelos

Instala automaticamente:

```text
qwen2.5-coder:1.5b
llama3.2:3b
qwen2.5:3b
deepseek-r1:1.5b
```

### ✅ Verificação

Lista os modelos instalados.

### ✅ Finalização

Exibe a URL de acesso.

---

# 🌐 Acessando a Aplicação

Após a conclusão da instalação:

```text
http://localhost:3000
```

Ao acessar pela primeira vez:

1. Crie um usuário administrador;
2. Faça login;
3. Selecione um modelo;
4. Comece a conversar com a IA.

---

# 🤖 Modelos Instalados

## Qwen 2.5 Coder 1.5B

Indicado para:

* HTML;
* CSS;
* JavaScript;
* Python;
* SQL;
* Docker;
* Terraform.

---

## Llama 3.2 3B

Indicado para:

* Conversação;
* Estudos;
* Resumos;
* Explicações técnicas.

---

## Qwen 2.5 3B

Indicado para:

* Uso geral;
* Produção de conteúdo;
* Pesquisa.

---

## DeepSeek R1 1.5B

Indicado para:

* Raciocínio lógico;
* Resolução de problemas;
* Explicações detalhadas.

---

# 🔍 Verificando Containers

Listar containers:

```bash
docker compose ps
```

Resultado esperado:

```text
ia-local-docker-ollama-1
ia-local-docker-open-webui-1
```

---

# 🔍 Verificando Modelos

```bash
docker compose exec ollama ollama list
```

Exemplo:

```text
NAME
qwen2.5-coder:1.5b
llama3.2:3b
qwen2.5:3b
deepseek-r1:1.5b
```

---

# ➕ Instalando Novos Modelos

Exemplo:

```bash
docker compose exec ollama ollama pull qwen2.5-coder:7b
```

Outros exemplos:

```bash
docker compose exec ollama ollama pull gemma3:4b
docker compose exec ollama ollama pull mistral:7b
docker compose exec ollama ollama pull phi4
```

---

# 🛑 Parando os Containers

```bash
docker compose down
```

---

# ▶️ Iniciando Novamente

```bash
docker compose up -d
```

---

# 🗑 Removendo o Ambiente

Remover containers:

```bash
docker compose down
```

Remover containers e volumes:

```bash
docker compose down -v
```

⚠️ **Atenção:** este comando remove permanentemente:

* Histórico do Open WebUI;
* Configurações;
* Modelos armazenados nos volumes do Docker.

---

# 🚀 Possíveis Evoluções

Este projeto pode ser expandido para:

* ChatGPT privado;
* Assistente programador;
* Chat com PDFs (RAG);
* Base de conhecimento corporativa;
* Integração com APIs Flask;
* Integração com FastAPI;
* Deploy em servidores Linux;
* Ambientes educacionais;
* Laboratórios de IA.

---

# 👨‍💻 Autor

**Renan Café**

Desenvolvedor de Software | Cloud Computing | Inteligência Artificial Generativa

---

# 📄 Licença

Este projeto é distribuído sob a licença MIT.
