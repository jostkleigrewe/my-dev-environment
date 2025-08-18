#!/bin/sh
set -e

echo "📦 Starte Installation ausgewählter Ollama-Modelle..."

###############################################################################
# 🔹 LEICHTE MODELLE – Für schwächere CPUs, Notebooks & schnelles Booting
###############################################################################

# phi – klein & sehr sparsam, geeignet für einfache QA, Tests
# ⏳ ~1.8 GB – sehr gut auf CPU
#ollama pull phi

# tinyllama – Mini-LLM für Tests, Edge Devices, IoT
# ⏳ ~1.1 GB – ultraleicht, spaßig für Embedded / CLI-Interaktion
#ollama pull tinyllama

# orca-mini – gute Performance für kleinere Systeme, klarer Stil
# ⏳ ~2.5 GB – leicht & solide auf CPU
#ollama pull orca-mini:7b

###############################################################################
# 🔹 MITTELGROßE MODELLE – Ideal für AnythingLLM & APIs (4–6 GB RAM)
###############################################################################

# mistral:instruct – Allrounder, sehr beliebt, ideal für RAG & APIs
# ⏳ ~4.1 GB – gut auf CPU, sehr effizient
#ollama pull mistral:instruct-q4_0

# openhermes – dialogfreundlich, freundlich, angenehm formuliert
# ⏳ ~4.3 GB – solide auf CPU, perfekt für Chatbots
#ollama pull openhermes:2.5-q4_0

# neural-chat – von Intel optimiert, moderat freundlich, DSGVO-orientiert
# ⏳ ~4.0 GB – CPU-optimiert, inkl. Safety-Guidelines
#ollama pull neural-chat

###############################################################################
# 🔹 HOCHWERTIGE MODELLE – GPT-4-nah, aber auf CPU grenzwertig (6–8 GB RAM)
###############################################################################

# llama3 – Meta’s neues Flaggschiff, GPT-4-kompatibel, stark in Kontext & Grammatik
# ⏳ ~4.5 GB – läuft auf starken CPUs (~8+ GB RAM empfohlen), sehr gute Antworten
#ollama pull llama3:8b-instruct-q4_0

# nous-hermes – kreativ, reflektiert, synthetisch trainiert auf hochwertige Dialoge
# ⏳ ~4.3 GB – spannend für kreative Prompts und Rollenspiele
#ollama pull nous-hermes:2-mistral

# wizardlm – spezialisiert auf saubere Antworten & Erklärungen, instruiert
# ⏳ ~4.3 GB – top für technische Nachfragen, Tutorials, etc.
#ollama pull wizardlm:7b

###############################################################################
# 🔹 CODE-MODELLE – Für Entwickler & technische Umgebungen
###############################################################################

# codellama – speziell für Programmierer (Python, JS, etc.)
# ⏳ ~4.2 GB – gute Ergänzung zu AnythingLLM für Projektdoku oder Codeanalyse
#ollama pull codellama:7b-instruct-q4_0

echo "✅ Modellinstallation abgeschlossen."
