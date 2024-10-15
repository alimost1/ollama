FROM alpine

RUN case `uname -m` in \
        x86_64) ARCH=amd64; ;; \
        armv7l) ARCH=arm; ;; \
        aarch64) ARCH=arm64; ;; \
        ppc64le) ARCH=ppc64le; ;; \
        s390x) ARCH=s390x; ;; \
        *) echo "un-supported arch, exit ..."; exit 1; ;; \
    esac && \
    wget -O - https://ollama.com/download/ollama-linux-${ARCH}.tgz |tar -xz -C /usr/local/bin --strip-components=2 ./bin/ollama

ENV OLLAMA_HOST=0.0.0.0
EXPOSE 11434

ENTRYPOINT ["/usr/local/bin/ollama"]
CMD ["serve"]
