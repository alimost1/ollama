# Use ollama base image
FROM ollama/ollama AS ollama

# Use Chainguard Wolfi base image
FROM cgr.dev/chainguard/wolfi-base

# Define architecture argument
ARG TARGETARCH
RUN echo "Building for architecture: ${TARGETARCH}"

# Install necessary dependencies
RUN apk update && apk add --no-cache libstdc++

# Copy Ollama binary from the base image
COPY --from=ollama /usr/bin/ollama /usr/bin/ollama

# Ensure the target architecture directory exists before copying
RUN mkdir -p /usr/lib/ollama/runners/

# Debug: Check if the correct directory exists before copying
RUN ls -la /usr/lib/ollama/runners/

# Copy architecture-specific runner files
COPY ./${TARGETARCH}/ /usr/lib/ollama/runners/

# Expose port for the service
EXPOSE 11434

# Use entrypoint to start the service
ENTRYPOINT ["/usr/bin/ollama"]
CMD ["serve"]
