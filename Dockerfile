FROM ubuntu:22.04

# Install Ollama
RUN apt update && apt install -y curl
RUN curl -L https://ollama.com/install.sh | sh

# Download the model (replace with correct URL/name)
RUN ollama pull deepseek-1.5

EXPOSE 11434
CMD ["ollama", "serve"]
