FROM ubuntu:22.04

ARG BITCOIN_CORE_VERSION=25.0

RUN apt update -y && apt upgrade -y

RUN apt install -y wget

# install bitcoin
RUN wget -q https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_CORE_VERSION}/bitcoin-${BITCOIN_CORE_VERSION}-x86_64-linux-gnu.tar.gz

RUN tar -zxvf bitcoin-${BITCOIN_CORE_VERSION}-x86_64-linux-gnu.tar.gz

RUN install -m 0755 -o root -g root -t /usr/local/bin bitcoin-${BITCOIN_CORE_VERSION}/bin/*

RUN rm -r bitcoin-${BITCOIN_CORE_VERSION}*

# copy conf
ADD ./conf/bitcoin.conf /root/.bitcoin/bitcoin.conf

CMD bitcoind