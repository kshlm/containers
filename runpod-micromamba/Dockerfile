FROM mambaorg/micromamba:latest

USER root
ENV DEBIAN_FRONTEND noninteractive\
    SHELL=/bin/bash

RUN mkdir -p /workspace/micromamba /workspace/cache
WORKDIR /workspace
RUN /bin/micromamba shell init --shell=bash /workspace/micromamba
RUN rm -rf /root/.cache && ln -s /workspace/cache /root/.cache

RUN apt-get update && apt-get install -y \
    openssh-server neovim less unzip wget curl zstd && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    wget "https://dl.min.io/client/mc/release/linux-amd64/mc" && \
    chmod +x mc && mv mc /usr/local/bin && \
    wget "https://caddyserver.com/api/download?os=linux&arch=amd64&idempotency=47411853371813" -O caddy && \
    chmod +x caddy && mv caddy /usr/local/bin && \
    wget "https://github.com/svenstaro/miniserve/releases/download/v0.22.0/miniserve-0.22.0-x86_64-unknown-linux-musl" -O miniserve && \
    chmod +x miniserve && mv miniserve /usr/local/bin && \
    wget "https://github.com/cloudflare/cloudflared/releases/download/2022.10.0/cloudflared-linux-amd64" -O cloudflared && \
    chmod +x cloudflared && mv cloudflared /usr/local/bin && \
    curl -L "https://github.com/zellij-org/zellij/releases/download/v0.31.4/zellij-x86_64-unknown-linux-musl.tar.gz" | tar -xzf - && \
    chmod +x zellij && mv zellij /usr/local/bin && \
    echo 'if [[ -n "$SSH_TTY" ]]; then [[ -v commands[zellij] ]] && [[ ! -v ZELLIJ ]] && zellij attach -c "z4h-ssh" && exit; fi' >> /root/.bashrc

ADD start.sh /start.sh
RUN chmod a+x /start.sh

CMD [ "/start.sh" ]

