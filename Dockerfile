FROM debian:buster-slim@sha256:d70fe252be511834ae8f685a90b0a658539c99c4a87f79c41831b09be0fee705

RUN apt update && apt install -y curl postgresql-client python3 python3-kubernetes \
        && curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
        && mv kubectl /usr/local/bin && chmod 755 /usr/local/bin/kubectl \
        && apt-get clean autoclean \
        && apt-get autoremove --yes \
        && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN addgroup g && adduser --system --home /app --ingroup g u && chown -R u:g /app
USER u
WORKDIR /app
