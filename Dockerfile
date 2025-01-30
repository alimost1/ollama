FROM ollama/ollama:latest

# Pull the DeepSeek-R1 1.5B model from Ollama's library
RUN ollama pull deepseek-r1:1.5b

# Expose Ollama's default port
EXPOSE 11434

# Start Ollama
CMD ["ollama", "serve"]

