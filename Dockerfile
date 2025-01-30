FROM ollama/ollama:latest

# Ensure dependencies are up to date
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Pull the DeepSeek 1.5 model (if it's available publicly)
RUN ollama pull deepseek:latest || echo "DeepSeek model is not publicly available, building from Modelfile"

# Copy Modelfile only if building from source
COPY Modelfile /Modelfile
RUN if [ -f "/Modelfile" ]; then ollama create deepseek-1.5 -f /Modelfile; fi

# Expose Ollama's default port
EXPOSE 11434

# Start Ollama
CMD ["ollama", "serve"]
