FROM mambaorg/micromamba:latest

USER root
ENV DEBIAN_FRONTEND noninteractive\
    SHELL=/bin/bash

ADD prepare.sh /prepare.sh
RUN bash /prepare.sh
RUN rm /prepare.sh

RUN mkdir -p /workspace/micromamba /workspace/cache
WORKDIR /workspace
RUN /bin/micromamba shell init --shell=bash /workspace/micromamba
RUN rm -rf /root/.cache && ln -s /workspace/cache /root/.cache

ADD start.sh /start.sh
RUN chmod a+x /start.sh

CMD [ "/start.sh" ]

