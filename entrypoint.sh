# Use the official Ollama base image
FROM ollama/ollama:latest

# Pull the DeepSeek-R1 1.5B model from Ollama’s library
RUN ollama pull deepseek-r1:1.5b

# Expose the default Ollama port
EXPOSE 11434

# Start Ollama when the container runs
CMD ["ollama", "serve"]
