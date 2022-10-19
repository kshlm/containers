ARG KSHLM_MICROMAMBA=ghcr.io/kshlm/containers/micromamba:main
FROM $KSHLM_MICROMAMBA

RUN mkdir -p /workspace/micromamba /workspace/cache
WORKDIR /workspace
RUN /bin/micromamba shell init --shell=bash /workspace/micromamba
RUN rm -rf /root/micromamba /root/.cache && ln -s /workspace/cache /root/.cache

ADD start.sh /start.sh
RUN chmod a+x /start.sh

CMD [ "/start.sh" ]

