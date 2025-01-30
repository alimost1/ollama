FROM ollama/ollama:latest

# Ensure dependencies are up to date
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*



# Expose Ollama's default port
EXPOSE 11434

# Start Ollama
CMD ["ollama", "serve"]
