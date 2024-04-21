FROM ubuntu:18.04

RUN apt update
RUN apt install redis-server dnsutils curl -y
RUN mkdir /currency

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
