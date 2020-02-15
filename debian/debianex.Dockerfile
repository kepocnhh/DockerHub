FROM debian:stable-20191224-slim

RUN apt-get update -qq
ARG APT_GET_INSTALL="apt-get install -qq --no-install-recommends"

RUN $APT_GET_INSTALL curl
RUN curl --version

RUN $APT_GET_INSTALL unzip

RUN $APT_GET_INSTALL openssl ca-certificates
RUN openssl version -a
RUN update-ca-certificates -f

RUN $APT_GET_INSTALL git
RUN git --version

ENV SDK_HOME=/opt
