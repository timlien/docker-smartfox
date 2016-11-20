FROM debian

MAINTAINER Tim Lien <timlientw@gmail.com>

ENV SMARTFOX_VERSION 2_12_0

RUN apt-get update && \
    apt-get install -y wget \
    unzip \
    git

RUN mkdir -p /var

WORKDIR /var

RUN wget http://www.smartfoxserver.com/downloads/sfs2x/SFS2X_unix_${SMARTFOX_VERSION}.tar.gz && \
    tar xf SFS2X_unix_${SMARTFOX_VERSION}.tar.gz && \
    rm SFS2X_unix_${SMARTFOX_VERSION}.tar.gz

WORKDIR /var/SmartFoxServer_2X/SFS2X

CMD ./sfs2x.sh

EXPOSE 8080 9933