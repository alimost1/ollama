FROM ollama/ollama:latest

# Ensure dependencies are up to date
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Pull the DeepSeek 1.5 model (if it's available publicly)
RUN ollama pull deepseek-r1:1.5b 

RUN ollama run deepseek-r1:1.5b

# Expose Ollama's default port
EXPOSE 11434

# Start Ollama
CMD ["ollama", "serve"]
