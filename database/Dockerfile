FROM ubuntu:18.04

RUN apt update && apt install -y \
    redis-server \
    dnsutils \
    curl \
    wget \
    procps \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /currency

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
