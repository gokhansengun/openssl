FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get install -y build-essential checkinstall zlib1g-dev wget

WORKDIR /usr/local/src

RUN wget https://www.openssl.org/source/openssl-1.1.1f.tar.gz
RUN tar -xf openssl-1.1.1f.tar.gz

RUN cd openssl-1.1.1f && ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib

RUN cd openssl-1.1.1f && make && make test && make install
