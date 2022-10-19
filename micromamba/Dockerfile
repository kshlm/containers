FROM mambaorg/micromamba:latest

USER root
ENV DEBIAN_FRONTEND noninteractive\
    SHELL=/bin/bash

RUN mkdir -p /root/micromamba
RUN /bin/micromamba shell init --shell=bash /root/micromamba

ADD prepare.sh /prepare.sh
RUN bash /prepare.sh
RUN rm /prepare.sh
ADD Caddyfile /etc/caddy/
