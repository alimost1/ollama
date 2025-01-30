#!/bin/sh
set -e

# Start Ollama in the background
/bin/ollama serve &

# Wait for Ollama to start (adjust sleep time if needed)
sleep 5

# Pull the model (e.g., llama3)
curl -X POST http://localhost:11434/api/pull -d '{"name": "deepseek-r1:1.5b"}'

# Keep the container running
tail -f /dev/null
