FROM debian:stretch

MAINTAINER João Pedro Menegali Salvan Bitencourt (joao.ms@aluno.ifsc.edu.br)

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt -y -q upgrade && \
    apt -y -q install curl dialog gnupg1 apt-utils wget && \
    apt update && \
    apt -y -q install prosody lua-expat procps && \
    apt clean && \
    apt clean cache && \
    mkdir /var/log/prosody && \
    chown -R prosody:prosody /var/log/prosody && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/* /root/.bash_history && \
    mkdir /var/run/prosody

ENTRYPOINT service prosody start && bash
