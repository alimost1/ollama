FROM ollama/ollama:latest

# Option 1: Pull a public model (replace with correct name)
RUN ollama pull llama3

# Option 2: Build from a Modelfile (if DeepSeek isn’t public)
COPY Modelfile .
RUN ollama create deepseek-1.5 -f Modelfile

EXPOSE 11434
CMD ["ollama", "serve"]
