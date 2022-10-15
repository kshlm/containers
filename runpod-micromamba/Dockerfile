FROM mambaorg/micromamba:latest

USER root
ENV DEBIAN_FRONTEND noninteractive\
    SHELL=/bin/bash

RUN mkdir -p /workspace/micromamba /workspace/cache
WORKDIR /workspace
RUN /bin/micromamba shell init --shell=bash /workspace/micromamba
RUN rm -rf /root/.cache && ln -s /workspace/cache /root/.cache

RUN apt-get update && apt-get install -y \
    openssh-server neovim tmux less unzip &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen

ADD start.sh /start.sh
RUN chmod a+x /start.sh

CMD [ "/start.sh" ]

