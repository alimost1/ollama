FROM ollama/ollama:latest

# Ensure dependencies are up to date
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Pull the DeepSeek 1.5 model (if it's available publicly)
RUN ollama pull deepseek-r1:1.5b || echo "DeepSeek model is not publicly available, building from Modelfile"

# Copy Modelfile only if building from source
COPY https://huggingface.co/DeepSeek/deepseek-1.5/resolve/main/deepseek-1.5.Q4_K_M.gguf
RUN if [ -f "/Modelfile" ]; then ollama create deepseek-1.5 -f /Modelfile; fi

# Expose Ollama's default port
EXPOSE 11434

# Start Ollama
CMD ["ollama", "serve"]
