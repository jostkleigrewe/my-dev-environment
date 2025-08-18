# Docker-Features for the Symfony Webapp (6.3)



http://anythingllm.docker.localhost/

http://ollama.docker.localhost/

http://ollama.docker.localhost/api/tags


http://qdrant.docker.localhost/dashboard
http://qdrant.docker.localhost/dashboard#/welcome
http://ollama-webui.docker.localhost

https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installation


docker compose exec ollama /usr/local/bin/install-models.sh

docker compose exec ollama ollama list




# 🧠 Ollama + AnythingLLM + Qdrant Stack

Ein vollständiges lokales Setup, um AnythingLLM mit Ollama und Qdrant zu betreiben – DSGVO-freundlich, containerisiert mit Docker & Traefik.

---

## 📁 Struktur

```text
.
├── docker-compose.yml
├── .env
└── README.md
```

---

## 🚀 Schnellstart

1. **Klonen oder Ordner anlegen**

```bash
git clone <repo-url> my-ollama-environment
cd my-ollama-environment
```

2. **.env-Datei anpassen (oder übernehmen)**

```dotenv
DOCKER_PROJECT_NAME="my-ollama-environment"
DOCKER_PROJECT_VERSION="1.0"
DOCKER_PROJECT_FOLDER=./

DOCKER_QDRANT_PORT=6333
DOCKER_OLLAMA_PORT=11434
DOCKER_ANYTHINGLLM_PORT=3001

DOCKER_OLLAMA_VERSION=latest
DOCKER_QDRANT_VERSION=latest
DOCKER_ANYTHINGLLM_VERSION=latest

DOCKER_OLLAMA_VOLUME="${DOCKER_PROJECT_NAME}-${DOCKER_PROJECT_VERSION}-ollama-${DOCKER_OLLAMA_VERSION}"
DOCKER_QDRANT_VOLUME="${DOCKER_PROJECT_NAME}-${DOCKER_PROJECT_VERSION}-qdrant-${DOCKER_QDRANT_VERSION}"
DOCKER_ANYTHINGLLM_VOLUME="${DOCKER_PROJECT_NAME}-${DOCKER_PROJECT_VERSION}-anythingllm-${DOCKER_ANYTHINGLLM_VERSION}"
```

3. **Docker Compose starten**
```bash
docker compose up -d
```

4. **AnythingLLM im Browser öffnen**
```text
http://anythingllm.docker.localhost:3001
```

---

## 🧠 AnythingLLM konfigurieren

- **LLM Provider**: Ollama
- **Host**: `http://ollama:11434`
- **Model**: z. B. `mistral:instruct-q4_0`
- **Vector DB**: Qdrant → `http://qdrant:6333`

### ➕ Modell laden
```bash
ollama pull mistral:instruct-q4_0
```

---

## 🔧 Traefik Routing (optional)

Falls du Traefik nutzt:
- `anythingllm.docker.localhost` → AnythingLLM
- `ollama.docker.localhost` → Ollama REST API
- `qdrant.docker.localhost` → Qdrant UI/REST

ollama-webui.docker.localhost

Du kannst mit z. B. `curl` testen:
```bash
curl http://ollama.docker.localhost:11434/api/tags
```

---

## 🧼 Container stoppen
```bash
docker compose down
```

---

## 🗂 Volumes

```bash
docker volume ls | grep my-ollama-environment
```

- `...-ollama-...` → Modelle & Caches
- `...-qdrant-...` → Vektor-Datenbank
- `...-anythingllm-...` → Uploads, Settings

---

## ❓ Fragen oder Erweiterungen?

- automatische Modellstarts?
- Symfony-Anbindung via API?
- Benutzerverwaltung in AnythingLLM?

👉 Frag einfach Sven 😎
